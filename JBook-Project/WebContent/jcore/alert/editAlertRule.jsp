<%@ include file="/jcore/doInitPage.jspf" %><%
%><%@ page import='com.jalios.jcms.alert.*' %><%
%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.alert.EditAlertRuleHandler'><%
 %><jsp:setProperty name='formHandler' property='request' value='<%=request%>' /><%
 %><jsp:setProperty name='formHandler' property='response' value='<%=response%>' /><%
 %><jsp:setProperty name='formHandler' property='*' /><%
 %><jsp:setProperty name='formHandler' property='noRedirect' value='<%= true %>' /><%
%></jsp:useBean>

<% if(formHandler.validate()) { %>
  <% if (formHandler.isTableUpdate()) { %>
    <script>
    jQuery.jalios.ui.Modal.close(false);
    addAlertRule(<%= formHandler.getNewAlertRuleData() %>);
    </script>
  <% } else { %>
  <%@ include file="/jcore/modal/modalRedirect.jspf" %>
  <% } %>
<% } %>

<jalios:modal title="alert.edit-rule.title" 
              url="jcore/alert/editAlertRule.jsp"
              formHandler="<%= formHandler %>" 
              op="<%= formHandler.getOpMode() %>"
              button="<%= formHandler.getButtonLabel() %>"
              css="modal-lg edit-alert-rule"
              picture="">

  <%-- ALERT DOMAIN --%>
  <jalios:field name="alertDomain" label="alert.edit-rule.lbl.alert-domain">
    <jalios:control settings="<%= formHandler.getAlertDomainSettings() %>"/>
  </jalios:field>

  <%-- ALERT NAME --%>
  <jalios:field name="alertName" label="alert.edit-rule.lbl.alert-name">
    <jalios:control settings="<%= formHandler.getAlertNameSettings() %>"/>
  </jalios:field>
                  
                  
  <%-- ALERT LEVEL --%>
  <% if (formHandler.showLevel()) { %>
  <jalios:field name="alertLevel" label="alert.edit-rule.lbl.alert-level">
    <jalios:control settings="<%= formHandler.getAlertLevelSettings() %>"/>
  </jalios:field>
  <% } %>

  <%-- ALERT RECEIVE --%>
  <jalios:field name="alertReceive" label="alert.edit-rule.lbl.alert-receive">
    <jalios:control settings="<%= formHandler.getAlertReceiveSettings() %>"/>
  </jalios:field>
  
  
  <%-- ALERT CHANNELS --%>
  <jalios:field name="alertChannels" label="alert.edit-rule.lbl.alert-channels">
    <jalios:control settings="<%= formHandler.getAlertChannelSettings() %>"/>
  </jalios:field>
  
  <%-- BUTTONS --%>
  <% if (formHandler.showViewRules()) { %>
  <jalios:buffer name="MODAL_BUTTON" >
    <a class="btn btn-default" href="jcore/alert/app/alertApp.jsp?editAlertRules=true"><%= glp("alert.edit-rule.btn.show-rules") %></a>
  </jalios:buffer> 
  <% } %>

</jalios:modal>