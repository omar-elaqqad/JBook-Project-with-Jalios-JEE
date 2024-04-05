<%@ include file='/plugins/ESNPlugin/jsp/common/doCommonParams.jspf' %>
<% Set pubSet = esnMgr.getMemberContentSet(member, loggedMember); %>
<% if (Util.notEmpty(pubSet)) { %>
<div class="esn-component esn-component-publications">
  <h2 id="profile-publications"><%= glp("jcmsplugin.esn.lbl.publications") %></h2>
  <ul class="item-box">
    <jalios:pager name='mbrPublicationsPagerHandler' declare='true' action='init' pageSize='5' size='<%= pubSet.size() %>'/>
    <jalios:foreach collection="<%= pubSet %>" name="pub" type="Publication" max="<%= mbrPublicationsPagerHandler.getPageSize() %>" skip="<%= mbrPublicationsPagerHandler.getStart() %>">
  	  <li>
  			<% Date itemDate = pub.getPdate(); %>
  			<%@ include file="/jcore/doItemBoxDate.jspf" %>        
  		  <jalios:dataicon data="<%= pub %>" /> <jalios:link data="<%= pub %>" />
  	  </li>
    </jalios:foreach> 
  </ul>
  <jalios:pager name='mbrPublicationsPagerHandler' template="pqf"/>
</div>
<% } %>
