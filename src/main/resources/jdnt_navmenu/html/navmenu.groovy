package jdnt_navmenu.html

import org.jahia.services.content.JCRContentUtils
import org.jahia.services.render.RenderService
import org.jahia.services.render.Resource
import org.jahia.taglibs.jcr.node.JCRTagUtils

/* update this to increase or decrease the menu level allowed */
def maxDepth = 4;
/* update this to increase or decrease the max menu items on top level before putting them under the last menu item caret */
def maxTopLevel = 5;
def printMenu;
printMenu = { node, navMenuLevel ->
    if (node != null) {
        children = JCRContentUtils.getChildrenOfType(node, "jmix:navMenuItem")
        def ulIsOpen = false;
        boolean firstEntry = true;
        def pageIndex = 0;

        children.eachWithIndex() { menuItem, index ->
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

                    if (correctType) {
                        children = JCRTagUtils.getChildrenOfType(menuItem, "jnt:page,jnt:nodeLink,jnt:externalLink,jnt:navMenuText");
                        def totalChilds = children.size();
                        hiddenChildren = JCRTagUtils.getChildrenOfType(menuItem, "jdmix:hidePage");
                        def numHiddenChilds = hiddenChildren.size();

                        // check that there are actually visible children
                        hasChildren = navMenuLevel < maxDepth && totalChilds > 0 && totalChilds > numHiddenChilds;

                        Resource resource = new Resource(menuItem, "html", "menuElement", currentResource.getContextConfiguration());
                        def render = RenderService.getInstance().render(resource, renderContext)
                        if (render != "") {
                            def inpath = renderContext.mainResource.node.path == itemPath || renderContext.mainResource.node.path.startsWith(itemPath + "/");
                            def active = menuItem.isNodeType("jmix:nodeReference") ?
                                    renderContext.mainResource.node.path == menuItem.properties['j:node'].node.path :
                                    renderContext.mainResource.node.path == itemPath;
                            // if this is not the top level of the menu
                            // or it's a top level item that has been pushed down a level
                            // and they have children
                            if ((navMenuLevel > 1 || (navMenuLevel >= 1 && pageIndex >= maxTopLevel)) && hasChildren) {
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
                                    /* add home page as item on menu */

                                    if (menuItem.parent != null) {
                                        homePage = menuItem.parent;
                                        if (homePage.hasProperty("alternateTitle")) {
                                            homeTitle = homePage.getPropertyAsString("alternateTitle");
                                        } else {
                                            homeTitle = homePage.displayableName;
                                        }

                                        println "<li><a href=\"" + homePage.url + "\" class=\"dropdown-toggle\">" + homeTitle + "</a></li>\n";


                                    }
                                    /* end add home page as menu item */
                                    ulIsOpen = true;
                                }
                                // if this is the maxTopLevel item on the top level menu item put it in a new top level menu item
                                if (pageIndex == maxTopLevel) {
                                    //start new menu
                                    println "<li class=\"dropdown\"><a href=\"javascript:void(0)\">▼</a>"
                                    println "<ul class=\"dropdown-menu pull-right dropdown-menu-alt-side\">"
                                }
                                if (hasChildren) {

                                    print "<li ${listItemCssClass}>";
                                    print "    <a href=\"${link}\" ${linkTitle} class=\"dropdown-toggle\">" + displayName + "</a>\n";
                                    if (hasChildren && navMenuLevel < maxDepth) {
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
                                if (hasChildren && navMenuLevel < maxDepth) {
                                    printMenu(menuItem, navMenuLevel + 1);
                                }

                                println "</li>";
                            }
                        }
                    }
                    pageIndex++;
                }
            }
        }
        if (ulIsOpen) {
            println("</ul>")

            ulIsOpen = false;
        }
    }


}

printMenu(renderContext.site.home, 1)