<%@ include file='/plugins/ESNPlugin/jsp/common/doCommonParams.jspf' %>
<% Set pubSet = esnMgr.getContactReferrerSet(member, loggedMember); %>
<% if (Util.notEmpty(pubSet)) { %>
<div class="esn-component esn-component-contact-referrer">
	<h2 class="esn-component-header"><%= glp("jcmsplugin.esn.lbl.contact-referrers") %></h2>
	<div class="esn-component-body">
		<ul class="item-box">
	  <jalios:pager name='mbrPublicationsPagerHandler' 
	                declare='true' 
	                action='init' 
	                pageSize='5'
	                size='<%= pubSet.size() %>'/>
	  <jalios:foreach collection="<%= pubSet %>" 
	                  name="pub" 
	                  type="Publication"
	                  max="<%= mbrPublicationsPagerHandler.getPageSize() %>"
	                  skip="<%= mbrPublicationsPagerHandler.getStart() %>"
	                  >
		<li>
			<% Date itemDate = pub.getPdate(); %>
	    <%@ include file="/jcore/doItemBoxDate.jspf" %>    	
	    <jalios:dataicon data="<%= pub %>" /> <jalios:link data="<%= pub %>" />
		</li>    
	  </jalios:foreach> 
		</ul>
		<jalios:pager name='mbrPublicationsPagerHandler' />
	</div>
</div>
<% } %>
