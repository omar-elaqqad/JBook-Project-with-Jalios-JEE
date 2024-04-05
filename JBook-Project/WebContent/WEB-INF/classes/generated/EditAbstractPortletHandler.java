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
public class EditAbstractPortletHandler extends com.jalios.jcms.portlet.EditPortletHandler {
   
  protected AbstractPortlet theContent;
  
  public Class<? extends Publication> getPublicationClass() {
    return AbstractPortlet.class;
  }
  
  // ----------------------------------------------------------------------
  // validateBeforeOpAbstractPortlet  
  // ----------------------------------------------------------------------
  
  public boolean validateBeforeOp() {
    if (!super.validateBeforeOp()) {
      return false;
    }
    
    Member fdauthor = getLoggedMember();
    
           fdauthor = (fdauthor == null) ? getAvailableAuthor() : fdauthor;
    
    
    {
      Data data = processDataId("originalPortlet", __originalPortletStr, com.jalios.jcms.portlet.PortalElement.class);
      if (data != null) { 
        originalPortlet = (com.jalios.jcms.portlet.PortalElement)data;
      } else {
        isOriginalPortletValidated = Util.isEmpty(__originalPortletStr);
      }
    }
    if (!validateUploadedFileDocument(getAvailableOriginalPortlet(),   fdauthor, getAvailableWorkspace())) {
      return false;
    }
    if (!createUploadedFileDocument(getAvailableOriginalPortlet(),  fdauthor, getAvailableWorkspace())) {
      return false;
    }
    return true;
  }
  @Override
  public Object getAvailableField(String field) {
  
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
    
    return super.getAvailableField(field);
  }
  @Override
  public Object getEnumValues(String field) {
  
    if ("cacheType".equals(field)) {
      return AbstractPortlet.getCacheTypeValues();
    }
    if ("cacheSensibility".equals(field)) {
      return AbstractPortlet.getCacheSensibilityValues();
    }
    if ("invalidClass".equals(field)) {
      return AbstractPortlet.getInvalidClassValues();
    }
    if ("displayCSS".equals(field)) {
      return AbstractPortlet.getDisplayCSSValues();
    }
    if ("alignH".equals(field)) {
      return AbstractPortlet.getAlignHValues();
    }
    if ("alignV".equals(field)) {
      return AbstractPortlet.getAlignVValues();
    }
    if ("alignTable".equals(field)) {
      return AbstractPortlet.getAlignTableValues();
    }
    if ("behaviorCopy".equals(field)) {
      return AbstractPortlet.getBehaviorCopyValues();
    }
    if ("condition".equals(field)) {
      return AbstractPortlet.getConditionValues();
    }
    return super.getEnumValues(field);
  }
  @Override
  public Object getEnumLabels(String field, String userLang) {
  
    if ("cacheType".equals(field)) {
      return AbstractPortlet.getCacheTypeLabels(userLang);
    }
    if ("cacheSensibility".equals(field)) {
      return AbstractPortlet.getCacheSensibilityLabels(userLang);
    }
    if ("invalidClass".equals(field)) {
      return AbstractPortlet.getInvalidClassLabels(userLang);
    }
    if ("displayCSS".equals(field)) {
      return AbstractPortlet.getDisplayCSSLabels(userLang);
    }
    if ("alignH".equals(field)) {
      return AbstractPortlet.getAlignHLabels(userLang);
    }
    if ("alignV".equals(field)) {
      return AbstractPortlet.getAlignVLabels(userLang);
    }
    if ("alignTable".equals(field)) {
      return AbstractPortlet.getAlignTableLabels(userLang);
    }
    if ("behaviorCopy".equals(field)) {
      return AbstractPortlet.getBehaviorCopyLabels(userLang);
    }
    if ("condition".equals(field)) {
      return AbstractPortlet.getConditionLabels(userLang);
    }
    return super.getEnumLabels(field, userLang);
  }
  // ----------------------------------------------------------------------
  // validateCommonCreateUpdateAbstractPortlet  
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdateAbstractPortlet() {
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
    if (!validateCommonCreateUpdateAbstractPortlet()) {
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
    
    if (!validateCommonCreateUpdateAbstractPortlet()) {
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
    AbstractPortlet obj = (AbstractPortlet)data;
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
    obj.setBehaviorCopy(getAvailableBehaviorCopy());
    obj.setOriginalPortlet(getAvailableOriginalPortlet());
    obj.setCondition(getAvailableCondition());
    obj.setCssId(getAvailableCssId());
    obj.setCssClasses(getAvailableCssClasses());
  }
  
  public void setId(String  v) {
    if (channel.getData(v) instanceof AbstractPortlet) {
      super.setId(v);
      theContent = (AbstractPortlet)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }
  
   
  // ----------------------------------------------------------------------
  // description
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry descriptionTFE = channel.getTypeFieldEntry(AbstractPortlet.class, "description", true);
  protected String description = channel.getTypeFieldEntry(AbstractPortlet.class, "description", true).getDefaultTextString();
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
      	if (!Util.isSameContent(description, channel.getTypeFieldEntry(AbstractPortlet.class, "description", true).getDefaultTextString())) {
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
  protected TypeFieldEntry portletImageTFE = channel.getTypeFieldEntry(AbstractPortlet.class, "portletImage", true);
  protected String portletImage = channel.getTypeFieldEntry(AbstractPortlet.class, "portletImage", true).getDefaultTextString();
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
      	if (!Util.isSameContent(portletImage, channel.getTypeFieldEntry(AbstractPortlet.class, "portletImage", true).getDefaultTextString())) {
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
  protected TypeFieldEntry cacheTypeTFE = channel.getTypeFieldEntry(AbstractPortlet.class, "cacheType", true);
  protected String cacheType = channel.getTypeFieldEntry(AbstractPortlet.class, "cacheType", true).getDefaultTextString();
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
  protected TypeFieldEntry cacheSensibilityTFE = channel.getTypeFieldEntry(AbstractPortlet.class, "cacheSensibility", true);
  protected String cacheSensibility = channel.getTypeFieldEntry(AbstractPortlet.class, "cacheSensibility", true).getDefaultTextString();
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
  protected TypeFieldEntry invalidClassTFE = channel.getTypeFieldEntry(AbstractPortlet.class, "invalidClass", true);
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
  protected TypeFieldEntry invalidTimeTFE = channel.getTypeFieldEntry(AbstractPortlet.class, "invalidTime", true);
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
  protected TypeFieldEntry displayCSSTFE = channel.getTypeFieldEntry(AbstractPortlet.class, "displayCSS", true);
  protected String displayCSS = channel.getTypeFieldEntry(AbstractPortlet.class, "displayCSS", true).getDefaultTextString();
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
  protected TypeFieldEntry widthTFE = channel.getTypeFieldEntry(AbstractPortlet.class, "width", true);
  protected String width = channel.getTypeFieldEntry(AbstractPortlet.class, "width", true).getDefaultTextString();
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
  protected TypeFieldEntry insetLeftTFE = channel.getTypeFieldEntry(AbstractPortlet.class, "insetLeft", true);
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
  protected TypeFieldEntry insetRightTFE = channel.getTypeFieldEntry(AbstractPortlet.class, "insetRight", true);
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
  protected TypeFieldEntry insetTopTFE = channel.getTypeFieldEntry(AbstractPortlet.class, "insetTop", true);
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
  protected TypeFieldEntry insetBottomTFE = channel.getTypeFieldEntry(AbstractPortlet.class, "insetBottom", true);
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
  protected TypeFieldEntry cellPaddingTFE = channel.getTypeFieldEntry(AbstractPortlet.class, "cellPadding", true);
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
  protected TypeFieldEntry alignHTFE = channel.getTypeFieldEntry(AbstractPortlet.class, "alignH", true);
  protected String alignH = channel.getTypeFieldEntry(AbstractPortlet.class, "alignH", true).getDefaultTextString();
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
  protected TypeFieldEntry alignVTFE = channel.getTypeFieldEntry(AbstractPortlet.class, "alignV", true);
  protected String alignV = channel.getTypeFieldEntry(AbstractPortlet.class, "alignV", true).getDefaultTextString();
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
  protected TypeFieldEntry alignTableTFE = channel.getTypeFieldEntry(AbstractPortlet.class, "alignTable", true);
  protected String alignTable = channel.getTypeFieldEntry(AbstractPortlet.class, "alignTable", true).getDefaultTextString();
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
  protected TypeFieldEntry borderTFE = channel.getTypeFieldEntry(AbstractPortlet.class, "border", true);
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
  protected TypeFieldEntry borderColorTFE = channel.getTypeFieldEntry(AbstractPortlet.class, "borderColor", true);
  protected String borderColor = channel.getTypeFieldEntry(AbstractPortlet.class, "borderColor", true).getDefaultTextString();
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
  protected TypeFieldEntry backColorTFE = channel.getTypeFieldEntry(AbstractPortlet.class, "backColor", true);
  protected String backColor = channel.getTypeFieldEntry(AbstractPortlet.class, "backColor", true).getDefaultTextString();
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
  protected TypeFieldEntry backImageTFE = channel.getTypeFieldEntry(AbstractPortlet.class, "backImage", true);
  protected String backImage = channel.getTypeFieldEntry(AbstractPortlet.class, "backImage", true).getDefaultTextString();
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
  // behaviorCopy
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry behaviorCopyTFE = channel.getTypeFieldEntry(AbstractPortlet.class, "behaviorCopy", true);
  protected String behaviorCopy = channel.getTypeFieldEntry(AbstractPortlet.class, "behaviorCopy", true).getDefaultTextString();
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
  protected TypeFieldEntry originalPortletTFE = channel.getTypeFieldEntry(AbstractPortlet.class, "originalPortlet", true);
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
  protected TypeFieldEntry conditionTFE = channel.getTypeFieldEntry(AbstractPortlet.class, "condition", true);
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
  protected TypeFieldEntry cssIdTFE = channel.getTypeFieldEntry(AbstractPortlet.class, "cssId", true);
  protected String cssId = channel.getTypeFieldEntry(AbstractPortlet.class, "cssId", true).getDefaultTextString();
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
  protected TypeFieldEntry cssClassesTFE = channel.getTypeFieldEntry(AbstractPortlet.class, "cssClasses", true);
  protected String cssClasses = channel.getTypeFieldEntry(AbstractPortlet.class, "cssClasses", true).getDefaultTextString();
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
  
    
  
 
   
 
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// N5sIctkw5H5Oesz17dzQ/Q==
