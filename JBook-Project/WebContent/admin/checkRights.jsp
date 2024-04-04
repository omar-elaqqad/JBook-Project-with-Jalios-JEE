<%@ include file='/jcore/doInitPage.jspf' %><%

%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.handler.CheckRightsHandler'><%
  %><jsp:setProperty name="formHandler" property="pageContext" value="<%= pageContext %>"/><%
  %><jsp:setProperty name='formHandler' property='*' /><%
%></jsp:useBean><%

if (formHandler.validate()) {
  return;
}

jcmsContext.addCSSHeader("css/jalios/ux/jalios-checkrights.css");
%>
<jalios:modal title="right-info.checker.title" 
              url="admin/checkRights.jsp" 
              formHandler="<%= formHandler %>" 
              css="modal-lg check-rights"
              picture="">
              
              
  <%-- DATA CHOOSER --%>
  <table class="layout">
    <tr>
      <td>
        <jalios:field label="ui.com.lbl.member" name="member" css="accountOnly" resource="field-vertical">
          <jalios:control settings="<%= formHandler.getMemberSettings() %>" />
        </jalios:field> 
      </td>
      <td>
         <jalios:field label="right-info.checker.lbl.right" name="right" resource="field-vertical">
          <jalios:control settings="<%= formHandler.getRightSettings() %>" />
        </jalios:field>
      </td>
      <td>
        <jalios:field  label="ui.com.lbl.publication" name="data" resource="field-vertical">
          <jalios:control settings='<%= formHandler.getPublicationSettings() %>' />
        </jalios:field>                            
      </td>
    </tr>
  </table>

  
  <%-- RIGHT EXPLANATION --%>
  <% if (formHandler.showExplanationMessage()) { %>
  <div class="result">
    <%
    boolean isAuthorized = formHandler.isAuthorized();
    String access = isAuthorized ? "access-granted" : "access-denied"; 
    %>
    <div class="access <%= access %>">
      <% if (isAuthorized) { %><jalios:icon src="right-ok" /><% } else { %><jalios:icon src="right-ko" /><% } %>            
      <%= glp("right-info.explanation." + access) %>
    </div>
    <div class="explanation">
    <%= formHandler.getExplanationMessage() %>
    </div>
  </div>
  <% } %>
  
  <input type="hidden" name="opCheck" value="true"/>
  
  <jalios:buffer name="MODAL_BUTTONS" >
    <button type="button" name="opClose" class="btn btn-default" data-dismiss="modal"><%= glp("ui.com.btn.close") %></button>  
  </jalios:buffer> 
  
  
          
</jalios:modal>
