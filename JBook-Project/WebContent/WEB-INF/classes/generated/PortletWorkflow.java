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
public  class PortletWorkflow extends generated.AbstractPortletSkinable
             implements
                com.jalios.jstore.Searchable
{

  // ----------------------------------------------------------------------
  // CONSTRUCTORS
  // ----------------------------------------------------------------------
  public PortletWorkflow() {}


  public PortletWorkflow(AbstractPortletSkinable other) {
    super(other);
  }




  public PortletWorkflow(PortletWorkflow other) {
    super(other);
    queries = other.queries;
    maximumItemsPerWorkspace = other.maximumItemsPerWorkspace;
    orderBy = other.orderBy;
    hideWhenNoResults = other.hideWhenNoResults;
    pageSizes = other.pageSizes;
    pagerAllLimit = other.pagerAllLimit;
    displayCSWorkspacePublication = other.displayCSWorkspacePublication;
  }

  // ----------------------------------------------------------------------
  // Import / Export
  // ----------------------------------------------------------------------
  @Override
public void importXml(org.jdom.Element elt, ImportOptions options) {
    super.importXml(elt, options);

    setQueries(ImportUtil.parseFieldTextArray(elt, "queries"));
    setMaximumItemsPerWorkspace(ImportUtil.parseFieldInt(elt, "maximumItemsPerWorkspace"));
    setOrderBy(ImportUtil.parseFieldText(elt, "orderBy"));
    setHideWhenNoResults(ImportUtil.parseFieldBoolean(elt, "hideWhenNoResults"));
    setPageSizes(ImportUtil.parseFieldIntArray(elt, "pageSizes"));
    setPagerAllLimit(ImportUtil.parseFieldInt(elt, "pagerAllLimit"));
    setDisplayCSWorkspacePublication(ImportUtil.parseFieldBoolean(elt, "displayCSWorkspacePublication"));
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
    sb.append(ExportUtil.exportField(indentLevel, "queries", getQueries(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "maximumItemsPerWorkspace", getMaximumItemsPerWorkspace()));
    sb.append(ExportUtil.exportField(indentLevel, "orderBy", getOrderBy(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "hideWhenNoResults", getHideWhenNoResults()));
    sb.append(ExportUtil.exportField(indentLevel, "pageSizes", getPageSizes()));
    sb.append(ExportUtil.exportField(indentLevel, "pagerAllLimit", getPagerAllLimit()));
    sb.append(ExportUtil.exportField(indentLevel, "displayCSWorkspacePublication", getDisplayCSWorkspacePublication()));
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
   * Returns the TypeEntry bound to <code>PortletWorkflow</code>. <br>
   * @see com.jalios.jcms.Channel#getTypeEntry(Class)
   * @since jcms-5.5
   */
  public static TypeEntry getTypeEntry() {
    return channel.getTypeEntry(PortletWorkflow.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>PortletWorkflow</code>. <br>
   * This array <strong>does not</strong> contain inherited TypeFieldEntry from super classes of <code>PortletWorkflow</code>. <br/>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>PortletWorkflow</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getTypeFieldEntries() {
    return channel.getTypeFieldEntries(PortletWorkflow.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>PortletWorkflow</code>. <br>
   * This array <strong>does</strong> contain inherited TypeFieldEntry from super classes of <code>PortletWorkflow</code>. <br>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>PortletWorkflow</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getAllTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getAllTypeFieldEntries() {
    return channel.getAllTypeFieldEntries(PortletWorkflow.class);
  }
  // ----------------------------------------------------------------------
  // FIELDs VALUE
  // ----------------------------------------------------------------------
  /**
   * Gets the value of the given <code>int</code> field name for the current <code>PortletWorkflow</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public int getIntFieldValue(String fieldName) throws NoSuchFieldException {
    if ("maximumItemsPerWorkspace".equals(fieldName)) { return getMaximumItemsPerWorkspace(); }
    if ("pagerAllLimit".equals(fieldName)) { return getPagerAllLimit(); }
    return super.getIntFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>int</code> field name for the current <code>PortletWorkflow</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0
   */
  @Override
public void setIntFieldValue(String fieldName, int value) throws NoSuchFieldException {
    if ("maximumItemsPerWorkspace".equals(fieldName)) { setMaximumItemsPerWorkspace(value); return; }
    if ("pagerAllLimit".equals(fieldName)) { setPagerAllLimit(value); return; }
    super.setIntFieldValue(fieldName, value);
  }

  /**
   * Gets the value of the given <code>long</code> field name for the current <code>PortletWorkflow</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public long getLongFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getLongFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>long</code> field name for the current <code>PortletWorkflow</code>.
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
   * Gets the value of the given <code>double</code> field name for the current <code>PortletWorkflow</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public double getDoubleFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getDoubleFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>double</code> field name for the current <code>PortletWorkflow</code>.
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
   * Gets the value of the given <code>boolean</code> field name for the current <code>PortletWorkflow</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public boolean getBooleanFieldValue(String fieldName) throws NoSuchFieldException {
    if ("hideWhenNoResults".equals(fieldName)) { return getHideWhenNoResults(); }
    if ("displayCSWorkspacePublication".equals(fieldName)) { return getDisplayCSWorkspacePublication(); }
    return super.getBooleanFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>boolean</code> field name for the current <code>PortletWorkflow</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0
   */
  @Override
public void setBooleanFieldValue(String fieldName, boolean value) throws NoSuchFieldException {
    if ("hideWhenNoResults".equals(fieldName)) { setHideWhenNoResults(value); return; }
    if ("displayCSWorkspacePublication".equals(fieldName)) { setDisplayCSWorkspacePublication(value); return; }
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
   * Gets the <code>Object</code> value of the given field name for this <code>PortletWorkflow</code>. <br>
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
    if ("queries".equals(fieldName)) { return getQueries(); }
    if ("orderBy".equals(fieldName)) { return getOrderBy(); }
    if ("pageSizes".equals(fieldName)) { return getPageSizes(); }
    return super.getFieldValue(fieldName, lang, useDefault);
  }

  /**
   * Sets the <code>Object</code> value of the given field name for this <code>PortletWorkflow</code>. <br>
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
    if ("queries".equals(fieldName)) { setQueries((String[])value); return; }
    if ("orderBy".equals(fieldName)) { setOrderBy((String)value); return; }
    if ("pageSizes".equals(fieldName)) { setPageSizes((int[])value); return; }
    super.setFieldValue(fieldName, value, lang);
  }

  // ----------------------------------------------------------------------
  // queries
  // ----------------------------------------------------------------------

  protected  String[] queries;

  public String[] getQueries() { return queries; }

  public void setQueries(String[] v) { queries = v; }



  public String[] getQueries(String lang) { return queries; }
  public String[] getQueries(String lang, boolean useDefault) { return queries; }
  // ----------------------------------------------------------------------
  // maximumItemsPerWorkspace
  // ----------------------------------------------------------------------

  protected  int maximumItemsPerWorkspace = 0;

  public int getMaximumItemsPerWorkspace() { return maximumItemsPerWorkspace; }

  public void setMaximumItemsPerWorkspace(int v) { maximumItemsPerWorkspace = v; }



  public static IntegerFormReport getMaximumItemsPerWorkspaceReport(SortedSet<PortletWorkflow> set) {
    long sum = 0;
    int min = Integer.MAX_VALUE;
    int max = Integer.MIN_VALUE;
    for (PortletWorkflow obj : set) {
      if (obj == null) {
        continue;
      }
      int value = obj.getMaximumItemsPerWorkspace();
      sum += value;
      min = Math.min(value, min);
      max = Math.max(value, max);
    }
    return new IntegerFormReport(set.size(), sum, min, max);
  }
  // ----------------------------------------------------------------------
  // orderBy
  // ----------------------------------------------------------------------

  protected  String orderBy = channel.getTypeFieldEntry(PortletWorkflow.class, "orderBy", true).getDefaultTextString();

  public String getOrderBy() { return orderBy; }

  public void setOrderBy(String v) { orderBy = v; }



  public String getOrderBy(String lang) { return orderBy; }
  public String getOrderBy(String lang, boolean useDefault) { return orderBy; }
  private static String[] orderByValues;
  private static String[] orderByLabels;
  private static Map<String, String[]> orderByLabelsMap;

  public static String[] getOrderByValues() {
    if(orderByValues == null) {
      setOrderByValues(channel.getTypeFieldEntry(PortletWorkflow.class, "orderBy", true).getEnumerateValues());
    }
    return orderByValues;
  }
  public static void setOrderByValues(String[] values) {
    orderByValues = values;
  }
  public static String[] getOrderByLabels() {
    if(orderByLabels == null) {
      setOrderByLabels(channel.getTypeFieldEntry(PortletWorkflow.class, "orderBy", true).getEnumerateLabels());
    }
    return orderByLabels;
  }
  public static void setOrderByLabels(String[] labels) {
    orderByLabels = labels;
  }
  public static Map<String, String[]> getOrderByLabelsMap() {
    if(orderByLabelsMap == null) {
      setOrderByLabelsMap(channel.getTypeFieldEntry(PortletWorkflow.class, "orderBy", true).getEnumerateLabelsMap());
    }
    return orderByLabelsMap;
  }
  public static void setOrderByLabelsMap(Map<String, String[]> LabelsMap) {
    orderByLabelsMap = LabelsMap;
  }
  public static String[] getOrderByLabels(String userLang) {
    Map<String, String[]> orderByLabelMap = getOrderByLabelsMap();
    String[] labels = orderByLabelMap.get(userLang);
    if (labels == null) {
      labels = orderByLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getOrderByLabel(String value, String userLang) {
    String[] labels = getOrderByLabels(userLang);
    int i = 0;
    if (false) {
    }
    else if (value.equals("cdate")) {
      i = 0;
    }
    else if (value.equals("udate")) {
      i = 1;
    }
    else if (value.equals("mdate")) {
      i = 2;
    }
    else if (value.equals("pdate")) {
      i = 3;
    }
    else if (value.equals("edate")) {
      i = 4;
    }
    else if (value.equals("sdate")) {
      i = 5;
    }
    else if (value.equals("title")) {
      i = 6;
    }
    else if (value.equals("random")) {
      i = 7;
    }
    else if (value.equals("reader")) {
      i = 8;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return getOrderByLabel(value, channel.getLanguage());
  }

  public static String getOrderByLabel(String value) {
    String[] orderByLabels = getOrderByLabels();
    if (false) {
    }
    else if (value.equals("cdate")) {
      return orderByLabels[0];
    }
    else if (value.equals("udate")) {
      return orderByLabels[1];
    }
    else if (value.equals("mdate")) {
      return orderByLabels[2];
    }
    else if (value.equals("pdate")) {
      return orderByLabels[3];
    }
    else if (value.equals("edate")) {
      return orderByLabels[4];
    }
    else if (value.equals("sdate")) {
      return orderByLabels[5];
    }
    else if (value.equals("title")) {
      return orderByLabels[6];
    }
    else if (value.equals("random")) {
      return orderByLabels[7];
    }
    else if (value.equals("reader")) {
      return orderByLabels[8];
    }
    return "???";
  }
  public static EnumerateFormReport getOrderByReport(SortedSet<PortletWorkflow> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (PortletWorkflow obj : set) {
      if (obj == null) {
        continue;
      }

      map.inc("" + obj.getOrderBy());

      sum++;
    }
    return new EnumerateFormReport(map, sum);
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
    TypeFieldEntry tfe = channel.getTypeFieldEntry(PortletWorkflow.class, "hideWhenNoResults", true);
    String onLabel = tfe.getOnLabel(userLang);
    String offLabel = tfe.getOffLabel(userLang);

    return new String[]{ onLabel, offLabel };
  }
  public static EnumerateFormReport getHideWhenNoResultsReport(SortedSet<PortletWorkflow> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (PortletWorkflow obj : set) {
      if (obj == null) {
        continue;
      }

      map.inc("" + obj.getHideWhenNoResults());

      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }
  // ----------------------------------------------------------------------
  // pageSizes
  // ----------------------------------------------------------------------

  protected  int[] pageSizes;

  public int[] getPageSizes() { return pageSizes; }

  public void setPageSizes(int[] v) { pageSizes = v; }



  // ----------------------------------------------------------------------
  // pagerAllLimit
  // ----------------------------------------------------------------------

  protected  int pagerAllLimit = -1;

  public int getPagerAllLimit() { return pagerAllLimit; }

  public void setPagerAllLimit(int v) { pagerAllLimit = v; }



  public static IntegerFormReport getPagerAllLimitReport(SortedSet<PortletWorkflow> set) {
    long sum = 0;
    int min = Integer.MAX_VALUE;
    int max = Integer.MIN_VALUE;
    for (PortletWorkflow obj : set) {
      if (obj == null) {
        continue;
      }
      int value = obj.getPagerAllLimit();
      sum += value;
      min = Math.min(value, min);
      max = Math.max(value, max);
    }
    return new IntegerFormReport(set.size(), sum, min, max);
  }
  // ----------------------------------------------------------------------
  // displayCSWorkspacePublication
  // ----------------------------------------------------------------------

  protected  boolean displayCSWorkspacePublication = true;

  public boolean getDisplayCSWorkspacePublication() { return displayCSWorkspacePublication; }

  public void setDisplayCSWorkspacePublication(boolean v) { displayCSWorkspacePublication = v; }



  public String getDisplayCSWorkspacePublicationLabel(String lang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(this.getClass(), "displayCSWorkspacePublication", true);
    return displayCSWorkspacePublication ? tfe.getOnLabel(lang) : tfe.getOffLabel(lang);
  }
  public static String[] getDisplayCSWorkspacePublicationValues() {
    return new String[]{ "true" , "false" };
  }

  public static String[] getDisplayCSWorkspacePublicationLabels(String userLang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(PortletWorkflow.class, "displayCSWorkspacePublication", true);
    String onLabel = tfe.getOnLabel(userLang);
    String offLabel = tfe.getOffLabel(userLang);

    return new String[]{ onLabel, offLabel };
  }
  public static EnumerateFormReport getDisplayCSWorkspacePublicationReport(SortedSet<PortletWorkflow> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (PortletWorkflow obj : set) {
      if (obj == null) {
        continue;
      }

      map.inc("" + obj.getDisplayCSWorkspacePublication());

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

    if (maximumItemsPerWorkspace < 0 ) {
      status = new ControllerStatus();
      status.setProp("msg.edit.lesser-number", channel.getTypeFieldLabel(this, "maximumItemsPerWorkspace"), "0");
      return status;
    }
    if (pageSizes != null) {
      for (int element : pageSizes) {
        if (element < 1 ) {
          status = new ControllerStatus();
          status.setProp("msg.edit.lesser-number", channel.getTypeFieldLabel(this, "pageSizes"), "1");
          return status;
        }
      }
    }
    if (pageSizes != null) {
      for (int element : pageSizes) {
        if (element > 500 ) {
          status = new ControllerStatus();
          status.setProp("msg.edit.greater-number", channel.getTypeFieldLabel(this, "pageSizes"), "500");
          return status;
        }
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
    ((PortletWorkflow)mergeCopy).setQueries(getQueries());
    ((PortletWorkflow)mergeCopy).setMaximumItemsPerWorkspace(getMaximumItemsPerWorkspace());
    ((PortletWorkflow)mergeCopy).setOrderBy(getOrderBy());
    ((PortletWorkflow)mergeCopy).setHideWhenNoResults(getHideWhenNoResults());
    ((PortletWorkflow)mergeCopy).setPageSizes(getPageSizes());
    ((PortletWorkflow)mergeCopy).setPagerAllLimit(getPagerAllLimit());
    ((PortletWorkflow)mergeCopy).setDisplayCSWorkspacePublication(getDisplayCSWorkspacePublication());
  }
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// UT9akyGf0PMjx53YbVac6w==
