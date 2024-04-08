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
import com.jalios.jcms.mashup.ExportUtil;
import com.jalios.jcms.mashup.ImportOptions;
import com.jalios.jcms.mashup.ImportUtil;
import com.jalios.util.ObjectIntTreeMap;
import com.jalios.util.Util;

@SuppressWarnings({"unchecked", "unused"})
public  class PortletPoll extends generated.AbstractPortletSkinable
             implements
                com.jalios.jstore.Searchable
{

  // ----------------------------------------------------------------------
  // CONSTRUCTORS
  // ----------------------------------------------------------------------
  public PortletPoll() {}


  public PortletPoll(AbstractPortletSkinable other) {
    super(other);
  }




  public PortletPoll(PortletPoll other) {
    super(other);
    hideWhenNoResults = other.hideWhenNoResults;
    poll = other.poll;
    refineWorkspace = other.refineWorkspace;
  }

  // ----------------------------------------------------------------------
  // Import / Export
  // ----------------------------------------------------------------------
  @Override
public void importXml(org.jdom.Element elt, ImportOptions options) {
    super.importXml(elt, options);

    setHideWhenNoResults(ImportUtil.parseFieldBoolean(elt, "hideWhenNoResults"));
    setRefineWorkspace(ImportUtil.parseFieldText(elt, "refineWorkspace"));
  }

  @Override
protected void importXmlFieldsWithReferences(org.jdom.Element elt, ImportOptions options) {
    super.importXmlFieldsWithReferences(elt, options);

    if (options.isSelfImport()) {
      setPoll(ImportUtil.parseSelfFieldData(elt, "poll", generated.Poll.class));
    } else {

    setPoll((generated.Poll)ImportUtil.parseFieldData(elt, "poll"));
    }
  }

  @Override
public void exportXmlField(StringBuffer sb, int indentLevel) {
    super.exportXmlField(sb, indentLevel);
    sb.append(ExportUtil.exportField(indentLevel, "hideWhenNoResults", getHideWhenNoResults()));
    sb.append(ExportUtil.exportField(indentLevel, "poll", getPoll()));
    sb.append(ExportUtil.exportField(indentLevel, "refineWorkspace", getRefineWorkspace(), false, true));
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
   * Returns the TypeEntry bound to <code>PortletPoll</code>. <br>
   * @see com.jalios.jcms.Channel#getTypeEntry(Class)
   * @since jcms-5.5
   */
  public static TypeEntry getTypeEntry() {
    return channel.getTypeEntry(PortletPoll.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>PortletPoll</code>. <br>
   * This array <strong>does not</strong> contain inherited TypeFieldEntry from super classes of <code>PortletPoll</code>. <br/>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>PortletPoll</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getTypeFieldEntries() {
    return channel.getTypeFieldEntries(PortletPoll.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>PortletPoll</code>. <br>
   * This array <strong>does</strong> contain inherited TypeFieldEntry from super classes of <code>PortletPoll</code>. <br>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>PortletPoll</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getAllTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getAllTypeFieldEntries() {
    return channel.getAllTypeFieldEntries(PortletPoll.class);
  }
  // ----------------------------------------------------------------------
  // FIELDs VALUE
  // ----------------------------------------------------------------------
  /**
   * Gets the value of the given <code>int</code> field name for the current <code>PortletPoll</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public int getIntFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getIntFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>int</code> field name for the current <code>PortletPoll</code>.
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
   * Gets the value of the given <code>long</code> field name for the current <code>PortletPoll</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public long getLongFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getLongFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>long</code> field name for the current <code>PortletPoll</code>.
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
   * Gets the value of the given <code>double</code> field name for the current <code>PortletPoll</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public double getDoubleFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getDoubleFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>double</code> field name for the current <code>PortletPoll</code>.
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
   * Gets the value of the given <code>boolean</code> field name for the current <code>PortletPoll</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public boolean getBooleanFieldValue(String fieldName) throws NoSuchFieldException {
    if ("hideWhenNoResults".equals(fieldName)) { return getHideWhenNoResults(); }
    return super.getBooleanFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>boolean</code> field name for the current <code>PortletPoll</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0
   */
  @Override
public void setBooleanFieldValue(String fieldName, boolean value) throws NoSuchFieldException {
    if ("hideWhenNoResults".equals(fieldName)) { setHideWhenNoResults(value); return; }
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
   * Gets the <code>Object</code> value of the given field name for this <code>PortletPoll</code>. <br>
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
    if ("poll".equals(fieldName)) { return getPoll(); }
    if ("refineWorkspace".equals(fieldName)) { return getRefineWorkspace(); }
    return super.getFieldValue(fieldName, lang, useDefault);
  }

  /**
   * Sets the <code>Object</code> value of the given field name for this <code>PortletPoll</code>. <br>
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
    if ("poll".equals(fieldName)) { setPoll((generated.Poll)value); return; }
    if ("refineWorkspace".equals(fieldName)) { setRefineWorkspace((String)value); return; }
    super.setFieldValue(fieldName, value, lang);
  }

  // ----------------------------------------------------------------------
  // hideWhenNoResults
  // ----------------------------------------------------------------------

  protected  boolean hideWhenNoResults = false;

  public boolean getHideWhenNoResults() { return hideWhenNoResults; }

  public void setHideWhenNoResults(boolean v) { hideWhenNoResults = v; }



  public String getHideWhenNoResultsLabel(String lang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(this.getClass(), "hideWhenNoResults", true);
    return hideWhenNoResults ? tfe.getOnLabel(lang) : tfe.getOffLabel(lang);
  }
  public static String[] getHideWhenNoResultsValues() {
    return new String[]{ "true" , "false" };
  }

  public static String[] getHideWhenNoResultsLabels(String userLang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(PortletPoll.class, "hideWhenNoResults", true);
    String onLabel = tfe.getOnLabel(userLang);
    String offLabel = tfe.getOffLabel(userLang);

    return new String[]{ onLabel, offLabel };
  }
  public static EnumerateFormReport getHideWhenNoResultsReport(SortedSet<PortletPoll> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (PortletPoll obj : set) {
      if (obj == null) {
        continue;
      }

      map.inc("" + obj.getHideWhenNoResults());

      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }
  // ----------------------------------------------------------------------
  // poll
  // ----------------------------------------------------------------------

  protected  generated.Poll poll;

  public generated.Poll getPoll() { return poll; }

  public void setPoll(generated.Poll v) { poll = v; }



  // ----------------------------------------------------------------------
  // refineWorkspace
  // ----------------------------------------------------------------------

  protected  String refineWorkspace = channel.getTypeFieldEntry(PortletPoll.class, "refineWorkspace", true).getDefaultTextString();

  public String getRefineWorkspace() { return refineWorkspace; }

  public void setRefineWorkspace(String v) { refineWorkspace = v; }



  public String getRefineWorkspace(String lang) { return refineWorkspace; }
  public String getRefineWorkspace(String lang, boolean useDefault) { return refineWorkspace; }
  private static String[] refineWorkspaceValues;
  private static String[] refineWorkspaceLabels;
  private static Map<String, String[]> refineWorkspaceLabelsMap;

  public static String[] getRefineWorkspaceValues() {
    if(refineWorkspaceValues == null) {
      setRefineWorkspaceValues(channel.getTypeFieldEntry(PortletPoll.class, "refineWorkspace", true).getEnumerateValues());
    }
    return refineWorkspaceValues;
  }
  public static void setRefineWorkspaceValues(String[] values) {
    refineWorkspaceValues = values;
  }
  public static String[] getRefineWorkspaceLabels() {
    if(refineWorkspaceLabels == null) {
      setRefineWorkspaceLabels(channel.getTypeFieldEntry(PortletPoll.class, "refineWorkspace", true).getEnumerateLabels());
    }
    return refineWorkspaceLabels;
  }
  public static void setRefineWorkspaceLabels(String[] labels) {
    refineWorkspaceLabels = labels;
  }
  public static Map<String, String[]> getRefineWorkspaceLabelsMap() {
    if(refineWorkspaceLabelsMap == null) {
      setRefineWorkspaceLabelsMap(channel.getTypeFieldEntry(PortletPoll.class, "refineWorkspace", true).getEnumerateLabelsMap());
    }
    return refineWorkspaceLabelsMap;
  }
  public static void setRefineWorkspaceLabelsMap(Map<String, String[]> LabelsMap) {
    refineWorkspaceLabelsMap = LabelsMap;
  }
  public static String[] getRefineWorkspaceLabels(String userLang) {
    Map<String, String[]> refineWorkspaceLabelMap = getRefineWorkspaceLabelsMap();
    String[] labels = refineWorkspaceLabelMap.get(userLang);
    if (labels == null) {
      labels = refineWorkspaceLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getRefineWorkspaceLabel(String value, String userLang) {
    String[] labels = getRefineWorkspaceLabels(userLang);
    int i = 0;
    if (false) {
    }
    else if (value.equals("true")) {
      i = 0;
    }
    else if (value.equals("false")) {
      i = 1;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return getRefineWorkspaceLabel(value, channel.getLanguage());
  }

  public static String getRefineWorkspaceLabel(String value) {
    String[] refineWorkspaceLabels = getRefineWorkspaceLabels();
    if (false) {
    }
    else if (value.equals("true")) {
      return refineWorkspaceLabels[0];
    }
    else if (value.equals("false")) {
      return refineWorkspaceLabels[1];
    }
    return "???";
  }
  public static EnumerateFormReport getRefineWorkspaceReport(SortedSet<PortletPoll> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (PortletPoll obj : set) {
      if (obj == null) {
        continue;
      }

      map.inc("" + obj.getRefineWorkspace());

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
    JcmsUtil.addData(set, clazz, getPoll());
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

    if (Util.isEmpty(refineWorkspace)) {
      status = new ControllerStatus();
      status.setProp("msg.edit.empty-field", channel.getTypeFieldLabel(this, "refineWorkspace"), null);
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
    ((PortletPoll)mergeCopy).setHideWhenNoResults(getHideWhenNoResults());
    ((PortletPoll)mergeCopy).setPoll(getPoll());
    ((PortletPoll)mergeCopy).setRefineWorkspace(getRefineWorkspace());
  }
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// yEUWfZyTnQ797Hll4k2kzQ==
