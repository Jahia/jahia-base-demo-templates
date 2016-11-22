package jdnt_navmenu.html

import org.jahia.services.content.JCRContentUtils
import org.jahia.services.render.RenderService
import org.jahia.services.render.Resource
import org.jahia.taglibs.jcr.node.JCRTagUtils
import org.slf4j.LoggerFactory

import javax.jcr.ItemNotFoundException

/* if menuLimits mixin is enabled, get site level properties otherwise use template settings*/
def hideHomeValue = false;
if (renderContext.site.isNodeType("jdmix:menuLimits")){
    def maxDepth = renderContext.site.properties['menuDepth']
    maxDepthValue = maxDepth ? maxDepth.long : 4

    def maxTopLevel = renderContext.site.properties['numTopLevel']
    maxTopLevelValue = maxTopLevel ? maxTopLevel.long-1 : 4

    def hideHome = renderContext.site.properties.hideHome.string
    if (hideHome == "Yes") {
        hideHomeValue = true
    }

    /* increase maxTopLevel since home is no longer shown */
    if (hideHomeValue) {
        maxTopLevelValue++
    }
}
else {
/* update this to increase or decrease the menu level allowed */
def maxDepth = currentNode.properties['maxDepth']
maxDepthValue = maxDepth ? maxDepth.long : 4

/* update this to increase or decrease the max menu items on top level before putting them under the last menu item caret */
def maxTopLevel = currentNode.properties['maxTopLevel']
maxTopLevelValue = maxTopLevel ? maxTopLevel.long-1 : 4
}


def printMenu;
printMenu = { node, navMenuLevel ->
    if (node != null) {
        children = JCRContentUtils.getChildrenOfType(node, "jmix:navMenuItem")
        def ulIsOpen = false;
        boolean firstEntry = true;
        def pageIndex = 0;

        children.eachWithIndex() { menuItem, index ->
            try {
                if (menuItem != null) {
                    if (!menuItem.isNodeType("jdmix:hidePage")) {
                        def itemPath = menuItem.path;
                        def correctType = true;
                        if (menuItem.isNodeType("jmix:navMenu")) {
                            correctType = false;
                        }
                        if (menuItem.properties['j:displayInMenuName']) {
                            correctType = false;
                            menuItem.properties['j:displayInMenuName'].each() {
                                correctType |= (it.string.equals(currentNode.name))
                            }
                        }
                        if (menuItem.isNodeType("jmix:nodeReference")){
                            try {
                                currentResource.dependencies.add(menuItem.properties['j:node'].string);
                                if (menuItem.properties['j:node'].node != null) {
                                    correctType = true;
                                } else {
                                    correctType = false;
                                }
                            } catch (ItemNotFoundException e) {
                                correctType = false;
                            }
                        }

                        if (correctType) {
                            children = JCRTagUtils.getChildrenOfType(menuItem, "jnt:page,jnt:nodeLink,jnt:externalLink,jnt:navMenuText");
                            def totalChilds = children.size();
                            hiddenChildren = JCRTagUtils.getChildrenOfType(menuItem, "jdmix:hidePage");
                            def numHiddenChilds = hiddenChildren.size();

                            // check that there are actually visible children
                            hasChildren = navMenuLevel < maxDepthValue && totalChilds > 0 && totalChilds > numHiddenChilds;

                            Resource resource = new Resource(menuItem, "html", "menuElement", currentResource.getContextConfiguration());
                            currentResource.getDependencies().add(menuItem.getCanonicalPath())

                            def render = RenderService.getInstance().render(resource, renderContext)
                            def mainNode = renderContext.mainResource.node;
                            if (render != "" && mainNode != null && mainNode.path != null) {
                                def inpath = mainNode.path == itemPath || mainNode.path.startsWith(itemPath + "/");
                                def active = menuItem.isNodeType("jmix:nodeReference") ?
                                        mainNode.path == menuItem.properties['j:node'].node.path :
                                        mainNode.path == itemPath;
                                // if this is not the top level of the menu
                                // or it's a top level item that has been pushed down a level
                                // and they have children
                                if ((navMenuLevel > 1 || (navMenuLevel >= 1 && pageIndex >= maxTopLevelValue)) && hasChildren) {
                                    //if there are children use dropdown-submenu to display arrow
                                    listItemCssClass = "class=\"dropdown-submenu " + (inpath || active ? "active" : "") + "\"";
                                } else if (navMenuLevel <= 1 && hasChildren) {
                                    listItemCssClass = "class=\"dropdown " + (inpath || active ? "active" : "") + "\"";
                                } else {
                                    listItemCssClass = (inpath || active ? "class=\"active\"" : "");
                                }
                                description = menuItem.properties['jcr:description'];
                                linkTitle = description ? " title=\"${description.string}\"" : "";
                                if (menuItem.isNodeType('jnt:nodeLink')) {
                                    link = menuItem.properties['j:node'].node.url;
                                } else if (menuItem.isNodeType('jnt:externalLink')) {
                                    link = menuItem.properties['j:url'].string;
                                } else if (menuItem.isNodeType('jnt:navMenuText')) {
                                    link = "javascript:void(0)";
                                } else {
                                    link = menuItem.url;
                                }

                                //get the display name
                                if (menuItem.hasProperty('alternateTitle')) {
                                    displayName = menuItem.getPropertyAsString('alternateTitle');
                                } else {
                                    displayName = menuItem.displayableName;
                                }
                                if (navMenuLevel == 1) {
                                    if (!ulIsOpen) {
                                        println "<ul class=\"nav navbar-nav\">\n"
                                        /* add home page as item on menu  if hideHome is false */
                                        if (!hideHomeValue) {
                                        if (menuItem.parent != null) {
                                            homePage = menuItem.parent;
                                            if (homePage.hasProperty("alternateTitle")) {
                                                homeTitle = homePage.getPropertyAsString("alternateTitle");
                                            } else {
                                                homeTitle = homePage.displayableName;
                                            }

                                            println "<li><a href=\"" + homePage.url + "\" class=\"dropdown-toggle\">" + homeTitle + "</a></li>\n";


                                        }
                                        }
                                        /* end add home page as menu item */
                                        ulIsOpen = true;
                                    }
                                    // if this is the maxTopLevel item on the top level menu item put it in a new top level menu item
                                    if (pageIndex == maxTopLevelValue) {
                                        //start new menu
                                        println "<li class=\"dropdown\"><a class=\"dropdown-toggle\" href=\"javascript:void(0)\">&nbsp;<i class=\"fa fa-caret-down fa-lg\"></i></a>"
                                        println "<ul class=\"dropdown-menu pull-right dropdown-menu-alt-side\">"
                                    }
                                    if (hasChildren) {

                                        print "<li ${listItemCssClass}>";
                                        print "    <a href=\"${link}\" ${linkTitle} class=\"dropdown-toggle\">" + displayName + "</a>\n";
                                        if (hasChildren && navMenuLevel < maxDepthValue) {
                                            printMenu(menuItem, navMenuLevel + 1);
                                        }
                                        println "</li>\n";
                                    } else {

                                        println "<li ${listItemCssClass}><a href=\"${link}\" ${linkTitle} class=\"dropdown-toggle\">" + displayName + "</a></li>\n";
                                    }
                                } else {
                                    if (!ulIsOpen) {
                                        println "<ul class=\"dropdown-menu\">"
                                        ulIsOpen = true;
                                        /*  This displays the parent top level page as a link under itself. If used formatting of <li> will need to be revisted and updated */
    /*                                    if (firstEntry && navMenuLevel == 2) {
                                            parentPage = menuItem.parent;
                                            title = parentPage.displayableName;
                                            if (parentPage.hasProperty("alternateTitle")) {
                                                title = parentPage.getProperty("alternateTitle").string
                                            }
                                            if (hasChildren) {
                                                print "<li class=\"dropdown-submenu\"><a href='${parentPage.url}'>${title}</a></li>";
                                            }
                                            else {
                                                print "<li class=\"active\"><a href='${parentPage.url}'>${title}</a></li>";
                                            }
                                            firstEntry = false;
                                        } */
                                    }
                                    println "<li ${listItemCssClass}>";
                                    print "<a href=\"${link}\" ${linkTitle}>" + displayName + "   </a>";
                                    if (hasChildren && navMenuLevel < maxDepthValue) {
                                        printMenu(menuItem, navMenuLevel + 1);
                                    }

                                    println "</li>";
                                }
                            }
                        }
                        pageIndex++;
                    }
                }
            } catch (Exception e) {
                logger = LoggerFactory.getLogger(this.class)
                logger.warn("Error processing nav-menu link with id " + menuItem.identifier, e);
            }
        }
        if (ulIsOpen) {
            println("</ul>")

            ulIsOpen = false;
        }
    }


}
// Add dependencies to parent of main resource so that we are aware of new pages at sibling level
try {
    currentResource.dependencies.add(renderContext.mainResource.node.getParent().getCanonicalPath());
} catch (ItemNotFoundException e) {
}
printMenu(renderContext.site.home, 1)