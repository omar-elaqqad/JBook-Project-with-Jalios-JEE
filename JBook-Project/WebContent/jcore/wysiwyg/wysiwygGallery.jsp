<%
if (!Util.toBoolean(request.getAttribute("wysiwyg.include"), false)) {
  return;
}

request.setAttribute("CheckCSRF", Boolean.TRUE);
%><%@ include file='/jcore/doInitPage.jspf' %><%

  String qs = getUntrustedStringParameter("query","");
  String cids = getStringParameter("cids", "", "^[a-zA-Z0-9_ ]*$");
  if (Util.notEmpty(cids)){
    qs = "cids=" + Util.join(Util.split(cids," "), "&cids=");
  }
  
  if (Util.isEmpty(qs)){
    return;
  }
  
  qs += "&types=com.jalios.jcms.FileDocument&documentKinds=image";
  
  com.jalios.jcms.handler.QueryHandler handler = new com.jalios.jcms.handler.QueryHandler(qs, request);
  handler.setAttribute(QueryFilter.PORTLET_QUERY, Boolean.TRUE); 
  handler.setLoggedMember(loggedMember);
  handler.setResponse(response);
  QueryResultSet qrSet = handler.getResultSet();
  
  int width  = getIntParameter("width",  108);
  int height = getIntParameter("height", 108);
%>
<div class="gallery wysiwyg-gallery lightbox-img-gallery row">
<%
  // Split to rectangular table
  int count = qrSet.getTotalSize() > 16 ? qrSet.getTotalSize() : 16;
  int cols  = (int) Math.round(Math.sqrt(count+1)); 
  Iterator it = qrSet.iterator();
  for (int i = 0 ; (i < count || i%cols != 0) && it.hasNext(); i++) {
    Publication itPub = (Publication) it.next();%>
    <div class="col-md-3 wysiwyg-gallery-img">
    <% if (Util.notEmpty(itPub.getDataImage())) { %>
      <jalios:media data="<%= itPub %>" />
    <% } else { %>
      <img src="s.gif" width='<%= width %>' height='<%= height %>' alt="" />
    <% } %>
    </div>
<% } %>
</div>