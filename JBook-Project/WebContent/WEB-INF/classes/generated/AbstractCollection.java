// This file has been automatically generated.

package generated;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.SortedSet;
import java.util.TreeSet;

import org.apache.oro.text.regex.Pattern;
import org.apache.oro.text.regex.Perl5Compiler;
import org.apache.oro.text.regex.Perl5Matcher;

import com.jalios.jcms.Category;
import com.jalios.jcms.ControllerStatus;
import com.jalios.jcms.Data;
import com.jalios.jcms.EnumerateFormReport;
import com.jalios.jcms.FileDocument;
import com.jalios.jcms.IntegerFormReport;
import com.jalios.jcms.JcmsUtil;
import com.jalios.jcms.Member;
import com.jalios.jcms.Publication;
import com.jalios.jcms.TypeEntry;
import com.jalios.jcms.TypeFieldEntry;
import com.jalios.jcms.mashup.ExportUtil;
import com.jalios.jcms.mashup.ImportOptions;
import com.jalios.jcms.mashup.ImportUtil;
import com.jalios.jcms.wysiwyg.JHTMLUtils;
import com.jalios.util.ObjectIntTreeMap;
import com.jalios.util.Util;

@SuppressWarnings({"unchecked", "unused"})
public abstract class AbstractCollection extends com.jalios.jcms.portlet.PortletCollection
             implements
                com.jalios.jstore.Searchable
{

  // ----------------------------------------------------------------------
  // CONSTRUCTORS
  // ----------------------------------------------------------------------
  public AbstractCollection() {}






  public AbstractCollection(AbstractCollection other) {
    super(other);
    children = other.children;
    childrenBindings = other.childrenBindings;
    description = other.description;
    descriptionML = other.descriptionML;
    portletImage = other.portletImage;
    portletImageML = other.portletImageML;
    cacheType = other.cacheType;
    cacheSensibility = other.cacheSensibility;
    invalidClass = other.invalidClass;
    invalidTime = other.invalidTime;
    displayCSS = other.displayCSS;
    width = other.width;
    insetLeft = other.insetLeft;
    insetRight = other.insetRight;
    insetTop = other.insetTop;
    insetBottom = other.insetBottom;
    cellPadding = other.cellPadding;
    alignH = other.alignH;
    alignV = other.alignV;
    alignTable = other.alignTable;
    border = other.border;
    borderColor = other.borderColor;
    backColor = other.backColor;
    backImage = other.backImage;
    behaviorCopy = other.behaviorCopy;
    originalPortlet = other.originalPortlet;
    condition = other.condition;
    cssId = other.cssId;
    cssClasses = other.cssClasses;
  }

  // ----------------------------------------------------------------------
  // Import / Export
  // ----------------------------------------------------------------------
  @Override
public void importXml(org.jdom.Element elt, ImportOptions options) {
    super.importXml(elt, options);

    setChildrenBindings(ImportUtil.parseFieldTextArray(elt, "childrenBindings"));
    setPortletImage(ImportUtil.parseFieldText(elt, "portletImage"));
    setPortletImageML(ImportUtil.parseFieldTextML(elt, "portletImageML"));
    setCacheType(ImportUtil.parseFieldText(elt, "cacheType"));
    setCacheSensibility(ImportUtil.parseFieldText(elt, "cacheSensibility"));
    setInvalidClass(ImportUtil.parseFieldTextArray(elt, "invalidClass"));
    setInvalidTime(ImportUtil.parseFieldLong(elt, "invalidTime"));
    setDisplayCSS(ImportUtil.parseFieldText(elt, "displayCSS"));
    setWidth(ImportUtil.parseFieldText(elt, "width"));
    setInsetLeft(ImportUtil.parseFieldInt(elt, "insetLeft"));
    setInsetRight(ImportUtil.parseFieldInt(elt, "insetRight"));
    setInsetTop(ImportUtil.parseFieldInt(elt, "insetTop"));
    setInsetBottom(ImportUtil.parseFieldInt(elt, "insetBottom"));
    setCellPadding(ImportUtil.parseFieldInt(elt, "cellPadding"));
    setAlignH(ImportUtil.parseFieldText(elt, "alignH"));
    setAlignV(ImportUtil.parseFieldText(elt, "alignV"));
    setAlignTable(ImportUtil.parseFieldText(elt, "alignTable"));
    setBorder(ImportUtil.parseFieldInt(elt, "border"));
    setBorderColor(ImportUtil.parseFieldText(elt, "borderColor"));
    setBackColor(ImportUtil.parseFieldText(elt, "backColor"));
    setBackImage(ImportUtil.parseFieldText(elt, "backImage"));
    setBehaviorCopy(ImportUtil.parseFieldText(elt, "behaviorCopy"));
    setCondition(ImportUtil.parseFieldTextArray(elt, "condition"));
    setCssId(ImportUtil.parseFieldText(elt, "cssId"));
    setCssClasses(ImportUtil.parseFieldText(elt, "cssClasses"));
  }

  @Override
protected void importXmlFieldsWithReferences(org.jdom.Element elt, ImportOptions options) {
    super.importXmlFieldsWithReferences(elt, options);

    if (options.isSelfImport()) {
      setChildren(ImportUtil.parseSelfFieldDataArray(elt, "children", com.jalios.jcms.portlet.PortalElement.class));
      setDescription(ImportUtil.parseFieldText(elt, "description"));
      setDescriptionML(ImportUtil.parseFieldTextML(elt, "descriptionML"));
      setOriginalPortlet(ImportUtil.parseSelfFieldData(elt, "originalPortlet", com.jalios.jcms.portlet.PortalElement.class));
    } else {

    setDescriptionML(ImportUtil.parseFieldWikiML(elt, "descriptionML"));
    setDescription(ImportUtil.parseFieldWiki(elt, "description"));
    }
  }

  @Override
public void exportXmlField(StringBuffer sb, int indentLevel) {
    super.exportXmlField(sb, indentLevel);
    sb.append(ExportUtil.exportField(indentLevel, "children", getChildren()));
    sb.append(ExportUtil.exportField(indentLevel, "childrenBindings", getChildrenBindings(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "description", getDescription(), "descriptionML", true, true));
    sb.append(ExportUtil.exportField(indentLevel, "descriptionML", getDescriptionML(), true));
    sb.append(ExportUtil.exportField(indentLevel, "portletImage", getPortletImage(), "portletImageML", false, true));
    sb.append(ExportUtil.exportField(indentLevel, "portletImageML", getPortletImageML(), true));
    sb.append(ExportUtil.exportField(indentLevel, "cacheType", getCacheType(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "cacheSensibility", getCacheSensibility(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "invalidClass", getInvalidClass(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "invalidTime", getInvalidTime()));
    sb.append(ExportUtil.exportField(indentLevel, "displayCSS", getDisplayCSS(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "width", getWidth(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "insetLeft", getInsetLeft()));
    sb.append(ExportUtil.exportField(indentLevel, "insetRight", getInsetRight()));
    sb.append(ExportUtil.exportField(indentLevel, "insetTop", getInsetTop()));
    sb.append(ExportUtil.exportField(indentLevel, "insetBottom", getInsetBottom()));
    sb.append(ExportUtil.exportField(indentLevel, "cellPadding", getCellPadding()));
    sb.append(ExportUtil.exportField(indentLevel, "alignH", getAlignH(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "alignV", getAlignV(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "alignTable", getAlignTable(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "border", getBorder()));
    sb.append(ExportUtil.exportField(indentLevel, "borderColor", getBorderColor(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "backColor", getBackColor(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "backImage", getBackImage(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "behaviorCopy", getBehaviorCopy(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "originalPortlet", getOriginalPortlet()));
    sb.append(ExportUtil.exportField(indentLevel, "condition", getCondition(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "cssId", getCssId(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "cssClasses", getCssClasses(), false, true));
  }

  @Override
public Set<FileDocument> getDocumentLinkSet() {
    Set<FileDocument> docSet = super.getDocumentLinkSet();
    JcmsUtil.addFileDocument(docSet, portletImage, portletImageML);
    JcmsUtil.addFileDocument(docSet, backImage);
    return docSet;
  }

  // ----------------------------------------------------------------------
  // TYPE AND FIELD INFOS (static methods)
  // ----------------------------------------------------------------------
  /**
   * Returns the TypeEntry bound to <code>AbstractCollection</code>. <br>
   * @see com.jalios.jcms.Channel#getTypeEntry(Class)
   * @since jcms-5.5
   */
  public static TypeEntry getTypeEntry() {
    return channel.getTypeEntry(AbstractCollection.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>AbstractCollection</code>. <br>
   * This array <strong>does not</strong> contain inherited TypeFieldEntry from super classes of <code>AbstractCollection</code>. <br/>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>AbstractCollection</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getTypeFieldEntries() {
    return channel.getTypeFieldEntries(AbstractCollection.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>AbstractCollection</code>. <br>
   * This array <strong>does</strong> contain inherited TypeFieldEntry from super classes of <code>AbstractCollection</code>. <br>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>AbstractCollection</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getAllTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getAllTypeFieldEntries() {
    return channel.getAllTypeFieldEntries(AbstractCollection.class);
  }
  // ----------------------------------------------------------------------
  // FIELDs VALUE
  // ----------------------------------------------------------------------
  /**
   * Gets the value of the given <code>int</code> field name for the current <code>AbstractCollection</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public int getIntFieldValue(String fieldName) throws NoSuchFieldException {
    if ("insetLeft".equals(fieldName)) { return getInsetLeft(); }
    if ("insetRight".equals(fieldName)) { return getInsetRight(); }
    if ("insetTop".equals(fieldName)) { return getInsetTop(); }
    if ("insetBottom".equals(fieldName)) { return getInsetBottom(); }
    if ("cellPadding".equals(fieldName)) { return getCellPadding(); }
    if ("border".equals(fieldName)) { return getBorder(); }
    return super.getIntFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>int</code> field name for the current <code>AbstractCollection</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0
   */
  @Override
public void setIntFieldValue(String fieldName, int value) throws NoSuchFieldException {
    if ("insetLeft".equals(fieldName)) { setInsetLeft(value); return; }
    if ("insetRight".equals(fieldName)) { setInsetRight(value); return; }
    if ("insetTop".equals(fieldName)) { setInsetTop(value); return; }
    if ("insetBottom".equals(fieldName)) { setInsetBottom(value); return; }
    if ("cellPadding".equals(fieldName)) { setCellPadding(value); return; }
    if ("border".equals(fieldName)) { setBorder(value); return; }
    super.setIntFieldValue(fieldName, value);
  }

  /**
   * Gets the value of the given <code>long</code> field name for the current <code>AbstractCollection</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public long getLongFieldValue(String fieldName) throws NoSuchFieldException {
    if ("invalidTime".equals(fieldName)) { return getInvalidTime(); }
    return super.getLongFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>long</code> field name for the current <code>AbstractCollection</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0
   */
  @Override
public void setLongFieldValue(String fieldName, long value) throws NoSuchFieldException {
    if ("invalidTime".equals(fieldName)) { setInvalidTime(value); return; }
    super.setLongFieldValue(fieldName, value);
  }

  /**
   * Gets the value of the given <code>double</code> field name for the current <code>AbstractCollection</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public double getDoubleFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getDoubleFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>double</code> field name for the current <code>AbstractCollection</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0
   */
  @Override
public void setDoubleFieldValue(String fieldName, double value) throws NoSuchFieldException {
     super.setDoubleFieldValue(fieldName, value);
  }

  /**
   * Gets the value of the given <code>boolean</code> field name for the current <code>AbstractCollection</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public boolean getBooleanFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getBooleanFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>boolean</code> field name for the current <code>AbstractCollection</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0
   */
  @Override
public void setBooleanFieldValue(String fieldName, boolean value) throws NoSuchFieldException {
    super.setBooleanFieldValue(fieldName, value);
  }

  /**
   * Gets the value of the given <code>Category</code> field name for the current <code>Data</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param mbr the member used to check rigth access to categories.
   * @return a <code>TreeSet</code> of <code>Category</code>
   * @throws NoSuchFieldException if the field was not found in the given <code>Data</code>.
   */
  @Override
public TreeSet<Category> getCategoryFieldValue(String fieldName, Member mbr) throws NoSuchFieldException {
    return super.getCategoryFieldValue(fieldName, mbr);
  }
  /**
   * Gets the <code>Object</code> value of the given field name for this <code>AbstractCollection</code>. <br>
   * Do not retrieve <code>Category</code> fields, see {@link #getCategoryFieldValue(String, Member)}.
   * @param fieldName the field name from which to retrieve the field value.
   * @param lang the language (ISO-639 code) in which to retrieve the field value
   *        (used only for multilingual fields).
   * @param useDefault whether to use the publication main language if the field value
   *        is not available in the requested language (used only for multilingual fields).
   * @return the <code>Object</code> field value
   * @throws NoSuchFieldException if the field was not found in the given <code>Publication</code>.
   */
  @Override
public Object getFieldValue(String fieldName, String lang, boolean useDefault) throws NoSuchFieldException {
    if ("children".equals(fieldName)) { return getChildren(); }
    if ("childrenBindings".equals(fieldName)) { return getChildrenBindings(); }
    if ("description".equals(fieldName)) { return getDescription(lang, useDefault); }
    if ("portletImage".equals(fieldName)) { return getPortletImage(lang, useDefault); }
    if ("cacheType".equals(fieldName)) { return getCacheType(); }
    if ("cacheSensibility".equals(fieldName)) { return getCacheSensibility(); }
    if ("invalidClass".equals(fieldName)) { return getInvalidClass(); }
    if ("displayCSS".equals(fieldName)) { return getDisplayCSS(); }
    if ("width".equals(fieldName)) { return getWidth(); }
    if ("alignH".equals(fieldName)) { return getAlignH(); }
    if ("alignV".equals(fieldName)) { return getAlignV(); }
    if ("alignTable".equals(fieldName)) { return getAlignTable(); }
    if ("borderColor".equals(fieldName)) { return getBorderColor(); }
    if ("backColor".equals(fieldName)) { return getBackColor(); }
    if ("backImage".equals(fieldName)) { return getBackImage(); }
    if ("behaviorCopy".equals(fieldName)) { return getBehaviorCopy(); }
    if ("originalPortlet".equals(fieldName)) { return getOriginalPortlet(); }
    if ("condition".equals(fieldName)) { return getCondition(); }
    if ("cssId".equals(fieldName)) { return getCssId(); }
    if ("cssClasses".equals(fieldName)) { return getCssClasses(); }
    return super.getFieldValue(fieldName, lang, useDefault);
  }

  /**
   * Sets the <code>Object</code> value of the given field name for this <code>AbstractCollection</code>. <br>
   * Do not set <code>Category</code> fields, see {@link #setCategoryFieldValue(String, TreeSet)}.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>Object</code> field value
   * @param lang the language (ISO-639 code) in which to retrieve the field value
   *        (used only for multilingual fields).
   *
   * @throws NoSuchFieldException if the field was not found in the given <code>Publication</code>.
   * @since jcms-6.3.0
   */
  @Override
public void setFieldValue(String fieldName, Object value, String lang) throws NoSuchFieldException {
    if ("children".equals(fieldName)) { setChildren((com.jalios.jcms.portlet.PortalElement[])value); return; }
    if ("childrenBindings".equals(fieldName)) { setChildrenBindings((String[])value); return; }
    if ("description".equals(fieldName)) { setDescription(lang,(String)value); return; }
    if ("portletImage".equals(fieldName)) { setPortletImage(lang,(String)value); return; }
    if ("cacheType".equals(fieldName)) { setCacheType((String)value); return; }
    if ("cacheSensibility".equals(fieldName)) { setCacheSensibility((String)value); return; }
    if ("invalidClass".equals(fieldName)) { setInvalidClass((String[])value); return; }
    if ("displayCSS".equals(fieldName)) { setDisplayCSS((String)value); return; }
    if ("width".equals(fieldName)) { setWidth((String)value); return; }
    if ("alignH".equals(fieldName)) { setAlignH((String)value); return; }
    if ("alignV".equals(fieldName)) { setAlignV((String)value); return; }
    if ("alignTable".equals(fieldName)) { setAlignTable((String)value); return; }
    if ("borderColor".equals(fieldName)) { setBorderColor((String)value); return; }
    if ("backColor".equals(fieldName)) { setBackColor((String)value); return; }
    if ("backImage".equals(fieldName)) { setBackImage((String)value); return; }
    if ("behaviorCopy".equals(fieldName)) { setBehaviorCopy((String)value); return; }
    if ("originalPortlet".equals(fieldName)) { setOriginalPortlet((com.jalios.jcms.portlet.PortalElement)value); return; }
    if ("condition".equals(fieldName)) { setCondition((String[])value); return; }
    if ("cssId".equals(fieldName)) { setCssId((String)value); return; }
    if ("cssClasses".equals(fieldName)) { setCssClasses((String)value); return; }
    super.setFieldValue(fieldName, value, lang);
  }

  // ----------------------------------------------------------------------
  // children
  // ----------------------------------------------------------------------

  protected  com.jalios.jcms.portlet.PortalElement[] children;

  @Override
public com.jalios.jcms.portlet.PortalElement[] getChildren() { return children; }

  @Override
public void setChildren(com.jalios.jcms.portlet.PortalElement[] v) { children = v; }



  // ----------------------------------------------------------------------
  // childrenBindings
  // ----------------------------------------------------------------------

  protected  String[] childrenBindings;

  @Override
public String[] getChildrenBindings() { return childrenBindings; }

  @Override
public void setChildrenBindings(String[] v) { childrenBindings = v; }



  public String[] getChildrenBindings(String lang) { return childrenBindings; }
  public String[] getChildrenBindings(String lang, boolean useDefault) { return childrenBindings; }
  // ----------------------------------------------------------------------
  // description
  // ----------------------------------------------------------------------

  protected  String description = channel.getTypeFieldEntry(AbstractCollection.class, "description", true).getDefaultTextString();

  public String getDescription() { return description; }

  @Override
public void setDescription(String v) { description = v; }




  protected HashMap<String,String> descriptionML = channel.getTypeFieldEntry(AbstractCollection.class, "description", true).getDefaultTextMap();
  @Override
public String getDescription(String lang) { return channel.getLangValue(lang, true, description, descriptionML, getMainLanguage()); }
  @Override
public String getDescription(String lang, boolean useDefault) { return channel.getLangValue(lang, useDefault, description, descriptionML, getMainLanguage()); }
  @Override
public HashMap<String,String> getDescriptionML() { return descriptionML; }
  @Override
public void setDescriptionML(HashMap<String,String> v) { descriptionML = v; }

  public String getDescriptionMLE() {
    return JcmsUtil.encodeMLE(getDescriptionML());
  }

  public void setDescriptionMLE(String v) {
    setDescriptionML(JcmsUtil.decodeMLE(v));
  }

  public void setDescription(String lang, String value) {
    if (channel.getLanguage().equals(lang)) {
      description = value;
      return;
    }
    if (descriptionML == null) {
      descriptionML = new HashMap<>();
    } else if (this != channel.getData(id)) {
      descriptionML = new HashMap<>(descriptionML);
    }
    descriptionML.put(lang, value);
  }
  // ----------------------------------------------------------------------
  // portletImage
  // ----------------------------------------------------------------------

  protected  String portletImage = channel.getTypeFieldEntry(AbstractCollection.class, "portletImage", true).getDefaultTextString();

  public String getPortletImage() { return portletImage; }

  @Override
public void setPortletImage(String v) { portletImage = v; }




  protected HashMap<String,String> portletImageML = channel.getTypeFieldEntry(AbstractCollection.class, "portletImage", true).getDefaultTextMap();
  @Override
public String getPortletImage(String lang) { return channel.getLangValue(lang, true, portletImage, portletImageML, getMainLanguage()); }
  @Override
public String getPortletImage(String lang, boolean useDefault) { return channel.getLangValue(lang, useDefault, portletImage, portletImageML, getMainLanguage()); }
  @Override
public HashMap<String,String> getPortletImageML() { return portletImageML; }
  @Override
public void setPortletImageML(HashMap<String,String> v) { portletImageML = v; }

  public String getPortletImageMLE() {
    return JcmsUtil.encodeMLE(getPortletImageML());
  }

  public void setPortletImageMLE(String v) {
    setPortletImageML(JcmsUtil.decodeMLE(v));
  }

  public void setPortletImage(String lang, String value) {
    if (channel.getLanguage().equals(lang)) {
      portletImage = value;
      return;
    }
    if (portletImageML == null) {
      portletImageML = new HashMap<>();
    } else if (this != channel.getData(id)) {
      portletImageML = new HashMap<>(portletImageML);
    }
    portletImageML.put(lang, value);
  }
  // ----------------------------------------------------------------------
  // cacheType
  // ----------------------------------------------------------------------

  protected  String cacheType = channel.getTypeFieldEntry(AbstractCollection.class, "cacheType", true).getDefaultTextString();

  @Override
public String getCacheType() { return cacheType; }

  @Override
public void setCacheType(String v) { cacheType = v; }



  public String getCacheType(String lang) { return cacheType; }
  public String getCacheType(String lang, boolean useDefault) { return cacheType; }
  private static String[] cacheTypeValues;
  private static String[] cacheTypeLabels;
  private static Map<String, String[]> cacheTypeLabelsMap;

  public static String[] getCacheTypeValues() {
    if(cacheTypeValues == null) {
      setCacheTypeValues(channel.getTypeFieldEntry(AbstractCollection.class, "cacheType", true).getEnumerateValues());
    }
    return cacheTypeValues;
  }
  public static void setCacheTypeValues(String[] values) {
    cacheTypeValues = values;
  }
  public static String[] getCacheTypeLabels() {
    if(cacheTypeLabels == null) {
      setCacheTypeLabels(channel.getTypeFieldEntry(AbstractCollection.class, "cacheType", true).getEnumerateLabels());
    }
    return cacheTypeLabels;
  }
  public static void setCacheTypeLabels(String[] labels) {
    cacheTypeLabels = labels;
  }
  public static Map<String, String[]> getCacheTypeLabelsMap() {
    if(cacheTypeLabelsMap == null) {
      setCacheTypeLabelsMap(channel.getTypeFieldEntry(AbstractCollection.class, "cacheType", true).getEnumerateLabelsMap());
    }
    return cacheTypeLabelsMap;
  }
  public static void setCacheTypeLabelsMap(Map<String, String[]> LabelsMap) {
    cacheTypeLabelsMap = LabelsMap;
  }
  public static String[] getCacheTypeLabels(String userLang) {
    Map<String, String[]> cacheTypeLabelMap = getCacheTypeLabelsMap();
    String[] labels = cacheTypeLabelMap.get(userLang);
    if (labels == null) {
      labels = cacheTypeLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getCacheTypeLabel(String value, String userLang) {
    String[] labels = getCacheTypeLabels(userLang);
    int i = 0;
    if (false) {
    }
    else if (value.equals("None")) {
      i = 0;
    }
    else if (value.equals("Server")) {
      i = 1;
    }
    else if (value.equals("Groups")) {
      i = 2;
    }
    else if (value.equals("Members")) {
      i = 3;
    }
    else if (value.equals("Session")) {
      i = 4;
    }
    else if (value.equals("SessionAndVisitors")) {
      i = 5;
    }
    else if (value.equals("VisitorsOnly")) {
      i = 6;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return getCacheTypeLabel(value, channel.getLanguage());
  }

  public static String getCacheTypeLabel(String value) {
    String[] cacheTypeLabels = getCacheTypeLabels();
    if (false) {
    }
    else if (value.equals("None")) {
      return cacheTypeLabels[0];
    }
    else if (value.equals("Server")) {
      return cacheTypeLabels[1];
    }
    else if (value.equals("Groups")) {
      return cacheTypeLabels[2];
    }
    else if (value.equals("Members")) {
      return cacheTypeLabels[3];
    }
    else if (value.equals("Session")) {
      return cacheTypeLabels[4];
    }
    else if (value.equals("SessionAndVisitors")) {
      return cacheTypeLabels[5];
    }
    else if (value.equals("VisitorsOnly")) {
      return cacheTypeLabels[6];
    }
    return "???";
  }
  public static EnumerateFormReport getCacheTypeReport(SortedSet<AbstractCollection> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (AbstractCollection obj : set) {
      if (obj == null) {
        continue;
      }

      map.inc("" + obj.getCacheType());

      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }
  // ----------------------------------------------------------------------
  // cacheSensibility
  // ----------------------------------------------------------------------

  protected  String cacheSensibility = channel.getTypeFieldEntry(AbstractCollection.class, "cacheSensibility", true).getDefaultTextString();

  @Override
public String getCacheSensibility() { return cacheSensibility; }

  @Override
public void setCacheSensibility(String v) { cacheSensibility = v; }



  public String getCacheSensibility(String lang) { return cacheSensibility; }
  public String getCacheSensibility(String lang, boolean useDefault) { return cacheSensibility; }
  private static String[] cacheSensibilityValues;
  private static String[] cacheSensibilityLabels;
  private static Map<String, String[]> cacheSensibilityLabelsMap;

  public static String[] getCacheSensibilityValues() {
    if(cacheSensibilityValues == null) {
      setCacheSensibilityValues(channel.getTypeFieldEntry(AbstractCollection.class, "cacheSensibility", true).getEnumerateValues());
    }
    return cacheSensibilityValues;
  }
  public static void setCacheSensibilityValues(String[] values) {
    cacheSensibilityValues = values;
  }
  public static String[] getCacheSensibilityLabels() {
    if(cacheSensibilityLabels == null) {
      setCacheSensibilityLabels(channel.getTypeFieldEntry(AbstractCollection.class, "cacheSensibility", true).getEnumerateLabels());
    }
    return cacheSensibilityLabels;
  }
  public static void setCacheSensibilityLabels(String[] labels) {
    cacheSensibilityLabels = labels;
  }
  public static Map<String, String[]> getCacheSensibilityLabelsMap() {
    if(cacheSensibilityLabelsMap == null) {
      setCacheSensibilityLabelsMap(channel.getTypeFieldEntry(AbstractCollection.class, "cacheSensibility", true).getEnumerateLabelsMap());
    }
    return cacheSensibilityLabelsMap;
  }
  public static void setCacheSensibilityLabelsMap(Map<String, String[]> LabelsMap) {
    cacheSensibilityLabelsMap = LabelsMap;
  }
  public static String[] getCacheSensibilityLabels(String userLang) {
    Map<String, String[]> cacheSensibilityLabelMap = getCacheSensibilityLabelsMap();
    String[] labels = cacheSensibilityLabelMap.get(userLang);
    if (labels == null) {
      labels = cacheSensibilityLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getCacheSensibilityLabel(String value, String userLang) {
    String[] labels = getCacheSensibilityLabels(userLang);
    int i = 0;
    if (false) {
    }
    else if (value.equals("None")) {
      i = 0;
    }
    else if (value.equals("Portal")) {
      i = 1;
    }
    else if (value.equals("Current")) {
      i = 2;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return getCacheSensibilityLabel(value, channel.getLanguage());
  }

  public static String getCacheSensibilityLabel(String value) {
    String[] cacheSensibilityLabels = getCacheSensibilityLabels();
    if (false) {
    }
    else if (value.equals("None")) {
      return cacheSensibilityLabels[0];
    }
    else if (value.equals("Portal")) {
      return cacheSensibilityLabels[1];
    }
    else if (value.equals("Current")) {
      return cacheSensibilityLabels[2];
    }
    return "???";
  }
  public static EnumerateFormReport getCacheSensibilityReport(SortedSet<AbstractCollection> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (AbstractCollection obj : set) {
      if (obj == null) {
        continue;
      }

      map.inc("" + obj.getCacheSensibility());

      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }
  // ----------------------------------------------------------------------
  // invalidClass
  // ----------------------------------------------------------------------

  protected  String[] invalidClass;

  @Override
public String[] getInvalidClass() { return invalidClass; }

  @Override
public void setInvalidClass(String[] v) { invalidClass = v; }



  public String[] getInvalidClass(String lang) { return invalidClass; }
  public String[] getInvalidClass(String lang, boolean useDefault) { return invalidClass; }
  private static String[] invalidClassValues;
  private static String[] invalidClassLabels;
  private static Map<String, String[]> invalidClassLabelsMap;

  public static String[] getInvalidClassValues() {
    if(invalidClassValues == null) {
      setInvalidClassValues(channel.getTypeFieldEntry(AbstractCollection.class, "invalidClass", true).getEnumerateValues());
    }
    return invalidClassValues;
  }
  public static void setInvalidClassValues(String[] values) {
    invalidClassValues = values;
  }
  public static String[] getInvalidClassLabels() {
    if(invalidClassLabels == null) {
      setInvalidClassLabels(channel.getTypeFieldEntry(AbstractCollection.class, "invalidClass", true).getEnumerateLabels());
    }
    return invalidClassLabels;
  }
  public static void setInvalidClassLabels(String[] labels) {
    invalidClassLabels = labels;
  }
  public static Map<String, String[]> getInvalidClassLabelsMap() {
    if(invalidClassLabelsMap == null) {
      setInvalidClassLabelsMap(channel.getTypeFieldEntry(AbstractCollection.class, "invalidClass", true).getEnumerateLabelsMap());
    }
    return invalidClassLabelsMap;
  }
  public static void setInvalidClassLabelsMap(Map<String, String[]> LabelsMap) {
    invalidClassLabelsMap = LabelsMap;
  }
  public static String[] getInvalidClassLabels(String userLang) {
    Map<String, String[]> invalidClassLabelMap = getInvalidClassLabelsMap();
    String[] labels = invalidClassLabelMap.get(userLang);
    if (labels == null) {
      labels = invalidClassLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getInvalidClassLabel(String value, String userLang) {
    String[] labels = getInvalidClassLabels(userLang);
    int i = 0;
    if (false) {
    }
    else if (value.equals("Data")) {
      i = 0;
    }
    else if (value.equals("Publication")) {
      i = 1;
    }
    else if (value.equals("Content")) {
      i = 2;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return getInvalidClassLabel(value, channel.getLanguage());
  }

  public static String getInvalidClassLabel(String value) {
    String[] invalidClassLabels = getInvalidClassLabels();
    if (false) {
    }
    else if (value.equals("Data")) {
      return invalidClassLabels[0];
    }
    else if (value.equals("Publication")) {
      return invalidClassLabels[1];
    }
    else if (value.equals("Content")) {
      return invalidClassLabels[2];
    }
    return "???";
  }
  public static EnumerateFormReport getInvalidClassReport(SortedSet<AbstractCollection> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (AbstractCollection obj : set) {
      if (obj == null || obj.getInvalidClass() == null) {
        continue;
      }
      for(int i = 0; i < obj.getInvalidClass().length; i++) {
        if (obj.getInvalidClass()[i] != null) {
          map.inc(obj.getInvalidClass()[i]);
        }
      }
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }
  // ----------------------------------------------------------------------
  // invalidTime
  // ----------------------------------------------------------------------

  protected  long invalidTime = 60;

  @Override
public long getInvalidTime() { return invalidTime; }

  @Override
public void setInvalidTime(long v) { invalidTime = v; }



  // ----------------------------------------------------------------------
  // displayCSS
  // ----------------------------------------------------------------------

  protected  String displayCSS = channel.getTypeFieldEntry(AbstractCollection.class, "displayCSS", true).getDefaultTextString();

  @Override
public String getDisplayCSS() { return displayCSS; }

  @Override
public void setDisplayCSS(String v) { displayCSS = v; }



  public String getDisplayCSS(String lang) { return displayCSS; }
  public String getDisplayCSS(String lang, boolean useDefault) { return displayCSS; }
  private static String[] displayCSSValues;
  private static String[] displayCSSLabels;
  private static Map<String, String[]> displayCSSLabelsMap;

  public static String[] getDisplayCSSValues() {
    if(displayCSSValues == null) {
      setDisplayCSSValues(channel.getTypeFieldEntry(AbstractCollection.class, "displayCSS", true).getEnumerateValues());
    }
    return displayCSSValues;
  }
  public static void setDisplayCSSValues(String[] values) {
    displayCSSValues = values;
  }
  public static String[] getDisplayCSSLabels() {
    if(displayCSSLabels == null) {
      setDisplayCSSLabels(channel.getTypeFieldEntry(AbstractCollection.class, "displayCSS", true).getEnumerateLabels());
    }
    return displayCSSLabels;
  }
  public static void setDisplayCSSLabels(String[] labels) {
    displayCSSLabels = labels;
  }
  public static Map<String, String[]> getDisplayCSSLabelsMap() {
    if(displayCSSLabelsMap == null) {
      setDisplayCSSLabelsMap(channel.getTypeFieldEntry(AbstractCollection.class, "displayCSS", true).getEnumerateLabelsMap());
    }
    return displayCSSLabelsMap;
  }
  public static void setDisplayCSSLabelsMap(Map<String, String[]> LabelsMap) {
    displayCSSLabelsMap = LabelsMap;
  }
  public static String[] getDisplayCSSLabels(String userLang) {
    Map<String, String[]> displayCSSLabelMap = getDisplayCSSLabelsMap();
    String[] labels = displayCSSLabelMap.get(userLang);
    if (labels == null) {
      labels = displayCSSLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getDisplayCSSLabel(String value, String userLang) {
    String[] labels = getDisplayCSSLabels(userLang);
    int i = 0;
    if (false) {
    }
    else if (value.equals("value1")) {
      i = 0;
    }
    else if (value.equals("value2")) {
      i = 1;
    }
    else if (value.equals("value3")) {
      i = 2;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return getDisplayCSSLabel(value, channel.getLanguage());
  }

  public static String getDisplayCSSLabel(String value) {
    String[] displayCSSLabels = getDisplayCSSLabels();
    if (false) {
    }
    else if (value.equals("value1")) {
      return displayCSSLabels[0];
    }
    else if (value.equals("value2")) {
      return displayCSSLabels[1];
    }
    else if (value.equals("value3")) {
      return displayCSSLabels[2];
    }
    return "???";
  }
  public static EnumerateFormReport getDisplayCSSReport(SortedSet<AbstractCollection> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (AbstractCollection obj : set) {
      if (obj == null) {
        continue;
      }

      map.inc("" + obj.getDisplayCSS());

      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }
  // ----------------------------------------------------------------------
  // width
  // ----------------------------------------------------------------------

  protected  String width = channel.getTypeFieldEntry(AbstractCollection.class, "width", true).getDefaultTextString();

  @Override
public String getWidth() { return width; }

  @Override
public void setWidth(String v) { width = v; }



  public String getWidth(String lang) { return width; }
  public String getWidth(String lang, boolean useDefault) { return width; }
  // ----------------------------------------------------------------------
  // insetLeft
  // ----------------------------------------------------------------------

  protected  int insetLeft = 0;

  @Override
public int getInsetLeft() { return insetLeft; }

  @Override
public void setInsetLeft(int v) { insetLeft = v; }



  public static IntegerFormReport getInsetLeftReport(SortedSet<AbstractCollection> set) {
    long sum = 0;
    int min = Integer.MAX_VALUE;
    int max = Integer.MIN_VALUE;
    for (AbstractCollection obj : set) {
      if (obj == null) {
        continue;
      }
      int value = obj.getInsetLeft();
      sum += value;
      min = Math.min(value, min);
      max = Math.max(value, max);
    }
    return new IntegerFormReport(set.size(), sum, min, max);
  }
  // ----------------------------------------------------------------------
  // insetRight
  // ----------------------------------------------------------------------

  protected  int insetRight = 0;

  @Override
public int getInsetRight() { return insetRight; }

  @Override
public void setInsetRight(int v) { insetRight = v; }



  public static IntegerFormReport getInsetRightReport(SortedSet<AbstractCollection> set) {
    long sum = 0;
    int min = Integer.MAX_VALUE;
    int max = Integer.MIN_VALUE;
    for (AbstractCollection obj : set) {
      if (obj == null) {
        continue;
      }
      int value = obj.getInsetRight();
      sum += value;
      min = Math.min(value, min);
      max = Math.max(value, max);
    }
    return new IntegerFormReport(set.size(), sum, min, max);
  }
  // ----------------------------------------------------------------------
  // insetTop
  // ----------------------------------------------------------------------

  protected  int insetTop = 0;

  @Override
public int getInsetTop() { return insetTop; }

  @Override
public void setInsetTop(int v) { insetTop = v; }



  public static IntegerFormReport getInsetTopReport(SortedSet<AbstractCollection> set) {
    long sum = 0;
    int min = Integer.MAX_VALUE;
    int max = Integer.MIN_VALUE;
    for (AbstractCollection obj : set) {
      if (obj == null) {
        continue;
      }
      int value = obj.getInsetTop();
      sum += value;
      min = Math.min(value, min);
      max = Math.max(value, max);
    }
    return new IntegerFormReport(set.size(), sum, min, max);
  }
  // ----------------------------------------------------------------------
  // insetBottom
  // ----------------------------------------------------------------------

  protected  int insetBottom = 0;

  @Override
public int getInsetBottom() { return insetBottom; }

  @Override
public void setInsetBottom(int v) { insetBottom = v; }



  public static IntegerFormReport getInsetBottomReport(SortedSet<AbstractCollection> set) {
    long sum = 0;
    int min = Integer.MAX_VALUE;
    int max = Integer.MIN_VALUE;
    for (AbstractCollection obj : set) {
      if (obj == null) {
        continue;
      }
      int value = obj.getInsetBottom();
      sum += value;
      min = Math.min(value, min);
      max = Math.max(value, max);
    }
    return new IntegerFormReport(set.size(), sum, min, max);
  }
  // ----------------------------------------------------------------------
  // cellPadding
  // ----------------------------------------------------------------------

  protected  int cellPadding = 0;

  @Override
public int getCellPadding() { return cellPadding; }

  @Override
public void setCellPadding(int v) { cellPadding = v; }



  public static IntegerFormReport getCellPaddingReport(SortedSet<AbstractCollection> set) {
    long sum = 0;
    int min = Integer.MAX_VALUE;
    int max = Integer.MIN_VALUE;
    for (AbstractCollection obj : set) {
      if (obj == null) {
        continue;
      }
      int value = obj.getCellPadding();
      sum += value;
      min = Math.min(value, min);
      max = Math.max(value, max);
    }
    return new IntegerFormReport(set.size(), sum, min, max);
  }
  // ----------------------------------------------------------------------
  // alignH
  // ----------------------------------------------------------------------

  protected  String alignH = channel.getTypeFieldEntry(AbstractCollection.class, "alignH", true).getDefaultTextString();

  @Override
public String getAlignH() { return alignH; }

  @Override
public void setAlignH(String v) { alignH = v; }



  public String getAlignH(String lang) { return alignH; }
  public String getAlignH(String lang, boolean useDefault) { return alignH; }
  private static String[] alignHValues;
  private static String[] alignHLabels;
  private static Map<String, String[]> alignHLabelsMap;

  public static String[] getAlignHValues() {
    if(alignHValues == null) {
      setAlignHValues(channel.getTypeFieldEntry(AbstractCollection.class, "alignH", true).getEnumerateValues());
    }
    return alignHValues;
  }
  public static void setAlignHValues(String[] values) {
    alignHValues = values;
  }
  public static String[] getAlignHLabels() {
    if(alignHLabels == null) {
      setAlignHLabels(channel.getTypeFieldEntry(AbstractCollection.class, "alignH", true).getEnumerateLabels());
    }
    return alignHLabels;
  }
  public static void setAlignHLabels(String[] labels) {
    alignHLabels = labels;
  }
  public static Map<String, String[]> getAlignHLabelsMap() {
    if(alignHLabelsMap == null) {
      setAlignHLabelsMap(channel.getTypeFieldEntry(AbstractCollection.class, "alignH", true).getEnumerateLabelsMap());
    }
    return alignHLabelsMap;
  }
  public static void setAlignHLabelsMap(Map<String, String[]> LabelsMap) {
    alignHLabelsMap = LabelsMap;
  }
  public static String[] getAlignHLabels(String userLang) {
    Map<String, String[]> alignHLabelMap = getAlignHLabelsMap();
    String[] labels = alignHLabelMap.get(userLang);
    if (labels == null) {
      labels = alignHLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getAlignHLabel(String value, String userLang) {
    String[] labels = getAlignHLabels(userLang);
    int i = 0;
    if (false) {
    }
    else if (value.equals("center")) {
      i = 0;
    }
    else if (value.equals("left")) {
      i = 1;
    }
    else if (value.equals("right")) {
      i = 2;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return getAlignHLabel(value, channel.getLanguage());
  }

  public static String getAlignHLabel(String value) {
    String[] alignHLabels = getAlignHLabels();
    if (false) {
    }
    else if (value.equals("center")) {
      return alignHLabels[0];
    }
    else if (value.equals("left")) {
      return alignHLabels[1];
    }
    else if (value.equals("right")) {
      return alignHLabels[2];
    }
    return "???";
  }
  public static EnumerateFormReport getAlignHReport(SortedSet<AbstractCollection> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (AbstractCollection obj : set) {
      if (obj == null) {
        continue;
      }

      map.inc("" + obj.getAlignH());

      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }
  // ----------------------------------------------------------------------
  // alignV
  // ----------------------------------------------------------------------

  protected  String alignV = channel.getTypeFieldEntry(AbstractCollection.class, "alignV", true).getDefaultTextString();

  @Override
public String getAlignV() { return alignV; }

  @Override
public void setAlignV(String v) { alignV = v; }



  public String getAlignV(String lang) { return alignV; }
  public String getAlignV(String lang, boolean useDefault) { return alignV; }
  private static String[] alignVValues;
  private static String[] alignVLabels;
  private static Map<String, String[]> alignVLabelsMap;

  public static String[] getAlignVValues() {
    if(alignVValues == null) {
      setAlignVValues(channel.getTypeFieldEntry(AbstractCollection.class, "alignV", true).getEnumerateValues());
    }
    return alignVValues;
  }
  public static void setAlignVValues(String[] values) {
    alignVValues = values;
  }
  public static String[] getAlignVLabels() {
    if(alignVLabels == null) {
      setAlignVLabels(channel.getTypeFieldEntry(AbstractCollection.class, "alignV", true).getEnumerateLabels());
    }
    return alignVLabels;
  }
  public static void setAlignVLabels(String[] labels) {
    alignVLabels = labels;
  }
  public static Map<String, String[]> getAlignVLabelsMap() {
    if(alignVLabelsMap == null) {
      setAlignVLabelsMap(channel.getTypeFieldEntry(AbstractCollection.class, "alignV", true).getEnumerateLabelsMap());
    }
    return alignVLabelsMap;
  }
  public static void setAlignVLabelsMap(Map<String, String[]> LabelsMap) {
    alignVLabelsMap = LabelsMap;
  }
  public static String[] getAlignVLabels(String userLang) {
    Map<String, String[]> alignVLabelMap = getAlignVLabelsMap();
    String[] labels = alignVLabelMap.get(userLang);
    if (labels == null) {
      labels = alignVLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getAlignVLabel(String value, String userLang) {
    String[] labels = getAlignVLabels(userLang);
    int i = 0;
    if (false) {
    }
    else if (value.equals("middle")) {
      i = 0;
    }
    else if (value.equals("top")) {
      i = 1;
    }
    else if (value.equals("bottom")) {
      i = 2;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return getAlignVLabel(value, channel.getLanguage());
  }

  public static String getAlignVLabel(String value) {
    String[] alignVLabels = getAlignVLabels();
    if (false) {
    }
    else if (value.equals("middle")) {
      return alignVLabels[0];
    }
    else if (value.equals("top")) {
      return alignVLabels[1];
    }
    else if (value.equals("bottom")) {
      return alignVLabels[2];
    }
    return "???";
  }
  public static EnumerateFormReport getAlignVReport(SortedSet<AbstractCollection> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (AbstractCollection obj : set) {
      if (obj == null) {
        continue;
      }

      map.inc("" + obj.getAlignV());

      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }
  // ----------------------------------------------------------------------
  // alignTable
  // ----------------------------------------------------------------------

  protected  String alignTable = channel.getTypeFieldEntry(AbstractCollection.class, "alignTable", true).getDefaultTextString();

  @Override
public String getAlignTable() { return alignTable; }

  @Override
public void setAlignTable(String v) { alignTable = v; }



  public String getAlignTable(String lang) { return alignTable; }
  public String getAlignTable(String lang, boolean useDefault) { return alignTable; }
  private static String[] alignTableValues;
  private static String[] alignTableLabels;
  private static Map<String, String[]> alignTableLabelsMap;

  public static String[] getAlignTableValues() {
    if(alignTableValues == null) {
      setAlignTableValues(channel.getTypeFieldEntry(AbstractCollection.class, "alignTable", true).getEnumerateValues());
    }
    return alignTableValues;
  }
  public static void setAlignTableValues(String[] values) {
    alignTableValues = values;
  }
  public static String[] getAlignTableLabels() {
    if(alignTableLabels == null) {
      setAlignTableLabels(channel.getTypeFieldEntry(AbstractCollection.class, "alignTable", true).getEnumerateLabels());
    }
    return alignTableLabels;
  }
  public static void setAlignTableLabels(String[] labels) {
    alignTableLabels = labels;
  }
  public static Map<String, String[]> getAlignTableLabelsMap() {
    if(alignTableLabelsMap == null) {
      setAlignTableLabelsMap(channel.getTypeFieldEntry(AbstractCollection.class, "alignTable", true).getEnumerateLabelsMap());
    }
    return alignTableLabelsMap;
  }
  public static void setAlignTableLabelsMap(Map<String, String[]> LabelsMap) {
    alignTableLabelsMap = LabelsMap;
  }
  public static String[] getAlignTableLabels(String userLang) {
    Map<String, String[]> alignTableLabelMap = getAlignTableLabelsMap();
    String[] labels = alignTableLabelMap.get(userLang);
    if (labels == null) {
      labels = alignTableLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getAlignTableLabel(String value, String userLang) {
    String[] labels = getAlignTableLabels(userLang);
    int i = 0;
    if (false) {
    }
    else if (value.equals("")) {
      i = 0;
    }
    else if (value.equals("center")) {
      i = 1;
    }
    else if (value.equals("left")) {
      i = 2;
    }
    else if (value.equals("right")) {
      i = 3;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return getAlignTableLabel(value, channel.getLanguage());
  }

  public static String getAlignTableLabel(String value) {
    String[] alignTableLabels = getAlignTableLabels();
    if (false) {
    }
    else if (value.equals("")) {
      return alignTableLabels[0];
    }
    else if (value.equals("center")) {
      return alignTableLabels[1];
    }
    else if (value.equals("left")) {
      return alignTableLabels[2];
    }
    else if (value.equals("right")) {
      return alignTableLabels[3];
    }
    return "???";
  }
  public static EnumerateFormReport getAlignTableReport(SortedSet<AbstractCollection> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (AbstractCollection obj : set) {
      if (obj == null) {
        continue;
      }

      map.inc("" + obj.getAlignTable());

      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }
  // ----------------------------------------------------------------------
  // border
  // ----------------------------------------------------------------------

  protected  int border = 0;

  @Override
public int getBorder() { return border; }

  @Override
public void setBorder(int v) { border = v; }



  public static IntegerFormReport getBorderReport(SortedSet<AbstractCollection> set) {
    long sum = 0;
    int min = Integer.MAX_VALUE;
    int max = Integer.MIN_VALUE;
    for (AbstractCollection obj : set) {
      if (obj == null) {
        continue;
      }
      int value = obj.getBorder();
      sum += value;
      min = Math.min(value, min);
      max = Math.max(value, max);
    }
    return new IntegerFormReport(set.size(), sum, min, max);
  }
  // ----------------------------------------------------------------------
  // borderColor
  // ----------------------------------------------------------------------

  protected  String borderColor = channel.getTypeFieldEntry(AbstractCollection.class, "borderColor", true).getDefaultTextString();

  @Override
public String getBorderColor() { return borderColor; }

  @Override
public void setBorderColor(String v) { borderColor = v; }



  public String getBorderColor(String lang) { return borderColor; }
  public String getBorderColor(String lang, boolean useDefault) { return borderColor; }
  // ----------------------------------------------------------------------
  // backColor
  // ----------------------------------------------------------------------

  protected  String backColor = channel.getTypeFieldEntry(AbstractCollection.class, "backColor", true).getDefaultTextString();

  @Override
public String getBackColor() { return backColor; }

  @Override
public void setBackColor(String v) { backColor = v; }



  public String getBackColor(String lang) { return backColor; }
  public String getBackColor(String lang, boolean useDefault) { return backColor; }
  // ----------------------------------------------------------------------
  // backImage
  // ----------------------------------------------------------------------

  protected  String backImage = channel.getTypeFieldEntry(AbstractCollection.class, "backImage", true).getDefaultTextString();

  @Override
public String getBackImage() { return backImage; }

  @Override
public void setBackImage(String v) { backImage = v; }



  public String getBackImage(String lang) { return backImage; }
  public String getBackImage(String lang, boolean useDefault) { return backImage; }
  // ----------------------------------------------------------------------
  // behaviorCopy
  // ----------------------------------------------------------------------

  protected  String behaviorCopy = channel.getTypeFieldEntry(AbstractCollection.class, "behaviorCopy", true).getDefaultTextString();

  @Override
public String getBehaviorCopy() { return behaviorCopy; }

  @Override
public void setBehaviorCopy(String v) { behaviorCopy = v; }



  public String getBehaviorCopy(String lang) { return behaviorCopy; }
  public String getBehaviorCopy(String lang, boolean useDefault) { return behaviorCopy; }
  private static String[] behaviorCopyValues;
  private static String[] behaviorCopyLabels;
  private static Map<String, String[]> behaviorCopyLabelsMap;

  public static String[] getBehaviorCopyValues() {
    if(behaviorCopyValues == null) {
      setBehaviorCopyValues(channel.getTypeFieldEntry(AbstractCollection.class, "behaviorCopy", true).getEnumerateValues());
    }
    return behaviorCopyValues;
  }
  public static void setBehaviorCopyValues(String[] values) {
    behaviorCopyValues = values;
  }
  public static String[] getBehaviorCopyLabels() {
    if(behaviorCopyLabels == null) {
      setBehaviorCopyLabels(channel.getTypeFieldEntry(AbstractCollection.class, "behaviorCopy", true).getEnumerateLabels());
    }
    return behaviorCopyLabels;
  }
  public static void setBehaviorCopyLabels(String[] labels) {
    behaviorCopyLabels = labels;
  }
  public static Map<String, String[]> getBehaviorCopyLabelsMap() {
    if(behaviorCopyLabelsMap == null) {
      setBehaviorCopyLabelsMap(channel.getTypeFieldEntry(AbstractCollection.class, "behaviorCopy", true).getEnumerateLabelsMap());
    }
    return behaviorCopyLabelsMap;
  }
  public static void setBehaviorCopyLabelsMap(Map<String, String[]> LabelsMap) {
    behaviorCopyLabelsMap = LabelsMap;
  }
  public static String[] getBehaviorCopyLabels(String userLang) {
    Map<String, String[]> behaviorCopyLabelMap = getBehaviorCopyLabelsMap();
    String[] labels = behaviorCopyLabelMap.get(userLang);
    if (labels == null) {
      labels = behaviorCopyLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getBehaviorCopyLabel(String value, String userLang) {
    String[] labels = getBehaviorCopyLabels(userLang);
    int i = 0;
    if (false) {
    }
    else if (value.equals("true")) {
      i = 0;
    }
    else if (value.equals("false")) {
      i = 1;
    }
    else if (value.equals("ws")) {
      i = 2;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return getBehaviorCopyLabel(value, channel.getLanguage());
  }

  public static String getBehaviorCopyLabel(String value) {
    String[] behaviorCopyLabels = getBehaviorCopyLabels();
    if (false) {
    }
    else if (value.equals("true")) {
      return behaviorCopyLabels[0];
    }
    else if (value.equals("false")) {
      return behaviorCopyLabels[1];
    }
    else if (value.equals("ws")) {
      return behaviorCopyLabels[2];
    }
    return "???";
  }
  public static EnumerateFormReport getBehaviorCopyReport(SortedSet<AbstractCollection> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (AbstractCollection obj : set) {
      if (obj == null) {
        continue;
      }

      map.inc("" + obj.getBehaviorCopy());

      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }
  // ----------------------------------------------------------------------
  // originalPortlet
  // ----------------------------------------------------------------------

  protected  com.jalios.jcms.portlet.PortalElement originalPortlet;

  public com.jalios.jcms.portlet.PortalElement getOriginalPortlet() { return originalPortlet; }

  public void setOriginalPortlet(com.jalios.jcms.portlet.PortalElement v) { originalPortlet = v; }



  // ----------------------------------------------------------------------
  // condition
  // ----------------------------------------------------------------------

  protected  String[] condition;

  @Override
public String[] getCondition() { return condition; }

  @Override
public void setCondition(String[] v) { condition = v; }



  public String[] getCondition(String lang) { return condition; }
  public String[] getCondition(String lang, boolean useDefault) { return condition; }
  private static String[] conditionValues;
  private static String[] conditionLabels;
  private static Map<String, String[]> conditionLabelsMap;

  public static String[] getConditionValues() {
    if(conditionValues == null) {
      setConditionValues(channel.getTypeFieldEntry(AbstractCollection.class, "condition", true).getEnumerateValues());
    }
    return conditionValues;
  }
  public static void setConditionValues(String[] values) {
    conditionValues = values;
  }
  public static String[] getConditionLabels() {
    if(conditionLabels == null) {
      setConditionLabels(channel.getTypeFieldEntry(AbstractCollection.class, "condition", true).getEnumerateLabels());
    }
    return conditionLabels;
  }
  public static void setConditionLabels(String[] labels) {
    conditionLabels = labels;
  }
  public static Map<String, String[]> getConditionLabelsMap() {
    if(conditionLabelsMap == null) {
      setConditionLabelsMap(channel.getTypeFieldEntry(AbstractCollection.class, "condition", true).getEnumerateLabelsMap());
    }
    return conditionLabelsMap;
  }
  public static void setConditionLabelsMap(Map<String, String[]> LabelsMap) {
    conditionLabelsMap = LabelsMap;
  }
  public static String[] getConditionLabels(String userLang) {
    Map<String, String[]> conditionLabelMap = getConditionLabelsMap();
    String[] labels = conditionLabelMap.get(userLang);
    if (labels == null) {
      labels = conditionLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getConditionLabel(String value, String userLang) {
    String[] labels = getConditionLabels(userLang);
    int i = 0;
    if (false) {
    }
    else if (value.equals("None")) {
      i = 0;
    }
    else if (value.equals("isLogged")) {
      i = 1;
    }
    else if (value.equals("notLogged")) {
      i = 2;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return getConditionLabel(value, channel.getLanguage());
  }

  public static String getConditionLabel(String value) {
    String[] conditionLabels = getConditionLabels();
    if (false) {
    }
    else if (value.equals("None")) {
      return conditionLabels[0];
    }
    else if (value.equals("isLogged")) {
      return conditionLabels[1];
    }
    else if (value.equals("notLogged")) {
      return conditionLabels[2];
    }
    return "???";
  }
  public static EnumerateFormReport getConditionReport(SortedSet<AbstractCollection> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (AbstractCollection obj : set) {
      if (obj == null || obj.getCondition() == null) {
        continue;
      }
      for(int i = 0; i < obj.getCondition().length; i++) {
        if (obj.getCondition()[i] != null) {
          map.inc(obj.getCondition()[i]);
        }
      }
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }
  // ----------------------------------------------------------------------
  // cssId
  // ----------------------------------------------------------------------

  protected  String cssId = channel.getTypeFieldEntry(AbstractCollection.class, "cssId", true).getDefaultTextString();

  @Override
public String getCssId() { return cssId; }

  @Override
public void setCssId(String v) { cssId = v; }



  public String getCssId(String lang) { return cssId; }
  public String getCssId(String lang, boolean useDefault) { return cssId; }
  // ----------------------------------------------------------------------
  // cssClasses
  // ----------------------------------------------------------------------

  protected  String cssClasses = channel.getTypeFieldEntry(AbstractCollection.class, "cssClasses", true).getDefaultTextString();

  @Override
public String getCssClasses() { return cssClasses; }

  @Override
public void setCssClasses(String v) { cssClasses = v; }



  public String getCssClasses(String lang) { return cssClasses; }
  public String getCssClasses(String lang, boolean useDefault) { return cssClasses; }

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
    sb.ensureCapacity(500 * (0 + 3 + 0 + 0 + 0 + 0) );
    if (description != null) {
      sb.append(description); sb.append(' ');
    }
    if (descriptionML != null) {
      for (String str : descriptionML.values()) {
        if (str != null) {
          sb.append(str); sb.append(' ');
        }
      }
    }
    if (portletImage != null) {
      sb.append(portletImage); sb.append(' ');
    }
    if (portletImageML != null) {
      for (String str : portletImageML.values()) {
        if (str != null) {
          sb.append(str); sb.append(' ');
        }
      }
    }
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
    sb.ensureCapacity(500 * (0 + 1 + 0 + 0 + 0 + 0) );
    if (description != null && !JHTMLUtils.isJHTML(null, description)) {
      sb.append(description); sb.append(' ');
    }
    if (descriptionML != null) {
      for (String str : descriptionML.values()) {
        if (str != null && !JHTMLUtils.isJHTML(null, str)) {
          sb.append(str); sb.append(' ');
        }
      }
    }
    return sb.toString();
  }

  @Override
  public String getAllWysiwygText() {
    StringBuffer sb = new StringBuffer(super.getAllWysiwygText());
    sb.ensureCapacity(500 * (0 + 0 + 0 + 0 + 0 + 0) );
    // Wiki fields containing JHTML
    if (description != null && JHTMLUtils.isJHTML(null, description)) {
      sb.append(description); sb.append(' ');
    }
    if (descriptionML != null) {
      for (String str : descriptionML.values()) {
        if (str != null && JHTMLUtils.isJHTML(null, str)) {
          sb.append(str); sb.append(' ');
        }
      }
    }
   // Wysiwyg fields
    return sb.toString();
  }

  @Override
  public <T extends Data> TreeSet<T> getLinkDataSet(Class<T> clazz) {
    if (clazz == null) {
      return Util.emptyTreeSet();
    }
    TreeSet<T> set = new TreeSet<>();
    JcmsUtil.addData(set, clazz, getChildren());
    JcmsUtil.addData(set, clazz, getOriginalPortlet());
    return set;
  }
  // ----------------------------------------------------------------------
  // DataController
  // ----------------------------------------------------------------------
  static Pattern _widthPattern;
  static {
    try {
      _widthPattern = (new Perl5Compiler()).compile("[\\d]+\\s*(pt|pc|in|mm|cm|px|em|ex|%)*", Perl5Compiler.CASE_INSENSITIVE_MASK);
    }
    catch(org.apache.oro.text.regex.MalformedPatternException ex) {
      // Empty
    }
  }

  public boolean checkPatternWidth() {
    if (Util.notEmpty(width) && !(new Perl5Matcher()).matches(width, _widthPattern)) {
      return false;
    }
    return true;
  }

  @Override
public ControllerStatus checkIntegrity() {

    ControllerStatus status = super.checkIntegrity();
    if (status.hasFailed()) {
      return status;
    }

    if (!checkPatternWidth()) {
      status = new ControllerStatus();
      status.setProp("msg.edit.bad-field-format", channel.getTypeFieldLabel(this, "width"), "[\\d]+\\s*(pt|pc|in|mm|cm|px|em|ex|%)*");
      return status;
    }
    if (insetLeft < 0 ) {
      status = new ControllerStatus();
      status.setProp("msg.edit.lesser-number", channel.getTypeFieldLabel(this, "insetLeft"), "0");
      return status;
    }
    if (insetLeft > 1000 ) {
      status = new ControllerStatus();
      status.setProp("msg.edit.greater-number", channel.getTypeFieldLabel(this, "insetLeft"), "1000");
      return status;
    }
    if (insetRight < 0 ) {
      status = new ControllerStatus();
      status.setProp("msg.edit.lesser-number", channel.getTypeFieldLabel(this, "insetRight"), "0");
      return status;
    }
    if (insetRight > 1000 ) {
      status = new ControllerStatus();
      status.setProp("msg.edit.greater-number", channel.getTypeFieldLabel(this, "insetRight"), "1000");
      return status;
    }
    if (insetTop < 0 ) {
      status = new ControllerStatus();
      status.setProp("msg.edit.lesser-number", channel.getTypeFieldLabel(this, "insetTop"), "0");
      return status;
    }
    if (insetTop > 1000 ) {
      status = new ControllerStatus();
      status.setProp("msg.edit.greater-number", channel.getTypeFieldLabel(this, "insetTop"), "1000");
      return status;
    }
    if (insetBottom < 0 ) {
      status = new ControllerStatus();
      status.setProp("msg.edit.lesser-number", channel.getTypeFieldLabel(this, "insetBottom"), "0");
      return status;
    }
    if (insetBottom > 1000 ) {
      status = new ControllerStatus();
      status.setProp("msg.edit.greater-number", channel.getTypeFieldLabel(this, "insetBottom"), "1000");
      return status;
    }
    if (cellPadding < 0 ) {
      status = new ControllerStatus();
      status.setProp("msg.edit.lesser-number", channel.getTypeFieldLabel(this, "cellPadding"), "0");
      return status;
    }
    if (cellPadding > 1000 ) {
      status = new ControllerStatus();
      status.setProp("msg.edit.greater-number", channel.getTypeFieldLabel(this, "cellPadding"), "1000");
      return status;
    }
    if (border < 0 ) {
      status = new ControllerStatus();
      status.setProp("msg.edit.lesser-number", channel.getTypeFieldLabel(this, "border"), "0");
      return status;
    }
    if (border > 100 ) {
      status = new ControllerStatus();
      status.setProp("msg.edit.greater-number", channel.getTypeFieldLabel(this, "border"), "100");
      return status;
    }
    return ControllerStatus.OK;
  }


  // ----------------------------------------------------------------------
  // WorkCopy
  // ----------------------------------------------------------------------
  @Override
protected void prepareMergeCopy(Publication mergeCopy) {
    super.prepareMergeCopy(mergeCopy);
    ((AbstractCollection)mergeCopy).setChildren(getChildren());
    ((AbstractCollection)mergeCopy).setChildrenBindings(getChildrenBindings());
    ((AbstractCollection)mergeCopy).setDescription(getDescription());
    ((AbstractCollection)mergeCopy).setDescriptionML(JcmsUtil.getMergedMLMap(getDescriptionML(), ((AbstractCollection)mergeCopy).getDescriptionML()));
    ((AbstractCollection)mergeCopy).setPortletImage(getPortletImage());
    ((AbstractCollection)mergeCopy).setPortletImageML(JcmsUtil.getMergedMLMap(getPortletImageML(), ((AbstractCollection)mergeCopy).getPortletImageML()));
    ((AbstractCollection)mergeCopy).setCacheType(getCacheType());
    ((AbstractCollection)mergeCopy).setCacheSensibility(getCacheSensibility());
    ((AbstractCollection)mergeCopy).setInvalidClass(getInvalidClass());
    ((AbstractCollection)mergeCopy).setInvalidTime(getInvalidTime());
    ((AbstractCollection)mergeCopy).setDisplayCSS(getDisplayCSS());
    ((AbstractCollection)mergeCopy).setWidth(getWidth());
    ((AbstractCollection)mergeCopy).setInsetLeft(getInsetLeft());
    ((AbstractCollection)mergeCopy).setInsetRight(getInsetRight());
    ((AbstractCollection)mergeCopy).setInsetTop(getInsetTop());
    ((AbstractCollection)mergeCopy).setInsetBottom(getInsetBottom());
    ((AbstractCollection)mergeCopy).setCellPadding(getCellPadding());
    ((AbstractCollection)mergeCopy).setAlignH(getAlignH());
    ((AbstractCollection)mergeCopy).setAlignV(getAlignV());
    ((AbstractCollection)mergeCopy).setAlignTable(getAlignTable());
    ((AbstractCollection)mergeCopy).setBorder(getBorder());
    ((AbstractCollection)mergeCopy).setBorderColor(getBorderColor());
    ((AbstractCollection)mergeCopy).setBackColor(getBackColor());
    ((AbstractCollection)mergeCopy).setBackImage(getBackImage());
    ((AbstractCollection)mergeCopy).setBehaviorCopy(getBehaviorCopy());
    ((AbstractCollection)mergeCopy).setOriginalPortlet(getOriginalPortlet());
    ((AbstractCollection)mergeCopy).setCondition(getCondition());
    ((AbstractCollection)mergeCopy).setCssId(getCssId());
    ((AbstractCollection)mergeCopy).setCssClasses(getCssClasses());
  }
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// Xfmnt/8GvBf3/imc8a5u/w==
