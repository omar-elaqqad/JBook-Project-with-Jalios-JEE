<%--
  @Summary: Portal Redirect content editor
  @Customizable: True
  @Requestable: False
--%><%
%><%@ include file='/jcore/doInitPage.jspf' %><%
 EditPortletPortalRedirectHandler formHandler = (EditPortletPortalRedirectHandler)request.getAttribute("formHandler");
%>
 
  <tr>
    <td>
      <div class="tab-pane" id="PortletPortalRedirect_redirection_tab">
      
        <%-- *** REDIRECT TAB **************************************** --%>
        <%
        List<String> statusList = Util.getArrayList(
            PortalRedirect.REDIRECT_HOME, 
            PortalRedirect.REDIRECT_TEAM_PORTAL, 
            PortalRedirect.REDIRECT_URL, 
            PortalRedirect.REDIRECT_CONTENT, 
            PortalRedirect.REDIRECT_PORTLET, 
            PortalRedirect.REDIRECT_FORM,
            PortalRedirect.REDIRECT_CATEGORY,
            PortalRedirect.REDIRECT_FIRST_CATEGORY);
        %>
        <div class="tab-page">
          <% String status = formHandler.getAvailableStatus(); %>
          <h2 class="tab"><%= glp("ui.editredirect.tabredirect") %></h2>  
          <jalios:field label="ui.editredirect.redirectto">
            <select name="status" class="form-control" data-jalios-action="toggle:value" data-jalios-target=".redirect-details-wrapper" data-jalios-target-attribute="class">
              <jalios:foreach collection="<%= statusList %>" name="itStatus" type="String">
              <option value="<%= itStatus %>" <%= itStatus.equals(status) ? "selected='selected'" : "" %>><%= glp("ui.editredirect." + itStatus) %></option>
              </jalios:foreach>
           </select>
           <style>
             .redirect-details-wrapper .redirect-details {
               display: none;
               margin: 40px 0 20px 0;
             }
             <jalios:foreach collection="<%= statusList %>" name="itStatus" type="String">
             .redirect-details-wrapper.<%= itStatus %> .redirect-details-<%=itStatus %> {
               display: block;
             }
             </jalios:foreach>
           </style>
           <div class="redirect-details-wrapper <%= status %>">
             <div class="redirect-details redirect-details-<%= PortalRedirect.REDIRECT_URL %>">
               <jalios:field  name="url" value='<%= formHandler.getAllAvailableUrlML() %>' resource="field-inline">
                 <jalios:control type="<%= ControlType.URL %>" />
               </jalios:field>
             </div>
             <div class="redirect-details redirect-details-<%= PortalRedirect.REDIRECT_CONTENT %>">
               <jalios:field  name="content" value='<%= formHandler.getAvailableContent() %>' resource="field-light">
                 <jalios:control settings='<%= new PublicationSettings().superType(Content.class) %>' />
               </jalios:field>
             </div>
             <div class="redirect-details redirect-details-<%= PortalRedirect.REDIRECT_PORTLET %>">
               <jalios:field  name="redirectPortlet" value='<%= formHandler.getAvailableRedirectPortlet() %>' resource="field-light">
                 <jalios:control settings='<%= new PublicationSettings().superType(PortalElement.class) %>' />
               </jalios:field>
             </div>           
             <div class="redirect-details redirect-details-<%= PortalRedirect.REDIRECT_CATEGORY %>">
              <jalios:field  name="category" value='<%= channel.getCategory(formHandler.getAvailableCategory()) %>' resource="field-light">
                <jalios:control type="<%= ControlType.CATEGORY %>" />
              </jalios:field>             
             </div>           
             <div class="redirect-details redirect-details-<%= PortalRedirect.REDIRECT_FORM %>">
              <jalios:field resource="field-light">
                <select name='redirectForm' class="form-control">
                  <option value="">&nbsp;</option>
                  <jalios:foreach collection='<%= channel.getSubTypeList(Form.class, userLang) %>' type='java.lang.Class' name='itClazz'>
                    <jalios:if predicate='<%= isAdmin || workspace.getTypeSet().contains(itClazz) %>'>
                      <% String shortName = Util.getClassShortName(itClazz); %>
                      <option value="<%= shortName %>" <%= shortName.equals(formHandler.getAvailableRedirectForm()) ? "selected" : "" %>><%= channel.getTypeLabel(itClazz, workspace, userLang) %></option>
                    </jalios:if>
                  </jalios:foreach>
                </select>
              </jalios:field>
             </div>
           </div>
          </jalios:field>
                      
          <%-- DispPortal ------------------------------------------------------------ --%>
          <div class="redirect-details-wrapper <%= status %>">
            <div class="redirect-details redirect-details-<%= PortalRedirect.REDIRECT_URL %> redirect-details-<%= PortalRedirect.REDIRECT_CONTENT %> redirect-details-<%= PortalRedirect.REDIRECT_PORTLET %> redirect-details-<%= PortalRedirect.REDIRECT_CATEGORY %>  redirect-details-<%= PortalRedirect.REDIRECT_FORM %>">          
              <jalios:field  name="dispPortal" label="ui.editredirect.dispportal" description="ui.editredirect.dispportal.h" value='<%= formHandler.getAvailableDispPortal() %>'>
                <jalios:control settings='<%= new PublicationSettings().superType(PortalInterface.class) %>' />
              </jalios:field>
            </div>
          </div>
			</div> 


      <%-- *** CATEGORY TAB **************************************** --%>
			<div class="tab-page">
			  <h2 class="tab"><%= glp("ui.editredirect.categories") %></h2>

        <%-- NavCategories ------------------------------------------------------------ --%>          
        <% if (formHandler.isFieldEdition("navCategories")) { %>
         <jalios:field  name='cids' label="ui.editredirect.categories" required='true' value='<%= formHandler.getCategorySet(null) %>'>
          <jalios:control settings='<%= new CategorySettings().tree().multiple().root(formHandler.getNavCategoriesRoot()) %>' />
        </jalios:field>
        <% } %>
        
        <%-- ExactCategory ------------------------------------------------------------ --%>
        <% if (formHandler.isFieldEdition("exactCategory")) { %>
        <jalios:field  name="exactCategory" label="ui.editportlet.exaccat" description="ui.editportlet.exaccat.h" value='<%= "" + formHandler.getAvailableExactCategory() %>'>
          <jalios:control type="<%= ControlType.BOOLEAN %>" />
        </jalios:field>
        <% } %>

			</div> 
    </div>
    <div>
      <% request.setAttribute("formHandler", formHandler); %>
      <jalios:include jsp="/jcore/doEditExtraData.jsp" />
    </div>
  </td>
</tr>


<%-- Not Included because should be never used ???      %>
<%-- @ include file='/jcore/portal/doEditCommonPortlet.jspf' --%>

