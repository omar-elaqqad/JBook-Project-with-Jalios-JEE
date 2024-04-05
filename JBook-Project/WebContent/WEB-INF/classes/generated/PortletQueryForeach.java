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
public  class PortletQueryForeach extends generated.AbstractPortletSkinable 
             implements 
                com.jalios.jstore.Searchable
{
  
  // ----------------------------------------------------------------------
  // CONSTRUCTORS
  // ----------------------------------------------------------------------  
  public PortletQueryForeach() {}
 
 
  public PortletQueryForeach(AbstractPortletSkinable other) {
    super(other);
  }
 
  
  
  
  public PortletQueryForeach(PortletQueryForeach other) {
    super(other);
    searchInDB = other.searchInDB;
    queries = other.queries;
    refineQueries = other.refineQueries;
    refineWithContextualCategories = other.refineWithContextualCategories;
    displayMode = other.displayMode;
    orderBy = other.orderBy;
    reverseOrder = other.reverseOrder;
    maxResults = other.maxResults;
    skipFirstResults = other.skipFirstResults;
    skipDisplayedPublications = other.skipDisplayedPublications;
    showPager = other.showPager;
    pagerLabel = other.pagerLabel;
    pagerLabelML = other.pagerLabelML;
    pageSizes = other.pageSizes;
    pagerAllLimit = other.pagerAllLimit;
    hideWhenNoResults = other.hideWhenNoResults;
    firstPublications = other.firstPublications;
    firstPublicationsDBID = other.firstPublicationsDBID;
    showInCurrentPortal = other.showInCurrentPortal;
    contextCategory = other.contextCategory;
    publications = other.publications;
    publicationsDBID = other.publicationsDBID;
  }
  
  // ----------------------------------------------------------------------
  // Import / Export
  // ----------------------------------------------------------------------
  public void importXml(org.jdom.Element elt, ImportOptions options) {
    super.importXml(elt, options);
    
    setSearchInDB(ImportUtil.parseFieldBoolean(elt, "searchInDB"));
    setQueries(ImportUtil.parseFieldTextArray(elt, "queries"));
    setRefineQueries(ImportUtil.parseFieldText(elt, "refineQueries"));
    setRefineWithContextualCategories(ImportUtil.parseFieldBoolean(elt, "refineWithContextualCategories"));
    setDisplayMode(ImportUtil.parseFieldText(elt, "displayMode"));
    setOrderBy(ImportUtil.parseFieldText(elt, "orderBy"));
    setReverseOrder(ImportUtil.parseFieldText(elt, "reverseOrder"));
    setMaxResults(ImportUtil.parseFieldInt(elt, "maxResults"));
    setSkipFirstResults(ImportUtil.parseFieldInt(elt, "skipFirstResults"));
    setSkipDisplayedPublications(ImportUtil.parseFieldBoolean(elt, "skipDisplayedPublications"));
    setShowPager(ImportUtil.parseFieldText(elt, "showPager"));
    setPagerLabel(ImportUtil.parseFieldText(elt, "pagerLabel"));
    setPagerLabelML(ImportUtil.parseFieldTextML(elt, "pagerLabelML"));
    setPageSizes(ImportUtil.parseFieldIntArray(elt, "pageSizes"));
    setPagerAllLimit(ImportUtil.parseFieldInt(elt, "pagerAllLimit"));
    setHideWhenNoResults(ImportUtil.parseFieldBoolean(elt, "hideWhenNoResults"));
    setShowInCurrentPortal(ImportUtil.parseFieldBoolean(elt, "showInCurrentPortal"));
    setContextCategory(ImportUtil.parseFieldBoolean(elt, "contextCategory"));
  }
  
  protected void importXmlFieldsWithReferences(org.jdom.Element elt, ImportOptions options) {
    super.importXmlFieldsWithReferences(elt, options);
      
    if (options.isSelfImport()) {
      setFirstPublications(ImportUtil.parseSelfFieldDataArray(elt, "firstPublications", com.jalios.jcms.Content.class));
      setPublications(ImportUtil.parseSelfFieldDataArray(elt, "publications", com.jalios.jcms.Publication.class));
    } else {
    
    setFirstPublications((com.jalios.jcms.Content[])ImportUtil.parseFieldDataArray(elt, "firstPublications", com.jalios.jcms.Content.class));
    setPublications((com.jalios.jcms.Publication[])ImportUtil.parseFieldDataArray(elt, "publications", com.jalios.jcms.Publication.class));
    }
  }
  
  public void exportXmlField(StringBuffer sb, int indentLevel) {
    super.exportXmlField(sb, indentLevel);
    sb.append(ExportUtil.exportField(indentLevel, "searchInDB", getSearchInDB()));
    sb.append(ExportUtil.exportField(indentLevel, "queries", getQueries(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "refineQueries", getRefineQueries(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "refineWithContextualCategories", getRefineWithContextualCategories()));
    sb.append(ExportUtil.exportField(indentLevel, "displayMode", getDisplayMode(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "orderBy", getOrderBy(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "reverseOrder", getReverseOrder(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "maxResults", getMaxResults()));
    sb.append(ExportUtil.exportField(indentLevel, "skipFirstResults", getSkipFirstResults()));
    sb.append(ExportUtil.exportField(indentLevel, "skipDisplayedPublications", getSkipDisplayedPublications()));
    sb.append(ExportUtil.exportField(indentLevel, "showPager", getShowPager(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "pagerLabel", getPagerLabel(), "pagerLabelML", false, true));
    sb.append(ExportUtil.exportField(indentLevel, "pagerLabelML", getPagerLabelML(), true));
    sb.append(ExportUtil.exportField(indentLevel, "pageSizes", getPageSizes()));
    sb.append(ExportUtil.exportField(indentLevel, "pagerAllLimit", getPagerAllLimit()));
    sb.append(ExportUtil.exportField(indentLevel, "hideWhenNoResults", getHideWhenNoResults()));
    sb.append(ExportUtil.exportField(indentLevel, "firstPublications", getFirstPublications()));
    sb.append(ExportUtil.exportField(indentLevel, "showInCurrentPortal", getShowInCurrentPortal()));
    sb.append(ExportUtil.exportField(indentLevel, "contextCategory", getContextCategory()));
    sb.append(ExportUtil.exportField(indentLevel, "publications", getPublications()));
  }
  
  public Set<FileDocument> getDocumentLinkSet() {
    Set<FileDocument> docSet = super.getDocumentLinkSet();
    return docSet;
  }
  
  // ----------------------------------------------------------------------
  // TYPE AND FIELD INFOS (static methods)
  // ----------------------------------------------------------------------  
  /**
   * Returns the TypeEntry bound to <code>PortletQueryForeach</code>. <br>
   * @see com.jalios.jcms.Channel#getTypeEntry(Class)
   * @since jcms-5.5
   */
  public static TypeEntry getTypeEntry() {
    return channel.getTypeEntry(PortletQueryForeach.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>PortletQueryForeach</code>. <br>
   * This array <strong>does not</strong> contain inherited TypeFieldEntry from super classes of <code>PortletQueryForeach</code>. <br/>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>PortletQueryForeach</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getTypeFieldEntries() {
    return channel.getTypeFieldEntries(PortletQueryForeach.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>PortletQueryForeach</code>. <br>
   * This array <strong>does</strong> contain inherited TypeFieldEntry from super classes of <code>PortletQueryForeach</code>. <br>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>PortletQueryForeach</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getAllTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getAllTypeFieldEntries() {
    return channel.getAllTypeFieldEntries(PortletQueryForeach.class);
  }
  // ----------------------------------------------------------------------
  // FIELDs VALUE
  // ----------------------------------------------------------------------  
  /**
   * Gets the value of the given <code>int</code> field name for the current <code>PortletQueryForeach</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public int getIntFieldValue(String fieldName) throws NoSuchFieldException {
    if ("maxResults".equals(fieldName)) { return getMaxResults(); }
    if ("skipFirstResults".equals(fieldName)) { return getSkipFirstResults(); }
    if ("pagerAllLimit".equals(fieldName)) { return getPagerAllLimit(); }
    return super.getIntFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>int</code> field name for the current <code>PortletQueryForeach</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setIntFieldValue(String fieldName, int value) throws NoSuchFieldException {
    if ("maxResults".equals(fieldName)) { setMaxResults(value); return; }
    if ("skipFirstResults".equals(fieldName)) { setSkipFirstResults(value); return; }
    if ("pagerAllLimit".equals(fieldName)) { setPagerAllLimit(value); return; }
    super.setIntFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>long</code> field name for the current <code>PortletQueryForeach</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public long getLongFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getLongFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>long</code> field name for the current <code>PortletQueryForeach</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setLongFieldValue(String fieldName, long value) throws NoSuchFieldException {
    super.setLongFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>double</code> field name for the current <code>PortletQueryForeach</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public double getDoubleFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getDoubleFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>double</code> field name for the current <code>PortletQueryForeach</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setDoubleFieldValue(String fieldName, double value) throws NoSuchFieldException {
     super.setDoubleFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>boolean</code> field name for the current <code>PortletQueryForeach</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public boolean getBooleanFieldValue(String fieldName) throws NoSuchFieldException {
    if ("searchInDB".equals(fieldName)) { return getSearchInDB(); }
    if ("refineWithContextualCategories".equals(fieldName)) { return getRefineWithContextualCategories(); }
    if ("skipDisplayedPublications".equals(fieldName)) { return getSkipDisplayedPublications(); }
    if ("hideWhenNoResults".equals(fieldName)) { return getHideWhenNoResults(); }
    if ("showInCurrentPortal".equals(fieldName)) { return getShowInCurrentPortal(); }
    if ("contextCategory".equals(fieldName)) { return getContextCategory(); }
    return super.getBooleanFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>boolean</code> field name for the current <code>PortletQueryForeach</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setBooleanFieldValue(String fieldName, boolean value) throws NoSuchFieldException {
    if ("searchInDB".equals(fieldName)) { setSearchInDB(value); return; }
    if ("refineWithContextualCategories".equals(fieldName)) { setRefineWithContextualCategories(value); return; }
    if ("skipDisplayedPublications".equals(fieldName)) { setSkipDisplayedPublications(value); return; }
    if ("hideWhenNoResults".equals(fieldName)) { setHideWhenNoResults(value); return; }
    if ("showInCurrentPortal".equals(fieldName)) { setShowInCurrentPortal(value); return; }
    if ("contextCategory".equals(fieldName)) { setContextCategory(value); return; }
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
    return super.getCategoryFieldValue(fieldName, mbr);
  }
  /**
   * Gets the <code>Object</code> value of the given field name for this <code>PortletQueryForeach</code>. <br>
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
    if ("queries".equals(fieldName)) { return getQueries(); }
    if ("refineQueries".equals(fieldName)) { return getRefineQueries(); }
    if ("displayMode".equals(fieldName)) { return getDisplayMode(); }
    if ("orderBy".equals(fieldName)) { return getOrderBy(); }
    if ("reverseOrder".equals(fieldName)) { return getReverseOrder(); }
    if ("showPager".equals(fieldName)) { return getShowPager(); }
    if ("pagerLabel".equals(fieldName)) { return getPagerLabel(lang, useDefault); }
    if ("pageSizes".equals(fieldName)) { return getPageSizes(); }
    if ("firstPublications".equals(fieldName)) { return getFirstPublications(); }
    if ("publications".equals(fieldName)) { return getPublications(); }
    return super.getFieldValue(fieldName, lang, useDefault);
  }
  
  /**
   * Sets the <code>Object</code> value of the given field name for this <code>PortletQueryForeach</code>. <br>
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
    if ("queries".equals(fieldName)) { setQueries((String[])value); return; }
    if ("refineQueries".equals(fieldName)) { setRefineQueries((String)value); return; }
    if ("displayMode".equals(fieldName)) { setDisplayMode((String)value); return; }
    if ("orderBy".equals(fieldName)) { setOrderBy((String)value); return; }
    if ("reverseOrder".equals(fieldName)) { setReverseOrder((String)value); return; }
    if ("showPager".equals(fieldName)) { setShowPager((String)value); return; }
    if ("pagerLabel".equals(fieldName)) { setPagerLabel(lang,(String)value); return; }
    if ("pageSizes".equals(fieldName)) { setPageSizes((int[])value); return; }
    if ("firstPublications".equals(fieldName)) { setFirstPublications((com.jalios.jcms.Content[])value); return; }
    if ("publications".equals(fieldName)) { setPublications((com.jalios.jcms.Publication[])value); return; }
    super.setFieldValue(fieldName, value, lang);
  }
  
  // ----------------------------------------------------------------------
  // searchInDB
  // ----------------------------------------------------------------------  
  
  protected  boolean searchInDB = true;
  
  public boolean getSearchInDB() { return searchInDB; }
  
  public void setSearchInDB(boolean v) { searchInDB = v; }
  
  
  
  public String getSearchInDBLabel(String lang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(this.getClass(), "searchInDB", true);
    return searchInDB ? tfe.getOnLabel(lang) : tfe.getOffLabel(lang); 
  }
  public static String[] getSearchInDBValues() {
    return new String[]{ "true" , "false" };
  }
  
  public static String[] getSearchInDBLabels(String userLang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(PortletQueryForeach.class, "searchInDB", true);
    String onLabel = (String) tfe.getOnLabel(userLang);
    String offLabel = (String) tfe.getOffLabel(userLang);
    
    return new String[]{ onLabel, offLabel };
  }
  public static EnumerateFormReport getSearchInDBReport(SortedSet<PortletQueryForeach> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (PortletQueryForeach obj : set) {
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getSearchInDB());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
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
  // refineQueries
  // ----------------------------------------------------------------------  
  
  protected  String refineQueries = channel.getTypeFieldEntry(PortletQueryForeach.class, "refineQueries", true).getDefaultTextString();
  
  public String getRefineQueries() { return refineQueries; }
  
  public void setRefineQueries(String v) { refineQueries = v; }
  
  
  
  public String getRefineQueries(String lang) { return refineQueries; }
  public String getRefineQueries(String lang, boolean useDefault) { return refineQueries; }
  private static String[] refineQueriesValues;  
  private static String[] refineQueriesLabels;
  private static Map<String, String[]> refineQueriesLabelsMap;
  
  public static String[] getRefineQueriesValues() {
    if(refineQueriesValues == null) {
      setRefineQueriesValues(channel.getTypeFieldEntry(PortletQueryForeach.class, "refineQueries", true).getEnumerateValues());
    }
    return refineQueriesValues;
  }
  public static void setRefineQueriesValues(String[] values) {
    refineQueriesValues = values;
  }
  public static String[] getRefineQueriesLabels() {
    if(refineQueriesLabels == null) {
      setRefineQueriesLabels(channel.getTypeFieldEntry(PortletQueryForeach.class, "refineQueries", true).getEnumerateLabels());
    }
    return refineQueriesLabels;
  }
  public static void setRefineQueriesLabels(String[] labels) {
    refineQueriesLabels = labels;
  }
  public static Map<String, String[]> getRefineQueriesLabelsMap() {
    if(refineQueriesLabelsMap == null) {
      setRefineQueriesLabelsMap(channel.getTypeFieldEntry(PortletQueryForeach.class, "refineQueries", true).getEnumerateLabelsMap());
    }
    return refineQueriesLabelsMap;
  }
  public static void setRefineQueriesLabelsMap(Map<String, String[]> LabelsMap) {
    refineQueriesLabelsMap = LabelsMap;
  }
  public static String[] getRefineQueriesLabels(String userLang) {
    Map<String, String[]> refineQueriesLabelMap = getRefineQueriesLabelsMap();
    String[] labels = (String[])refineQueriesLabelMap.get(userLang);
    if (labels == null) {
      labels = (String[])refineQueriesLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getRefineQueriesLabel(String value, String userLang) {
    String[] labels = getRefineQueriesLabels(userLang);
    int i = 0;
    if (false) {
    }
    else if (value.equals("Portal")) {
      i = 0;
    }
    else if (value.equals("Current")) {
      i = 1;
    }
    else if (value.equals("PortalExact")) {
      i = 2;
    }
    else if (value.equals("CurrentExact")) {
      i = 3;
    }
    else if (value.equals("CurrentWS")) {
      i = 4;
    }
    else if (value.equals("CurrentWSCat")) {
      i = 5;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return getRefineQueriesLabel(value, channel.getLanguage());
  }
  
  public static String getRefineQueriesLabel(String value) {    
    String[] refineQueriesLabels = getRefineQueriesLabels();
    if (false) {
    }
    else if (value.equals("Portal")) {
      return refineQueriesLabels[0];
    }
    else if (value.equals("Current")) {
      return refineQueriesLabels[1];
    }
    else if (value.equals("PortalExact")) {
      return refineQueriesLabels[2];
    }
    else if (value.equals("CurrentExact")) {
      return refineQueriesLabels[3];
    }
    else if (value.equals("CurrentWS")) {
      return refineQueriesLabels[4];
    }
    else if (value.equals("CurrentWSCat")) {
      return refineQueriesLabels[5];
    }
    return "???";
  }
  public static EnumerateFormReport getRefineQueriesReport(SortedSet<PortletQueryForeach> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (PortletQueryForeach obj : set) {
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getRefineQueries());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // refineWithContextualCategories
  // ----------------------------------------------------------------------  
  
  protected  boolean refineWithContextualCategories = false;
  
  public boolean getRefineWithContextualCategories() { return refineWithContextualCategories; }
  
  public void setRefineWithContextualCategories(boolean v) { refineWithContextualCategories = v; }
  
  
  
  public String getRefineWithContextualCategoriesLabel(String lang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(this.getClass(), "refineWithContextualCategories", true);
    return refineWithContextualCategories ? tfe.getOnLabel(lang) : tfe.getOffLabel(lang); 
  }
  public static String[] getRefineWithContextualCategoriesValues() {
    return new String[]{ "true" , "false" };
  }
  
  public static String[] getRefineWithContextualCategoriesLabels(String userLang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(PortletQueryForeach.class, "refineWithContextualCategories", true);
    String onLabel = (String) tfe.getOnLabel(userLang);
    String offLabel = (String) tfe.getOffLabel(userLang);
    
    return new String[]{ onLabel, offLabel };
  }
  public static EnumerateFormReport getRefineWithContextualCategoriesReport(SortedSet<PortletQueryForeach> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (PortletQueryForeach obj : set) {
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getRefineWithContextualCategories());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // displayMode
  // ----------------------------------------------------------------------  
  
  protected  String displayMode = channel.getTypeFieldEntry(PortletQueryForeach.class, "displayMode", true).getDefaultTextString();
  
  public String getDisplayMode() { return displayMode; }
  
  public void setDisplayMode(String v) { displayMode = v; }
  
  
  
  public String getDisplayMode(String lang) { return displayMode; }
  public String getDisplayMode(String lang, boolean useDefault) { return displayMode; }
  private static String[] displayModeValues;  
  private static String[] displayModeLabels;
  private static Map<String, String[]> displayModeLabelsMap;
  
  public static String[] getDisplayModeValues() {
    if(displayModeValues == null) {
      setDisplayModeValues(channel.getTypeFieldEntry(PortletQueryForeach.class, "displayMode", true).getEnumerateValues());
    }
    return displayModeValues;
  }
  public static void setDisplayModeValues(String[] values) {
    displayModeValues = values;
  }
  public static String[] getDisplayModeLabels() {
    if(displayModeLabels == null) {
      setDisplayModeLabels(channel.getTypeFieldEntry(PortletQueryForeach.class, "displayMode", true).getEnumerateLabels());
    }
    return displayModeLabels;
  }
  public static void setDisplayModeLabels(String[] labels) {
    displayModeLabels = labels;
  }
  public static Map<String, String[]> getDisplayModeLabelsMap() {
    if(displayModeLabelsMap == null) {
      setDisplayModeLabelsMap(channel.getTypeFieldEntry(PortletQueryForeach.class, "displayMode", true).getEnumerateLabelsMap());
    }
    return displayModeLabelsMap;
  }
  public static void setDisplayModeLabelsMap(Map<String, String[]> LabelsMap) {
    displayModeLabelsMap = LabelsMap;
  }
  public static String[] getDisplayModeLabels(String userLang) {
    Map<String, String[]> displayModeLabelMap = getDisplayModeLabelsMap();
    String[] labels = (String[])displayModeLabelMap.get(userLang);
    if (labels == null) {
      labels = (String[])displayModeLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getDisplayModeLabel(String value, String userLang) {
    String[] labels = getDisplayModeLabels(userLang);
    int i = 0;
    if (false) {
    }
    else if (value.equals("dynamicPubList")) {
      i = 0;
    }
    else if (value.equals("pubList")) {
      i = 1;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return getDisplayModeLabel(value, channel.getLanguage());
  }
  
  public static String getDisplayModeLabel(String value) {    
    String[] displayModeLabels = getDisplayModeLabels();
    if (false) {
    }
    else if (value.equals("dynamicPubList")) {
      return displayModeLabels[0];
    }
    else if (value.equals("pubList")) {
      return displayModeLabels[1];
    }
    return "???";
  }
  public static EnumerateFormReport getDisplayModeReport(SortedSet<PortletQueryForeach> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (PortletQueryForeach obj : set) {
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getDisplayMode());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // orderBy
  // ----------------------------------------------------------------------  
  
  protected  String orderBy = channel.getTypeFieldEntry(PortletQueryForeach.class, "orderBy", true).getDefaultTextString();
  
  public String getOrderBy() { return orderBy; }
  
  public void setOrderBy(String v) { orderBy = v; }
  
  
  
  public String getOrderBy(String lang) { return orderBy; }
  public String getOrderBy(String lang, boolean useDefault) { return orderBy; }
  private static String[] orderByValues;  
  private static String[] orderByLabels;
  private static Map<String, String[]> orderByLabelsMap;
  
  public static String[] getOrderByValues() {
    if(orderByValues == null) {
      setOrderByValues(channel.getTypeFieldEntry(PortletQueryForeach.class, "orderBy", true).getEnumerateValues());
    }
    return orderByValues;
  }
  public static void setOrderByValues(String[] values) {
    orderByValues = values;
  }
  public static String[] getOrderByLabels() {
    if(orderByLabels == null) {
      setOrderByLabels(channel.getTypeFieldEntry(PortletQueryForeach.class, "orderBy", true).getEnumerateLabels());
    }
    return orderByLabels;
  }
  public static void setOrderByLabels(String[] labels) {
    orderByLabels = labels;
  }
  public static Map<String, String[]> getOrderByLabelsMap() {
    if(orderByLabelsMap == null) {
      setOrderByLabelsMap(channel.getTypeFieldEntry(PortletQueryForeach.class, "orderBy", true).getEnumerateLabelsMap());
    }
    return orderByLabelsMap;
  }
  public static void setOrderByLabelsMap(Map<String, String[]> LabelsMap) {
    orderByLabelsMap = LabelsMap;
  }
  public static String[] getOrderByLabels(String userLang) {
    Map<String, String[]> orderByLabelMap = getOrderByLabelsMap();
    String[] labels = (String[])orderByLabelMap.get(userLang);
    if (labels == null) {
      labels = (String[])orderByLabelMap.get(channel.getLanguage());
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
  public static EnumerateFormReport getOrderByReport(SortedSet<PortletQueryForeach> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (PortletQueryForeach obj : set) {
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getOrderBy());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // reverseOrder
  // ----------------------------------------------------------------------  
  
  protected  String reverseOrder = channel.getTypeFieldEntry(PortletQueryForeach.class, "reverseOrder", true).getDefaultTextString();
  
  public String getReverseOrder() { return reverseOrder; }
  
  public void setReverseOrder(String v) { reverseOrder = v; }
  
  
  
  public String getReverseOrder(String lang) { return reverseOrder; }
  public String getReverseOrder(String lang, boolean useDefault) { return reverseOrder; }
  private static String[] reverseOrderValues;  
  private static String[] reverseOrderLabels;
  private static Map<String, String[]> reverseOrderLabelsMap;
  
  public static String[] getReverseOrderValues() {
    if(reverseOrderValues == null) {
      setReverseOrderValues(channel.getTypeFieldEntry(PortletQueryForeach.class, "reverseOrder", true).getEnumerateValues());
    }
    return reverseOrderValues;
  }
  public static void setReverseOrderValues(String[] values) {
    reverseOrderValues = values;
  }
  public static String[] getReverseOrderLabels() {
    if(reverseOrderLabels == null) {
      setReverseOrderLabels(channel.getTypeFieldEntry(PortletQueryForeach.class, "reverseOrder", true).getEnumerateLabels());
    }
    return reverseOrderLabels;
  }
  public static void setReverseOrderLabels(String[] labels) {
    reverseOrderLabels = labels;
  }
  public static Map<String, String[]> getReverseOrderLabelsMap() {
    if(reverseOrderLabelsMap == null) {
      setReverseOrderLabelsMap(channel.getTypeFieldEntry(PortletQueryForeach.class, "reverseOrder", true).getEnumerateLabelsMap());
    }
    return reverseOrderLabelsMap;
  }
  public static void setReverseOrderLabelsMap(Map<String, String[]> LabelsMap) {
    reverseOrderLabelsMap = LabelsMap;
  }
  public static String[] getReverseOrderLabels(String userLang) {
    Map<String, String[]> reverseOrderLabelMap = getReverseOrderLabelsMap();
    String[] labels = (String[])reverseOrderLabelMap.get(userLang);
    if (labels == null) {
      labels = (String[])reverseOrderLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getReverseOrderLabel(String value, String userLang) {
    String[] labels = getReverseOrderLabels(userLang);
    int i = 0;
    if (false) {
    }
    else if (value.equals("")) {
      i = 0;
    }
    else if (value.equals("results")) {
      i = 1;
    }
    else if (value.equals("request")) {
      i = 2;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return getReverseOrderLabel(value, channel.getLanguage());
  }
  
  public static String getReverseOrderLabel(String value) {    
    String[] reverseOrderLabels = getReverseOrderLabels();
    if (false) {
    }
    else if (value.equals("")) {
      return reverseOrderLabels[0];
    }
    else if (value.equals("results")) {
      return reverseOrderLabels[1];
    }
    else if (value.equals("request")) {
      return reverseOrderLabels[2];
    }
    return "???";
  }
  public static EnumerateFormReport getReverseOrderReport(SortedSet<PortletQueryForeach> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (PortletQueryForeach obj : set) {
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getReverseOrder());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // maxResults
  // ----------------------------------------------------------------------  
  
  protected  int maxResults = 5;
  
  public int getMaxResults() { return maxResults; }
  
  public void setMaxResults(int v) { maxResults = v; }
  
  
  
  public static IntegerFormReport getMaxResultsReport(SortedSet<PortletQueryForeach> set) {
    long sum = 0;
    int min = Integer.MAX_VALUE;
    int max = Integer.MIN_VALUE;
    for (PortletQueryForeach obj : set) {
      if (obj == null) {
        continue;
      }
      int value = obj.getMaxResults();
      sum += value;
      min = Math.min(value, min);
      max = Math.max(value, max);
    }
    return new IntegerFormReport(set.size(), sum, min, max);
  }  
  // ----------------------------------------------------------------------
  // skipFirstResults
  // ----------------------------------------------------------------------  
  
  protected  int skipFirstResults = 0;
  
  public int getSkipFirstResults() { return skipFirstResults; }
  
  public void setSkipFirstResults(int v) { skipFirstResults = v; }
  
  
  
  public static IntegerFormReport getSkipFirstResultsReport(SortedSet<PortletQueryForeach> set) {
    long sum = 0;
    int min = Integer.MAX_VALUE;
    int max = Integer.MIN_VALUE;
    for (PortletQueryForeach obj : set) {
      if (obj == null) {
        continue;
      }
      int value = obj.getSkipFirstResults();
      sum += value;
      min = Math.min(value, min);
      max = Math.max(value, max);
    }
    return new IntegerFormReport(set.size(), sum, min, max);
  }  
  // ----------------------------------------------------------------------
  // skipDisplayedPublications
  // ----------------------------------------------------------------------  
  
  protected  boolean skipDisplayedPublications = false;
  
  public boolean getSkipDisplayedPublications() { return skipDisplayedPublications; }
  
  public void setSkipDisplayedPublications(boolean v) { skipDisplayedPublications = v; }
  
  
  
  public String getSkipDisplayedPublicationsLabel(String lang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(this.getClass(), "skipDisplayedPublications", true);
    return skipDisplayedPublications ? tfe.getOnLabel(lang) : tfe.getOffLabel(lang); 
  }
  public static String[] getSkipDisplayedPublicationsValues() {
    return new String[]{ "true" , "false" };
  }
  
  public static String[] getSkipDisplayedPublicationsLabels(String userLang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(PortletQueryForeach.class, "skipDisplayedPublications", true);
    String onLabel = (String) tfe.getOnLabel(userLang);
    String offLabel = (String) tfe.getOffLabel(userLang);
    
    return new String[]{ onLabel, offLabel };
  }
  public static EnumerateFormReport getSkipDisplayedPublicationsReport(SortedSet<PortletQueryForeach> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (PortletQueryForeach obj : set) {
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getSkipDisplayedPublications());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // showPager
  // ----------------------------------------------------------------------  
  
  protected  String showPager = channel.getTypeFieldEntry(PortletQueryForeach.class, "showPager", true).getDefaultTextString();
  
  public String getShowPager() { return showPager; }
  
  public void setShowPager(String v) { showPager = v; }
  
  
  
  public String getShowPager(String lang) { return showPager; }
  public String getShowPager(String lang, boolean useDefault) { return showPager; }
  private static String[] showPagerValues;  
  private static String[] showPagerLabels;
  private static Map<String, String[]> showPagerLabelsMap;
  
  public static String[] getShowPagerValues() {
    if(showPagerValues == null) {
      setShowPagerValues(channel.getTypeFieldEntry(PortletQueryForeach.class, "showPager", true).getEnumerateValues());
    }
    return showPagerValues;
  }
  public static void setShowPagerValues(String[] values) {
    showPagerValues = values;
  }
  public static String[] getShowPagerLabels() {
    if(showPagerLabels == null) {
      setShowPagerLabels(channel.getTypeFieldEntry(PortletQueryForeach.class, "showPager", true).getEnumerateLabels());
    }
    return showPagerLabels;
  }
  public static void setShowPagerLabels(String[] labels) {
    showPagerLabels = labels;
  }
  public static Map<String, String[]> getShowPagerLabelsMap() {
    if(showPagerLabelsMap == null) {
      setShowPagerLabelsMap(channel.getTypeFieldEntry(PortletQueryForeach.class, "showPager", true).getEnumerateLabelsMap());
    }
    return showPagerLabelsMap;
  }
  public static void setShowPagerLabelsMap(Map<String, String[]> LabelsMap) {
    showPagerLabelsMap = LabelsMap;
  }
  public static String[] getShowPagerLabels(String userLang) {
    Map<String, String[]> showPagerLabelMap = getShowPagerLabelsMap();
    String[] labels = (String[])showPagerLabelMap.get(userLang);
    if (labels == null) {
      labels = (String[])showPagerLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getShowPagerLabel(String value, String userLang) {
    String[] labels = getShowPagerLabels(userLang);
    int i = 0;
    if (false) {
    }
    else if (value.equals("Link")) {
      i = 0;
    }
    else if (value.equals("Yes")) {
      i = 1;
    }
    else if (value.equals("ShowMore")) {
      i = 2;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return getShowPagerLabel(value, channel.getLanguage());
  }
  
  public static String getShowPagerLabel(String value) {    
    String[] showPagerLabels = getShowPagerLabels();
    if (false) {
    }
    else if (value.equals("Link")) {
      return showPagerLabels[0];
    }
    else if (value.equals("Yes")) {
      return showPagerLabels[1];
    }
    else if (value.equals("ShowMore")) {
      return showPagerLabels[2];
    }
    return "???";
  }
  public static EnumerateFormReport getShowPagerReport(SortedSet<PortletQueryForeach> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (PortletQueryForeach obj : set) {
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getShowPager());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // pagerLabel
  // ----------------------------------------------------------------------  
  
  protected  String pagerLabel = channel.getTypeFieldEntry(PortletQueryForeach.class, "pagerLabel", true).getDefaultTextString();
  
  public String getPagerLabel() { return pagerLabel; }
  
  public void setPagerLabel(String v) { pagerLabel = v; }
  
  
  
  
  protected HashMap<String,String> pagerLabelML = channel.getTypeFieldEntry(PortletQueryForeach.class, "pagerLabel", true).getDefaultTextMap();
  public String getPagerLabel(String lang) { return (String)channel.getLangValue(lang, true, pagerLabel, pagerLabelML, getMainLanguage()); }
  public String getPagerLabel(String lang, boolean useDefault) { return (String)channel.getLangValue(lang, useDefault, pagerLabel, pagerLabelML, getMainLanguage()); }
  public HashMap<String,String> getPagerLabelML() { return pagerLabelML; }
  public void setPagerLabelML(HashMap<String,String> v) { pagerLabelML = v; }
  
  public String getPagerLabelMLE() { 
    return JcmsUtil.encodeMLE(getPagerLabelML());
  }
  
  public void setPagerLabelMLE(String v) {
    setPagerLabelML(JcmsUtil.decodeMLE(v));
  }
  
  public void setPagerLabel(String lang, String value) {
    if (channel.getLanguage().equals(lang)) {
      pagerLabel = value;
      return;
    }
    if (pagerLabelML == null) {
      pagerLabelML = new HashMap<>();
    } else if (this != channel.getData(id)) {
      pagerLabelML = new HashMap<>(pagerLabelML);
    }
    pagerLabelML.put(lang, value);
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
  
  
  
  public static IntegerFormReport getPagerAllLimitReport(SortedSet<PortletQueryForeach> set) {
    long sum = 0;
    int min = Integer.MAX_VALUE;
    int max = Integer.MIN_VALUE;
    for (PortletQueryForeach obj : set) {
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
    TypeFieldEntry tfe = channel.getTypeFieldEntry(PortletQueryForeach.class, "hideWhenNoResults", true);
    String onLabel = (String) tfe.getOnLabel(userLang);
    String offLabel = (String) tfe.getOffLabel(userLang);
    
    return new String[]{ onLabel, offLabel };
  }
  public static EnumerateFormReport getHideWhenNoResultsReport(SortedSet<PortletQueryForeach> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (PortletQueryForeach obj : set) {
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getHideWhenNoResults());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // firstPublications
  // ----------------------------------------------------------------------  
  
  protected  com.jalios.jcms.Content[] firstPublications;
  
  public com.jalios.jcms.Content[] getFirstPublications() {
    return getFirstPublications(true);
  }
  public com.jalios.jcms.Content[] getFirstPublications(boolean queryDB) { 
    if (!queryDB || Util.isEmpty(firstPublicationsDBID)) {
      return firstPublications;
    }
    return mergeHybridLink(com.jalios.jcms.Content.class, firstPublications, firstPublicationsDBID);
  }
  protected String[] firstPublicationsDBID;
  public String[] getFirstPublicationsDBID() {
    return firstPublicationsDBID;
  }
  public void setFirstPublications(com.jalios.jcms.Content[] v) { 
    firstPublications = v == null ? null : v.clone(); 
  }
  
  public void setFirstPublicationsDBID(String[] v) { 
    firstPublicationsDBID = v; 
  }
  
  
  // ----------------------------------------------------------------------
  // showInCurrentPortal
  // ----------------------------------------------------------------------  
  
  protected  boolean showInCurrentPortal = false;
  
  public boolean getShowInCurrentPortal() { return showInCurrentPortal; }
  
  public void setShowInCurrentPortal(boolean v) { showInCurrentPortal = v; }
  
  
  
  public String getShowInCurrentPortalLabel(String lang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(this.getClass(), "showInCurrentPortal", true);
    return showInCurrentPortal ? tfe.getOnLabel(lang) : tfe.getOffLabel(lang); 
  }
  public static String[] getShowInCurrentPortalValues() {
    return new String[]{ "true" , "false" };
  }
  
  public static String[] getShowInCurrentPortalLabels(String userLang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(PortletQueryForeach.class, "showInCurrentPortal", true);
    String onLabel = (String) tfe.getOnLabel(userLang);
    String offLabel = (String) tfe.getOffLabel(userLang);
    
    return new String[]{ onLabel, offLabel };
  }
  public static EnumerateFormReport getShowInCurrentPortalReport(SortedSet<PortletQueryForeach> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (PortletQueryForeach obj : set) {
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getShowInCurrentPortal());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // contextCategory
  // ----------------------------------------------------------------------  
  
  protected  boolean contextCategory = false;
  
  public boolean getContextCategory() { return contextCategory; }
  
  public void setContextCategory(boolean v) { contextCategory = v; }
  
  
  
  public String getContextCategoryLabel(String lang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(this.getClass(), "contextCategory", true);
    return contextCategory ? tfe.getOnLabel(lang) : tfe.getOffLabel(lang); 
  }
  public static String[] getContextCategoryValues() {
    return new String[]{ "true" , "false" };
  }
  
  public static String[] getContextCategoryLabels(String userLang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(PortletQueryForeach.class, "contextCategory", true);
    String onLabel = (String) tfe.getOnLabel(userLang);
    String offLabel = (String) tfe.getOffLabel(userLang);
    
    return new String[]{ onLabel, offLabel };
  }
  public static EnumerateFormReport getContextCategoryReport(SortedSet<PortletQueryForeach> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (PortletQueryForeach obj : set) {
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getContextCategory());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // publications
  // ----------------------------------------------------------------------  
  
  protected  com.jalios.jcms.Publication[] publications;
  
  public com.jalios.jcms.Publication[] getPublications() {
    return getPublications(true);
  }
  public com.jalios.jcms.Publication[] getPublications(boolean queryDB) { 
    if (!queryDB || Util.isEmpty(publicationsDBID)) {
      return publications;
    }
    return mergeHybridLink(com.jalios.jcms.Publication.class, publications, publicationsDBID);
  }
  protected String[] publicationsDBID;
  public String[] getPublicationsDBID() {
    return publicationsDBID;
  }
  public void setPublications(com.jalios.jcms.Publication[] v) { 
    publications = v == null ? null : v.clone(); 
  }
  
  public void setPublicationsDBID(String[] v) { 
    publicationsDBID = v; 
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
    JcmsUtil.addData(set, clazz, getFirstPublications());
    JcmsUtil.addData(set, clazz, getOriginalPortlet());
    JcmsUtil.addData(set, clazz, getPublications());
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
    
    if (maxResults < 0 ) {
      status = new ControllerStatus();
      status.setProp("msg.edit.lesser-number", channel.getTypeFieldLabel(this, "maxResults"), "0");
      return status;      
    }
    if (maxResults > 500 ) {
      status = new ControllerStatus();
      status.setProp("msg.edit.greater-number", channel.getTypeFieldLabel(this, "maxResults"), "500");
      return status;      
    }
    if (skipFirstResults < 0 ) {
      status = new ControllerStatus();
      status.setProp("msg.edit.lesser-number", channel.getTypeFieldLabel(this, "skipFirstResults"), "0");
      return status;      
    }
    if (skipFirstResults > 500 ) {
      status = new ControllerStatus();
      status.setProp("msg.edit.greater-number", channel.getTypeFieldLabel(this, "skipFirstResults"), "500");
      return status;      
    }
    if (pageSizes != null) {
      for(int i = 0; i < pageSizes.length; i++) {
        if (pageSizes[i] < 1 ) {
          status = new ControllerStatus();
          status.setProp("msg.edit.lesser-number", channel.getTypeFieldLabel(this, "pageSizes"), "1");
          return status;      
        }
      } 
    }
    if (pageSizes != null) {
      for(int i = 0; i < pageSizes.length; i++) {
        if (pageSizes[i] > 500 ) {
          status = new ControllerStatus();
          status.setProp("msg.edit.greater-number", channel.getTypeFieldLabel(this, "pageSizes"), "500");
          return status;      
        }
      } 
    }
    return ControllerStatus.OK;
  }
  
  // ----------------------------------------------------------------------
  // splitHybridCollections
  // ----------------------------------------------------------------------
  @Override
  protected void splitHybridCollections(Data previousData) {
    super.splitHybridCollections(previousData);
    PortletQueryForeach previous = (PortletQueryForeach)previousData;
  
    if (previous == null || previous.firstPublications != firstPublications) {
      firstPublicationsDBID = computeDBIDArray(firstPublications);
    }
  
    if (previous == null || previous.publications != publications) {
      publicationsDBID = computeDBIDArray(publications);
    }
  }
  
  // ----------------------------------------------------------------------
  // cleanHybridCollections
  // ----------------------------------------------------------------------
  @Override
  protected void cleanHybridCollections() {
    super.cleanHybridCollections();
    cleanHybridCollection(firstPublications);
    cleanHybridCollection(publications);
  }
  
  // ----------------------------------------------------------------------
  // WorkCopy
  // ----------------------------------------------------------------------  
  protected void prepareMergeCopy(Publication mergeCopy) {
    super.prepareMergeCopy(mergeCopy);  
    ((PortletQueryForeach)mergeCopy).setSearchInDB(getSearchInDB());
    ((PortletQueryForeach)mergeCopy).setQueries(getQueries());
    ((PortletQueryForeach)mergeCopy).setRefineQueries(getRefineQueries());
    ((PortletQueryForeach)mergeCopy).setRefineWithContextualCategories(getRefineWithContextualCategories());
    ((PortletQueryForeach)mergeCopy).setDisplayMode(getDisplayMode());
    ((PortletQueryForeach)mergeCopy).setOrderBy(getOrderBy());
    ((PortletQueryForeach)mergeCopy).setReverseOrder(getReverseOrder());
    ((PortletQueryForeach)mergeCopy).setMaxResults(getMaxResults());
    ((PortletQueryForeach)mergeCopy).setSkipFirstResults(getSkipFirstResults());
    ((PortletQueryForeach)mergeCopy).setSkipDisplayedPublications(getSkipDisplayedPublications());
    ((PortletQueryForeach)mergeCopy).setShowPager(getShowPager());
    ((PortletQueryForeach)mergeCopy).setPagerLabel(getPagerLabel());
    ((PortletQueryForeach)mergeCopy).setPagerLabelML(JcmsUtil.getMergedMLMap(getPagerLabelML(), ((PortletQueryForeach)mergeCopy).getPagerLabelML()));
    ((PortletQueryForeach)mergeCopy).setPageSizes(getPageSizes());
    ((PortletQueryForeach)mergeCopy).setPagerAllLimit(getPagerAllLimit());
    ((PortletQueryForeach)mergeCopy).setHideWhenNoResults(getHideWhenNoResults());
    ((PortletQueryForeach)mergeCopy).setFirstPublications(getFirstPublications());
    ((PortletQueryForeach)mergeCopy).setShowInCurrentPortal(getShowInCurrentPortal());
    ((PortletQueryForeach)mergeCopy).setContextCategory(getContextCategory());
    ((PortletQueryForeach)mergeCopy).setPublications(getPublications());
  }
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// 735De7FDFgmp83AVIUmZWQ==
