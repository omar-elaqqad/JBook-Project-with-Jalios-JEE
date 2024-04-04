<%--
  @Summary: FAQ display template
  @Category: Core Type / FAQ
  @Deprecated: False
  @Customizable: True
  @Requestable: True
--%>
<%
%><%@ include file="/jcore/doInitPage.jspf" %><%
jcmsContext.addCSSHeader("css/jalios/core/jalios-faq-fulldisplay.css");
jcmsContext.addJavaScript("js/jalios/core/jalios-faq-fulldisplay.js");

Faq obj = (Faq)request.getAttribute("publication");
boolean printView = (request.getAttribute("printView") != null) || (hasParameter("printView"));
boolean isPreview = getBooleanParameter("preview", false);
boolean canEdit = !printView && channel.isDataWriteEnabled() && jcmsContext.isEditIcon() && loggedMember.canPublish(FaqEntry.class, workspace);
String faqEntryAnchor = getStringParameter("faqEntryId","", "[a-zA-Z0-9-_]*");

DataSelector authorizedSelector = new Publication.AuthorizedSelector(loggedMember);
DataSelector selector = isPreview ? authorizedSelector : new AndDataSelector(authorizedSelector, new Publication.VisibleStateSelector());
%>
<div id="faq-fulldisplay-<%= obj.getId() %>" class="fullDisplay Faq" itemscope="itemscope">
  <div class="publication-header">
    <h1 class="publication-title" itemprop="name"><%= obj.getTitle(userLang) %></h1>
  </div>

  <% if (Util.notEmpty(obj.getDescription())) { %>
  <div class="description abstract">
    <jalios:wiki data="<%= obj %>" field="description"><%= obj.getDescription(userLang) %></jalios:wiki>
  </div>
  <% } %>
  <jalios:query name="entrySet"
                dataset="<%= obj.getLinkIndexedDataSet(FaqEntry.class) %>"
                comparator="<%=  new custom.CustomEditFaqEntryHandler.OrderComparator() %>"
                selector="<%= selector %>"/>
  <%-- *** QUESTION / ANSWER LIST ************************************* --%>
  <div class='<%= canEdit ? "faq-layout" : "" %>'>
    <% int index = 0; %>
    <jalios:foreach name="itEntry" type="FaqEntry" collection="<%= entrySet %>">
      <div class="faq-entry-layout" data-faq-entry-id="<%= itEntry.getId() %>">
        <a class="anchor" id="<%= itEntry.getId() %>"></a>
        <jalios:accordion>
          <% 
            boolean active = itEntry.getId().equals(faqEntryAnchor) ? true : false;
          %>
          <jalios:accordion-panel active='<%= active %>'>
            <jalios:buffer name="PANEL_HEADING">
              <div class='panel-actions collapse-action<%= active ? " dropup" : "" %>'><jalios:icon css="accordion-collapse" src="chevron-up" /><jalios:icon css="accordion-expand" src="chevron-down" /></div>
              <div class="panel-title">
                <a href="<%= itEntry.getDisplayUrl(userLocale) %>" onclick="return false;">
                  <%= itEntry.getTitle(userLang) %>
                </a>
              </div>
              <% if (isLogged) { %>
                <div class="entry-actions">
                  <% if (canEdit) { %>
                    <% String iconTitle = encodeForHTMLAttribute(glp("ui.faq.entry.drag-and-drop.title")); %>
                    <a class="entry-sortable btn btn-rounded" href="#" title="<%= iconTitle %>" onclick="return false;">
                      <jalios:icon src="drag-and-drop" alt="<%= iconTitle %>"/>
                    </a>
                  <% } %>
                  <% request.setAttribute("faq-entry", itEntry); %>
                  <jalios:include jsp="front/publication/doFaqEntryActions.jsp" />
                  <% request.removeAttribute("faq-entry"); %>    
                </div>    
              <% } %>  
            </jalios:buffer>
            <jalios:wiki css="faq-answer" field="answer" data="<%= itEntry %>"><%= itEntry.getAnswer(userLang) %></jalios:wiki>
          </jalios:accordion-panel>
        </jalios:accordion>
      </div>
    </jalios:foreach>
  </div>
   
  <% if (canEdit) { %>
    <div class='newEntry editArea <%= jcmsContext.showEditIcon() ? "" : "hidden" %>'>
      <a class="modal btn btn-default" onclick="return false" href="types/FaqEntry/editFaqEntryModal.jsp?faq=<%= obj.getId() %>" title='<%= encodeForHTMLAttribute(glp("ui.com.alt.edit")) %>'>
        <jalios:icon src="add" alt="+" /> <%= glp("ui.faq.lbl.add-entry") %>
      </a>
    </div>
  <% } %>
</div>