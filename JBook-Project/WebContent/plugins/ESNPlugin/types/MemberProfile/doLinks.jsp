<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file="/jcore/doInitPage.jspf" %><%
%><%@ include file='/plugins/ESNPlugin/types/MemberProfile/doInitMemberProfile.jspf' %><%

if (logger.isTraceEnabled()) { logger.trace("doLinks.jsp: start render"); }
if (!isLogged) {
  if (logger.isTraceEnabled()) { logger.trace("doLinks.jsp: nothing to render"); }
  return;
}

List<MemberLink> linkList = esnMgr.getMemberLinkList(member); 
boolean hasLinkSet = Util.notEmpty(linkList);

if (!hasLinkSet && !canEdit) {
  if (logger.isTraceEnabled()) { logger.trace("doLinks.jsp: nothing to render"); }
  return;
}
%>
<jsp:useBean id='formHandler' scope='page' class='com.jalios.jcmsplugin.esn.EditMemberLinkHandler'>
  <jsp:setProperty name='formHandler' property='request' value='<%= request %>'/>
  <jsp:setProperty name='formHandler' property='response' value='<%= response %>'/>
  <jsp:setProperty name='formHandler' property='*' />
  <jsp:setProperty name='formHandler' property='noRedirect' value='true'/>
</jsp:useBean>
<%
if (formHandler.validate()) { 
  // Refresh portlet's content
  HibernateUtil.commitTransaction();
  HibernateUtil.beginTransaction();
  linkList = esnMgr.getMemberLinkList(member);  
  hasLinkSet = Util.notEmpty(linkList);
}

String title = null;
if (isMyProfile) {
  title = glp("jcmsplugin.esn.lbl.links.me");
} else {
  title = glp("jcmsplugin.esn.lbl.links.other",member.getFriendlyName());
}
boolean showAdd = canEdit;
String redirectUrlSuffix = MessageFormat.format(
    "&redirect={0}",
    encodeForURL(profile.getDisplayUrl(userLocale) + "?esnProfileTab=" + getUntrustedStringParameter("esnProfileTab", "info")));
String addUrl = MessageFormat.format(
    "plugins/ESNPlugin/jsp/form/editLink.jsp?mid={0}{1}",
    member.getId(),
    redirectUrlSuffix);
boolean showAddTop = showAdd && hasLinkSet;
boolean showAddInner = showAdd && !hasLinkSet;
boolean showIntro = isMyProfile;
String addLabel = glp("jcmsplugin.esn.lbl.links.add");
String introLabel = glp("jcmsplugin.esn.lbl.links.intro" + (isMyProfile ? "" : ".other"));
String refreshUrl = "plugins/ESNPlugin/types/MemberProfile/doLinks.jsp";
String css = "profile-body-block profile-links";
css += " ajax-refresh-div";
%>
<div id="profile-links" class="<%= css %>" data-jalios-ajax-refresh-url="<%= refreshUrl %>">
  <div class="section-title esn-component-header"<%
      %> role="<%= ESNHTMLConstants.HEADING_ROLE %>"<%
      %> aria-level="3"><%
    %><%-- ADD (when list is NOT empty --%><%
    if (showAddTop) {
      %><jalios:buffer name="addLinkTopBuffer"><%
        %><jalios:icon src="jcmsplugin-esn-profile-add" /><%
        %>&nbsp;<%= addLabel %><%
      %></jalios:buffer><%
      out.print(new Link()
        .css("btn btn-default btn-xs esn-action modal edit-link")
        .href(addUrl)
        .htmlContent(addLinkTopBuffer.toString())
        .html());
    }
    %><%= title %><%
  %></div><%
  if (!hasLinkSet) {
    %><%-- ADD (when list is empty) --%><%
    if (showAddInner) {
      %><jalios:message title="" dismissable="false"><%
        %><p class="br"><%= introLabel %></p><%
        %><jalios:buffer name="addLinkInnerBuffer"><%
          %><jalios:icon src="jcmsplugin-esn-profile-add" /><%
          %>&nbsp;<%= addLabel %><%
        %></jalios:buffer><%
        out.print(new Link()
          .css("btn btn-default modal edit-link")
          .href(addUrl)
          .htmlContent(addLinkInnerBuffer.toString())
          .html());
      %></jalios:message><%
    }
  } else { %>
    <jalios:pager name='pagerHandler' declare='true' action='init' pageSize='5' size='<%= linkList.size() %>' paramPrefix="esnProfileContactReferrers-"/>
    <jalios:list css="links">
      <jalios:foreach collection="<%= linkList %>" name="link" type="MemberLink" max="<%= pagerHandler.getPageSize() %>" skip="<%= pagerHandler.getStart() %>">
        <%
        if (logger.isTraceEnabled()) { logger.trace("doLinks.jsp: start render of MemberLink: " + JcmsUtil.dataToString(link)); }
        %>
        <%
        boolean canDelete = link.checkDelete(loggedMember).isOK();
        String editUrl = MessageFormat.format(
            "plugins/ESNPlugin/jsp/form/editLink.jsp?mid={0}&id={1}{2}",
            member.getId(),
            link.getId(),
            redirectUrlSuffix);
        String deleteUrl = MessageFormat.format(
            "plugins/ESNPlugin/types/MemberProfile/doLinks.jsp?id={0}&opDelete=true",
            link.getId());
        String listItemHtmlAttributes = "";
        boolean isSiteUrl = Util.notEmpty(link.getUrl()) && link.getUrl().startsWith(channel.getUrl());
        if (!isSiteUrl) {
          listItemHtmlAttributes += "target=\"_blank\" rel=\"noreferrer\"";
        }
        %>
        <jalios:buffer name='linkTextBuffer'>
          <%= link.getTitle() %>
          <% if (Util.notEmpty(link.getDescription())) { %>      
          <span class="itemlist-item-meta link-description description">
          <%= link.getDescription() %>
          </span>
          <% } %>
        </jalios:buffer>
        <jalios:listItem css="has-action"
                link="<%= link.getUrl() %>" 
                linkHtmlAttributes="<%= listItemHtmlAttributes %>"
                text='<%= linkTextBuffer.toString() %>'>
          
          <%-- Do NOT render data's date, override META with empty DOM --%>
          <jalios:buffer name='LIST_ITEM_META'>&nbsp;</jalios:buffer>

          <jalios:buffer name='LIST_ITEM_IMAGE'>
            <span class="itemlist-item-icon">
              <jalios:icon src="<%= FaviconManager.getInstance().getIcon(link.getUrl()) %>" css="jalios-icon-sm" />
            </span>          
  				</jalios:buffer>

          <jalios:buffer name='LIST_ITEM_ACTIONS'><%
            if (canEdit || canDelete) {
              %><div class="itemlist-item-actions"><%
              if (canEdit) {
                %><jalios:buffer name="editLinkBuffer"><%
                  %><jalios:icon src="glyph:icomoon-pencil" alt="" /><%
                %></jalios:buffer><%
                out.print(new Link()
                  .ariaLabel(glp("jcmsplugin.esn.lbl.links.edit.for-aria-label",
                      link.getTitle()))
                  .css("modal itemlist-item-actions")
                  .href(editUrl)
                  .htmlContent(editLinkBuffer.toString())
                  .html());
              }
              if (canDelete) {
                %><jalios:buffer name="deleteLinkBuffer"><%
                  %><jalios:icon src='jcmsplugin-esn-data-list-item-delete'
                       css="jalios-icon-sm hover-action" alt="" /><%
                %></jalios:buffer><%
                out.print(new Link()
                  .ariaLabel(glp("jcmsplugin.esn.lbl.links.delete.for-aria-label",
                      link.getTitle()))
                  .css("itemlist-item-actions ajax-refresh confirm")
                  .href(deleteUrl)
                  .htmlContent(deleteLinkBuffer.toString())
                  .html());
              }
              %></div><%
            }
          %></jalios:buffer><%
        %></jalios:listItem><%
        %>
        <%
        if (logger.isTraceEnabled()) { logger.trace("doLinks.jsp: end render of MemberLink: " + JcmsUtil.dataToString(link)); }
        %>
      </jalios:foreach>
    </jalios:list>
    <jalios:pager name='pagerHandler' template="pqf"/>
  <% } %>
  <%@ include file='/jcore/doAjaxFooter.jspf' %>
</div>
<%
if (logger.isTraceEnabled()) { logger.trace("doLinks.jsp: end render"); }
%>