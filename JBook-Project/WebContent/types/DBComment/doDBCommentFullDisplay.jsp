<%@ include file='/jcore/doInitPage.jspf' %>
<% 
 DBComment obj = (DBComment)request.getAttribute("publication");
 if (Util.toBoolean(request.getAttribute("work-version"), false)) { %>
 <%= obj.getDescription() %>
 <% }
 else
 {
   Data target = obj.getTargetContent();
   String urlSuffix = "";
   if (target instanceof FileDocument) {
     urlSuffix += "?details=true";
     urlSuffix += "&amp;targetComment=" + obj.getId();
   } else {
     urlSuffix += "?targetComment=" + obj.getId();
   }
   urlSuffix += "#" + obj.getId();
   if (target != null) {
     jcmsContext.sendRedirect(target.getDisplayUrl(userLocale) + urlSuffix);
   }
   return;   
 } %>