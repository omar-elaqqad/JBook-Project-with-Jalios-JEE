<%-- This file has been automatically generated. --%>
<%--
  @Summary: PortletRow content editor
  @Category: Generated
  @Author: JCMS Type Processor 
  @Customizable: True
  @Requestable: False 
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file='/jcore/doInitPage.jspf' %>
<% 
  EditPortletRowHandler formHandler = (EditPortletRowHandler)request.getAttribute("formHandler");
  ServletUtil.backupAttribute(pageContext, "classBeingProcessed");
  request.setAttribute("classBeingProcessed", generated.PortletRow.class);
%>
<%-- RowSpacing ------------------------------------------------------------ --%>
<jalios:field name="rowSpacing" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
<% if(!formHandler.isPartialFieldEdition()) { %>
  <ul class="nav nav-tabs nav-tabs-underlined is-left-aligned">
    <li class='active'><a href="#PortletRow_width_tab" onclick="return false;"><%= formHandler.getTabLabel("width") %></a></li>
    <li><a href="#PortletRow_align_horizontal_tab" onclick="return false;"><%= formHandler.getTabLabel("align_horizontal") %></a></li>
    <li><a href="#PortletRow_align_vertical_tab" onclick="return false;"><%= formHandler.getTabLabel("align_vertical") %></a></li>
    <li><a href="#PortletRow_background_color_tab" onclick="return false;"><%= formHandler.getTabLabel("background_color") %></a></li>
    <li><a href="#PortletRow_background_image_tab" onclick="return false;"><%= formHandler.getTabLabel("background_image") %></a></li>
    <li><a href="#PortletRow_background_repeat__tab" onclick="return false;"><%= formHandler.getTabLabel("background_repeat_") %></a></li>
    
  </ul>
<% } %>
<div<%= !formHandler.isPartialFieldEdition() ? " class='tab-content jalios-tab-template clearfix'" : "" %>><div id="PortletRow_width_tab"<%= !formHandler.isPartialFieldEdition() ? " class='tab-pane active'" : "" %>>
<%-- CellWidth ------------------------------------------------------------ --%>
<jalios:field name="cellWidth" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
</div><div id="PortletRow_align_horizontal_tab"<%= !formHandler.isPartialFieldEdition() ? " class='tab-pane'" : "" %>>
<%-- AlignHorizontal ------------------------------------------------------------ --%>
<jalios:field name="alignHorizontal" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
</div><div id="PortletRow_align_vertical_tab"<%= !formHandler.isPartialFieldEdition() ? " class='tab-pane'" : "" %>>
<%-- AlignVertical ------------------------------------------------------------ --%>
<jalios:field name="alignVertical" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
</div><div id="PortletRow_background_color_tab"<%= !formHandler.isPartialFieldEdition() ? " class='tab-pane'" : "" %>>
<%-- BackgroundColor ------------------------------------------------------------ --%>
<jalios:field name="backgroundColor" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
</div><div id="PortletRow_background_image_tab"<%= !formHandler.isPartialFieldEdition() ? " class='tab-pane'" : "" %>>
<%-- BackgroundImage ------------------------------------------------------------ --%>
<jalios:field name="backgroundImage" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
</div><div id="PortletRow_background_repeat__tab"<%= !formHandler.isPartialFieldEdition() ? " class='tab-pane'" : "" %>>
<%-- BackgroundRepeat ------------------------------------------------------------ --%>
<jalios:field name="backgroundRepeat" formHandler="<%= formHandler %>">
  <jalios:control />
</jalios:field>
 
</div>
<%-- SUPER ------------------------------------------------------------ --%>
<% request.setAttribute("formHandler", formHandler); %>
<jsp:include page="/types/AbstractCollection/doEditAbstractCollection.jsp" />
 
</div><%-- End 'tab-content' --%>
<%
{ 
  TreeSet  removedCatSet = new TreeSet(); 
  Category itRemoveCat = null;
  request.setAttribute("PortletRow.removedCatSet", removedCatSet);
}  
%>
<jalios:include jsp="/jcore/doEditExtraData.jsp" />
<% ServletUtil.restoreAttribute(pageContext , "classBeingProcessed"); %><%-- **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY * DO NOT EDIT ANYTHING BELOW THIS LINE *** --%><%
%><%-- iY1hBH27Su2x5wstQNgDSA== --%>