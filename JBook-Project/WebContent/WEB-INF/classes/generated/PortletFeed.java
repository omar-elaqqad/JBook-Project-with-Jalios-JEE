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
public  class PortletFeed extends generated.PortletQueryForeach 
             implements 
                com.jalios.jstore.Searchable
{
  
  // ----------------------------------------------------------------------
  // CONSTRUCTORS
  // ----------------------------------------------------------------------  
  public PortletFeed() {}
 
 
  public PortletFeed(AbstractPortletSkinable other) {
    super(other);
  }
  public PortletFeed(PortletQueryForeach other) {
    super(other);
  }
 
  
  
  
  public PortletFeed(PortletFeed other) {
    super(other);
    formats = other.formats;
    copyright = other.copyright;
    copyrightML = other.copyrightML;
    useAuthKey = other.useAuthKey;
  }
  
  // ----------------------------------------------------------------------
  // Import / Export
  // ----------------------------------------------------------------------
  public void importXml(org.jdom.Element elt, ImportOptions options) {
    super.importXml(elt, options);
    
    setFormats(ImportUtil.parseFieldTextArray(elt, "formats"));
    setCopyright(ImportUtil.parseFieldText(elt, "copyright"));
    setCopyrightML(ImportUtil.parseFieldTextML(elt, "copyrightML"));
    setUseAuthKey(ImportUtil.parseFieldBoolean(elt, "useAuthKey"));
  }
  
  protected void importXmlFieldsWithReferences(org.jdom.Element elt, ImportOptions options) {
    super.importXmlFieldsWithReferences(elt, options);
      
    if (options.isSelfImport()) {
    } else {
    
    }
  }
  
  public void exportXmlField(StringBuffer sb, int indentLevel) {
    super.exportXmlField(sb, indentLevel);
    sb.append(ExportUtil.exportField(indentLevel, "formats", getFormats(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "copyright", getCopyright(), "copyrightML", false, true));
    sb.append(ExportUtil.exportField(indentLevel, "copyrightML", getCopyrightML(), true));
    sb.append(ExportUtil.exportField(indentLevel, "useAuthKey", getUseAuthKey()));
  }
  
  public Set<FileDocument> getDocumentLinkSet() {
    Set<FileDocument> docSet = super.getDocumentLinkSet();
    return docSet;
  }
  
  // ----------------------------------------------------------------------
  // TYPE AND FIELD INFOS (static methods)
  // ----------------------------------------------------------------------  
  /**
   * Returns the TypeEntry bound to <code>PortletFeed</code>. <br>
   * @see com.jalios.jcms.Channel#getTypeEntry(Class)
   * @since jcms-5.5
   */
  public static TypeEntry getTypeEntry() {
    return channel.getTypeEntry(PortletFeed.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>PortletFeed</code>. <br>
   * This array <strong>does not</strong> contain inherited TypeFieldEntry from super classes of <code>PortletFeed</code>. <br/>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>PortletFeed</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getTypeFieldEntries() {
    return channel.getTypeFieldEntries(PortletFeed.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>PortletFeed</code>. <br>
   * This array <strong>does</strong> contain inherited TypeFieldEntry from super classes of <code>PortletFeed</code>. <br>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>PortletFeed</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getAllTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getAllTypeFieldEntries() {
    return channel.getAllTypeFieldEntries(PortletFeed.class);
  }
  // ----------------------------------------------------------------------
  // FIELDs VALUE
  // ----------------------------------------------------------------------  
  /**
   * Gets the value of the given <code>int</code> field name for the current <code>PortletFeed</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public int getIntFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getIntFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>int</code> field name for the current <code>PortletFeed</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setIntFieldValue(String fieldName, int value) throws NoSuchFieldException {
    super.setIntFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>long</code> field name for the current <code>PortletFeed</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public long getLongFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getLongFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>long</code> field name for the current <code>PortletFeed</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setLongFieldValue(String fieldName, long value) throws NoSuchFieldException {
    super.setLongFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>double</code> field name for the current <code>PortletFeed</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public double getDoubleFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getDoubleFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>double</code> field name for the current <code>PortletFeed</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setDoubleFieldValue(String fieldName, double value) throws NoSuchFieldException {
     super.setDoubleFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>boolean</code> field name for the current <code>PortletFeed</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public boolean getBooleanFieldValue(String fieldName) throws NoSuchFieldException {
    if ("useAuthKey".equals(fieldName)) { return getUseAuthKey(); }
    return super.getBooleanFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>boolean</code> field name for the current <code>PortletFeed</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setBooleanFieldValue(String fieldName, boolean value) throws NoSuchFieldException {
    if ("useAuthKey".equals(fieldName)) { setUseAuthKey(value); return; }
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
   * Gets the <code>Object</code> value of the given field name for this <code>PortletFeed</code>. <br>
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
    if ("formats".equals(fieldName)) { return getFormats(); }
    if ("copyright".equals(fieldName)) { return getCopyright(lang, useDefault); }
    return super.getFieldValue(fieldName, lang, useDefault);
  }
  
  /**
   * Sets the <code>Object</code> value of the given field name for this <code>PortletFeed</code>. <br>
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
    if ("formats".equals(fieldName)) { setFormats((String[])value); return; }
    if ("copyright".equals(fieldName)) { setCopyright(lang,(String)value); return; }
    super.setFieldValue(fieldName, value, lang);
  }
  
  // ----------------------------------------------------------------------
  // formats
  // ----------------------------------------------------------------------  
  
  protected  String[] formats;
  
  public String[] getFormats() { return formats; }
  
  public void setFormats(String[] v) { formats = v; }
  
  
  
  public String[] getFormats(String lang) { return formats; }
  public String[] getFormats(String lang, boolean useDefault) { return formats; }
  private static String[] formatsValues;  
  private static String[] formatsLabels;
  private static Map<String, String[]> formatsLabelsMap;
  
  public static String[] getFormatsValues() {
    if(formatsValues == null) {
      setFormatsValues(channel.getTypeFieldEntry(PortletFeed.class, "formats", true).getEnumerateValues());
    }
    return formatsValues;
  }
  public static void setFormatsValues(String[] values) {
    formatsValues = values;
  }
  public static String[] getFormatsLabels() {
    if(formatsLabels == null) {
      setFormatsLabels(channel.getTypeFieldEntry(PortletFeed.class, "formats", true).getEnumerateLabels());
    }
    return formatsLabels;
  }
  public static void setFormatsLabels(String[] labels) {
    formatsLabels = labels;
  }
  public static Map<String, String[]> getFormatsLabelsMap() {
    if(formatsLabelsMap == null) {
      setFormatsLabelsMap(channel.getTypeFieldEntry(PortletFeed.class, "formats", true).getEnumerateLabelsMap());
    }
    return formatsLabelsMap;
  }
  public static void setFormatsLabelsMap(Map<String, String[]> LabelsMap) {
    formatsLabelsMap = LabelsMap;
  }
  public static String[] getFormatsLabels(String userLang) {
    Map<String, String[]> formatsLabelMap = getFormatsLabelsMap();
    String[] labels = (String[])formatsLabelMap.get(userLang);
    if (labels == null) {
      labels = (String[])formatsLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getFormatsLabel(String value, String userLang) {
    String[] labels = getFormatsLabels(userLang);
    int i = 0;
    if (false) {
    }
    else if (value.equals("Rss091")) {
      i = 0;
    }
    else if (value.equals("Rss1")) {
      i = 1;
    }
    else if (value.equals("Rss2")) {
      i = 2;
    }
    else if (value.equals("Atom03")) {
      i = 3;
    }
    else if (value.equals("Atom1")) {
      i = 4;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return getFormatsLabel(value, channel.getLanguage());
  }
  
  public static String getFormatsLabel(String value) {    
    String[] formatsLabels = getFormatsLabels();
    if (false) {
    }
    else if (value.equals("Rss091")) {
      return formatsLabels[0];
    }
    else if (value.equals("Rss1")) {
      return formatsLabels[1];
    }
    else if (value.equals("Rss2")) {
      return formatsLabels[2];
    }
    else if (value.equals("Atom03")) {
      return formatsLabels[3];
    }
    else if (value.equals("Atom1")) {
      return formatsLabels[4];
    }
    return "???";
  }
  public static EnumerateFormReport getFormatsReport(SortedSet<PortletFeed> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (PortletFeed obj : set) {
      if (obj == null || obj.getFormats() == null) {
        continue;
      }
      for(int i = 0; i < obj.getFormats().length; i++) {
        if (obj.getFormats()[i] != null) {
          map.inc(obj.getFormats()[i]);
        }
      }
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // copyright
  // ----------------------------------------------------------------------  
  
  protected  String copyright = channel.getTypeFieldEntry(PortletFeed.class, "copyright", true).getDefaultTextString();
  
  public String getCopyright() { return copyright; }
  
  public void setCopyright(String v) { copyright = v; }
  
  
  
  
  protected HashMap<String,String> copyrightML = channel.getTypeFieldEntry(PortletFeed.class, "copyright", true).getDefaultTextMap();
  public String getCopyright(String lang) { return (String)channel.getLangValue(lang, true, copyright, copyrightML, getMainLanguage()); }
  public String getCopyright(String lang, boolean useDefault) { return (String)channel.getLangValue(lang, useDefault, copyright, copyrightML, getMainLanguage()); }
  public HashMap<String,String> getCopyrightML() { return copyrightML; }
  public void setCopyrightML(HashMap<String,String> v) { copyrightML = v; }
  
  public String getCopyrightMLE() { 
    return JcmsUtil.encodeMLE(getCopyrightML());
  }
  
  public void setCopyrightMLE(String v) {
    setCopyrightML(JcmsUtil.decodeMLE(v));
  }
  
  public void setCopyright(String lang, String value) {
    if (channel.getLanguage().equals(lang)) {
      copyright = value;
      return;
    }
    if (copyrightML == null) {
      copyrightML = new HashMap<>();
    } else if (this != channel.getData(id)) {
      copyrightML = new HashMap<>(copyrightML);
    }
    copyrightML.put(lang, value);
  }
  // ----------------------------------------------------------------------
  // useAuthKey
  // ----------------------------------------------------------------------  
  
  protected  boolean useAuthKey = false;
  
  public boolean getUseAuthKey() { return useAuthKey; }
  
  public void setUseAuthKey(boolean v) { useAuthKey = v; }
  
  
  
  public String getUseAuthKeyLabel(String lang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(this.getClass(), "useAuthKey", true);
    return useAuthKey ? tfe.getOnLabel(lang) : tfe.getOffLabel(lang); 
  }
  public static String[] getUseAuthKeyValues() {
    return new String[]{ "true" , "false" };
  }
  
  public static String[] getUseAuthKeyLabels(String userLang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(PortletFeed.class, "useAuthKey", true);
    String onLabel = (String) tfe.getOnLabel(userLang);
    String offLabel = (String) tfe.getOffLabel(userLang);
    
    return new String[]{ onLabel, offLabel };
  }
  public static EnumerateFormReport getUseAuthKeyReport(SortedSet<PortletFeed> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (PortletFeed obj : set) {
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getUseAuthKey());
      
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
    
    return ControllerStatus.OK;
  }
  
  
  // ----------------------------------------------------------------------
  // WorkCopy
  // ----------------------------------------------------------------------  
  protected void prepareMergeCopy(Publication mergeCopy) {
    super.prepareMergeCopy(mergeCopy);  
    ((PortletFeed)mergeCopy).setFormats(getFormats());
    ((PortletFeed)mergeCopy).setCopyright(getCopyright());
    ((PortletFeed)mergeCopy).setCopyrightML(JcmsUtil.getMergedMLMap(getCopyrightML(), ((PortletFeed)mergeCopy).getCopyrightML()));
    ((PortletFeed)mergeCopy).setUseAuthKey(getUseAuthKey());
  }
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// kKHmqOsx80Vt/WvQwh6Qag==
