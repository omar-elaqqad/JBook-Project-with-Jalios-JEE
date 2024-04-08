// This file has been automatically generated.

package generated;

import java.util.HashMap;
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
import com.jalios.util.ObjectIntTreeMap;
import com.jalios.util.Util;

@SuppressWarnings({"unchecked", "unused"})
public  class PortletPublication extends generated.AbstractPortletSkinable
             implements
                com.jalios.jstore.Searchable
{

  // ----------------------------------------------------------------------
  // CONSTRUCTORS
  // ----------------------------------------------------------------------
  public PortletPublication() {}


  public PortletPublication(AbstractPortletSkinable other) {
    super(other);
  }




  public PortletPublication(PortletPublication other) {
    super(other);
    pub = other.pub;
    pubDBID = other.pubDBID;
    template = other.template;
    showDisplayHeader = other.showDisplayHeader;
    showDisplayFooter = other.showDisplayFooter;
  }

  // ----------------------------------------------------------------------
  // Import / Export
  // ----------------------------------------------------------------------
  @Override
public void importXml(org.jdom.Element elt, ImportOptions options) {
    super.importXml(elt, options);

    setTemplate(ImportUtil.parseFieldText(elt, "template"));
    setShowDisplayHeader(ImportUtil.parseFieldBoolean(elt, "showDisplayHeader"));
    setShowDisplayFooter(ImportUtil.parseFieldBoolean(elt, "showDisplayFooter"));
  }

  @Override
protected void importXmlFieldsWithReferences(org.jdom.Element elt, ImportOptions options) {
    super.importXmlFieldsWithReferences(elt, options);

    if (options.isSelfImport()) {
      setPub(ImportUtil.parseSelfFieldData(elt, "pub", com.jalios.jcms.Publication.class));
    } else {

    setPub((com.jalios.jcms.Publication)ImportUtil.parseFieldData(elt, "pub"));
    }
  }

  @Override
public void exportXmlField(StringBuffer sb, int indentLevel) {
    super.exportXmlField(sb, indentLevel);
    sb.append(ExportUtil.exportField(indentLevel, "pub", getPub()));
    sb.append(ExportUtil.exportField(indentLevel, "template", getTemplate(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "showDisplayHeader", getShowDisplayHeader()));
    sb.append(ExportUtil.exportField(indentLevel, "showDisplayFooter", getShowDisplayFooter()));
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
   * Returns the TypeEntry bound to <code>PortletPublication</code>. <br>
   * @see com.jalios.jcms.Channel#getTypeEntry(Class)
   * @since jcms-5.5
   */
  public static TypeEntry getTypeEntry() {
    return channel.getTypeEntry(PortletPublication.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>PortletPublication</code>. <br>
   * This array <strong>does not</strong> contain inherited TypeFieldEntry from super classes of <code>PortletPublication</code>. <br/>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>PortletPublication</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getTypeFieldEntries() {
    return channel.getTypeFieldEntries(PortletPublication.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>PortletPublication</code>. <br>
   * This array <strong>does</strong> contain inherited TypeFieldEntry from super classes of <code>PortletPublication</code>. <br>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>PortletPublication</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getAllTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getAllTypeFieldEntries() {
    return channel.getAllTypeFieldEntries(PortletPublication.class);
  }
  // ----------------------------------------------------------------------
  // FIELDs VALUE
  // ----------------------------------------------------------------------
  /**
   * Gets the value of the given <code>int</code> field name for the current <code>PortletPublication</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public int getIntFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getIntFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>int</code> field name for the current <code>PortletPublication</code>.
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
   * Gets the value of the given <code>long</code> field name for the current <code>PortletPublication</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public long getLongFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getLongFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>long</code> field name for the current <code>PortletPublication</code>.
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
   * Gets the value of the given <code>double</code> field name for the current <code>PortletPublication</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public double getDoubleFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getDoubleFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>double</code> field name for the current <code>PortletPublication</code>.
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
   * Gets the value of the given <code>boolean</code> field name for the current <code>PortletPublication</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public boolean getBooleanFieldValue(String fieldName) throws NoSuchFieldException {
    if ("showDisplayHeader".equals(fieldName)) { return getShowDisplayHeader(); }
    if ("showDisplayFooter".equals(fieldName)) { return getShowDisplayFooter(); }
    return super.getBooleanFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>boolean</code> field name for the current <code>PortletPublication</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0
   */
  @Override
public void setBooleanFieldValue(String fieldName, boolean value) throws NoSuchFieldException {
    if ("showDisplayHeader".equals(fieldName)) { setShowDisplayHeader(value); return; }
    if ("showDisplayFooter".equals(fieldName)) { setShowDisplayFooter(value); return; }
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
   * Gets the <code>Object</code> value of the given field name for this <code>PortletPublication</code>. <br>
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
    if ("pub".equals(fieldName)) { return getPub(); }
    if ("template".equals(fieldName)) { return getTemplate(); }
    return super.getFieldValue(fieldName, lang, useDefault);
  }

  /**
   * Sets the <code>Object</code> value of the given field name for this <code>PortletPublication</code>. <br>
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
    if ("pub".equals(fieldName)) { setPub((com.jalios.jcms.Publication)value); return; }
    if ("template".equals(fieldName)) { setTemplate((String)value); return; }
    super.setFieldValue(fieldName, value, lang);
  }

  // ----------------------------------------------------------------------
  // pub
  // ----------------------------------------------------------------------

  protected  com.jalios.jcms.Publication pub;

  public com.jalios.jcms.Publication getPub() {
    return getPub(true);
  }
  public com.jalios.jcms.Publication getPub(boolean queryDB) {
   if (pub != null) {
      return pub;
    }
    if (queryDB && Util.notEmpty(pubDBID)) {
      return channel.getData(com.jalios.jcms.Publication.class, pubDBID);
    }
    return null;
  }
  protected String pubDBID;
  public String getPubDBID() { return pubDBID; }
  public void setPub(com.jalios.jcms.Publication v) {
    if (v == null) {
      pub = null;
      pubDBID =null;
      return;
    }

    if (v instanceof DBData) {
      setPubDBID(v.getId());
    } else {
      pub = v;
    }
  }
  public void setPubDBID(String v) {
    pubDBID = v;
    if (Util.notEmpty(pubDBID)) {
      pub = null;
    }
  }


  // ----------------------------------------------------------------------
  // template
  // ----------------------------------------------------------------------

  protected  String template = channel.getTypeFieldEntry(PortletPublication.class, "template", true).getDefaultTextString();

  public String getTemplate() { return template; }

  @Override
public void setTemplate(String v) { template = v; }



  @Override
public String getTemplate(String lang) { return template; }
  public String getTemplate(String lang, boolean useDefault) { return template; }
  // ----------------------------------------------------------------------
  // showDisplayHeader
  // ----------------------------------------------------------------------

  protected  boolean showDisplayHeader = true;

  public boolean getShowDisplayHeader() { return showDisplayHeader; }

  public void setShowDisplayHeader(boolean v) { showDisplayHeader = v; }



  public String getShowDisplayHeaderLabel(String lang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(this.getClass(), "showDisplayHeader", true);
    return showDisplayHeader ? tfe.getOnLabel(lang) : tfe.getOffLabel(lang);
  }
  public static String[] getShowDisplayHeaderValues() {
    return new String[]{ "true" , "false" };
  }

  public static String[] getShowDisplayHeaderLabels(String userLang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(PortletPublication.class, "showDisplayHeader", true);
    String onLabel = tfe.getOnLabel(userLang);
    String offLabel = tfe.getOffLabel(userLang);

    return new String[]{ onLabel, offLabel };
  }
  public static EnumerateFormReport getShowDisplayHeaderReport(SortedSet<PortletPublication> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (PortletPublication obj : set) {
      if (obj == null) {
        continue;
      }

      map.inc("" + obj.getShowDisplayHeader());

      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }
  // ----------------------------------------------------------------------
  // showDisplayFooter
  // ----------------------------------------------------------------------

  protected  boolean showDisplayFooter = true;

  public boolean getShowDisplayFooter() { return showDisplayFooter; }

  public void setShowDisplayFooter(boolean v) { showDisplayFooter = v; }



  public String getShowDisplayFooterLabel(String lang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(this.getClass(), "showDisplayFooter", true);
    return showDisplayFooter ? tfe.getOnLabel(lang) : tfe.getOffLabel(lang);
  }
  public static String[] getShowDisplayFooterValues() {
    return new String[]{ "true" , "false" };
  }

  public static String[] getShowDisplayFooterLabels(String userLang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(PortletPublication.class, "showDisplayFooter", true);
    String onLabel = tfe.getOnLabel(userLang);
    String offLabel = tfe.getOffLabel(userLang);

    return new String[]{ onLabel, offLabel };
  }
  public static EnumerateFormReport getShowDisplayFooterReport(SortedSet<PortletPublication> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (PortletPublication obj : set) {
      if (obj == null) {
        continue;
      }

      map.inc("" + obj.getShowDisplayFooter());

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
    JcmsUtil.addData(set, clazz, getOriginalPortlet());
    JcmsUtil.addData(set, clazz, getPub());
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

    if (getPub() == null) {
      status = new ControllerStatus();
      status.setProp("msg.edit.empty-field", channel.getTypeFieldLabel(this, "pub"));
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
    ((PortletPublication)mergeCopy).setPub(getPub());
    ((PortletPublication)mergeCopy).setTemplate(getTemplate());
    ((PortletPublication)mergeCopy).setShowDisplayHeader(getShowDisplayHeader());
    ((PortletPublication)mergeCopy).setShowDisplayFooter(getShowDisplayFooter());
  }
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// vqd6nwsOnY4Rc4rT2KKGyw==
