// This file has been automatically generated.
package generated;
   
   
import java.text.*;
import java.util.*;
import org.apache.oro.text.regex.*;
import com.jalios.jcms.*;
import com.jalios.jcms.handler.*;
import com.jalios.jcms.wysiwyg.WysiwygManager;
import com.jalios.util.ObjectIntTreeMap;
import com.jalios.util.Util;
import custom.*;
@SuppressWarnings({"unchecked", "unused"})
public class EditJPortalHandler extends com.jalios.jcms.jportal.EditAbstractJPortalHandler {
   
  protected JPortal theContent;
  
  public Class<? extends Publication> getPublicationClass() {
    return JPortal.class;
  }
  
  // ----------------------------------------------------------------------
  // validateBeforeOpJPortal  
  // ----------------------------------------------------------------------
  
  public boolean validateBeforeOp() {
    if (!super.validateBeforeOp()) {
      return false;
    }
    
    Member fdauthor = getLoggedMember();
    
           fdauthor = (fdauthor == null) ? getAvailableAuthor() : fdauthor;
    
    
    {
      List<com.jalios.jcms.portlet.Portlet> list = processDataIds("portlets",__portletsStr,com.jalios.jcms.portlet.Portlet.class);
      this.portlets = (com.jalios.jcms.portlet.Portlet[])list.toArray(new com.jalios.jcms.portlet.Portlet[0]);
    }
    if (!validateUploadedFileDocument(getAvailablePortlets(),   fdauthor, getAvailableWorkspace())) {
      return false;
    }
    if (!createUploadedFileDocument(getAvailablePortlets(),  fdauthor, getAvailableWorkspace())) {
      return false;
    }
    return true;
  }
  @Override
  public Object getAvailableField(String field) {
  
    if ("pageTitle".equals(field)) {
      return getAllAvailablePageTitleML();
    }
    
    if ("description".equals(field)) {
      return getAllAvailableDescriptionML();
    }
    
    if ("keywords".equals(field)) {
      return getAllAvailableKeywordsML();
    }
    
    if ("portletImage".equals(field)) {
      return getAllAvailablePortletImageML();
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
    
    if ("exactCategory".equals(field)) {
      return getAvailableExactCategory();
    }
    
    if ("displayTopbar".equals(field)) {
      return getAvailableDisplayTopbar();
    }
    
    if ("displayScrollToTop".equals(field)) {
      return getAvailableDisplayScrollToTop();
    }
    
    if ("css".equals(field)) {
      return getAvailableCss();
    }
    
    if ("structure".equals(field)) {
      return getAvailableStructure();
    }
    
    if ("portlets".equals(field)) {
      return getAvailablePortlets();
    }
    
    return super.getAvailableField(field);
  }
  @Override
  public Object getEnumValues(String field) {
  
    if ("behaviorCopy".equals(field)) {
      return JPortal.getBehaviorCopyValues();
    }
    if ("cacheType".equals(field)) {
      return JPortal.getCacheTypeValues();
    }
    if ("cacheSensibility".equals(field)) {
      return JPortal.getCacheSensibilityValues();
    }
    if ("invalidClass".equals(field)) {
      return JPortal.getInvalidClassValues();
    }
    if ("exactCategory".equals(field)) {
      return JPortal.getExactCategoryValues();
    }
    if ("displayTopbar".equals(field)) {
      return JPortal.getDisplayTopbarValues();
    }
    if ("displayScrollToTop".equals(field)) {
      return JPortal.getDisplayScrollToTopValues();
    }
    return super.getEnumValues(field);
  }
  @Override
  public Object getEnumLabels(String field, String userLang) {
  
    if ("behaviorCopy".equals(field)) {
      return JPortal.getBehaviorCopyLabels(userLang);
    }
    if ("cacheType".equals(field)) {
      return JPortal.getCacheTypeLabels(userLang);
    }
    if ("cacheSensibility".equals(field)) {
      return JPortal.getCacheSensibilityLabels(userLang);
    }
    if ("invalidClass".equals(field)) {
      return JPortal.getInvalidClassLabels(userLang);
    }
    if ("exactCategory".equals(field)) {
      return JPortal.getExactCategoryLabels(userLang);
    }
    if ("displayTopbar".equals(field)) {
      return JPortal.getDisplayTopbarLabels(userLang);
    }
    if ("displayScrollToTop".equals(field)) {
      return JPortal.getDisplayScrollToTopLabels(userLang);
    }
    return super.getEnumLabels(field, userLang);
  }
  // ----------------------------------------------------------------------
  // validateCommonCreateUpdateJPortal  
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdateJPortal() {
    if (!isInvalidTimeValidated) {
      setWarningMsg(glp("msg.edit.bad-number-format", channel.getTypeFieldLabel(getPublicationClass(), "invalidTime", userLang)));
      return false;
    }
    return true;
  }
  
  // ----------------------------------------------------------------------
  // Create
  // ----------------------------------------------------------------------
  public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate()) {
      return false;
    }
    if (!validateCommonCreateUpdateJPortal()) {
      return false;
    }
    return true;
  }
  
  // ----------------------------------------------------------------------
  // Update
  // ----------------------------------------------------------------------
  public boolean validateUpdate() throws java.io.IOException {
    if (!super.validateUpdate()) {
      return false;
    }
    
    if (!validateCommonCreateUpdateJPortal()) {
      return false;
    }
    
    return true;
  }
 
  // ----------------------------------------------------------------------
  // Next
  // ----------------------------------------------------------------------
  protected boolean validateNext() throws java.io.IOException {
   if (!super.validateNext()) {
      return false;
    }
	return true;
  }
  // ----------------------------------------------------------------------
  // Previous
  // ----------------------------------------------------------------------
  protected boolean validatePrevious() throws java.io.IOException {
  	if (!super.validatePrevious()) {
      return false;
    }
	return true;
  }
  // ----------------------------------------------------------------------
  // Finish
  // ----------------------------------------------------------------------
  protected boolean validateFinish() throws java.io.IOException {
  	if (!super.validateFinish()) {
      return false;
    }
	return true;
  }
  // ----------------------------------------------------------------------
  // setFields
  // ----------------------------------------------------------------------
  public void setFields(Publication data) {
    super.setFields(data);
    JPortal obj = (JPortal)data;
    obj.setPageTitle(getAvailablePageTitle());
    obj.setPageTitleML(getAvailablePageTitleML());
    obj.setDescription(getAvailableDescription());
    obj.setDescriptionML(getAvailableDescriptionML());
    obj.setKeywords(getAvailableKeywords());
    obj.setKeywordsML(getAvailableKeywordsML());
    obj.setPortletImage(getAvailablePortletImage());
    obj.setPortletImageML(getAvailablePortletImageML());
    obj.setBehaviorCopy(getAvailableBehaviorCopy());
    obj.setCssId(getAvailableCssId());
    obj.setCssClasses(getAvailableCssClasses());
    obj.setCacheType(getAvailableCacheType());
    obj.setCacheSensibility(getAvailableCacheSensibility());
    obj.setInvalidClass(getAvailableInvalidClass());
    obj.setInvalidTime(getAvailableInvalidTime());
    obj.setExactCategory(getAvailableExactCategory());
    obj.setDisplayTopbar(getAvailableDisplayTopbar());
    obj.setDisplayScrollToTop(getAvailableDisplayScrollToTop());
    obj.setCss(getAvailableCss());
    obj.setStructure(getAvailableStructure());
    obj.setPortlets(getAvailablePortlets());
  }
  
  public void setId(String  v) {
    if (channel.getData(v) instanceof JPortal) {
      super.setId(v);
      theContent = (JPortal)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }
  
   
  // ----------------------------------------------------------------------
  // pageTitle
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry pageTitleTFE = channel.getTypeFieldEntry(JPortal.class, "pageTitle", true);
  protected String pageTitle = channel.getTypeFieldEntry(JPortal.class, "pageTitle", true).getDefaultTextString();
  protected HashMap<String,String> pageTitleML = pageTitleTFE.getDefaultTextMap();
  public void setPageTitle(String[] v) {
    pageTitle = getMultilingualMainValue(pageTitleTFE, v);
    pageTitleML = getMultilingualMLMap(pageTitleTFE, v);
  }
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
  public String getAvailablePageTitle(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(pageTitle, channel.getTypeFieldEntry(JPortal.class, "pageTitle", true).getDefaultTextString())) {
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
  // description
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry descriptionTFE = channel.getTypeFieldEntry(JPortal.class, "description", true);
  protected String description = channel.getTypeFieldEntry(JPortal.class, "description", true).getDefaultTextString();
  protected HashMap<String,String> descriptionML = descriptionTFE.getDefaultTextMap();
  public void setDescription(String[] v) {
    description = getMultilingualMainValue(descriptionTFE, v);
    descriptionML = getMultilingualMLMap(descriptionTFE, v);
  }
  public String getAvailableDescription() {
    if (theContent != null && isFieldMissing("description")) {
     String objectValue = theContent.getDescription();
      return objectValue;
    }
    return description;
  }
  
    
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
  public String getAvailableDescription(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(description, channel.getTypeFieldEntry(JPortal.class, "description", true).getDefaultTextString())) {
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
  // keywords
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry keywordsTFE = channel.getTypeFieldEntry(JPortal.class, "keywords", true);
  protected String keywords = channel.getTypeFieldEntry(JPortal.class, "keywords", true).getDefaultTextString();
  protected HashMap<String,String> keywordsML = keywordsTFE.getDefaultTextMap();
  public void setKeywords(String[] v) {
    keywords = getMultilingualMainValue(keywordsTFE, v);
    keywordsML = getMultilingualMLMap(keywordsTFE, v);
  }
  public String getAvailableKeywords() {
    if (theContent != null && isFieldMissing("keywords")) {
     String objectValue = theContent.getKeywords();
      return objectValue;
    }
    return keywords;
  }
  
    
  public HashMap<String,String> getAllAvailableKeywordsML() {
    HashMap<String,String> map = Util.getHashMap(getAvailableKeywordsML());
    map.put(channel.getLanguage(),getAvailableKeywords(channel.getLanguage()));
    return map;
  }
  
  public HashMap<String,String> getAvailableKeywordsML() {
    if (theContent != null && isFieldMissing("keywords")) {
      return theContent.getKeywordsML();
    }
    return keywordsML;
  }
  public String getAvailableKeywords(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(keywords, channel.getTypeFieldEntry(JPortal.class, "keywords", true).getDefaultTextString())) {
          return keywords;
      	}
      } else {
      	if (keywordsML != null && Util.notEmpty(keywordsML.get(lang))) {
      	  return keywordsML.get(lang);
      	}
      }
      return Util.getString(theContent.getKeywords(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return keywords;
    }
    return keywordsML == null ? "" : Util.getString(keywordsML.get(lang), "");
  }
  
   
  // ----------------------------------------------------------------------
  // portletImage
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry portletImageTFE = channel.getTypeFieldEntry(JPortal.class, "portletImage", true);
  protected String portletImage = channel.getTypeFieldEntry(JPortal.class, "portletImage", true).getDefaultTextString();
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
      	if (!Util.isSameContent(portletImage, channel.getTypeFieldEntry(JPortal.class, "portletImage", true).getDefaultTextString())) {
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
  // behaviorCopy
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry behaviorCopyTFE = channel.getTypeFieldEntry(JPortal.class, "behaviorCopy", true);
  protected String behaviorCopy = channel.getTypeFieldEntry(JPortal.class, "behaviorCopy", true).getDefaultTextString();
  public void setBehaviorCopy(String[] v) {
    behaviorCopy = getMonolingualValue(behaviorCopyTFE, v);
  }
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
  protected TypeFieldEntry cssIdTFE = channel.getTypeFieldEntry(JPortal.class, "cssId", true);
  protected String cssId = channel.getTypeFieldEntry(JPortal.class, "cssId", true).getDefaultTextString();
  public void setCssId(String[] v) {
    cssId = getMonolingualValue(cssIdTFE, v);
  }
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
  protected TypeFieldEntry cssClassesTFE = channel.getTypeFieldEntry(JPortal.class, "cssClasses", true);
  protected String cssClasses = channel.getTypeFieldEntry(JPortal.class, "cssClasses", true).getDefaultTextString();
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
  // cacheType
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry cacheTypeTFE = channel.getTypeFieldEntry(JPortal.class, "cacheType", true);
  protected String cacheType = channel.getTypeFieldEntry(JPortal.class, "cacheType", true).getDefaultTextString();
  public void setCacheType(String[] v) {
    cacheType = getMonolingualValue(cacheTypeTFE, v);
  }
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
  protected TypeFieldEntry cacheSensibilityTFE = channel.getTypeFieldEntry(JPortal.class, "cacheSensibility", true);
  protected String cacheSensibility = channel.getTypeFieldEntry(JPortal.class, "cacheSensibility", true).getDefaultTextString();
  public void setCacheSensibility(String[] v) {
    cacheSensibility = getMonolingualValue(cacheSensibilityTFE, v);
  }
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
  protected TypeFieldEntry invalidClassTFE = channel.getTypeFieldEntry(JPortal.class, "invalidClass", true);
  protected String[] invalidClass = new String[0];
  protected int invalidClassAddCount = 0;
  public void setInvalidClass(String[] v) {
    invalidClass = getMonolingualValueArray(invalidClassTFE, v);
  }
  
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
  
  public int getInvalidClassCount() {
    int arraySize = Util.getSize(getAvailableInvalidClass());
    int res = 3 + arraySize + invalidClassAddCount;
    return res;
  }
   
  // ----------------------------------------------------------------------
  // invalidTime
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry invalidTimeTFE = channel.getTypeFieldEntry(JPortal.class, "invalidTime", true);
  protected boolean isInvalidTimeValidated = true;
  protected long invalidTime = 60;
  public void setInvalidTime(String v) {
    try {
      invalidTime = Long.parseLong(v.trim());
    } catch(NumberFormatException ex) {
      isInvalidTimeValidated = false;
    }
  }
  
  public long getAvailableInvalidTime() {
    if (theContent != null && isFieldMissing("invalidTime")) {
     long objectValue = theContent.getInvalidTime();
      return objectValue;
    }
    return invalidTime;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // exactCategory
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry exactCategoryTFE = channel.getTypeFieldEntry(JPortal.class, "exactCategory", true);
  protected boolean exactCategory = false;
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
  
    
  
   
  // ----------------------------------------------------------------------
  // displayTopbar
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry displayTopbarTFE = channel.getTypeFieldEntry(JPortal.class, "displayTopbar", true);
  protected boolean displayTopbar = true;
  public void setDisplayTopbar(boolean  v) {
    this.displayTopbar = v;
  }
  
  public boolean getAvailableDisplayTopbar() {
    if (theContent != null && isFieldMissing("displayTopbar")) {
     boolean objectValue = theContent.getDisplayTopbar();
      return objectValue;
    }
    return displayTopbar;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // displayScrollToTop
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry displayScrollToTopTFE = channel.getTypeFieldEntry(JPortal.class, "displayScrollToTop", true);
  protected boolean displayScrollToTop = false;
  public void setDisplayScrollToTop(boolean  v) {
    this.displayScrollToTop = v;
  }
  
  public boolean getAvailableDisplayScrollToTop() {
    if (theContent != null && isFieldMissing("displayScrollToTop")) {
     boolean objectValue = theContent.getDisplayScrollToTop();
      return objectValue;
    }
    return displayScrollToTop;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // css
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry cssTFE = channel.getTypeFieldEntry(JPortal.class, "css", true);
  protected String css = channel.getTypeFieldEntry(JPortal.class, "css", true).getDefaultTextString();
  public void setCss(String[] v) {
    css = getMonolingualValue(cssTFE, v);
  }
  public String getAvailableCss() {
    if (theContent != null && isFieldMissing("css")) {
     String objectValue = theContent.getCss();
      return objectValue;
    }
    return css;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // structure
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry structureTFE = channel.getTypeFieldEntry(JPortal.class, "structure", true);
  protected String structure = channel.getTypeFieldEntry(JPortal.class, "structure", true).getDefaultTextString();
  public void setStructure(String[] v) {
    structure = getMonolingualValue(structureTFE, v);
  }
  public String getAvailableStructure() {
    if (theContent != null && isFieldMissing("structure")) {
     String objectValue = theContent.getStructure();
      return objectValue;
    }
    return structure;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // portlets
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry portletsTFE = channel.getTypeFieldEntry(JPortal.class, "portlets", true);
  protected com.jalios.jcms.portlet.Portlet[] portlets = new com.jalios.jcms.portlet.Portlet[0];
  protected int portletsAddCount = 0;
  String[] __portletsStr = null;
  public void setPortlets(String[]  v) {
    __portletsStr = v;
  }
  public com.jalios.jcms.portlet.Portlet[] getAvailablePortlets() {
    if (theContent != null && isFieldMissing("portlets")) {
	  com.jalios.jcms.portlet.Portlet[] objectValue = theContent.getPortlets();
      if (objectValue == null) {
        return portlets;
      }
      return objectValue;
    }
    return portlets;
  }
  
    
  
  public void setPortletsAddCount(int  v) {
    portletsAddCount = v;
  }
  
  public int getPortletsCount() {
    int arraySize = Util.getSize(getAvailablePortlets());
    int res = 3 + arraySize + portletsAddCount;
    return res;
  }
 
   
 
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// MUtKAfN+0EftsZRE2+NLCg==
