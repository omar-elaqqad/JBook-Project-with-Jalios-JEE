<%--
  @Summary: JSP used in a popup window to provide wysiwyg edition of the content
            of the textarea referenced by 'targetInputId' field.
            Parameter 'targetInputId' is required 
            - 'targetInputId' is the DOM element ID of the opener in which to retrieve the content to edit//update
            - 'configId'  is parameter is optionnal (default is to use "default")

--%><%@ page contentType="text/html; charset=UTF-8"%><%

  final String targetInputId = getChooserParameter("targetInputId");
  if (Util.isEmpty(targetInputId)) {
    return;
  }
  final String configId = getAlphaNumParameter("configId", "default");

%><%@ include file='/jcore/doInitPage.jspf' %><%

  jcmsContext.addJavaScript("js/jalios/core/wysiwyg/jalios-wysiwyg-popup.js");

%><%@ include file='/jcore/doEmptyHeader.jspf' %>
<form name="editForm" class="wysiwyg-popup-edit" style="overflow:hidden;" data-target-input-id="<%= encodeForHTMLAttribute(targetInputId) %>">
 <div class="container-fluid">
  <div style="padding: 6px">
     <button class="btn btn-primary" id="validate-btn" onclick="return false;"><%= glp("ui.com.btn.validate-close") %></button>
     <button class="btn btn-default" id="close-btn" onclick="return false;"><%= glp("ui.com.btn.cancel") %></button>
  </div>  
  <div class="row">
   <jalios:field name="content" ml="false" resource="field-inline">
     <jalios:control settings='<%= new WysiwygSettings().configurationId(configId) %>' />
   </jalios:field>
  </div>  
 </div>
</form>

<%@ include file='/jcore/doEmptyFooter.jspf' %>
