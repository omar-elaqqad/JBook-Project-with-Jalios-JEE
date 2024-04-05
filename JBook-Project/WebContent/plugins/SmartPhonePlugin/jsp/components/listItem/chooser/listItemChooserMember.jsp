<%@ include file="/plugins/SmartPhonePlugin/jsp/common/doInitSmartPhonePage.jspf" %><%--
--%><%@ page import="com.jalios.jcmsplugin.smartphone.*" %><% 

SmartPhoneManager smartPhoneManager = SmartPhoneManager.getInstance();

Data data = (Data) getIncludeObject("data", null);
Member mbr = (Member) data;

String css = getIncludeString("css", "");

boolean readable = Util.toBoolean(getIncludeObject("readable", true), true);
boolean displayDataIcon = Util.toBoolean(getIncludeObject("displayDataIcon", true), true);

String cssClasses = Util.notEmpty(css) ? css + " " : "";
cssClasses += "chooser-result chooser-result-member";

String organization = Util.getString(mbr.getOrganization(),"");
String department = Util.getString(mbr.getDepartment(), "");  
String jobTitle = Util.getString(mbr.getJobTitle(),"");

boolean isGuest = mbr.isGuest();
boolean isContact = mbr.isContact();

String mentionDataAttribute = (getBooleanParameter("isMention", false) && Util.notEmpty(mbr.getEmail())) ? "data-mention-email-prefix=\"" + mbr.getEmail().split("@")[0] + "\"" : "";

%>
<li class="<%= cssClasses %>" data-jalios-chooser-label="<%= data %>" data-jalios-chooser-dataid="<%= data.getId() %>" <%= mentionDataAttribute %>>
  <div class="media-left media-middle">
    <jalios:memberphoto resource="memberphoto-phone" link="false" member="<%= mbr %>" size="<%= PhotoSize.TINY %>" css="smartphone-memberchooser-memberphoto" />
  </div>
  <div class="media-body media-middle">
    <h2><%= mbr.getFullName() %></h2>
    <% if (Util.notEmpty(organization) || Util.notEmpty(department) || Util.notEmpty(jobTitle)) { %>
      <p class="member-chooser-result-meta"><%= organization %>
        <% if (Util.notEmpty(organization) && (Util.notEmpty(department) || Util.notEmpty(jobTitle))) { %> - <% } %>
        <%= department %>
        <% if (Util.notEmpty(department) && Util.notEmpty(jobTitle)) { %> - <% } %>
        <%= jobTitle %>
      </p>
    <% } %>
    <% if (isGuest || isContact) { %>
      <div class="member-chooser-result-meta2"><%= isGuest ? "<span class=\"label label-mbr-guest\">" + glp("jcmsplugin.smartphone.lbl.guest") + "</span>" : "" %> <%= isContact ? "<span class=\"label label-mbr-contact\">" + glp("ui.com.lbl.contact") + "</span>" : "" %></div>
    <% } %>            
    
  </div>
</li>