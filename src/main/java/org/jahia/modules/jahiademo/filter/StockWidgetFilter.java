
/*
 * JAHIA'S ENTERPRISE DISTRIBUTIONS LICENSING - IMPORTANT INFORMATION
 * ==========================================================================================
 *
 *     Copyright (C) 2002-2015 Jahia Solutions Group. All rights reserved.
 *
 *     This file is part of a Jahia's Enterprise Distribution.
 *
 *     Jahia's Enterprise Distributions must be used in accordance with the terms
 *     contained in the Jahia Solutions Group Terms & Conditions as well as
 *     the Jahia Sustainable Enterprise License (JSEL).
 *
 *     For questions regarding licensing, support, production usage...
 *     please contact our team at sales@jahia.com or go to http://www.jahia.com/license.
 *
 *
 */

package org.jahia.modules.jahiademo.filter;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpURL;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.lang.StringUtils;
import org.jahia.services.content.JCRCallback;
import org.jahia.services.content.JCRNodeWrapper;
import org.jahia.services.content.JCRSessionWrapper;
import org.jahia.services.content.JCRTemplate;
import org.jahia.services.render.RenderContext;
import org.jahia.services.render.Resource;
import org.jahia.services.render.filter.AbstractFilter;
import org.jahia.services.render.filter.RenderChain;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.jcr.RepositoryException;
import java.util.LinkedHashMap;
import java.util.Map;

public class StockWidgetFilter extends AbstractFilter{

    private transient static Logger logger = LoggerFactory.getLogger(StockWidgetFilter.class);
    private static String API_URL = "finance.google.com";
    private static String API_path = "/finance/info";

    @Override
    public String execute(String previousOut, RenderContext renderContext, Resource resource, RenderChain chain) throws Exception {

        JSONObject o = queryGoogleFinanceAPI(API_path,"client","ig","q",getStockProperty(resource,"stock"));
        if (o != null){
            String value = o.getString("l");
            String variation = o.getString("c");
            String description = o.getString("e");

            previousOut = StringUtils.replace(previousOut, "%%StockValue%%", value);
            previousOut = StringUtils.replace(previousOut, "%%StockVariation%%", formatVariation(variation));
            previousOut = StringUtils.replace(previousOut,"%%StockDescription%%", description);
            saveStock(resource,value,variation,description);
        }else{
            previousOut = StringUtils.replace(previousOut, "%%StockValue%%", getStockProperty(resource,"value"));
            previousOut = StringUtils.replace(previousOut, "%%StockVariation%%", formatVariation(getStockProperty(resource,"variation")));
            previousOut = StringUtils.replace(previousOut,"%%StockDescription%%", getStockProperty(resource,"description"));
        }
        return previousOut;
    }

    private JSONObject queryGoogleFinanceAPI(String path, String... params) throws RepositoryException {
        try {
            HttpClient httpClient = new HttpClient();
            HttpURL url = new HttpURL(API_URL, -1, path);

            Map<String, String> m = new LinkedHashMap<String, String>();
            for (int i = 0; i < params.length; i += 2) {
                m.put(params[i], params[i + 1]);
            }

            url.setQuery(m.keySet().toArray(new String[m.size()]), m.values().toArray(new String[m.size()]));
            long l = System.currentTimeMillis();
            System.out.println("Start request : " + url);
            GetMethod httpMethod = new GetMethod(url.toString());
            try {
                httpClient.getParams().setSoTimeout(15000);
                httpClient.executeMethod(httpMethod);
                return new JSONObject(httpMethod.getResponseBodyAsString());
            } finally {
                httpMethod.releaseConnection();
                System.out.println("Request " + url + " done in "+(System.currentTimeMillis()-l) + "ms");
            }
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
            return null;
        }
    }

    private void saveStock (final Resource resource, final String value, final String variation, final String description) throws RepositoryException {
        JCRTemplate.getInstance().doExecuteWithSystemSessionAsUser(null, resource.getNode().getSession().getWorkspace().getName(), null,
                new JCRCallback<Object>() {
                    public Object doInJCR(JCRSessionWrapper session) throws RepositoryException {
                        JCRNodeWrapper stockwidgetNode = resource.getNode();
                        stockwidgetNode.setProperty("value",value);
                        stockwidgetNode.setProperty("variation",variation);
                        stockwidgetNode.setProperty("description",description);
                        session.save();
                        return null;
                    }
                });
    }

    private String getStockProperty (Resource resource, String property) throws RepositoryException {
        JCRNodeWrapper stockwidgetNode = resource.getNode();
        return stockwidgetNode.getProperty(property).getString();
    }

    private String formatVariation(String variation){
        if (variation.indexOf("0") == 0) {
            variation = "+" + variation;
        }
        if (variation.indexOf("+") >= 0) {
            variation = "<div class='arrow'></div>" + variation;
        }
        if (variation.indexOf("-") >= 0) {
            variation = "<div class='arrow-down'></div>" + variation;
        }
        return variation;
    }

}