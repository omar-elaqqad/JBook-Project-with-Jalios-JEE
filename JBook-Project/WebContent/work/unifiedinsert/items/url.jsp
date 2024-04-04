<%@ page import="com.jalios.jcms.unifiedinsert.*" %><%
request.setAttribute(InsertionContext.UNIFIED_INSERT_ATTR, Boolean.TRUE);
%><%@ include file='/jcore/doInitPage.jspf' %><%

InsertionContext.addScripts(jcmsContext, request);
jcmsContext.addJavaScript("js/jalios/ux/jalios-unifiedinsert-url.js");

%><%@ include file='/jcore/doEmptyHeader.jspf' %>
<div class="navbar-placeholder"></div>
<form id="urlForm" name="urlForm" action="work/unifiedinsert/items/url.jsp" method="post" class="form-horizontal">

  <%-- NAVBAR --%>
  <div class="mb-nav navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container-fluid">
      <ul class="nav navbar-form navbar-nav navbar-right">      
        <li>
          <button type="submit" name="opValidate" value="true" class='btn btn-primary <%= Util.getString(request.getAttribute(InsertionContext.UNIFIED_INSERT_TRIGGER_CLASS_ATTR), "unifiedinsert-media") %>'>
            <%= glp("ui.com.btn.validate-close") %>
          </button>
        </li>
      </ul>   
    </div>
  </div>

  <%-- FORM INPUTS --%>
  <div class="container-fluid">
     <jalios:field name="url" label="ui.com.lbl.url" description="unified-insert.items.url.description" resource="field-vertical">
       <jalios:control settings='<%= new UrlSettings().id("sourceUrl") %>'/>
     </jalios:field>
  </div>      

  <%-- PREVIEW --%>
  <div class="container-fluid">
    <iframe id="previewIFrame" style="width:100%; overflow:hidden"
           src="s.gif" allowfullscreen frameborder="0"></iframe>    
  </div>
</form>
<%@ include file='/jcore/doEmptyFooter.jspf' %>