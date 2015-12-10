package jdnt_navmenu.html

import org.jahia.services.content.JCRContentUtils
import org.jahia.services.render.RenderService
import org.jahia.services.render.Resource
import org.jahia.taglibs.jcr.node.JCRTagUtils

/* udpate this to increase or decrease the menu level allowed */
def maxDepth = 4;
def printMenu;
printMenu = { node, navMenuLevel ->
    if (node != null) {
        children = JCRContentUtils.getChildrenOfType(node, "jmix:navMenuItem")
        def ulIsOpen = false;
        boolean firstEntry = true;


        children.eachWithIndex() { menuItem, index ->
            if (menuItem != null) {
                if (! menuItem.isNodeType("jdmix:hidePage")) {
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
                        hasChildren = navMenuLevel < maxDepth && JCRTagUtils.hasChildrenOfType(menuItem, "jnt:page,jnt:nodeLink,jnt:externalLink")
                        Resource resource = new Resource(menuItem, "html", "menuElement", currentResource.getContextConfiguration());
                        def render = RenderService.getInstance().render(resource, renderContext)
                        if (render != "") {
                            def inpath = renderContext.mainResource.node.path == itemPath || renderContext.mainResource.node.path.startsWith(itemPath + "/");
                            def active = menuItem.isNodeType("jmix:nodeReference") ?
                                    renderContext.mainResource.node.path == menuItem.properties['j:node'].node.path :
                                    renderContext.mainResource.node.path == itemPath;
                            if (navMenuLevel > 1 && hasChildren){
                                listItemCssClass = "class=\"dropdown-submenu " + (inpath || active ? "active" : "") + "\"";
                            }
                            else if (navMenuLevel <= 1 && hasChildren){
                                listItemCssClass = "class=\"dropdown " + (inpath || active ? "active" : "") + "\"";
                            }
                            else { listItemCssClass = (inpath || active ? "class\"=active\"" : "");}
                            description = menuItem.properties['jcr:description'];
                            linkTitle = description ? " title=\"${description.string}\"" : "";
                            if (menuItem.isNodeType('jnt:nodeLink')) {
                                link = menuItem.properties['j:node'].node.url;
                            } else if (menuItem.isNodeType('jnt:externalLink')) {
                                link = menuItem.properties['j:url'].string;
                            } else {
                                link = menuItem.url;
                            }
                            if (navMenuLevel == 1) {
                                if (!ulIsOpen) {
                                    println "<ul class=\"nav navbar-nav\">\n"
                                    /* add home page as item on menu */
                                   // println "<li><a href=\"#\">Home</a></li>\n"

                                    if (menuItem.parent != null) {
                                        homePage = menuItem.parent;
                                        homeTitle = homePage.displayableName;
                                        println "<li><a href=\"" + homePage.url + "\" class=\"dropdown-toggle\">" + homeTitle + "</a></li>\n";

                                /*        if (homePage.hasProperty("alternateTitle")) {
                                            homeTitle = menuItem.getProperty("alternateTitle").string
                                        }*/

                                    }
                                    /* end add home page as menu item */
                                    ulIsOpen = true;
                                }
                                if (hasChildren) {
                                    print "<li ${listItemCssClass}>";
                                    print "    <a href=\"${link}\" ${linkTitle} class=\"dropdown-toggle\">";
                                    print menuItem.displayableName;
                                    print "</a>\n";
                                    if (hasChildren && navMenuLevel < maxDepth) {
                                        printMenu(menuItem, navMenuLevel + 1);
                                    }
                                    println "</li>\n";
                                } else {
                                    println "<li ${listItemCssClass}><a href=\"${link}\" ${linkTitle} class=\"dropdown-toggle\">" + menuItem.displayableName + "</a></li>\n";
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
                                print "<a href=\"${link}\" ${linkTitle} >" + menuItem.displayableName + "   </a>";
                                if (hasChildren && navMenuLevel < maxDepth) {
                                    printMenu(menuItem, navMenuLevel + 1);
                                }

                                println "</li>";
                            }
                        }
                    }
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