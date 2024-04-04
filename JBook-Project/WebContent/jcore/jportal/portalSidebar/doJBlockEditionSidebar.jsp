<%@page import="com.jalios.jcms.jportal.JPortalEditorHandler"%><%--
--%><%@page import="com.jalios.jcms.jportal.JPortalManager"%><%--
--%><%@ page contentType="text/html; charset=UTF-8"%><%--
--%><%@ include file="/jcore/doInitPage.jspf"%><%--
--%><jsp:useBean id='jPortalHandler' scope='page' class='com.jalios.jcms.jportal.JPortalEditorHandler'><%--
  --%><jsp:setProperty name='jPortalHandler' property='request' value='<%= request %>'/><%--
  --%><jsp:setProperty name='jPortalHandler' property='response' value='<%= response %>'/><%--
  --%><jsp:setProperty name='jPortalHandler' property='*' /><%--
--%></jsp:useBean><%--
--%><%
request.setAttribute(JPortalEditorHandler.FORM_HANDLER_REQUEST_ATTR, jPortalHandler);
request.setAttribute(JPortalEditorHandler.PORTLET_EDITION_REQUEST_ATTR, true);
request.setAttribute(JPortalEditorHandler.JPORTAL_EDITION_REQUEST_ATTR, true);

request.setAttribute("jcms.edit.footer.display", false);
request.setAttribute(EditPortletSkinableHandler.DISPLAY_PORTLET_SKINABLE_FORM_REQUEST_ATTR, false);
request.setAttribute("field-vertical", true);
request.setAttribute("jportalEditorHandler", jPortalHandler);

boolean isJBlockEdition = jPortalHandler.getBlockId() != null && jPortalHandler.getPortletId() == null;
boolean isJPortletEdition = jPortalHandler.getPortletId() != null;
boolean canWorkOnPortlet = loggedMember.canWorkOn(channel.getPublication(jPortalHandler.getPortletId()));
String portletEditTemplatePath = jPortalHandler.getPortletEditTemplatePath();
boolean isSkinablePortlet = channel.getPublication(jPortalHandler.getPortletId()) instanceof AbstractPortletSkinable;
%><%
%><div class="ajax-refresh-div" data-jalios-ajax-refresh-url="/jcore/jportal/portalSidebar/doJBlockEditionSidebar.jsp">
  <div class="jportlet-sidebar" data-jalios-portlet-id="<%= jPortalHandler.getPortletId() %>" data-block-id="<%= jPortalHandler.getBlockId() %>">
	  <div class="sidebar-header-icon">
	  	<a class="jportal-sidebar-home-link" title="<%= encodeForHTMLAttribute(glp("jportal.edition.sidebar.header.back.title")) %>" 
	  		 data-jalios-sidebar-target=".jportal-editor-sidebar" data-jalios-sidebar-action="open" 
	  		 data-jalios-sidebar-url="jcore/jportal/commonSidebar/doJPortalSidebar.jsp?jPortal=<%= jPortalHandler.getAvailableJPortal().getId() %>">
	  		   <jalios:icon src="jportal-sidebar-back" />
	  	</a>
	    <a title="<%= encodeForHTMLAttribute(glp("jportal.edition.sidebar.header.back.title")) %>" 
		     data-jalios-sidebar-target=".jportal-editor-sidebar" data-jalios-sidebar-action="open" 
		     data-jalios-sidebar-url="jcore/jportal/commonSidebar/doJPortalSidebar.jsp?jPortal=<%= jPortalHandler.getAvailableJPortal().getId() %>">
		       <jalios:icon src="jportal-sidebar-header" />
		   </a> 
	  </div>
	  <ul class="sidebar-tabs" role="tablist">
	    <% if (isJPortletEdition && canWorkOnPortlet) { %>
	      <li role="presentation" class="active">
	        <a href="#PORTLET_EDIT" data-toggle="tab" onclick="return false;" aria-controls="paths" role="tab" title="<%= encodeForHTMLAttribute(glp("jportal.edition.sidebar.portlet-edit.tab-edit.title")) %>">
	          <jalios:icon src="jportal-sidebar-tab-edit-portlet"/>
	        </a>
	      </li>
	      <% if (isSkinablePortlet) { %>
		      <li role="presentation">
		        <a href="#PORTLET_TEMPLATES" data-toggle="tab" onclick="return false;" aria-controls="paths" role="tab" title="<%= encodeForHTMLAttribute(glp("jportal.edition.sidebar.portlet-edit.tab-templates.title")) %>">
		          <jalios:icon src="jportal-sidebar-tab-templates"/>
		        </a>        
		      </li>
	      <% } %>
	      <li role="presentation">
	        <a href="#EDIT_ADVANCED" data-toggle="tab" onclick="return false;" aria-controls="paths" role="tab" title="<%= encodeForHTMLAttribute(glp("jportal.edition.sidebar.portlet-edit.tab-advanced.title")) %>">
	          <jalios:icon src="jportal-sidebar-tab-portlet-advanced"/>
	        </a>        
	      </li>
	    <% } %>
	    <li role="presentation" class="<%= isJBlockEdition || (isJPortletEdition && !canWorkOnPortlet) ? " active" : "" %>" title="<%= encodeForHTMLAttribute(glp("jportal.edition.sidebar.portlet-edit.tab-ui.title")) %>">
				<a href="#UI" data-toggle="tab" onclick="return false;" aria-controls="paths" role="tab">
				  <jalios:icon src="jportal-sidebar-tab-ui"/>
				</a>
	    </li>
	    <li role="presentation">
				<a href="#OPTIONS" data-toggle="tab" onclick="return false;" aria-controls="paths" role="tab" title="<%= encodeForHTMLAttribute(glp("jportal.edition.sidebar.portlet-edit.tab-display.title")) %>">
				  <jalios:icon src="jportal-sidebar-tab-options" />  
				</a>
	    </li>
	  </ul>
	  <div class="sidebar-body">
	    <form>
        <% Set<PortalInterface> portalSet = jPortalHandler.getPortletPortalSet(); %>
        <% if (Util.notEmpty(portalSet)) { %>
          <jalios:message level="<%= MessageLevel.WARN %>">
            <% if (Util.getSize(portalSet)  > 1) { %>
	            <p><%= glp("jportal.edition.sidebar.warning.exists-portal-multiple") %></p>
	            <ul>
		            <% for (PortalInterface itPortletPortal : portalSet) { %>
		              <li><jalios:link data="<%= (Publication) itPortletPortal %>" /></li>
		            <% } %>
	            </ul>             
            <% } else { %>
              <% Publication portalPub = (Publication) Util.getFirst(portalSet); %>
	            <p><%= glp("jportal.edition.sidebar.warning.exists-portal-unique", portalPub.getDisplayLink(userLocale)) %></p>
            <% } %>
            <% if (loggedMember.canPublish(jPortalHandler.getPortletClass(), workspace)) { %>
              <a class="btn btn-default" data-jalios-ajax-refresh-url="jcore/jportal/commonSidebar/doJPortalSidebar.jsp?jPortal=<%= jPortalHandler.getAvailableJPortal().getId() %>" data-jalios-action="ajax-refresh" data-jalios-options='{"params":{"portletClassName":"<%= jPortalHandler.getPortletClass().getSimpleName() %>","createPortlet":"true", "id" : "<%= jPortalHandler.getPortletId() %>"}}'>
              	<%= glp("jportal.edition.sidebar.portlet.create-new.label") %>
              </a>
            <% } %>
          </jalios:message>
        <% } %>      
      
		    <div class="sidebar-tab-content tab-content">
		      <% if (isJPortletEdition && canWorkOnPortlet) { %>
		        <div id="PORTLET_EDIT" class="tab-pane fade active in ">
		          <h3 class="sidebar-tab-title"><%= glp("jportal.edition.sidebar.portlet-edit.title", jPortalHandler.getPortletName()) %></h3>
		            <div class="jportal-sidebar-group">
									<jalios:include jsp="<%= portletEditTemplatePath %>" />
			            <% EditPortalElementHandler genericFormHandler = (EditPortalElementHandler) request.getAttribute("formHandler"); %>
								  <input type="hidden" name="cids" value="" />
								</div>
				        <div class="buttons">
				          <a class="btn btn-default" data-jalios-sidebar-target=".jportal-editor-sidebar" data-jalios-sidebar-action="open" 
				          	data-jalios-sidebar-url="jcore/jportal/commonSidebar/doJPortalSidebar.jsp?jPortal=<%= jPortalHandler.getAvailableJPortal().getId() %>"><%= glp("ui.com.btn.cancel") %></a>
				          <button class="btn btn-primary btn-create" name="opUpdate" value="true" data-jalios-action="ajax-refresh"><%= glp("ui.com.btn.save") %></button>
		              <%@ include file='/jcore/jportal/portalSidebar/doJPortalLangChooser.jspf' %>
				        </div>
		        </div>
		        <div id="PORTLET_TEMPLATES" class="tab-pane fade jportlet-templates">
		          <%@ include file='/jcore/jportal/portletSidebar/doJPortletTemplatesContent.jspf' %>
		          <div class="buttons">
		            <a class="btn btn-default" data-jalios-sidebar-target=".jportal-editor-sidebar" data-jalios-sidebar-action="open" 
		               data-jalios-sidebar-url="jcore/jportal/commonSidebar/doJPortalSidebar.jsp?jPortal=<%= jPortalHandler.getAvailableJPortal().getId() %>"><%= glp("ui.com.btn.cancel") %></a>
		            <button class="btn btn-primary btn-create" name="opUpdate" value="true" data-jalios-action="ajax-refresh"><%= glp("ui.com.btn.save") %></button>
		            <%@ include file='/jcore/jportal/portalSidebar/doJPortalLangChooser.jspf' %>
		          </div>
		        </div>
	          <div id="EDIT_ADVANCED" class="tab-pane fade jportlet-advanced">
							<h3 class="sidebar-tab-title"><%= glp("jportal.edition.sidebar.portlet-edit.advanced.title") %></h3>
              <div class="jportal-sidebar-group jportal-sidebar-group-separated">
                <jalios:field label="jportal.edition.sidebar.portlet-id"><code><%= jPortalHandler.getPortletId() %></code></jalios:field>
              </div>
              <% if (isSkinablePortlet) { %>
	              <%@ include file='/jcore/jportal/portletSidebar/doJPortletMiscContent.jspf' %>
	            <% } %>
	            <%@ include file='/jcore/jportal/portletSidebar/doJPortletCacheContent.jspf' %>
              <%@ include file='/jcore/jportal/portletSidebar/doJPortletRightsContent.jspf' %>
              <%@ include file='/jcore/jportal/portletSidebar/doJPortletMemberShipContent.jspf' %>
              
	            <div class="buttons">
		            <a class="btn btn-default" data-jalios-sidebar-target=".jportal-editor-sidebar" data-jalios-sidebar-action="open" 
		            	 data-jalios-sidebar-url="jcore/jportal/commonSidebar/doJPortalSidebar.jsp?jPortal=<%= jPortalHandler.getAvailableJPortal().getId() %>"><%= glp("ui.com.btn.cancel") %></a>
	              <button class="btn btn-primary btn-create" name="opUpdate" value="true" data-jalios-action="ajax-refresh"><%= glp("ui.com.btn.save") %></button>
	              <%@ include file='/jcore/jportal/portalSidebar/doJPortalLangChooser.jspf' %>
	            </div>            
	          </div>  
	        <% } %>  
		      <div id="UI" class="tab-pane fade jportlet-ui <%= isJBlockEdition || (isJPortletEdition && !canWorkOnPortlet) ? " active in" : "" %>">
			      <jalios:include jsp="jcore/jportal/commonSidebar/doSidebarUIContent.jsp" />
			    </div>
			    <div id="OPTIONS" class="tab-pane fade jportlet-option">
		        <%@ include file='/jcore/jportal/commonSidebar/doSidebarOptionsContent.jspf' %>
		      </div>
			  </div>
			  <% if (jPortalHandler.getPortletClass() != null) { %>
		      <input type="hidden" name="portletClassName" value="<%= jPortalHandler.getPortletClass().getSimpleName() %>" />
	      <% } %>
	      <input type="hidden" name="blockId" value="<%= jPortalHandler.getBlockId() %>" />
	      <input type="hidden" name="id" value="<%= jPortalHandler.getPortletId() %>" />
	      <input type="hidden" name="portletId" value="<%= jPortalHandler.getPortletId() %>" />		  
        <input type="hidden" name="jPortal" value="<%= jPortalHandler.getAvailableJPortal().getId() %>" />     
	    </form>
		</div>
	</div>
  <%@ include file='/jcore/doAjaxFooter.jspf' %>
</div>