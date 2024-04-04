<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
  if (!isLogged) {
    sendForbidden(request, response);
    return;
  }
%><%
%><jsp:useBean id='formHandler' scope='page' class='generated.EditPortletIndicatorHandler'><%
%><jsp:setProperty name='formHandler' property='request' value='<%=request%>' /><%
%><jsp:setProperty name='formHandler' property='response' value='<%=response%>' /><%
%><jsp:setProperty name='formHandler' property='*' /><%
%><jsp:setProperty name='formHandler' property='noRedirect' value='<%= true %>' /><%
%></jsp:useBean>

<% if(formHandler.validate()) { %>
<script>
jQuery.jalios.AjaxRefresh.refreshPortlet("<%= formHandler.getPublication().getId() %>");
jQuery.jalios.ui.Modal.close(false);
</script>
<% } %>

<%
boolean isManual = "MANUAL".equals(((PortletIndicator)formHandler.getPublication()).getIndicatorType());

boolean showDataTab = isManual;
boolean isPercentage = formHandler.getAvailablePercentage();
boolean isContentLink = "content".equals(formHandler.getAvailableLinkType());
boolean isCategoryLink = "category".equals(formHandler.getAvailableLinkType());

boolean isCard = "box.card".equals(formHandler.getAvailableTemplateEntry("box").getName());
boolean isDonut = !isCard;
boolean isDataTabActive = isManual;
boolean isInfoTabActive = !isManual;
%>

<jalios:modal formHandler="<%= formHandler %>" 
              title="<%= ((PortletIndicator)formHandler.getPublication()).getContentTitle(userLang) %>"
              url="types/PortletIndicator/editIndicator.jsp"
              css="modal-lg edit-indicator"
              op="opUpdate"
              button="ui.com.btn.save">

  <%-- Tabs --%>
  <ul class="nav nav-tabs nav-tabs-underlined is-left-aligned no-border" role="tablist">
    <% if (showDataTab) { %>
    <li class="<%= isDataTabActive ? "active" : "" %>"><a href="#metric" role="tab" data-toggle="tab" onclick="return false;"><%= glp("types.PortletIndicator.tab.metric") %></a></li>
    <% } %>
    <li class="<%= isInfoTabActive ? "active" : "" %>"><a href="#info" role="tab" data-toggle="tab" onclick="return false;"><%= glp("types.PortletIndicator.tab.info") %></a></li>
    <li><a href="#presentation" role="tab" data-toggle="tab" onclick="return false;"><%= glp("types.PortletIndicator.tab.ui") %></a></li>
  </ul>
  
  <%-- Tab panes --%>
  <div class="tab-content">
  
    <%-- DATA --%>
    <% if (showDataTab) { %>
    <div class="tab-pane <%= isDataTabActive ? "active" : "" %>" id="metric">
  
      <jalios:field name="percentage" formHandler="<%= formHandler %>">
        <jalios:control settings='<%= new DefaultSettings().onChange("Ajax-Refresh") %>' />
      </jalios:field>
      
      <jalios:field name="value" formHandler="<%= formHandler %>">
        <jalios:control />
      </jalios:field>

      <% if (!isPercentage) { %>
      <jalios:field name="targetValue" formHandler="<%= formHandler %>">
        <jalios:control />
      </jalios:field>
      
      <jalios:field name="unit" formHandler="<%= formHandler %>">
        <jalios:control />
      </jalios:field>
      <% } %>
    
    </div>
    <% } %>
    
    <%-- INFORMATION --%>
    <div class="tab-pane <%= isInfoTabActive ? "active" : "" %>" id="info">
    
      <jalios:field name="label" formHandler="<%= formHandler %>">
        <jalios:control />
      </jalios:field>
      
      <jalios:field name="briefText" formHandler="<%= formHandler %>">
        <jalios:control />
      </jalios:field>
      
      <jalios:field name="linkType" formHandler="<%= formHandler %>"> 
        <jalios:control settings='<%= new DefaultSettings().onChange("Ajax-Refresh") %>' />
      </jalios:field>
       
      <% if (isContentLink) { %>
      <jalios:field name="publicationLink" formHandler="<%= formHandler %>">
        <jalios:control />
      </jalios:field>
      <% } %>
       
      <% if (isCategoryLink) { %>
      <jalios:field name="categorylink" formHandler="<%= formHandler %>">
        <jalios:control />
      </jalios:field>
      <% } %>      
      
      <% if (isContentLink || isCategoryLink) { %>
      <jalios:field name="linkLabel" formHandler="<%= formHandler %>">
        <jalios:control />
      </jalios:field>
      <% } %>
    </div>
    
        
    <%-- PRESENTATION --%>
    <div class="tab-pane" id="presentation">
    
      <% if (isDonut) { %>
      <jalios:field name="primaryColor" formHandler="<%= formHandler %>">
        <jalios:control />
      </jalios:field>
    
      <jalios:field name="secondaryColor" formHandler="<%= formHandler %>">
        <jalios:control />
      </jalios:field>
        
      <jalios:field name="animation" formHandler="<%= formHandler %>">
        <jalios:control />
      </jalios:field>
      <% } %>
 
      <% if (isCard) { %>
      <jalios:field name="picture" formHandler="<%= formHandler %>">
        <jalios:control />
      </jalios:field>
      <% } %>
    
    </div>

  </div>  
  

  <jalios:control settings='<%= new HiddenSettings().name("id").value(formHandler.getId()) %>' />

</jalios:modal>




