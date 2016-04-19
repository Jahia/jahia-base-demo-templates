/**
 * Created by fabriceaissah on 4/19/16.
 */

package org.jahia.modules.jahiademo.actions;

import net.fortuna.ical4j.data.CalendarOutputter;
import net.fortuna.ical4j.model.Date;
import net.fortuna.ical4j.model.ValidationException;
import net.fortuna.ical4j.model.component.VEvent;
import net.fortuna.ical4j.model.property.CalScale;
import net.fortuna.ical4j.model.property.ProdId;
import net.fortuna.ical4j.model.property.Version;
import net.fortuna.ical4j.util.UidGenerator;
import org.jahia.bin.Action;
import org.jahia.bin.ActionResult;
import org.jahia.services.content.JCRSessionWrapper;
import org.jahia.services.render.RenderContext;
import org.jahia.services.render.Resource;
import org.jahia.services.render.URLResolver;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

public class GenerateEventIcs extends Action {

    private static final Logger logger = LoggerFactory.getLogger(GenerateEventIcs.class);

    @Override
    public ActionResult doExecute(HttpServletRequest httpServletRequest, RenderContext renderContext, Resource resource, JCRSessionWrapper jcrSessionWrapper, Map<String, List<String>> map, URLResolver urlResolver) throws Exception {

        try {
            HttpServletResponse response = renderContext.getResponse();
            java.util.Calendar endDate = null;
            java.util.Calendar startDate = null;
            String title = resource.getNode().getProperty("jcr:title").getString();

            if (resource.getNode().hasProperty("startDate")) {
                startDate = resource.getNode().getProperty("startDate").getDate();
                //Java calendar month count starts with zero
                startDate.add(Calendar.MONTH, -1);
            }

            if (resource.getNode().hasProperty("endDate")) {
            // get the end date and time
            endDate = resource.getNode().getProperty("endDate").getDate();
            endDate.add(Calendar.MONTH, -1);
            endDate.add(Calendar.DAY_OF_MONTH, +1);
            }

            response.setHeader("Content-Disposition", "attachment;filename=\"" + title + ".ics\"");
            response.setContentType("text/calendar");

            net.fortuna.ical4j.model.Calendar calendar = new net.fortuna.ical4j.model.Calendar();
            calendar.getProperties().add(new ProdId("-//Ben Fortuna//iCal4j 1.0//EN"));
            calendar.getProperties().add(Version.VERSION_2_0);
            calendar.getProperties().add(CalScale.GREGORIAN);

            if(startDate != null) {
                // create the event event..
                Date start = new Date(startDate.getTime());
                VEvent meeting;
                if (endDate != null) {
                    Date end = new Date(endDate.getTime());
                    meeting = new VEvent(start, end, title);
                } else {
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
            }
        } catch (ValidationException e) {

            e.printStackTrace();
        }

        return null;
    }
}