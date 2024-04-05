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
public class EditAbstractParentHandler extends com.jalios.jcms.portlet.EditPortletParentHandler {
   
  protected AbstractParent theContent;
  
  public Class<? extends Publication> getPublicationClass() {
    return AbstractParent.class;
  }
  
  // ----------------------------------------------------------------------
  // validateBeforeOpAbstractParent  
  // ----------------------------------------------------------------------
  
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
    {
      Data data = processDataId("originalPortlet", __originalPortletStr, com.jalios.jcms.portlet.PortalElement.class);
      if (data != null) { 
        originalPortlet = (com.jalios.jcms.portlet.PortalElement)data;
      } else {
        isOriginalPortletValidated = Util.isEmpty(__originalPortletStr);
      }
    }
    if (!validateUploadedFileDocument(getAvailableChild(),   fdauthor, getAvailableWorkspace())) {
      return false;
    }
    if (!validateUploadedFileDocument(getAvailableOriginalPortlet(),   fdauthor, getAvailableWorkspace())) {
      return false;
    }
    if (!createUploadedFileDocument(getAvailableChild(),  fdauthor, getAvailableWorkspace())) {
      return false;
    }
    if (!createUploadedFileDocument(getAvailableOriginalPortlet(),  fdauthor, getAvailableWorkspace())) {
      return false;
    }
    return true;
  }
  @Override
  public Object getAvailableField(String field) {
  
    if ("child".equals(field)) {
      return getAvailableChild();
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
    
    if ("displayCSS".equals(field)) {
      return getAvailableDisplayCSS();
    }
    
    if ("width".equals(field)) {
      return getAvailableWidth();
    }
    
    if ("insetLeft".equals(field)) {
      return getAvailableInsetLeft();
    }
    
    if ("insetRight".equals(field)) {
      return getAvailableInsetRight();
    }
    
    if ("insetTop".equals(field)) {
      return getAvailableInsetTop();
    }
    
    if ("insetBottom".equals(field)) {
      return getAvailableInsetBottom();
    }
    
    if ("cellPadding".equals(field)) {
      return getAvailableCellPadding();
    }
    
    if ("alignH".equals(field)) {
      return getAvailableAlignH();
    }
    
    if ("alignV".equals(field)) {
      return getAvailableAlignV();
    }
    
    if ("alignTable".equals(field)) {
      return getAvailableAlignTable();
    }
    
    if ("border".equals(field)) {
      return getAvailableBorder();
    }
    
    if ("borderColor".equals(field)) {
      return getAvailableBorderColor();
    }
    
    if ("backColor".equals(field)) {
      return getAvailableBackColor();
    }
    
    if ("backImage".equals(field)) {
      return getAvailableBackImage();
    }
    
    if ("displayTitle".equals(field)) {
      return getAllAvailableDisplayTitleML();
    }
    
    if ("skins".equals(field)) {
      return getAvailableSkins();
    }
    
    if ("skinCSS".equals(field)) {
      return getAvailableSkinCSS();
    }
    
    if ("popupState".equals(field)) {
      return getAvailablePopupState();
    }
    
    if ("expandState".equals(field)) {
      return getAvailableExpandState();
    }
    
    if ("behaviorCopy".equals(field)) {
      return getAvailableBehaviorCopy();
    }
    
    if ("originalPortlet".equals(field)) {
      return getAvailableOriginalPortlet();
    }
    
    if ("condition".equals(field)) {
      return getAvailableCondition();
    }
    
    if ("cssId".equals(field)) {
      return getAvailableCssId();
    }
    
    if ("cssClasses".equals(field)) {
      return getAvailableCssClasses();
    }
    
    if ("skinClasses".equals(field)) {
      return getAvailableSkinClasses();
    }
    
    if ("skinFooter".equals(field)) {
      return getAllAvailableSkinFooterML();
    }
    
    if ("skinHeaderIcon".equals(field)) {
      return getAvailableSkinHeaderIcon();
    }
    
    if ("skinHeaderIconColor".equals(field)) {
      return getAvailableSkinHeaderIconColor();
    }
    
    if ("skinFooterButtonLabel".equals(field)) {
      return getAllAvailableSkinFooterButtonLabelML();
    }
    
    if ("skinFooterButtonLink".equals(field)) {
      return getAvailableSkinFooterButtonLink();
    }
    
    if ("skinFooterButtonAlign".equals(field)) {
      return getAvailableSkinFooterButtonAlign();
    }
    
    if ("skinHeaderButtonLabel".equals(field)) {
      return getAllAvailableSkinHeaderButtonLabelML();
    }
    
    if ("skinHeaderButtonLink".equals(field)) {
      return getAvailableSkinHeaderButtonLink();
    }
    
    if ("skinHeaderSubText".equals(field)) {
      return getAllAvailableSkinHeaderSubTextML();
    }
    
    return super.getAvailableField(field);
  }
  @Override
  public Object getEnumValues(String field) {
  
    if ("cacheType".equals(field)) {
      return AbstractParent.getCacheTypeValues();
    }
    if ("cacheSensibility".equals(field)) {
      return AbstractParent.getCacheSensibilityValues();
    }
    if ("invalidClass".equals(field)) {
      return AbstractParent.getInvalidClassValues();
    }
    if ("displayCSS".equals(field)) {
      return AbstractParent.getDisplayCSSValues();
    }
    if ("alignH".equals(field)) {
      return AbstractParent.getAlignHValues();
    }
    if ("alignV".equals(field)) {
      return AbstractParent.getAlignVValues();
    }
    if ("alignTable".equals(field)) {
      return AbstractParent.getAlignTableValues();
    }
    if ("skinCSS".equals(field)) {
      return AbstractParent.getSkinCSSValues();
    }
    if ("popupState".equals(field)) {
      return AbstractParent.getPopupStateValues();
    }
    if ("expandState".equals(field)) {
      return AbstractParent.getExpandStateValues();
    }
    if ("behaviorCopy".equals(field)) {
      return AbstractParent.getBehaviorCopyValues();
    }
    if ("condition".equals(field)) {
      return AbstractParent.getConditionValues();
    }
    if ("skinFooterButtonAlign".equals(field)) {
      return AbstractParent.getSkinFooterButtonAlignValues();
    }
    return super.getEnumValues(field);
  }
  @Override
  public Object getEnumLabels(String field, String userLang) {
  
    if ("cacheType".equals(field)) {
      return AbstractParent.getCacheTypeLabels(userLang);
    }
    if ("cacheSensibility".equals(field)) {
      return AbstractParent.getCacheSensibilityLabels(userLang);
    }
    if ("invalidClass".equals(field)) {
      return AbstractParent.getInvalidClassLabels(userLang);
    }
    if ("displayCSS".equals(field)) {
      return AbstractParent.getDisplayCSSLabels(userLang);
    }
    if ("alignH".equals(field)) {
      return AbstractParent.getAlignHLabels(userLang);
    }
    if ("alignV".equals(field)) {
      return AbstractParent.getAlignVLabels(userLang);
    }
    if ("alignTable".equals(field)) {
      return AbstractParent.getAlignTableLabels(userLang);
    }
    if ("skinCSS".equals(field)) {
      return AbstractParent.getSkinCSSLabels(userLang);
    }
    if ("popupState".equals(field)) {
      return AbstractParent.getPopupStateLabels(userLang);
    }
    if ("expandState".equals(field)) {
      return AbstractParent.getExpandStateLabels(userLang);
    }
    if ("behaviorCopy".equals(field)) {
      return AbstractParent.getBehaviorCopyLabels(userLang);
    }
    if ("condition".equals(field)) {
      return AbstractParent.getConditionLabels(userLang);
    }
    if ("skinFooterButtonAlign".equals(field)) {
      return AbstractParent.getSkinFooterButtonAlignLabels(userLang);
    }
    return super.getEnumLabels(field, userLang);
  }
  // ----------------------------------------------------------------------
  // validateCommonCreateUpdateAbstractParent  
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdateAbstractParent() {
    if (!isChildValidated) {
      setWarningMsg(glp("msg.edit.bad-link-id", channel.getTypeFieldLabel(getPublicationClass(), "child", userLang)));
      return false;
    }
    if (!isInvalidTimeValidated) {
      setWarningMsg(glp("msg.edit.bad-number-format", channel.getTypeFieldLabel(getPublicationClass(), "invalidTime", userLang)));
      return false;
    }
    if (!isInsetLeftValidated) {
      setWarningMsg(glp("msg.edit.bad-number-format", channel.getTypeFieldLabel(getPublicationClass(), "insetLeft", userLang)));
      return false;
    }
    if (!isInsetRightValidated) {
      setWarningMsg(glp("msg.edit.bad-number-format", channel.getTypeFieldLabel(getPublicationClass(), "insetRight", userLang)));
      return false;
    }
    if (!isInsetTopValidated) {
      setWarningMsg(glp("msg.edit.bad-number-format", channel.getTypeFieldLabel(getPublicationClass(), "insetTop", userLang)));
      return false;
    }
    if (!isInsetBottomValidated) {
      setWarningMsg(glp("msg.edit.bad-number-format", channel.getTypeFieldLabel(getPublicationClass(), "insetBottom", userLang)));
      return false;
    }
    if (!isCellPaddingValidated) {
      setWarningMsg(glp("msg.edit.bad-number-format", channel.getTypeFieldLabel(getPublicationClass(), "cellPadding", userLang)));
      return false;
    }
    if (!isBorderValidated) {
      setWarningMsg(glp("msg.edit.bad-number-format", channel.getTypeFieldLabel(getPublicationClass(), "border", userLang)));
      return false;
    }
    if (!isOriginalPortletValidated) {
      setWarningMsg(glp("msg.edit.bad-link-id", channel.getTypeFieldLabel(getPublicationClass(), "originalPortlet", userLang)));
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
    if (!validateCommonCreateUpdateAbstractParent()) {
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
    
    if (!validateCommonCreateUpdateAbstractParent()) {
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
    AbstractParent obj = (AbstractParent)data;
    obj.setChild(getAvailableChild());
    obj.setDescription(getAvailableDescription());
    obj.setDescriptionML(getAvailableDescriptionML());
    obj.setPortletImage(getAvailablePortletImage());
    obj.setPortletImageML(getAvailablePortletImageML());
    obj.setCacheType(getAvailableCacheType());
    obj.setCacheSensibility(getAvailableCacheSensibility());
    obj.setInvalidClass(getAvailableInvalidClass());
    obj.setInvalidTime(getAvailableInvalidTime());
    obj.setDisplayCSS(getAvailableDisplayCSS());
    obj.setWidth(getAvailableWidth());
    obj.setInsetLeft(getAvailableInsetLeft());
    obj.setInsetRight(getAvailableInsetRight());
    obj.setInsetTop(getAvailableInsetTop());
    obj.setInsetBottom(getAvailableInsetBottom());
    obj.setCellPadding(getAvailableCellPadding());
    obj.setAlignH(getAvailableAlignH());
    obj.setAlignV(getAvailableAlignV());
    obj.setAlignTable(getAvailableAlignTable());
    obj.setBorder(getAvailableBorder());
    obj.setBorderColor(getAvailableBorderColor());
    obj.setBackColor(getAvailableBackColor());
    obj.setBackImage(getAvailableBackImage());
    obj.setDisplayTitle(getAvailableDisplayTitle());
    obj.setDisplayTitleML(getAvailableDisplayTitleML());
    obj.setSkins(getAvailableSkins());
    obj.setSkinCSS(getAvailableSkinCSS());
    obj.setPopupState(getAvailablePopupState());
    obj.setExpandState(getAvailableExpandState());
    obj.setBehaviorCopy(getAvailableBehaviorCopy());
    obj.setOriginalPortlet(getAvailableOriginalPortlet());
    obj.setCondition(getAvailableCondition());
    obj.setCssId(getAvailableCssId());
    obj.setCssClasses(getAvailableCssClasses());
    obj.setSkinClasses(getAvailableSkinClasses());
    obj.setSkinFooter(getAvailableSkinFooter());
    obj.setSkinFooterML(getAvailableSkinFooterML());
    obj.setSkinHeaderIcon(getAvailableSkinHeaderIcon());
    obj.setSkinHeaderIconColor(getAvailableSkinHeaderIconColor());
    obj.setSkinFooterButtonLabel(getAvailableSkinFooterButtonLabel());
    obj.setSkinFooterButtonLabelML(getAvailableSkinFooterButtonLabelML());
    obj.setSkinFooterButtonLink(getAvailableSkinFooterButtonLink());
    obj.setSkinFooterButtonAlign(getAvailableSkinFooterButtonAlign());
    obj.setSkinHeaderButtonLabel(getAvailableSkinHeaderButtonLabel());
    obj.setSkinHeaderButtonLabelML(getAvailableSkinHeaderButtonLabelML());
    obj.setSkinHeaderButtonLink(getAvailableSkinHeaderButtonLink());
    obj.setSkinHeaderSubText(getAvailableSkinHeaderSubText());
    obj.setSkinHeaderSubTextML(getAvailableSkinHeaderSubTextML());
  }
  
  public void setId(String  v) {
    if (channel.getData(v) instanceof AbstractParent) {
      super.setId(v);
      theContent = (AbstractParent)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }
  
   
  // ----------------------------------------------------------------------
  // child
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry childTFE = channel.getTypeFieldEntry(AbstractParent.class, "child", true);
  protected boolean isChildValidated = true;
  protected com.jalios.jcms.portlet.PortalElement child;
  String __childStr = null;
  public void setChild(String v) {
    __childStr = v;
  }
  public com.jalios.jcms.portlet.PortalElement getAvailableChild() {
    if (theContent != null && isFieldMissing("child")) {
     com.jalios.jcms.portlet.PortalElement objectValue = theContent.getChild();
      return objectValue;
    }
    return child;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // description
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry descriptionTFE = channel.getTypeFieldEntry(AbstractParent.class, "description", true);
  protected String description = channel.getTypeFieldEntry(AbstractParent.class, "description", true).getDefaultTextString();
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
      	if (!Util.isSameContent(description, channel.getTypeFieldEntry(AbstractParent.class, "description", true).getDefaultTextString())) {
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
  protected TypeFieldEntry portletImageTFE = channel.getTypeFieldEntry(AbstractParent.class, "portletImage", true);
  protected String portletImage = channel.getTypeFieldEntry(AbstractParent.class, "portletImage", true).getDefaultTextString();
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
      	if (!Util.isSameContent(portletImage, channel.getTypeFieldEntry(AbstractParent.class, "portletImage", true).getDefaultTextString())) {
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
  protected TypeFieldEntry cacheTypeTFE = channel.getTypeFieldEntry(AbstractParent.class, "cacheType", true);
  protected String cacheType = channel.getTypeFieldEntry(AbstractParent.class, "cacheType", true).getDefaultTextString();
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
  protected TypeFieldEntry cacheSensibilityTFE = channel.getTypeFieldEntry(AbstractParent.class, "cacheSensibility", true);
  protected String cacheSensibility = channel.getTypeFieldEntry(AbstractParent.class, "cacheSensibility", true).getDefaultTextString();
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
  protected TypeFieldEntry invalidClassTFE = channel.getTypeFieldEntry(AbstractParent.class, "invalidClass", true);
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
  protected TypeFieldEntry invalidTimeTFE = channel.getTypeFieldEntry(AbstractParent.class, "invalidTime", true);
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
  // displayCSS
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry displayCSSTFE = channel.getTypeFieldEntry(AbstractParent.class, "displayCSS", true);
  protected String displayCSS = channel.getTypeFieldEntry(AbstractParent.class, "displayCSS", true).getDefaultTextString();
  public void setDisplayCSS(String[] v) {
    displayCSS = getMonolingualValue(displayCSSTFE, v);
  }
  public String getAvailableDisplayCSS() {
    if (theContent != null && isFieldMissing("displayCSS")) {
     String objectValue = theContent.getDisplayCSS();
      return objectValue;
    }
    return displayCSS;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // width
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry widthTFE = channel.getTypeFieldEntry(AbstractParent.class, "width", true);
  protected String width = channel.getTypeFieldEntry(AbstractParent.class, "width", true).getDefaultTextString();
  public void setWidth(String[] v) {
    width = getMonolingualValue(widthTFE, v);
  }
  public String getAvailableWidth() {
    if (theContent != null && isFieldMissing("width")) {
     String objectValue = theContent.getWidth();
      return objectValue;
    }
    return width;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // insetLeft
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry insetLeftTFE = channel.getTypeFieldEntry(AbstractParent.class, "insetLeft", true);
  protected boolean isInsetLeftValidated = true;
  protected int insetLeft = 0;
  public void setInsetLeft(String v) {
    try {
      insetLeft = Integer.parseInt(v.trim());
    } catch(NumberFormatException ex) {
      isInsetLeftValidated = false;
    }
  }
  public int getAvailableInsetLeft() {
    if (theContent != null && isFieldMissing("insetLeft")) {
     int objectValue = theContent.getInsetLeft();
      return objectValue;
    }
    return insetLeft;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // insetRight
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry insetRightTFE = channel.getTypeFieldEntry(AbstractParent.class, "insetRight", true);
  protected boolean isInsetRightValidated = true;
  protected int insetRight = 0;
  public void setInsetRight(String v) {
    try {
      insetRight = Integer.parseInt(v.trim());
    } catch(NumberFormatException ex) {
      isInsetRightValidated = false;
    }
  }
  public int getAvailableInsetRight() {
    if (theContent != null && isFieldMissing("insetRight")) {
     int objectValue = theContent.getInsetRight();
      return objectValue;
    }
    return insetRight;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // insetTop
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry insetTopTFE = channel.getTypeFieldEntry(AbstractParent.class, "insetTop", true);
  protected boolean isInsetTopValidated = true;
  protected int insetTop = 0;
  public void setInsetTop(String v) {
    try {
      insetTop = Integer.parseInt(v.trim());
    } catch(NumberFormatException ex) {
      isInsetTopValidated = false;
    }
  }
  public int getAvailableInsetTop() {
    if (theContent != null && isFieldMissing("insetTop")) {
     int objectValue = theContent.getInsetTop();
      return objectValue;
    }
    return insetTop;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // insetBottom
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry insetBottomTFE = channel.getTypeFieldEntry(AbstractParent.class, "insetBottom", true);
  protected boolean isInsetBottomValidated = true;
  protected int insetBottom = 0;
  public void setInsetBottom(String v) {
    try {
      insetBottom = Integer.parseInt(v.trim());
    } catch(NumberFormatException ex) {
      isInsetBottomValidated = false;
    }
  }
  public int getAvailableInsetBottom() {
    if (theContent != null && isFieldMissing("insetBottom")) {
     int objectValue = theContent.getInsetBottom();
      return objectValue;
    }
    return insetBottom;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // cellPadding
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry cellPaddingTFE = channel.getTypeFieldEntry(AbstractParent.class, "cellPadding", true);
  protected boolean isCellPaddingValidated = true;
  protected int cellPadding = 0;
  public void setCellPadding(String v) {
    try {
      cellPadding = Integer.parseInt(v.trim());
    } catch(NumberFormatException ex) {
      isCellPaddingValidated = false;
    }
  }
  public int getAvailableCellPadding() {
    if (theContent != null && isFieldMissing("cellPadding")) {
     int objectValue = theContent.getCellPadding();
      return objectValue;
    }
    return cellPadding;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // alignH
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry alignHTFE = channel.getTypeFieldEntry(AbstractParent.class, "alignH", true);
  protected String alignH = channel.getTypeFieldEntry(AbstractParent.class, "alignH", true).getDefaultTextString();
  public void setAlignH(String[] v) {
    alignH = getMonolingualValue(alignHTFE, v);
  }
  public String getAvailableAlignH() {
    if (theContent != null && isFieldMissing("alignH")) {
     String objectValue = theContent.getAlignH();
      return objectValue;
    }
    return alignH;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // alignV
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry alignVTFE = channel.getTypeFieldEntry(AbstractParent.class, "alignV", true);
  protected String alignV = channel.getTypeFieldEntry(AbstractParent.class, "alignV", true).getDefaultTextString();
  public void setAlignV(String[] v) {
    alignV = getMonolingualValue(alignVTFE, v);
  }
  public String getAvailableAlignV() {
    if (theContent != null && isFieldMissing("alignV")) {
     String objectValue = theContent.getAlignV();
      return objectValue;
    }
    return alignV;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // alignTable
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry alignTableTFE = channel.getTypeFieldEntry(AbstractParent.class, "alignTable", true);
  protected String alignTable = channel.getTypeFieldEntry(AbstractParent.class, "alignTable", true).getDefaultTextString();
  public void setAlignTable(String[] v) {
    alignTable = getMonolingualValue(alignTableTFE, v);
  }
  public String getAvailableAlignTable() {
    if (theContent != null && isFieldMissing("alignTable")) {
     String objectValue = theContent.getAlignTable();
      return objectValue;
    }
    return alignTable;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // border
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry borderTFE = channel.getTypeFieldEntry(AbstractParent.class, "border", true);
  protected boolean isBorderValidated = true;
  protected int border = 0;
  public void setBorder(String v) {
    try {
      border = Integer.parseInt(v.trim());
    } catch(NumberFormatException ex) {
      isBorderValidated = false;
    }
  }
  public int getAvailableBorder() {
    if (theContent != null && isFieldMissing("border")) {
     int objectValue = theContent.getBorder();
      return objectValue;
    }
    return border;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // borderColor
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry borderColorTFE = channel.getTypeFieldEntry(AbstractParent.class, "borderColor", true);
  protected String borderColor = channel.getTypeFieldEntry(AbstractParent.class, "borderColor", true).getDefaultTextString();
  public void setBorderColor(String[] v) {
    borderColor = getMonolingualValue(borderColorTFE, v);
  }
  public String getAvailableBorderColor() {
    if (theContent != null && isFieldMissing("borderColor")) {
     String objectValue = theContent.getBorderColor();
      return objectValue;
    }
    return borderColor;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // backColor
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry backColorTFE = channel.getTypeFieldEntry(AbstractParent.class, "backColor", true);
  protected String backColor = channel.getTypeFieldEntry(AbstractParent.class, "backColor", true).getDefaultTextString();
  public void setBackColor(String[] v) {
    backColor = getMonolingualValue(backColorTFE, v);
  }
  public String getAvailableBackColor() {
    if (theContent != null && isFieldMissing("backColor")) {
     String objectValue = theContent.getBackColor();
      return objectValue;
    }
    return backColor;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // backImage
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry backImageTFE = channel.getTypeFieldEntry(AbstractParent.class, "backImage", true);
  protected String backImage = channel.getTypeFieldEntry(AbstractParent.class, "backImage", true).getDefaultTextString();
  public void setBackImage(String[] v) {
    backImage = getMonolingualValue(backImageTFE, v);
  }
  public String getAvailableBackImage() {
    if (theContent != null && isFieldMissing("backImage")) {
     String objectValue = theContent.getBackImage();
      return objectValue;
    }
    return backImage;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // displayTitle
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry displayTitleTFE = channel.getTypeFieldEntry(AbstractParent.class, "displayTitle", true);
  protected String displayTitle = channel.getTypeFieldEntry(AbstractParent.class, "displayTitle", true).getDefaultTextString();
  protected HashMap<String,String> displayTitleML = displayTitleTFE.getDefaultTextMap();
  public void setDisplayTitle(String[] v) {
    displayTitle = getMultilingualMainValue(displayTitleTFE, v);
    displayTitleML = getMultilingualMLMap(displayTitleTFE, v);
  }
  public String getAvailableDisplayTitle() {
    if (theContent != null && isFieldMissing("displayTitle")) {
     String objectValue = theContent.getDisplayTitle();
      return objectValue;
    }
    return displayTitle;
  }
  
    
  public HashMap<String,String> getAllAvailableDisplayTitleML() {
    HashMap<String,String> map = Util.getHashMap(getAvailableDisplayTitleML());
    map.put(channel.getLanguage(),getAvailableDisplayTitle(channel.getLanguage()));
    return map;
  }
  
  public HashMap<String,String> getAvailableDisplayTitleML() {
    if (theContent != null && isFieldMissing("displayTitle")) {
      return theContent.getDisplayTitleML();
    }
    return displayTitleML;
  }
  public String getAvailableDisplayTitle(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(displayTitle, channel.getTypeFieldEntry(AbstractParent.class, "displayTitle", true).getDefaultTextString())) {
          return displayTitle;
      	}
      } else {
      	if (displayTitleML != null && Util.notEmpty(displayTitleML.get(lang))) {
      	  return displayTitleML.get(lang);
      	}
      }
      return Util.getString(theContent.getDisplayTitle(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return displayTitle;
    }
    return displayTitleML == null ? "" : Util.getString(displayTitleML.get(lang), "");
  }
  
   
  // ----------------------------------------------------------------------
  // skins
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry skinsTFE = channel.getTypeFieldEntry(AbstractParent.class, "skins", true);
  protected String[] skins = new String[0];
  protected int skinsAddCount = 0;
  public void setSkins(String[] v) {
    skins = getMonolingualValueArray(skinsTFE, v);
  }
  
  public String[] getAvailableSkins() {
    if (theContent != null && isFieldMissing("skins")) {
	  String[] objectValue = theContent.getSkins();
      if (objectValue == null) {
        return skins;
      }
      return objectValue;
    }
    return skins;
  }
  
    
  
  public void setSkinsAddCount(int  v) {
    skinsAddCount = v;
  }
  
  public int getSkinsCount() {
    int arraySize = Util.getSize(getAvailableSkins());
    int res = 3 + arraySize + skinsAddCount;
    return res;
  }
   
  // ----------------------------------------------------------------------
  // skinCSS
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry skinCSSTFE = channel.getTypeFieldEntry(AbstractParent.class, "skinCSS", true);
  protected String skinCSS = channel.getTypeFieldEntry(AbstractParent.class, "skinCSS", true).getDefaultTextString();
  public void setSkinCSS(String[] v) {
    skinCSS = getMonolingualValue(skinCSSTFE, v);
  }
  public String getAvailableSkinCSS() {
    if (theContent != null && isFieldMissing("skinCSS")) {
     String objectValue = theContent.getSkinCSS();
      return objectValue;
    }
    return skinCSS;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // popupState
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry popupStateTFE = channel.getTypeFieldEntry(AbstractParent.class, "popupState", true);
  protected String popupState = channel.getTypeFieldEntry(AbstractParent.class, "popupState", true).getDefaultTextString();
  public void setPopupState(String[] v) {
    popupState = getMonolingualValue(popupStateTFE, v);
  }
  public String getAvailablePopupState() {
    if (theContent != null && isFieldMissing("popupState")) {
     String objectValue = theContent.getPopupState();
      return objectValue;
    }
    return popupState;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // expandState
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry expandStateTFE = channel.getTypeFieldEntry(AbstractParent.class, "expandState", true);
  protected String expandState = channel.getTypeFieldEntry(AbstractParent.class, "expandState", true).getDefaultTextString();
  public void setExpandState(String[] v) {
    expandState = getMonolingualValue(expandStateTFE, v);
  }
  public String getAvailableExpandState() {
    if (theContent != null && isFieldMissing("expandState")) {
     String objectValue = theContent.getExpandState();
      return objectValue;
    }
    return expandState;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // behaviorCopy
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry behaviorCopyTFE = channel.getTypeFieldEntry(AbstractParent.class, "behaviorCopy", true);
  protected String behaviorCopy = channel.getTypeFieldEntry(AbstractParent.class, "behaviorCopy", true).getDefaultTextString();
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
  // originalPortlet
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry originalPortletTFE = channel.getTypeFieldEntry(AbstractParent.class, "originalPortlet", true);
  protected boolean isOriginalPortletValidated = true;
  protected com.jalios.jcms.portlet.PortalElement originalPortlet;
  String __originalPortletStr = null;
  public void setOriginalPortlet(String v) {
    __originalPortletStr = v;
  }
  public com.jalios.jcms.portlet.PortalElement getAvailableOriginalPortlet() {
    if (theContent != null && isFieldMissing("originalPortlet")) {
     com.jalios.jcms.portlet.PortalElement objectValue = theContent.getOriginalPortlet();
      return objectValue;
    }
    return originalPortlet;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // condition
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry conditionTFE = channel.getTypeFieldEntry(AbstractParent.class, "condition", true);
  protected String[] condition = new String[0];
  protected int conditionAddCount = 0;
  public void setCondition(String[] v) {
    condition = getMonolingualValueArray(conditionTFE, v);
  }
  
  public String[] getAvailableCondition() {
    if (theContent != null && isFieldMissing("condition")) {
	  String[] objectValue = theContent.getCondition();
      if (objectValue == null) {
        return condition;
      }
      return objectValue;
    }
    return condition;
  }
  
    
  
  public void setConditionAddCount(int  v) {
    conditionAddCount = v;
  }
  
  public int getConditionCount() {
    int arraySize = Util.getSize(getAvailableCondition());
    int res = 3 + arraySize + conditionAddCount;
    return res;
  }
   
  // ----------------------------------------------------------------------
  // cssId
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry cssIdTFE = channel.getTypeFieldEntry(AbstractParent.class, "cssId", true);
  protected String cssId = channel.getTypeFieldEntry(AbstractParent.class, "cssId", true).getDefaultTextString();
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
  protected TypeFieldEntry cssClassesTFE = channel.getTypeFieldEntry(AbstractParent.class, "cssClasses", true);
  protected String cssClasses = channel.getTypeFieldEntry(AbstractParent.class, "cssClasses", true).getDefaultTextString();
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
  // skinClasses
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry skinClassesTFE = channel.getTypeFieldEntry(AbstractParent.class, "skinClasses", true);
  protected String skinClasses = channel.getTypeFieldEntry(AbstractParent.class, "skinClasses", true).getDefaultTextString();
  public void setSkinClasses(String[] v) {
    skinClasses = getMonolingualValue(skinClassesTFE, v);
  }
  public String getAvailableSkinClasses() {
    if (theContent != null && isFieldMissing("skinClasses")) {
     String objectValue = theContent.getSkinClasses();
      return objectValue;
    }
    return skinClasses;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // skinFooter
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry skinFooterTFE = channel.getTypeFieldEntry(AbstractParent.class, "skinFooter", true);
  protected String skinFooter = channel.getTypeFieldEntry(AbstractParent.class, "skinFooter", true).getDefaultTextString();
  protected HashMap<String,String> skinFooterML = skinFooterTFE.getDefaultTextMap();
  public void setSkinFooter(String[] v) {
    skinFooter = getMultilingualMainValue(skinFooterTFE, v);
    skinFooterML = getMultilingualMLMap(skinFooterTFE, v);
  }
  public String getAvailableSkinFooter() {
    if (theContent != null && isFieldMissing("skinFooter")) {
     String objectValue = theContent.getSkinFooter();
      return objectValue;
    }
    return skinFooter;
  }
  
    
  public HashMap<String,String> getAllAvailableSkinFooterML() {
    HashMap<String,String> map = Util.getHashMap(getAvailableSkinFooterML());
    map.put(channel.getLanguage(),getAvailableSkinFooter(channel.getLanguage()));
    return map;
  }
  
  public HashMap<String,String> getAvailableSkinFooterML() {
    if (theContent != null && isFieldMissing("skinFooter")) {
      return theContent.getSkinFooterML();
    }
    return skinFooterML;
  }
  public String getAvailableSkinFooter(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(skinFooter, channel.getTypeFieldEntry(AbstractParent.class, "skinFooter", true).getDefaultTextString())) {
          return skinFooter;
      	}
      } else {
      	if (skinFooterML != null && Util.notEmpty(skinFooterML.get(lang))) {
      	  return skinFooterML.get(lang);
      	}
      }
      return Util.getString(theContent.getSkinFooter(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return skinFooter;
    }
    return skinFooterML == null ? "" : Util.getString(skinFooterML.get(lang), "");
  }
  
   
  // ----------------------------------------------------------------------
  // skinHeaderIcon
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry skinHeaderIconTFE = channel.getTypeFieldEntry(AbstractParent.class, "skinHeaderIcon", true);
  protected String skinHeaderIcon = channel.getTypeFieldEntry(AbstractParent.class, "skinHeaderIcon", true).getDefaultTextString();
  public void setSkinHeaderIcon(String[] v) {
    skinHeaderIcon = getMonolingualValue(skinHeaderIconTFE, v);
  }
  public String getAvailableSkinHeaderIcon() {
    if (theContent != null && isFieldMissing("skinHeaderIcon")) {
     String objectValue = theContent.getSkinHeaderIcon();
      return objectValue;
    }
    return skinHeaderIcon;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // skinHeaderIconColor
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry skinHeaderIconColorTFE = channel.getTypeFieldEntry(AbstractParent.class, "skinHeaderIconColor", true);
  protected String skinHeaderIconColor = channel.getTypeFieldEntry(AbstractParent.class, "skinHeaderIconColor", true).getDefaultTextString();
  public void setSkinHeaderIconColor(String[] v) {
    skinHeaderIconColor = getMonolingualValue(skinHeaderIconColorTFE, v);
  }
  public String getAvailableSkinHeaderIconColor() {
    if (theContent != null && isFieldMissing("skinHeaderIconColor")) {
     String objectValue = theContent.getSkinHeaderIconColor();
      return objectValue;
    }
    return skinHeaderIconColor;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // skinFooterButtonLabel
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry skinFooterButtonLabelTFE = channel.getTypeFieldEntry(AbstractParent.class, "skinFooterButtonLabel", true);
  protected String skinFooterButtonLabel = channel.getTypeFieldEntry(AbstractParent.class, "skinFooterButtonLabel", true).getDefaultTextString();
  protected HashMap<String,String> skinFooterButtonLabelML = skinFooterButtonLabelTFE.getDefaultTextMap();
  public void setSkinFooterButtonLabel(String[] v) {
    skinFooterButtonLabel = getMultilingualMainValue(skinFooterButtonLabelTFE, v);
    skinFooterButtonLabelML = getMultilingualMLMap(skinFooterButtonLabelTFE, v);
  }
  public String getAvailableSkinFooterButtonLabel() {
    if (theContent != null && isFieldMissing("skinFooterButtonLabel")) {
     String objectValue = theContent.getSkinFooterButtonLabel();
      return objectValue;
    }
    return skinFooterButtonLabel;
  }
  
    
  public HashMap<String,String> getAllAvailableSkinFooterButtonLabelML() {
    HashMap<String,String> map = Util.getHashMap(getAvailableSkinFooterButtonLabelML());
    map.put(channel.getLanguage(),getAvailableSkinFooterButtonLabel(channel.getLanguage()));
    return map;
  }
  
  public HashMap<String,String> getAvailableSkinFooterButtonLabelML() {
    if (theContent != null && isFieldMissing("skinFooterButtonLabel")) {
      return theContent.getSkinFooterButtonLabelML();
    }
    return skinFooterButtonLabelML;
  }
  public String getAvailableSkinFooterButtonLabel(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(skinFooterButtonLabel, channel.getTypeFieldEntry(AbstractParent.class, "skinFooterButtonLabel", true).getDefaultTextString())) {
          return skinFooterButtonLabel;
      	}
      } else {
      	if (skinFooterButtonLabelML != null && Util.notEmpty(skinFooterButtonLabelML.get(lang))) {
      	  return skinFooterButtonLabelML.get(lang);
      	}
      }
      return Util.getString(theContent.getSkinFooterButtonLabel(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return skinFooterButtonLabel;
    }
    return skinFooterButtonLabelML == null ? "" : Util.getString(skinFooterButtonLabelML.get(lang), "");
  }
  
   
  // ----------------------------------------------------------------------
  // skinFooterButtonLink
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry skinFooterButtonLinkTFE = channel.getTypeFieldEntry(AbstractParent.class, "skinFooterButtonLink", true);
  protected String skinFooterButtonLink = channel.getTypeFieldEntry(AbstractParent.class, "skinFooterButtonLink", true).getDefaultTextString();
  public void setSkinFooterButtonLink(String[] v) {
    skinFooterButtonLink = getMonolingualValue(skinFooterButtonLinkTFE, v);
  }
  public String getAvailableSkinFooterButtonLink() {
    if (theContent != null && isFieldMissing("skinFooterButtonLink")) {
     String objectValue = theContent.getSkinFooterButtonLink();
      return objectValue;
    }
    return skinFooterButtonLink;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // skinFooterButtonAlign
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry skinFooterButtonAlignTFE = channel.getTypeFieldEntry(AbstractParent.class, "skinFooterButtonAlign", true);
  protected String skinFooterButtonAlign = "centered";
  public void setSkinFooterButtonAlign(String[] v) {
    skinFooterButtonAlign = getMonolingualValue(skinFooterButtonAlignTFE, v);
  }
  public String getAvailableSkinFooterButtonAlign() {
    if (theContent != null && isFieldMissing("skinFooterButtonAlign")) {
     String objectValue = theContent.getSkinFooterButtonAlign();
      return objectValue;
    }
    return skinFooterButtonAlign;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // skinHeaderButtonLabel
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry skinHeaderButtonLabelTFE = channel.getTypeFieldEntry(AbstractParent.class, "skinHeaderButtonLabel", true);
  protected String skinHeaderButtonLabel = channel.getTypeFieldEntry(AbstractParent.class, "skinHeaderButtonLabel", true).getDefaultTextString();
  protected HashMap<String,String> skinHeaderButtonLabelML = skinHeaderButtonLabelTFE.getDefaultTextMap();
  public void setSkinHeaderButtonLabel(String[] v) {
    skinHeaderButtonLabel = getMultilingualMainValue(skinHeaderButtonLabelTFE, v);
    skinHeaderButtonLabelML = getMultilingualMLMap(skinHeaderButtonLabelTFE, v);
  }
  public String getAvailableSkinHeaderButtonLabel() {
    if (theContent != null && isFieldMissing("skinHeaderButtonLabel")) {
     String objectValue = theContent.getSkinHeaderButtonLabel();
      return objectValue;
    }
    return skinHeaderButtonLabel;
  }
  
    
  public HashMap<String,String> getAllAvailableSkinHeaderButtonLabelML() {
    HashMap<String,String> map = Util.getHashMap(getAvailableSkinHeaderButtonLabelML());
    map.put(channel.getLanguage(),getAvailableSkinHeaderButtonLabel(channel.getLanguage()));
    return map;
  }
  
  public HashMap<String,String> getAvailableSkinHeaderButtonLabelML() {
    if (theContent != null && isFieldMissing("skinHeaderButtonLabel")) {
      return theContent.getSkinHeaderButtonLabelML();
    }
    return skinHeaderButtonLabelML;
  }
  public String getAvailableSkinHeaderButtonLabel(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(skinHeaderButtonLabel, channel.getTypeFieldEntry(AbstractParent.class, "skinHeaderButtonLabel", true).getDefaultTextString())) {
          return skinHeaderButtonLabel;
      	}
      } else {
      	if (skinHeaderButtonLabelML != null && Util.notEmpty(skinHeaderButtonLabelML.get(lang))) {
      	  return skinHeaderButtonLabelML.get(lang);
      	}
      }
      return Util.getString(theContent.getSkinHeaderButtonLabel(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return skinHeaderButtonLabel;
    }
    return skinHeaderButtonLabelML == null ? "" : Util.getString(skinHeaderButtonLabelML.get(lang), "");
  }
  
   
  // ----------------------------------------------------------------------
  // skinHeaderButtonLink
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry skinHeaderButtonLinkTFE = channel.getTypeFieldEntry(AbstractParent.class, "skinHeaderButtonLink", true);
  protected String skinHeaderButtonLink = channel.getTypeFieldEntry(AbstractParent.class, "skinHeaderButtonLink", true).getDefaultTextString();
  public void setSkinHeaderButtonLink(String[] v) {
    skinHeaderButtonLink = getMonolingualValue(skinHeaderButtonLinkTFE, v);
  }
  public String getAvailableSkinHeaderButtonLink() {
    if (theContent != null && isFieldMissing("skinHeaderButtonLink")) {
     String objectValue = theContent.getSkinHeaderButtonLink();
      return objectValue;
    }
    return skinHeaderButtonLink;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // skinHeaderSubText
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry skinHeaderSubTextTFE = channel.getTypeFieldEntry(AbstractParent.class, "skinHeaderSubText", true);
  protected String skinHeaderSubText = channel.getTypeFieldEntry(AbstractParent.class, "skinHeaderSubText", true).getDefaultTextString();
  protected HashMap<String,String> skinHeaderSubTextML = skinHeaderSubTextTFE.getDefaultTextMap();
  public void setSkinHeaderSubText(String[] v) {
    skinHeaderSubText = getMultilingualMainValue(skinHeaderSubTextTFE, v);
    skinHeaderSubTextML = getMultilingualMLMap(skinHeaderSubTextTFE, v);
  }
  public String getAvailableSkinHeaderSubText() {
    if (theContent != null && isFieldMissing("skinHeaderSubText")) {
     String objectValue = theContent.getSkinHeaderSubText();
      return objectValue;
    }
    return skinHeaderSubText;
  }
  
    
  public HashMap<String,String> getAllAvailableSkinHeaderSubTextML() {
    HashMap<String,String> map = Util.getHashMap(getAvailableSkinHeaderSubTextML());
    map.put(channel.getLanguage(),getAvailableSkinHeaderSubText(channel.getLanguage()));
    return map;
  }
  
  public HashMap<String,String> getAvailableSkinHeaderSubTextML() {
    if (theContent != null && isFieldMissing("skinHeaderSubText")) {
      return theContent.getSkinHeaderSubTextML();
    }
    return skinHeaderSubTextML;
  }
  public String getAvailableSkinHeaderSubText(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(skinHeaderSubText, channel.getTypeFieldEntry(AbstractParent.class, "skinHeaderSubText", true).getDefaultTextString())) {
          return skinHeaderSubText;
      	}
      } else {
      	if (skinHeaderSubTextML != null && Util.notEmpty(skinHeaderSubTextML.get(lang))) {
      	  return skinHeaderSubTextML.get(lang);
      	}
      }
      return Util.getString(theContent.getSkinHeaderSubText(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return skinHeaderSubText;
    }
    return skinHeaderSubTextML == null ? "" : Util.getString(skinHeaderSubTextML.get(lang), "");
  }
  
 
   
 
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// svLz4YmC66PNIcgaWTC1SQ==
