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
public  class Poll extends com.jalios.jcmsplugin.dbpoll.AbstractPoll 
             implements 
                com.jalios.jstore.Searchable
{
  
  // ----------------------------------------------------------------------
  // CONSTRUCTORS
  // ----------------------------------------------------------------------  
  public Poll() {}
 
 
 
  
  
  
  public Poll(Poll other) {
    super(other);
    description = other.description;
    descriptionML = other.descriptionML;
    image = other.image;
    options = other.options;
    optionsML = other.optionsML;
  }
  
  // ----------------------------------------------------------------------
  // Import / Export
  // ----------------------------------------------------------------------
  public void importXml(org.jdom.Element elt, ImportOptions options) {
    super.importXml(elt, options);
    
    setImage(ImportUtil.parseFieldText(elt, "image"));
    setOptions(ImportUtil.parseFieldTextArray(elt, "options"));
    setOptionsML(ImportUtil.parseFieldTextArrayML(elt, "optionsML"));
  }
  
  protected void importXmlFieldsWithReferences(org.jdom.Element elt, ImportOptions options) {
    super.importXmlFieldsWithReferences(elt, options);
      
    if (options.isSelfImport()) {
      setDescription(ImportUtil.parseFieldText(elt, "description"));
      setDescriptionML(ImportUtil.parseFieldTextML(elt, "descriptionML"));
    } else {
    
    setDescriptionML(ImportUtil.parseFieldWikiML(elt, "descriptionML"));
    setDescription(ImportUtil.parseFieldWiki(elt, "description"));
    }
  }
  
  public void exportXmlField(StringBuffer sb, int indentLevel) {
    super.exportXmlField(sb, indentLevel);
    sb.append(ExportUtil.exportField(indentLevel, "description", getDescription(), "descriptionML", true, true));
    sb.append(ExportUtil.exportField(indentLevel, "descriptionML", getDescriptionML(), true));
    sb.append(ExportUtil.exportField(indentLevel, "image", getImage(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "options", getOptions(), "optionsML", false, true));
    sb.append(ExportUtil.exportField(indentLevel, "optionsML", getOptionsML(), true));
  }
  
  public Set<FileDocument> getDocumentLinkSet() {
    Set<FileDocument> docSet = super.getDocumentLinkSet();
    JcmsUtil.addFileDocument(docSet, image);
    return docSet;
  }
  
  // ----------------------------------------------------------------------
  // TYPE AND FIELD INFOS (static methods)
  // ----------------------------------------------------------------------  
  /**
   * Returns the TypeEntry bound to <code>Poll</code>. <br>
   * @see com.jalios.jcms.Channel#getTypeEntry(Class)
   * @since jcms-5.5
   */
  public static TypeEntry getTypeEntry() {
    return channel.getTypeEntry(Poll.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>Poll</code>. <br>
   * This array <strong>does not</strong> contain inherited TypeFieldEntry from super classes of <code>Poll</code>. <br/>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>Poll</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getTypeFieldEntries() {
    return channel.getTypeFieldEntries(Poll.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>Poll</code>. <br>
   * This array <strong>does</strong> contain inherited TypeFieldEntry from super classes of <code>Poll</code>. <br>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>Poll</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getAllTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getAllTypeFieldEntries() {
    return channel.getAllTypeFieldEntries(Poll.class);
  }
  // ----------------------------------------------------------------------
  // FIELDs VALUE
  // ----------------------------------------------------------------------  
  /**
   * Gets the value of the given <code>int</code> field name for the current <code>Poll</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public int getIntFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getIntFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>int</code> field name for the current <code>Poll</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setIntFieldValue(String fieldName, int value) throws NoSuchFieldException {
    super.setIntFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>long</code> field name for the current <code>Poll</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public long getLongFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getLongFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>long</code> field name for the current <code>Poll</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setLongFieldValue(String fieldName, long value) throws NoSuchFieldException {
    super.setLongFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>double</code> field name for the current <code>Poll</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public double getDoubleFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getDoubleFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>double</code> field name for the current <code>Poll</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setDoubleFieldValue(String fieldName, double value) throws NoSuchFieldException {
     super.setDoubleFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>boolean</code> field name for the current <code>Poll</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public boolean getBooleanFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getBooleanFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>boolean</code> field name for the current <code>Poll</code>.
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
   * Gets the <code>Object</code> value of the given field name for this <code>Poll</code>. <br>
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
    if ("description".equals(fieldName)) { return getDescription(lang, useDefault); }
    if ("image".equals(fieldName)) { return getImage(); }
    if ("options".equals(fieldName)) { return getOptions(lang, useDefault); }
    return super.getFieldValue(fieldName, lang, useDefault);
  }
  
  /**
   * Sets the <code>Object</code> value of the given field name for this <code>Poll</code>. <br>
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
    if ("description".equals(fieldName)) { setDescription(lang,(String)value); return; }
    if ("image".equals(fieldName)) { setImage((String)value); return; }
    if ("options".equals(fieldName)) { setOptions(lang,(String[])value); return; }
    super.setFieldValue(fieldName, value, lang);
  }
  
  // ----------------------------------------------------------------------
  // description
  // ----------------------------------------------------------------------  
  
  protected  String description = channel.getTypeFieldEntry(Poll.class, "description", true).getDefaultTextString();
  
  public String getDescription() { return description; }
  
  public void setDescription(String v) { description = v; }
  
  
  
  
  protected HashMap<String,String> descriptionML = channel.getTypeFieldEntry(Poll.class, "description", true).getDefaultTextMap();
  public String getDescription(String lang) { return (String)channel.getLangValue(lang, true, description, descriptionML, getMainLanguage()); }
  public String getDescription(String lang, boolean useDefault) { return (String)channel.getLangValue(lang, useDefault, description, descriptionML, getMainLanguage()); }
  public HashMap<String,String> getDescriptionML() { return descriptionML; }
  public void setDescriptionML(HashMap<String,String> v) { descriptionML = v; }
  
  public String getDescriptionMLE() { 
    return JcmsUtil.encodeMLE(getDescriptionML());
  }
  
  public void setDescriptionMLE(String v) {
    setDescriptionML(JcmsUtil.decodeMLE(v));
  }
  
  public void setDescription(String lang, String value) {
    if (channel.getLanguage().equals(lang)) {
      description = value;
      return;
    }
    if (descriptionML == null) {
      descriptionML = new HashMap<>();
    } else if (this != channel.getData(id)) {
      descriptionML = new HashMap<>(descriptionML);
    }
    descriptionML.put(lang, value);
  }
  // ----------------------------------------------------------------------
  // image
  // ----------------------------------------------------------------------  
  
  protected  String image = channel.getTypeFieldEntry(Poll.class, "image", true).getDefaultTextString();
  
  public String getImage() { return image; }
  
  public void setImage(String v) { image = v; }
  
  
  
  public String getImage(String lang) { return image; }
  public String getImage(String lang, boolean useDefault) { return image; }
  // ----------------------------------------------------------------------
  // options
  // ----------------------------------------------------------------------  
  
  protected  String[] options;
  
  public String[] getOptions() { return options; }
  
  public void setOptions(String[] v) { options = v; }
  
  
  
  
  protected HashMap<String,String[]> optionsML = channel.getTypeFieldEntry(Poll.class, "options", true).getDefaultTextMapArray();
  public String[] getOptions(String lang) { return (String[])channel.getLangValue(lang, true, options, optionsML, getMainLanguage()); }
  public String[] getOptions(String lang, boolean useDefault) { return (String[])channel.getLangValue(lang, useDefault, options, optionsML, getMainLanguage()); }
  public HashMap<String,String[]> getOptionsML() { return optionsML; }
  public void setOptionsML(HashMap<String,String[]> v) { optionsML = v; }
  
  public String getOptionsMLE() { 
    return JcmsUtil.encodeMLE(getOptionsML());
  }
  
  public void setOptionsMLE(String v) {
    setOptionsML(JcmsUtil.decodeMLE(v));
  }
  
  public void setOptions(String lang, String[] value) {
    if (channel.getLanguage().equals(lang)) {
      options = value;
      return;
    }
    if (optionsML == null) {
      optionsML = new HashMap<>();
    } else if (this != channel.getData(id)) {
      optionsML = new HashMap<>(optionsML);
    }
    optionsML.put(lang, value);
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
    String _img = image;
    if (Util.notEmpty(_img)) {
      return _img;
    }
  
    return super.getDataImage();
  }
  
  @Override
  public String getDataImage(String lang, boolean useDefault) {
    String _img = getImage(lang, useDefault);
    if (Util.notEmpty(_img)) {
      return _img;
    }  
  
    return super.getDataImage(lang, useDefault);
  }
  
  @Override
  public String[] getSearchStrings() {
    StringBuffer sb = new StringBuffer(super.getSearchStrings()[0]);
    sb.ensureCapacity(500 * (0 + 2 + 0 + 1 + 0 + 0) );
    if (description != null) {
      sb.append(description); sb.append(' '); 
    }
    if (descriptionML != null) {
      for (String str : descriptionML.values()) {
        if (str != null) {
          sb.append(str); sb.append(' ');
        }
      }
    }
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
    for(int i=0; options != null && i < options.length; i++) {
      if (options[i] != null) {
        sb.append(options[i]); sb.append(' ');
      }
    }
    if (optionsML != null) {
      for (String[] strArray : optionsML.values()) {
        for(int i=0; strArray != null && i < strArray.length; i++) {
          if (strArray[i] != null) {
           sb.append( strArray[i]); sb.append(' ');
          }
        }
      }
    }
    return new String[] {sb.toString()};
  }
  
  @Override
  public String getAllWikiText() {
    StringBuffer sb = new StringBuffer(super.getAllWikiText());
    sb.ensureCapacity(500 * (0 + 1 + 0 + 0 + 0 + 0) );
    if (description != null && !JHTMLUtils.isJHTML(null, description)) {
      sb.append(description); sb.append(' '); 
    }
    if (descriptionML != null) {
      for (String str : descriptionML.values()) {
        if (str != null && !JHTMLUtils.isJHTML(null, str)) {
          sb.append(str); sb.append(' ');
        }
      }
    }
    return sb.toString();
  }
  
  @Override
  public String getAllWysiwygText() {
    StringBuffer sb = new StringBuffer(super.getAllWysiwygText());
    sb.ensureCapacity(500 * (0 + 0 + 0 + 0 + 0 + 0) );
    // Wiki fields containing JHTML
    if (description != null && JHTMLUtils.isJHTML(null, description)) {
      sb.append(description); sb.append(' '); 
    }
    if (descriptionML != null) {
      for (String str : descriptionML.values()) {
        if (str != null && JHTMLUtils.isJHTML(null, str)) {
          sb.append(str); sb.append(' ');
        }
      }
    }
   // Wysiwyg fields
    return sb.toString();
  }
  
  @Override
  public <T extends Data> TreeSet<T> getLinkDataSet(Class<T> clazz) {
    if (clazz == null) {
      return Util.emptyTreeSet();
    }
    TreeSet<T> set = new TreeSet<>();
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
    
    if (Util.isEmpty((String[]) getFieldInMainLanguage(options, optionsML), true)) {
      status = new ControllerStatus();
      status.setProp("msg.edit.empty-fieldml", channel.getTypeFieldLabel(this, "options"), new LangProperty("lang." + getMainLanguage()));
      return status;
    }
    return ControllerStatus.OK;
  }
  
  
  // ----------------------------------------------------------------------
  // WorkCopy
  // ----------------------------------------------------------------------  
  protected void prepareMergeCopy(Publication mergeCopy) {
    super.prepareMergeCopy(mergeCopy);  
    ((Poll)mergeCopy).setDescription(getDescription());
    ((Poll)mergeCopy).setDescriptionML(JcmsUtil.getMergedMLMap(getDescriptionML(), ((Poll)mergeCopy).getDescriptionML()));
    ((Poll)mergeCopy).setImage(getImage());
    ((Poll)mergeCopy).setOptions(getOptions());
    ((Poll)mergeCopy).setOptionsML(JcmsUtil.getMergedMLMap(getOptionsML(), ((Poll)mergeCopy).getOptionsML()));
  }
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// CYwMTaoul8Cunv0Rd3zplw==
