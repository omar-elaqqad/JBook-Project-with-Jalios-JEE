<%@ include file="/front/card/data/doInitCardData.jspf" %><%
Member mbr = (Member) data;
%>
<jalios:card css="card-search" link="<%= link %>" linkOptions="<%= linkOptions %>" dataAttribute="<%= dataAttribute %>" resource="card.jmobile">
  <jalios:memberphoto size="<%= PhotoSize.SMALL %>" member="<%= mbr %>" resource="memberphoto-phone" link="false"/>
  <jalios:cardBlock>
    <div class="card-title"><%= mbr.getFullName() %></div>
    <% if (Util.notEmpty(mbr.getJobTitle())) { %>
      <div class="member-meta member-job-title"><%= mbr.getJobTitle() %></div>
    <% } %>
    <% if (Util.notEmpty(mbr.getOrganization())) { %>
      <div class="member-meta member-organization"><%= mbr.getOrganization() %></div>
    <% } %>
  </jalios:cardBlock>
  <%= getIncludeString("CARD_BOTTOM", "") %>
</jalios:card>



  
