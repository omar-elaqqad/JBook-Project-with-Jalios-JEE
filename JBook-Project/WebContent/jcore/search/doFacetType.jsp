<%@ include file='/jcore/doInitPage.jspf' %><%@ page import="com.jalios.jcms.handler.QueryHandler" %><%
  int boxStatus = Util.toInt(request.getAttribute("query.facets.types"),0);
  
  String FACET_PREFIX = (String) request.getAttribute("query.facets.prefix");
  QueryHandler qh = (QueryHandler) request.getAttribute("query.facets.handler");
  boolean advanced    = channel.getBooleanProperty("query.facets.advanced",false);
  QueryResultSet queryResultSet = (QueryResultSet) request.getAttribute("query.queryResultSet");
  boolean refine = false;
  String lblPrefix = refine ? "ui.fo.refine.lbl." : "ui.work.search.tab.";
  
  Set dstClassSet        = qh.getClassSet(); 
  Set dstRefineSet       = (Set) request.getAttribute("dstRefineSet");
  Collection dstTypesOff = (Collection) request.getAttribute("dstTypesOff");
  
  // JCMS-6449 :  Facet search : cannot selected document type if FileDocument selected
  Set<Class<? extends Publication>> unfilteredClassSet = new HashSet<Class<? extends Publication>>();
  if (dstClassSet != null) {
    unfilteredClassSet.addAll(dstClassSet);
  }
  if (qh.getTypes() != null) {
    // Otherwise iterates types and build classSet
    for (String type : qh.getTypes()) {
      try {
        unfilteredClassSet.add(channel.getClass(type));
      } catch (ClassNotFoundException ex) {
        logger.debug("Could not find class " + type);
      }
    }
  }
  
  boolean dstShowReplaceFileDoc = Util.toBoolean((String)request.getAttribute("dstShowReplaceFileDoc"), true); 
  boolean dstShowEmptyType      = Util.toBoolean((String)request.getAttribute("dstShowEmptyType"),      true);
  boolean dstShowAbstractType   = Util.toBoolean((String)request.getAttribute("dstShowAbstractType"),   true);

  if (boxStatus != 0){ 
    if (Util.getSize(dstClassSet) != 1 || !dstClassSet.contains(Content.class)){
      boxStatus = 1;
    }
  }
  
  String[] typesFacetOff = channel.getStringArrayProperty("query.default.types-facet-off", new String[0]);
  
  String panelCss = "panel-default facet-types " + ((boxStatus == 0) ? "hidden" : "");
%>
<jalios:accordion-panel title="ui.work.search.tab.type" css="<%= panelCss %>" picture="publication" active="<%= boxStatus != 0 && boxStatus != 2 %>">
  <%-- Members --%>
  <% boolean searchInMembers = Util.notEmpty((List)request.getAttribute("query.memberIdList")) || qh.getSearchInMembers(); %>
  <% String searchInMembersInputId = FACET_PREFIX + "searchInMembers"; %>
  <ul class="facet-list list-unstyled">
    <li <%= searchInMembers ? "class='checked'" : "" %>>
      <label for="<%= searchInMembersInputId %>">
       <% if (advanced) { %>
       <input id="<%= searchInMembersInputId %>" type="checkbox" name="searchInMembersUI" <% if (searchInMembers) { %>checked="checked"<% } %>
              data-jalios-action="toggle:disabled toggle:disabled" data-jalios-target="#<%= searchInMembersInputId %>HiddenTrue | #<%= searchInMembersInputId %>HiddenFalse" />
       <% } else { %>
       <input id="<%= searchInMembersInputId %>" type="checkbox" name="searchInMembers" value="<%= searchInMembers %>" checked="checked" class="boolean"/>
       <% } %>
      <jalios:dataicon class="<%= Member.class %>"  />
      <%= glp("ui.com.lbl.members") %>
      </label>
      <%
        if (advanced) {
          %><input id="<%= searchInMembersInputId %>HiddenTrue" type="hidden" name="searchInMembers" value="true" <% if (!searchInMembers) { %>disabled="disabled"<% } %> /><%
          %><input id="<%= searchInMembersInputId %>HiddenFalse" type="hidden" name="searchInMembers" value="false" <% if (searchInMembers) { %>disabled="disabled"<% } %> /><%
        }
      %>
    </li>
  </ul>
  
  <%-- Content and UserContent --%>
  
	  <jalios:foreach array="<%= new Class[] {Content.class, UserContent.class} %>" name="itSuperClass" type="Class">
	  <ul class="facet-list list-unstyled">
    
      <jalios:buffer name="classesBuffer">
	    <jalios:foreach name="itClass" counter="typeCounter" type="Class" collection="<%= channel.getSubTypeList(itSuperClass, userLang) %>">
	    <%
	      boolean checkAbstractType = dstShowAbstractType || !((itClass.getModifiers() & java.lang.reflect.Modifier.ABSTRACT) > 0);
        boolean checkTypeOff = dstTypesOff == null || !dstTypesOff.contains(itClass);
          
        if (checkAbstractType && checkTypeOff) {
          boolean checked = unfilteredClassSet.contains(itClass);
          
          int typeCount = 1;
          String icon = "images/jalios/icons/publication.gif";
          // DBData type
	        if (DBData.class.isAssignableFrom(itClass)) {
	          typeCount = HibernateUtil.queryCount(itClass);
	          icon = "images/jalios/icons/publicationdb.gif";
	        }
	        // Storable type
	        else {
	          Set set = channel.getDataSet(itClass);
	          if (dstRefineSet != null) { set = Util.interSet(dstRefineSet, set);  }
	          typeCount = set != null ? set.size() : 0;
	          if (refine){
	            set = Util.interSet(queryResultSet, set);
	            typeCount = set.size();
	          }
	        }
	        
	        boolean isFacetOff = false;
	        for (int i = 0 ; i < typesFacetOff.length ; i++) { 
	          if (typesFacetOff[i].equals(itClass.getName())) { isFacetOff = true; break; }
	        }
	        
	        if (!isFacetOff && (dstShowEmptyType || typeCount > 0)) {
	          String inputId = FACET_PREFIX + "types" + itClass.getName();
	    %>
        <li class='<%= checked ? "checked":"" %> <%= typeCount == 0 ? "empty" : "" %>'>
          <label for="<%= inputId %>">
            <input id="<%= inputId %>" type="checkbox" name="types" value="<%= itClass.getName() %>" <%= checked ? "checked=\"checked\"" : ""%> />
            <jalios:dataicon class="<%= itClass %>"  />
            <%= channel.getTypeLabel(itClass, workspace, userLang) %>
          </label>
	      </li>
	      <% } %>
	    <% } %>
	    </jalios:foreach>
      </jalios:buffer>
      
      <% if (Util.notEmpty(classesBuffer)) { %>
      <% boolean checkedContent = dstClassSet != null && dstClassSet.contains(itSuperClass); %>
      <li class='stick exclusive <%= checkedContent ? "checked" : "" %>'>
        <label class="strong" for="doSearchTypeAll<%= Util.getClassShortName(itSuperClass) %>">
          <input type="checkbox" name="types" id="doSearchTypeAll<%= Util.getClassShortName(itSuperClass) %>" value="<%= itSuperClass.getName() %>" <%= checkedContent ? "checked=\"checked\"" : ""%> />
          <strong><%= glp("ui.work.query-ch.lbl.any." + Util.getClassShortName(itSuperClass)) %></strong>
        </label>
      </li>     
      <%= classesBuffer %>
      <li><hr/></li> 
      <% } %>
	  </ul>
	  </jalios:foreach>

    
    <ul class="facet-list list-unstyled">
      <% String exactTypeInputId = FACET_PREFIX + "exactType"; %>
      <li class='stick <%= qh.getExactType() ? "checked" : "" %>'>
        <label for="<%= exactTypeInputId %>">
        <input id="<%= exactTypeInputId %>" type='checkbox' name='exactType' value='true' <%= qh.getExactType() ? "checked=\"checked\"" : ""%> />
          <%= glp("ui.work.search.type.exact") %>
        </label>
        <jalios:tooltip property='ui.work.search.type.exact.h'/>
      </li>
      
      <% if (dstShowReplaceFileDoc) { %>
      <% 
        boolean checkedReplaceFileDoc = qh.getReplaceFileDoc();
        String replaceFileDocInputId = FACET_PREFIX + "replaceFileDoc";
      %>
      <li class='stick <%= checkedReplaceFileDoc ? "checked" : "" %>'>
        <label for="<%= replaceFileDocInputId %>">
          <input id="<%= replaceFileDocInputId %>" type='checkbox' name='replaceFileDoc' value='true' <%= checkedReplaceFileDoc ? "checked=\"checked\"" : ""%> />
          <%= glp("ui.work.search.type.doc") %>
        </label>
        <jalios:tooltip property='ui.work.search.type.doc.h'/>
      </li>  
      <% } else { %><input type='hidden' name='replaceFileDoc' value='<%= qh.getReplaceFileDoc() %>' /><% } %>
    </ul>
    

</jalios:accordion-panel>