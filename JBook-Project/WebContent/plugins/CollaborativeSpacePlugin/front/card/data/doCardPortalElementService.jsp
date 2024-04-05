<%@page import="com.jalios.jcmsplugin.collaborativespace.EditServiceHandler"%><%
%><%@page import="com.jalios.jcmsplugin.collaborativespace.CSConstants"%><%
%><%@ include file="/front/card/data/doInitCardData.jspf" %><%
WebAssetsUtils.addWebAssets(jcmsContext, "jalios-truncate");
PortalElement pub = (PortalElement) data;
EditServiceHandler formHandler = (EditServiceHandler) request.getAttribute("cs-service-formHandler");
if (formHandler == null) {
  return;
}
boolean isApplication = pub.hasAbility(CSConstants.APPLICATION_ABILITY);
boolean isInstalled = formHandler.isInstalled(pub);

String serviceTitle = pub instanceof PortletSkinable ? ((PortletSkinable)pub).getContentTitle(userLang) : pub.getTitle(userLang);

StringBuilder serviceCss = new StringBuilder();
serviceCss.append(isInstalled ? "installed " : "not-installed ");
serviceCss.append(isApplication ? "application " : "");
serviceCss.append(" has-footer ");

String usage = isApplication ? "full" : "box";
String dataImage = pub.getDataImage(userLang, true);
String templateImage = pub.getTemplateEntry(usage, false).getThumbnailPath();
String serviceImage = "";
if (Util.notEmpty(dataImage) && new File(channel.getWebappPath(), dataImage).exists()) {
  serviceImage = dataImage;
} else if (Util.notEmpty(templateImage) && new File(channel.getWebappPath(), templateImage).exists()) {
  serviceImage = templateImage;
}
if (Util.isEmpty(serviceImage)) {
  serviceImage = channel.getProperty("jcmsplugin.collaborativespace.service-card-image", null);
}
String redirect = ServletUtil.getResourcePath(request) + "?jsp=plugins/CollaborativeSpacePlugin/jsp/services.jsp"+"&amp;selectedPortletType="+formHandler.getCurrentSelectedPortletType() + "&amp;search="+formHandler.getSearch()+"&amp;service=" + pub.getId() + "&amp;currentApplicationFilter=" + formHandler.getCurrentApplicationFilter();
%>
<jalios:card css='<%= css + " card-publication card-cs-service " + serviceCss.toString() %>' link="<%= link %>" linkOptions="<%= linkOptions %>" dataAttribute="<%= dataAttribute %>">
  <jalios:cardFront>
    <%= getIncludeString("CARD_TOP", "") %>

    <% if (isInstalled) { %>
      <div class="card-corner-left cs-service-installed-icon" title="<%= encodeForHTMLAttribute(glp("jcmsplugin.collaborativespace.services.lbl.installed-service.title")) %>">
        <jalios:icon alt='jcmsplugin.collaborativespace.services.lbl.installed-service.title' src="jcmsplugin-collaborativespace-service-card-installed" />
      </div>
    <% } %>
    <jalios:cardImage src="<%= serviceImage %>" />
    
    <jalios:cardBlock>
      <div class="card-title card-publication-title" data-jalios-truncate='{ "value" : 2 }' title="<%= encodeForHTMLAttribute(pub.getTitle(userLang)) %>"><%= serviceTitle %></div>
    </jalios:cardBlock>
    <%-- Custom CARD_BOTTOM --%>
    <% if (loggedMember != null && channel.isDataWriteEnabled()) { %>
    <jalios:cardBlock css="service-actions card-block-footer card-block-footer-default" mode="<%= CardBlockMode.FOOTER %>">
        <form name="editForm" action="<%= ServletUtil.getResourcePath(request) %>" method="post">
          <input type="hidden" name="currentApplicationFilter" value="<%= formHandler.getCurrentApplicationFilter() %>" />
          <input type="hidden" name="selectedPortletType" value="<%= formHandler.getCurrentSelectedPortletType() %>" />
          <input type="hidden" name="search" value="<%= formHandler.getSearch()%>" />
          
          <div class="actions">
            <% if (isInstalled) { %>
              <button type="submit" class="btn btn-default" name="opRemoveService" value="true">
                <jalios:icon src="cross" alt="remove-application"/> 
                <%= glp("jcmsplugin.collaborativespace.services.btn.remove") %>
              </button>
            <% } else { %>
              <button type="submit" class="btn btn-default" name="opAddService" value="true">
                <jalios:icon src="jportal-simple-edition-add-portlet" alt="add-application"/> 
                <%= glp("jcmsplugin.collaborativespace.services.btn.add") %>
              </button>
            <% } %>
            <% if (loggedMember.canWorkOn(pub)) { %>
              <jalios:edit data='<%= pub %>' css='btn btn-rounded has-no-caret edit-application' icon="glyph: icomoon-more2" />
            <% } %>
          </div>
          <% if (Util.notEmpty(redirect)) { %>
          <input type="hidden" name="redirect" value="<%= encodeForHTMLAttribute(redirect) %>" />
          <% } %>
          <input type="hidden" name="service" value="<%= pub.getId() %>" />            
          <input type="hidden" name="jsp" value="plugins/CollaborativeSpacePlugin/jsp/services.jsp" />
        </form>
      </jalios:cardBlock>
    <% } %>
  </jalios:cardFront>
  <jalios:cardBack>
  </jalios:cardBack>
</jalios:card>
