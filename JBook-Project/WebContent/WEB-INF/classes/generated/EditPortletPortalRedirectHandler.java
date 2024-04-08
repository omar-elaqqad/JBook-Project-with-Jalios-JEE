// This file has been automatically generated.
package generated;


import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;

import com.jalios.jcms.Category;
import com.jalios.jcms.Data;
import com.jalios.jcms.Member;
import com.jalios.jcms.Publication;
import com.jalios.jcms.TypeFieldEntry;
import com.jalios.util.Util;
@SuppressWarnings({"unchecked", "unused"})
public class EditPortletPortalRedirectHandler extends com.jalios.jcms.portlet.EditPortalRedirectHandler {

  protected PortletPortalRedirect theContent;

  @Override
public Class<? extends Publication> getPublicationClass() {
    return PortletPortalRedirect.class;
  }

  // ----------------------------------------------------------------------
  // validateBeforeOpPortletPortalRedirect
  // ----------------------------------------------------------------------

  @Override
public boolean validateBeforeOp() {
    if (!super.validateBeforeOp()) {
      return false;
    }

    Member fdauthor = getLoggedMember();

           fdauthor = (fdauthor == null) ? getAvailableAuthor() : fdauthor;


    {
      Data data = processDataId("content", __contentStr, com.jalios.jcms.Content.class);
      if (data != null) {
        content = (com.jalios.jcms.Content)data;
      } else {
        isContentValidated = Util.isEmpty(__contentStr);
      }
    }
    {
      Data data = processDataId("redirectPortlet", __redirectPortletStr, com.jalios.jcms.portlet.PortalElement.class);
      if (data != null) {
        redirectPortlet = (com.jalios.jcms.portlet.PortalElement)data;
      } else {
        isRedirectPortletValidated = Util.isEmpty(__redirectPortletStr);
      }
    }
    {
      Data data = processDataId("dispPortal", __dispPortalStr, com.jalios.jcms.portlet.PortalElement.class);
      if (data != null) {
        dispPortal = (com.jalios.jcms.portlet.PortalElement)data;
      } else {
        isDispPortalValidated = Util.isEmpty(__dispPortalStr);
      }
    }
    if (!validateUploadedFileDocument(getAvailableContent(),   fdauthor, getAvailableWorkspace()) || !validateUploadedFileDocument(getAvailableRedirectPortlet(),   fdauthor, getAvailableWorkspace()) || !validateUploadedFileDocument(getAvailableDispPortal(),   fdauthor, getAvailableWorkspace()) || !createUploadedFileDocument(getAvailableContent(),  fdauthor, getAvailableWorkspace())) {
      return false;
    }
    if (!createUploadedFileDocument(getAvailableRedirectPortlet(),  fdauthor, getAvailableWorkspace())) {
      return false;
    }
    if (!createUploadedFileDocument(getAvailableDispPortal(),  fdauthor, getAvailableWorkspace())) {
      return false;
    }
    return true;
  }
  @Override
  public Object getAvailableField(String field) {

    if ("status".equals(field)) {
      return getAvailableStatus();
    }

    if ("content".equals(field)) {
      return getAvailableContent();
    }

    if ("redirectForm".equals(field)) {
      return getAvailableRedirectForm();
    }

    if ("url".equals(field)) {
      return getAllAvailableUrlML();
    }

    if ("redirectPortlet".equals(field)) {
      return getAvailableRedirectPortlet();
    }

    if ("category".equals(field)) {
      return getAvailableCategory();
    }

    if ("dispPortal".equals(field)) {
      return getAvailableDispPortal();
    }

    if ("navCategories".equals(field)) {
      return getNavCategoriesCatSet();
    }

    if ("description".equals(field)) {
      return getAllAvailableDescriptionML();
    }

    if ("portletImage".equals(field)) {
      return getAllAvailablePortletImageML();
    }

    if ("cacheType".equals(field)) {
      return getAvailableCacheType();
    }

    if ("cacheSensibility".equals(field)) {
      return getAvailableCacheSensibility();
    }

    if ("invalidClass".equals(field)) {
      return getAvailableInvalidClass();
    }

    if ("invalidTime".equals(field)) {
      return getAvailableInvalidTime();
    }

    if ("behaviorCopy".equals(field)) {
      return getAvailableBehaviorCopy();
    }

    if ("cssId".equals(field)) {
      return getAvailableCssId();
    }

    if ("cssClasses".equals(field)) {
      return getAvailableCssClasses();
    }

    if ("exactCategory".equals(field)) {
      return getAvailableExactCategory();
    }

    return super.getAvailableField(field);
  }
  @Override
  public Object getEnumValues(String field) {

    if ("redirectForm".equals(field)) {
      return PortletPortalRedirect.getRedirectFormValues();
    }
    if ("cacheType".equals(field)) {
      return PortletPortalRedirect.getCacheTypeValues();
    }
    if ("cacheSensibility".equals(field)) {
      return PortletPortalRedirect.getCacheSensibilityValues();
    }
    if ("invalidClass".equals(field)) {
      return PortletPortalRedirect.getInvalidClassValues();
    }
    if ("behaviorCopy".equals(field)) {
      return PortletPortalRedirect.getBehaviorCopyValues();
    }
    if ("exactCategory".equals(field)) {
      return PortletPortalRedirect.getExactCategoryValues();
    }
    return super.getEnumValues(field);
  }
  @Override
  public Object getEnumLabels(String field, String userLang) {

    if ("redirectForm".equals(field)) {
      return PortletPortalRedirect.getRedirectFormLabels(userLang);
    }
    if ("cacheType".equals(field)) {
      return PortletPortalRedirect.getCacheTypeLabels(userLang);
    }
    if ("cacheSensibility".equals(field)) {
      return PortletPortalRedirect.getCacheSensibilityLabels(userLang);
    }
    if ("invalidClass".equals(field)) {
      return PortletPortalRedirect.getInvalidClassLabels(userLang);
    }
    if ("behaviorCopy".equals(field)) {
      return PortletPortalRedirect.getBehaviorCopyLabels(userLang);
    }
    if ("exactCategory".equals(field)) {
      return PortletPortalRedirect.getExactCategoryLabels(userLang);
    }
    return super.getEnumLabels(field, userLang);
  }
  // ----------------------------------------------------------------------
  // validateCommonCreateUpdatePortletPortalRedirect
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdatePortletPortalRedirect() {
    if (!isContentValidated) {
      setWarningMsg(glp("msg.edit.bad-link-id", channel.getTypeFieldLabel(getPublicationClass(), "content", userLang)));
      return false;
    }
    if (!isRedirectPortletValidated) {
      setWarningMsg(glp("msg.edit.bad-link-id", channel.getTypeFieldLabel(getPublicationClass(), "redirectPortlet", userLang)));
      return false;
    }
    if (!isDispPortalValidated) {
      setWarningMsg(glp("msg.edit.bad-link-id", channel.getTypeFieldLabel(getPublicationClass(), "dispPortal", userLang)));
      return false;
    }
    if (!isInvalidTimeValidated) {
      setWarningMsg(glp("msg.edit.bad-number-format", channel.getTypeFieldLabel(getPublicationClass(), "invalidTime", userLang)));
      return false;
    }
    return true;
  }

  // ----------------------------------------------------------------------
  // Create
  // ----------------------------------------------------------------------
  @Override
public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate() || !validateCommonCreateUpdatePortletPortalRedirect()) {
      return false;
    }
    return true;
  }

  // ----------------------------------------------------------------------
  // Update
  // ----------------------------------------------------------------------
  @Override
public boolean validateUpdate() throws java.io.IOException {
    if (!super.validateUpdate() || !validateCommonCreateUpdatePortletPortalRedirect()) {
      return false;
    }

    return true;
  }

  // ----------------------------------------------------------------------
  // Next
  // ----------------------------------------------------------------------
  @Override
protected boolean validateNext() throws java.io.IOException {
   if (!super.validateNext()) {
      return false;
    }
	return true;
  }
  // ----------------------------------------------------------------------
  // Previous
  // ----------------------------------------------------------------------
  @Override
protected boolean validatePrevious() throws java.io.IOException {
  	if (!super.validatePrevious()) {
      return false;
    }
	return true;
  }
  // ----------------------------------------------------------------------
  // Finish
  // ----------------------------------------------------------------------
  @Override
protected boolean validateFinish() throws java.io.IOException {
  	if (!super.validateFinish()) {
      return false;
    }
	return true;
  }
  // ----------------------------------------------------------------------
  // setFields
  // ----------------------------------------------------------------------
  @Override
public void setFields(Publication data) {
    super.setFields(data);
    PortletPortalRedirect obj = (PortletPortalRedirect)data;
    obj.setStatus(getAvailableStatus());
    obj.setContent(getAvailableContent());
    obj.setRedirectForm(getAvailableRedirectForm());
    obj.setUrl(getAvailableUrl());
    obj.setUrlML(getAvailableUrlML());
    obj.setRedirectPortlet(getAvailableRedirectPortlet());
    obj.setCategory(getAvailableCategory());
    obj.setDispPortal(getAvailableDispPortal());
    obj.setDescription(getAvailableDescription());
    obj.setDescriptionML(getAvailableDescriptionML());
    obj.setPortletImage(getAvailablePortletImage());
    obj.setPortletImageML(getAvailablePortletImageML());
    obj.setCacheType(getAvailableCacheType());
    obj.setCacheSensibility(getAvailableCacheSensibility());
    obj.setInvalidClass(getAvailableInvalidClass());
    obj.setInvalidTime(getAvailableInvalidTime());
    obj.setBehaviorCopy(getAvailableBehaviorCopy());
    obj.setCssId(getAvailableCssId());
    obj.setCssClasses(getAvailableCssClasses());
    obj.setExactCategory(getAvailableExactCategory());
  }

  @Override
public void setId(String  v) {
    if (channel.getData(v) instanceof PortletPortalRedirect) {
      super.setId(v);
      theContent = (PortletPortalRedirect)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }


  // ----------------------------------------------------------------------
  // status
  // ----------------------------------------------------------------------
  protected TypeFieldEntry statusTFE = channel.getTypeFieldEntry(PortletPortalRedirect.class, "status", true);
  protected String status = channel.getTypeFieldEntry(PortletPortalRedirect.class, "status", true).getDefaultTextString();
  public void setStatus(String[] v) {
    status = getMonolingualValue(statusTFE, v);
  }
  @Override
public String getAvailableStatus() {
    if (theContent != null && isFieldMissing("status")) {
     String objectValue = theContent.getStatus();
      return objectValue;
    }
    return status;
  }




  // ----------------------------------------------------------------------
  // content
  // ----------------------------------------------------------------------
  protected TypeFieldEntry contentTFE = channel.getTypeFieldEntry(PortletPortalRedirect.class, "content", true);
  protected boolean isContentValidated = true;
  protected com.jalios.jcms.Content content;
  String __contentStr = null;
  public void setContent(String v) {
    __contentStr = v;
  }
  @Override
public com.jalios.jcms.Content getAvailableContent() {
    if (theContent != null && isFieldMissing("content")) {
     com.jalios.jcms.Content objectValue = theContent.getContent();
      return objectValue;
    }
    return content;
  }




  // ----------------------------------------------------------------------
  // redirectForm
  // ----------------------------------------------------------------------
  protected TypeFieldEntry redirectFormTFE = channel.getTypeFieldEntry(PortletPortalRedirect.class, "redirectForm", true);
  protected String redirectForm = channel.getTypeFieldEntry(PortletPortalRedirect.class, "redirectForm", true).getDefaultTextString();
  public void setRedirectForm(String[] v) {
    redirectForm = getMonolingualValue(redirectFormTFE, v);
  }
  @Override
public String getAvailableRedirectForm() {
    if (theContent != null && isFieldMissing("redirectForm")) {
     String objectValue = theContent.getRedirectForm();
      return objectValue;
    }
    return redirectForm;
  }




  // ----------------------------------------------------------------------
  // url
  // ----------------------------------------------------------------------
  protected TypeFieldEntry urlTFE = channel.getTypeFieldEntry(PortletPortalRedirect.class, "url", true);
  protected String url = channel.getTypeFieldEntry(PortletPortalRedirect.class, "url", true).getDefaultTextString();
  protected HashMap<String,String> urlML = urlTFE.getDefaultTextMap();
  public void setUrl(String[] v) {
    url = getMultilingualMainValue(urlTFE, v);
    urlML = getMultilingualMLMap(urlTFE, v);
  }
  @Override
public String getAvailableUrl() {
    if (theContent != null && isFieldMissing("url")) {
     String objectValue = theContent.getUrl();
      return objectValue;
    }
    return url;
  }


  public HashMap<String,String> getAllAvailableUrlML() {
    HashMap<String,String> map = Util.getHashMap(getAvailableUrlML());
    map.put(channel.getLanguage(),getAvailableUrl(channel.getLanguage()));
    return map;
  }

  public HashMap<String,String> getAvailableUrlML() {
    if (theContent != null && isFieldMissing("url")) {
      return theContent.getUrlML();
    }
    return urlML;
  }
  public String getAvailableUrl(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(url, channel.getTypeFieldEntry(PortletPortalRedirect.class, "url", true).getDefaultTextString())) {
          return url;
      	}
      } else {
      	if (urlML != null && Util.notEmpty(urlML.get(lang))) {
      	  return urlML.get(lang);
      	}
      }
      return Util.getString(theContent.getUrl(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return url;
    }
    return urlML == null ? "" : Util.getString(urlML.get(lang), "");
  }


  // ----------------------------------------------------------------------
  // redirectPortlet
  // ----------------------------------------------------------------------
  protected TypeFieldEntry redirectPortletTFE = channel.getTypeFieldEntry(PortletPortalRedirect.class, "redirectPortlet", true);
  protected boolean isRedirectPortletValidated = true;
  protected com.jalios.jcms.portlet.PortalElement redirectPortlet;
  String __redirectPortletStr = null;
  public void setRedirectPortlet(String v) {
    __redirectPortletStr = v;
  }
  @Override
public com.jalios.jcms.portlet.PortalElement getAvailableRedirectPortlet() {
    if (theContent != null && isFieldMissing("redirectPortlet")) {
     com.jalios.jcms.portlet.PortalElement objectValue = theContent.getRedirectPortlet();
      return objectValue;
    }
    return redirectPortlet;
  }




  // ----------------------------------------------------------------------
  // category
  // ----------------------------------------------------------------------
  protected TypeFieldEntry categoryTFE = channel.getTypeFieldEntry(PortletPortalRedirect.class, "category", true);
  protected String category = channel.getTypeFieldEntry(PortletPortalRedirect.class, "category", true).getDefaultTextString();
  public void setCategory(String[] v) {
    category = getMonolingualValue(categoryTFE, v);
  }
  @Override
public String getAvailableCategory() {
    if (theContent != null && isFieldMissing("category")) {
     String objectValue = theContent.getCategory();
      return objectValue;
    }
    return category;
  }




  // ----------------------------------------------------------------------
  // dispPortal
  // ----------------------------------------------------------------------
  protected TypeFieldEntry dispPortalTFE = channel.getTypeFieldEntry(PortletPortalRedirect.class, "dispPortal", true);
  protected boolean isDispPortalValidated = true;
  protected com.jalios.jcms.portlet.PortalElement dispPortal;
  String __dispPortalStr = null;
  public void setDispPortal(String v) {
    __dispPortalStr = v;
  }
  @Override
public com.jalios.jcms.portlet.PortalElement getAvailableDispPortal() {
    if (theContent != null && isFieldMissing("dispPortal")) {
     com.jalios.jcms.portlet.PortalElement objectValue = theContent.getDispPortal();
      return objectValue;
    }
    return dispPortal;
  }




  // ----------------------------------------------------------------------
  // description
  // ----------------------------------------------------------------------
  protected TypeFieldEntry descriptionTFE = channel.getTypeFieldEntry(PortletPortalRedirect.class, "description", true);
  protected String description = channel.getTypeFieldEntry(PortletPortalRedirect.class, "description", true).getDefaultTextString();
  protected HashMap<String,String> descriptionML = descriptionTFE.getDefaultTextMap();
  public void setDescription(String[] v) {
    description = getMultilingualMainValue(descriptionTFE, v);
    descriptionML = getMultilingualMLMap(descriptionTFE, v);
  }
  @Override
public String getAvailableDescription() {
    if (theContent != null && isFieldMissing("description")) {
     String objectValue = theContent.getDescription();
      return objectValue;
    }
    return description;
  }


  @Override
public HashMap<String,String> getAllAvailableDescriptionML() {
    HashMap<String,String> map = Util.getHashMap(getAvailableDescriptionML());
    map.put(channel.getLanguage(),getAvailableDescription(channel.getLanguage()));
    return map;
  }

  public HashMap<String,String> getAvailableDescriptionML() {
    if (theContent != null && isFieldMissing("description")) {
      return theContent.getDescriptionML();
    }
    return descriptionML;
  }
  @Override
public String getAvailableDescription(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(description, channel.getTypeFieldEntry(PortletPortalRedirect.class, "description", true).getDefaultTextString())) {
          return description;
      	}
      } else {
      	if (descriptionML != null && Util.notEmpty(descriptionML.get(lang))) {
      	  return descriptionML.get(lang);
      	}
      }
      return Util.getString(theContent.getDescription(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return description;
    }
    return descriptionML == null ? "" : Util.getString(descriptionML.get(lang), "");
  }


  // ----------------------------------------------------------------------
  // portletImage
  // ----------------------------------------------------------------------
  protected TypeFieldEntry portletImageTFE = channel.getTypeFieldEntry(PortletPortalRedirect.class, "portletImage", true);
  protected String portletImage = channel.getTypeFieldEntry(PortletPortalRedirect.class, "portletImage", true).getDefaultTextString();
  protected HashMap<String,String> portletImageML = portletImageTFE.getDefaultTextMap();
  public void setPortletImage(String[] v) {
    portletImage = getMultilingualMainValue(portletImageTFE, v);
    portletImageML = getMultilingualMLMap(portletImageTFE, v);
  }
  public String getAvailablePortletImage() {
    if (theContent != null && isFieldMissing("portletImage")) {
     String objectValue = theContent.getPortletImage();
      return objectValue;
    }
    return portletImage;
  }


  public HashMap<String,String> getAllAvailablePortletImageML() {
    HashMap<String,String> map = Util.getHashMap(getAvailablePortletImageML());
    map.put(channel.getLanguage(),getAvailablePortletImage(channel.getLanguage()));
    return map;
  }

  public HashMap<String,String> getAvailablePortletImageML() {
    if (theContent != null && isFieldMissing("portletImage")) {
      return theContent.getPortletImageML();
    }
    return portletImageML;
  }
  public String getAvailablePortletImage(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(portletImage, channel.getTypeFieldEntry(PortletPortalRedirect.class, "portletImage", true).getDefaultTextString())) {
          return portletImage;
      	}
      } else {
      	if (portletImageML != null && Util.notEmpty(portletImageML.get(lang))) {
      	  return portletImageML.get(lang);
      	}
      }
      return Util.getString(theContent.getPortletImage(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return portletImage;
    }
    return portletImageML == null ? "" : Util.getString(portletImageML.get(lang), "");
  }


  // ----------------------------------------------------------------------
  // cacheType
  // ----------------------------------------------------------------------
  protected TypeFieldEntry cacheTypeTFE = channel.getTypeFieldEntry(PortletPortalRedirect.class, "cacheType", true);
  protected String cacheType = channel.getTypeFieldEntry(PortletPortalRedirect.class, "cacheType", true).getDefaultTextString();
  public void setCacheType(String[] v) {
    cacheType = getMonolingualValue(cacheTypeTFE, v);
  }
  @Override
public String getAvailableCacheType() {
    if (theContent != null && isFieldMissing("cacheType")) {
     String objectValue = theContent.getCacheType();
      return objectValue;
    }
    return cacheType;
  }




  // ----------------------------------------------------------------------
  // cacheSensibility
  // ----------------------------------------------------------------------
  protected TypeFieldEntry cacheSensibilityTFE = channel.getTypeFieldEntry(PortletPortalRedirect.class, "cacheSensibility", true);
  protected String cacheSensibility = channel.getTypeFieldEntry(PortletPortalRedirect.class, "cacheSensibility", true).getDefaultTextString();
  public void setCacheSensibility(String[] v) {
    cacheSensibility = getMonolingualValue(cacheSensibilityTFE, v);
  }
  @Override
public String getAvailableCacheSensibility() {
    if (theContent != null && isFieldMissing("cacheSensibility")) {
     String objectValue = theContent.getCacheSensibility();
      return objectValue;
    }
    return cacheSensibility;
  }




  // ----------------------------------------------------------------------
  // invalidClass
  // ----------------------------------------------------------------------
  protected TypeFieldEntry invalidClassTFE = channel.getTypeFieldEntry(PortletPortalRedirect.class, "invalidClass", true);
  protected String[] invalidClass = new String[0];
  protected int invalidClassAddCount = 0;
  public void setInvalidClass(String[] v) {
    invalidClass = getMonolingualValueArray(invalidClassTFE, v);
  }

  @Override
public String[] getAvailableInvalidClass() {
    if (theContent != null && isFieldMissing("invalidClass")) {
	  String[] objectValue = theContent.getInvalidClass();
      if (objectValue == null) {
        return invalidClass;
      }
      return objectValue;
    }
    return invalidClass;
  }



  public void setInvalidClassAddCount(int  v) {
    invalidClassAddCount = v;
  }

  @Override
public int getInvalidClassCount() {
    int arraySize = Util.getSize(getAvailableInvalidClass());
    int res = 3 + arraySize + invalidClassAddCount;
    return res;
  }

  // ----------------------------------------------------------------------
  // invalidTime
  // ----------------------------------------------------------------------
  protected TypeFieldEntry invalidTimeTFE = channel.getTypeFieldEntry(PortletPortalRedirect.class, "invalidTime", true);
  protected boolean isInvalidTimeValidated = true;
  protected long invalidTime = 60;
  public void setInvalidTime(String v) {
    try {
      invalidTime = Long.parseLong(v.trim());
    } catch(NumberFormatException ex) {
      isInvalidTimeValidated = false;
    }
  }

  @Override
public long getAvailableInvalidTime() {
    if (theContent != null && isFieldMissing("invalidTime")) {
     long objectValue = theContent.getInvalidTime();
      return objectValue;
    }
    return invalidTime;
  }




  // ----------------------------------------------------------------------
  // behaviorCopy
  // ----------------------------------------------------------------------
  protected TypeFieldEntry behaviorCopyTFE = channel.getTypeFieldEntry(PortletPortalRedirect.class, "behaviorCopy", true);
  protected String behaviorCopy = channel.getTypeFieldEntry(PortletPortalRedirect.class, "behaviorCopy", true).getDefaultTextString();
  public void setBehaviorCopy(String[] v) {
    behaviorCopy = getMonolingualValue(behaviorCopyTFE, v);
  }
  @Override
public String getAvailableBehaviorCopy() {
    if (theContent != null && isFieldMissing("behaviorCopy")) {
     String objectValue = theContent.getBehaviorCopy();
      return objectValue;
    }
    return behaviorCopy;
  }




  // ----------------------------------------------------------------------
  // cssId
  // ----------------------------------------------------------------------
  protected TypeFieldEntry cssIdTFE = channel.getTypeFieldEntry(PortletPortalRedirect.class, "cssId", true);
  protected String cssId = channel.getTypeFieldEntry(PortletPortalRedirect.class, "cssId", true).getDefaultTextString();
  public void setCssId(String[] v) {
    cssId = getMonolingualValue(cssIdTFE, v);
  }
  @Override
public String getAvailableCssId() {
    if (theContent != null && isFieldMissing("cssId")) {
     String objectValue = theContent.getCssId();
      return objectValue;
    }
    return cssId;
  }




  // ----------------------------------------------------------------------
  // cssClasses
  // ----------------------------------------------------------------------
  protected TypeFieldEntry cssClassesTFE = channel.getTypeFieldEntry(PortletPortalRedirect.class, "cssClasses", true);
  protected String cssClasses = channel.getTypeFieldEntry(PortletPortalRedirect.class, "cssClasses", true).getDefaultTextString();
  public void setCssClasses(String[] v) {
    cssClasses = getMonolingualValue(cssClassesTFE, v);
  }
  public String getAvailableCssClasses() {
    if (theContent != null && isFieldMissing("cssClasses")) {
     String objectValue = theContent.getCssClasses();
      return objectValue;
    }
    return cssClasses;
  }




  // ----------------------------------------------------------------------
  // exactCategory
  // ----------------------------------------------------------------------
  protected TypeFieldEntry exactCategoryTFE = channel.getTypeFieldEntry(PortletPortalRedirect.class, "exactCategory", true);
  protected boolean exactCategory = true;
  public void setExactCategory(boolean  v) {
    this.exactCategory = v;
  }

  public boolean getAvailableExactCategory() {
    if (theContent != null && isFieldMissing("exactCategory")) {
     boolean objectValue = theContent.getExactCategory();
      return objectValue;
    }
    return exactCategory;
  }




  public void setNavCategories(String[] v) {
    updateCids(v);
  }
  public Category getNavCategoriesRoot() {
    return channel.getCategory("j_3");
  }

  public Set<Category> getNavCategoriesCatSet() {
    Category rootCat = getNavCategoriesRoot();
    if (rootCat == null) {
      return Util.emptyTreeSet();
    }
    Set<Category> set = new HashSet<>(rootCat.getDescendantSet());
    set.add(rootCat);
    return Util.interSet(getCategorySet(null), set);
  }




}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// LGJVLhH46pUHTGLQLY3adg==
