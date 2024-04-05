<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%><%
%><%@ include file="/front/card/data/doInitCardData.jspf" %><%

if (!isLogged) {
  sendForbidden(request, response);
}

WebAssetsUtils.addWebAssets(jcmsContext, "jalios-truncate");
jcmsContext.addCSSHeader("plugins/CollaborativeSpacePlugin/css/cs-admin-list-card-member.css");

Member member = (Member) data;
boolean memberCanBeRead = member.canBeReadBy(loggedMember);

String jobTitle = member.getJobTitle();
String organization = member.getOrganization();
String department = member.getDepartment();

boolean showTitleOrganizationBlock = memberCanBeRead 
  && (Util.notEmpty(jobTitle) || Util.notEmpty(department) || Util.notEmpty(organization));

String cardTitle = memberCanBeRead ? member.getFullName() : glp("ui.com.lbl.restricted-mbr");
%>
<div class="card-flip-wrapper card-member-cs-admin-list">
  <div class="<%= css %> card-member"<%= dataAttribute != null ? " " + dataAttribute.toString() : "" %>>
    <jalios:cardFront>
      <%
      String closeCardLabel = glp("jcmsplugin.collaborativespace.admin-list.remove-member");
      String removeUrl = (String) request.getAttribute("removeAdminListUrl");
      removeUrl = Util.getString(removeUrl, ServletUtil.getUrl(request, false));
     // -- AJAX-REFRESH PARAMS
     Map<String, String> opRemoveAjaxParamsMap = new HashMap<>();
     opRemoveAjaxParamsMap.put("memberId", member.getId());
     opRemoveAjaxParamsMap.put("opRemoveAdmin", Boolean.TRUE.toString());
     opRemoveAjaxParamsMap.put("redirect", ServletUtil.getUrl(request, false));
     // -- AJAX-REFRESH OPTIONS
     ObjectMapper objectMapper = new ObjectMapper();
     String opRemoveAjaxParams = objectMapper.writeValueAsString(opRemoveAjaxParamsMap);
     String opRemoveAjaxOptions = "{"
       + MessageFormat.format(
           "\"mode\" : \"ajax\", \"params\" : {0}", 
           opRemoveAjaxParams)
       + "}";
     // -- AJAX DATA ATTRIBUTES
     DataAttribute opRemoveDataAttr = new DataAttribute();
     opRemoveDataAttr.addData("jalios-action", "clickable");
     opRemoveDataAttr.addData("jalios-options", opRemoveAjaxOptions);
     opRemoveDataAttr.addData("jalios-url", removeUrl);
      %>
      <span class="card-close-action card-action-item" <%= opRemoveDataAttr %>
          title="<%= encodeForHTMLAttribute(closeCardLabel) %>">
        <jalios:icon src="card-close" />
      </span>
    
      <jalios:cardBlock css="card-img">
        <jalios:memberphoto member="<%= member %>" width="96" height="96"/>
      </jalios:cardBlock>

      <jalios:cardBlock css="card-profile-infos">
        <div class="card-title profile-name" data-jalios-truncate='{ "value" : 2 }' 
            title='<%= encodeForHTMLAttribute(cardTitle) %>'>
          <jalios:link data="<%= member %>"><%= cardTitle %></jalios:link>
        </div>
        <% if (showTitleOrganizationBlock) { %>
          <% if (Util.notEmpty(jobTitle)) { %>
            <div class="card-block-item profile-info profile-job-title" 
                title="<%= encodeForHTMLAttribute(glp("ui.adm.mbr-edit.lbl.job") + "\n" + jobTitle) %>">
              <%= jobTitle %>
            </div>
            <% if (Util.notEmpty(department)) { %>
              <div class="card-block-item profile-info profile-department"
                title="<%= encodeForHTMLAttribute(glp("ui.adm.mbr-edit.lbl.department") + "\n" + department) %>">
                <%= department %>
              </div>
            <% } %>
            <% if (Util.notEmpty(organization)) { %>
              <div class="card-block-item profile-info profile-organization"
                title="<%= encodeForHTMLAttribute(glp("ui.adm.mbr-edit.lbl.organization") + "\n" + organization) %>">
                <%= organization %>
              </div>
            <% } %>
          <% } %>
        <% } %>
      </jalios:cardBlock>    
    </jalios:cardFront>
  </div>
</div>