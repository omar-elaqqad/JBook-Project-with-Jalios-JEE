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
public  class PortletWYSIWYG extends generated.AbstractPortletSkinable 
             implements 
                com.jalios.jstore.Searchable
{
  
  // ----------------------------------------------------------------------
  // CONSTRUCTORS
  // ----------------------------------------------------------------------  
  public PortletWYSIWYG() {}
 
 
  public PortletWYSIWYG(AbstractPortletSkinable other) {
    super(other);
  }
 
  
  
  
  public PortletWYSIWYG(PortletWYSIWYG other) {
    super(other);
    wysiwyg = other.wysiwyg;
    wysiwygML = other.wysiwygML;
  }
  
  // ----------------------------------------------------------------------
  // Import / Export
  // ----------------------------------------------------------------------
  public void importXml(org.jdom.Element elt, ImportOptions options) {
    super.importXml(elt, options);
    
  }
  
  protected void importXmlFieldsWithReferences(org.jdom.Element elt, ImportOptions options) {
    super.importXmlFieldsWithReferences(elt, options);
      
    if (options.isSelfImport()) {
      setWysiwyg(ImportUtil.parseFieldText(elt, "wysiwyg"));
      setWysiwygML(ImportUtil.parseFieldTextML(elt, "wysiwygML"));
    } else {
    
    setWysiwygML(ImportUtil.parseFieldWysiwygML(elt, "wysiwygML"));
    setWysiwyg(ImportUtil.parseFieldWysiwyg(elt, "wysiwyg"));
    }
  }
  
  public void exportXmlField(StringBuffer sb, int indentLevel) {
    super.exportXmlField(sb, indentLevel);
    sb.append(ExportUtil.exportField(indentLevel, "wysiwyg", getWysiwyg(), "wysiwygML", false, false));
    sb.append(ExportUtil.exportField(indentLevel, "wysiwygML", getWysiwygML(), false));
  }
  
  public Set<FileDocument> getDocumentLinkSet() {
    Set<FileDocument> docSet = super.getDocumentLinkSet();
    return docSet;
  }
  
  // ----------------------------------------------------------------------
  // TYPE AND FIELD INFOS (static methods)
  // ----------------------------------------------------------------------  
  /**
   * Returns the TypeEntry bound to <code>PortletWYSIWYG</code>. <br>
   * @see com.jalios.jcms.Channel#getTypeEntry(Class)
   * @since jcms-5.5
   */
  public static TypeEntry getTypeEntry() {
    return channel.getTypeEntry(PortletWYSIWYG.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>PortletWYSIWYG</code>. <br>
   * This array <strong>does not</strong> contain inherited TypeFieldEntry from super classes of <code>PortletWYSIWYG</code>. <br/>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>PortletWYSIWYG</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getTypeFieldEntries() {
    return channel.getTypeFieldEntries(PortletWYSIWYG.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>PortletWYSIWYG</code>. <br>
   * This array <strong>does</strong> contain inherited TypeFieldEntry from super classes of <code>PortletWYSIWYG</code>. <br>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>PortletWYSIWYG</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getAllTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getAllTypeFieldEntries() {
    return channel.getAllTypeFieldEntries(PortletWYSIWYG.class);
  }
  // ----------------------------------------------------------------------
  // FIELDs VALUE
  // ----------------------------------------------------------------------  
  /**
   * Gets the value of the given <code>int</code> field name for the current <code>PortletWYSIWYG</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public int getIntFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getIntFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>int</code> field name for the current <code>PortletWYSIWYG</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setIntFieldValue(String fieldName, int value) throws NoSuchFieldException {
    super.setIntFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>long</code> field name for the current <code>PortletWYSIWYG</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public long getLongFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getLongFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>long</code> field name for the current <code>PortletWYSIWYG</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setLongFieldValue(String fieldName, long value) throws NoSuchFieldException {
    super.setLongFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>double</code> field name for the current <code>PortletWYSIWYG</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public double getDoubleFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getDoubleFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>double</code> field name for the current <code>PortletWYSIWYG</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setDoubleFieldValue(String fieldName, double value) throws NoSuchFieldException {
     super.setDoubleFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>boolean</code> field name for the current <code>PortletWYSIWYG</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public boolean getBooleanFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getBooleanFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>boolean</code> field name for the current <code>PortletWYSIWYG</code>.
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
   * Gets the <code>Object</code> value of the given field name for this <code>PortletWYSIWYG</code>. <br>
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
    if ("wysiwyg".equals(fieldName)) { return getWysiwyg(lang, useDefault); }
    return super.getFieldValue(fieldName, lang, useDefault);
  }
  
  /**
   * Sets the <code>Object</code> value of the given field name for this <code>PortletWYSIWYG</code>. <br>
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
    if ("wysiwyg".equals(fieldName)) { setWysiwyg(lang,(String)value); return; }
    super.setFieldValue(fieldName, value, lang);
  }
  
  // ----------------------------------------------------------------------
  // wysiwyg
  // ----------------------------------------------------------------------  
  
  protected  String wysiwyg = channel.getTypeFieldEntry(PortletWYSIWYG.class, "wysiwyg", true).getDefaultTextString();
  
  public String getWysiwyg() { return wysiwyg; }
  
  public void setWysiwyg(String v) { wysiwyg = v; }
  
  
  
  
  protected HashMap<String,String> wysiwygML = channel.getTypeFieldEntry(PortletWYSIWYG.class, "wysiwyg", true).getDefaultTextMap();
  public String getWysiwyg(String lang) { return (String)channel.getLangValue(lang, true, wysiwyg, wysiwygML, getMainLanguage()); }
  public String getWysiwyg(String lang, boolean useDefault) { return (String)channel.getLangValue(lang, useDefault, wysiwyg, wysiwygML, getMainLanguage()); }
  public HashMap<String,String> getWysiwygML() { return wysiwygML; }
  public void setWysiwygML(HashMap<String,String> v) { wysiwygML = v; }
  
  public String getWysiwygMLE() { 
    return JcmsUtil.encodeMLE(getWysiwygML());
  }
  
  public void setWysiwygMLE(String v) {
    setWysiwygML(JcmsUtil.decodeMLE(v));
  }
  
  public void setWysiwyg(String lang, String value) {
    if (channel.getLanguage().equals(lang)) {
      wysiwyg = value;
      return;
    }
    if (wysiwygML == null) {
      wysiwygML = new HashMap<>();
    } else if (this != channel.getData(id)) {
      wysiwygML = new HashMap<>(wysiwygML);
    }
    wysiwygML.put(lang, value);
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
    sb.ensureCapacity(500 * (0 + 1 + 0 + 0 + 0 + 0) );
    // Wiki fields containing JHTML
   // Wysiwyg fields
    if (wysiwyg != null) {
      sb.append(wysiwyg); sb.append(' '); 
    }
    if (wysiwygML != null) {
      for (String str : wysiwygML.values()) {
        if (str != null) {
          sb.append(str); sb.append(' ');
        }
      }
    }
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
    
    if (JHTMLUtils.isEmpty(getFieldInMainLanguage(wysiwyg, wysiwygML))) {
      status = new ControllerStatus();
      status.setProp("msg.edit.empty-fieldml", channel.getTypeFieldLabel(this, "wysiwyg"), new LangProperty("lang." + getMainLanguage()));
      return status;
    }
    return ControllerStatus.OK;
  }
  
  
  // ----------------------------------------------------------------------
  // WorkCopy
  // ----------------------------------------------------------------------  
  protected void prepareMergeCopy(Publication mergeCopy) {
    super.prepareMergeCopy(mergeCopy);  
    ((PortletWYSIWYG)mergeCopy).setWysiwyg(getWysiwyg());
    ((PortletWYSIWYG)mergeCopy).setWysiwygML(JcmsUtil.getMergedMLMap(getWysiwygML(), ((PortletWYSIWYG)mergeCopy).getWysiwygML()));
  }
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// FLAOHlXr1pzmQ2QaTgOsqg==
