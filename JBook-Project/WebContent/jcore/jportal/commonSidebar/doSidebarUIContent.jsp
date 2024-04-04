<%@page import="com.jalios.jcms.jportal.JPortalEditorHandler"%>
<%@page import="com.jalios.jcms.taglib.settings.impl.ColorSettings"%>
<%@page import="com.jalios.jcms.taglib.settings.impl.EnumerateSettings"%>
<%@page import="com.jalios.jcms.taglib.settings.impl.TextFieldSettings"%>
<%@page import="com.jalios.util.Util"%>
<%@ page contentType="text/html; charset=UTF-8"%><%--
--%><%@ include file="/jcore/doInitPage.jspf"%><%
JPortalEditorHandler formHandler = (JPortalEditorHandler) request.getAttribute(JPortalEditorHandler.FORM_HANDLER_REQUEST_ATTR);
request.setAttribute("field-vertical", true);
boolean isJPortletEdition = formHandler.getPortletId() != null;
%>
<div class="jblock-parameters jblock-ui">
  <h3 class="sidebar-tab-title"><%= glp("jportal.edition.sidebar.ui.title") %></h3>
  <% if (formHandler.isPortletJaliosSkin()) { %>
	  <div class="jportal-sidebar-group is-accordion jportal-sidebar-group-separated">
	    <a class="sidebar-subtitle collapsed" data-toggle="collapse" href="#jaliosSkin" aria-expanded="false" aria-controls="jaliosSkin"><jalios:icon src="caret" /> <%= glp("jportal.edition.sidebar.ui.jalios-skin.title") %></a>
	    <div class="collapse sidebar-collapsed-group" id="jaliosSkin">
	      <jalios:field resource="field-horizontal" name="jaliosSkinHeaderPrimary" label="jportal.edition.sidebar.ui.jalios-skin-header-primary.label" description="jportal.edition.sidebar.ui.jalios-skin-header-primary.help">
	        <jalios:control settings='<%= new ColorSettings().css("jportlet-css") %>' />
	      </jalios:field>
	      <jalios:field resource="field-horizontal" name="jaliosSkinHeaderSecondary" label="jportal.edition.sidebar.ui.jalios-skin-header-secondary.label" description="jportal.edition.sidebar.ui.jalios-skin-header-secondary.help">
	        <jalios:control settings='<%= new ColorSettings().css("jportlet-css") %>' />
	      </jalios:field>
<%-- 	      <jalios:field resource="field-horizontal" name="jaliosSkinBodyPrimary" label="jportal.edition.sidebar.ui.jalios-skin-body-primary.label">
	        <jalios:control settings='<%= new ColorSettings().css("jportlet-css") %>' />
	      </jalios:field>
	      <jalios:field resource="field-horizontal" name="jaliosSkinBodySecondary" label="jportal.edition.sidebar.ui.jalios-skin-body-secondary.label">
	        <jalios:control settings='<%= new ColorSettings().css("jportlet-css") %>' />
	      </jalios:field> --%>
	    </div>  
	  </div>
  <% } %>
<%--   <%@ include file='/jcore/jportal/commonSidebar/doSidebarBoxModelEdition.jspf' %> --%>  
  <div class="jportal-sidebar-group is-accordion jportal-sidebar-group-separated">
    <a class="sidebar-subtitle collapsed" data-toggle="collapse" href="#spacing" aria-expanded="false" aria-controls="spacing"><jalios:icon src="caret" /> <%= glp("jportal.edition.sidebar.ui.spacing.title") %></a>
    <div class="collapse sidebar-collapsed-group" id="spacing">
      <jalios:field label="jportal.edition.sidebar.ui.margin.label" >
        <div class="input-group input-group-chained no-display-table">
          <input type="text" name="marginTop" class="form-control jblock-css" placeholder="<%= glp("jportal.edition.sidebar.ui.top.placeholder") %>">
          <input type="text" name="marginRight" class="form-control jblock-css" placeholder="<%= glp("jportal.edition.sidebar.ui.right.placeholder") %>">
          <input type="text" name="marginBottom" class="form-control jblock-css" placeholder="<%= glp("jportal.edition.sidebar.ui.bottom.placeholder") %>">
          <input type="text" name="marginLeft" class="form-control jblock-css" placeholder="<%= glp("jportal.edition.sidebar.ui.left.placeholder") %>">
          <div class="input-group-addon is-chained">
            <label>
              <input type="checkbox" name="" class="input-chainer" checked="checked">
              <jalios:icon src="jportal-sidebar-chained-unlink" />
              <jalios:icon src="jportal-sidebar-chained-link" />
            </label>
          </div>
        </div>
      </jalios:field>
      <jalios:field label="jportal.edition.sidebar.ui.padding.label" >
        <div class="input-group input-group-chained no-display-table">
          <input type="text" name="paddingTop" class="form-control jblock-css"  placeholder="<%= glp("jportal.edition.sidebar.ui.top.placeholder") %>">
          <input type="text" name="paddingRight" class="form-control jblock-css" placeholder="<%= glp("jportal.edition.sidebar.ui.right.placeholder") %>">
          <input type="text" name="paddingBottom" class="form-control jblock-css" placeholder="<%= glp("jportal.edition.sidebar.ui.bottom.placeholder") %>">
          <input type="text" name="paddingLeft" class="form-control jblock-css" placeholder="<%= glp("jportal.edition.sidebar.ui.left.placeholder") %>">
          <div class="input-group-addon is-chained">
            <label>
              <input type="checkbox" name="" class="input-chainer" checked="checked">
              <jalios:icon src="jportal-sidebar-chained-unlink" />
              <jalios:icon src="jportal-sidebar-chained-link" />
            </label>
          </div>
        </div>   
      </jalios:field>
    </div>
  </div> 
  
  <div class="jportal-sidebar-group is-accordion jportal-sidebar-group-separated">
    <a class="sidebar-subtitle collapsed" data-toggle="collapse" href="#borders" aria-expanded="false" aria-controls="borders"><jalios:icon src="caret" /> <%= glp("jportal.edition.sidebar.ui.border.label") %></a>
    <div class="collapse sidebar-collapsed-group" id="borders">
      <jalios:field label="jportal.edition.sidebar.ui.border-style.label" name="borderStyle">
        <% String[] borderStyleValues = Util.split(channel.getProperty("jportal.css-style.border.style", ""), " "); %>
        <jalios:control settings='<%= new EnumerateSettings().select().enumValues(borderStyleValues).enumLabels(borderStyleValues).css("jblock-css") %>' />
      </jalios:field>      
      
      <jalios:field label="jportal.edition.sidebar.ui.border-style.label" >
        <div class="input-group input-group-chained no-display-table">
          <input type="text" name="borderTopWidth" class="form-control jblock-css" placeholder="<%= glp("jportal.edition.sidebar.ui.top.placeholder") %>">
          <input type="text" name="borderRightWidth" class="form-control jblock-css" placeholder="<%= glp("jportal.edition.sidebar.ui.right.placeholder") %>">
          <input type="text" name="borderBottomWidth" class="form-control jblock-css" placeholder="<%= glp("jportal.edition.sidebar.ui.bottom.placeholder") %>">
          <input type="text" name="borderLeftWidth" class="form-control jblock-css" placeholder="<%= glp("jportal.edition.sidebar.ui.left.placeholder") %>">
          <div class="input-group-addon is-chained">
            <label>
              <input type="checkbox" name="" class="input-chainer" checked="checked">
              <jalios:icon src="jportal-sidebar-chained-unlink" />
              <jalios:icon src="jportal-sidebar-chained-link" />
            </label>
          </div>
        </div>
      </jalios:field>
<%--      <jalios:field resource="field-horizontal" name="borderColor" label="Border color">
        <jalios:control settings='<%= new ColorSettings().css("jblock-css") %>'>
          <% String[] borderStyleValues = Util.split(channel.getProperty("jportal.css-style.border.style", ""), " "); %>
          <jalios:buffer name="CONTROL_APPEND">
            <jalios:control settings='<%= new EnumerateSettings().name("borderStyle").select().enumValues(borderStyleValues).enumLabels(borderStyleValues).css("jblock-css") %>' />
          </jalios:buffer>
        </jalios:control>
      </jalios:field> --%>
      
      <jalios:field label="jportal.edition.sidebar.ui.color.label" name="borderColor">
        <jalios:control settings='<%= new ColorSettings().css("jblock-css") %>'>
        </jalios:control>
      </jalios:field>
      <jalios:field label="jportal.edition.sidebar.ui.radius.label" >
        <div class="input-group input-group-chained no-display-table">
          <input type="text" name="borderTopLeftRadius" class="form-control jblock-css"  placeholder="<%= glp("jportal.edition.sidebar.ui.top-left.placeholder") %>">
          <input type="text" name="borderTopRightRadius" class="form-control jblock-css" placeholder="<%= glp("jportal.edition.sidebar.ui.top-right.placeholder") %>">
          <input type="text" name="borderBottomRightRadius" class="form-control jblock-css" placeholder="<%= glp("jportal.edition.sidebar.ui.bottom-right.placeholder") %>">
          <input type="text" name="borderBottomLeftRadius" class="form-control jblock-css" placeholder="<%= glp("jportal.edition.sidebar.ui.bottom-left.placeholder") %>">
          <div class="input-group-addon is-chained">
            <label>
              <input type="checkbox" name="" class="input-chainer" checked="checked">
              <jalios:icon src="jportal-sidebar-chained-unlink" />
              <jalios:icon src="jportal-sidebar-chained-link" />
            </label>
          </div>
        </div>   
      </jalios:field>
    </div>
  </div>
  
  <div class="jportal-sidebar-group is-accordion jportal-sidebar-group-separated">
    <a class="sidebar-subtitle collapsed" data-toggle="collapse" href="#background" aria-expanded="false" aria-controls="background"><jalios:icon src="caret" /> <%= glp("jportal.edition.sidebar.ui.background.title") %></a>
    <div class="collapse sidebar-collapsed-group" id="background">
      <jalios:field resource="field-horizontal" name="backgroundColor" label="jportal.edition.sidebar.ui.background-color.label">
        <jalios:control settings='<%= new ColorSettings().css("jblock-css") %>' />
      </jalios:field>
      <jalios:field resource="field-horizontal" name="backgroundImage" label="jportal.edition.sidebar.ui.background-image.label">
        <jalios:control settings='<%= new ImagePathSettings().css("jblock-css") %>'></jalios:control>
      </jalios:field>
      <jalios:field resource="field-horizontal" name="backgroundPosition" label="jportal.edition.sidebar.ui.background-position.label">
        <% String[] backgroundPositionStyleValues = Util.split(channel.getProperty("jportal.css-style.background-position.style"), "|"); %>
        <jalios:control settings='<%= new EnumerateSettings().select().enumValues(backgroundPositionStyleValues).enumLabels(backgroundPositionStyleValues).css("jblock-css") %>' />
      </jalios:field>  
    </div>
  </div>
  
  <div class="jportal-sidebar-group is-accordion jportal-sidebar-group-separated">
    <a class="sidebar-subtitle collapsed" data-toggle="collapse" href="#font" aria-expanded="false" aria-controls="font"><jalios:icon src="caret" /> <%= glp("jportal.edition.sidebar.ui.fonts.title") %></a>
    <div class="collapse sidebar-collapsed-group" id="font">
      <jalios:field resource="field-horizontal" name="color" label="jportal.edition.sidebar.ui.text-color.label">
        <jalios:control settings='<%= new ColorSettings().css("jblock-css") %>' />
      </jalios:field>
    </div>
  </div>
  
  <% if(isJPortletEdition){ %>
	  <div class="jportal-sidebar-group is-accordion jportal-sidebar-group-separated">
	    <a class="sidebar-subtitle collapsed" data-toggle="collapse" href="#align" aria-expanded="false" aria-controls="font"><jalios:icon src="caret" />
	      <%= glp("jportal.edition.sidebar.align.label") %>
	    </a>
	    <div class="collapse sidebar-collapsed-group" id="align">
		
		    <jalios:field resource="field-horizontal" label="jportal.edition.sidebar.height.label" name="height">
	        <jalios:control settings='<%= new TextFieldSettings().css("jblock-css") %>' />
	      </jalios:field>
	      
		    <jalios:field resource="field-horizontal" label="jportal.edition.sidebar.width.label" name="width">
	        <jalios:control settings='<%= new TextFieldSettings().css("jblock-css") %>' />
	      </jalios:field>
	      
	      <jalios:field resource="field-horizontal" label="jportal.edition.sidebar.horizontal-align.label" name="horizontalAlign">
	        <% String[] centerStyle = Util.split(channel.getProperty("jportal.jblock-ui.horizontal-center.style"), "|"); %>
	        <% String[] centerStyleValues = Util.split(channel.getProperty("jportal.jblock-ui.center.style.values"), "|"); %>
	        <jalios:control settings='<%= new EnumerateSettings().select().enumValues(centerStyleValues).enumLabels(centerStyle) %>' />
	      </jalios:field>
	
		    
		    <!-- 
		    <jalios:field resource="field-horizontal" label="jportal.edition.sidebar.vertical-align.label" name="verticalAlign">
	        <% String[] centerStyle = Util.split(channel.getProperty("jportal.jblock-ui.vertical-center.style"), "|"); %>
	        <% String[] centerStyleValues = Util.split(channel.getProperty("jportal.jblock-ui.center.style.values"), "|"); %>
	        <jalios:control settings='<%= new EnumerateSettings().select().enumValues(centerStyleValues).enumLabels(centerStyle) %>' />
	      </jalios:field>
	      -->
	
	    </div>
	  </div>
  <% } %>
  
  <div class="jportal-sidebar-group is-accordion jportal-sidebar-group-separated">
	  <a class="sidebar-subtitle collapsed" data-toggle="collapse" href="#animation" aria-expanded="false" aria-controls="animation"><jalios:icon src="caret" />
	    <%= glp("jportal.edition.sidebar.animation.title") %>
	  </a>
	  <div class="collapse sidebar-collapsed-group" id="animation">
	    <jalios:field resource="field-horizontal" label="jportal.edition.sidebar.animation.label" name="animation">
	      <jalios:control settings='<%= formHandler.getEnumerateSettings("jportal.jblock-ui.animation.values") %>' />
	    </jalios:field>
      <jalios:field resource="field-horizontal" label="jportal.edition.sidebar.animation-duration.label" name="animationDuration">
        <jalios:control settings='<%= formHandler.getEnumerateSettings("jportal.jblock-ui.animation-duration.values") %>' />
      </jalios:field>
      <jalios:field resource="field-horizontal" label="jportal.edition.sidebar.animation-repeat.label" name="animationRepeat" description="jportal.edition.sidebar.animation-repeat.description">
        <jalios:control settings='<%= new BooleanSettings() %>' />
      </jalios:field>      
	  </div>
  </div>
  
  <div class="jportal-sidebar-group is-accordion jportal-sidebar-group-separated">
    <a class="sidebar-subtitle collapsed" data-toggle="collapse" href="#advanced" aria-expanded="false" aria-controls="advanced"><jalios:icon src="caret" /> <%= glp("jportal.edition.sidebar.ui.advanced.title") %></a>
    <div class="collapse sidebar-collapsed-group" id="advanced">
      <jalios:field resource="field-vertical" name="customClass" label="jportal.edition.sidebar.ui.custom-class.label">
        <jalios:control type="<%= ControlType.TEXTFIELD %>"></jalios:control>
      </jalios:field>
    </div>
  </div>
</div>
