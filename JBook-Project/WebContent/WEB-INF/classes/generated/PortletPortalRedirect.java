// This file has been automatically generated.

package generated;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.SortedSet;
import java.util.TreeSet;

import com.jalios.jcms.Category;
import com.jalios.jcms.ControllerStatus;
import com.jalios.jcms.Data;
import com.jalios.jcms.EnumerateFormReport;
import com.jalios.jcms.FileDocument;
import com.jalios.jcms.JcmsUtil;
import com.jalios.jcms.Member;
import com.jalios.jcms.Publication;
import com.jalios.jcms.TypeEntry;
import com.jalios.jcms.TypeFieldEntry;
import com.jalios.jcms.db.DBData;
import com.jalios.jcms.mashup.ExportUtil;
import com.jalios.jcms.mashup.ImportOptions;
import com.jalios.jcms.mashup.ImportUtil;
import com.jalios.jcms.wysiwyg.JHTMLUtils;
import com.jalios.util.ObjectIntTreeMap;
import com.jalios.util.Util;

@SuppressWarnings({"unchecked", "unused"})
public  class PortletPortalRedirect extends com.jalios.jcms.portlet.PortalRedirect
             implements
                com.jalios.jstore.Searchable
{

  // ----------------------------------------------------------------------
  // CONSTRUCTORS
  // ----------------------------------------------------------------------
  public PortletPortalRedirect() {}






  public PortletPortalRedirect(PortletPortalRedirect other) {
    super(other);
    status = other.status;
    content = other.content;
    contentDBID = other.contentDBID;
    redirectForm = other.redirectForm;
    url = other.url;
    urlML = other.urlML;
    redirectPortlet = other.redirectPortlet;
    category = other.category;
    dispPortal = other.dispPortal;
    description = other.description;
    descriptionML = other.descriptionML;
    portletImage = other.portletImage;
    portletImageML = other.portletImageML;
    cacheType = other.cacheType;
    cacheSensibility = other.cacheSensibility;
    invalidClass = other.invalidClass;
    invalidTime = other.invalidTime;
    behaviorCopy = other.behaviorCopy;
    cssId = other.cssId;
    cssClasses = other.cssClasses;
    exactCategory = other.exactCategory;
  }

  // ----------------------------------------------------------------------
  // Import / Export
  // ----------------------------------------------------------------------
  @Override
public void importXml(org.jdom.Element elt, ImportOptions options) {
    super.importXml(elt, options);

    setStatus(ImportUtil.parseFieldText(elt, "status"));
    setRedirectForm(ImportUtil.parseFieldText(elt, "redirectForm"));
    setUrl(ImportUtil.parseFieldText(elt, "url"));
    setUrlML(ImportUtil.parseFieldTextML(elt, "urlML"));
    setCategory(ImportUtil.parseFieldText(elt, "category"));
    setPortletImage(ImportUtil.parseFieldText(elt, "portletImage"));
    setPortletImageML(ImportUtil.parseFieldTextML(elt, "portletImageML"));
    setCacheType(ImportUtil.parseFieldText(elt, "cacheType"));
    setCacheSensibility(ImportUtil.parseFieldText(elt, "cacheSensibility"));
    setInvalidClass(ImportUtil.parseFieldTextArray(elt, "invalidClass"));
    setInvalidTime(ImportUtil.parseFieldLong(elt, "invalidTime"));
    setBehaviorCopy(ImportUtil.parseFieldText(elt, "behaviorCopy"));
    setCssId(ImportUtil.parseFieldText(elt, "cssId"));
    setCssClasses(ImportUtil.parseFieldText(elt, "cssClasses"));
    setExactCategory(ImportUtil.parseFieldBoolean(elt, "exactCategory"));
  }

  @Override
protected void importXmlFieldsWithReferences(org.jdom.Element elt, ImportOptions options) {
    super.importXmlFieldsWithReferences(elt, options);

    if (options.isSelfImport()) {
      setContent(ImportUtil.parseSelfFieldData(elt, "content", com.jalios.jcms.Content.class));
      setRedirectPortlet(ImportUtil.parseSelfFieldData(elt, "redirectPortlet", com.jalios.jcms.portlet.PortalElement.class));
      setDispPortal(ImportUtil.parseSelfFieldData(elt, "dispPortal", com.jalios.jcms.portlet.PortalElement.class));
      setDescription(ImportUtil.parseFieldText(elt, "description"));
      setDescriptionML(ImportUtil.parseFieldTextML(elt, "descriptionML"));
    } else {

    setContent((com.jalios.jcms.Content)ImportUtil.parseFieldData(elt, "content"));
    setDescriptionML(ImportUtil.parseFieldWikiML(elt, "descriptionML"));
    setDescription(ImportUtil.parseFieldWiki(elt, "description"));
    }
  }

  @Override
public void exportXmlField(StringBuffer sb, int indentLevel) {
    super.exportXmlField(sb, indentLevel);
    sb.append(ExportUtil.exportField(indentLevel, "status", getStatus(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "content", getContent()));
    sb.append(ExportUtil.exportField(indentLevel, "redirectForm", getRedirectForm(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "url", getUrl(), "urlML", false, true));
    sb.append(ExportUtil.exportField(indentLevel, "urlML", getUrlML(), true));
    sb.append(ExportUtil.exportField(indentLevel, "redirectPortlet", getRedirectPortlet()));
    sb.append(ExportUtil.exportField(indentLevel, "category", getCategory(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "dispPortal", getDispPortal()));
    sb.append(ExportUtil.exportField(indentLevel, "description", getDescription(), "descriptionML", true, true));
    sb.append(ExportUtil.exportField(indentLevel, "descriptionML", getDescriptionML(), true));
    sb.append(ExportUtil.exportField(indentLevel, "portletImage", getPortletImage(), "portletImageML", false, true));
    sb.append(ExportUtil.exportField(indentLevel, "portletImageML", getPortletImageML(), true));
    sb.append(ExportUtil.exportField(indentLevel, "cacheType", getCacheType(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "cacheSensibility", getCacheSensibility(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "invalidClass", getInvalidClass(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "invalidTime", getInvalidTime()));
    sb.append(ExportUtil.exportField(indentLevel, "behaviorCopy", getBehaviorCopy(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "cssId", getCssId(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "cssClasses", getCssClasses(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "exactCategory", getExactCategory()));
  }

  @Override
public Set<FileDocument> getDocumentLinkSet() {
    Set<FileDocument> docSet = super.getDocumentLinkSet();
    JcmsUtil.addFileDocument(docSet, portletImage, portletImageML);
    return docSet;
  }

  // ----------------------------------------------------------------------
  // TYPE AND FIELD INFOS (static methods)
  // ----------------------------------------------------------------------
  /**
   * Returns the TypeEntry bound to <code>PortletPortalRedirect</code>. <br>
   * @see com.jalios.jcms.Channel#getTypeEntry(Class)
   * @since jcms-5.5
   */
  public static TypeEntry getTypeEntry() {
    return channel.getTypeEntry(PortletPortalRedirect.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>PortletPortalRedirect</code>. <br>
   * This array <strong>does not</strong> contain inherited TypeFieldEntry from super classes of <code>PortletPortalRedirect</code>. <br/>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>PortletPortalRedirect</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getTypeFieldEntries() {
    return channel.getTypeFieldEntries(PortletPortalRedirect.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>PortletPortalRedirect</code>. <br>
   * This array <strong>does</strong> contain inherited TypeFieldEntry from super classes of <code>PortletPortalRedirect</code>. <br>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>PortletPortalRedirect</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getAllTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getAllTypeFieldEntries() {
    return channel.getAllTypeFieldEntries(PortletPortalRedirect.class);
  }
  // ----------------------------------------------------------------------
  // FIELDs VALUE
  // ----------------------------------------------------------------------
  /**
   * Gets the value of the given <code>int</code> field name for the current <code>PortletPortalRedirect</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public int getIntFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getIntFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>int</code> field name for the current <code>PortletPortalRedirect</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0
   */
  @Override
public void setIntFieldValue(String fieldName, int value) throws NoSuchFieldException {
    super.setIntFieldValue(fieldName, value);
  }

  /**
   * Gets the value of the given <code>long</code> field name for the current <code>PortletPortalRedirect</code>.
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
   * Sets the value of the given <code>long</code> field name for the current <code>PortletPortalRedirect</code>.
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
   * Gets the value of the given <code>double</code> field name for the current <code>PortletPortalRedirect</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public double getDoubleFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getDoubleFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>double</code> field name for the current <code>PortletPortalRedirect</code>.
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
   * Gets the value of the given <code>boolean</code> field name for the current <code>PortletPortalRedirect</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public boolean getBooleanFieldValue(String fieldName) throws NoSuchFieldException {
    if ("exactCategory".equals(fieldName)) { return getExactCategory(); }
    return super.getBooleanFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>boolean</code> field name for the current <code>PortletPortalRedirect</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0
   */
  @Override
public void setBooleanFieldValue(String fieldName, boolean value) throws NoSuchFieldException {
    if ("exactCategory".equals(fieldName)) { setExactCategory(value); return; }
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
    if ("navCategories".equals(fieldName)) { return getNavCategories(mbr); }
    return super.getCategoryFieldValue(fieldName, mbr);
  }
  /**
   * Gets the <code>Object</code> value of the given field name for this <code>PortletPortalRedirect</code>. <br>
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
    if ("status".equals(fieldName)) { return getStatus(); }
    if ("content".equals(fieldName)) { return getContent(); }
    if ("redirectForm".equals(fieldName)) { return getRedirectForm(); }
    if ("url".equals(fieldName)) { return getUrl(lang, useDefault); }
    if ("redirectPortlet".equals(fieldName)) { return getRedirectPortlet(); }
    if ("category".equals(fieldName)) { return getCategory(); }
    if ("dispPortal".equals(fieldName)) { return getDispPortal(); }
    if ("description".equals(fieldName)) { return getDescription(lang, useDefault); }
    if ("portletImage".equals(fieldName)) { return getPortletImage(lang, useDefault); }
    if ("cacheType".equals(fieldName)) { return getCacheType(); }
    if ("cacheSensibility".equals(fieldName)) { return getCacheSensibility(); }
    if ("invalidClass".equals(fieldName)) { return getInvalidClass(); }
    if ("behaviorCopy".equals(fieldName)) { return getBehaviorCopy(); }
    if ("cssId".equals(fieldName)) { return getCssId(); }
    if ("cssClasses".equals(fieldName)) { return getCssClasses(); }
    return super.getFieldValue(fieldName, lang, useDefault);
  }

  /**
   * Sets the <code>Object</code> value of the given field name for this <code>PortletPortalRedirect</code>. <br>
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
    if ("status".equals(fieldName)) { setStatus((String)value); return; }
    if ("content".equals(fieldName)) { setContent((com.jalios.jcms.Content)value); return; }
    if ("redirectForm".equals(fieldName)) { setRedirectForm((String)value); return; }
    if ("url".equals(fieldName)) { setUrl(lang,(String)value); return; }
    if ("redirectPortlet".equals(fieldName)) { setRedirectPortlet((com.jalios.jcms.portlet.PortalElement)value); return; }
    if ("category".equals(fieldName)) { setCategory((String)value); return; }
    if ("dispPortal".equals(fieldName)) { setDispPortal((com.jalios.jcms.portlet.PortalElement)value); return; }
    if ("description".equals(fieldName)) { setDescription(lang,(String)value); return; }
    if ("portletImage".equals(fieldName)) { setPortletImage(lang,(String)value); return; }
    if ("cacheType".equals(fieldName)) { setCacheType((String)value); return; }
    if ("cacheSensibility".equals(fieldName)) { setCacheSensibility((String)value); return; }
    if ("invalidClass".equals(fieldName)) { setInvalidClass((String[])value); return; }
    if ("behaviorCopy".equals(fieldName)) { setBehaviorCopy((String)value); return; }
    if ("cssId".equals(fieldName)) { setCssId((String)value); return; }
    if ("cssClasses".equals(fieldName)) { setCssClasses((String)value); return; }
    super.setFieldValue(fieldName, value, lang);
  }

  // ----------------------------------------------------------------------
  // status
  // ----------------------------------------------------------------------

  protected  String status = channel.getTypeFieldEntry(PortletPortalRedirect.class, "status", true).getDefaultTextString();

  @Override
public String getStatus() { return status; }

  @Override
public void setStatus(String v) { status = v; }



  public String getStatus(String lang) { return status; }
  public String getStatus(String lang, boolean useDefault) { return status; }
  // ----------------------------------------------------------------------
  // content
  // ----------------------------------------------------------------------

  protected  com.jalios.jcms.Content content;

  @Override
public com.jalios.jcms.Content getContent() {
    return getContent(true);
  }
  public com.jalios.jcms.Content getContent(boolean queryDB) {
   if (content != null) {
      return content;
    }
    if (queryDB && Util.notEmpty(contentDBID)) {
      return channel.getData(com.jalios.jcms.Content.class, contentDBID);
    }
    return null;
  }
  protected String contentDBID;
  public String getContentDBID() { return contentDBID; }
  @Override
public void setContent(com.jalios.jcms.Content v) {
    if (v == null) {
      content = null;
      contentDBID =null;
      return;
    }

    if (v instanceof DBData) {
      setContentDBID(v.getId());
    } else {
      content = v;
    }
  }
  public void setContentDBID(String v) {
    contentDBID = v;
    if (Util.notEmpty(contentDBID)) {
      content = null;
    }
  }


  // ----------------------------------------------------------------------
  // redirectForm
  // ----------------------------------------------------------------------

  protected  String redirectForm = channel.getTypeFieldEntry(PortletPortalRedirect.class, "redirectForm", true).getDefaultTextString();

  @Override
public String getRedirectForm() { return redirectForm; }

  @Override
public void setRedirectForm(String v) { redirectForm = v; }



  public String getRedirectForm(String lang) { return redirectForm; }
  public String getRedirectForm(String lang, boolean useDefault) { return redirectForm; }
  private static String[] redirectFormValues;
  private static String[] redirectFormLabels;
  private static Map<String, String[]> redirectFormLabelsMap;

  public static String[] getRedirectFormValues() {
    if(redirectFormValues == null) {
      setRedirectFormValues(channel.getTypeFieldEntry(PortletPortalRedirect.class, "redirectForm", true).getEnumerateValues());
    }
    return redirectFormValues;
  }
  public static void setRedirectFormValues(String[] values) {
    redirectFormValues = values;
  }
  public static String[] getRedirectFormLabels() {
    if(redirectFormLabels == null) {
      setRedirectFormLabels(channel.getTypeFieldEntry(PortletPortalRedirect.class, "redirectForm", true).getEnumerateLabels());
    }
    return redirectFormLabels;
  }
  public static void setRedirectFormLabels(String[] labels) {
    redirectFormLabels = labels;
  }
  public static Map<String, String[]> getRedirectFormLabelsMap() {
    if(redirectFormLabelsMap == null) {
      setRedirectFormLabelsMap(channel.getTypeFieldEntry(PortletPortalRedirect.class, "redirectForm", true).getEnumerateLabelsMap());
    }
    return redirectFormLabelsMap;
  }
  public static void setRedirectFormLabelsMap(Map<String, String[]> LabelsMap) {
    redirectFormLabelsMap = LabelsMap;
  }
  public static String[] getRedirectFormLabels(String userLang) {
    Map<String, String[]> redirectFormLabelMap = getRedirectFormLabelsMap();
    String[] labels = redirectFormLabelMap.get(userLang);
    if (labels == null) {
      labels = redirectFormLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getRedirectFormLabel(String value, String userLang) {
    String[] labels = getRedirectFormLabels(userLang);
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
    return getRedirectFormLabel(value, channel.getLanguage());
  }

  public static String getRedirectFormLabel(String value) {
    String[] redirectFormLabels = getRedirectFormLabels();
    if (false) {
    }
    else if (value.equals("value1")) {
      return redirectFormLabels[0];
    }
    else if (value.equals("value2")) {
      return redirectFormLabels[1];
    }
    else if (value.equals("value3")) {
      return redirectFormLabels[2];
    }
    return "???";
  }
  public static EnumerateFormReport getRedirectFormReport(SortedSet<PortletPortalRedirect> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (PortletPortalRedirect obj : set) {
      if (obj == null) {
        continue;
      }

      map.inc("" + obj.getRedirectForm());

      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }
  // ----------------------------------------------------------------------
  // url
  // ----------------------------------------------------------------------

  protected  String url = channel.getTypeFieldEntry(PortletPortalRedirect.class, "url", true).getDefaultTextString();

  @Override
public String getUrl() { return url; }

  @Override
public void setUrl(String v) { url = v; }




  protected HashMap<String,String> urlML = channel.getTypeFieldEntry(PortletPortalRedirect.class, "url", true).getDefaultTextMap();
  @Override
public String getUrl(String lang) { return channel.getLangValue(lang, true, url, urlML, getMainLanguage()); }
  public String getUrl(String lang, boolean useDefault) { return channel.getLangValue(lang, useDefault, url, urlML, getMainLanguage()); }
  public HashMap<String,String> getUrlML() { return urlML; }
  public void setUrlML(HashMap<String,String> v) { urlML = v; }

  public String getUrlMLE() {
    return JcmsUtil.encodeMLE(getUrlML());
  }

  public void setUrlMLE(String v) {
    setUrlML(JcmsUtil.decodeMLE(v));
  }

  public void setUrl(String lang, String value) {
    if (channel.getLanguage().equals(lang)) {
      url = value;
      return;
    }
    if (urlML == null) {
      urlML = new HashMap<>();
    } else if (this != channel.getData(id)) {
      urlML = new HashMap<>(urlML);
    }
    urlML.put(lang, value);
  }
  // ----------------------------------------------------------------------
  // redirectPortlet
  // ----------------------------------------------------------------------

  protected  com.jalios.jcms.portlet.PortalElement redirectPortlet;

  @Override
public com.jalios.jcms.portlet.PortalElement getRedirectPortlet() { return redirectPortlet; }

  @Override
public void setRedirectPortlet(com.jalios.jcms.portlet.PortalElement v) { redirectPortlet = v; }



  // ----------------------------------------------------------------------
  // category
  // ----------------------------------------------------------------------

  protected  String category = channel.getTypeFieldEntry(PortletPortalRedirect.class, "category", true).getDefaultTextString();

  @Override
public String getCategory() { return category; }

  @Override
public void setCategory(String v) { category = v; }



  public String getCategory(String lang) { return category; }
  public String getCategory(String lang, boolean useDefault) { return category; }
  // ----------------------------------------------------------------------
  // dispPortal
  // ----------------------------------------------------------------------

  protected  com.jalios.jcms.portlet.PortalElement dispPortal;

  @Override
public com.jalios.jcms.portlet.PortalElement getDispPortal() { return dispPortal; }

  @Override
public void setDispPortal(com.jalios.jcms.portlet.PortalElement v) { dispPortal = v; }



  // ----------------------------------------------------------------------
  // description
  // ----------------------------------------------------------------------

  protected  String description = channel.getTypeFieldEntry(PortletPortalRedirect.class, "description", true).getDefaultTextString();

  public String getDescription() { return description; }

  @Override
public void setDescription(String v) { description = v; }




  protected HashMap<String,String> descriptionML = channel.getTypeFieldEntry(PortletPortalRedirect.class, "description", true).getDefaultTextMap();
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

  protected  String portletImage = channel.getTypeFieldEntry(PortletPortalRedirect.class, "portletImage", true).getDefaultTextString();

  public String getPortletImage() { return portletImage; }

  @Override
public void setPortletImage(String v) { portletImage = v; }




  protected HashMap<String,String> portletImageML = channel.getTypeFieldEntry(PortletPortalRedirect.class, "portletImage", true).getDefaultTextMap();
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

  protected  String cacheType = channel.getTypeFieldEntry(PortletPortalRedirect.class, "cacheType", true).getDefaultTextString();

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
      setCacheTypeValues(channel.getTypeFieldEntry(PortletPortalRedirect.class, "cacheType", true).getEnumerateValues());
    }
    return cacheTypeValues;
  }
  public static void setCacheTypeValues(String[] values) {
    cacheTypeValues = values;
  }
  public static String[] getCacheTypeLabels() {
    if(cacheTypeLabels == null) {
      setCacheTypeLabels(channel.getTypeFieldEntry(PortletPortalRedirect.class, "cacheType", true).getEnumerateLabels());
    }
    return cacheTypeLabels;
  }
  public static void setCacheTypeLabels(String[] labels) {
    cacheTypeLabels = labels;
  }
  public static Map<String, String[]> getCacheTypeLabelsMap() {
    if(cacheTypeLabelsMap == null) {
      setCacheTypeLabelsMap(channel.getTypeFieldEntry(PortletPortalRedirect.class, "cacheType", true).getEnumerateLabelsMap());
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
  public static EnumerateFormReport getCacheTypeReport(SortedSet<PortletPortalRedirect> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (PortletPortalRedirect obj : set) {
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

  protected  String cacheSensibility = channel.getTypeFieldEntry(PortletPortalRedirect.class, "cacheSensibility", true).getDefaultTextString();

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
      setCacheSensibilityValues(channel.getTypeFieldEntry(PortletPortalRedirect.class, "cacheSensibility", true).getEnumerateValues());
    }
    return cacheSensibilityValues;
  }
  public static void setCacheSensibilityValues(String[] values) {
    cacheSensibilityValues = values;
  }
  public static String[] getCacheSensibilityLabels() {
    if(cacheSensibilityLabels == null) {
      setCacheSensibilityLabels(channel.getTypeFieldEntry(PortletPortalRedirect.class, "cacheSensibility", true).getEnumerateLabels());
    }
    return cacheSensibilityLabels;
  }
  public static void setCacheSensibilityLabels(String[] labels) {
    cacheSensibilityLabels = labels;
  }
  public static Map<String, String[]> getCacheSensibilityLabelsMap() {
    if(cacheSensibilityLabelsMap == null) {
      setCacheSensibilityLabelsMap(channel.getTypeFieldEntry(PortletPortalRedirect.class, "cacheSensibility", true).getEnumerateLabelsMap());
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
  public static EnumerateFormReport getCacheSensibilityReport(SortedSet<PortletPortalRedirect> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (PortletPortalRedirect obj : set) {
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
      setInvalidClassValues(channel.getTypeFieldEntry(PortletPortalRedirect.class, "invalidClass", true).getEnumerateValues());
    }
    return invalidClassValues;
  }
  public static void setInvalidClassValues(String[] values) {
    invalidClassValues = values;
  }
  public static String[] getInvalidClassLabels() {
    if(invalidClassLabels == null) {
      setInvalidClassLabels(channel.getTypeFieldEntry(PortletPortalRedirect.class, "invalidClass", true).getEnumerateLabels());
    }
    return invalidClassLabels;
  }
  public static void setInvalidClassLabels(String[] labels) {
    invalidClassLabels = labels;
  }
  public static Map<String, String[]> getInvalidClassLabelsMap() {
    if(invalidClassLabelsMap == null) {
      setInvalidClassLabelsMap(channel.getTypeFieldEntry(PortletPortalRedirect.class, "invalidClass", true).getEnumerateLabelsMap());
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
  public static EnumerateFormReport getInvalidClassReport(SortedSet<PortletPortalRedirect> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (PortletPortalRedirect obj : set) {
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
  // behaviorCopy
  // ----------------------------------------------------------------------

  protected  String behaviorCopy = channel.getTypeFieldEntry(PortletPortalRedirect.class, "behaviorCopy", true).getDefaultTextString();

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
      setBehaviorCopyValues(channel.getTypeFieldEntry(PortletPortalRedirect.class, "behaviorCopy", true).getEnumerateValues());
    }
    return behaviorCopyValues;
  }
  public static void setBehaviorCopyValues(String[] values) {
    behaviorCopyValues = values;
  }
  public static String[] getBehaviorCopyLabels() {
    if(behaviorCopyLabels == null) {
      setBehaviorCopyLabels(channel.getTypeFieldEntry(PortletPortalRedirect.class, "behaviorCopy", true).getEnumerateLabels());
    }
    return behaviorCopyLabels;
  }
  public static void setBehaviorCopyLabels(String[] labels) {
    behaviorCopyLabels = labels;
  }
  public static Map<String, String[]> getBehaviorCopyLabelsMap() {
    if(behaviorCopyLabelsMap == null) {
      setBehaviorCopyLabelsMap(channel.getTypeFieldEntry(PortletPortalRedirect.class, "behaviorCopy", true).getEnumerateLabelsMap());
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
  public static EnumerateFormReport getBehaviorCopyReport(SortedSet<PortletPortalRedirect> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (PortletPortalRedirect obj : set) {
      if (obj == null) {
        continue;
      }

      map.inc("" + obj.getBehaviorCopy());

      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }
  // ----------------------------------------------------------------------
  // cssId
  // ----------------------------------------------------------------------

  protected  String cssId = channel.getTypeFieldEntry(PortletPortalRedirect.class, "cssId", true).getDefaultTextString();

  @Override
public String getCssId() { return cssId; }

  @Override
public void setCssId(String v) { cssId = v; }



  public String getCssId(String lang) { return cssId; }
  public String getCssId(String lang, boolean useDefault) { return cssId; }
  // ----------------------------------------------------------------------
  // cssClasses
  // ----------------------------------------------------------------------

  protected  String cssClasses = channel.getTypeFieldEntry(PortletPortalRedirect.class, "cssClasses", true).getDefaultTextString();

  @Override
public String getCssClasses() { return cssClasses; }

  @Override
public void setCssClasses(String v) { cssClasses = v; }



  public String getCssClasses(String lang) { return cssClasses; }
  public String getCssClasses(String lang, boolean useDefault) { return cssClasses; }
  // ----------------------------------------------------------------------
  // exactCategory
  // ----------------------------------------------------------------------

  protected  boolean exactCategory = true;

  @Override
public boolean getExactCategory() { return exactCategory; }

  @Override
public void setExactCategory(boolean v) { exactCategory = v; }



  public String getExactCategoryLabel(String lang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(this.getClass(), "exactCategory", true);
    return exactCategory ? tfe.getOnLabel(lang) : tfe.getOffLabel(lang);
  }
  public static String[] getExactCategoryValues() {
    return new String[]{ "true" , "false" };
  }

  public static String[] getExactCategoryLabels(String userLang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(PortletPortalRedirect.class, "exactCategory", true);
    String onLabel = tfe.getOnLabel(userLang);
    String offLabel = tfe.getOffLabel(userLang);

    return new String[]{ onLabel, offLabel };
  }
  public static EnumerateFormReport getExactCategoryReport(SortedSet<PortletPortalRedirect> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (PortletPortalRedirect obj : set) {
      if (obj == null) {
        continue;
      }

      map.inc("" + obj.getExactCategory());

      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }

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

  public TreeSet<Category> getNavCategories(Member member) {
    return getDescendantCategorySet(channel.getCategory("j_3"), false, member);
  }
  public Category getFirstNavCategories(Member member) {
    return getFirstDescendantCategory(channel.getCategory("j_3"), false, member);
  }
  @Override
  public <T extends Data> TreeSet<T> getLinkDataSet(Class<T> clazz) {
    if (clazz == null) {
      return Util.emptyTreeSet();
    }
    TreeSet<T> set = new TreeSet<>();
    JcmsUtil.addData(set, clazz, getContent());
    JcmsUtil.addData(set, clazz, getDispPortal());
    JcmsUtil.addData(set, clazz, getRedirectPortlet());
    return set;
  }
  // ----------------------------------------------------------------------
  // DataController
  // ----------------------------------------------------------------------
  @Override
public ControllerStatus checkIntegrity() {

    ControllerStatus status = super.checkIntegrity();
    if (status.hasFailed()) {
      return status;
    }

    if (Util.isEmpty(status)) {
      status = new ControllerStatus();
      status.setProp("msg.edit.empty-field", channel.getTypeFieldLabel(this, "status"), null);
      return status;
    }
    {
      Category fieldRootCat = channel.getCategory("j_3");
      fieldRootCat = fieldRootCat != null ? fieldRootCat : channel.getRootCategory();
      Set catSet = fieldRootCat.getDescendantSet();
      if (Util.interSet(getCategorySet(), catSet).isEmpty()) {
        status = new ControllerStatus();
        status.setProp("msg.edit.empty-field", channel.getTypeFieldLabel(this, "navCategories"));
        return status;
      }
    }
    return ControllerStatus.OK;
  }


  // ----------------------------------------------------------------------
  // WorkCopy
  // ----------------------------------------------------------------------
  @Override
protected void prepareMergeCopy(Publication mergeCopy) {
    super.prepareMergeCopy(mergeCopy);
    ((PortletPortalRedirect)mergeCopy).setStatus(getStatus());
    ((PortletPortalRedirect)mergeCopy).setContent(getContent());
    ((PortletPortalRedirect)mergeCopy).setRedirectForm(getRedirectForm());
    ((PortletPortalRedirect)mergeCopy).setUrl(getUrl());
    ((PortletPortalRedirect)mergeCopy).setUrlML(JcmsUtil.getMergedMLMap(getUrlML(), ((PortletPortalRedirect)mergeCopy).getUrlML()));
    ((PortletPortalRedirect)mergeCopy).setRedirectPortlet(getRedirectPortlet());
    ((PortletPortalRedirect)mergeCopy).setCategory(getCategory());
    ((PortletPortalRedirect)mergeCopy).setDispPortal(getDispPortal());
    ((PortletPortalRedirect)mergeCopy).setDescription(getDescription());
    ((PortletPortalRedirect)mergeCopy).setDescriptionML(JcmsUtil.getMergedMLMap(getDescriptionML(), ((PortletPortalRedirect)mergeCopy).getDescriptionML()));
    ((PortletPortalRedirect)mergeCopy).setPortletImage(getPortletImage());
    ((PortletPortalRedirect)mergeCopy).setPortletImageML(JcmsUtil.getMergedMLMap(getPortletImageML(), ((PortletPortalRedirect)mergeCopy).getPortletImageML()));
    ((PortletPortalRedirect)mergeCopy).setCacheType(getCacheType());
    ((PortletPortalRedirect)mergeCopy).setCacheSensibility(getCacheSensibility());
    ((PortletPortalRedirect)mergeCopy).setInvalidClass(getInvalidClass());
    ((PortletPortalRedirect)mergeCopy).setInvalidTime(getInvalidTime());
    ((PortletPortalRedirect)mergeCopy).setBehaviorCopy(getBehaviorCopy());
    ((PortletPortalRedirect)mergeCopy).setCssId(getCssId());
    ((PortletPortalRedirect)mergeCopy).setCssClasses(getCssClasses());
    ((PortletPortalRedirect)mergeCopy).setExactCategory(getExactCategory());
  }
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// 9OeKTvyXBgqlb/VaVj6LiA==
