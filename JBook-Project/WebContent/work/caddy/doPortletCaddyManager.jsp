<%@ include file='/jcore/doInitPage.jspf' %><%
%><%@page import="com.jalios.jcms.caddy.PublicationCaddyManagerHandler"%><%
%><%@page import="com.jalios.jcms.TypeFieldEntry"%><%
%><%@page import="com.jalios.jcms.portlet.Portal"%><%
%><%@page import="com.jalios.jcms.portlet.PortalElement"%><%
%><%@page import="com.jalios.jcms.portlet.PortalManager"%><%
%><%@page import="com.jalios.jcms.portlet.EditPortalHandler"%><%
%><%@page import="com.jalios.jcms.portlet.EditPortalElementHandler"%><%
%><%@page import="com.jalios.jcms.portlet.EditPortletCollectionHandler"%><%
%><%@page import="com.jalios.jcms.taglib.ControlType"%><%
%><%@page import="com.jalios.jcms.taglib.settings.impl.BooleanSettings"%><%
%><%@page import="com.jalios.jcms.taglib.settings.impl.EnumerateSettings"%><%
%><%@page import="com.jalios.jcms.taglib.settings.impl.PublicationSettings"%><%
%><%@page import="com.jalios.jcms.taglib.settings.impl.WysiwygSettings"%><%
%><%
PublicationCaddyManagerHandler formHandler = (PublicationCaddyManagerHandler) request.getAttribute("formHandler");
if (formHandler == null) {
  return;
}
%>
<div class="row">
<div class="col-xs-12">
<div class="tab-pane" id="CommonEditPortlet">
<%!
private EnumerateSettings newUpdateSettings(String fieldName) {
  final String updateFieldName = "update"+Util.recapitalize(fieldName);
  return new EnumerateSettings()
      .checkbox().enumValues("true").enumLabels("ui.com.btn.update")
      .name(updateFieldName)
      .value(getBooleanParameter(updateFieldName, false))
      .css("small");
}
private BasicSettings checkUpdateSettingsOnChange(ControlSettings settings, String fieldName) {
  final String updateFieldName = "update"+Util.recapitalize(fieldName);
  return ((BasicSettings)settings).onChange("add:checked").dataAttribute("jalios-target", "INPUT[name="+updateFieldName+"]");
}
%>

<jalios:if predicate="<%= formHandler.isPortal() %>">
  <div class="tab-page">
    <h2 class="tab"><jalios:icon src="portal-collection" title="ui.editportlet.children" /> <%= glp("ui.editportlet.children") %></h2>
    
     <%-- Child ------------------------------------------------------------ --%>
     <jalios:field name="child" label="ui.editportlet.child" value="<%= formHandler.getAvailableChild() %>" tooltip="ui.editportlet.title.child">
       <jalios:control settings='<%= checkUpdateSettingsOnChange(new PublicationSettings().superType(PortalElement.class), "child") %>' />
       <jalios:buffer name="WIDGET_APPEND">
         <jalios:control settings='<%= newUpdateSettings("child") %>'/>
        </jalios:buffer>
     </jalios:field>

     <%-- ExactCategory ------------------------------------------------------------ --%>
     <jalios:field name="exactCategory" label="ui.editportlet.exaccat" description="ui.editportlet.exaccat.h" value="<%= formHandler.getAvailableExactCategory() %>">
       <jalios:control settings='<%= checkUpdateSettingsOnChange(new BooleanSettings(), "exactCategory") %>' />
       <jalios:buffer name="WIDGET_APPEND">
         <jalios:control settings='<%= newUpdateSettings("exactCategory") %>'/>
        </jalios:buffer>
     </jalios:field>

    <%-- CssFile ------------------------------------------------------------ --%> 
    <% String cssFile = formHandler.getAvailableCssFile(); %>
    <%
       List cssPath = new ArrayList();
       File[] cssFiles = PortalManager.getCssFiles();
       if (cssFiles != null){
         for (int i = 0 ; i < cssFiles.length ; i++){
           cssPath.add(channel.getRelativePath(cssFiles[i]));
         }
       }
    %>
    <jalios:field name="cssFile" label="ui.editportlet.cssfile" tooltip="ui.editportlet.title.cssfile" value="<%= cssFile %>">
      <jalios:control settings='<%= checkUpdateSettingsOnChange(new EnumerateSettings().select().enumValues(cssPath), "cssFile") %>' />
       <jalios:buffer name="WIDGET_APPEND">
         <jalios:control settings='<%= newUpdateSettings("cssFile") %>'/>
        </jalios:buffer>
    </jalios:field>
  
  </div>
</jalios:if>

<jalios:if predicate="<%= formHandler.isPortletSkinable() %>">
  <div class="tab-page">
    <h2 class="tab"><jalios:icon src="portal-look-nfeel3" title="ui.editportlet.skin" /> <%= glp("ui.editportlet.skin") %></h2>
    
    <%-- Classes ----------------------------------------------%>
    <% String skinClassesValues  = formHandler.getAvailableSkinClasses(); %>
    <jalios:field name='<%= "skinClasses" %>' label="ui.editportlet.skinclasses" tooltip="ui.editportlet.skinclasses.h" value='<%= skinClassesValues %>'>
      <jalios:control settings='<%= checkUpdateSettingsOnChange(new TextFieldSettings(), "skinClasses") %>'/> 
      <jalios:buffer name="WIDGET_APPEND">
       <jalios:control settings='<%= newUpdateSettings("skinClasses") %>'/>
      </jalios:buffer>
    </jalios:field>

    
    <%-- SkinFooter ----------------------------------------------%>
    <% WysiwygSettings skinFooterSettings = new WysiwygSettings().configurationId("light").dataAttribute("data-height", "30").dataAttribute("data-min_height", "30"); %>
    <jalios:field name='<%= "skinFooter" %>' label="types.AbstractPortletSkinable.fields.skinFooter.label" value='<%= formHandler.getAllAvailableSkinFooterML() %>' ml="true">
      <jalios:control settings='<%= checkUpdateSettingsOnChange(skinFooterSettings, "skinFooter") %>' />
      <jalios:buffer name="WIDGET_APPEND">
       <jalios:control settings='<%= newUpdateSettings("skinFooter") %>'/>
      </jalios:buffer>
    </jalios:field>
    
  </div>
</jalios:if>

<jalios:if predicate="<%= formHandler.isPortlet() %>">
  <div class="tab-page">
    <h2 class="tab"><jalios:icon src="portal-look-nfeel" title="ui.editportlet.looknfeel" /> <%= glp("ui.editportlet.looknfeel") %></h2>
    <% boolean enable = formHandler.isPortletSkinable(); %>
    <div class="col-md-8">
       <%-- DISPLAY TITLE--%>
       <% TypeFieldEntry displayTitleTFE = channel.getTypeFieldEntry(AbstractPortletSkinable.class, "displayTitle", true); %>
         <jalios:field name="displayTitle" ml="<%= channel.isMultilingual() %>" disabled="true"
                       label="<%= displayTitleTFE.getLabel(userLang) %>" tooltip="<%= displayTitleTFE.getDescription(userLang) %>">
           <jalios:control type="<%= ControlType.TEXTFIELD %>" />
         </jalios:field>
       <%-- EXPAND STATE --%>
       <% 
         TypeFieldEntry expandStateTFE = channel.getTypeFieldEntry(AbstractPortletSkinable.class, "expandState", true);
         EnumerateSettings expandStateSettings = new EnumerateSettings().select()
             .enumValues("Enable", "Hidden", "Minimized")
             .enumLabels("ui.editPortlet.skin.enabled", "ui.editPortlet.skin.disabled", "ui.editPortlet.skin.minimized");
         String expandState = enable ? Util.getString(formHandler.getAvailableExpandState(),"") : ""; 
       %>
       <jalios:field name='expandState' disabled='<%= !enable %>' value='<%= expandState %>'
                     label="<%= expandStateTFE.getLabel(userLang) %>" tooltip="<%= expandStateTFE.getDescription(userLang) %>">
         <jalios:control settings='<%= checkUpdateSettingsOnChange(expandStateSettings, "expandState") %>' />
         <jalios:buffer name="WIDGET_APPEND">
           <jalios:control settings='<%= newUpdateSettings("expandState") %>'/>
         </jalios:buffer>
       </jalios:field>
       <%-- POPUP STATE--%>
       <%
         TypeFieldEntry popupStateTFE = channel.getTypeFieldEntry(AbstractPortletSkinable.class, "popupState", true);
         EnumerateSettings popupStateSettings = new EnumerateSettings().select()
                .enumValues("Hidden", "Enable", "Popup")
                .enumLabels("ui.editPortlet.skin.disabled", "ui.editPortlet.skin.enabled", "ui.editPortlet.skin.popup");
          String popupState = enable ? Util.getString(formHandler.getAvailablePopupState(),"") : "";
       %>
       <jalios:field name="popupState" disabled="<%= !enable %>" value="<%= popupState %>"
                     label="<%= popupStateTFE.getLabel(userLang) %>" tooltip="<%= popupStateTFE.getDescription(userLang) %>">
        <jalios:control settings='<%= checkUpdateSettingsOnChange(popupStateSettings, "popupState") %>' />
         <jalios:buffer name="WIDGET_APPEND">
           <jalios:control settings='<%= newUpdateSettings("popupState") %>'/>
         </jalios:buffer>
       </jalios:field>
       <%-- BACK IMAGE--%>
       <% TypeFieldEntry backImageTFE = channel.getTypeFieldEntry(AbstractPortletSkinable.class, "backImage", true); %>
       <jalios:field name="backImage" value="<%= formHandler.getAvailableBackImage() %>"
                     label="<%= backImageTFE.getLabel(userLang) %>" tooltip="<%= backImageTFE.getDescription(userLang) %>">
         <jalios:control settings='<%= checkUpdateSettingsOnChange(new ImagePathSettings(), "backImage") %>'/>
         <jalios:buffer name="WIDGET_APPEND">
           <jalios:control settings='<%= newUpdateSettings("backImage") %>'/>
         </jalios:buffer>
       </jalios:field>
       <%-- BORDER--%>
       <% TypeFieldEntry borderTFE = channel.getTypeFieldEntry(AbstractPortletSkinable.class, "border", true); %>
       <jalios:field name="border" value="<%= formHandler.getAvailableBorder() %>"
                     label="<%= borderTFE.getLabel(userLang) %>" tooltip="<%= borderTFE.getDescription(userLang) %>">
         <jalios:control settings='<%= checkUpdateSettingsOnChange(new NumberSettings(), "border") %>'/>
         <jalios:buffer name="WIDGET_APPEND">
           <jalios:control settings='<%= newUpdateSettings("border") %>'/>
         </jalios:buffer>
       </jalios:field>
       <%-- BACK COLOR--%>
       <% TypeFieldEntry backColorTFE = channel.getTypeFieldEntry(AbstractPortletSkinable.class, "backColor", true); %>
       <jalios:field name="backColor" value="<%= formHandler.getAvailableBackColor() %>"
                     label="<%= backColorTFE.getLabel(userLang) %>" tooltip="<%= backColorTFE.getDescription(userLang) %>">
         <jalios:control settings='<%= checkUpdateSettingsOnChange(new ColorSettings(), "backColor") %>'/>
         <jalios:buffer name="WIDGET_APPEND">
           <jalios:control settings='<%= newUpdateSettings("backColor") %>'/>
         </jalios:buffer>
       </jalios:field>
       <%-- BORDER COLOR--%>
       <% TypeFieldEntry borderColorTFE = channel.getTypeFieldEntry(AbstractPortletSkinable.class, "borderColor", true); %>
       <jalios:field name="borderColor" value="<%= formHandler.getAvailableBorderColor() %>"
                     label="<%= borderColorTFE.getLabel(userLang) %>" tooltip="<%= borderColorTFE.getDescription(userLang) %>">
         <jalios:control settings='<%= checkUpdateSettingsOnChange(new ColorSettings(), "borderColor") %>'/>
         <jalios:buffer name="WIDGET_APPEND">
           <jalios:control settings='<%= newUpdateSettings("borderColor") %>'/>
         </jalios:buffer>
       </jalios:field>
    </div>
    <% request.setAttribute("field-inline", "true"); %>
    <div class="col-md-4 br">
      <table>
        <tr>
          <td rowspan="2" class="text-right">
            <%-- DISPLAY TITLE--%>
            <%= encodeForHTML(displayTitleTFE.getLabel(userLang)) %>
          </td>
          <td class="text-right">
            <%-- EXPAND STATE --%>
            <i><%= encodeForHTML(expandStateTFE.getLabel(userLang)) %></i>
          </td>
          <td><img src="s.gif" alt="" /></td>
        </tr>
        <tr>
          <td rowspan="3"><jalios:icon src="lookn-feel" /></td>
          <td>
            <%-- POPUP STATE--%>
            <i><%= encodeForHTML(popupStateTFE.getLabel(userLang)) %></i>
          </td>
        </tr>
        <tr>
          <td>
            <%-- BACK IMAGE--%>
            <i><%= encodeForHTML(backImageTFE.getLabel(userLang)) %></i>
          </td>
          <td>
            <%-- BORDER--%>
            <i><%= encodeForHTML(borderTFE.getLabel(userLang)) %></i>
          </td>
        </tr>
        <tr>
          <td>
            <%-- BACK COLOR--%>
            <i><%= encodeForHTML(backColorTFE.getLabel(userLang)) %></i>
            </td>
            <td>
            <%-- BORDER COLOR--%>
            <i><%= encodeForHTML(borderColorTFE.getLabel(userLang)) %></i>
          </td>
        </tr>
      </table>
    </div>
    <% request.removeAttribute("field-inline"); %>
  </div>
</jalios:if>


<jalios:if predicate="<%= formHandler.isPortlet() %>">
  <div class="tab-page">
    <h2 class="tab"><jalios:icon src="portal-geometry" title="ui.editportlet.inset-padding" /> <%= glp("ui.editportlet.inset-padding") %></h2>

    <div class="col-md-8">
         <%-- INSET TOP --%>
         <% TypeFieldEntry insetTopTFE = channel.getTypeFieldEntry(AbstractPortlet.class, "insetTop", true); %>
         <jalios:field name="insetTop" value="<%= formHandler.getAvailableInsetTop() %>"
                       label="<%= insetTopTFE.getLabel(userLang) %>" tooltip="<%= insetTopTFE.getDescription(userLang) %>">
           <jalios:control settings='<%= checkUpdateSettingsOnChange(new NumberSettings(), "insetTop") %>'>
             <jalios:buffer name="APPEND">px</jalios:buffer>
           </jalios:control>
           <jalios:buffer name="WIDGET_APPEND">
             <jalios:control settings='<%= newUpdateSettings("insetTop") %>'/>
           </jalios:buffer>
         </jalios:field>
          <%-- INSET LEFT --%>
         <% TypeFieldEntry insetLeftTFE = channel.getTypeFieldEntry(AbstractPortlet.class, "insetLeft", true); %>
          <jalios:field name="insetLeft" value="<%= formHandler.getAvailableInsetLeft() %>"
                        label="<%= insetLeftTFE.getLabel(userLang) %>" tooltip="<%= insetLeftTFE.getDescription(userLang) %>">
           <jalios:control settings='<%= checkUpdateSettingsOnChange(new NumberSettings(), "insetLeft") %>'>
              <jalios:buffer name="APPEND">px</jalios:buffer>
            </jalios:control>
            <jalios:buffer name="WIDGET_APPEND">
              <jalios:control settings='<%= newUpdateSettings("insetLeft") %>'/>
            </jalios:buffer>
          </jalios:field>
          <%-- CELL PADDING --%>
         <% TypeFieldEntry cellPaddingTFE = channel.getTypeFieldEntry(AbstractPortlet.class, "cellPadding", true); %>
          <jalios:field name="cellPadding" value="<%= formHandler.getAvailableCellPadding() %>"
                        label="<%= cellPaddingTFE.getLabel(userLang) %>" tooltip="<%= cellPaddingTFE.getDescription(userLang) %>">
           <jalios:control settings='<%= checkUpdateSettingsOnChange(new NumberSettings(), "cellPadding") %>'>
              <jalios:buffer name="APPEND">px</jalios:buffer>
            </jalios:control>
            <jalios:buffer name="WIDGET_APPEND">
              <jalios:control settings='<%= newUpdateSettings("cellPadding") %>'/>
            </jalios:buffer>
          </jalios:field>
          <%-- INSET RIGHT --%>
         <% TypeFieldEntry insetRightTFE = channel.getTypeFieldEntry(AbstractPortlet.class, "insetRight", true); %>
          <jalios:field name="insetRight" value="<%= formHandler.getAvailableInsetRight() %>"
                        label="<%= insetRightTFE.getLabel(userLang) %>" tooltip="<%= insetRightTFE.getDescription(userLang) %>">
           <jalios:control settings='<%= checkUpdateSettingsOnChange(new NumberSettings(), "insetRight") %>'>
              <jalios:buffer name="APPEND">px</jalios:buffer>
            </jalios:control>
            <jalios:buffer name="WIDGET_APPEND">
              <jalios:control settings='<%= newUpdateSettings("insetRight") %>'/>
            </jalios:buffer>
          </jalios:field>
          <%-- INSET BOTTOM --%>
         <% TypeFieldEntry insetBottomTFE = channel.getTypeFieldEntry(AbstractPortlet.class, "insetBottom", true); %>
          <jalios:field name="insetBottom" value="<%= formHandler.getAvailableInsetBottom() %>"
                        label="<%= insetBottomTFE.getLabel(userLang) %>" tooltip="<%= insetBottomTFE.getDescription(userLang) %>">
           <jalios:control settings='<%= checkUpdateSettingsOnChange(new NumberSettings(), "insetBottom") %>'>
              <jalios:buffer name="APPEND">px</jalios:buffer>
            </jalios:control>
            <jalios:buffer name="WIDGET_APPEND">
              <jalios:control settings='<%= newUpdateSettings("insetBottom") %>'/>
            </jalios:buffer>
          </jalios:field>
    </div>
    <% request.setAttribute("field-inline", "true"); %>  
    <div class="col-md-4 br ">
    <table>
      <tr>
        <td>&nbsp;</td>
        <td colspan="3" class="text-center">
         <%-- INSET TOP --%>
         <i><%= encodeForHTML(insetTopTFE.getLabel(userLang)) %></i>
        </td>
        <td>&nbsp;</td>
      </tr>
      <tr><td colspan="5" class="text-center"><jalios:icon src="dual-arrow-v" /></td></tr>
      <tr>
        <td class="text-right">
          <%-- INSET LEFT --%>
         <i><%= encodeForHTML(insetLeftTFE.getLabel(userLang)) %></i>
        </td>
        <td class="text-center"><jalios:icon src="dual-arrow-h" /></td>
        <td>
          <table background="images/jalios/icons/portal/interfaces/Geometry.gif" style="background-repeat: no-repeat; width: 163px; height: 109px;">
            <tr><td><img src="s.gif" width="1" height="20" alt="" /></td></tr>
            <tr>
              <td><img src="s.gif" width="10" height="1" alt="" /></td>
              <td class="text-center">
                <%-- CELL PADDING --%>
                <i style="background-color:white;"><%= encodeForHTML(cellPaddingTFE.getLabel(userLang)) %></i>
              </td>
              <td><img src="s.gif" width="10" height="1" alt="" /></td>
            </tr>
            <tr><td><img src="s.gif" width="1" height="10" alt="" /></td></tr>
          </table>
        </td>
        <td class="text-center"><jalios:icon src="dual-arrow-h" /></td>
        <td>
          <%-- INSET RIGHT --%>
          <i><%= encodeForHTML(insetRightTFE.getLabel(userLang)) %></i>
         </td>
      </tr>
      <tr>
        <td colspan="5" class="text-center"><jalios:icon src="dual-arrow-v" /></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td colspan="3" class="text-center">
          <%-- INSET BOTTOM --%>
          <i><%= encodeForHTML(insetBottomTFE.getLabel(userLang)) %></i>
        </td>
        <td>&nbsp;</td>
      </tr>
    </table>
    </div>
    <% request.removeAttribute("field-inline"); %>
  </div>
</jalios:if>



<jalios:if predicate="<%= formHandler.isPortlet() %>">
  <div class="tab-page">
    <h2 class="tab"><jalios:icon src="portal-geometry2" title="ui.editportlet.box-text-align" /> <%= glp("ui.editportlet.box-text-align") %></h2>
    <div class="col-md-8">
            <%-- ALIGN V --%>
            <%
            TypeFieldEntry alignVTFE = channel.getTypeFieldEntry(AbstractPortlet.class, "alignV", true);
            ControlSettings alignVSettings = alignVTFE.getControlSettings();
            ControlUtils.addOption(alignVSettings, SelectorSettings.ENUM_VALUES, AbstractPortlet.getAlignVValues());
            ControlUtils.addOption(alignVSettings, SelectorSettings.ENUM_LABELS, AbstractPortlet.getAlignVLabels(userLang));
            %>
            <jalios:field name="alignV" value="<%= formHandler.getAvailableAlignV() %>"
                          label="<%= alignVTFE.getLabel(userLang) %>" tooltip="<%= alignVTFE.getDescription(userLang) %>">
              <jalios:control settings='<%= checkUpdateSettingsOnChange(alignVSettings, "alignV") %>'/>
              <jalios:buffer name="WIDGET_APPEND">
                <jalios:control settings='<%= newUpdateSettings("alignV") %>'/>
              </jalios:buffer>
            </jalios:field>
            <%-- WIDTH --%>
            <%
            TypeFieldEntry widthTFE = channel.getTypeFieldEntry(AbstractPortlet.class, "width", true);
            %>
            <jalios:field name="width" value="<%= formHandler.getAvailableWidth() %>" 
                          label="<%= widthTFE.getLabel(userLang) %>" tooltip="ui.editportlet.width.h">
              <jalios:control settings='<%= checkUpdateSettingsOnChange(new NumberSettings(), "width") %>'/>
              <jalios:buffer name="WIDGET_APPEND">
                <jalios:control settings='<%= newUpdateSettings("width") %>'/>
              </jalios:buffer>
            </jalios:field>
            <%-- ALIGN H --%>
            <%
            TypeFieldEntry alignHTFE = channel.getTypeFieldEntry(AbstractPortlet.class, "alignH", true);
            ControlSettings alignHSettings = alignHTFE.getControlSettings();
            ControlUtils.addOption(alignHSettings, SelectorSettings.ENUM_VALUES, AbstractPortlet.getAlignHValues());
            ControlUtils.addOption(alignHSettings, SelectorSettings.ENUM_LABELS, AbstractPortlet.getAlignHLabels(userLang));
            %>
            <jalios:field name="alignH" value="<%= formHandler.getAvailableAlignH() %>"
                          label="<%= alignHTFE.getLabel(userLang) %>" tooltip="<%= alignHTFE.getDescription(userLang) %>">
              <jalios:control settings='<%= checkUpdateSettingsOnChange(alignHSettings, "alignH") %>'/>
              <jalios:buffer name="WIDGET_APPEND">
                <jalios:control settings='<%= newUpdateSettings("alignH") %>'/>
              </jalios:buffer>
            </jalios:field>
            <%-- ALIGN TABLE --%>
            <%
            TypeFieldEntry alignTableTFE = channel.getTypeFieldEntry(AbstractPortlet.class, "alignTable", true);
            ControlSettings alignTableSettings = alignTableTFE.getControlSettings();
            ControlUtils.addOption(alignTableSettings, SelectorSettings.ENUM_VALUES, AbstractPortlet.getAlignTableValues());
            ControlUtils.addOption(alignTableSettings, SelectorSettings.ENUM_LABELS, AbstractPortlet.getAlignTableLabels(userLang));
            %>
            <jalios:field name="alignTable" value="<%= formHandler.getAvailableAlignTable() %>" 
                          label="<%= alignTableTFE.getLabel(userLang) %>" tooltip="<%= alignTableTFE.getDescription(userLang) %>">
              <jalios:control settings='<%= checkUpdateSettingsOnChange(alignTableSettings, "alignTable") %>'/>
              <jalios:buffer name="WIDGET_APPEND">
                <jalios:control settings='<%= newUpdateSettings("alignTable") %>'/>
              </jalios:buffer>
            </jalios:field>   
     </div>
    
    <% request.setAttribute("field-inline", "true"); %>
    <div class="col-md-4 br">
      <table>
        <tr>
          <td class="text-center"><jalios:icon src="arrow-small-up" /></td>
          <td colspan="3" rowspan="3">
            <table background="images/jalios/icons/portal/interfaces/GeometrySize.gif" style="background-repeat: no-repeat; width: 126px; height: 89px; ">
              <tr>
                <td colspan="3"><img src="s.gif" width="1" height="15" alt="" /></td>
              </tr>
              <tr>
                <td><img src="s.gif" width="10" height="1" alt="" /></td>
                <td class="text-center">
                 <%-- WIDTH --%>
                 <i style="background-color:white;"><%= encodeForHTML(widthTFE.getLabel(userLang)) %></i>
                </td>
                <td><img src="s.gif" width="10" height="1" alt="" /></td>
              </tr>
              <tr><td colspan="3"><img src="s.gif" width="1" height="10" alt="" /></td></tr>
            </table>
          </td>
          <td rowspan="3">&nbsp;&nbsp;</td>
          <td rowspan="3">
            <%-- ALIGN TABLE --%>
            <i><%= encodeForHTML(alignTableTFE.getLabel(userLang)) %></i> 
          </td>
        </tr>
        <tr>
          <td>
            <%-- ALIGN V --%>
            <i><%= encodeForHTML(alignVTFE.getLabel(userLang)) %></i> 
          </td>
        </tr>
        <tr>
          <td class="text-center"><jalios:icon src="arrow-small-down" /></td>
        </tr>
        <tr>
          <td></td>
          <td><jalios:icon src="arrow-small-left" /></td>
          <td class="text-center">
            <%-- ALIGN H --%>
            <i><%= encodeForHTML(alignHTFE.getLabel(userLang)) %></i> 
          </td>
          <td><jalios:icon src="arrow-small-right" /></td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
       </table>
   </div>
   <% request.removeAttribute("field-inline"); %>
  </div>
</jalios:if>

<jalios:if predicate="<%= formHandler.isPortalElement() %>">
  <div class="tab-page">
    <h2 class="tab"><jalios:icon src="caches" title="ui.portal.alt.portalcache" /> <%= glp("ui.portal.alt.portalcache") %></h2>
    
    <div class="form-horizontal">
    
      <%-- CacheType ------------------------------------------------------------ --%> 
      <% String cacheType = Util.getString(formHandler.getAvailableCacheType(),""); %>
      <% EnumerateSettings cacheTypeSettings = new EnumerateSettings().select().enumValues(AbstractPortlet.getCacheTypeValues()).enumLabels(AbstractPortlet.getCacheTypeLabels(userLang)); %>
      <jalios:field name='<%= "cacheType" %>' label='<%= glp("ui.editportlet.cachetype") %>' tooltip='<%= glp("ui.editportlet.title.cachetype") %>' value='<%= cacheType %>'>
        <jalios:control settings='<%= checkUpdateSettingsOnChange(cacheTypeSettings, "cacheType") %>' />
        <jalios:buffer name="WIDGET_APPEND">
          <jalios:control settings='<%= newUpdateSettings("cacheType") %>'/>
        </jalios:buffer>
      </jalios:field>

          
      <%-- CacheSensibility ------------------------------------------------------------ --%> 
      <% String cacheSensibility = Util.getString(formHandler.getAvailableCacheSensibility(),""); %>
      <% EnumerateSettings cacheSensibilitySettings = new EnumerateSettings().select().enumValues(AbstractPortlet.getCacheSensibilityValues()).enumLabels(AbstractPortlet.getCacheSensibilityLabels(userLang)); %>
      <jalios:field name='<%= "cacheSensibility" %>' label='<%= glp("ui.editportlet.cacherefine") %>' description='<%= glp("ui.editportlet.title.cacherefine") %>' value='<%= cacheSensibility %>'>
        <jalios:control settings='<%= checkUpdateSettingsOnChange(cacheSensibilitySettings, "cacheSensibility") %>' />
        <jalios:buffer name="WIDGET_APPEND">
          <jalios:control settings='<%= newUpdateSettings("cacheSensibility") %>'/>
        </jalios:buffer>
      </jalios:field>

      <%-- CacheData ------------------------------------------------------------ --%> 
      <% 
        String[] invalidClassArray   = formHandler.getAvailableInvalidClass();
        invalidClassArray = (invalidClassArray == null) ? new String[0] : invalidClassArray; 
        
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
        EnumerateSettings invalidClassSettings = new EnumerateSettings().select().enumValues(enumValues).enumLabels(enumLabels);
      %>
      <jalios:field name='<%= "invalidClass" %>' label='<%= glp("ui.editportlet.cachedata") %>' value='<%= invalidClassArray %>' mv='<%= 1 %>'>
        <jalios:control settings='<%= checkUpdateSettingsOnChange(invalidClassSettings, "invalidClass") %>' />
      </jalios:field>
      <%--
       For some reason, if the following update control is place inside the field above, 
       it prevents the "add items" to be displayed... use a dedicated jalios:field for this purpose
      --%>
      <jalios:field>
        <jalios:control settings='<%= newUpdateSettings("invalidClass") %>'/>
      </jalios:field>
          
      <%-- Invalidtime ------------------------------------------------------------ --%>
      <% long invalidtimeValues = formHandler.getAvailableInvalidTime(); %>
      <% DurationSettings invalidTimeSettings = new DurationSettings().resolution(DurationSettings.Resolution.MINUTE); %>
      <jalios:field name='<%= "invalidTime" %>' label="ui.editportlet.cachetimeout" description="ui.editportlet.title.cachetimeout" value='<%= ""+invalidtimeValues %>'>
        <jalios:control settings='<%= checkUpdateSettingsOnChange(invalidTimeSettings, "invalidTime") %>' />
        <jalios:buffer name="WIDGET_APPEND">
          <jalios:control settings='<%= newUpdateSettings("invalidTime") %>'/>
        </jalios:buffer>
      </jalios:field>
      
    </div>
    
  </div>
</jalios:if>

<jalios:if predicate='<%= formHandler.isPortlet() %>'>
  <div class="tab-page">
    <h2 class="tab"><jalios:icon src='advanced-gray' title='<%= glp("ui.portal.alt.portalcustomize") %>' /> <%= glp("ui.portal.alt.portalcustomize") %></h2>

    <div class="form-horizontal">
    
      <%-- BehaviorCopy ------------------------------------------------------------ --%>
      <% EnumerateSettings behaviorCopySettings = new EnumerateSettings().select().enumValues("true", "false", "ws").enumLabels("ui.editportlet.behaviorcopy.copy", "ui.editportlet.behaviorcopy.ref", "ui.editportlet.behaviorcopy.ws"); %> 
      <jalios:field name='<%= "behaviorCopy" %>' label='<%= glp("ui.editportlet.behaviorcopy") %>' value='<%= ""+formHandler.getAvailableBehaviorCopy() %>'>
        <jalios:control settings='<%= checkUpdateSettingsOnChange(behaviorCopySettings, "behaviorCopy") %>' />
        <jalios:buffer name="WIDGET_APPEND">
          <jalios:control settings='<%= newUpdateSettings("behaviorCopy") %>'/>
        </jalios:buffer>
      </jalios:field>

      <%-- Condition ------------------------------------------------------------ --%> 
      <% 
      TypeFieldEntry conditionTFE = channel.getTypeFieldEntry(AbstractPortlet.class, "condition", true);
      String conditionLabel = conditionTFE.getLabel(userLang);
      String[] conditionValues = formHandler.getAvailableCondition();
      String conditionDescription = conditionTFE.getDescription(userLang);
      String[] enumLabels = (String[]) AbstractPortlet.getConditionLabels(userLang);
      String[] enumValues = AbstractPortlet.getConditionValues();
      Class<? extends PortalElement> portalElementSuperClass = formHandler.isPortalElement() ? (Class<? extends PortalElement>) formHandler.getCommonSuperClass() : AbstractPortlet.class;
      String[] enumLabelsCustom = TemplatePolicyManager.getInstance().getConditionLabels(enumLabels,portalElementSuperClass,userLang);
      String[] enumValuesCustom = TemplatePolicyManager.getInstance().getConditionValues(enumValues,portalElementSuperClass);
      int addCount = enumValues != enumValuesCustom ? 1 : 0;
      EnumerateSettings conditionSettings = new EnumerateSettings().select().enumValues(enumValuesCustom).enumLabels(enumLabelsCustom);
      %>
      <jalios:field name='<%= "condition" %>' label='<%= conditionLabel %>' description='<%= conditionDescription %>' value='<%= Util.getFirst(conditionValues) %>'>
        <jalios:control settings='<%= checkUpdateSettingsOnChange(conditionSettings, "condition") %>' />
        <jalios:buffer name="WIDGET_APPEND">
          <jalios:control settings='<%= newUpdateSettings("condition") %>'/>
        </jalios:buffer>
      </jalios:field>


      <% 
        String[] abilities      = PortalElement.getAllAbilities(formHandler.getCommonSuperClass()); 
        if (Util.notEmpty(abilities)) {
          List<String>     abilitiesList  = Util.getArrayList(formHandler.getAvailableAbilities());
      %>
    
          <jalios:field name="abilities" label="ui.editportlet.abilities" description="ui.editportlet.abilities.h">
            <input type="hidden" name="abilities" value="" />
              <% String section = null; %>
              <jalios:foreach array="<%= abilities %>" type="String" name="itAbility">
                <% 
                  String tmpSection = itAbility.substring(0,itAbility.lastIndexOf('.'));
                  if (!tmpSection.equals(section)){ 
                  // Close previous section if any
                    if (section != null) { %></ol></li><% }
                  // Open new section
                    %><li class='list-unstyled'>    <label><%= glp(tmpSection) %></label><ol><%
                    section = tmpSection;
                  }
                %>
                <li>
                 <label>
                   <input type="checkbox" name="abilities" value="<%= itAbility %>" class="formCheckbox" <%= abilitiesList.contains(itAbility) ? "checked='checked'" : "" %>
                          data-jalios-event="change" data-jalios-action="add:checked" data-jalios-target="INPUT[name=updateAbilities]"/>
                   <%= glp(itAbility) %>
                 </label>
                </li>
              </jalios:foreach>
              </ol></li><%-- ends of section --%>
            </ol>
            <jalios:buffer name="WIDGET_APPEND">
              <jalios:control settings='<%= newUpdateSettings("abilities") %>'/>
            </jalios:buffer>
          </jalios:field>
      <% } %>
    </div>
    
  </div>
</jalios:if>


</div>
</div>
</div>
