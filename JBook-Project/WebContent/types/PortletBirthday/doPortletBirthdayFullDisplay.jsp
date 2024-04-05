<%@ include file='/jcore/doInitPage.jspf' %><%
%><%@ include file='/jcore/portal/doPortletParams.jspf' %><%
%><%@ page import="com.jalios.jcmsplugin.esn.*" %><%
%><%@ page import="com.jalios.jcmsplugin.esn.ui.Link"%><%
%><%@ page import="com.jalios.jcms.calendar.*" %><%

ESNManager esnMgr = ESNManager.getInstance();
BirthdayManager birthdayMgr = BirthdayManager.getInstance();

PortletBirthday box = (PortletBirthday)portlet;

int[] days = {0, 1, 7};
int selectedDay = getIntParameter("birthdaySelection", days[0]);

Date selectedDate = new Date(System.currentTimeMillis() + selectedDay*JcmsConstants.MILLIS_IN_ONE_DAY);
Workspace filterWS = box.getWorkspaceMembers() ? workspace : null;
Member filterMbr = box.getRelationshipFilter() ? loggedMember : null;
Set<Member> memberSet = birthdayMgr.getBirthdayMemberSet(selectedDate, filterWS, filterMbr);

jcmsContext.addCSSHeader("plugins/ESNPlugin/css/esn.css");
%><div id="portlet-birthday" class="esn"><%
  %><ul class="nav nav-tabs"><%
    for (int day : days) {
      boolean isActiveTab = day == selectedDay;
      String cssAttr = isActiveTab ? " class=\"active\"" : "";
      String ariaAttr = isActiveTab ? " aria-current=\"true\"" : "";
      %><li<%= cssAttr %><%= ariaAttr %>><%
        out.print(new Link()
            .jaliosAction("ajax-refresh")
            .href("types/PortletBirthday/doPortletBirthday.jsp?birthdaySelection=" + day)
            .text(glp("jcmsplugin.esn.birthday.portlet.day", day))
            .html());
      %></li><%
    }
  %></ul><%
  if (Util.notEmpty(memberSet)) { %>
  <div class="item-box-member">
    <jalios:pager name='pagerHandler' declare='true' action='init' pageSize='10' size='<%= memberSet.size() %>'/>
     
    <ul class="item-box">
    <jalios:foreach collection="<%= memberSet %>" 
                    type="Member" 
                    name="itMember"
                    max='<%= pagerHandler.getPageSize() %>'
                    skip='<%= pagerHandler.getStart() %>'
                    >
    <li><%@ include file="/plugins/ESNPlugin/jsp/common/doMemberStatus.jspf" %></li>
    </jalios:foreach>
    </ul>
    
    <jalios:pager name='pagerHandler' template='pqf' />
  </div>
  <% } else { %>
  <p><%= glp("jcmsplugin.esn.birthday.portlet.none") %></p>
  <% } %>
</div>