<%@page import="com.jalios.jcms.alert.Alert"%><% 
%><%@ include file='/plugins/SmartPhonePlugin/jsp/common/header.jspf' %><%--
--%><%@ page import="com.jalios.jcms.recommendation.*" %><%--
--%><%
if (!isLogged) {
  sendForbidden(request, response);
  return;
} 
RecommendationManager recoMgr = RecommendationManager.getInstance();
Data recommendedData = getDataParameter("recommendedDataId"); 
if (recommendedData == null) {
  return;
}

%><%
%><jsp:useBean id='formHandler' scope='page' class='com.jalios.jcms.recommendation.RecommendationHandler'><%
%><jsp:setProperty name='formHandler' property='request' value='<%= request %>'/><%
%><jsp:setProperty name='formHandler' property='response' value='<%= response %>'/><%
%><jsp:setProperty name='formHandler' property='*' /><%
%><jsp:setProperty name='formHandler' property='noRedirect' value='true'/><%
%></jsp:useBean>
<div id="pub-action-recommend" data-role="page" class="pub-action-recommend-page" >
<% 
if (formHandler.validate()) { %><% 
  %><script>
  jQuery.mobile.changePage( "<%= smartPhoneManager.getDataUrl(recommendedData) %>");
  jQuery.jalios.smartPhone.Toastr.show("<%= glp("ui.recommendation.modal.info.success") %>");
</script><% 
%></div><%
  return;
} 
%>

  <div class="pub-action-recommend-content" data-role="content">
    <%@ include file='/plugins/SmartPhonePlugin/jsp/core/doMessageBox.jspf' %>
    <form action="plugins/SmartPhonePlugin/jsp/action/recommendation.jsp?recommendedDataId=<%= recommendedData.getId() %>" method="POST">
      <jalios:field css="recommendation-level-wrapper ui-btn-alert-level-info" resource="<%= SmartPhoneConstants.FIELD_PROP %>" label="ui.recommendation.modal.lbl.alert-level">
        <% String alertLevelKey = formHandler.getAvailableAlertLevelKey(); %>
        <select name="alertLevelKey" class="recommendation-level-select">
          <% for (Alert.Level itLevel: Alert.Level.values()) { %>
            <option data-jalios-ui-btn-recommendation-level="ui-btn-alert-level-<%= itLevel.getKey() %>" class="alert-level-<%= itLevel.getKey() %>" value="<%= itLevel.getKey() %>" <%= itLevel.getKey().equals(alertLevelKey) ? "selected='selected'" : ""  %>><%= itLevel.getLabel(userLang) %></option>
          <% } %>
        </select>
      </jalios:field>
      
      <jalios:field resource="<%= SmartPhoneConstants.FIELD_PROP %>" name="members" value='<%= formHandler.getAvailableMemberSet() %>' label="ui.com.lbl.members" keyword="true">
        <jalios:control resource="<%= SmartPhoneControlType.CHOOSER.getResource() %>" settings='<%= new MemberSettings().filter(MemberSettings.MemberFilter.ACCOUNT).placeholder("jcmsplugin.smartphone.recommendation.placeholder.members") %>' />
      </jalios:field>
      
      <jalios:field resource="<%= SmartPhoneConstants.FIELD_PROP %>" name="groups" value='<%= formHandler.getAvailableGroupSet() %>' label="ui.com.lbl.groups" keyword="true">
        <jalios:control resource="<%= SmartPhoneControlType.CHOOSER.getResource() %>" settings='<%= new GroupSettings().placeholder("jcmsplugin.smartphone.recommendation.placeholder.groups") %>' />
      </jalios:field>    
                  
      <jalios:field resource="<%= SmartPhoneConstants.FIELD_PROP %>" name="message" value='<%= formHandler.getAvailableMessage() %>' label="ui.recommendation.modal.lbl.message">
        <jalios:control settings='<%= new WikiAreaSettings().rows(2) %>' resource="<%= SmartPhoneControlType.WIKIAREA.getResource() %>"/>
      </jalios:field>
      
      <jalios:field resource="<%= SmartPhoneConstants.FIELD_PROP %>" name="sendCopy" value='<%= formHandler.getAvailableSendCopy() %>' label="ui.recommendation.modal.lbl.send-copy">
        <jalios:control resource="<%= SmartPhoneControlType.FLIPSWITCH.getResource() %>" type="<%= ControlType.BOOLEAN %>" />
      </jalios:field>
      
      <% if (!JcmsUtil.isSameId(recommendedData.getAuthor(),loggedMember)) { %>
        <jalios:field resource="<%= SmartPhoneConstants.FIELD_PROP %>" name="sendToAuthor" value='<%= formHandler.getAvailableSendToAuthor() %>' label="ui.recommendation.modal.lbl.send-to-author">
          <jalios:control resource="<%= SmartPhoneControlType.FLIPSWITCH.getResource() %>" type="<%= ControlType.BOOLEAN %>" />
        </jalios:field>
      <% } %>
      <input type="hidden" name="recommendedDataId" value="<%= recommendedData.getId() %>"/>
      <button type="submit" class="ui-shadow btn-primary ui-btn ui-corner-all" name="opSend" value="true"><%= glp("ui.com.btn.submit") %></button>
    </form>
  </div>
</div>
<%@ include file='/plugins/SmartPhonePlugin/jsp/common/footer.jspf' %>