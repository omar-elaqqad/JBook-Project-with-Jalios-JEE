// This file has been automatically generated.
   
package generated;
 
import java.util.*;
 
import org.apache.oro.text.regex.Pattern;
import org.apache.oro.text.regex.Perl5Compiler;
import org.apache.oro.text.regex.Perl5Matcher;
import org.hibernate.Hibernate;
 
import com.jalios.jcms.*;
import com.jalios.jcms.db.*;
import com.jalios.jcms.mashup.*;
import com.jalios.jcms.wysiwyg.*;
import com.jalios.util.*;
import com.fasterxml.jackson.annotation.JsonIgnore; 
import com.fasterxml.jackson.annotation.JsonProperty;
 
@SuppressWarnings({"unchecked", "unused"})
public  class PortletIndicator extends generated.AbstractPortletSkinable 
             implements 
                com.jalios.jstore.Searchable
{
  
  // ----------------------------------------------------------------------
  // CONSTRUCTORS
  // ----------------------------------------------------------------------  
  public PortletIndicator() {}
 
 
  public PortletIndicator(AbstractPortletSkinable other) {
    super(other);
  }
 
  
  
  
  public PortletIndicator(PortletIndicator other) {
    super(other);
    indicatorType = other.indicatorType;
    value = other.value;
    targetValue = other.targetValue;
    percentage = other.percentage;
    label = other.label;
    labelML = other.labelML;
    unit = other.unit;
    primaryColor = other.primaryColor;
    secondaryColor = other.secondaryColor;
    animation = other.animation;
    briefText = other.briefText;
    briefTextML = other.briefTextML;
    metric = other.metric;
    metricParameters = other.metricParameters;
    linkType = other.linkType;
    publicationLink = other.publicationLink;
    publicationLinkDBID = other.publicationLinkDBID;
    linkLabel = other.linkLabel;
    linkLabelML = other.linkLabelML;
    picture = other.picture;
  }
  
  // ----------------------------------------------------------------------
  // Import / Export
  // ----------------------------------------------------------------------
  public void importXml(org.jdom.Element elt, ImportOptions options) {
    super.importXml(elt, options);
    
    setIndicatorType(ImportUtil.parseFieldText(elt, "indicatorType"));
    setValue(ImportUtil.parseFieldDouble(elt, "value"));
    setTargetValue(ImportUtil.parseFieldDouble(elt, "targetValue"));
    setPercentage(ImportUtil.parseFieldBoolean(elt, "percentage"));
    setLabel(ImportUtil.parseFieldText(elt, "label"));
    setLabelML(ImportUtil.parseFieldTextML(elt, "labelML"));
    setUnit(ImportUtil.parseFieldText(elt, "unit"));
    setPrimaryColor(ImportUtil.parseFieldText(elt, "primaryColor"));
    setSecondaryColor(ImportUtil.parseFieldText(elt, "secondaryColor"));
    setAnimation(ImportUtil.parseFieldBoolean(elt, "animation"));
    setBriefText(ImportUtil.parseFieldText(elt, "briefText"));
    setBriefTextML(ImportUtil.parseFieldTextML(elt, "briefTextML"));
    setMetric(ImportUtil.parseFieldText(elt, "metric"));
    setMetricParameters(ImportUtil.parseFieldText(elt, "metricParameters"));
    setLinkType(ImportUtil.parseFieldText(elt, "linkType"));
    setLinkLabel(ImportUtil.parseFieldText(elt, "linkLabel"));
    setLinkLabelML(ImportUtil.parseFieldTextML(elt, "linkLabelML"));
    setPicture(ImportUtil.parseFieldText(elt, "picture"));
  }
  
  protected void importXmlFieldsWithReferences(org.jdom.Element elt, ImportOptions options) {
    super.importXmlFieldsWithReferences(elt, options);
      
    if (options.isSelfImport()) {
      setPublicationLink(ImportUtil.parseSelfFieldData(elt, "publicationLink", com.jalios.jcms.Content.class));
    } else {
    
    setPublicationLink((com.jalios.jcms.Content)ImportUtil.parseFieldData(elt, "publicationLink"));
    }
  }
  
  public void exportXmlField(StringBuffer sb, int indentLevel) {
    super.exportXmlField(sb, indentLevel);
    sb.append(ExportUtil.exportField(indentLevel, "indicatorType", getIndicatorType(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "value", getValue()));
    sb.append(ExportUtil.exportField(indentLevel, "targetValue", getTargetValue()));
    sb.append(ExportUtil.exportField(indentLevel, "percentage", getPercentage()));
    sb.append(ExportUtil.exportField(indentLevel, "label", getLabel(), "labelML", false, true));
    sb.append(ExportUtil.exportField(indentLevel, "labelML", getLabelML(), true));
    sb.append(ExportUtil.exportField(indentLevel, "unit", getUnit(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "primaryColor", getPrimaryColor(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "secondaryColor", getSecondaryColor(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "animation", getAnimation()));
    sb.append(ExportUtil.exportField(indentLevel, "briefText", getBriefText(), "briefTextML", false, true));
    sb.append(ExportUtil.exportField(indentLevel, "briefTextML", getBriefTextML(), true));
    sb.append(ExportUtil.exportField(indentLevel, "metric", getMetric(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "metricParameters", getMetricParameters(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "linkType", getLinkType(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "publicationLink", getPublicationLink()));
    sb.append(ExportUtil.exportField(indentLevel, "linkLabel", getLinkLabel(), "linkLabelML", false, true));
    sb.append(ExportUtil.exportField(indentLevel, "linkLabelML", getLinkLabelML(), true));
    sb.append(ExportUtil.exportField(indentLevel, "picture", getPicture(), false, true));
  }
  
  public Set<FileDocument> getDocumentLinkSet() {
    Set<FileDocument> docSet = super.getDocumentLinkSet();
    JcmsUtil.addFileDocument(docSet, picture);
    return docSet;
  }
  
  // ----------------------------------------------------------------------
  // TYPE AND FIELD INFOS (static methods)
  // ----------------------------------------------------------------------  
  /**
   * Returns the TypeEntry bound to <code>PortletIndicator</code>. <br>
   * @see com.jalios.jcms.Channel#getTypeEntry(Class)
   * @since jcms-5.5
   */
  public static TypeEntry getTypeEntry() {
    return channel.getTypeEntry(PortletIndicator.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>PortletIndicator</code>. <br>
   * This array <strong>does not</strong> contain inherited TypeFieldEntry from super classes of <code>PortletIndicator</code>. <br/>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>PortletIndicator</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getTypeFieldEntries() {
    return channel.getTypeFieldEntries(PortletIndicator.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>PortletIndicator</code>. <br>
   * This array <strong>does</strong> contain inherited TypeFieldEntry from super classes of <code>PortletIndicator</code>. <br>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>PortletIndicator</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getAllTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getAllTypeFieldEntries() {
    return channel.getAllTypeFieldEntries(PortletIndicator.class);
  }
  // ----------------------------------------------------------------------
  // FIELDs VALUE
  // ----------------------------------------------------------------------  
  /**
   * Gets the value of the given <code>int</code> field name for the current <code>PortletIndicator</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public int getIntFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getIntFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>int</code> field name for the current <code>PortletIndicator</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setIntFieldValue(String fieldName, int value) throws NoSuchFieldException {
    super.setIntFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>long</code> field name for the current <code>PortletIndicator</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public long getLongFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getLongFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>long</code> field name for the current <code>PortletIndicator</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setLongFieldValue(String fieldName, long value) throws NoSuchFieldException {
    super.setLongFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>double</code> field name for the current <code>PortletIndicator</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public double getDoubleFieldValue(String fieldName) throws NoSuchFieldException {
    if ("value".equals(fieldName)) { return getValue(); }
    if ("targetValue".equals(fieldName)) { return getTargetValue(); }
    return super.getDoubleFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>double</code> field name for the current <code>PortletIndicator</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setDoubleFieldValue(String fieldName, double value) throws NoSuchFieldException {
    if ("value".equals(fieldName)) { setValue(value); return; }
    if ("targetValue".equals(fieldName)) { setTargetValue(value); return; }
     super.setDoubleFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>boolean</code> field name for the current <code>PortletIndicator</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public boolean getBooleanFieldValue(String fieldName) throws NoSuchFieldException {
    if ("percentage".equals(fieldName)) { return getPercentage(); }
    if ("animation".equals(fieldName)) { return getAnimation(); }
    return super.getBooleanFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>boolean</code> field name for the current <code>PortletIndicator</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setBooleanFieldValue(String fieldName, boolean value) throws NoSuchFieldException {
    if ("percentage".equals(fieldName)) { setPercentage(value); return; }
    if ("animation".equals(fieldName)) { setAnimation(value); return; }
    super.setBooleanFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>Category</code> field name for the current <code>Data</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param mbr the member used to check rigth access to categories.
   * @return a <code>TreeSet</code> of <code>Category</code>
   * @throws NoSuchFieldException if the field was not found in the given <code>Data</code>.
   */
  public TreeSet<Category> getCategoryFieldValue(String fieldName, Member mbr) throws NoSuchFieldException {
    if ("categorylink".equals(fieldName)) { return getCategorylink(mbr); }
    return super.getCategoryFieldValue(fieldName, mbr);
  }
  /**
   * Gets the <code>Object</code> value of the given field name for this <code>PortletIndicator</code>. <br>
   * Do not retrieve <code>Category</code> fields, see {@link #getCategoryFieldValue(String, Member)}.
   * @param fieldName the field name from which to retrieve the field value.
   * @param lang the language (ISO-639 code) in which to retrieve the field value
   *        (used only for multilingual fields).
   * @param useDefault whether to use the publication main language if the field value 
   *        is not available in the requested language (used only for multilingual fields).
   * @return the <code>Object</code> field value
   * @throws NoSuchFieldException if the field was not found in the given <code>Publication</code>.
   */
  public Object getFieldValue(String fieldName, String lang, boolean useDefault) throws NoSuchFieldException {
    if ("indicatorType".equals(fieldName)) { return getIndicatorType(); }
    if ("label".equals(fieldName)) { return getLabel(lang, useDefault); }
    if ("unit".equals(fieldName)) { return getUnit(); }
    if ("primaryColor".equals(fieldName)) { return getPrimaryColor(); }
    if ("secondaryColor".equals(fieldName)) { return getSecondaryColor(); }
    if ("briefText".equals(fieldName)) { return getBriefText(lang, useDefault); }
    if ("metric".equals(fieldName)) { return getMetric(); }
    if ("metricParameters".equals(fieldName)) { return getMetricParameters(); }
    if ("linkType".equals(fieldName)) { return getLinkType(); }
    if ("publicationLink".equals(fieldName)) { return getPublicationLink(); }
    if ("linkLabel".equals(fieldName)) { return getLinkLabel(lang, useDefault); }
    if ("picture".equals(fieldName)) { return getPicture(); }
    return super.getFieldValue(fieldName, lang, useDefault);
  }
  
  /**
   * Sets the <code>Object</code> value of the given field name for this <code>PortletIndicator</code>. <br>
   * Do not set <code>Category</code> fields, see {@link #setCategoryFieldValue(String, TreeSet)}.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>Object</code> field value
   * @param lang the language (ISO-639 code) in which to retrieve the field value
   *        (used only for multilingual fields).
   * 
   * @throws NoSuchFieldException if the field was not found in the given <code>Publication</code>.
   * @since jcms-6.3.0 
   */
  public void setFieldValue(String fieldName, Object value, String lang) throws NoSuchFieldException {
    if ("indicatorType".equals(fieldName)) { setIndicatorType((String)value); return; }
    if ("label".equals(fieldName)) { setLabel(lang,(String)value); return; }
    if ("unit".equals(fieldName)) { setUnit((String)value); return; }
    if ("primaryColor".equals(fieldName)) { setPrimaryColor((String)value); return; }
    if ("secondaryColor".equals(fieldName)) { setSecondaryColor((String)value); return; }
    if ("briefText".equals(fieldName)) { setBriefText(lang,(String)value); return; }
    if ("metric".equals(fieldName)) { setMetric((String)value); return; }
    if ("metricParameters".equals(fieldName)) { setMetricParameters((String)value); return; }
    if ("linkType".equals(fieldName)) { setLinkType((String)value); return; }
    if ("publicationLink".equals(fieldName)) { setPublicationLink((com.jalios.jcms.Content)value); return; }
    if ("linkLabel".equals(fieldName)) { setLinkLabel(lang,(String)value); return; }
    if ("picture".equals(fieldName)) { setPicture((String)value); return; }
    super.setFieldValue(fieldName, value, lang);
  }
  
  // ----------------------------------------------------------------------
  // indicatorType
  // ----------------------------------------------------------------------  
  
  protected  String indicatorType = channel.getTypeFieldEntry(PortletIndicator.class, "indicatorType", true).getDefaultTextString();
  
  public String getIndicatorType() { return indicatorType; }
  
  public void setIndicatorType(String v) { indicatorType = v; }
  
  
  
  public String getIndicatorType(String lang) { return indicatorType; }
  public String getIndicatorType(String lang, boolean useDefault) { return indicatorType; }
  private static String[] indicatorTypeValues;  
  private static String[] indicatorTypeLabels;
  private static Map<String, String[]> indicatorTypeLabelsMap;
  
  public static String[] getIndicatorTypeValues() {
    if(indicatorTypeValues == null) {
      setIndicatorTypeValues(channel.getTypeFieldEntry(PortletIndicator.class, "indicatorType", true).getEnumerateValues());
    }
    return indicatorTypeValues;
  }
  public static void setIndicatorTypeValues(String[] values) {
    indicatorTypeValues = values;
  }
  public static String[] getIndicatorTypeLabels() {
    if(indicatorTypeLabels == null) {
      setIndicatorTypeLabels(channel.getTypeFieldEntry(PortletIndicator.class, "indicatorType", true).getEnumerateLabels());
    }
    return indicatorTypeLabels;
  }
  public static void setIndicatorTypeLabels(String[] labels) {
    indicatorTypeLabels = labels;
  }
  public static Map<String, String[]> getIndicatorTypeLabelsMap() {
    if(indicatorTypeLabelsMap == null) {
      setIndicatorTypeLabelsMap(channel.getTypeFieldEntry(PortletIndicator.class, "indicatorType", true).getEnumerateLabelsMap());
    }
    return indicatorTypeLabelsMap;
  }
  public static void setIndicatorTypeLabelsMap(Map<String, String[]> LabelsMap) {
    indicatorTypeLabelsMap = LabelsMap;
  }
  public static String[] getIndicatorTypeLabels(String userLang) {
    Map<String, String[]> indicatorTypeLabelMap = getIndicatorTypeLabelsMap();
    String[] labels = (String[])indicatorTypeLabelMap.get(userLang);
    if (labels == null) {
      labels = (String[])indicatorTypeLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getIndicatorTypeLabel(String value, String userLang) {
    String[] labels = getIndicatorTypeLabels(userLang);
    int i = 0;
    if (false) {
    }
    else if (value.equals("MANUAL")) {
      i = 0;
    }
    else if (value.equals("METRIC")) {
      i = 1;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return getIndicatorTypeLabel(value, channel.getLanguage());
  }
  
  public static String getIndicatorTypeLabel(String value) {    
    String[] indicatorTypeLabels = getIndicatorTypeLabels();
    if (false) {
    }
    else if (value.equals("MANUAL")) {
      return indicatorTypeLabels[0];
    }
    else if (value.equals("METRIC")) {
      return indicatorTypeLabels[1];
    }
    return "???";
  }
  public static EnumerateFormReport getIndicatorTypeReport(SortedSet<PortletIndicator> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (PortletIndicator obj : set) {
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getIndicatorType());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // value
  // ----------------------------------------------------------------------  
  
  protected  double value = 0;
  
  public double getValue() { return value; }
  
  public void setValue(double v) { value = v; }
  
  
  
  // ----------------------------------------------------------------------
  // targetValue
  // ----------------------------------------------------------------------  
  
  protected  double targetValue = 0;
  
  public double getTargetValue() { return targetValue; }
  
  public void setTargetValue(double v) { targetValue = v; }
  
  
  
  // ----------------------------------------------------------------------
  // percentage
  // ----------------------------------------------------------------------  
  
  protected  boolean percentage = true;
  
  public boolean getPercentage() { return percentage; }
  
  public void setPercentage(boolean v) { percentage = v; }
  
  
  
  public String getPercentageLabel(String lang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(this.getClass(), "percentage", true);
    return percentage ? tfe.getOnLabel(lang) : tfe.getOffLabel(lang); 
  }
  public static String[] getPercentageValues() {
    return new String[]{ "true" , "false" };
  }
  
  public static String[] getPercentageLabels(String userLang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(PortletIndicator.class, "percentage", true);
    String onLabel = (String) tfe.getOnLabel(userLang);
    String offLabel = (String) tfe.getOffLabel(userLang);
    
    return new String[]{ onLabel, offLabel };
  }
  public static EnumerateFormReport getPercentageReport(SortedSet<PortletIndicator> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (PortletIndicator obj : set) {
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getPercentage());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // label
  // ----------------------------------------------------------------------  
  
  protected  String label = channel.getTypeFieldEntry(PortletIndicator.class, "label", true).getDefaultTextString();
  
  public String getLabel() { return label; }
  
  public void setLabel(String v) { label = v; }
  
  
  
  
  protected HashMap<String,String> labelML = channel.getTypeFieldEntry(PortletIndicator.class, "label", true).getDefaultTextMap();
  public String getLabel(String lang) { return (String)channel.getLangValue(lang, true, label, labelML, getMainLanguage()); }
  public String getLabel(String lang, boolean useDefault) { return (String)channel.getLangValue(lang, useDefault, label, labelML, getMainLanguage()); }
  public HashMap<String,String> getLabelML() { return labelML; }
  public void setLabelML(HashMap<String,String> v) { labelML = v; }
  
  public String getLabelMLE() { 
    return JcmsUtil.encodeMLE(getLabelML());
  }
  
  public void setLabelMLE(String v) {
    setLabelML(JcmsUtil.decodeMLE(v));
  }
  
  public void setLabel(String lang, String value) {
    if (channel.getLanguage().equals(lang)) {
      label = value;
      return;
    }
    if (labelML == null) {
      labelML = new HashMap<>();
    } else if (this != channel.getData(id)) {
      labelML = new HashMap<>(labelML);
    }
    labelML.put(lang, value);
  }
  // ----------------------------------------------------------------------
  // unit
  // ----------------------------------------------------------------------  
  
  protected  String unit = channel.getTypeFieldEntry(PortletIndicator.class, "unit", true).getDefaultTextString();
  
  public String getUnit() { return unit; }
  
  public void setUnit(String v) { unit = v; }
  
  
  
  public String getUnit(String lang) { return unit; }
  public String getUnit(String lang, boolean useDefault) { return unit; }
  // ----------------------------------------------------------------------
  // primaryColor
  // ----------------------------------------------------------------------  
  
  protected  String primaryColor = channel.getTypeFieldEntry(PortletIndicator.class, "primaryColor", true).getDefaultTextString();
  
  public String getPrimaryColor() { return primaryColor; }
  
  public void setPrimaryColor(String v) { primaryColor = v; }
  
  
  
  public String getPrimaryColor(String lang) { return primaryColor; }
  public String getPrimaryColor(String lang, boolean useDefault) { return primaryColor; }
  // ----------------------------------------------------------------------
  // secondaryColor
  // ----------------------------------------------------------------------  
  
  protected  String secondaryColor = channel.getTypeFieldEntry(PortletIndicator.class, "secondaryColor", true).getDefaultTextString();
  
  public String getSecondaryColor() { return secondaryColor; }
  
  public void setSecondaryColor(String v) { secondaryColor = v; }
  
  
  
  public String getSecondaryColor(String lang) { return secondaryColor; }
  public String getSecondaryColor(String lang, boolean useDefault) { return secondaryColor; }
  // ----------------------------------------------------------------------
  // animation
  // ----------------------------------------------------------------------  
  
  protected  boolean animation = true;
  
  public boolean getAnimation() { return animation; }
  
  public void setAnimation(boolean v) { animation = v; }
  
  
  
  public String getAnimationLabel(String lang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(this.getClass(), "animation", true);
    return animation ? tfe.getOnLabel(lang) : tfe.getOffLabel(lang); 
  }
  public static String[] getAnimationValues() {
    return new String[]{ "true" , "false" };
  }
  
  public static String[] getAnimationLabels(String userLang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(PortletIndicator.class, "animation", true);
    String onLabel = (String) tfe.getOnLabel(userLang);
    String offLabel = (String) tfe.getOffLabel(userLang);
    
    return new String[]{ onLabel, offLabel };
  }
  public static EnumerateFormReport getAnimationReport(SortedSet<PortletIndicator> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (PortletIndicator obj : set) {
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getAnimation());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // briefText
  // ----------------------------------------------------------------------  
  
  protected  String briefText = channel.getTypeFieldEntry(PortletIndicator.class, "briefText", true).getDefaultTextString();
  
  public String getBriefText() { return briefText; }
  
  public void setBriefText(String v) { briefText = v; }
  
  
  
  
  protected HashMap<String,String> briefTextML = channel.getTypeFieldEntry(PortletIndicator.class, "briefText", true).getDefaultTextMap();
  public String getBriefText(String lang) { return (String)channel.getLangValue(lang, true, briefText, briefTextML, getMainLanguage()); }
  public String getBriefText(String lang, boolean useDefault) { return (String)channel.getLangValue(lang, useDefault, briefText, briefTextML, getMainLanguage()); }
  public HashMap<String,String> getBriefTextML() { return briefTextML; }
  public void setBriefTextML(HashMap<String,String> v) { briefTextML = v; }
  
  public String getBriefTextMLE() { 
    return JcmsUtil.encodeMLE(getBriefTextML());
  }
  
  public void setBriefTextMLE(String v) {
    setBriefTextML(JcmsUtil.decodeMLE(v));
  }
  
  public void setBriefText(String lang, String value) {
    if (channel.getLanguage().equals(lang)) {
      briefText = value;
      return;
    }
    if (briefTextML == null) {
      briefTextML = new HashMap<>();
    } else if (this != channel.getData(id)) {
      briefTextML = new HashMap<>(briefTextML);
    }
    briefTextML.put(lang, value);
  }
  // ----------------------------------------------------------------------
  // metric
  // ----------------------------------------------------------------------  
  
  protected  String metric = channel.getTypeFieldEntry(PortletIndicator.class, "metric", true).getDefaultTextString();
  
  public String getMetric() { return metric; }
  
  public void setMetric(String v) { metric = v; }
  
  
  
  public String getMetric(String lang) { return metric; }
  public String getMetric(String lang, boolean useDefault) { return metric; }
  // ----------------------------------------------------------------------
  // metricParameters
  // ----------------------------------------------------------------------  
  
  protected  String metricParameters = channel.getTypeFieldEntry(PortletIndicator.class, "metricParameters", true).getDefaultTextString();
  
  public String getMetricParameters() { return metricParameters; }
  
  public void setMetricParameters(String v) { metricParameters = v; }
  
  
  
  public String getMetricParameters(String lang) { return metricParameters; }
  public String getMetricParameters(String lang, boolean useDefault) { return metricParameters; }
  // ----------------------------------------------------------------------
  // linkType
  // ----------------------------------------------------------------------  
  
  protected  String linkType = channel.getTypeFieldEntry(PortletIndicator.class, "linkType", true).getDefaultTextString();
  
  public String getLinkType() { return linkType; }
  
  public void setLinkType(String v) { linkType = v; }
  
  
  
  public String getLinkType(String lang) { return linkType; }
  public String getLinkType(String lang, boolean useDefault) { return linkType; }
  private static String[] linkTypeValues;  
  private static String[] linkTypeLabels;
  private static Map<String, String[]> linkTypeLabelsMap;
  
  public static String[] getLinkTypeValues() {
    if(linkTypeValues == null) {
      setLinkTypeValues(channel.getTypeFieldEntry(PortletIndicator.class, "linkType", true).getEnumerateValues());
    }
    return linkTypeValues;
  }
  public static void setLinkTypeValues(String[] values) {
    linkTypeValues = values;
  }
  public static String[] getLinkTypeLabels() {
    if(linkTypeLabels == null) {
      setLinkTypeLabels(channel.getTypeFieldEntry(PortletIndicator.class, "linkType", true).getEnumerateLabels());
    }
    return linkTypeLabels;
  }
  public static void setLinkTypeLabels(String[] labels) {
    linkTypeLabels = labels;
  }
  public static Map<String, String[]> getLinkTypeLabelsMap() {
    if(linkTypeLabelsMap == null) {
      setLinkTypeLabelsMap(channel.getTypeFieldEntry(PortletIndicator.class, "linkType", true).getEnumerateLabelsMap());
    }
    return linkTypeLabelsMap;
  }
  public static void setLinkTypeLabelsMap(Map<String, String[]> LabelsMap) {
    linkTypeLabelsMap = LabelsMap;
  }
  public static String[] getLinkTypeLabels(String userLang) {
    Map<String, String[]> linkTypeLabelMap = getLinkTypeLabelsMap();
    String[] labels = (String[])linkTypeLabelMap.get(userLang);
    if (labels == null) {
      labels = (String[])linkTypeLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getLinkTypeLabel(String value, String userLang) {
    String[] labels = getLinkTypeLabels(userLang);
    int i = 0;
    if (false) {
    }
    else if (value.equals("none")) {
      i = 0;
    }
    else if (value.equals("category")) {
      i = 1;
    }
    else if (value.equals("content")) {
      i = 2;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return getLinkTypeLabel(value, channel.getLanguage());
  }
  
  public static String getLinkTypeLabel(String value) {    
    String[] linkTypeLabels = getLinkTypeLabels();
    if (false) {
    }
    else if (value.equals("none")) {
      return linkTypeLabels[0];
    }
    else if (value.equals("category")) {
      return linkTypeLabels[1];
    }
    else if (value.equals("content")) {
      return linkTypeLabels[2];
    }
    return "???";
  }
  public static EnumerateFormReport getLinkTypeReport(SortedSet<PortletIndicator> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (PortletIndicator obj : set) {
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getLinkType());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // publicationLink
  // ----------------------------------------------------------------------  
  
  protected  com.jalios.jcms.Content publicationLink;
  
  public com.jalios.jcms.Content getPublicationLink() { 
    return getPublicationLink(true);
  }
  public com.jalios.jcms.Content getPublicationLink(boolean queryDB) { 
   if (publicationLink != null) {
      return publicationLink;
    }
    if (queryDB && Util.notEmpty(publicationLinkDBID)) {
      return channel.getData(com.jalios.jcms.Content.class, publicationLinkDBID);
    }
    return null;
  }
  protected String publicationLinkDBID;
  public String getPublicationLinkDBID() { return publicationLinkDBID; }
  public void setPublicationLink(com.jalios.jcms.Content v) {
    if (v == null) {
      publicationLink = null;
      publicationLinkDBID =null;
      return;
    }  
  
    if (v instanceof DBData) {
      setPublicationLinkDBID(v.getId());
    } else {
      publicationLink = v;
    }
  }
  public void setPublicationLinkDBID(String v) { 
    publicationLinkDBID = v;
    if (Util.notEmpty(publicationLinkDBID)) { 
      publicationLink = null;
    };    
  }  
  
  
  // ----------------------------------------------------------------------
  // linkLabel
  // ----------------------------------------------------------------------  
  
  protected  String linkLabel = channel.getTypeFieldEntry(PortletIndicator.class, "linkLabel", true).getDefaultTextString();
  
  public String getLinkLabel() { return linkLabel; }
  
  public void setLinkLabel(String v) { linkLabel = v; }
  
  
  
  
  protected HashMap<String,String> linkLabelML = channel.getTypeFieldEntry(PortletIndicator.class, "linkLabel", true).getDefaultTextMap();
  public String getLinkLabel(String lang) { return (String)channel.getLangValue(lang, true, linkLabel, linkLabelML, getMainLanguage()); }
  public String getLinkLabel(String lang, boolean useDefault) { return (String)channel.getLangValue(lang, useDefault, linkLabel, linkLabelML, getMainLanguage()); }
  public HashMap<String,String> getLinkLabelML() { return linkLabelML; }
  public void setLinkLabelML(HashMap<String,String> v) { linkLabelML = v; }
  
  public String getLinkLabelMLE() { 
    return JcmsUtil.encodeMLE(getLinkLabelML());
  }
  
  public void setLinkLabelMLE(String v) {
    setLinkLabelML(JcmsUtil.decodeMLE(v));
  }
  
  public void setLinkLabel(String lang, String value) {
    if (channel.getLanguage().equals(lang)) {
      linkLabel = value;
      return;
    }
    if (linkLabelML == null) {
      linkLabelML = new HashMap<>();
    } else if (this != channel.getData(id)) {
      linkLabelML = new HashMap<>(linkLabelML);
    }
    linkLabelML.put(lang, value);
  }
  // ----------------------------------------------------------------------
  // picture
  // ----------------------------------------------------------------------  
  
  protected  String picture = channel.getTypeFieldEntry(PortletIndicator.class, "picture", true).getDefaultTextString();
  
  public String getPicture() { return picture; }
  
  public void setPicture(String v) { picture = v; }
  
  
  
  public String getPicture(String lang) { return picture; }
  public String getPicture(String lang, boolean useDefault) { return picture; }
   
  // ----------------------------------------------------------------------
  // abstract
  // ----------------------------------------------------------------------  
  @Override
  public void setAbstract(String lang, String value) { setDescription(lang, value); }
  @Override
  public String getAbstract() { return description; }
  @Override
  public String getAbstract(String lang, boolean useDefault) { return getDescription(lang, useDefault); }
  @Override
  public HashMap<String,String> getAbstractML() { return getDescriptionML(); }
   
  // ----------------------------------------------------------------------
  // Data image
  // ----------------------------------------------------------------------  
  @Override
  public String getDataImage() {
    String _img = portletImage;
    if (Util.notEmpty(_img)) {
      return _img;
    }
  
    return super.getDataImage();
  }
  
  @Override
  public String getDataImage(String lang, boolean useDefault) {
    String _img = getPortletImage(lang, useDefault);
    if (Util.notEmpty(_img)) {
      return _img;
    }  
  
    return super.getDataImage(lang, useDefault);
  }
  
  @Override
  public String[] getSearchStrings() {
    StringBuffer sb = new StringBuffer(super.getSearchStrings()[0]);
    sb.ensureCapacity(500 * (0 + 1 + 0 + 0 + 0 + 0) );
    if (title != null) {
      sb.append(title); sb.append(' '); 
    }
    if (titleML != null) {
      for (String str : titleML.values()) {
        if (str != null) {
          sb.append(str); sb.append(' ');
        }
      }
    }
    return new String[] {sb.toString()};
  }
  
  @Override
  public String getAllWikiText() {
    StringBuffer sb = new StringBuffer(super.getAllWikiText());
    sb.ensureCapacity(500 * (0 + 0 + 0 + 0 + 0 + 0) );
    return sb.toString();
  }
  
  @Override
  public String getAllWysiwygText() {
    StringBuffer sb = new StringBuffer(super.getAllWysiwygText());
    sb.ensureCapacity(500 * (0 + 0 + 0 + 0 + 0 + 0) );
    // Wiki fields containing JHTML
   // Wysiwyg fields
    return sb.toString();
  }
  
  public TreeSet<Category> getCategorylink(Member member) {
    return getDescendantCategorySet(channel.getCategory("j_5"), false, member);
  }
  public Category getFirstCategorylink(Member member) {
    return getFirstDescendantCategory(channel.getCategory("j_5"), false, member);
  }
  @Override
  public <T extends Data> TreeSet<T> getLinkDataSet(Class<T> clazz) {
    if (clazz == null) {
      return Util.emptyTreeSet();
    }
    TreeSet<T> set = new TreeSet<>();
    JcmsUtil.addData(set, clazz, getOriginalPortlet());
    JcmsUtil.addData(set, clazz, getPublicationLink());
    return set;
  }
  // ----------------------------------------------------------------------
  // DataController
  // ----------------------------------------------------------------------  
  public ControllerStatus checkIntegrity() {
    
    ControllerStatus status = super.checkIntegrity();
    if (status.hasFailed()) {
      return status;
    }
    
    if (Util.isEmpty(indicatorType)) {
      status = new ControllerStatus();
      status.setProp("msg.edit.empty-field", channel.getTypeFieldLabel(this, "indicatorType"), null);
      return status;
    }
    if (Util.isEmpty(linkType)) {
      status = new ControllerStatus();
      status.setProp("msg.edit.empty-field", channel.getTypeFieldLabel(this, "linkType"), null);
      return status;
    }
    return ControllerStatus.OK;
  }
  
  
  // ----------------------------------------------------------------------
  // WorkCopy
  // ----------------------------------------------------------------------  
  protected void prepareMergeCopy(Publication mergeCopy) {
    super.prepareMergeCopy(mergeCopy);  
    ((PortletIndicator)mergeCopy).setIndicatorType(getIndicatorType());
    ((PortletIndicator)mergeCopy).setValue(getValue());
    ((PortletIndicator)mergeCopy).setTargetValue(getTargetValue());
    ((PortletIndicator)mergeCopy).setPercentage(getPercentage());
    ((PortletIndicator)mergeCopy).setLabel(getLabel());
    ((PortletIndicator)mergeCopy).setLabelML(JcmsUtil.getMergedMLMap(getLabelML(), ((PortletIndicator)mergeCopy).getLabelML()));
    ((PortletIndicator)mergeCopy).setUnit(getUnit());
    ((PortletIndicator)mergeCopy).setPrimaryColor(getPrimaryColor());
    ((PortletIndicator)mergeCopy).setSecondaryColor(getSecondaryColor());
    ((PortletIndicator)mergeCopy).setAnimation(getAnimation());
    ((PortletIndicator)mergeCopy).setBriefText(getBriefText());
    ((PortletIndicator)mergeCopy).setBriefTextML(JcmsUtil.getMergedMLMap(getBriefTextML(), ((PortletIndicator)mergeCopy).getBriefTextML()));
    ((PortletIndicator)mergeCopy).setMetric(getMetric());
    ((PortletIndicator)mergeCopy).setMetricParameters(getMetricParameters());
    ((PortletIndicator)mergeCopy).setLinkType(getLinkType());
    ((PortletIndicator)mergeCopy).setPublicationLink(getPublicationLink());
    ((PortletIndicator)mergeCopy).setLinkLabel(getLinkLabel());
    ((PortletIndicator)mergeCopy).setLinkLabelML(JcmsUtil.getMergedMLMap(getLinkLabelML(), ((PortletIndicator)mergeCopy).getLinkLabelML()));
    ((PortletIndicator)mergeCopy).setPicture(getPicture());
  }
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// 7gqxXvFCbzYB5had5v+AVA==
