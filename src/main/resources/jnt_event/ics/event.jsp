<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="ui" uri="http://www.jahia.org/tags/uiComponentsLib" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%@ taglib prefix="query" uri="http://www.jahia.org/tags/queryLib" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="s" uri="http://www.jahia.org/tags/search" %>
<%@page import="net.fortuna.ical4j.model.property.Method"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.*"%>
<%@page import="net.fortuna.ical4j.model.*"%>
<%@page import="net.fortuna.ical4j.model.property.*"%>
<%@page import="net.fortuna.ical4j.model.component.*"%>
<%@page import="net.fortuna.ical4j.data.*"%>
<%@page import="net.fortuna.ical4j.util.*"%>
<%@ page import="java.util.*" %>
<%@ page import="net.fortuna.ical4j.model.Date" %>
<%@ page import="net.fortuna.ical4j.model.Calendar" %>
<%@ page import="java.util.TimeZone" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>



<c:set var="language" value="${currentResource.locale.language}"/>
<fmt:setLocale value="${language}" scope="session"/>

<c:set var="title" value="${currentNode.properties['jcr:title'].string}"/>
<c:set var="startDate" value="${currentNode.properties['startDate'].time}"/>
<c:set var="endDate" value="${currentNode.properties['endDate'].time}"/>
<c:set var="location" value="${currentNode.properties['location'].string}"/>
<c:set var="body" value="${currentNode.properties['body'].string}"/>
<c:set var="componentId" value="${currentNode.identifier}"/>
<fmt:formatDate var="startDay" value="${startDate}" pattern="d" type="date"/>
<fmt:formatDate var="startMonth" value="${startDate}" pattern="M" dateStyle="short" type="date"/>
<fmt:formatDate var="startYear" value="${startDate}" pattern="yyyy" type="date"/>
<fmt:formatDate var="startHour" value="${startDate}" pattern="H" type="time"/>
<fmt:formatDate var="startMin" value="${startDate}" pattern="m" type="time"/>


<fmt:formatDate var="endDay" value="${endDate}" pattern="d" type="date"/>
<fmt:formatDate var="endMonth" value="${endDate}" pattern="M" dateStyle="short" type="date"/>
<fmt:formatDate var="endYear" value="${endDate}" pattern="yyyy" type="date"/>
<fmt:formatDate var="endHour" value="${endDate}" pattern="H" type="time"/>
<fmt:formatDate var="endMin" value="${endDate}" pattern="m" type="time"/>

<%
    try {

        String title = (String) pageContext.findAttribute("title");

        // get the start date and time
        int startD = Integer.valueOf((String) pageContext.findAttribute("startDay"));
        int startM = Integer.valueOf((String) pageContext.findAttribute("startMonth"));
        int startY = Integer.valueOf((String) pageContext.findAttribute("startYear"));
        int startH = Integer.valueOf((String) pageContext.findAttribute("startHour"));
        int startMin = Integer.valueOf((String) pageContext.findAttribute("startMin"));

        response.setHeader ("Content-Disposition", "attachment;filename=\"" + title + ".ics\"");
        response.setContentType("text/calendar");

        Calendar calendar = new Calendar();
        calendar.getProperties().add(new ProdId("-//Ben Fortuna//iCal4j 1.0//EN"));
        calendar.getProperties().add(Version.VERSION_2_0);
        calendar.getProperties().add(CalScale.GREGORIAN);

        java.util.Calendar startDate = java.util.Calendar.getInstance();
        //Java calendar month count starts with zero
        startDate.set(java.util.Calendar.MONTH, startM-1);
        startDate.set(java.util.Calendar.DAY_OF_MONTH, startD);
        startDate.set(java.util.Calendar.YEAR, startY);
        startDate.set(java.util.Calendar.HOUR_OF_DAY, startH);
        startDate.set(java.util.Calendar.MINUTE, startMin);
        startDate.set(java.util.Calendar.SECOND, 0);

        // get the end date and time
        String endDString = (String) pageContext.findAttribute("endDay");
        java.util.Calendar endDate = java.util.Calendar.getInstance();
  //      int endD, endM, endY, endH, endMin;
        if (endDString != null)
        {
           int endD = Integer.valueOf((String) pageContext.findAttribute("endDay"));
           int endM = Integer.valueOf((String) pageContext.findAttribute("endMonth"));
           int endY = Integer.valueOf((String) pageContext.findAttribute("endYear"));
           int endH = Integer.valueOf((String) pageContext.findAttribute("endHour"));
            int endMin = Integer.valueOf((String) pageContext.findAttribute("endMin"));

            //Java calendar month count starts with zero
            endDate.set(java.util.Calendar.MONTH, endM - 1);
            endDate.set(java.util.Calendar.DAY_OF_MONTH, endD);
            endDate.set(java.util.Calendar.YEAR, endY);
            endDate.set(java.util.Calendar.HOUR_OF_DAY, endH);
            endDate.set(java.util.Calendar.MINUTE, endMin);
            endDate.set(java.util.Calendar.SECOND, 0);
        }
        // create the event event..
        DateTime start = new DateTime(startDate.getTime());
        VEvent meeting;
        if (endDString != null) {
            DateTime end = new DateTime(endDate.getTime());
            meeting = new VEvent(start, end, title);
        }
        else
        {
            meeting = new VEvent(start, title);
        }

        // Generate a UID for the event..
        UidGenerator ug = new UidGenerator("1");
        meeting.getProperties().add(ug.generateUid());
        calendar.getComponents().add(meeting);

        ServletOutputStream fout = response.getOutputStream();
        CalendarOutputter outputter = new CalendarOutputter();
        outputter.output(calendar, fout);

        fout.flush();

    }catch (ValidationException e) {

        e.printStackTrace();
    }

%>