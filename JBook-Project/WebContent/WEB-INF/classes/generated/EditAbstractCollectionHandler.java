// This file has been automatically generated.
package generated;


import java.util.HashMap;
import java.util.List;

import com.jalios.jcms.Data;
import com.jalios.jcms.Member;
import com.jalios.jcms.Publication;
import com.jalios.jcms.TypeFieldEntry;
import com.jalios.util.Util;
@SuppressWarnings({"unchecked", "unused"})
public class EditAbstractCollectionHandler extends com.jalios.jcms.portlet.EditPortletCollectionHandler {

  protected AbstractCollection theContent;

  @Override
public Class<? extends Publication> getPublicationClass() {
    return AbstractCollection.class;
  }

  // ----------------------------------------------------------------------
  // validateBeforeOpAbstractCollection
  // ----------------------------------------------------------------------

  @Override
public boolean validateBeforeOp() {
    if (!super.validateBeforeOp()) {
      return false;
    }

    Member fdauthor = getLoggedMember();

           fdauthor = (fdauthor == null) ? getAvailableAuthor() : fdauthor;


    {
      List<com.jalios.jcms.portlet.PortalElement> list = processDataIds("children",__childrenStr,com.jalios.jcms.portlet.PortalElement.class);
      this.children = list.toArray(new com.jalios.jcms.portlet.PortalElement[0]);
    }
    {
      Data data = processDataId("originalPortlet", __originalPortletStr, com.jalios.jcms.portlet.PortalElement.class);
      if (data != null) {
        originalPortlet = (com.jalios.jcms.portlet.PortalElement)data;
      } else {
        isOriginalPortletValidated = Util.isEmpty(__originalPortletStr);
      }
    }
    if (!validateUploadedFileDocument(getAvailableChildren(),   fdauthor, getAvailableWorkspace()) || !validateUploadedFileDocument(getAvailableOriginalPortlet(),   fdauthor, getAvailableWorkspace()) || !createUploadedFileDocument(getAvailableChildren(),  fdauthor, getAvailableWorkspace()) || !createUploadedFileDocument(getAvailableOriginalPortlet(),  fdauthor, getAvailableWorkspace())) {
      return false;
    }
    return true;
  }
  @Override
  public Object getAvailableField(String field) {

    if ("children".equals(field)) {
      return getAvailableChildren();
    }

    if ("childrenBindings".equals(field)) {
      return getAvailableChildrenBindings();
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
      return AbstractCollection.getCacheTypeValues();
    }
    if ("cacheSensibility".equals(field)) {
      return AbstractCollection.getCacheSensibilityValues();
    }
    if ("invalidClass".equals(field)) {
      return AbstractCollection.getInvalidClassValues();
    }
    if ("displayCSS".equals(field)) {
      return AbstractCollection.getDisplayCSSValues();
    }
    if ("alignH".equals(field)) {
      return AbstractCollection.getAlignHValues();
    }
    if ("alignV".equals(field)) {
      return AbstractCollection.getAlignVValues();
    }
    if ("alignTable".equals(field)) {
      return AbstractCollection.getAlignTableValues();
    }
    if ("behaviorCopy".equals(field)) {
      return AbstractCollection.getBehaviorCopyValues();
    }
    if ("condition".equals(field)) {
      return AbstractCollection.getConditionValues();
    }
    return super.getEnumValues(field);
  }
  @Override
  public Object getEnumLabels(String field, String userLang) {

    if ("cacheType".equals(field)) {
      return AbstractCollection.getCacheTypeLabels(userLang);
    }
    if ("cacheSensibility".equals(field)) {
      return AbstractCollection.getCacheSensibilityLabels(userLang);
    }
    if ("invalidClass".equals(field)) {
      return AbstractCollection.getInvalidClassLabels(userLang);
    }
    if ("displayCSS".equals(field)) {
      return AbstractCollection.getDisplayCSSLabels(userLang);
    }
    if ("alignH".equals(field)) {
      return AbstractCollection.getAlignHLabels(userLang);
    }
    if ("alignV".equals(field)) {
      return AbstractCollection.getAlignVLabels(userLang);
    }
    if ("alignTable".equals(field)) {
      return AbstractCollection.getAlignTableLabels(userLang);
    }
    if ("behaviorCopy".equals(field)) {
      return AbstractCollection.getBehaviorCopyLabels(userLang);
    }
    if ("condition".equals(field)) {
      return AbstractCollection.getConditionLabels(userLang);
    }
    return super.getEnumLabels(field, userLang);
  }
  // ----------------------------------------------------------------------
  // validateCommonCreateUpdateAbstractCollection
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdateAbstractCollection() {
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
  @Override
public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate() || !validateCommonCreateUpdateAbstractCollection()) {
      return false;
    }
    return true;
  }

  // ----------------------------------------------------------------------
  // Update
  // ----------------------------------------------------------------------
  @Override
public boolean validateUpdate() throws java.io.IOException {
    if (!super.validateUpdate() || !validateCommonCreateUpdateAbstractCollection()) {
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
    AbstractCollection obj = (AbstractCollection)data;
    obj.setChildren(getAvailableChildren());
    obj.setChildrenBindings(getAvailableChildrenBindings());
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

  @Override
public void setId(String  v) {
    if (channel.getData(v) instanceof AbstractCollection) {
      super.setId(v);
      theContent = (AbstractCollection)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }


  // ----------------------------------------------------------------------
  // children
  // ----------------------------------------------------------------------
  protected TypeFieldEntry childrenTFE = channel.getTypeFieldEntry(AbstractCollection.class, "children", true);
  protected com.jalios.jcms.portlet.PortalElement[] children = new com.jalios.jcms.portlet.PortalElement[0];
  protected int childrenAddCount = 0;
  String[] __childrenStr = null;
  public void setChildren(String[]  v) {
    __childrenStr = v;
  }
  @Override
public com.jalios.jcms.portlet.PortalElement[] getAvailableChildren() {
    if (theContent != null && isFieldMissing("children")) {
	  com.jalios.jcms.portlet.PortalElement[] objectValue = theContent.getChildren();
      if (objectValue == null) {
        return children;
      }
      return objectValue;
    }
    return children;
  }



  public void setChildrenAddCount(int  v) {
    childrenAddCount = v;
  }

  @Override
public int getChildrenCount() {
    int arraySize = Util.getSize(getAvailableChildren());
    int res = 3 + arraySize + childrenAddCount;
    return res;
  }

  // ----------------------------------------------------------------------
  // childrenBindings
  // ----------------------------------------------------------------------
  protected TypeFieldEntry childrenBindingsTFE = channel.getTypeFieldEntry(AbstractCollection.class, "childrenBindings", true);
  protected String[] childrenBindings = new String[0];
  protected int childrenBindingsAddCount = 0;
  public void setChildrenBindings(String[] v) {
    childrenBindings = getMonolingualValueArray(childrenBindingsTFE, v);
  }

  @Override
public String[] getAvailableChildrenBindings() {
    if (theContent != null && isFieldMissing("childrenBindings")) {
	  String[] objectValue = theContent.getChildrenBindings();
      if (objectValue == null) {
        return childrenBindings;
      }
      return objectValue;
    }
    return childrenBindings;
  }



  public void setChildrenBindingsAddCount(int  v) {
    childrenBindingsAddCount = v;
  }

  @Override
public int getChildrenBindingsCount() {
    int arraySize = Util.getSize(getAvailableChildrenBindings());
    int res = 3 + arraySize + childrenBindingsAddCount;
    return res;
  }

  // ----------------------------------------------------------------------
  // description
  // ----------------------------------------------------------------------
  protected TypeFieldEntry descriptionTFE = channel.getTypeFieldEntry(AbstractCollection.class, "description", true);
  protected String description = channel.getTypeFieldEntry(AbstractCollection.class, "description", true).getDefaultTextString();
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
      	if (!Util.isSameContent(description, channel.getTypeFieldEntry(AbstractCollection.class, "description", true).getDefaultTextString())) {
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
  protected TypeFieldEntry portletImageTFE = channel.getTypeFieldEntry(AbstractCollection.class, "portletImage", true);
  protected String portletImage = channel.getTypeFieldEntry(AbstractCollection.class, "portletImage", true).getDefaultTextString();
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
      	if (!Util.isSameContent(portletImage, channel.getTypeFieldEntry(AbstractCollection.class, "portletImage", true).getDefaultTextString())) {
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
  protected TypeFieldEntry cacheTypeTFE = channel.getTypeFieldEntry(AbstractCollection.class, "cacheType", true);
  protected String cacheType = channel.getTypeFieldEntry(AbstractCollection.class, "cacheType", true).getDefaultTextString();
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
  protected TypeFieldEntry cacheSensibilityTFE = channel.getTypeFieldEntry(AbstractCollection.class, "cacheSensibility", true);
  protected String cacheSensibility = channel.getTypeFieldEntry(AbstractCollection.class, "cacheSensibility", true).getDefaultTextString();
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
  protected TypeFieldEntry invalidClassTFE = channel.getTypeFieldEntry(AbstractCollection.class, "invalidClass", true);
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
  protected TypeFieldEntry invalidTimeTFE = channel.getTypeFieldEntry(AbstractCollection.class, "invalidTime", true);
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
  // displayCSS
  // ----------------------------------------------------------------------
  protected TypeFieldEntry displayCSSTFE = channel.getTypeFieldEntry(AbstractCollection.class, "displayCSS", true);
  protected String displayCSS = channel.getTypeFieldEntry(AbstractCollection.class, "displayCSS", true).getDefaultTextString();
  public void setDisplayCSS(String[] v) {
    displayCSS = getMonolingualValue(displayCSSTFE, v);
  }
  @Override
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
  protected TypeFieldEntry widthTFE = channel.getTypeFieldEntry(AbstractCollection.class, "width", true);
  protected String width = channel.getTypeFieldEntry(AbstractCollection.class, "width", true).getDefaultTextString();
  public void setWidth(String[] v) {
    width = getMonolingualValue(widthTFE, v);
  }
  @Override
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
  protected TypeFieldEntry insetLeftTFE = channel.getTypeFieldEntry(AbstractCollection.class, "insetLeft", true);
  protected boolean isInsetLeftValidated = true;
  protected int insetLeft = 0;
  public void setInsetLeft(String v) {
    try {
      insetLeft = Integer.parseInt(v.trim());
    } catch(NumberFormatException ex) {
      isInsetLeftValidated = false;
    }
  }
  @Override
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
  protected TypeFieldEntry insetRightTFE = channel.getTypeFieldEntry(AbstractCollection.class, "insetRight", true);
  protected boolean isInsetRightValidated = true;
  protected int insetRight = 0;
  public void setInsetRight(String v) {
    try {
      insetRight = Integer.parseInt(v.trim());
    } catch(NumberFormatException ex) {
      isInsetRightValidated = false;
    }
  }
  @Override
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
  protected TypeFieldEntry insetTopTFE = channel.getTypeFieldEntry(AbstractCollection.class, "insetTop", true);
  protected boolean isInsetTopValidated = true;
  protected int insetTop = 0;
  public void setInsetTop(String v) {
    try {
      insetTop = Integer.parseInt(v.trim());
    } catch(NumberFormatException ex) {
      isInsetTopValidated = false;
    }
  }
  @Override
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
  protected TypeFieldEntry insetBottomTFE = channel.getTypeFieldEntry(AbstractCollection.class, "insetBottom", true);
  protected boolean isInsetBottomValidated = true;
  protected int insetBottom = 0;
  public void setInsetBottom(String v) {
    try {
      insetBottom = Integer.parseInt(v.trim());
    } catch(NumberFormatException ex) {
      isInsetBottomValidated = false;
    }
  }
  @Override
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
  protected TypeFieldEntry cellPaddingTFE = channel.getTypeFieldEntry(AbstractCollection.class, "cellPadding", true);
  protected boolean isCellPaddingValidated = true;
  protected int cellPadding = 0;
  public void setCellPadding(String v) {
    try {
      cellPadding = Integer.parseInt(v.trim());
    } catch(NumberFormatException ex) {
      isCellPaddingValidated = false;
    }
  }
  @Override
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
  protected TypeFieldEntry alignHTFE = channel.getTypeFieldEntry(AbstractCollection.class, "alignH", true);
  protected String alignH = channel.getTypeFieldEntry(AbstractCollection.class, "alignH", true).getDefaultTextString();
  public void setAlignH(String[] v) {
    alignH = getMonolingualValue(alignHTFE, v);
  }
  @Override
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
  protected TypeFieldEntry alignVTFE = channel.getTypeFieldEntry(AbstractCollection.class, "alignV", true);
  protected String alignV = channel.getTypeFieldEntry(AbstractCollection.class, "alignV", true).getDefaultTextString();
  public void setAlignV(String[] v) {
    alignV = getMonolingualValue(alignVTFE, v);
  }
  @Override
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
  protected TypeFieldEntry alignTableTFE = channel.getTypeFieldEntry(AbstractCollection.class, "alignTable", true);
  protected String alignTable = channel.getTypeFieldEntry(AbstractCollection.class, "alignTable", true).getDefaultTextString();
  public void setAlignTable(String[] v) {
    alignTable = getMonolingualValue(alignTableTFE, v);
  }
  @Override
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
  protected TypeFieldEntry borderTFE = channel.getTypeFieldEntry(AbstractCollection.class, "border", true);
  protected boolean isBorderValidated = true;
  protected int border = 0;
  public void setBorder(String v) {
    try {
      border = Integer.parseInt(v.trim());
    } catch(NumberFormatException ex) {
      isBorderValidated = false;
    }
  }
  @Override
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
  protected TypeFieldEntry borderColorTFE = channel.getTypeFieldEntry(AbstractCollection.class, "borderColor", true);
  protected String borderColor = channel.getTypeFieldEntry(AbstractCollection.class, "borderColor", true).getDefaultTextString();
  public void setBorderColor(String[] v) {
    borderColor = getMonolingualValue(borderColorTFE, v);
  }
  @Override
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
  protected TypeFieldEntry backColorTFE = channel.getTypeFieldEntry(AbstractCollection.class, "backColor", true);
  protected String backColor = channel.getTypeFieldEntry(AbstractCollection.class, "backColor", true).getDefaultTextString();
  public void setBackColor(String[] v) {
    backColor = getMonolingualValue(backColorTFE, v);
  }
  @Override
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
  protected TypeFieldEntry backImageTFE = channel.getTypeFieldEntry(AbstractCollection.class, "backImage", true);
  protected String backImage = channel.getTypeFieldEntry(AbstractCollection.class, "backImage", true).getDefaultTextString();
  public void setBackImage(String[] v) {
    backImage = getMonolingualValue(backImageTFE, v);
  }
  @Override
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
  protected TypeFieldEntry behaviorCopyTFE = channel.getTypeFieldEntry(AbstractCollection.class, "behaviorCopy", true);
  protected String behaviorCopy = channel.getTypeFieldEntry(AbstractCollection.class, "behaviorCopy", true).getDefaultTextString();
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
  // originalPortlet
  // ----------------------------------------------------------------------
  protected TypeFieldEntry originalPortletTFE = channel.getTypeFieldEntry(AbstractCollection.class, "originalPortlet", true);
  protected boolean isOriginalPortletValidated = true;
  protected com.jalios.jcms.portlet.PortalElement originalPortlet;
  String __originalPortletStr = null;
  public void setOriginalPortlet(String v) {
    __originalPortletStr = v;
  }
  @Override
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
  protected TypeFieldEntry conditionTFE = channel.getTypeFieldEntry(AbstractCollection.class, "condition", true);
  protected String[] condition = new String[0];
  protected int conditionAddCount = 0;
  public void setCondition(String[] v) {
    condition = getMonolingualValueArray(conditionTFE, v);
  }

  @Override
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
  protected TypeFieldEntry cssIdTFE = channel.getTypeFieldEntry(AbstractCollection.class, "cssId", true);
  protected String cssId = channel.getTypeFieldEntry(AbstractCollection.class, "cssId", true).getDefaultTextString();
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
  protected TypeFieldEntry cssClassesTFE = channel.getTypeFieldEntry(AbstractCollection.class, "cssClasses", true);
  protected String cssClasses = channel.getTypeFieldEntry(AbstractCollection.class, "cssClasses", true).getDefaultTextString();
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
// e8oZjpbl6zzYDup523vvUQ==
