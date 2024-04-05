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
public  class PortletSearch extends generated.AbstractPortletSkinable 
             implements 
                com.jalios.jstore.Searchable
{
  
  // ----------------------------------------------------------------------
  // CONSTRUCTORS
  // ----------------------------------------------------------------------  
  public PortletSearch() {}
 
 
  public PortletSearch(AbstractPortletSkinable other) {
    super(other);
  }
 
  
  
  
  public PortletSearch(PortletSearch other) {
    super(other);
    titleText = other.titleText;
    titleTextML = other.titleTextML;
    searchWith = other.searchWith;
    searchIn = other.searchIn;
    instantSearch = other.instantSearch;
    query = other.query;
    refineQueries = other.refineQueries;
    queryPortlet = other.queryPortlet;
    displayPortal = other.displayPortal;
    displayPortalDBID = other.displayPortalDBID;
    advancedSearchPortlet = other.advancedSearchPortlet;
  }
  
  // ----------------------------------------------------------------------
  // Import / Export
  // ----------------------------------------------------------------------
  public void importXml(org.jdom.Element elt, ImportOptions options) {
    super.importXml(elt, options);
    
    setTitleText(ImportUtil.parseFieldText(elt, "titleText"));
    setTitleTextML(ImportUtil.parseFieldTextML(elt, "titleTextML"));
    setSearchWith(ImportUtil.parseFieldText(elt, "searchWith"));
    setSearchIn(ImportUtil.parseFieldTextArray(elt, "searchIn"));
    setInstantSearch(ImportUtil.parseFieldBoolean(elt, "instantSearch"));
    setQuery(ImportUtil.parseFieldText(elt, "query"));
    setRefineQueries(ImportUtil.parseFieldText(elt, "refineQueries"));
  }
  
  protected void importXmlFieldsWithReferences(org.jdom.Element elt, ImportOptions options) {
    super.importXmlFieldsWithReferences(elt, options);
      
    if (options.isSelfImport()) {
      setQueryPortlet(ImportUtil.parseSelfFieldData(elt, "queryPortlet", generated.PortletQueryForeach.class));
      setAdvancedSearchPortlet(ImportUtil.parseSelfFieldData(elt, "advancedSearchPortlet", generated.PortletSearch.class));
    } else {
    
    setQueryPortlet((generated.PortletQueryForeach)ImportUtil.parseFieldData(elt, "queryPortlet"));
    setAdvancedSearchPortlet((generated.PortletSearch)ImportUtil.parseFieldData(elt, "advancedSearchPortlet"));
    }
  }
  
  public void exportXmlField(StringBuffer sb, int indentLevel) {
    super.exportXmlField(sb, indentLevel);
    sb.append(ExportUtil.exportField(indentLevel, "titleText", getTitleText(), "titleTextML", false, true));
    sb.append(ExportUtil.exportField(indentLevel, "titleTextML", getTitleTextML(), true));
    sb.append(ExportUtil.exportField(indentLevel, "searchWith", getSearchWith(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "searchIn", getSearchIn(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "instantSearch", getInstantSearch()));
    sb.append(ExportUtil.exportField(indentLevel, "query", getQuery(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "refineQueries", getRefineQueries(), true, true));
    sb.append(ExportUtil.exportField(indentLevel, "queryPortlet", getQueryPortlet()));
    sb.append(ExportUtil.exportField(indentLevel, "displayPortal", getDisplayPortal()));
    sb.append(ExportUtil.exportField(indentLevel, "advancedSearchPortlet", getAdvancedSearchPortlet()));
  }
  
  public Set<FileDocument> getDocumentLinkSet() {
    Set<FileDocument> docSet = super.getDocumentLinkSet();
    return docSet;
  }
  
  // ----------------------------------------------------------------------
  // TYPE AND FIELD INFOS (static methods)
  // ----------------------------------------------------------------------  
  /**
   * Returns the TypeEntry bound to <code>PortletSearch</code>. <br>
   * @see com.jalios.jcms.Channel#getTypeEntry(Class)
   * @since jcms-5.5
   */
  public static TypeEntry getTypeEntry() {
    return channel.getTypeEntry(PortletSearch.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>PortletSearch</code>. <br>
   * This array <strong>does not</strong> contain inherited TypeFieldEntry from super classes of <code>PortletSearch</code>. <br/>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>PortletSearch</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getTypeFieldEntries() {
    return channel.getTypeFieldEntries(PortletSearch.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>PortletSearch</code>. <br>
   * This array <strong>does</strong> contain inherited TypeFieldEntry from super classes of <code>PortletSearch</code>. <br>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>PortletSearch</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getAllTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getAllTypeFieldEntries() {
    return channel.getAllTypeFieldEntries(PortletSearch.class);
  }
  // ----------------------------------------------------------------------
  // FIELDs VALUE
  // ----------------------------------------------------------------------  
  /**
   * Gets the value of the given <code>int</code> field name for the current <code>PortletSearch</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public int getIntFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getIntFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>int</code> field name for the current <code>PortletSearch</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setIntFieldValue(String fieldName, int value) throws NoSuchFieldException {
    super.setIntFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>long</code> field name for the current <code>PortletSearch</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public long getLongFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getLongFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>long</code> field name for the current <code>PortletSearch</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setLongFieldValue(String fieldName, long value) throws NoSuchFieldException {
    super.setLongFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>double</code> field name for the current <code>PortletSearch</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public double getDoubleFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getDoubleFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>double</code> field name for the current <code>PortletSearch</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setDoubleFieldValue(String fieldName, double value) throws NoSuchFieldException {
     super.setDoubleFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>boolean</code> field name for the current <code>PortletSearch</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public boolean getBooleanFieldValue(String fieldName) throws NoSuchFieldException {
    if ("instantSearch".equals(fieldName)) { return getInstantSearch(); }
    return super.getBooleanFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>boolean</code> field name for the current <code>PortletSearch</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setBooleanFieldValue(String fieldName, boolean value) throws NoSuchFieldException {
    if ("instantSearch".equals(fieldName)) { setInstantSearch(value); return; }
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
   * Gets the <code>Object</code> value of the given field name for this <code>PortletSearch</code>. <br>
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
    if ("titleText".equals(fieldName)) { return getTitleText(lang, useDefault); }
    if ("searchWith".equals(fieldName)) { return getSearchWith(); }
    if ("searchIn".equals(fieldName)) { return getSearchIn(); }
    if ("query".equals(fieldName)) { return getQuery(); }
    if ("refineQueries".equals(fieldName)) { return getRefineQueries(); }
    if ("queryPortlet".equals(fieldName)) { return getQueryPortlet(); }
    if ("displayPortal".equals(fieldName)) { return getDisplayPortal(); }
    if ("advancedSearchPortlet".equals(fieldName)) { return getAdvancedSearchPortlet(); }
    return super.getFieldValue(fieldName, lang, useDefault);
  }
  
  /**
   * Sets the <code>Object</code> value of the given field name for this <code>PortletSearch</code>. <br>
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
    if ("titleText".equals(fieldName)) { setTitleText(lang,(String)value); return; }
    if ("searchWith".equals(fieldName)) { setSearchWith((String)value); return; }
    if ("searchIn".equals(fieldName)) { setSearchIn((String[])value); return; }
    if ("query".equals(fieldName)) { setQuery((String)value); return; }
    if ("refineQueries".equals(fieldName)) { setRefineQueries((String)value); return; }
    if ("queryPortlet".equals(fieldName)) { setQueryPortlet((generated.PortletQueryForeach)value); return; }
    if ("displayPortal".equals(fieldName)) { setDisplayPortal((Publication)value); return; }
    if ("advancedSearchPortlet".equals(fieldName)) { setAdvancedSearchPortlet((generated.PortletSearch)value); return; }
    super.setFieldValue(fieldName, value, lang);
  }
  
  // ----------------------------------------------------------------------
  // titleText
  // ----------------------------------------------------------------------  
  
  protected  String titleText = channel.getTypeFieldEntry(PortletSearch.class, "titleText", true).getDefaultTextString();
  
  public String getTitleText() { return titleText; }
  
  public void setTitleText(String v) { titleText = v; }
  
  
  
  
  protected HashMap<String,String> titleTextML = channel.getTypeFieldEntry(PortletSearch.class, "titleText", true).getDefaultTextMap();
  public String getTitleText(String lang) { return (String)channel.getLangValue(lang, true, titleText, titleTextML, getMainLanguage()); }
  public String getTitleText(String lang, boolean useDefault) { return (String)channel.getLangValue(lang, useDefault, titleText, titleTextML, getMainLanguage()); }
  public HashMap<String,String> getTitleTextML() { return titleTextML; }
  public void setTitleTextML(HashMap<String,String> v) { titleTextML = v; }
  
  public String getTitleTextMLE() { 
    return JcmsUtil.encodeMLE(getTitleTextML());
  }
  
  public void setTitleTextMLE(String v) {
    setTitleTextML(JcmsUtil.decodeMLE(v));
  }
  
  public void setTitleText(String lang, String value) {
    if (channel.getLanguage().equals(lang)) {
      titleText = value;
      return;
    }
    if (titleTextML == null) {
      titleTextML = new HashMap<>();
    } else if (this != channel.getData(id)) {
      titleTextML = new HashMap<>(titleTextML);
    }
    titleTextML.put(lang, value);
  }
  // ----------------------------------------------------------------------
  // searchWith
  // ----------------------------------------------------------------------  
  
  protected  String searchWith = channel.getTypeFieldEntry(PortletSearch.class, "searchWith", true).getDefaultTextString();
  
  public String getSearchWith() { return searchWith; }
  
  public void setSearchWith(String v) { searchWith = v; }
  
  
  
  public String getSearchWith(String lang) { return searchWith; }
  public String getSearchWith(String lang, boolean useDefault) { return searchWith; }
  private static String[] searchWithValues;  
  private static String[] searchWithLabels;
  private static Map<String, String[]> searchWithLabelsMap;
  
  public static String[] getSearchWithValues() {
    if(searchWithValues == null) {
      setSearchWithValues(channel.getTypeFieldEntry(PortletSearch.class, "searchWith", true).getEnumerateValues());
    }
    return searchWithValues;
  }
  public static void setSearchWithValues(String[] values) {
    searchWithValues = values;
  }
  public static String[] getSearchWithLabels() {
    if(searchWithLabels == null) {
      setSearchWithLabels(channel.getTypeFieldEntry(PortletSearch.class, "searchWith", true).getEnumerateLabels());
    }
    return searchWithLabels;
  }
  public static void setSearchWithLabels(String[] labels) {
    searchWithLabels = labels;
  }
  public static Map<String, String[]> getSearchWithLabelsMap() {
    if(searchWithLabelsMap == null) {
      setSearchWithLabelsMap(channel.getTypeFieldEntry(PortletSearch.class, "searchWith", true).getEnumerateLabelsMap());
    }
    return searchWithLabelsMap;
  }
  public static void setSearchWithLabelsMap(Map<String, String[]> LabelsMap) {
    searchWithLabelsMap = LabelsMap;
  }
  public static String[] getSearchWithLabels(String userLang) {
    Map<String, String[]> searchWithLabelMap = getSearchWithLabelsMap();
    String[] labels = (String[])searchWithLabelMap.get(userLang);
    if (labels == null) {
      labels = (String[])searchWithLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getSearchWithLabel(String value, String userLang) {
    String[] labels = getSearchWithLabels(userLang);
    int i = 0;
    if (false) {
    }
    else if (value.equals("all")) {
      i = 0;
    }
    else if (value.equals("any")) {
      i = 1;
    }
    else if (value.equals("exact")) {
      i = 2;
    }
    else if (value.equals("advanced")) {
      i = 3;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return getSearchWithLabel(value, channel.getLanguage());
  }
  
  public static String getSearchWithLabel(String value) {    
    String[] searchWithLabels = getSearchWithLabels();
    if (false) {
    }
    else if (value.equals("all")) {
      return searchWithLabels[0];
    }
    else if (value.equals("any")) {
      return searchWithLabels[1];
    }
    else if (value.equals("exact")) {
      return searchWithLabels[2];
    }
    else if (value.equals("advanced")) {
      return searchWithLabels[3];
    }
    return "???";
  }
  public static EnumerateFormReport getSearchWithReport(SortedSet<PortletSearch> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (PortletSearch obj : set) {
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getSearchWith());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // searchIn
  // ----------------------------------------------------------------------  
  
  protected  String[] searchIn;
  
  public String[] getSearchIn() { return searchIn; }
  
  public void setSearchIn(String[] v) { searchIn = v; }
  
  
  
  public String[] getSearchIn(String lang) { return searchIn; }
  public String[] getSearchIn(String lang, boolean useDefault) { return searchIn; }
  private static String[] searchInValues;  
  private static String[] searchInLabels;
  private static Map<String, String[]> searchInLabelsMap;
  
  public static String[] getSearchInValues() {
    if(searchInValues == null) {
      setSearchInValues(channel.getTypeFieldEntry(PortletSearch.class, "searchIn", true).getEnumerateValues());
    }
    return searchInValues;
  }
  public static void setSearchInValues(String[] values) {
    searchInValues = values;
  }
  public static String[] getSearchInLabels() {
    if(searchInLabels == null) {
      setSearchInLabels(channel.getTypeFieldEntry(PortletSearch.class, "searchIn", true).getEnumerateLabels());
    }
    return searchInLabels;
  }
  public static void setSearchInLabels(String[] labels) {
    searchInLabels = labels;
  }
  public static Map<String, String[]> getSearchInLabelsMap() {
    if(searchInLabelsMap == null) {
      setSearchInLabelsMap(channel.getTypeFieldEntry(PortletSearch.class, "searchIn", true).getEnumerateLabelsMap());
    }
    return searchInLabelsMap;
  }
  public static void setSearchInLabelsMap(Map<String, String[]> LabelsMap) {
    searchInLabelsMap = LabelsMap;
  }
  public static String[] getSearchInLabels(String userLang) {
    Map<String, String[]> searchInLabelMap = getSearchInLabelsMap();
    String[] labels = (String[])searchInLabelMap.get(userLang);
    if (labels == null) {
      labels = (String[])searchInLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getSearchInLabel(String value, String userLang) {
    String[] labels = getSearchInLabels(userLang);
    int i = 0;
    if (false) {
    }
    else if (value.equals("catName")) {
      i = 0;
    }
    else if (value.equals("searchInFiles")) {
      i = 1;
    }
    else if (value.equals("searchInMembers")) {
      i = 2;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return getSearchInLabel(value, channel.getLanguage());
  }
  
  public static String getSearchInLabel(String value) {    
    String[] searchInLabels = getSearchInLabels();
    if (false) {
    }
    else if (value.equals("catName")) {
      return searchInLabels[0];
    }
    else if (value.equals("searchInFiles")) {
      return searchInLabels[1];
    }
    else if (value.equals("searchInMembers")) {
      return searchInLabels[2];
    }
    return "???";
  }
  public static EnumerateFormReport getSearchInReport(SortedSet<PortletSearch> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (PortletSearch obj : set) {
      if (obj == null || obj.getSearchIn() == null) {
        continue;
      }
      for(int i = 0; i < obj.getSearchIn().length; i++) {
        if (obj.getSearchIn()[i] != null) {
          map.inc(obj.getSearchIn()[i]);
        }
      }
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // instantSearch
  // ----------------------------------------------------------------------  
  
  protected  boolean instantSearch = true;
  
  public boolean getInstantSearch() { return instantSearch; }
  
  public void setInstantSearch(boolean v) { instantSearch = v; }
  
  
  
  public String getInstantSearchLabel(String lang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(this.getClass(), "instantSearch", true);
    return instantSearch ? tfe.getOnLabel(lang) : tfe.getOffLabel(lang); 
  }
  public static String[] getInstantSearchValues() {
    return new String[]{ "true" , "false" };
  }
  
  public static String[] getInstantSearchLabels(String userLang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(PortletSearch.class, "instantSearch", true);
    String onLabel = (String) tfe.getOnLabel(userLang);
    String offLabel = (String) tfe.getOffLabel(userLang);
    
    return new String[]{ onLabel, offLabel };
  }
  public static EnumerateFormReport getInstantSearchReport(SortedSet<PortletSearch> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (PortletSearch obj : set) {
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getInstantSearch());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // query
  // ----------------------------------------------------------------------  
  
  protected  String query = channel.getTypeFieldEntry(PortletSearch.class, "query", true).getDefaultTextString();
  
  public String getQuery() { return query; }
  
  public void setQuery(String v) { query = v; }
  
  
  
  public String getQuery(String lang) { return query; }
  public String getQuery(String lang, boolean useDefault) { return query; }
  // ----------------------------------------------------------------------
  // refineQueries
  // ----------------------------------------------------------------------  
  
  protected  String refineQueries = channel.getTypeFieldEntry(PortletSearch.class, "refineQueries", true).getDefaultTextString();
  
  public String getRefineQueries() { return refineQueries; }
  
  public void setRefineQueries(String v) { refineQueries = v; }
  
  
  
  public String getRefineQueries(String lang) { return refineQueries; }
  public String getRefineQueries(String lang, boolean useDefault) { return refineQueries; }
  private static String[] refineQueriesValues;  
  private static String[] refineQueriesLabels;
  private static Map<String, String[]> refineQueriesLabelsMap;
  
  public static String[] getRefineQueriesValues() {
    if(refineQueriesValues == null) {
      setRefineQueriesValues(channel.getTypeFieldEntry(PortletSearch.class, "refineQueries", true).getEnumerateValues());
    }
    return refineQueriesValues;
  }
  public static void setRefineQueriesValues(String[] values) {
    refineQueriesValues = values;
  }
  public static String[] getRefineQueriesLabels() {
    if(refineQueriesLabels == null) {
      setRefineQueriesLabels(channel.getTypeFieldEntry(PortletSearch.class, "refineQueries", true).getEnumerateLabels());
    }
    return refineQueriesLabels;
  }
  public static void setRefineQueriesLabels(String[] labels) {
    refineQueriesLabels = labels;
  }
  public static Map<String, String[]> getRefineQueriesLabelsMap() {
    if(refineQueriesLabelsMap == null) {
      setRefineQueriesLabelsMap(channel.getTypeFieldEntry(PortletSearch.class, "refineQueries", true).getEnumerateLabelsMap());
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
    else if (value.equals("None")) {
      i = 0;
    }
    else if (value.equals("Portal")) {
      i = 1;
    }
    else if (value.equals("Current")) {
      i = 2;
    }
    else if (value.equals("CurrentWS")) {
      i = 3;
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
    else if (value.equals("None")) {
      return refineQueriesLabels[0];
    }
    else if (value.equals("Portal")) {
      return refineQueriesLabels[1];
    }
    else if (value.equals("Current")) {
      return refineQueriesLabels[2];
    }
    else if (value.equals("CurrentWS")) {
      return refineQueriesLabels[3];
    }
    return "???";
  }
  public static EnumerateFormReport getRefineQueriesReport(SortedSet<PortletSearch> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (PortletSearch obj : set) {
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getRefineQueries());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // queryPortlet
  // ----------------------------------------------------------------------  
  
  protected  generated.PortletQueryForeach queryPortlet;
  
  public generated.PortletQueryForeach getQueryPortlet() { return queryPortlet; }
  
  public void setQueryPortlet(generated.PortletQueryForeach v) { queryPortlet = v; }
  
  
  
  // ----------------------------------------------------------------------
  // displayPortal
  // ----------------------------------------------------------------------  
  
  protected  Publication displayPortal;
  
  public Publication getDisplayPortal() { 
    return getDisplayPortal(true);
  }
  public Publication getDisplayPortal(boolean queryDB) { 
   if (displayPortal != null) {
      return displayPortal;
    }
    if (queryDB && Util.notEmpty(displayPortalDBID)) {
      return channel.getData(Publication.class, displayPortalDBID);
    }
    return null;
  }
  protected String displayPortalDBID;
  public String getDisplayPortalDBID() { return displayPortalDBID; }
  public void setDisplayPortal(Publication v) {
    if (v == null) {
      displayPortal = null;
      displayPortalDBID =null;
      return;
    }  
  
    if (v instanceof DBData) {
      setDisplayPortalDBID(v.getId());
    } else {
      displayPortal = v;
    }
  }
  public void setDisplayPortalDBID(String v) { 
    displayPortalDBID = v;
    if (Util.notEmpty(displayPortalDBID)) { 
      displayPortal = null;
    };    
  }  
  
  
  // ----------------------------------------------------------------------
  // advancedSearchPortlet
  // ----------------------------------------------------------------------  
  
  protected  generated.PortletSearch advancedSearchPortlet;
  
  public generated.PortletSearch getAdvancedSearchPortlet() { return advancedSearchPortlet; }
  
  public void setAdvancedSearchPortlet(generated.PortletSearch v) { advancedSearchPortlet = v; }
  
  
  
   
  // ----------------------------------------------------------------------
  // abstract
  // ----------------------------------------------------------------------  
  @Override
  public void setAbstract(String lang, String value) { setRefineQueries(value); }
  @Override
  public String getAbstract() { return refineQueries; }
  @Override
  public String getAbstract(String lang, boolean useDefault) { return getRefineQueries(lang, useDefault); }
   
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
    JcmsUtil.addData(set, clazz, getAdvancedSearchPortlet());
    JcmsUtil.addData(set, clazz, getDisplayPortal());
    JcmsUtil.addData(set, clazz, getOriginalPortlet());
    JcmsUtil.addData(set, clazz, getQueryPortlet());
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
    
    return ControllerStatus.OK;
  }
  
  
  // ----------------------------------------------------------------------
  // WorkCopy
  // ----------------------------------------------------------------------  
  protected void prepareMergeCopy(Publication mergeCopy) {
    super.prepareMergeCopy(mergeCopy);  
    ((PortletSearch)mergeCopy).setTitleText(getTitleText());
    ((PortletSearch)mergeCopy).setTitleTextML(JcmsUtil.getMergedMLMap(getTitleTextML(), ((PortletSearch)mergeCopy).getTitleTextML()));
    ((PortletSearch)mergeCopy).setSearchWith(getSearchWith());
    ((PortletSearch)mergeCopy).setSearchIn(getSearchIn());
    ((PortletSearch)mergeCopy).setInstantSearch(getInstantSearch());
    ((PortletSearch)mergeCopy).setQuery(getQuery());
    ((PortletSearch)mergeCopy).setRefineQueries(getRefineQueries());
    ((PortletSearch)mergeCopy).setQueryPortlet(getQueryPortlet());
    ((PortletSearch)mergeCopy).setDisplayPortal(getDisplayPortal());
    ((PortletSearch)mergeCopy).setAdvancedSearchPortlet(getAdvancedSearchPortlet());
  }
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// k3P+QLjNADvFfQ7kp9JG+g==
