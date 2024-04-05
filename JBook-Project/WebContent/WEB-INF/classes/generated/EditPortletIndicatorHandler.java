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
public class EditPortletIndicatorHandler extends EditAbstractPortletSkinableHandler {
   
  protected PortletIndicator theContent;
  
  public Class<? extends Publication> getPublicationClass() {
    return PortletIndicator.class;
  }
  
  // ----------------------------------------------------------------------
  // validateBeforeOpPortletIndicator  
  // ----------------------------------------------------------------------
  
  public boolean validateBeforeOp() {
    if (!super.validateBeforeOp()) {
      return false;
    }
    
    Member fdauthor = getLoggedMember();
    
           fdauthor = (fdauthor == null) ? getAvailableAuthor() : fdauthor;
    
    
    {
      Data data = processDataId("publicationLink", __publicationLinkStr, com.jalios.jcms.Content.class);
      if (data != null) { 
        publicationLink = (com.jalios.jcms.Content)data;
      } else {
        isPublicationLinkValidated = Util.isEmpty(__publicationLinkStr);
      }
    }
    if (!validateUploadedFileDocument(getAvailablePublicationLink(),   fdauthor, getAvailableWorkspace())) {
      return false;
    }
    if (!createUploadedFileDocument(getAvailablePublicationLink(),  fdauthor, getAvailableWorkspace())) {
      return false;
    }
    return true;
  }
  @Override
  public Object getAvailableField(String field) {
  
    if ("indicatorType".equals(field)) {
      return getAvailableIndicatorType();
    }
    
    if ("value".equals(field)) {
      return getAvailableValue();
    }
    
    if ("targetValue".equals(field)) {
      return getAvailableTargetValue();
    }
    
    if ("percentage".equals(field)) {
      return getAvailablePercentage();
    }
    
    if ("label".equals(field)) {
      return getAllAvailableLabelML();
    }
    
    if ("unit".equals(field)) {
      return getAvailableUnit();
    }
    
    if ("primaryColor".equals(field)) {
      return getAvailablePrimaryColor();
    }
    
    if ("secondaryColor".equals(field)) {
      return getAvailableSecondaryColor();
    }
    
    if ("animation".equals(field)) {
      return getAvailableAnimation();
    }
    
    if ("briefText".equals(field)) {
      return getAllAvailableBriefTextML();
    }
    
    if ("metric".equals(field)) {
      return getAvailableMetric();
    }
    
    if ("metricParameters".equals(field)) {
      return getAvailableMetricParameters();
    }
    
    if ("linkType".equals(field)) {
      return getAvailableLinkType();
    }
    
    if ("publicationLink".equals(field)) {
      return getAvailablePublicationLink();
    }
    
    if ("categorylink".equals(field)) {
      return getCategorylinkCatSet();
    }
    
    if ("linkLabel".equals(field)) {
      return getAllAvailableLinkLabelML();
    }
    
    if ("picture".equals(field)) {
      return getAvailablePicture();
    }
    
    return super.getAvailableField(field);
  }
  @Override
  public Object getEnumValues(String field) {
  
    if ("indicatorType".equals(field)) {
      return PortletIndicator.getIndicatorTypeValues();
    }
    if ("percentage".equals(field)) {
      return PortletIndicator.getPercentageValues();
    }
    if ("animation".equals(field)) {
      return PortletIndicator.getAnimationValues();
    }
    if ("linkType".equals(field)) {
      return PortletIndicator.getLinkTypeValues();
    }
    return super.getEnumValues(field);
  }
  @Override
  public Object getEnumLabels(String field, String userLang) {
  
    if ("indicatorType".equals(field)) {
      return PortletIndicator.getIndicatorTypeLabels(userLang);
    }
    if ("percentage".equals(field)) {
      return PortletIndicator.getPercentageLabels(userLang);
    }
    if ("animation".equals(field)) {
      return PortletIndicator.getAnimationLabels(userLang);
    }
    if ("linkType".equals(field)) {
      return PortletIndicator.getLinkTypeLabels(userLang);
    }
    return super.getEnumLabels(field, userLang);
  }
  // ----------------------------------------------------------------------
  // validateCommonCreateUpdatePortletIndicator  
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdatePortletIndicator() {
    if (!isValueValidated) {
      setWarningMsg(glp("msg.edit.bad-number-format", channel.getTypeFieldLabel(getPublicationClass(), "value", userLang)));
      return false;
    }
    if (!isTargetValueValidated) {
      setWarningMsg(glp("msg.edit.bad-number-format", channel.getTypeFieldLabel(getPublicationClass(), "targetValue", userLang)));
      return false;
    }
    if (!isPublicationLinkValidated) {
      setWarningMsg(glp("msg.edit.bad-link-id", channel.getTypeFieldLabel(getPublicationClass(), "publicationLink", userLang)));
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
    if (!validateCommonCreateUpdatePortletIndicator()) {
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
    
    if (!validateCommonCreateUpdatePortletIndicator()) {
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
    PortletIndicator obj = (PortletIndicator)data;
    obj.setIndicatorType(getAvailableIndicatorType());
    obj.setValue(getAvailableValue());
    obj.setTargetValue(getAvailableTargetValue());
    obj.setPercentage(getAvailablePercentage());
    obj.setLabel(getAvailableLabel());
    obj.setLabelML(getAvailableLabelML());
    obj.setUnit(getAvailableUnit());
    obj.setPrimaryColor(getAvailablePrimaryColor());
    obj.setSecondaryColor(getAvailableSecondaryColor());
    obj.setAnimation(getAvailableAnimation());
    obj.setBriefText(getAvailableBriefText());
    obj.setBriefTextML(getAvailableBriefTextML());
    obj.setMetric(getAvailableMetric());
    obj.setMetricParameters(getAvailableMetricParameters());
    obj.setLinkType(getAvailableLinkType());
    obj.setPublicationLink(getAvailablePublicationLink());
    obj.setLinkLabel(getAvailableLinkLabel());
    obj.setLinkLabelML(getAvailableLinkLabelML());
    obj.setPicture(getAvailablePicture());
  }
  
  public void setId(String  v) {
    if (channel.getData(v) instanceof PortletIndicator) {
      super.setId(v);
      theContent = (PortletIndicator)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }
  
   
  // ----------------------------------------------------------------------
  // indicatorType
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry indicatorTypeTFE = channel.getTypeFieldEntry(PortletIndicator.class, "indicatorType", true);
  protected String indicatorType = channel.getTypeFieldEntry(PortletIndicator.class, "indicatorType", true).getDefaultTextString();
  public void setIndicatorType(String[] v) {
    indicatorType = getMonolingualValue(indicatorTypeTFE, v);
  }
  public String getAvailableIndicatorType() {
    if (theContent != null && isFieldMissing("indicatorType")) {
     String objectValue = theContent.getIndicatorType();
      return objectValue;
    }
    return indicatorType;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // value
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry valueTFE = channel.getTypeFieldEntry(PortletIndicator.class, "value", true);
  protected boolean isValueValidated = true;
  protected double value = 0;
  public void setValue(String v) {
    Double dbl = Util.parseDouble(v);
    if (dbl != null) {
      value = dbl;
    } else {
      isValueValidated = false;
    }
  }
  public double getAvailableValue() {
    if (theContent != null && isFieldMissing("value")) {
     double objectValue = theContent.getValue();
      return objectValue;
    }
    return value;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // targetValue
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry targetValueTFE = channel.getTypeFieldEntry(PortletIndicator.class, "targetValue", true);
  protected boolean isTargetValueValidated = true;
  protected double targetValue = 0;
  public void setTargetValue(String v) {
    Double dbl = Util.parseDouble(v);
    if (dbl != null) {
      targetValue = dbl;
    } else {
      isTargetValueValidated = false;
    }
  }
  public double getAvailableTargetValue() {
    if (theContent != null && isFieldMissing("targetValue")) {
     double objectValue = theContent.getTargetValue();
      return objectValue;
    }
    return targetValue;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // percentage
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry percentageTFE = channel.getTypeFieldEntry(PortletIndicator.class, "percentage", true);
  protected boolean percentage = true;
  public void setPercentage(boolean  v) {
    this.percentage = v;
  }
  
  public boolean getAvailablePercentage() {
    if (theContent != null && isFieldMissing("percentage")) {
     boolean objectValue = theContent.getPercentage();
      return objectValue;
    }
    return percentage;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // label
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry labelTFE = channel.getTypeFieldEntry(PortletIndicator.class, "label", true);
  protected String label = channel.getTypeFieldEntry(PortletIndicator.class, "label", true).getDefaultTextString();
  protected HashMap<String,String> labelML = labelTFE.getDefaultTextMap();
  public void setLabel(String[] v) {
    label = getMultilingualMainValue(labelTFE, v);
    labelML = getMultilingualMLMap(labelTFE, v);
  }
  public String getAvailableLabel() {
    if (theContent != null && isFieldMissing("label")) {
     String objectValue = theContent.getLabel();
      return objectValue;
    }
    return label;
  }
  
    
  public HashMap<String,String> getAllAvailableLabelML() {
    HashMap<String,String> map = Util.getHashMap(getAvailableLabelML());
    map.put(channel.getLanguage(),getAvailableLabel(channel.getLanguage()));
    return map;
  }
  
  public HashMap<String,String> getAvailableLabelML() {
    if (theContent != null && isFieldMissing("label")) {
      return theContent.getLabelML();
    }
    return labelML;
  }
  public String getAvailableLabel(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(label, channel.getTypeFieldEntry(PortletIndicator.class, "label", true).getDefaultTextString())) {
          return label;
      	}
      } else {
      	if (labelML != null && Util.notEmpty(labelML.get(lang))) {
      	  return labelML.get(lang);
      	}
      }
      return Util.getString(theContent.getLabel(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return label;
    }
    return labelML == null ? "" : Util.getString(labelML.get(lang), "");
  }
  
   
  // ----------------------------------------------------------------------
  // unit
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry unitTFE = channel.getTypeFieldEntry(PortletIndicator.class, "unit", true);
  protected String unit = channel.getTypeFieldEntry(PortletIndicator.class, "unit", true).getDefaultTextString();
  public void setUnit(String[] v) {
    unit = getMonolingualValue(unitTFE, v);
  }
  public String getAvailableUnit() {
    if (theContent != null && isFieldMissing("unit")) {
     String objectValue = theContent.getUnit();
      return objectValue;
    }
    return unit;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // primaryColor
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry primaryColorTFE = channel.getTypeFieldEntry(PortletIndicator.class, "primaryColor", true);
  protected String primaryColor = channel.getTypeFieldEntry(PortletIndicator.class, "primaryColor", true).getDefaultTextString();
  public void setPrimaryColor(String[] v) {
    primaryColor = getMonolingualValue(primaryColorTFE, v);
  }
  public String getAvailablePrimaryColor() {
    if (theContent != null && isFieldMissing("primaryColor")) {
     String objectValue = theContent.getPrimaryColor();
      return objectValue;
    }
    return primaryColor;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // secondaryColor
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry secondaryColorTFE = channel.getTypeFieldEntry(PortletIndicator.class, "secondaryColor", true);
  protected String secondaryColor = channel.getTypeFieldEntry(PortletIndicator.class, "secondaryColor", true).getDefaultTextString();
  public void setSecondaryColor(String[] v) {
    secondaryColor = getMonolingualValue(secondaryColorTFE, v);
  }
  public String getAvailableSecondaryColor() {
    if (theContent != null && isFieldMissing("secondaryColor")) {
     String objectValue = theContent.getSecondaryColor();
      return objectValue;
    }
    return secondaryColor;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // animation
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry animationTFE = channel.getTypeFieldEntry(PortletIndicator.class, "animation", true);
  protected boolean animation = true;
  public void setAnimation(boolean  v) {
    this.animation = v;
  }
  
  public boolean getAvailableAnimation() {
    if (theContent != null && isFieldMissing("animation")) {
     boolean objectValue = theContent.getAnimation();
      return objectValue;
    }
    return animation;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // briefText
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry briefTextTFE = channel.getTypeFieldEntry(PortletIndicator.class, "briefText", true);
  protected String briefText = channel.getTypeFieldEntry(PortletIndicator.class, "briefText", true).getDefaultTextString();
  protected HashMap<String,String> briefTextML = briefTextTFE.getDefaultTextMap();
  public void setBriefText(String[] v) {
    briefText = getMultilingualMainValue(briefTextTFE, v);
    briefTextML = getMultilingualMLMap(briefTextTFE, v);
  }
  public String getAvailableBriefText() {
    if (theContent != null && isFieldMissing("briefText")) {
     String objectValue = theContent.getBriefText();
      return objectValue;
    }
    return briefText;
  }
  
    
  public HashMap<String,String> getAllAvailableBriefTextML() {
    HashMap<String,String> map = Util.getHashMap(getAvailableBriefTextML());
    map.put(channel.getLanguage(),getAvailableBriefText(channel.getLanguage()));
    return map;
  }
  
  public HashMap<String,String> getAvailableBriefTextML() {
    if (theContent != null && isFieldMissing("briefText")) {
      return theContent.getBriefTextML();
    }
    return briefTextML;
  }
  public String getAvailableBriefText(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(briefText, channel.getTypeFieldEntry(PortletIndicator.class, "briefText", true).getDefaultTextString())) {
          return briefText;
      	}
      } else {
      	if (briefTextML != null && Util.notEmpty(briefTextML.get(lang))) {
      	  return briefTextML.get(lang);
      	}
      }
      return Util.getString(theContent.getBriefText(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return briefText;
    }
    return briefTextML == null ? "" : Util.getString(briefTextML.get(lang), "");
  }
  
   
  // ----------------------------------------------------------------------
  // metric
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry metricTFE = channel.getTypeFieldEntry(PortletIndicator.class, "metric", true);
  protected String metric = channel.getTypeFieldEntry(PortletIndicator.class, "metric", true).getDefaultTextString();
  public void setMetric(String[] v) {
    metric = getMonolingualValue(metricTFE, v);
  }
  public String getAvailableMetric() {
    if (theContent != null && isFieldMissing("metric")) {
     String objectValue = theContent.getMetric();
      return objectValue;
    }
    return metric;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // metricParameters
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry metricParametersTFE = channel.getTypeFieldEntry(PortletIndicator.class, "metricParameters", true);
  protected String metricParameters = channel.getTypeFieldEntry(PortletIndicator.class, "metricParameters", true).getDefaultTextString();
  public void setMetricParameters(String[] v) {
    metricParameters = getMonolingualValue(metricParametersTFE, v);
  }
  public String getAvailableMetricParameters() {
    if (theContent != null && isFieldMissing("metricParameters")) {
     String objectValue = theContent.getMetricParameters();
      return objectValue;
    }
    return metricParameters;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // linkType
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry linkTypeTFE = channel.getTypeFieldEntry(PortletIndicator.class, "linkType", true);
  protected String linkType = channel.getTypeFieldEntry(PortletIndicator.class, "linkType", true).getDefaultTextString();
  public void setLinkType(String[] v) {
    linkType = getMonolingualValue(linkTypeTFE, v);
  }
  public String getAvailableLinkType() {
    if (theContent != null && isFieldMissing("linkType")) {
     String objectValue = theContent.getLinkType();
      return objectValue;
    }
    return linkType;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // publicationLink
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry publicationLinkTFE = channel.getTypeFieldEntry(PortletIndicator.class, "publicationLink", true);
  protected boolean isPublicationLinkValidated = true;
  protected com.jalios.jcms.Content publicationLink;
  String __publicationLinkStr = null;
  public void setPublicationLink(String v) {
    __publicationLinkStr = v;
  }
  public com.jalios.jcms.Content getAvailablePublicationLink() {
    if (theContent != null && isFieldMissing("publicationLink")) {
     com.jalios.jcms.Content objectValue = theContent.getPublicationLink();
      return objectValue;
    }
    return publicationLink;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // linkLabel
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry linkLabelTFE = channel.getTypeFieldEntry(PortletIndicator.class, "linkLabel", true);
  protected String linkLabel = channel.getTypeFieldEntry(PortletIndicator.class, "linkLabel", true).getDefaultTextString();
  protected HashMap<String,String> linkLabelML = linkLabelTFE.getDefaultTextMap();
  public void setLinkLabel(String[] v) {
    linkLabel = getMultilingualMainValue(linkLabelTFE, v);
    linkLabelML = getMultilingualMLMap(linkLabelTFE, v);
  }
  public String getAvailableLinkLabel() {
    if (theContent != null && isFieldMissing("linkLabel")) {
     String objectValue = theContent.getLinkLabel();
      return objectValue;
    }
    return linkLabel;
  }
  
    
  public HashMap<String,String> getAllAvailableLinkLabelML() {
    HashMap<String,String> map = Util.getHashMap(getAvailableLinkLabelML());
    map.put(channel.getLanguage(),getAvailableLinkLabel(channel.getLanguage()));
    return map;
  }
  
  public HashMap<String,String> getAvailableLinkLabelML() {
    if (theContent != null && isFieldMissing("linkLabel")) {
      return theContent.getLinkLabelML();
    }
    return linkLabelML;
  }
  public String getAvailableLinkLabel(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(linkLabel, channel.getTypeFieldEntry(PortletIndicator.class, "linkLabel", true).getDefaultTextString())) {
          return linkLabel;
      	}
      } else {
      	if (linkLabelML != null && Util.notEmpty(linkLabelML.get(lang))) {
      	  return linkLabelML.get(lang);
      	}
      }
      return Util.getString(theContent.getLinkLabel(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return linkLabel;
    }
    return linkLabelML == null ? "" : Util.getString(linkLabelML.get(lang), "");
  }
  
   
  // ----------------------------------------------------------------------
  // picture
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry pictureTFE = channel.getTypeFieldEntry(PortletIndicator.class, "picture", true);
  protected String picture = channel.getTypeFieldEntry(PortletIndicator.class, "picture", true).getDefaultTextString();
  public void setPicture(String[] v) {
    picture = getMonolingualValue(pictureTFE, v);
  }
  public String getAvailablePicture() {
    if (theContent != null && isFieldMissing("picture")) {
     String objectValue = theContent.getPicture();
      return objectValue;
    }
    return picture;
  }
  
    
  
  
  public void setCategorylink(String[] v) {
    updateCids(v);
  }
  public Category getCategorylinkRoot() {
    return channel.getCategory("j_5");
  }  
    
  public Set<Category> getCategorylinkCatSet() {
    Category rootCat = getCategorylinkRoot();
    if (rootCat == null) {
      return Util.emptyTreeSet();
    }
    Set<Category> set = new HashSet<>(rootCat.getDescendantSet());
    set.add(rootCat);
    return Util.interSet(getCategorySet(null), set);
  }
  
 
   
 
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// kRnuR49/oIZyl0/0muYLHQ==
