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
import com.jalios.jcms.IntegerFormReport;
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
public  class PortletNavigate extends generated.AbstractPortletSkinable
             implements
                com.jalios.jstore.Searchable
{

  // ----------------------------------------------------------------------
  // CONSTRUCTORS
  // ----------------------------------------------------------------------
  public PortletNavigate() {}


  public PortletNavigate(AbstractPortletSkinable other) {
    super(other);
  }




  public PortletNavigate(PortletNavigate other) {
    super(other);
    refineCategory = other.refineCategory;
    levels = other.levels;
    hideWhenNoResults = other.hideWhenNoResults;
    navigatePortlet = other.navigatePortlet;
  }

  // ----------------------------------------------------------------------
  // Import / Export
  // ----------------------------------------------------------------------
  @Override
public void importXml(org.jdom.Element elt, ImportOptions options) {
    super.importXml(elt, options);

    setRefineCategory(ImportUtil.parseFieldText(elt, "refineCategory"));
    setLevels(ImportUtil.parseFieldInt(elt, "levels"));
    setHideWhenNoResults(ImportUtil.parseFieldBoolean(elt, "hideWhenNoResults"));
    setNavigatePortlet(ImportUtil.parseFieldBoolean(elt, "navigatePortlet"));
  }

  @Override
protected void importXmlFieldsWithReferences(org.jdom.Element elt, ImportOptions options) {
    super.importXmlFieldsWithReferences(elt, options);

    if (options.isSelfImport()) {
    } else {

    }
  }

  @Override
public void exportXmlField(StringBuffer sb, int indentLevel) {
    super.exportXmlField(sb, indentLevel);
    sb.append(ExportUtil.exportField(indentLevel, "refineCategory", getRefineCategory(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "levels", getLevels()));
    sb.append(ExportUtil.exportField(indentLevel, "hideWhenNoResults", getHideWhenNoResults()));
    sb.append(ExportUtil.exportField(indentLevel, "navigatePortlet", getNavigatePortlet()));
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
   * Returns the TypeEntry bound to <code>PortletNavigate</code>. <br>
   * @see com.jalios.jcms.Channel#getTypeEntry(Class)
   * @since jcms-5.5
   */
  public static TypeEntry getTypeEntry() {
    return channel.getTypeEntry(PortletNavigate.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>PortletNavigate</code>. <br>
   * This array <strong>does not</strong> contain inherited TypeFieldEntry from super classes of <code>PortletNavigate</code>. <br/>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>PortletNavigate</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getTypeFieldEntries() {
    return channel.getTypeFieldEntries(PortletNavigate.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>PortletNavigate</code>. <br>
   * This array <strong>does</strong> contain inherited TypeFieldEntry from super classes of <code>PortletNavigate</code>. <br>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>PortletNavigate</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getAllTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getAllTypeFieldEntries() {
    return channel.getAllTypeFieldEntries(PortletNavigate.class);
  }
  // ----------------------------------------------------------------------
  // FIELDs VALUE
  // ----------------------------------------------------------------------
  /**
   * Gets the value of the given <code>int</code> field name for the current <code>PortletNavigate</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public int getIntFieldValue(String fieldName) throws NoSuchFieldException {
    if ("levels".equals(fieldName)) { return getLevels(); }
    return super.getIntFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>int</code> field name for the current <code>PortletNavigate</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0
   */
  @Override
public void setIntFieldValue(String fieldName, int value) throws NoSuchFieldException {
    if ("levels".equals(fieldName)) { setLevels(value); return; }
    super.setIntFieldValue(fieldName, value);
  }

  /**
   * Gets the value of the given <code>long</code> field name for the current <code>PortletNavigate</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public long getLongFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getLongFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>long</code> field name for the current <code>PortletNavigate</code>.
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
   * Gets the value of the given <code>double</code> field name for the current <code>PortletNavigate</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public double getDoubleFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getDoubleFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>double</code> field name for the current <code>PortletNavigate</code>.
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
   * Gets the value of the given <code>boolean</code> field name for the current <code>PortletNavigate</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public boolean getBooleanFieldValue(String fieldName) throws NoSuchFieldException {
    if ("hideWhenNoResults".equals(fieldName)) { return getHideWhenNoResults(); }
    if ("navigatePortlet".equals(fieldName)) { return getNavigatePortlet(); }
    return super.getBooleanFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>boolean</code> field name for the current <code>PortletNavigate</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0
   */
  @Override
public void setBooleanFieldValue(String fieldName, boolean value) throws NoSuchFieldException {
    if ("hideWhenNoResults".equals(fieldName)) { setHideWhenNoResults(value); return; }
    if ("navigatePortlet".equals(fieldName)) { setNavigatePortlet(value); return; }
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
    if ("rootCategory".equals(fieldName)) { return getRootCategory(mbr); }
    return super.getCategoryFieldValue(fieldName, mbr);
  }
  /**
   * Gets the <code>Object</code> value of the given field name for this <code>PortletNavigate</code>. <br>
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
    if ("refineCategory".equals(fieldName)) { return getRefineCategory(); }
    return super.getFieldValue(fieldName, lang, useDefault);
  }

  /**
   * Sets the <code>Object</code> value of the given field name for this <code>PortletNavigate</code>. <br>
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
    if ("refineCategory".equals(fieldName)) { setRefineCategory((String)value); return; }
    super.setFieldValue(fieldName, value, lang);
  }

  // ----------------------------------------------------------------------
  // refineCategory
  // ----------------------------------------------------------------------

  protected  String refineCategory = channel.getTypeFieldEntry(PortletNavigate.class, "refineCategory", true).getDefaultTextString();

  public String getRefineCategory() { return refineCategory; }

  public void setRefineCategory(String v) { refineCategory = v; }



  public String getRefineCategory(String lang) { return refineCategory; }
  public String getRefineCategory(String lang, boolean useDefault) { return refineCategory; }
  private static String[] refineCategoryValues;
  private static String[] refineCategoryLabels;
  private static Map<String, String[]> refineCategoryLabelsMap;

  public static String[] getRefineCategoryValues() {
    if(refineCategoryValues == null) {
      setRefineCategoryValues(channel.getTypeFieldEntry(PortletNavigate.class, "refineCategory", true).getEnumerateValues());
    }
    return refineCategoryValues;
  }
  public static void setRefineCategoryValues(String[] values) {
    refineCategoryValues = values;
  }
  public static String[] getRefineCategoryLabels() {
    if(refineCategoryLabels == null) {
      setRefineCategoryLabels(channel.getTypeFieldEntry(PortletNavigate.class, "refineCategory", true).getEnumerateLabels());
    }
    return refineCategoryLabels;
  }
  public static void setRefineCategoryLabels(String[] labels) {
    refineCategoryLabels = labels;
  }
  public static Map<String, String[]> getRefineCategoryLabelsMap() {
    if(refineCategoryLabelsMap == null) {
      setRefineCategoryLabelsMap(channel.getTypeFieldEntry(PortletNavigate.class, "refineCategory", true).getEnumerateLabelsMap());
    }
    return refineCategoryLabelsMap;
  }
  public static void setRefineCategoryLabelsMap(Map<String, String[]> LabelsMap) {
    refineCategoryLabelsMap = LabelsMap;
  }
  public static String[] getRefineCategoryLabels(String userLang) {
    Map<String, String[]> refineCategoryLabelMap = getRefineCategoryLabelsMap();
    String[] labels = refineCategoryLabelMap.get(userLang);
    if (labels == null) {
      labels = refineCategoryLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getRefineCategoryLabel(String value, String userLang) {
    String[] labels = getRefineCategoryLabels(userLang);
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
    else if (value.equals("WorkspaceCategories")) {
      i = 3;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return getRefineCategoryLabel(value, channel.getLanguage());
  }

  public static String getRefineCategoryLabel(String value) {
    String[] refineCategoryLabels = getRefineCategoryLabels();
    if (false) {
    }
    else if (value.equals("None")) {
      return refineCategoryLabels[0];
    }
    else if (value.equals("Portal")) {
      return refineCategoryLabels[1];
    }
    else if (value.equals("Current")) {
      return refineCategoryLabels[2];
    }
    else if (value.equals("WorkspaceCategories")) {
      return refineCategoryLabels[3];
    }
    return "???";
  }
  public static EnumerateFormReport getRefineCategoryReport(SortedSet<PortletNavigate> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (PortletNavigate obj : set) {
      if (obj == null) {
        continue;
      }

      map.inc("" + obj.getRefineCategory());

      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }
  // ----------------------------------------------------------------------
  // levels
  // ----------------------------------------------------------------------

  protected  int levels = 1;

  public int getLevels() { return levels; }

  public void setLevels(int v) { levels = v; }



  public static IntegerFormReport getLevelsReport(SortedSet<PortletNavigate> set) {
    long sum = 0;
    int min = Integer.MAX_VALUE;
    int max = Integer.MIN_VALUE;
    for (PortletNavigate obj : set) {
      if (obj == null) {
        continue;
      }
      int value = obj.getLevels();
      sum += value;
      min = Math.min(value, min);
      max = Math.max(value, max);
    }
    return new IntegerFormReport(set.size(), sum, min, max);
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
    TypeFieldEntry tfe = channel.getTypeFieldEntry(PortletNavigate.class, "hideWhenNoResults", true);
    String onLabel = tfe.getOnLabel(userLang);
    String offLabel = tfe.getOffLabel(userLang);

    return new String[]{ onLabel, offLabel };
  }
  public static EnumerateFormReport getHideWhenNoResultsReport(SortedSet<PortletNavigate> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (PortletNavigate obj : set) {
      if (obj == null) {
        continue;
      }

      map.inc("" + obj.getHideWhenNoResults());

      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }
  // ----------------------------------------------------------------------
  // navigatePortlet
  // ----------------------------------------------------------------------

  protected  boolean navigatePortlet = true;

  public boolean getNavigatePortlet() { return navigatePortlet; }

  public void setNavigatePortlet(boolean v) { navigatePortlet = v; }



  public String getNavigatePortletLabel(String lang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(this.getClass(), "navigatePortlet", true);
    return navigatePortlet ? tfe.getOnLabel(lang) : tfe.getOffLabel(lang);
  }
  public static String[] getNavigatePortletValues() {
    return new String[]{ "true" , "false" };
  }

  public static String[] getNavigatePortletLabels(String userLang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(PortletNavigate.class, "navigatePortlet", true);
    String onLabel = tfe.getOnLabel(userLang);
    String offLabel = tfe.getOffLabel(userLang);

    return new String[]{ onLabel, offLabel };
  }
  public static EnumerateFormReport getNavigatePortletReport(SortedSet<PortletNavigate> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (PortletNavigate obj : set) {
      if (obj == null) {
        continue;
      }

      map.inc("" + obj.getNavigatePortlet());

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

  public TreeSet<Category> getRootCategory(Member member) {
    return getDescendantCategorySet(channel.getCategory("j_3"), true, member);
  }
  public Category getFirstRootCategory(Member member) {
    return getFirstDescendantCategory(channel.getCategory("j_3"), true, member);
  }
  @Override
  public <T extends Data> TreeSet<T> getLinkDataSet(Class<T> clazz) {
    if (clazz == null) {
      return Util.emptyTreeSet();
    }
    TreeSet<T> set = new TreeSet<>();
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

    if (levels < 1 ) {
      status = new ControllerStatus();
      status.setProp("msg.edit.lesser-number", channel.getTypeFieldLabel(this, "levels"), "1");
      return status;
    }
    if (levels > 1000 ) {
      status = new ControllerStatus();
      status.setProp("msg.edit.greater-number", channel.getTypeFieldLabel(this, "levels"), "1000");
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
    ((PortletNavigate)mergeCopy).setRefineCategory(getRefineCategory());
    ((PortletNavigate)mergeCopy).setLevels(getLevels());
    ((PortletNavigate)mergeCopy).setHideWhenNoResults(getHideWhenNoResults());
    ((PortletNavigate)mergeCopy).setNavigatePortlet(getNavigatePortlet());
  }
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// q0PLW98HpCmVfXmB/N34pg==
