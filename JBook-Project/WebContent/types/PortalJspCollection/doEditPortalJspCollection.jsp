<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
  EditPortalJspCollectionHandler formHandler = (EditPortalJspCollectionHandler)request.getAttribute("formHandler");
  ServletUtil.backupAttribute(pageContext, "classBeingProcessed");
  request.setAttribute("classBeingProcessed", generated.PortalJspCollection.class);
%>
<%-- PageTitle ------------------------------------------------------------ --%>
<jalios:field name="pageTitle" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- Jsp ------------------------------------------------------------ --%>
<jalios:field name="jsp" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<%-- Description ------------------------------------------------------------ --%>
<jalios:field name="description" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
<%-- Description ------------------------------------------------------------ --%>
<jalios:field name="exactCategory" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>

<div class="row">
<div class="col-xs-12">
<div class="tab-pane" id="CommonEditPortlet">


  <div class="tab-page">
    <h2 class="tab"><jalios:icon src='portal-collection' title='<%= glp("ui.editportlet.children") %>' /></h2>

    <% if (formHandler.isFieldEdition("children")) { %>
      <%-- Children ------------------------------------------------------------ --%>
      <jalios:message msg="ui.editportlet.children-bind.help" title="" />
    
      <div class="row">
        <div class="col-sm-6">
        <% 
          PortalElement[] childrenValues  = formHandler.getAvailableChildren(); 
          String[] childrenBindingsValues = formHandler.getAvailableChildrenBindings(); 
          int mvBinds = 1;
          if (childrenValues != null && 
              childrenBindingsValues != null && 
              childrenValues.length != childrenBindingsValues.length){
            String[] oldBindings = childrenBindingsValues;
            childrenBindingsValues = new String[childrenValues.length];
            if (oldBindings.length > 0){
              int cblen = (childrenBindingsValues.length > oldBindings.length) ? oldBindings.length : childrenBindingsValues.length;
              System.arraycopy(oldBindings,0,childrenBindingsValues,0,cblen);
            }
            mvBinds = childrenBindingsValues.length;
          }
        %>
      <jalios:field name="children" label="ui.editportlet.children" value="<%= childrenValues %>" mv="1" css="nolist-widget" resource="field-vertical">
        <jalios:control settings='<%= new PublicationSettings().superType(PortalElement.class) %>' />
      </jalios:field>
      
      </div>
      <div class="col-sm-6">
        <jalios:field name="childrenBindings" label="ui.editportlet.children-bind" tooltip="ui.editportlet.children-bind.h" value="<%= childrenBindingsValues %>" mv="1" resource="field-vertical">
          <jalios:control type="<%= ControlType.TEXTFIELD %>" />
        </jalios:field>
      </div>
    </div>
    
    <% } %>

  </div>
  
<div class="tab-page">
  <h2 class="tab"><jalios:icon src="portal-look-nfeel2" title="ui.editportlet.tmpl" /></h2>
  
  <%-- Templates ----------------------------------------------%>
  <jsp:include page="/work/doEditCommonTemplates.jsp" flush="true"/>
  
  <%-- Classes ----------------------------------------------%>
  <jalios:field name="cssClasses" label="ui.editportlet.cssclasses" tooltip="ui.editportlet.cssclasses.h" value="<%= formHandler.getAvailableCssClasses() %>">
    <jalios:control type="<%= ControlType.TEXTFIELD %>" />
  </jalios:field>

</div>

  <div class="tab-page">
    <h2 class="tab"><jalios:icon src="caches" title="ui.portal.alt.portalcache" /></h2>

      <%-- CacheType ------------------------------------------------------------ --%> 
      <% String cacheType = Util.getString(formHandler.getAvailableCacheType(),""); %>
      <jalios:field name='<%= "cacheType" %>' label='<%= glp("ui.editportlet.cachetype") %>' tooltip='<%= glp("ui.editportlet.title.cachetype") %>' required='<%= true %>' value='<%= cacheType %>'>
        <jalios:control settings='<%= new EnumerateSettings().select().enumValues(AbstractPortlet.getCacheTypeValues()).enumLabels(AbstractPortlet.getCacheTypeLabels(userLang)) %>' />
      </jalios:field>

          
      <%-- CacheSensibility ------------------------------------------------------------ --%> 
      <% String cacheSensibility = Util.getString(formHandler.getAvailableCacheSensibility(),""); %>
      <jalios:field name='<%= "cacheSensibility" %>' label='<%= glp("ui.editportlet.cacherefine") %>' description='<%= glp("ui.editportlet.title.cacherefine") %>' required='<%= true %>' value='<%= cacheSensibility %>'>
        <jalios:control settings='<%= new EnumerateSettings().select().enumValues(AbstractPortlet.getCacheSensibilityValues()).enumLabels(AbstractPortlet.getCacheSensibilityLabels(userLang)) %>' />
      </jalios:field>

      <%-- CacheData ------------------------------------------------------------ --%> 
      <% 
        String[] invalidClassArray   = formHandler.getAvailableInvalidClass();
        
        List<String> enumValues = new ArrayList<String>();
        enumValues.add("Data");
        enumValues.add("Category");
        enumValues.add("Member");
        enumValues.add("Group");
        enumValues.add("Content");
        enumValues.add("PortalElement");
        enumValues.add("Publication");
        
        
        List<String> enumLabels = new ArrayList<String>();
        enumLabels.add(glp("ui.com.lbl.datas"));
        enumLabels.add(glp("ui.com.lbl.categories"));
        enumLabels.add(glp("ui.com.lbl.members"));
        enumLabels.add(glp("ui.com.lbl.groups"));
        enumLabels.add(glp("ui.com.lbl.contents"));
        enumLabels.add(glp("ui.com.lbl.portalelements"));
        enumLabels.add(glp("ui.com.lbl.publications"));
      
      
        List classList = channel.getSubTypeList(Publication.class, userLang);
        for (Iterator it = classList.iterator(); it.hasNext(); ){
          Class itClass = (Class) it.next();
          enumValues.add(itClass.getName());
          enumLabels.add(channel.getTypeLabel(itClass,formHandler.getWorkspace(), userLang));
        }
      %>
      
      <jalios:field name='<%= "invalidClass" %>' label='<%= glp("ui.editportlet.cachedata") %>' value='<%= invalidClassArray %>' mv='<%= 1 %>'>
            <jalios:control settings='<%= new EnumerateSettings().select().enumValues(enumValues).enumLabels(enumLabels) %>' />
          </jalios:field>
          
      <% if (formHandler.isFieldEdition("invalidtime")) { %>
        <%-- Invalidtime ------------------------------------------------------------ --%>
        <% long invalidtimeValues = formHandler.getAvailableInvalidTime(); %>
        <jalios:field name='<%= "invalidTime" %>' label="ui.editportlet.cachetimeout" description="ui.editportlet.title.cachetimeout" value='<%= ""+invalidtimeValues %>'>
          <jalios:control settings='<%= new DurationSettings().resolution(DurationSettings.Resolution.MINUTE) %>' />
        </jalios:field>
      <% } %>

  </div> 
  
	  <div class="tab-page">
	    <h2 class="tab"><jalios:icon src='advanced-gray' title='<%= glp("ui.portal.alt.portalcustomize") %>' /></h2>
	
	      <%-- BehaviorCopy ------------------------------------------------------------ --%> 
	      <jalios:field name='<%= "behaviorCopy" %>' label='<%= glp("ui.editportlet.behaviorcopy") %>' required='<%= true %>' value='<%= ""+formHandler.getAvailableBehaviorCopy() %>'>
	        <jalios:control settings='<%= new EnumerateSettings().select().enumValues("true", "false", "ws").enumLabels("ui.editportlet.behaviorcopy.copy", "ui.editportlet.behaviorcopy.ref", "ui.editportlet.behaviorcopy.ws") %>' />
	      </jalios:field>
	
	      <%-- Condition ------------------------------------------------------------ --%> 
	      <% 
	      TypeFieldEntry conditionTFE = channel.getTypeFieldEntry(AbstractPortlet.class, "condition", true);
	      String conditionLabel = conditionTFE.getLabel(userLang);
	      String[] conditionValues = formHandler.getAvailableCondition();
	      String conditionDescription = conditionTFE.getDescription(userLang);
	      String[] enumConditionLabels = (String[]) AbstractPortlet.getConditionLabels(userLang);
	      String[] enumConditionValues = AbstractPortlet.getConditionValues();
	      %>
	      <jalios:field name='<%= "condition" %>' label='<%= conditionLabel %>' description='<%= conditionDescription %>' required='<%= true %>' value='<%= Util.getFirst(conditionValues) %>'>
	        <jalios:control settings='<%= new EnumerateSettings().select().enumValues(enumConditionValues).enumLabels(enumConditionLabels) %>' />
	      </jalios:field>

	  </div>
  
  
  <%-- Portal description ------------------------------------------------------ --%>
  <%@ include file='/jcore/portal/doEditCommonPortalDescription.jspf' %>
  
</div>
</div>
</div>

  
<%-- SUPER ------------------------------------------------------------ --%>
<% request.setAttribute("formHandler", formHandler); %>
 
<%
{ 
  TreeSet  removedCatSet = new TreeSet(); 
  Category itRemoveCat = null;
  request.setAttribute("PortalJspCollection.removedCatSet", removedCatSet);
}  
%>
<jalios:include target="EDIT_PUB_MAINTAB" targetContext="div" />
<jalios:include jsp="/jcore/doEditExtraData.jsp" />
<% ServletUtil.restoreAttribute(pageContext , "classBeingProcessed"); %>