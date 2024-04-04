<%@page import="com.jalios.jcms.tracking.*"%><%
%><%@ include file="../../front/card/data/doInitCardData.jspf" %><%
Member member = (Member) data;
jcmsContext.addCSSHeader("css/jalios/core/components/card/jalios-card-member-small.css");
String linkAttributes = "";
if(link != null) {
  linkAttributes = " data-jalios-action=\"clickable\" data-jalios-url=\"" + link + "\""; 
  linkAttributes += linkOptions != null ? " data-jalios-options='" + HttpUtil.encodeForHTMLAttribute(linkOptions.toJSON()) + "'" : "";
}

Date readDate = (Date) request.getAttribute("recommendation-read-date");
ReaderTracker readerTracker = (ReaderTracker) request.getAttribute("recommendation-reader-tracker");
request.setAttribute("card.member", member);
Publication recommendedPub = readerTracker != null ? (Publication) readerTracker.getPublication() : null;

// JCMS-8704 - filter by read ack
Date readAckDate = null;
boolean showDataReadAck = false;
if (recommendedPub != null) {
  boolean isReadAckAllowed = ReaderTrackerManager.getInstance().isReadAckAllowed(recommendedPub.getClass());
  showDataReadAck = isReadAckAllowed && readerTracker.hasBeenAck();
  if (showDataReadAck) {
    readAckDate = readerTracker.getAckDate();
  }
}
%>
  <div class="<%= css %> card card-member card-member-small" <%= linkAttributes %> data-jalios-dataid="<%= member.getId() %>" <%= dataAttribute != null ? " " + dataAttribute.toString() : "" %>>
    <jalios:cardBlock>
      <jalios:memberphoto link="false" showStatus="false" member="<%= member %>" size="<%= PhotoSize.TINY %>"/>
      <div class="card-block-item card-block-item-title">
        <div class="card-title member-name">
          <% if (member.canBeReadBy(loggedMember)) {
            %><%= member.getFullName() %><%
          } else {
            %><%= glp("ui.com.lbl.restricted-mbr") %><%
          } %>
        </div>
      </div>
      <% if (readDate != null || readAckDate != null) { %>
        <div class="card-block-item read-dates">
          <% if (readDate != null) { %>
	          <div class="date read-date">
              <%= glp("ui.recommendation.modal.lbl.read") %>
              <%= JcmsUtil.getFriendlyDate(getZonedDateTime(readDate), java.time.format.FormatStyle.SHORT, true, userLocale) %>
            </div>
          <% } %>
          <% if (readAckDate != null) { %>
            <div class="date read-ack-date">
              <%= glp("ui.com.lbl.readAck.y") %>
              <%= JcmsUtil.getFriendlyDate(getZonedDateTime(readAckDate), java.time.format.FormatStyle.SHORT, true, userLocale) %>
            </div>
          <% } %>
        </div>
      <% } %>
    </jalios:cardBlock>
  </div>
<%
request.removeAttribute("card.member");
%>