<%@ include file="/front/card/data/doInitCardData.jspf" %><%
  Member member = (Member) data;
  boolean memberCanBeRead = member.canBeReadBy(loggedMember);

  String email = member.getEmail();
  boolean showEmail = memberCanBeRead && Util.notEmpty(email) && (member.isEmailVisible() || isAdmin);
  boolean hasPhone = memberCanBeRead && Util.notEmpty(member.getPhone());
  boolean hasMobile = memberCanBeRead && Util.notEmpty(member.getMobile());
  boolean showCardBack = memberCanBeRead && (showEmail || hasPhone || hasMobile);
  
  String jobTitle = member.getJobTitle();
  String organization = member.getOrganization();
  String department = member.getDepartment();

  boolean showTitleOrganizationBlock = memberCanBeRead && (Util.notEmpty(jobTitle) || Util.notEmpty(organization));

%>
<div class="card-flip-wrapper">
  <div class="<%= css %> card-member"<%= dataAttribute != null ? " " + dataAttribute.toString() : "" %>>
    <div class="card-front">
      <jalios:memberphoto member="<%= member %>" size="<%= PhotoSize.NORMAL %>"/>
      <div class="card-block">
        <div class="card-title card-member-name">
          <div><%= memberCanBeRead ? member.getFullName() : glp("ui.com.lbl.restricted-mbr") %></div>
          <% if (memberCanBeRead && Util.notEmpty(jobTitle)) { %><div><%= member.getJobTitle() %></div><% } %>
        </div>
        <% if (showTitleOrganizationBlock) { %>
        <div class="card-block-item">
          <% if (Util.notEmpty(organization)) { %><div><%= member.getOrganization() %></div><% } %>
          <% if (Util.notEmpty(department)) { %><div><%= member.getDepartment() %></div><% } %>
        </div>
        <% } %>
      </div>
     <% if (showCardBack) { %>
      <div class="card-footer">
        <jalios:cardFlipper css="pull-right btn btn-link" />
      </div>
     <% } %>
      <%= getIncludeString("CARD_BOTTOM", "") %>
    </div>
    
    <% if (showCardBack) { %>
    <div class="card-back">
      <div class="card-block">
        <div class="card-title card-member-name">
          <jalios:memberphoto member="<%= member %>" size="<%= PhotoSize.TINY %>"/> <%= memberCanBeRead ? member.getFullName() : glp("ui.com.lbl.restricted-mbr") %>
        </div>
        <% if (showTitleOrganizationBlock) { %>
	        <div class="card-block-item">
	          <% if (Util.notEmpty(organization)) { %><div><%= member.getOrganization() %></div><% } %>
	          <% if (Util.notEmpty(department)) { %><div><%= member.getDepartment() %></div><% } %>
	        </div>
        <% } %>
      </div>    
      <div class="card-block">
        <ul>
          <%-- E-mail --%>
          <% if (showEmail) { %>
	          <li title="<%= encodeForHTMLAttribute(glp("ui.com.lbl.email")) %>"><jalios:icon src="mail" /> <a itemprop="email" href='mailto:<%= encodeForHTMLAttribute(email) %>'><%= email %></a></li>
          <% } %>      
          
          <%-- Phone --%>
          <% if (hasPhone) { %>
	          <li title="<%= encodeForHTMLAttribute(glp("ui.adm.mbr-edit.lbl.phone")) %>" itemprop="telephone">
	           <jalios:icon src="telephone" /> <jalios:phone number="<%= member.getPhone() %>" region="<%= member.getCountry() %>" /> 
	          </li>
          <% } %>
        
          <%-- Mobile --%>
          <% if (hasMobile) { %>
	          <li title="<%= encodeForHTMLAttribute(glp("ui.adm.mbr-edit.lbl.mobile")) %>" itemprop="telephone">
	           <jalios:icon src="phone" /> <jalios:phone number="<%= member.getMobile() %>" region="<%= member.getCountry() %>" /> 
	          </li>
          <% } %>
        </ul>
      </div>        
      <div class="card-footer">
        <jalios:cardFlipper css="pull-right btn btn-link" />
      </div>
    </div>
    <% } %>
    
  </div>
</div>