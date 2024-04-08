// This file has been automatically generated.
package generated;


import java.util.HashMap;

import com.jalios.jcms.Data;
import com.jalios.jcms.Member;
import com.jalios.jcms.Publication;
import com.jalios.jcms.TypeFieldEntry;
import com.jalios.util.Util;
@SuppressWarnings({"unchecked", "unused"})
public class EditAbstractPortalHandler extends com.jalios.jcms.portlet.EditPortalHandler {

  protected AbstractPortal theContent;

  @Override
public Class<? extends Publication> getPublicationClass() {
    return AbstractPortal.class;
  }

  // ----------------------------------------------------------------------
  // validateBeforeOpAbstractPortal
  // ----------------------------------------------------------------------

  @Override
public boolean validateBeforeOp() {
    if (!super.validateBeforeOp()) {
      return false;
    }

    Member fdauthor = getLoggedMember();

           fdauthor = (fdauthor == null) ? getAvailableAuthor() : fdauthor;


    {
      Data data = processDataId("child", __childStr, com.jalios.jcms.portlet.PortalElement.class);
      if (data != null) {
        child = (com.jalios.jcms.portlet.PortalElement)data;
      } else {
        isChildValidated = Util.isEmpty(__childStr);
      }
    }
    if (!validateUploadedFileDocument(getAvailableChild(),   fdauthor, getAvailableWorkspace()) || !createUploadedFileDocument(getAvailableChild(),  fdauthor, getAvailableWorkspace())) {
      return false;
    }
    return true;
  }
  @Override
  public Object getAvailableField(String field) {

    if ("pageTitle".equals(field)) {
      return getAllAvailablePageTitleML();
    }

    if ("child".equals(field)) {
      return getAvailableChild();
    }

    if ("cssFile".equals(field)) {
      return getAvailableCssFile();
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

    if ("cssFile".equals(field)) {
      return AbstractPortal.getCssFileValues();
    }
    if ("cacheType".equals(field)) {
      return AbstractPortal.getCacheTypeValues();
    }
    if ("cacheSensibility".equals(field)) {
      return AbstractPortal.getCacheSensibilityValues();
    }
    if ("invalidClass".equals(field)) {
      return AbstractPortal.getInvalidClassValues();
    }
    if ("behaviorCopy".equals(field)) {
      return AbstractPortal.getBehaviorCopyValues();
    }
    if ("exactCategory".equals(field)) {
      return AbstractPortal.getExactCategoryValues();
    }
    return super.getEnumValues(field);
  }
  @Override
  public Object getEnumLabels(String field, String userLang) {

    if ("cssFile".equals(field)) {
      return AbstractPortal.getCssFileLabels(userLang);
    }
    if ("cacheType".equals(field)) {
      return AbstractPortal.getCacheTypeLabels(userLang);
    }
    if ("cacheSensibility".equals(field)) {
      return AbstractPortal.getCacheSensibilityLabels(userLang);
    }
    if ("invalidClass".equals(field)) {
      return AbstractPortal.getInvalidClassLabels(userLang);
    }
    if ("behaviorCopy".equals(field)) {
      return AbstractPortal.getBehaviorCopyLabels(userLang);
    }
    if ("exactCategory".equals(field)) {
      return AbstractPortal.getExactCategoryLabels(userLang);
    }
    return super.getEnumLabels(field, userLang);
  }
  // ----------------------------------------------------------------------
  // validateCommonCreateUpdateAbstractPortal
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdateAbstractPortal() {
    if (!isChildValidated) {
      setWarningMsg(glp("msg.edit.bad-link-id", channel.getTypeFieldLabel(getPublicationClass(), "child", userLang)));
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
    if (!super.validateCreate() || !validateCommonCreateUpdateAbstractPortal()) {
      return false;
    }
    return true;
  }

  // ----------------------------------------------------------------------
  // Update
  // ----------------------------------------------------------------------
  @Override
public boolean validateUpdate() throws java.io.IOException {
    if (!super.validateUpdate() || !validateCommonCreateUpdateAbstractPortal()) {
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
    AbstractPortal obj = (AbstractPortal)data;
    obj.setPageTitle(getAvailablePageTitle());
    obj.setPageTitleML(getAvailablePageTitleML());
    obj.setChild(getAvailableChild());
    obj.setCssFile(getAvailableCssFile());
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
    if (channel.getData(v) instanceof AbstractPortal) {
      super.setId(v);
      theContent = (AbstractPortal)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }


  // ----------------------------------------------------------------------
  // pageTitle
  // ----------------------------------------------------------------------
  protected TypeFieldEntry pageTitleTFE = channel.getTypeFieldEntry(AbstractPortal.class, "pageTitle", true);
  protected String pageTitle = channel.getTypeFieldEntry(AbstractPortal.class, "pageTitle", true).getDefaultTextString();
  protected HashMap<String,String> pageTitleML = pageTitleTFE.getDefaultTextMap();
  public void setPageTitle(String[] v) {
    pageTitle = getMultilingualMainValue(pageTitleTFE, v);
    pageTitleML = getMultilingualMLMap(pageTitleTFE, v);
  }
  @Override
public String getAvailablePageTitle() {
    if (theContent != null && isFieldMissing("pageTitle")) {
     String objectValue = theContent.getPageTitle();
      return objectValue;
    }
    return pageTitle;
  }


  public HashMap<String,String> getAllAvailablePageTitleML() {
    HashMap<String,String> map = Util.getHashMap(getAvailablePageTitleML());
    map.put(channel.getLanguage(),getAvailablePageTitle(channel.getLanguage()));
    return map;
  }

  public HashMap<String,String> getAvailablePageTitleML() {
    if (theContent != null && isFieldMissing("pageTitle")) {
      return theContent.getPageTitleML();
    }
    return pageTitleML;
  }
  @Override
public String getAvailablePageTitle(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(pageTitle, channel.getTypeFieldEntry(AbstractPortal.class, "pageTitle", true).getDefaultTextString())) {
          return pageTitle;
      	}
      } else {
      	if (pageTitleML != null && Util.notEmpty(pageTitleML.get(lang))) {
      	  return pageTitleML.get(lang);
      	}
      }
      return Util.getString(theContent.getPageTitle(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return pageTitle;
    }
    return pageTitleML == null ? "" : Util.getString(pageTitleML.get(lang), "");
  }


  // ----------------------------------------------------------------------
  // child
  // ----------------------------------------------------------------------
  protected TypeFieldEntry childTFE = channel.getTypeFieldEntry(AbstractPortal.class, "child", true);
  protected boolean isChildValidated = true;
  protected com.jalios.jcms.portlet.PortalElement child;
  String __childStr = null;
  public void setChild(String v) {
    __childStr = v;
  }
  @Override
public com.jalios.jcms.portlet.PortalElement getAvailableChild() {
    if (theContent != null && isFieldMissing("child")) {
     com.jalios.jcms.portlet.PortalElement objectValue = theContent.getChild();
      return objectValue;
    }
    return child;
  }




  // ----------------------------------------------------------------------
  // cssFile
  // ----------------------------------------------------------------------
  protected TypeFieldEntry cssFileTFE = channel.getTypeFieldEntry(AbstractPortal.class, "cssFile", true);
  protected String cssFile = channel.getTypeFieldEntry(AbstractPortal.class, "cssFile", true).getDefaultTextString();
  public void setCssFile(String[] v) {
    cssFile = getMonolingualValue(cssFileTFE, v);
  }
  @Override
public String getAvailableCssFile() {
    if (theContent != null && isFieldMissing("cssFile")) {
     String objectValue = theContent.getCssFile();
      return objectValue;
    }
    return cssFile;
  }




  // ----------------------------------------------------------------------
  // description
  // ----------------------------------------------------------------------
  protected TypeFieldEntry descriptionTFE = channel.getTypeFieldEntry(AbstractPortal.class, "description", true);
  protected String description = channel.getTypeFieldEntry(AbstractPortal.class, "description", true).getDefaultTextString();
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
      	if (!Util.isSameContent(description, channel.getTypeFieldEntry(AbstractPortal.class, "description", true).getDefaultTextString())) {
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
  protected TypeFieldEntry portletImageTFE = channel.getTypeFieldEntry(AbstractPortal.class, "portletImage", true);
  protected String portletImage = channel.getTypeFieldEntry(AbstractPortal.class, "portletImage", true).getDefaultTextString();
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
      	if (!Util.isSameContent(portletImage, channel.getTypeFieldEntry(AbstractPortal.class, "portletImage", true).getDefaultTextString())) {
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
  protected TypeFieldEntry cacheTypeTFE = channel.getTypeFieldEntry(AbstractPortal.class, "cacheType", true);
  protected String cacheType = channel.getTypeFieldEntry(AbstractPortal.class, "cacheType", true).getDefaultTextString();
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
  protected TypeFieldEntry cacheSensibilityTFE = channel.getTypeFieldEntry(AbstractPortal.class, "cacheSensibility", true);
  protected String cacheSensibility = channel.getTypeFieldEntry(AbstractPortal.class, "cacheSensibility", true).getDefaultTextString();
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
  protected TypeFieldEntry invalidClassTFE = channel.getTypeFieldEntry(AbstractPortal.class, "invalidClass", true);
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
  protected TypeFieldEntry invalidTimeTFE = channel.getTypeFieldEntry(AbstractPortal.class, "invalidTime", true);
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
  protected TypeFieldEntry behaviorCopyTFE = channel.getTypeFieldEntry(AbstractPortal.class, "behaviorCopy", true);
  protected String behaviorCopy = channel.getTypeFieldEntry(AbstractPortal.class, "behaviorCopy", true).getDefaultTextString();
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
  protected TypeFieldEntry cssIdTFE = channel.getTypeFieldEntry(AbstractPortal.class, "cssId", true);
  protected String cssId = channel.getTypeFieldEntry(AbstractPortal.class, "cssId", true).getDefaultTextString();
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
  protected TypeFieldEntry cssClassesTFE = channel.getTypeFieldEntry(AbstractPortal.class, "cssClasses", true);
  protected String cssClasses = channel.getTypeFieldEntry(AbstractPortal.class, "cssClasses", true).getDefaultTextString();
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
  protected TypeFieldEntry exactCategoryTFE = channel.getTypeFieldEntry(AbstractPortal.class, "exactCategory", true);
  protected boolean exactCategory = false;
  public void setExactCategory(boolean  v) {
    this.exactCategory = v;
  }

  @Override
public boolean getAvailableExactCategory() {
    if (theContent != null && isFieldMissing("exactCategory")) {
     boolean objectValue = theContent.getExactCategory();
      return objectValue;
    }
    return exactCategory;
  }






}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// 40XREY+pag0kstUbpCz3IQ==
