package jdnt_navmenu.html

import org.jahia.services.content.JCRContentUtils
import org.jahia.services.render.RenderService
import org.jahia.services.render.Resource
import org.jahia.taglibs.jcr.node.JCRTagUtils

import static org.apache.commons.lang.StringEscapeUtils.escapeXml;

def maxDepthValue = 3;
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
                        hasChildren = navMenuLevel < maxDepthValue && totalChilds > 0 && totalChilds > numHiddenChilds;

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
                            if ((navMenuLevel > 1 ) && hasChildren) {
                                //if there are children use dropdown-submenu to display arrow
                                listItemCssClass = "class=\"dropdown-submenu\"";
                            } else if (navMenuLevel <= 1 && hasChildren) {
                                listItemCssClass = "class=\"dropdown\"";
                            } else {
                                listItemCssClass = "";
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
                            displayName = escapeXml(displayName);
                            if (navMenuLevel == 1) {
                                println "<div class=\"col-md-3 col-sm-6 col-xs-12\">";
                                println "<ul class=\"sitemap-list\">";
                                println "<li><a href=\"${link}\">" + displayName + "</a></li>";
                                if (hasChildren) {

                                    println "<ul class=\"sitemap-list\">";
                                    if (hasChildren && navMenuLevel < maxDepthValue) {
                                        printMenu(menuItem, navMenuLevel + 1);
                                    }
                                    println "</ul>";
                                }
                                println "</ul></div>";
                            } else {
                                println "<li><a href=\"${link}\">" + displayName + "</a></li>";
                                if (hasChildren && navMenuLevel < maxDepthValue) {
                                    printMenu(menuItem, navMenuLevel + 1);
                                }
                            }
                        }
                    }
                    pageIndex++;
                }
            }
        }
    }


}


println "<div class=\"container block-wrapper\">";
println "<div class=\"row\">";
println "<div class=\"col-md-12\">";
println "</div>";
printMenu(renderContext.site.home, 1)
println "</div></div>"
