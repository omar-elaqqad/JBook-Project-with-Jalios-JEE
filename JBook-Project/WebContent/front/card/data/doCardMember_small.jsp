<%@ include file="/front/card/data/doInitCardData.jspf" %><%
Member member = (Member) data;
boolean memberCanBeRead = member.canBeReadBy(loggedMember);

jcmsContext.addCSSHeader("css/jalios/core/components/card/jalios-card-member-small.css");
String linkAttributes = "";
if(link != null) {
  linkAttributes = " data-jalios-action=\"clickable\" data-jalios-url=\"" + link + "\""; 
  linkAttributes += linkOptions != null ? " data-jalios-options='" + HttpUtil.encodeForHTMLAttribute(linkOptions.toJSON()) + "'" : "";
}

String email = member.getEmail();
boolean showEmail = memberCanBeRead && Util.notEmpty(email) && (member.isEmailVisible() || isAdmin);
boolean hasPhone = memberCanBeRead && Util.notEmpty(member.getPhone());
boolean hasMobile = memberCanBeRead && Util.notEmpty(member.getMobile());

boolean showCardBack = memberCanBeRead && (showEmail || hasPhone || hasMobile);

String jobTitle = member.getJobTitle();
String organization = member.getOrganization();

boolean showTitleOrganizationBlock = memberCanBeRead && (Util.notEmpty(jobTitle) || Util.notEmpty(organization));

request.setAttribute("card.member", member);
%>
<div class="card-flip-wrapper card-flip-wrapper-member-small">
  <div class="<%= css %> card card-member card-member-small" <%= linkAttributes %> data-jalios-dataid="<%= member.getId() %>" <%= dataAttribute != null ? " " + dataAttribute.toString() : "" %>>
    <jalios:cardFront>
      <div class="card-block">
        <jalios:memberphoto link="false" showStatus="false" member="<%= member %>" size="<%= PhotoSize.TINY %>"/>
        <div class="card-block-item card-block-item-title">
          <div class="card-title member-name">
            <%= memberCanBeRead ? member.getFullName() : glp("ui.com.lbl.restricted-mbr") %>
          </div>
        </div>
        <% if (showTitleOrganizationBlock) { %>
          <div class="card-block-item">
            <% if (Util.notEmpty(jobTitle)) { %>
              <div class="member-job-title"><%= member.getJobTitle() %></div>
            <% } %>
            <% if (Util.notEmpty(organization)) { %>
              <div class="member-organization"><%= member.getOrganization() %></div>
            <% } %>
          </div>
        <% } %>
        <% if (showCardBack) { %>
          <jalios:cardFlipper css="pull-right btn btn-link" />
        <% } %>
      </div>
    </jalios:cardFront>
    <% if (showCardBack) { %>
      <jalios:cardBack mode="<%= CardBackMode.FLIP_HOVER %>">
        <div class="card-block">
          <div class="card-block-item">
             <jalios:include target="CARD_MEMBER_SMALL_BACK_TOP" />
             
            <%-- E-mail --%>
            <% if (showEmail) { %>
              <div class="member-email"><a itemprop="email" href='mailto:<%= encodeForHTMLAttribute(email) %>'><jalios:icon src="mail" /> <%= email %></a></div>
            <% } %>            
            
            <%-- Phone --%>
            <% if (Util.notEmpty(member.getPhone())) { %>
              <div class="member-phone">
                <jalios:icon src="telephone" /> <jalios:phone number="<%= member.getPhone() %>" region="<%= member.getCountry() %>" /> 
              </div>          
            <% } %>
              
            <%-- Mobile --%>
            <% if (Util.notEmpty(member.getMobile())) { %>
              <div class="member-mobile">
                <jalios:icon src="phone" /> <jalios:phone number="<%= member.getMobile() %>" region="<%= member.getCountry() %>" /> 
              </div>
            <% } %>   
            
                   
            <jalios:include target="CARD_MEMBER_SMALL_BACK_BOTTOM" />    
          </div>      
          <jalios:cardFlipper css="btn" />
        </div>
      </jalios:cardBack>
    <% } %>
  </div>
</div>
<%
request.removeAttribute("card.member");
%>