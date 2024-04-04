<%@page import="com.jalios.jcms.uicomponent.indicator.IndicatorManager"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %> 
<% 
  jcmsContext.addJavaScript("js/jalios/core/components/indicator/edit-portlet-indicator.js");
  jcmsContext.addCSSHeader("css/jalios/core/components/form/jalios-form-input-card.css");
  EditPortletIndicatorHandler formHandler = (EditPortletIndicatorHandler)request.getAttribute("formHandler");
  ServletUtil.backupAttribute(pageContext, "classBeingProcessed");
  request.setAttribute("classBeingProcessed", generated.PortletIndicator.class);
  String indicatorType = formHandler.getAvailableIndicatorType();
%>

<ul class="nav nav-tabs" role="tablist">
  <li class="active"><a href="#indicator-metric" role="tab" data-toggle="tab" onclick="return false;"><%= glp("types.PortletIndicator.tab.metric") %></a></li>
  <li><a href="#indicator-info" role="tab" data-toggle="tab" onclick="return false;"><%= glp("types.PortletIndicator.tab.info") %></a></li>
  <li><a href="#indicator-ui" role="tab" data-toggle="tab" onclick="return false;"><%= glp("types.PortletIndicator.tab.ui") %></a></li>
</ul>
<!-- Tab panes -->
<div class="tab-content">

  <%-- Metric --%>
  <div class="tab-pane active" id="indicator-metric">
    <jalios:field label="types.PortletQueryForeach.fields.displayMode.label">
      <div class="card-choice-item-wrapper">
        <div class="card-choice-item <%= "MANUAL".equals(indicatorType) || indicatorType == null ? "active" : "" %>" data-jalios-indicator-type="MANUAL">
          <div class="item-input-wrapper">
            <input class="item-input" type="radio" name="indicatorType" value="MANUAL" <%= "MANUAL".equals(indicatorType) || indicatorType == null ? "checked=\"checked\"" : "" %>>
          </div>
          <div class="content">
            <div class="item-title"><%= glp("types.PortletIndicator.fields.indicatorType.manual-label") %></div>
            <div class="description"><%= glp("types.PortletIndicator.fields.indicatorType.manual-desc") %></div>
          </div>
        </div>
        <div class="card-choice-item <%= "METRIC".equals(indicatorType) ? "active" : "" %>" data-jalios-indicator-type="METRIC">
          <div class="item-input-wrapper">
            <input class="item-input" type="radio" name="indicatorType" value="METRIC" <%= "METRIC".equals(indicatorType) ? "checked=\"checked\"" : "" %>>
          </div>
          <div class="content">
            <div class="item-title"><%= glp("types.PortletIndicator.fields.indicatorType.metric-label") %></div>
            <div class="description"><%= glp("types.PortletIndicator.fields.indicatorType.metric-desc") %></div>
          </div>
        </div>
      </div>
    </jalios:field>

    <div id="manual-indicator-fields" class='indicator-type-fields-MANUAL indicator-type-fields <%= "MANUAL".equals(indicatorType) || Util.isEmpty(indicatorType) ? "" : "hide" %>'>
  
      <%-- Percentage ------------------------------------------------------------ --%>
      <jalios:field name="percentage" formHandler="<%= formHandler %>">
        <jalios:control />
      </jalios:field>
       
      <%-- Value ------------------------------------------------------------ --%>
      <jalios:field name="value" formHandler="<%= formHandler %>">
        <jalios:control />
      </jalios:field>
       
      <%-- targetValue ------------------------------------------------------------ --%>
      <jalios:field name="targetValue" formHandler="<%= formHandler %>">
        <jalios:control />
      </jalios:field>
    
      <%-- Unit ------------------------------------------------------------ --%>
      <jalios:field name="unit" formHandler="<%= formHandler %>">
        <jalios:control />
      </jalios:field>
       
    </div>
    
    <div id="compute-indicator-fields" class='indicator-type-fields-METRIC indicator-type-fields indicator-metric-params <%= "METRIC".equals(indicatorType) ? "" : "hide" %>'>
      <% request.setAttribute("fieldVertical", hasParameter("jPortal")); %>
      <jalios:control settings='<%= new HiddenSettings().name("fieldVertical").value(hasParameter("jPortal")) %>' />
      <jalios:include jsp="types/PortletIndicator/doPortletIndicatorMetricEditor.jsp" />
    </div>
    
    <%-- MetricParameters ------------------------------------------------------------ --%>
    <jalios:field name="metricParameters" formHandler="<%= formHandler %>" css="hide">
      <jalios:control />
    </jalios:field>
  </div>
  
  <%-- INFO --%>
  <div class="tab-pane" id="indicator-info">
    <%-- Label ------------------------------------------------------------ --%>
    <jalios:field name="label" formHandler="<%= formHandler %>">
      <jalios:control />
    </jalios:field>
    
    <%-- BriefText ------------------------------------------------------------ --%>
    <jalios:field name="briefText" formHandler="<%= formHandler %>">
      <jalios:control />
    </jalios:field>
    
    <%-- LinkType ------------------------------------------------------------ --%>
    <jalios:field name="linkType" formHandler="<%= formHandler %>"> 
      <jalios:control />
    </jalios:field>
     
    <%-- PublicationLink ------------------------------------------------------------ --%>
    <jalios:field name="publicationLink" formHandler="<%= formHandler %>">
      <jalios:control />
    </jalios:field>
     
    <%-- Categorylink ------------------------------------------------------------ --%>
    <jalios:field name="categorylink" formHandler="<%= formHandler %>">
      <jalios:control />
    </jalios:field>
    
    <%-- LinkLabel ------------------------------------------------------------ --%>
    <jalios:field name="linkLabel" formHandler="<%= formHandler %>">
      <jalios:control />
    </jalios:field>

  </div>
  
  
  <%-- PRESENTATION --%>
  <div class="tab-pane" id="indicator-ui">
  
    <%-- primaryColor ------------------------------------------------------------ --%>
    <jalios:field name="primaryColor" formHandler="<%= formHandler %>">
      <jalios:control />
    </jalios:field>
    
    <%-- secondaryColor ------------------------------------------------------------ --%>
    <jalios:field name="secondaryColor" formHandler="<%= formHandler %>">
      <jalios:control />
    </jalios:field>
    
    
    <%-- animation ------------------------------------------------------------ --%>
    <jalios:field name="animation" formHandler="<%= formHandler %>">
      <jalios:control />
    </jalios:field>
    
    <%-- picture ------------------------------------------------------------ --%>
    <jalios:field name="picture" formHandler="<%= formHandler %>">
      <jalios:control />
    </jalios:field>
  </div>
</div>





<%-- SUPER ------------------------------------------------------------ --%>
  <% request.setAttribute("formHandler", formHandler); %>
  <jsp:include page="/types/AbstractPortletSkinable/doEditAbstractPortletSkinable.jsp" />
   
   
<%
{ 
  TreeSet  removedCatSet = new TreeSet(); 
  Category itRemoveCat = null;
  request.setAttribute("PortletIndicator.removedCatSet", removedCatSet);
}  
%>
<jalios:include target="EDIT_PUB_MAINTAB" targetContext="div" />
<jalios:include jsp="/jcore/doEditExtraData.jsp" />
<% ServletUtil.restoreAttribute(pageContext , "classBeingProcessed"); %>
