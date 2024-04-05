<%@ include file='/plugins/ESNPlugin/jsp/common/doCommonParams.jspf' %>
<% 
List<MemberLink> linkList = esnMgr.getMemberLinkList(member); 
boolean hasLinkSet = Util.notEmpty(linkList);

if (!hasLinkSet && !canEdit) {
  request.setAttribute("ShowPortalElement" , Boolean.FALSE);    
  return;
}

String title = null;
if (isMyProfile) {
  title = glp("jcmsplugin.esn.lbl.links.me");
} else {
  title = glp("jcmsplugin.esn.lbl.links.other",member.getFriendlyName());
}

request.setAttribute("skinTitle", title);

if (canEdit) {
  String footerUrl = "<a class='modal' onclick='return false;' href='plugins/ESNPlugin/jsp/form/editLink.jsp?mid=" + member.getId() + "'>" + JcmsUtil.getHtmlIcon("add") + " " + glp("jcmsplugin.esn.lbl.links.add") + "</a>";
  request.setAttribute("defaultSkin.footer", footerUrl);
}

%>
<jsp:useBean id='formHandler' scope='page' class='com.jalios.jcmsplugin.esn.EditMemberLinkHandler'>
  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='formHandler' property='*' />
  <jsp:setProperty name='formHandler' property='noRedirect' value='true'/>
</jsp:useBean>
<% if (formHandler.validate()) { 
  //Refresh portlet's content
  HibernateUtil.commitTransaction();
  HibernateUtil.beginTransaction();
  linkList = esnMgr.getMemberLinkList(member);  
  hasLinkSet = Util.notEmpty(linkList);
} %>
<div class="ajax-refresh-div" data-jalios-ajax-refresh-url="plugins/ESNPlugin/jsp/portlet/doLinks.jsp">
  <div id="profile-links" class="links">
    <% if (!hasLinkSet) { %>
      <div class="intro"><%= glp("jcmsplugin.esn.lbl.links.intro")  %></div>
    <% } else {%>
    <ul class="item-box">
      <jalios:foreach collection="<%= linkList %>" name="link" type="MemberLink">
      <li class="item">
        <% if(canEdit){ %>
        <div class="item-icons"><%--
           --%><a class="modal" onclick="return false;" href="plugins/ESNPlugin/jsp/form/editLink.jsp?mid=<%= member.getId() %>&amp;id=<%= link.getId() %>"><jalios:icon src='edit-small' css="jalios-icon-sm hover-action" /></a>
          <a class="ajax-refresh confirm" onclick="return false;" href="plugins/ESNPlugin/jsp/portlet/doLinks.jsp?id=<%= link.getId() %>&amp;opDelete=true"><jalios:icon src='remove-small' css="jalios-icon-sm hover-action" /></a>
        </div>
        <% } %>
        <jalios:icon src="<%= FaviconManager.getInstance().getIcon(link.getUrl()) %>" css="jalios-icon-sm" />
        <a target="_blank" rel="noreferrer" href="<%= link.getUrl() %>"><%= link.getTitle() %></a>
        <% if (Util.notEmpty(link.getDescription())) { %>      
        <div class="description"><%= link.getDescription() %></div>
        <% } %>      
        
      </li>
      </jalios:foreach>
    </ul>
    <% } %>
  </div>
</div>