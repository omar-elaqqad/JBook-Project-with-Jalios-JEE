<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
  EditPortletPublicationHandler formHandler = (EditPortletPublicationHandler)request.getAttribute("formHandler");
  Publication pub = (Publication) getPublicationParameter("pub");
  String template = "";
  if (Util.isEmpty(pub) && Util.notEmpty(formHandler)) {
    pub = formHandler.getAvailablePub();
    template = formHandler.getAvailableTemplate();
  }
%>
<div class="ajax-refresh-div publication-template" data-jalios-ajax-refresh-url="types/PortletPublication/updatePublicationTemplate.jsp">

  <% if (Util.notEmpty(formHandler)) { %>
    <jalios:field name="pub" formHandler="<%= formHandler %>">
      <jalios:control settings='<%= new PublicationSettings().dataAttribute("jalios-event", "change").dataAttribute("jalios-action", "ajax-refresh") %>' />
    </jalios:field>
  <% } else if (Util.notEmpty(pub)) { %>
    <jalios:field required="true" label="types.PortletPublication.fields.pub.label" name="pub" value="<%= pub %>">
      <jalios:control settings='<%= new PublicationSettings().dataAttribute("jalios-event", "change").dataAttribute("jalios-action", "ajax-refresh") %>' />
    </jalios:field>
  <% } else { %>  
    <jalios:field required="true" label="types.PortletPublication.fields.pub.label" name="pub">
      <jalios:control settings='<%= new PublicationSettings().dataAttribute("jalios-event", "change").dataAttribute("jalios-action", "ajax-refresh") %>' />
    </jalios:field>
  <% } %>

  
  <%-- Template ------------------------------------------------------------ --%>
  <% if (Util.notEmpty(pub)) { %>
    <%
      List<String> enumLabels = new ArrayList<>();
      List<String> enumValues = new ArrayList<>();
      TypeEntry typeEntry = channel.getTypeEntry(pub.getClass());
      if (Util.notEmpty(typeEntry.getTemplateEntrySet())) {
        for (TypeTemplateEntry itTemplateEntry : typeEntry.getTemplateEntrySet()) {
          if (itTemplateEntry.getUsage().equals(TypeTemplateEntry.USAGE_DISPLAY_FULL)) {
            enumLabels.add(itTemplateEntry.getLabel(userLang));
            enumValues.add(itTemplateEntry.getName());          
          }
        }
        if (Util.isEmpty(template)) {
          template = enumValues.get(0);
        }
    %>  
        <jalios:field required="true" name="template" label="types.PortletPublication.fields.template.label" value ='<%= template %>'>
          <jalios:control settings='<%= new EnumerateSettings().select().enumLabels(enumLabels).enumValues(enumValues) %>' />
        </jalios:field><% 
      } else {
        %><input type="hidden" name="template" value="" /><% 
      }
    } 
  %>            
</div>