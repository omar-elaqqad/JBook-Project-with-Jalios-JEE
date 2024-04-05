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
public  class SmallNews extends com.jalios.jcms.Content 
             implements 
                com.jalios.jstore.Searchable
{
  
  // ----------------------------------------------------------------------
  // CONSTRUCTORS
  // ----------------------------------------------------------------------  
  public SmallNews() {}
 
 
 
  
  
  
  public SmallNews(SmallNews other) {
    super(other);
    intro = other.intro;
    introML = other.introML;
    content = other.content;
    contentML = other.contentML;
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
      setIntro(ImportUtil.parseFieldText(elt, "intro"));
      setIntroML(ImportUtil.parseFieldTextML(elt, "introML"));
      setContent(ImportUtil.parseFieldText(elt, "content"));
      setContentML(ImportUtil.parseFieldTextML(elt, "contentML"));
    } else {
    
    setIntroML(ImportUtil.parseFieldWikiML(elt, "introML"));
    setIntro(ImportUtil.parseFieldWiki(elt, "intro"));
    setContentML(ImportUtil.parseFieldWikiML(elt, "contentML"));
    setContent(ImportUtil.parseFieldWiki(elt, "content"));
    }
  }
  
  public void exportXmlField(StringBuffer sb, int indentLevel) {
    super.exportXmlField(sb, indentLevel);
    sb.append(ExportUtil.exportField(indentLevel, "intro", getIntro(), "introML", true, true));
    sb.append(ExportUtil.exportField(indentLevel, "introML", getIntroML(), true));
    sb.append(ExportUtil.exportField(indentLevel, "content", getContent(), "contentML", false, true));
    sb.append(ExportUtil.exportField(indentLevel, "contentML", getContentML(), true));
  }
  
  public Set<FileDocument> getDocumentLinkSet() {
    Set<FileDocument> docSet = super.getDocumentLinkSet();
    return docSet;
  }
  
  // ----------------------------------------------------------------------
  // TYPE AND FIELD INFOS (static methods)
  // ----------------------------------------------------------------------  
  /**
   * Returns the TypeEntry bound to <code>SmallNews</code>. <br>
   * @see com.jalios.jcms.Channel#getTypeEntry(Class)
   * @since jcms-5.5
   */
  public static TypeEntry getTypeEntry() {
    return channel.getTypeEntry(SmallNews.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>SmallNews</code>. <br>
   * This array <strong>does not</strong> contain inherited TypeFieldEntry from super classes of <code>SmallNews</code>. <br/>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>SmallNews</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getTypeFieldEntries() {
    return channel.getTypeFieldEntries(SmallNews.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>SmallNews</code>. <br>
   * This array <strong>does</strong> contain inherited TypeFieldEntry from super classes of <code>SmallNews</code>. <br>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>SmallNews</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getAllTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getAllTypeFieldEntries() {
    return channel.getAllTypeFieldEntries(SmallNews.class);
  }
  // ----------------------------------------------------------------------
  // FIELDs VALUE
  // ----------------------------------------------------------------------  
  /**
   * Gets the value of the given <code>int</code> field name for the current <code>SmallNews</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public int getIntFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getIntFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>int</code> field name for the current <code>SmallNews</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setIntFieldValue(String fieldName, int value) throws NoSuchFieldException {
    super.setIntFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>long</code> field name for the current <code>SmallNews</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public long getLongFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getLongFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>long</code> field name for the current <code>SmallNews</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setLongFieldValue(String fieldName, long value) throws NoSuchFieldException {
    super.setLongFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>double</code> field name for the current <code>SmallNews</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public double getDoubleFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getDoubleFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>double</code> field name for the current <code>SmallNews</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setDoubleFieldValue(String fieldName, double value) throws NoSuchFieldException {
     super.setDoubleFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>boolean</code> field name for the current <code>SmallNews</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public boolean getBooleanFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getBooleanFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>boolean</code> field name for the current <code>SmallNews</code>.
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
   * Gets the <code>Object</code> value of the given field name for this <code>SmallNews</code>. <br>
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
    if ("intro".equals(fieldName)) { return getIntro(lang, useDefault); }
    if ("content".equals(fieldName)) { return getContent(lang, useDefault); }
    return super.getFieldValue(fieldName, lang, useDefault);
  }
  
  /**
   * Sets the <code>Object</code> value of the given field name for this <code>SmallNews</code>. <br>
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
    if ("intro".equals(fieldName)) { setIntro(lang,(String)value); return; }
    if ("content".equals(fieldName)) { setContent(lang,(String)value); return; }
    super.setFieldValue(fieldName, value, lang);
  }
  
  // ----------------------------------------------------------------------
  // intro
  // ----------------------------------------------------------------------  
  
  protected  String intro = channel.getTypeFieldEntry(SmallNews.class, "intro", true).getDefaultTextString();
  
  public String getIntro() { return intro; }
  
  public void setIntro(String v) { intro = v; }
  
  
  
  
  protected HashMap<String,String> introML = channel.getTypeFieldEntry(SmallNews.class, "intro", true).getDefaultTextMap();
  public String getIntro(String lang) { return (String)channel.getLangValue(lang, true, intro, introML, getMainLanguage()); }
  public String getIntro(String lang, boolean useDefault) { return (String)channel.getLangValue(lang, useDefault, intro, introML, getMainLanguage()); }
  public HashMap<String,String> getIntroML() { return introML; }
  public void setIntroML(HashMap<String,String> v) { introML = v; }
  
  public String getIntroMLE() { 
    return JcmsUtil.encodeMLE(getIntroML());
  }
  
  public void setIntroMLE(String v) {
    setIntroML(JcmsUtil.decodeMLE(v));
  }
  
  public void setIntro(String lang, String value) {
    if (channel.getLanguage().equals(lang)) {
      intro = value;
      return;
    }
    if (introML == null) {
      introML = new HashMap<>();
    } else if (this != channel.getData(id)) {
      introML = new HashMap<>(introML);
    }
    introML.put(lang, value);
  }
  // ----------------------------------------------------------------------
  // content
  // ----------------------------------------------------------------------  
  
  protected  String content = channel.getTypeFieldEntry(SmallNews.class, "content", true).getDefaultTextString();
  
  public String getContent() { return content; }
  
  public void setContent(String v) { content = v; }
  
  
  
  
  protected HashMap<String,String> contentML = channel.getTypeFieldEntry(SmallNews.class, "content", true).getDefaultTextMap();
  public String getContent(String lang) { return (String)channel.getLangValue(lang, true, content, contentML, getMainLanguage()); }
  public String getContent(String lang, boolean useDefault) { return (String)channel.getLangValue(lang, useDefault, content, contentML, getMainLanguage()); }
  public HashMap<String,String> getContentML() { return contentML; }
  public void setContentML(HashMap<String,String> v) { contentML = v; }
  
  public String getContentMLE() { 
    return JcmsUtil.encodeMLE(getContentML());
  }
  
  public void setContentMLE(String v) {
    setContentML(JcmsUtil.decodeMLE(v));
  }
  
  public void setContent(String lang, String value) {
    if (channel.getLanguage().equals(lang)) {
      content = value;
      return;
    }
    if (contentML == null) {
      contentML = new HashMap<>();
    } else if (this != channel.getData(id)) {
      contentML = new HashMap<>(contentML);
    }
    contentML.put(lang, value);
  }
   
  // ----------------------------------------------------------------------
  // abstract
  // ----------------------------------------------------------------------  
  @Override
  public void setAbstract(String lang, String value) { setIntro(lang, value); }
  @Override
  public String getAbstract() { return intro; }
  @Override
  public String getAbstract(String lang, boolean useDefault) { return getIntro(lang, useDefault); }
  @Override
  public HashMap<String,String> getAbstractML() { return getIntroML(); }
  @Override
  public String[] getSearchStrings() {
    StringBuffer sb = new StringBuffer(super.getSearchStrings()[0]);
    sb.ensureCapacity(500 * (0 + 3 + 0 + 0 + 0 + 0) );
    if (content != null) {
      sb.append(content); sb.append(' '); 
    }
    if (contentML != null) {
      for (String str : contentML.values()) {
        if (str != null) {
          sb.append(str); sb.append(' ');
        }
      }
    }
    if (intro != null) {
      sb.append(intro); sb.append(' '); 
    }
    if (introML != null) {
      for (String str : introML.values()) {
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
    return new String[] {sb.toString()};
  }
  
  @Override
  public String getAllWikiText() {
    StringBuffer sb = new StringBuffer(super.getAllWikiText());
    sb.ensureCapacity(500 * (0 + 2 + 0 + 0 + 0 + 0) );
    if (content != null && !JHTMLUtils.isJHTML(null, content)) {
      sb.append(content); sb.append(' '); 
    }
    if (contentML != null) {
      for (String str : contentML.values()) {
        if (str != null && !JHTMLUtils.isJHTML(null, str)) {
          sb.append(str); sb.append(' ');
        }
      }
    }
    if (intro != null && !JHTMLUtils.isJHTML(null, intro)) {
      sb.append(intro); sb.append(' '); 
    }
    if (introML != null) {
      for (String str : introML.values()) {
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
    if (content != null && JHTMLUtils.isJHTML(null, content)) {
      sb.append(content); sb.append(' '); 
    }
    if (contentML != null) {
      for (String str : contentML.values()) {
        if (str != null && JHTMLUtils.isJHTML(null, str)) {
          sb.append(str); sb.append(' ');
        }
      }
    }
    if (intro != null && JHTMLUtils.isJHTML(null, intro)) {
      sb.append(intro); sb.append(' '); 
    }
    if (introML != null) {
      for (String str : introML.values()) {
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
    
    if (JHTMLUtils.isEmpty(getFieldInMainLanguage(content, contentML))) {
      status = new ControllerStatus();
      status.setProp("msg.edit.empty-fieldml", channel.getTypeFieldLabel(this, "content"), new LangProperty("lang." + getMainLanguage()));
      return status;
    }
    return ControllerStatus.OK;
  }
  
  
  // ----------------------------------------------------------------------
  // WorkCopy
  // ----------------------------------------------------------------------  
  protected void prepareMergeCopy(Publication mergeCopy) {
    super.prepareMergeCopy(mergeCopy);  
    ((SmallNews)mergeCopy).setIntro(getIntro());
    ((SmallNews)mergeCopy).setIntroML(JcmsUtil.getMergedMLMap(getIntroML(), ((SmallNews)mergeCopy).getIntroML()));
    ((SmallNews)mergeCopy).setContent(getContent());
    ((SmallNews)mergeCopy).setContentML(JcmsUtil.getMergedMLMap(getContentML(), ((SmallNews)mergeCopy).getContentML()));
  }
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// cldyvmQ7DtztwCFDM7auBg==
