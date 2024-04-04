<%--
  @Summary: The page returned when processing a forbidden action
  @Category: Internal
  @Author: Oliver Dedieu
  @Copyright: Jalios SA
  @Customizable: True
  @Requestable: True
  @Deprecated: False
  @Since: jcms-2.1
--%>
<%@ include file='/jcore/doInitPage.jspf' %>
<%@ include file='/jcore/doHeader.jspf' %>
<div class="col-md-8 col-md-offset-2 forbidden-message">
  <%@ include file='/jcore/doMessageBox.jspf' %>
</div>
<%@ include file='/jcore/doFooter.jspf' %>