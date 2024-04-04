<%@page import="com.jalios.jcms.jportal.json.JPortletUIMapping"%>
<%@page import="com.jalios.jcms.a11y.A11YConstants"%>
<%@page import="com.jalios.jcms.jportal.JPortalDisplayHandler"%>
<%@page import="com.jalios.jcms.jportal.JPortalDisplayContext"%>
<%@page import="com.jalios.jcms.jportal.JPortalConstants"%>
<%@page import="com.jalios.jcms.jportal.JPortalUtils"%>
<%@page import="com.jalios.jcms.jportal.json.JBlockMapping"%>
<%@ include file="/jcore/doInitPage.jspf" %><%
JBlockMapping jBlock = (JBlockMapping) request.getAttribute("jcms.jportal.jblock-mapping");
if (Util.isEmpty(jBlock)) {
  return;
}

JPortalDisplayHandler handler = (JPortalDisplayHandler) request.getAttribute(JPortalConstants.DISPLAY_HANDLER_REQUEST_ATTR);
handler.fullFillDisplayContext(jBlock);

Publication pub = (Publication) request.getAttribute(PortalManager.PORTAL_PUBLICATION);
Publication publication = pub; // Used in doDisplayHeader.jspf

boolean hasOptions = jBlock.getOptions() != null;
boolean isSelection = JPortalUtils.isBlockSelection(jBlock);
boolean hasPortlet = JPortalUtils.hasPortlet(jBlock);

// Portlet in selection
PortalElement displayedPortlet = getDataParameter("portlet", PortalElement.class);

boolean hasDisplayPortlet = displayedPortlet != null || (pub != null && pub instanceof Portlet);
if (pub != null && pub instanceof Portlet) {
  displayedPortlet = (PortalElement) pub;
}

boolean hasJsp = Util.notEmpty(getUntrustedStringParameter("jsp",""));
boolean hasBlocks = Util.notEmpty(jBlock.getJBlocks());
String customClass = JPortalUtils.getJBlockCustomClass(jBlock);
String dataAttributeHtml = JPortalUtils.getJBlockDataAttributes(jBlock).toString();
%>
<%-- JBlock --%>
<jalios:buffer name="jblockContent" trim="true">
<% if (JPortalUtils.displayBlock(jBlock, pub != null, loggedMember)) { %>
  <% if (hasJsp && isSelection && JcmsUtil.isLegalFile(getUntrustedStringParameter("jsp",""))) { %>
    <div class="jportal-block-inner <%= customClass%>">
     <div class="selection-wrapper">
       <div class="selection-body" id="<%= A11YConstants.AVOIDANCE_LINK_CONTENT_DOM_ID %>">
        <jalios:include jsp='<%= getUntrustedStringParameter("jsp","") %>'  />
      </div>
     </div>
   </div>
  <% } else if (hasDisplayPortlet && isSelection) { %>
    <div class="jportal-block-inner <%= customClass%>">
      <div class="selection-wrapper">
        <div class="selection-body" id="<%= A11YConstants.AVOIDANCE_LINK_CONTENT_DOM_ID %>"> 
          <jalios:include usage="full" id="<%= displayedPortlet.getId() %>"  />
        </div>
      </div>
    </div>
  <% } else if (isSelection && pub != null) { %>
    <% 
    	jcmsContext.setTemplateUsage(TypeTemplateEntry.USAGE_DISPLAY_FULL);
      boolean showHeaders = JPortalUtils.displayPublicationHeadersInSelectionBlock(jBlock);
    %>
    <article class="jportal-block-inner <%= customClass %>" id="<%= A11YConstants.AVOIDANCE_LINK_CONTENT_DOM_ID %>">
      <div class="selection-wrapper pub-action-toggler-<%= pub.getId() %> pub-pstatus-<%= pub.getPstatus() %>">
      	<% if(showHeaders){ %>
	        <div class="selection-header">
	          <%@ include file='/jcore/doDisplayHeader.jspf' %>
	        </div>
        <% } %>
        <div class="selection-body">
				  <jalios:include pub='<%= pub %>' />
		      <% boolean displaySelectionSide = !isLogged || Util.toBoolean(request.getAttribute("jcms.publication.actions.hide"),false); %>
				  <% if (!displaySelectionSide) { %>
		        <div class="selection-side">
						  <% request.setAttribute("publication", pub); %>
			        <jalios:include jsp="<%= ResourceHelper.getPublicationAction() %>" />
		        </div>
	        <% } %>
        </div>
        <% if(showHeaders){ %>
	        <div class="selection-footer">
	          <%@ include file='/jcore/doDisplayFooter.jspf' %>
	        </div>
        <% } %>
      </div>
	  </article>
	<% } else if (hasPortlet) { %>
		<div class="jblock-portlet">
      <% Map<String, String> portletUI = handler.getPortletUIMapping(jBlock.getJportlet()); %>
      <% 
      if (Util.notEmpty(portletUI)) {
        for (String itKey : portletUI.keySet()) { %>
          <% request.setAttribute(itKey, portletUI.get(itKey)); %>
        <% } 
      }
      %>
		  <% request.setAttribute("classOutterCustom", customClass); %>
	    <jalios:include id="<%= jBlock.getJportlet().getId() %>"  />
	    <% request.removeAttribute("classOutterCustom"); %>
      <% 
      if (Util.notEmpty(portletUI)) {
        for (String itKey : portletUI.keySet()) { %>
          <% request.removeAttribute(itKey); %>
        <% } 
      }
      %>
    </div>
	<% } else if (hasBlocks) { %>
	  <div class="jportal-block-inner <%= customClass %>">
		<% 
			int blockSize = 0;
      for (JBlockMapping itJBlock : jBlock.getJBlocks()) { %>
      	<% if(itJBlock == null){ continue;}%>
	      <% if(blockSize == 0){ %>
          <div class="row jportal-row"><%--Begin of row--%>
	      <% } %>    
	      <% 
	      	blockSize += itJBlock.getUi().getGridSizeMd(); %>
	      <% request.setAttribute("jcms.jportal.jblock-mapping",itJBlock); %>
	      <jalios:include jsp="types/JPortal/doJBlocks.jsp" usage="<%= handler.getSkinUsage() %>" />
	      <% request.removeAttribute("jcms.jportal.jblock-mapping"); %> 
	      <% if (blockSize == 12) { 
	           blockSize = 0; %>  
           </div><%--End of row if blocks size == 12 --%>
		    <% } %>  
			<% } //EOF for %>
			</div>
	<% }else{ %>
	  <div class="jportal-block-inner <%= customClass %>"></div>
	<% } %>
<% } %>
</jalios:buffer>
<% if (Util.notEmpty(jblockContent)) { %>
  <div <%= dataAttributeHtml %> class="<%= JPortalUtils.getJBlockCssClass(jBlock) %><%= JPortalUtils.getJBlockDisplayConditionCssClass(jBlock) %>">
    <%= jblockContent %>
  </div>
<% } %>