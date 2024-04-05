<%@ include file='/plugins/SmartPhonePlugin/jsp/common/header.jspf' %> 
<div id="forbidden" data-role="page">
  <div data-role="content">
    <jalios:message level="<%= MessageLevel.WARN %>" dismissable="false" msg="jcmsplugin.smartphone.lbl.forbidden"/>
  </div>
</div>
<%@ include file='/plugins/SmartPhonePlugin/jsp/common/footer.jspf' %>