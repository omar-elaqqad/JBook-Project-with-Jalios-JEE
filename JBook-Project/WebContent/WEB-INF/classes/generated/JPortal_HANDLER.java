// This class was automatically generated by jsc. Please, do not edit.
// Generation date: Thu Apr 04 15:21:33 WET 2024

package generated;

import java.util.HashMap;
import java.util.Map;

import com.jalios.jstore.DecodeContext;
import com.jalios.jstore.StorableLogEntry;
import com.jalios.jstore.StoreUtil;

@SuppressWarnings("unchecked")
public class JPortal_HANDLER implements com.jalios.jstore.StorableHandler {

  @Override
@SuppressWarnings("rawtypes")
  public void setAttributes(com.jalios.jstore.Storable storable, StorableLogEntry sle, com.jalios.jstore.Store store) {
    JPortal handler = (generated.JPortal)storable;
    String value;
    Map<String,String> attributes = sle.getAttributes();
    value = attributes.get("pageTitle");
    if (value != null) {
      handler.setPageTitle(StoreUtil.decodeObject(java.lang.String.class, value, store, new DecodeContext(sle, "pageTitle")));
    }

    value = attributes.get("pageTitleML");
    if (value != null) {
      handler.setPageTitleML(StoreUtil.decodeObject(java.util.HashMap.class, value, store, new DecodeContext(sle, "pageTitleML")));
    }

    value = attributes.get("description");
    if (value != null) {
      handler.setDescription(StoreUtil.decodeObject(java.lang.String.class, value, store, new DecodeContext(sle, "description")));
    }

    value = attributes.get("descriptionML");
    if (value != null) {
      handler.setDescriptionML(StoreUtil.decodeObject(java.util.HashMap.class, value, store, new DecodeContext(sle, "descriptionML")));
    }

    value = attributes.get("keywords");
    if (value != null) {
      handler.setKeywords(StoreUtil.decodeObject(java.lang.String.class, value, store, new DecodeContext(sle, "keywords")));
    }

    value = attributes.get("keywordsML");
    if (value != null) {
      handler.setKeywordsML(StoreUtil.decodeObject(java.util.HashMap.class, value, store, new DecodeContext(sle, "keywordsML")));
    }

    value = attributes.get("portletImage");
    if (value != null) {
      handler.setPortletImage(StoreUtil.decodeObject(java.lang.String.class, value, store, new DecodeContext(sle, "portletImage")));
    }

    value = attributes.get("portletImageML");
    if (value != null) {
      handler.setPortletImageML(StoreUtil.decodeObject(java.util.HashMap.class, value, store, new DecodeContext(sle, "portletImageML")));
    }

    value = attributes.get("behaviorCopy");
    if (value != null) {
      handler.setBehaviorCopy(StoreUtil.decodeObject(java.lang.String.class, value, store, new DecodeContext(sle, "behaviorCopy")));
    }

    value = attributes.get("cssId");
    if (value != null) {
      handler.setCssId(StoreUtil.decodeObject(java.lang.String.class, value, store, new DecodeContext(sle, "cssId")));
    }

    value = attributes.get("cssClasses");
    if (value != null) {
      handler.setCssClasses(StoreUtil.decodeObject(java.lang.String.class, value, store, new DecodeContext(sle, "cssClasses")));
    }

    value = attributes.get("cacheType");
    if (value != null) {
      handler.setCacheType(StoreUtil.decodeObject(java.lang.String.class, value, store, new DecodeContext(sle, "cacheType")));
    }

    value = attributes.get("cacheSensibility");
    if (value != null) {
      handler.setCacheSensibility(StoreUtil.decodeObject(java.lang.String.class, value, store, new DecodeContext(sle, "cacheSensibility")));
    }

    value = attributes.get("invalidClass");
    if (value != null) {
      handler.setInvalidClass(StoreUtil.decodeObject(java.lang.String[].class, value, store, new DecodeContext(sle, "invalidClass")));
    }

    value = attributes.get("invalidTime");
    if (value != null) {
        try {handler.setInvalidTime((Long.valueOf(value)).longValue());} catch(NumberFormatException ex) {}
    }

    value = attributes.get("exactCategory");
    if (value != null) {
        handler.setExactCategory(Boolean.valueOf(value).booleanValue());
    }

    value = attributes.get("displayTopbar");
    if (value != null) {
        handler.setDisplayTopbar(Boolean.valueOf(value).booleanValue());
    }

    value = attributes.get("displayScrollToTop");
    if (value != null) {
        handler.setDisplayScrollToTop(Boolean.valueOf(value).booleanValue());
    }

    value = attributes.get("css");
    if (value != null) {
      handler.setCss(StoreUtil.decodeObject(java.lang.String.class, value, store, new DecodeContext(sle, "css")));
    }

    value = attributes.get("structure");
    if (value != null) {
      handler.setStructure(StoreUtil.decodeObject(java.lang.String.class, value, store, new DecodeContext(sle, "structure")));
    }

    value = attributes.get("portlets");
    if (value != null) {
      handler.setPortlets(StoreUtil.decodeObject(com.jalios.jcms.portlet.Portlet[].class, value, store, new DecodeContext(sle, "portlets")));
    }

    value = attributes.get("abilities");
    if (value != null) {
      handler.setAbilities(StoreUtil.decodeObject(java.lang.String[].class, value, store, new DecodeContext(sle, "abilities")));
    }

    value = attributes.get("mainLanguage");
    if (value != null) {
      handler.setMainLanguage(StoreUtil.decodeObject(java.lang.String.class, value, store, new DecodeContext(sle, "mainLanguage")));
    }

    value = attributes.get("title");
    if (value != null) {
      handler.setTitle(StoreUtil.decodeObject(java.lang.String.class, value, store, new DecodeContext(sle, "title")));
    }

    value = attributes.get("titleML");
    if (value != null) {
      handler.setTitleML(StoreUtil.decodeObject(java.util.HashMap.class, value, store, new DecodeContext(sle, "titleML")));
    }

    value = attributes.get("pdate");
    if (value != null) {
      handler.setPdate(StoreUtil.decodeObject(java.util.Date.class, value, store, new DecodeContext(sle, "pdate")));
    }

    value = attributes.get("edate");
    if (value != null) {
      handler.setEdate(StoreUtil.decodeObject(java.util.Date.class, value, store, new DecodeContext(sle, "edate")));
    }

    value = attributes.get("sdate");
    if (value != null) {
      handler.setSdate(StoreUtil.decodeObject(java.util.Date.class, value, store, new DecodeContext(sle, "sdate")));
    }

    value = attributes.get("adate");
    if (value != null) {
      handler.setAdate(StoreUtil.decodeObject(java.util.Date.class, value, store, new DecodeContext(sle, "adate")));
    }

    value = attributes.get("udate");
    if (value != null) {
      handler.setUdate(StoreUtil.decodeObject(java.util.Date.class, value, store, new DecodeContext(sle, "udate")));
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
      handler.setMergeDate(StoreUtil.decodeObject(java.util.Date.class, value, store, new DecodeContext(sle, "mergeDate")));
    }

    value = attributes.get("mergeId");
    if (value != null) {
      handler.setMergeId(StoreUtil.decodeObject(java.lang.String.class, value, store, new DecodeContext(sle, "mergeId")));
    }

    value = attributes.get("templates");
    if (value != null) {
      handler.setTemplates(StoreUtil.decodeObject(java.lang.String[].class, value, store, new DecodeContext(sle, "templates")));
    }

    value = attributes.get("categories");
    if (value != null) {
      handler.setCategories(StoreUtil.decodeObject(com.jalios.jcms.Category[].class, value, store, new DecodeContext(sle, "categories")));
    }

    value = attributes.get("authorizedMemberSet");
    if (value != null) {
      handler.setAuthorizedMemberSet(StoreUtil.decodeObject(java.util.TreeSet.class, value, store, new DecodeContext(sle, "authorizedMemberSet")));
    }

    value = attributes.get("authorizedMemberSetDBID");
    if (value != null) {
      handler.setAuthorizedMemberSetDBID(StoreUtil.decodeObject(java.util.HashSet.class, value, store, new DecodeContext(sle, "authorizedMemberSetDBID")));
    }

    value = attributes.get("authorizedGroupSet");
    if (value != null) {
      handler.setAuthorizedGroupSet(StoreUtil.decodeObject(java.util.TreeSet.class, value, store, new DecodeContext(sle, "authorizedGroupSet")));
    }

    value = attributes.get("updateMemberSet");
    if (value != null) {
      handler.setUpdateMemberSet(StoreUtil.decodeObject(java.util.TreeSet.class, value, store, new DecodeContext(sle, "updateMemberSet")));
    }

    value = attributes.get("updateGroupSet");
    if (value != null) {
      handler.setUpdateGroupSet(StoreUtil.decodeObject(java.util.TreeSet.class, value, store, new DecodeContext(sle, "updateGroupSet")));
    }

    value = attributes.get("restrictUpdateRights");
    if (value != null) {
        handler.setRestrictUpdateRights(Boolean.valueOf(value).booleanValue());
    }

    value = attributes.get("mainInstance");
    if (value != null) {
      handler.setMainInstance(StoreUtil.decodeObject(com.jalios.jcms.Publication.class, value, store, new DecodeContext(sle, "mainInstance")));
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
      handler.setFriendlyURLSet(StoreUtil.decodeObject(java.util.TreeSet.class, value, store, new DecodeContext(sle, "friendlyURLSet")));
    }

    value = attributes.get("workspace");
    if (value != null) {
      handler.setWorkspace(StoreUtil.decodeObject(com.jalios.jcms.workspace.Workspace.class, value, store, new DecodeContext(sle, "workspace")));
    }

    value = attributes.get("roleMap");
    if (value != null) {
      handler.setRoleMap(StoreUtil.decodeObject(java.util.HashMap.class, value, store, new DecodeContext(sle, "roleMap")));
    }

    value = attributes.get("workflowId");
    if (value != null) {
      handler.setWorkflowId(StoreUtil.decodeObject(java.lang.String.class, value, store, new DecodeContext(sle, "workflowId")));
    }

    value = attributes.get("attachWorkspaceSet");
    if (value != null) {
      handler.setAttachWorkspaceSet(StoreUtil.decodeObject(java.util.Set.class, value, store, new DecodeContext(sle, "attachWorkspaceSet")));
    }

    value = attributes.get("author");
    if (value != null) {
      handler.setAuthor(StoreUtil.decodeObject(com.jalios.jcms.Member.class, value, store, new DecodeContext(sle, "author")));
    }

    value = attributes.get("authorDBID");
    if (value != null) {
      handler.setAuthorDBID(StoreUtil.decodeObject(java.lang.String.class, value, store, new DecodeContext(sle, "authorDBID")));
    }

    value = attributes.get("opAuthor");
    if (value != null) {
      handler.setOpAuthor(StoreUtil.decodeObject(com.jalios.jcms.Member.class, value, store, new DecodeContext(sle, "opAuthor")));
    }

    value = attributes.get("opDelegate");
    if (value != null) {
      handler.setOpDelegate(StoreUtil.decodeObject(com.jalios.jcms.Member.class, value, store, new DecodeContext(sle, "opDelegate")));
    }

    value = attributes.get("extension");
    if (value != null) {
      handler.setExtension(StoreUtil.decodeObject(com.jalios.jcms.DataExtension.class, value, store, new DecodeContext(sle, "extension")));
    }

    value = attributes.get("importMap");
    if (value != null) {
      handler.setImportMap(StoreUtil.decodeObject(java.util.HashMap.class, value, store, new DecodeContext(sle, "importMap")));
    }

    value = attributes.get("extraDataMap");
    if (value != null) {
      handler.setExtraDataMap(StoreUtil.decodeObject(java.util.HashMap.class, value, store, new DecodeContext(sle, "extraDataMap")));
    }

    value = attributes.get("cdate");
    if (value != null) {
      handler.setCdate(StoreUtil.decodeObject(java.util.Date.class, value, store, new DecodeContext(sle, "cdate")));
    }

    value = attributes.get("mdate");
    if (value != null) {
      handler.setMdate(StoreUtil.decodeObject(java.util.Date.class, value, store, new DecodeContext(sle, "mdate")));
    }

  }

  @Override
public Map<String,String> getAttributes(com.jalios.jstore.Storable storable, com.jalios.jstore.Store store) {
    generated.JPortal handler = (generated.JPortal)storable;
    Map<String,String> attributes = new HashMap<>();
    attributes.put("pageTitle", StoreUtil.encodeObject(handler.getPageTitle(), store));
    attributes.put("pageTitleML", StoreUtil.encodeObject(handler.getPageTitleML(), store));
    attributes.put("description", StoreUtil.encodeObject(handler.getDescription(), store));
    attributes.put("descriptionML", StoreUtil.encodeObject(handler.getDescriptionML(), store));
    attributes.put("keywords", StoreUtil.encodeObject(handler.getKeywords(), store));
    attributes.put("keywordsML", StoreUtil.encodeObject(handler.getKeywordsML(), store));
    attributes.put("portletImage", StoreUtil.encodeObject(handler.getPortletImage(), store));
    attributes.put("portletImageML", StoreUtil.encodeObject(handler.getPortletImageML(), store));
    attributes.put("behaviorCopy", StoreUtil.encodeObject(handler.getBehaviorCopy(), store));
    attributes.put("cssId", StoreUtil.encodeObject(handler.getCssId(), store));
    attributes.put("cssClasses", StoreUtil.encodeObject(handler.getCssClasses(), store));
    attributes.put("cacheType", StoreUtil.encodeObject(handler.getCacheType(), store));
    attributes.put("cacheSensibility", StoreUtil.encodeObject(handler.getCacheSensibility(), store));
    attributes.put("invalidClass", StoreUtil.encodeObject(handler.getInvalidClass(), store));
    attributes.put("invalidTime", String.valueOf(handler.getInvalidTime()));
    attributes.put("exactCategory", String.valueOf(handler.getExactCategory()));
    attributes.put("displayTopbar", String.valueOf(handler.getDisplayTopbar()));
    attributes.put("displayScrollToTop", String.valueOf(handler.getDisplayScrollToTop()));
    attributes.put("css", StoreUtil.encodeObject(handler.getCss(), store));
    attributes.put("structure", StoreUtil.encodeObject(handler.getStructure(), store));
    attributes.put("portlets", StoreUtil.encodeObject(handler.getPortlets(), store));
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
