// This class was automatically generated by jsc. Please, do not edit.
// Generation date: Thu Apr 04 15:21:38 WET 2024

package generated;

import java.util.*;
import com.jalios.jstore.*;

@SuppressWarnings("unchecked")
public class PortletImage_HANDLER implements com.jalios.jstore.StorableHandler {

  @SuppressWarnings("rawtypes")
  public void setAttributes(com.jalios.jstore.Storable storable, StorableLogEntry sle, com.jalios.jstore.Store store) {
    PortletImage handler = (generated.PortletImage)storable;
    String value;
    Map<String,String> attributes = sle.getAttributes();
    value = attributes.get("image");
    if (value != null) {
      handler.setImage((java.lang.String)StoreUtil.decodeObject(java.lang.String.class, value, store, new DecodeContext(sle, "image")));
    }

    value = attributes.get("imageML");
    if (value != null) {
      handler.setImageML((java.util.HashMap)StoreUtil.decodeObject(java.util.HashMap.class, value, store, new DecodeContext(sle, "imageML")));
    }

    value = attributes.get("link");
    if (value != null) {
      handler.setLink((java.lang.String)StoreUtil.decodeObject(java.lang.String.class, value, store, new DecodeContext(sle, "link")));
    }

    value = attributes.get("linkML");
    if (value != null) {
      handler.setLinkML((java.util.HashMap)StoreUtil.decodeObject(java.util.HashMap.class, value, store, new DecodeContext(sle, "linkML")));
    }

    value = attributes.get("alt");
    if (value != null) {
      handler.setAlt((java.lang.String)StoreUtil.decodeObject(java.lang.String.class, value, store, new DecodeContext(sle, "alt")));
    }

    value = attributes.get("altML");
    if (value != null) {
      handler.setAltML((java.util.HashMap)StoreUtil.decodeObject(java.util.HashMap.class, value, store, new DecodeContext(sle, "altML")));
    }

    value = attributes.get("targetWindow");
    if (value != null) {
      handler.setTargetWindow((java.lang.String)StoreUtil.decodeObject(java.lang.String.class, value, store, new DecodeContext(sle, "targetWindow")));
    }

    value = attributes.get("imgWidth");
    if (value != null) {
        try {handler.setImgWidth((Integer.valueOf(value)).intValue());} catch(NumberFormatException ex) {}
    }

    value = attributes.get("imgHeight");
    if (value != null) {
        try {handler.setImgHeight((Integer.valueOf(value)).intValue());} catch(NumberFormatException ex) {}
    }

    value = attributes.get("description");
    if (value != null) {
      handler.setDescription((java.lang.String)StoreUtil.decodeObject(java.lang.String.class, value, store, new DecodeContext(sle, "description")));
    }

    value = attributes.get("descriptionML");
    if (value != null) {
      handler.setDescriptionML((java.util.HashMap)StoreUtil.decodeObject(java.util.HashMap.class, value, store, new DecodeContext(sle, "descriptionML")));
    }

    value = attributes.get("portletImage");
    if (value != null) {
      handler.setPortletImage((java.lang.String)StoreUtil.decodeObject(java.lang.String.class, value, store, new DecodeContext(sle, "portletImage")));
    }

    value = attributes.get("portletImageML");
    if (value != null) {
      handler.setPortletImageML((java.util.HashMap)StoreUtil.decodeObject(java.util.HashMap.class, value, store, new DecodeContext(sle, "portletImageML")));
    }

    value = attributes.get("cacheType");
    if (value != null) {
      handler.setCacheType((java.lang.String)StoreUtil.decodeObject(java.lang.String.class, value, store, new DecodeContext(sle, "cacheType")));
    }

    value = attributes.get("cacheSensibility");
    if (value != null) {
      handler.setCacheSensibility((java.lang.String)StoreUtil.decodeObject(java.lang.String.class, value, store, new DecodeContext(sle, "cacheSensibility")));
    }

    value = attributes.get("invalidClass");
    if (value != null) {
      handler.setInvalidClass((java.lang.String[])StoreUtil.decodeObject(java.lang.String[].class, value, store, new DecodeContext(sle, "invalidClass")));
    }

    value = attributes.get("invalidTime");
    if (value != null) {
        try {handler.setInvalidTime((Long.valueOf(value)).longValue());} catch(NumberFormatException ex) {}
    }

    value = attributes.get("displayCSS");
    if (value != null) {
      handler.setDisplayCSS((java.lang.String)StoreUtil.decodeObject(java.lang.String.class, value, store, new DecodeContext(sle, "displayCSS")));
    }

    value = attributes.get("width");
    if (value != null) {
      handler.setWidth((java.lang.String)StoreUtil.decodeObject(java.lang.String.class, value, store, new DecodeContext(sle, "width")));
    }

    value = attributes.get("insetLeft");
    if (value != null) {
        try {handler.setInsetLeft((Integer.valueOf(value)).intValue());} catch(NumberFormatException ex) {}
    }

    value = attributes.get("insetRight");
    if (value != null) {
        try {handler.setInsetRight((Integer.valueOf(value)).intValue());} catch(NumberFormatException ex) {}
    }

    value = attributes.get("insetTop");
    if (value != null) {
        try {handler.setInsetTop((Integer.valueOf(value)).intValue());} catch(NumberFormatException ex) {}
    }

    value = attributes.get("insetBottom");
    if (value != null) {
        try {handler.setInsetBottom((Integer.valueOf(value)).intValue());} catch(NumberFormatException ex) {}
    }

    value = attributes.get("cellPadding");
    if (value != null) {
        try {handler.setCellPadding((Integer.valueOf(value)).intValue());} catch(NumberFormatException ex) {}
    }

    value = attributes.get("alignH");
    if (value != null) {
      handler.setAlignH((java.lang.String)StoreUtil.decodeObject(java.lang.String.class, value, store, new DecodeContext(sle, "alignH")));
    }

    value = attributes.get("alignV");
    if (value != null) {
      handler.setAlignV((java.lang.String)StoreUtil.decodeObject(java.lang.String.class, value, store, new DecodeContext(sle, "alignV")));
    }

    value = attributes.get("alignTable");
    if (value != null) {
      handler.setAlignTable((java.lang.String)StoreUtil.decodeObject(java.lang.String.class, value, store, new DecodeContext(sle, "alignTable")));
    }

    value = attributes.get("border");
    if (value != null) {
        try {handler.setBorder((Integer.valueOf(value)).intValue());} catch(NumberFormatException ex) {}
    }

    value = attributes.get("borderColor");
    if (value != null) {
      handler.setBorderColor((java.lang.String)StoreUtil.decodeObject(java.lang.String.class, value, store, new DecodeContext(sle, "borderColor")));
    }

    value = attributes.get("backColor");
    if (value != null) {
      handler.setBackColor((java.lang.String)StoreUtil.decodeObject(java.lang.String.class, value, store, new DecodeContext(sle, "backColor")));
    }

    value = attributes.get("backImage");
    if (value != null) {
      handler.setBackImage((java.lang.String)StoreUtil.decodeObject(java.lang.String.class, value, store, new DecodeContext(sle, "backImage")));
    }

    value = attributes.get("displayTitle");
    if (value != null) {
      handler.setDisplayTitle((java.lang.String)StoreUtil.decodeObject(java.lang.String.class, value, store, new DecodeContext(sle, "displayTitle")));
    }

    value = attributes.get("displayTitleML");
    if (value != null) {
      handler.setDisplayTitleML((java.util.HashMap)StoreUtil.decodeObject(java.util.HashMap.class, value, store, new DecodeContext(sle, "displayTitleML")));
    }

    value = attributes.get("skins");
    if (value != null) {
      handler.setSkins((java.lang.String[])StoreUtil.decodeObject(java.lang.String[].class, value, store, new DecodeContext(sle, "skins")));
    }

    value = attributes.get("skinCSS");
    if (value != null) {
      handler.setSkinCSS((java.lang.String)StoreUtil.decodeObject(java.lang.String.class, value, store, new DecodeContext(sle, "skinCSS")));
    }

    value = attributes.get("popupState");
    if (value != null) {
      handler.setPopupState((java.lang.String)StoreUtil.decodeObject(java.lang.String.class, value, store, new DecodeContext(sle, "popupState")));
    }

    value = attributes.get("expandState");
    if (value != null) {
      handler.setExpandState((java.lang.String)StoreUtil.decodeObject(java.lang.String.class, value, store, new DecodeContext(sle, "expandState")));
    }

    value = attributes.get("behaviorCopy");
    if (value != null) {
      handler.setBehaviorCopy((java.lang.String)StoreUtil.decodeObject(java.lang.String.class, value, store, new DecodeContext(sle, "behaviorCopy")));
    }

    value = attributes.get("originalPortlet");
    if (value != null) {
      handler.setOriginalPortlet((com.jalios.jcms.portlet.PortalElement)StoreUtil.decodeObject(com.jalios.jcms.portlet.PortalElement.class, value, store, new DecodeContext(sle, "originalPortlet")));
    }

    value = attributes.get("condition");
    if (value != null) {
      handler.setCondition((java.lang.String[])StoreUtil.decodeObject(java.lang.String[].class, value, store, new DecodeContext(sle, "condition")));
    }

    value = attributes.get("cssId");
    if (value != null) {
      handler.setCssId((java.lang.String)StoreUtil.decodeObject(java.lang.String.class, value, store, new DecodeContext(sle, "cssId")));
    }

    value = attributes.get("cssClasses");
    if (value != null) {
      handler.setCssClasses((java.lang.String)StoreUtil.decodeObject(java.lang.String.class, value, store, new DecodeContext(sle, "cssClasses")));
    }

    value = attributes.get("skinClasses");
    if (value != null) {
      handler.setSkinClasses((java.lang.String)StoreUtil.decodeObject(java.lang.String.class, value, store, new DecodeContext(sle, "skinClasses")));
    }

    value = attributes.get("skinFooter");
    if (value != null) {
      handler.setSkinFooter((java.lang.String)StoreUtil.decodeObject(java.lang.String.class, value, store, new DecodeContext(sle, "skinFooter")));
    }

    value = attributes.get("skinFooterML");
    if (value != null) {
      handler.setSkinFooterML((java.util.HashMap)StoreUtil.decodeObject(java.util.HashMap.class, value, store, new DecodeContext(sle, "skinFooterML")));
    }

    value = attributes.get("skinHeaderIcon");
    if (value != null) {
      handler.setSkinHeaderIcon((java.lang.String)StoreUtil.decodeObject(java.lang.String.class, value, store, new DecodeContext(sle, "skinHeaderIcon")));
    }

    value = attributes.get("skinHeaderIconColor");
    if (value != null) {
      handler.setSkinHeaderIconColor((java.lang.String)StoreUtil.decodeObject(java.lang.String.class, value, store, new DecodeContext(sle, "skinHeaderIconColor")));
    }

    value = attributes.get("skinFooterButtonLabel");
    if (value != null) {
      handler.setSkinFooterButtonLabel((java.lang.String)StoreUtil.decodeObject(java.lang.String.class, value, store, new DecodeContext(sle, "skinFooterButtonLabel")));
    }

    value = attributes.get("skinFooterButtonLabelML");
    if (value != null) {
      handler.setSkinFooterButtonLabelML((java.util.HashMap)StoreUtil.decodeObject(java.util.HashMap.class, value, store, new DecodeContext(sle, "skinFooterButtonLabelML")));
    }

    value = attributes.get("skinFooterButtonLink");
    if (value != null) {
      handler.setSkinFooterButtonLink((java.lang.String)StoreUtil.decodeObject(java.lang.String.class, value, store, new DecodeContext(sle, "skinFooterButtonLink")));
    }

    value = attributes.get("skinFooterButtonAlign");
    if (value != null) {
      handler.setSkinFooterButtonAlign((java.lang.String)StoreUtil.decodeObject(java.lang.String.class, value, store, new DecodeContext(sle, "skinFooterButtonAlign")));
    }

    value = attributes.get("skinHeaderButtonLabel");
    if (value != null) {
      handler.setSkinHeaderButtonLabel((java.lang.String)StoreUtil.decodeObject(java.lang.String.class, value, store, new DecodeContext(sle, "skinHeaderButtonLabel")));
    }

    value = attributes.get("skinHeaderButtonLabelML");
    if (value != null) {
      handler.setSkinHeaderButtonLabelML((java.util.HashMap)StoreUtil.decodeObject(java.util.HashMap.class, value, store, new DecodeContext(sle, "skinHeaderButtonLabelML")));
    }

    value = attributes.get("skinHeaderButtonLink");
    if (value != null) {
      handler.setSkinHeaderButtonLink((java.lang.String)StoreUtil.decodeObject(java.lang.String.class, value, store, new DecodeContext(sle, "skinHeaderButtonLink")));
    }

    value = attributes.get("skinHeaderSubText");
    if (value != null) {
      handler.setSkinHeaderSubText((java.lang.String)StoreUtil.decodeObject(java.lang.String.class, value, store, new DecodeContext(sle, "skinHeaderSubText")));
    }

    value = attributes.get("skinHeaderSubTextML");
    if (value != null) {
      handler.setSkinHeaderSubTextML((java.util.HashMap)StoreUtil.decodeObject(java.util.HashMap.class, value, store, new DecodeContext(sle, "skinHeaderSubTextML")));
    }

    value = attributes.get("abilities");
    if (value != null) {
      handler.setAbilities((java.lang.String[])StoreUtil.decodeObject(java.lang.String[].class, value, store, new DecodeContext(sle, "abilities")));
    }

    value = attributes.get("mainLanguage");
    if (value != null) {
      handler.setMainLanguage((java.lang.String)StoreUtil.decodeObject(java.lang.String.class, value, store, new DecodeContext(sle, "mainLanguage")));
    }

    value = attributes.get("title");
    if (value != null) {
      handler.setTitle((java.lang.String)StoreUtil.decodeObject(java.lang.String.class, value, store, new DecodeContext(sle, "title")));
    }

    value = attributes.get("titleML");
    if (value != null) {
      handler.setTitleML((java.util.HashMap)StoreUtil.decodeObject(java.util.HashMap.class, value, store, new DecodeContext(sle, "titleML")));
    }

    value = attributes.get("pdate");
    if (value != null) {
      handler.setPdate((java.util.Date)StoreUtil.decodeObject(java.util.Date.class, value, store, new DecodeContext(sle, "pdate")));
    }

    value = attributes.get("edate");
    if (value != null) {
      handler.setEdate((java.util.Date)StoreUtil.decodeObject(java.util.Date.class, value, store, new DecodeContext(sle, "edate")));
    }

    value = attributes.get("sdate");
    if (value != null) {
      handler.setSdate((java.util.Date)StoreUtil.decodeObject(java.util.Date.class, value, store, new DecodeContext(sle, "sdate")));
    }

    value = attributes.get("adate");
    if (value != null) {
      handler.setAdate((java.util.Date)StoreUtil.decodeObject(java.util.Date.class, value, store, new DecodeContext(sle, "adate")));
    }

    value = attributes.get("udate");
    if (value != null) {
      handler.setUdate((java.util.Date)StoreUtil.decodeObject(java.util.Date.class, value, store, new DecodeContext(sle, "udate")));
    }

    value = attributes.get("majorVersion");
    if (value != null) {
        try {handler.setMajorVersion((Integer.valueOf(value)).intValue());} catch(NumberFormatException ex) {}
    }

    value = attributes.get("pstatus");
    if (value != null) {
        try {handler.setPstatus((Integer.valueOf(value)).intValue());} catch(NumberFormatException ex) {}
    }

    value = attributes.get("mergeDate");
    if (value != null) {
      handler.setMergeDate((java.util.Date)StoreUtil.decodeObject(java.util.Date.class, value, store, new DecodeContext(sle, "mergeDate")));
    }

    value = attributes.get("mergeId");
    if (value != null) {
      handler.setMergeId((java.lang.String)StoreUtil.decodeObject(java.lang.String.class, value, store, new DecodeContext(sle, "mergeId")));
    }

    value = attributes.get("templates");
    if (value != null) {
      handler.setTemplates((java.lang.String[])StoreUtil.decodeObject(java.lang.String[].class, value, store, new DecodeContext(sle, "templates")));
    }

    value = attributes.get("categories");
    if (value != null) {
      handler.setCategories((com.jalios.jcms.Category[])StoreUtil.decodeObject(com.jalios.jcms.Category[].class, value, store, new DecodeContext(sle, "categories")));
    }

    value = attributes.get("authorizedMemberSet");
    if (value != null) {
      handler.setAuthorizedMemberSet((java.util.TreeSet)StoreUtil.decodeObject(java.util.TreeSet.class, value, store, new DecodeContext(sle, "authorizedMemberSet")));
    }

    value = attributes.get("authorizedMemberSetDBID");
    if (value != null) {
      handler.setAuthorizedMemberSetDBID((java.util.HashSet)StoreUtil.decodeObject(java.util.HashSet.class, value, store, new DecodeContext(sle, "authorizedMemberSetDBID")));
    }

    value = attributes.get("authorizedGroupSet");
    if (value != null) {
      handler.setAuthorizedGroupSet((java.util.TreeSet)StoreUtil.decodeObject(java.util.TreeSet.class, value, store, new DecodeContext(sle, "authorizedGroupSet")));
    }

    value = attributes.get("updateMemberSet");
    if (value != null) {
      handler.setUpdateMemberSet((java.util.TreeSet)StoreUtil.decodeObject(java.util.TreeSet.class, value, store, new DecodeContext(sle, "updateMemberSet")));
    }

    value = attributes.get("updateGroupSet");
    if (value != null) {
      handler.setUpdateGroupSet((java.util.TreeSet)StoreUtil.decodeObject(java.util.TreeSet.class, value, store, new DecodeContext(sle, "updateGroupSet")));
    }

    value = attributes.get("restrictUpdateRights");
    if (value != null) {
        handler.setRestrictUpdateRights(Boolean.valueOf(value).booleanValue());
    }

    value = attributes.get("mainInstance");
    if (value != null) {
      handler.setMainInstance((com.jalios.jcms.Publication)StoreUtil.decodeObject(com.jalios.jcms.Publication.class, value, store, new DecodeContext(sle, "mainInstance")));
    }

    value = attributes.get("isTracked");
    if (value != null) {
        handler.setTracked(Boolean.valueOf(value).booleanValue());
    }

    value = attributes.get("readAck");
    if (value != null) {
        handler.setReadAck(Boolean.valueOf(value).booleanValue());
    }

    value = attributes.get("friendlyURLSet");
    if (value != null) {
      handler.setFriendlyURLSet((java.util.TreeSet)StoreUtil.decodeObject(java.util.TreeSet.class, value, store, new DecodeContext(sle, "friendlyURLSet")));
    }

    value = attributes.get("workspace");
    if (value != null) {
      handler.setWorkspace((com.jalios.jcms.workspace.Workspace)StoreUtil.decodeObject(com.jalios.jcms.workspace.Workspace.class, value, store, new DecodeContext(sle, "workspace")));
    }

    value = attributes.get("roleMap");
    if (value != null) {
      handler.setRoleMap((java.util.HashMap)StoreUtil.decodeObject(java.util.HashMap.class, value, store, new DecodeContext(sle, "roleMap")));
    }

    value = attributes.get("workflowId");
    if (value != null) {
      handler.setWorkflowId((java.lang.String)StoreUtil.decodeObject(java.lang.String.class, value, store, new DecodeContext(sle, "workflowId")));
    }

    value = attributes.get("attachWorkspaceSet");
    if (value != null) {
      handler.setAttachWorkspaceSet((java.util.Set)StoreUtil.decodeObject(java.util.Set.class, value, store, new DecodeContext(sle, "attachWorkspaceSet")));
    }

    value = attributes.get("author");
    if (value != null) {
      handler.setAuthor((com.jalios.jcms.Member)StoreUtil.decodeObject(com.jalios.jcms.Member.class, value, store, new DecodeContext(sle, "author")));
    }

    value = attributes.get("authorDBID");
    if (value != null) {
      handler.setAuthorDBID((java.lang.String)StoreUtil.decodeObject(java.lang.String.class, value, store, new DecodeContext(sle, "authorDBID")));
    }

    value = attributes.get("opAuthor");
    if (value != null) {
      handler.setOpAuthor((com.jalios.jcms.Member)StoreUtil.decodeObject(com.jalios.jcms.Member.class, value, store, new DecodeContext(sle, "opAuthor")));
    }

    value = attributes.get("opDelegate");
    if (value != null) {
      handler.setOpDelegate((com.jalios.jcms.Member)StoreUtil.decodeObject(com.jalios.jcms.Member.class, value, store, new DecodeContext(sle, "opDelegate")));
    }

    value = attributes.get("extension");
    if (value != null) {
      handler.setExtension((com.jalios.jcms.DataExtension)StoreUtil.decodeObject(com.jalios.jcms.DataExtension.class, value, store, new DecodeContext(sle, "extension")));
    }

    value = attributes.get("importMap");
    if (value != null) {
      handler.setImportMap((java.util.HashMap)StoreUtil.decodeObject(java.util.HashMap.class, value, store, new DecodeContext(sle, "importMap")));
    }

    value = attributes.get("extraDataMap");
    if (value != null) {
      handler.setExtraDataMap((java.util.HashMap)StoreUtil.decodeObject(java.util.HashMap.class, value, store, new DecodeContext(sle, "extraDataMap")));
    }

    value = attributes.get("cdate");
    if (value != null) {
      handler.setCdate((java.util.Date)StoreUtil.decodeObject(java.util.Date.class, value, store, new DecodeContext(sle, "cdate")));
    }

    value = attributes.get("mdate");
    if (value != null) {
      handler.setMdate((java.util.Date)StoreUtil.decodeObject(java.util.Date.class, value, store, new DecodeContext(sle, "mdate")));
    }

  }

  public Map<String,String> getAttributes(com.jalios.jstore.Storable storable, com.jalios.jstore.Store store) {
    generated.PortletImage handler = (generated.PortletImage)storable;
    Map<String,String> attributes = new HashMap<String,String>();
    attributes.put("image", StoreUtil.encodeObject(handler.getImage(), store));
    attributes.put("imageML", StoreUtil.encodeObject(handler.getImageML(), store));
    attributes.put("link", StoreUtil.encodeObject(handler.getLink(), store));
    attributes.put("linkML", StoreUtil.encodeObject(handler.getLinkML(), store));
    attributes.put("alt", StoreUtil.encodeObject(handler.getAlt(), store));
    attributes.put("altML", StoreUtil.encodeObject(handler.getAltML(), store));
    attributes.put("targetWindow", StoreUtil.encodeObject(handler.getTargetWindow(), store));
    attributes.put("imgWidth", String.valueOf(handler.getImgWidth()));
    attributes.put("imgHeight", String.valueOf(handler.getImgHeight()));
    attributes.put("description", StoreUtil.encodeObject(handler.getDescription(), store));
    attributes.put("descriptionML", StoreUtil.encodeObject(handler.getDescriptionML(), store));
    attributes.put("portletImage", StoreUtil.encodeObject(handler.getPortletImage(), store));
    attributes.put("portletImageML", StoreUtil.encodeObject(handler.getPortletImageML(), store));
    attributes.put("cacheType", StoreUtil.encodeObject(handler.getCacheType(), store));
    attributes.put("cacheSensibility", StoreUtil.encodeObject(handler.getCacheSensibility(), store));
    attributes.put("invalidClass", StoreUtil.encodeObject(handler.getInvalidClass(), store));
    attributes.put("invalidTime", String.valueOf(handler.getInvalidTime()));
    attributes.put("displayCSS", StoreUtil.encodeObject(handler.getDisplayCSS(), store));
    attributes.put("width", StoreUtil.encodeObject(handler.getWidth(), store));
    attributes.put("insetLeft", String.valueOf(handler.getInsetLeft()));
    attributes.put("insetRight", String.valueOf(handler.getInsetRight()));
    attributes.put("insetTop", String.valueOf(handler.getInsetTop()));
    attributes.put("insetBottom", String.valueOf(handler.getInsetBottom()));
    attributes.put("cellPadding", String.valueOf(handler.getCellPadding()));
    attributes.put("alignH", StoreUtil.encodeObject(handler.getAlignH(), store));
    attributes.put("alignV", StoreUtil.encodeObject(handler.getAlignV(), store));
    attributes.put("alignTable", StoreUtil.encodeObject(handler.getAlignTable(), store));
    attributes.put("border", String.valueOf(handler.getBorder()));
    attributes.put("borderColor", StoreUtil.encodeObject(handler.getBorderColor(), store));
    attributes.put("backColor", StoreUtil.encodeObject(handler.getBackColor(), store));
    attributes.put("backImage", StoreUtil.encodeObject(handler.getBackImage(), store));
    attributes.put("displayTitle", StoreUtil.encodeObject(handler.getDisplayTitle(), store));
    attributes.put("displayTitleML", StoreUtil.encodeObject(handler.getDisplayTitleML(), store));
    attributes.put("skins", StoreUtil.encodeObject(handler.getSkins(), store));
    attributes.put("skinCSS", StoreUtil.encodeObject(handler.getSkinCSS(), store));
    attributes.put("popupState", StoreUtil.encodeObject(handler.getPopupState(), store));
    attributes.put("expandState", StoreUtil.encodeObject(handler.getExpandState(), store));
    attributes.put("behaviorCopy", StoreUtil.encodeObject(handler.getBehaviorCopy(), store));
    attributes.put("originalPortlet", StoreUtil.encodeObject(handler.getOriginalPortlet(), store));
    attributes.put("condition", StoreUtil.encodeObject(handler.getCondition(), store));
    attributes.put("cssId", StoreUtil.encodeObject(handler.getCssId(), store));
    attributes.put("cssClasses", StoreUtil.encodeObject(handler.getCssClasses(), store));
    attributes.put("skinClasses", StoreUtil.encodeObject(handler.getSkinClasses(), store));
    attributes.put("skinFooter", StoreUtil.encodeObject(handler.getSkinFooter(), store));
    attributes.put("skinFooterML", StoreUtil.encodeObject(handler.getSkinFooterML(), store));
    attributes.put("skinHeaderIcon", StoreUtil.encodeObject(handler.getSkinHeaderIcon(), store));
    attributes.put("skinHeaderIconColor", StoreUtil.encodeObject(handler.getSkinHeaderIconColor(), store));
    attributes.put("skinFooterButtonLabel", StoreUtil.encodeObject(handler.getSkinFooterButtonLabel(), store));
    attributes.put("skinFooterButtonLabelML", StoreUtil.encodeObject(handler.getSkinFooterButtonLabelML(), store));
    attributes.put("skinFooterButtonLink", StoreUtil.encodeObject(handler.getSkinFooterButtonLink(), store));
    attributes.put("skinFooterButtonAlign", StoreUtil.encodeObject(handler.getSkinFooterButtonAlign(), store));
    attributes.put("skinHeaderButtonLabel", StoreUtil.encodeObject(handler.getSkinHeaderButtonLabel(), store));
    attributes.put("skinHeaderButtonLabelML", StoreUtil.encodeObject(handler.getSkinHeaderButtonLabelML(), store));
    attributes.put("skinHeaderButtonLink", StoreUtil.encodeObject(handler.getSkinHeaderButtonLink(), store));
    attributes.put("skinHeaderSubText", StoreUtil.encodeObject(handler.getSkinHeaderSubText(), store));
    attributes.put("skinHeaderSubTextML", StoreUtil.encodeObject(handler.getSkinHeaderSubTextML(), store));
    attributes.put("abilities", StoreUtil.encodeObject(handler.getAbilities(), store));
    attributes.put("mainLanguage", StoreUtil.encodeObject(handler.getMainLanguage(), store));
    attributes.put("title", StoreUtil.encodeObject(handler.getTitle(), store));
    attributes.put("titleML", StoreUtil.encodeObject(handler.getTitleML(), store));
    attributes.put("pdate", StoreUtil.encodeObject(handler.getPdate(), store));
    attributes.put("edate", StoreUtil.encodeObject(handler.getEdate(), store));
    attributes.put("sdate", StoreUtil.encodeObject(handler.getSdate(), store));
    attributes.put("adate", StoreUtil.encodeObject(handler.getAdate(), store));
    attributes.put("udate", StoreUtil.encodeObject(handler.getUdate(), store));
    attributes.put("majorVersion", String.valueOf(handler.getMajorVersion()));
    attributes.put("pstatus", String.valueOf(handler.getPstatus()));
    attributes.put("mergeDate", StoreUtil.encodeObject(handler.getMergeDate(), store));
    attributes.put("mergeId", StoreUtil.encodeObject(handler.getMergeId(), store));
    attributes.put("templates", StoreUtil.encodeObject(handler.getTemplates(), store));
    attributes.put("categories", StoreUtil.encodeObject(handler.getCategories(), store));
    attributes.put("authorizedMemberSet", StoreUtil.encodeObject(handler.getAuthorizedMemberSet(), store));
    attributes.put("authorizedMemberSetDBID", StoreUtil.encodeObject(handler.getAuthorizedMemberSetDBID(), store));
    attributes.put("authorizedGroupSet", StoreUtil.encodeObject(handler.getAuthorizedGroupSet(), store));
    attributes.put("updateMemberSet", StoreUtil.encodeObject(handler.getUpdateMemberSet(), store));
    attributes.put("updateGroupSet", StoreUtil.encodeObject(handler.getUpdateGroupSet(), store));
    attributes.put("restrictUpdateRights", String.valueOf(handler.getRestrictUpdateRights()));
    attributes.put("mainInstance", StoreUtil.encodeObject(handler.getMainInstance(), store));
    attributes.put("isTracked", String.valueOf(handler.isTracked()));
    attributes.put("readAck", String.valueOf(handler.getReadAck()));
    attributes.put("friendlyURLSet", StoreUtil.encodeObject(handler.getFriendlyURLSet(), store));
    attributes.put("workspace", StoreUtil.encodeObject(handler.getWorkspace(), store));
    attributes.put("roleMap", StoreUtil.encodeObject(handler.getRoleMap(), store));
    attributes.put("workflowId", StoreUtil.encodeObject(handler.getWorkflowId(), store));
    attributes.put("attachWorkspaceSet", StoreUtil.encodeObject(handler.getAttachWorkspaceSet(), store));
    attributes.put("author", StoreUtil.encodeObject(handler.getAuthor(), store));
    attributes.put("authorDBID", StoreUtil.encodeObject(handler.getAuthorDBID(), store));
    attributes.put("opAuthor", StoreUtil.encodeObject(handler.getOpAuthor(), store));
    attributes.put("opDelegate", StoreUtil.encodeObject(handler.getOpDelegate(), store));
    attributes.put("extension", StoreUtil.encodeObject(handler.getExtension(), store));
    attributes.put("importMap", StoreUtil.encodeObject(handler.getImportMap(), store));
    attributes.put("extraDataMap", StoreUtil.encodeObject(handler.getExtraDataMap(), store));
    attributes.put("cdate", StoreUtil.encodeObject(handler.getCdate(), store));
    attributes.put("mdate", StoreUtil.encodeObject(handler.getMdate(), store));
    return attributes;
  }
}
