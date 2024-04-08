// This file has been automatically generated.

package generated;

import java.util.HashMap;
import java.util.Set;
import java.util.TreeSet;

import com.jalios.jcms.Category;
import com.jalios.jcms.ControllerStatus;
import com.jalios.jcms.Data;
import com.jalios.jcms.FileDocument;
import com.jalios.jcms.JcmsUtil;
import com.jalios.jcms.Member;
import com.jalios.jcms.Publication;
import com.jalios.jcms.TypeEntry;
import com.jalios.jcms.TypeFieldEntry;
import com.jalios.jcms.mashup.ExportUtil;
import com.jalios.jcms.mashup.ImportOptions;
import com.jalios.jcms.mashup.ImportUtil;
import com.jalios.util.LangProperty;
import com.jalios.util.Util;

@SuppressWarnings({"unchecked", "unused"})
public  class PortletSignUp extends generated.AbstractPortletSkinable
             implements
                com.jalios.jstore.Searchable
{

  // ----------------------------------------------------------------------
  // CONSTRUCTORS
  // ----------------------------------------------------------------------
  public PortletSignUp() {}


  public PortletSignUp(AbstractPortletSkinable other) {
    super(other);
  }




  public PortletSignUp(PortletSignUp other) {
    super(other);
    intro = other.intro;
    introML = other.introML;
    label = other.label;
    labelML = other.labelML;
    displayPortal = other.displayPortal;
  }

  // ----------------------------------------------------------------------
  // Import / Export
  // ----------------------------------------------------------------------
  @Override
public void importXml(org.jdom.Element elt, ImportOptions options) {
    super.importXml(elt, options);

    setIntro(ImportUtil.parseFieldText(elt, "intro"));
    setIntroML(ImportUtil.parseFieldTextML(elt, "introML"));
    setLabel(ImportUtil.parseFieldText(elt, "label"));
    setLabelML(ImportUtil.parseFieldTextML(elt, "labelML"));
  }

  @Override
protected void importXmlFieldsWithReferences(org.jdom.Element elt, ImportOptions options) {
    super.importXmlFieldsWithReferences(elt, options);

    if (options.isSelfImport()) {
      setDisplayPortal(ImportUtil.parseSelfFieldData(elt, "displayPortal", generated.PortletPortal.class));
    } else {

    setDisplayPortal((generated.PortletPortal)ImportUtil.parseFieldData(elt, "displayPortal"));
    }
  }

  @Override
public void exportXmlField(StringBuffer sb, int indentLevel) {
    super.exportXmlField(sb, indentLevel);
    sb.append(ExportUtil.exportField(indentLevel, "intro", getIntro(), "introML", true, true));
    sb.append(ExportUtil.exportField(indentLevel, "introML", getIntroML(), true));
    sb.append(ExportUtil.exportField(indentLevel, "label", getLabel(), "labelML", false, true));
    sb.append(ExportUtil.exportField(indentLevel, "labelML", getLabelML(), true));
    sb.append(ExportUtil.exportField(indentLevel, "displayPortal", getDisplayPortal()));
  }

  @Override
public Set<FileDocument> getDocumentLinkSet() {
    Set<FileDocument> docSet = super.getDocumentLinkSet();
    return docSet;
  }

  // ----------------------------------------------------------------------
  // TYPE AND FIELD INFOS (static methods)
  // ----------------------------------------------------------------------
  /**
   * Returns the TypeEntry bound to <code>PortletSignUp</code>. <br>
   * @see com.jalios.jcms.Channel#getTypeEntry(Class)
   * @since jcms-5.5
   */
  public static TypeEntry getTypeEntry() {
    return channel.getTypeEntry(PortletSignUp.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>PortletSignUp</code>. <br>
   * This array <strong>does not</strong> contain inherited TypeFieldEntry from super classes of <code>PortletSignUp</code>. <br/>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>PortletSignUp</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getTypeFieldEntries() {
    return channel.getTypeFieldEntries(PortletSignUp.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>PortletSignUp</code>. <br>
   * This array <strong>does</strong> contain inherited TypeFieldEntry from super classes of <code>PortletSignUp</code>. <br>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>PortletSignUp</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getAllTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getAllTypeFieldEntries() {
    return channel.getAllTypeFieldEntries(PortletSignUp.class);
  }
  // ----------------------------------------------------------------------
  // FIELDs VALUE
  // ----------------------------------------------------------------------
  /**
   * Gets the value of the given <code>int</code> field name for the current <code>PortletSignUp</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public int getIntFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getIntFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>int</code> field name for the current <code>PortletSignUp</code>.
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
   * Gets the value of the given <code>long</code> field name for the current <code>PortletSignUp</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public long getLongFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getLongFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>long</code> field name for the current <code>PortletSignUp</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0
   */
  @Override
public void setLongFieldValue(String fieldName, long value) throws NoSuchFieldException {
    super.setLongFieldValue(fieldName, value);
  }

  /**
   * Gets the value of the given <code>double</code> field name for the current <code>PortletSignUp</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public double getDoubleFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getDoubleFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>double</code> field name for the current <code>PortletSignUp</code>.
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
   * Gets the value of the given <code>boolean</code> field name for the current <code>PortletSignUp</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public boolean getBooleanFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getBooleanFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>boolean</code> field name for the current <code>PortletSignUp</code>.
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
   * Gets the <code>Object</code> value of the given field name for this <code>PortletSignUp</code>. <br>
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
    if ("intro".equals(fieldName)) { return getIntro(lang, useDefault); }
    if ("label".equals(fieldName)) { return getLabel(lang, useDefault); }
    if ("displayPortal".equals(fieldName)) { return getDisplayPortal(); }
    return super.getFieldValue(fieldName, lang, useDefault);
  }

  /**
   * Sets the <code>Object</code> value of the given field name for this <code>PortletSignUp</code>. <br>
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
    if ("intro".equals(fieldName)) { setIntro(lang,(String)value); return; }
    if ("label".equals(fieldName)) { setLabel(lang,(String)value); return; }
    if ("displayPortal".equals(fieldName)) { setDisplayPortal((generated.PortletPortal)value); return; }
    super.setFieldValue(fieldName, value, lang);
  }

  // ----------------------------------------------------------------------
  // intro
  // ----------------------------------------------------------------------

  protected  String intro = channel.getTypeFieldEntry(PortletSignUp.class, "intro", true).getDefaultTextString();

  public String getIntro() { return intro; }

  public void setIntro(String v) { intro = v; }




  protected HashMap<String,String> introML = channel.getTypeFieldEntry(PortletSignUp.class, "intro", true).getDefaultTextMap();
  public String getIntro(String lang) { return channel.getLangValue(lang, true, intro, introML, getMainLanguage()); }
  public String getIntro(String lang, boolean useDefault) { return channel.getLangValue(lang, useDefault, intro, introML, getMainLanguage()); }
  public HashMap<String,String> getIntroML() { return introML; }
  public void setIntroML(HashMap<String,String> v) { introML = v; }

  public String getIntroMLE() {
    return JcmsUtil.encodeMLE(getIntroML());
  }

  public void setIntroMLE(String v) {
    setIntroML(JcmsUtil.decodeMLE(v));
  }

  public void setIntro(String lang, String value) {
    if (channel.getLanguage().equals(lang)) {
      intro = value;
      return;
    }
    if (introML == null) {
      introML = new HashMap<>();
    } else if (this != channel.getData(id)) {
      introML = new HashMap<>(introML);
    }
    introML.put(lang, value);
  }
  // ----------------------------------------------------------------------
  // label
  // ----------------------------------------------------------------------

  protected  String label = channel.getTypeFieldEntry(PortletSignUp.class, "label", true).getDefaultTextString();

  public String getLabel() { return label; }

  public void setLabel(String v) { label = v; }




  protected HashMap<String,String> labelML = channel.getTypeFieldEntry(PortletSignUp.class, "label", true).getDefaultTextMap();
  public String getLabel(String lang) { return channel.getLangValue(lang, true, label, labelML, getMainLanguage()); }
  public String getLabel(String lang, boolean useDefault) { return channel.getLangValue(lang, useDefault, label, labelML, getMainLanguage()); }
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
  // displayPortal
  // ----------------------------------------------------------------------

  protected  generated.PortletPortal displayPortal;

  public generated.PortletPortal getDisplayPortal() { return displayPortal; }

  public void setDisplayPortal(generated.PortletPortal v) { displayPortal = v; }




  // ----------------------------------------------------------------------
  // abstract
  // ----------------------------------------------------------------------
  @Override
  public void setAbstract(String lang, String value) { setIntro(lang, value); }
  @Override
  public String getAbstract() { return intro; }
  @Override
  public String getAbstract(String lang, boolean useDefault) { return getIntro(lang, useDefault); }
  @Override
  public HashMap<String,String> getAbstractML() { return getIntroML(); }

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

  @Override
  public <T extends Data> TreeSet<T> getLinkDataSet(Class<T> clazz) {
    if (clazz == null) {
      return Util.emptyTreeSet();
    }
    TreeSet<T> set = new TreeSet<>();
    JcmsUtil.addData(set, clazz, getDisplayPortal());
    JcmsUtil.addData(set, clazz, getOriginalPortlet());
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

    if (Util.isEmpty(getFieldInMainLanguage(label, labelML))) {
      status = new ControllerStatus();
      status.setProp("msg.edit.empty-fieldml", channel.getTypeFieldLabel(this, "label"), new LangProperty("lang." + getMainLanguage()));
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
    ((PortletSignUp)mergeCopy).setIntro(getIntro());
    ((PortletSignUp)mergeCopy).setIntroML(JcmsUtil.getMergedMLMap(getIntroML(), ((PortletSignUp)mergeCopy).getIntroML()));
    ((PortletSignUp)mergeCopy).setLabel(getLabel());
    ((PortletSignUp)mergeCopy).setLabelML(JcmsUtil.getMergedMLMap(getLabelML(), ((PortletSignUp)mergeCopy).getLabelML()));
    ((PortletSignUp)mergeCopy).setDisplayPortal(getDisplayPortal());
  }
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// KHXb4rFmHZhqaxi7s7/vgA==
