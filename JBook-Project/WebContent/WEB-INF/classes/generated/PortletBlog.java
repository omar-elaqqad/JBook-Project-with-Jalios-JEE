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
public  class PortletBlog extends generated.AbstractPortletSkinable 
             implements 
                com.jalios.jstore.Searchable
{
  
  // ----------------------------------------------------------------------
  // CONSTRUCTORS
  // ----------------------------------------------------------------------  
  public PortletBlog() {}
 
 
  public PortletBlog(AbstractPortletSkinable other) {
    super(other);
  }
 
  
  
  
  public PortletBlog(PortletBlog other) {
    super(other);
    displayedList = other.displayedList;
  }
  
  // ----------------------------------------------------------------------
  // Import / Export
  // ----------------------------------------------------------------------
  public void importXml(org.jdom.Element elt, ImportOptions options) {
    super.importXml(elt, options);
    
    setDisplayedList(ImportUtil.parseFieldText(elt, "displayedList"));
  }
  
  protected void importXmlFieldsWithReferences(org.jdom.Element elt, ImportOptions options) {
    super.importXmlFieldsWithReferences(elt, options);
      
    if (options.isSelfImport()) {
    } else {
    
    }
  }
  
  public void exportXmlField(StringBuffer sb, int indentLevel) {
    super.exportXmlField(sb, indentLevel);
    sb.append(ExportUtil.exportField(indentLevel, "displayedList", getDisplayedList(), false, true));
  }
  
  public Set<FileDocument> getDocumentLinkSet() {
    Set<FileDocument> docSet = super.getDocumentLinkSet();
    return docSet;
  }
  
  // ----------------------------------------------------------------------
  // TYPE AND FIELD INFOS (static methods)
  // ----------------------------------------------------------------------  
  /**
   * Returns the TypeEntry bound to <code>PortletBlog</code>. <br>
   * @see com.jalios.jcms.Channel#getTypeEntry(Class)
   * @since jcms-5.5
   */
  public static TypeEntry getTypeEntry() {
    return channel.getTypeEntry(PortletBlog.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>PortletBlog</code>. <br>
   * This array <strong>does not</strong> contain inherited TypeFieldEntry from super classes of <code>PortletBlog</code>. <br/>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>PortletBlog</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getTypeFieldEntries() {
    return channel.getTypeFieldEntries(PortletBlog.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>PortletBlog</code>. <br>
   * This array <strong>does</strong> contain inherited TypeFieldEntry from super classes of <code>PortletBlog</code>. <br>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>PortletBlog</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getAllTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getAllTypeFieldEntries() {
    return channel.getAllTypeFieldEntries(PortletBlog.class);
  }
  // ----------------------------------------------------------------------
  // FIELDs VALUE
  // ----------------------------------------------------------------------  
  /**
   * Gets the value of the given <code>int</code> field name for the current <code>PortletBlog</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public int getIntFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getIntFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>int</code> field name for the current <code>PortletBlog</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setIntFieldValue(String fieldName, int value) throws NoSuchFieldException {
    super.setIntFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>long</code> field name for the current <code>PortletBlog</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public long getLongFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getLongFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>long</code> field name for the current <code>PortletBlog</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setLongFieldValue(String fieldName, long value) throws NoSuchFieldException {
    super.setLongFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>double</code> field name for the current <code>PortletBlog</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public double getDoubleFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getDoubleFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>double</code> field name for the current <code>PortletBlog</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setDoubleFieldValue(String fieldName, double value) throws NoSuchFieldException {
     super.setDoubleFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>boolean</code> field name for the current <code>PortletBlog</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public boolean getBooleanFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getBooleanFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>boolean</code> field name for the current <code>PortletBlog</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
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
  public TreeSet<Category> getCategoryFieldValue(String fieldName, Member mbr) throws NoSuchFieldException {
    return super.getCategoryFieldValue(fieldName, mbr);
  }
  /**
   * Gets the <code>Object</code> value of the given field name for this <code>PortletBlog</code>. <br>
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
    if ("displayedList".equals(fieldName)) { return getDisplayedList(); }
    return super.getFieldValue(fieldName, lang, useDefault);
  }
  
  /**
   * Sets the <code>Object</code> value of the given field name for this <code>PortletBlog</code>. <br>
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
    if ("displayedList".equals(fieldName)) { setDisplayedList((String)value); return; }
    super.setFieldValue(fieldName, value, lang);
  }
  
  // ----------------------------------------------------------------------
  // displayedList
  // ----------------------------------------------------------------------  
  
  protected  String displayedList = channel.getTypeFieldEntry(PortletBlog.class, "displayedList", true).getDefaultTextString();
  
  public String getDisplayedList() { return displayedList; }
  
  public void setDisplayedList(String v) { displayedList = v; }
  
  
  
  public String getDisplayedList(String lang) { return displayedList; }
  public String getDisplayedList(String lang, boolean useDefault) { return displayedList; }
  private static String[] displayedListValues;  
  private static String[] displayedListLabels;
  private static Map<String, String[]> displayedListLabelsMap;
  
  public static String[] getDisplayedListValues() {
    if(displayedListValues == null) {
      setDisplayedListValues(channel.getTypeFieldEntry(PortletBlog.class, "displayedList", true).getEnumerateValues());
    }
    return displayedListValues;
  }
  public static void setDisplayedListValues(String[] values) {
    displayedListValues = values;
  }
  public static String[] getDisplayedListLabels() {
    if(displayedListLabels == null) {
      setDisplayedListLabels(channel.getTypeFieldEntry(PortletBlog.class, "displayedList", true).getEnumerateLabels());
    }
    return displayedListLabels;
  }
  public static void setDisplayedListLabels(String[] labels) {
    displayedListLabels = labels;
  }
  public static Map<String, String[]> getDisplayedListLabelsMap() {
    if(displayedListLabelsMap == null) {
      setDisplayedListLabelsMap(channel.getTypeFieldEntry(PortletBlog.class, "displayedList", true).getEnumerateLabelsMap());
    }
    return displayedListLabelsMap;
  }
  public static void setDisplayedListLabelsMap(Map<String, String[]> LabelsMap) {
    displayedListLabelsMap = LabelsMap;
  }
  public static String[] getDisplayedListLabels(String userLang) {
    Map<String, String[]> displayedListLabelMap = getDisplayedListLabelsMap();
    String[] labels = (String[])displayedListLabelMap.get(userLang);
    if (labels == null) {
      labels = (String[])displayedListLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getDisplayedListLabel(String value, String userLang) {
    String[] labels = getDisplayedListLabels(userLang);
    int i = 0;
    if (false) {
    }
    else if (value.equals("allWorkspace")) {
      i = 0;
    }
    else if (value.equals("workspaceOnly")) {
      i = 1;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return getDisplayedListLabel(value, channel.getLanguage());
  }
  
  public static String getDisplayedListLabel(String value) {    
    String[] displayedListLabels = getDisplayedListLabels();
    if (false) {
    }
    else if (value.equals("allWorkspace")) {
      return displayedListLabels[0];
    }
    else if (value.equals("workspaceOnly")) {
      return displayedListLabels[1];
    }
    return "???";
  }
  public static EnumerateFormReport getDisplayedListReport(SortedSet<PortletBlog> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (PortletBlog obj : set) {
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getDisplayedList());
      
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
  public ControllerStatus checkIntegrity() {
    
    ControllerStatus status = super.checkIntegrity();
    if (status.hasFailed()) {
      return status;
    }
    
    if (Util.isEmpty(displayedList)) {
      status = new ControllerStatus();
      status.setProp("msg.edit.empty-field", channel.getTypeFieldLabel(this, "displayedList"), null);
      return status;
    }
    return ControllerStatus.OK;
  }
  
  
  // ----------------------------------------------------------------------
  // WorkCopy
  // ----------------------------------------------------------------------  
  protected void prepareMergeCopy(Publication mergeCopy) {
    super.prepareMergeCopy(mergeCopy);  
    ((PortletBlog)mergeCopy).setDisplayedList(getDisplayedList());
  }
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// qbGNtg66efGSy6uXvOLILQ==
