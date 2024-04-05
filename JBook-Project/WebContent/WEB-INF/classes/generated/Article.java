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
public  class Article extends com.jalios.jcms.Content 
             implements 
                com.jalios.jstore.Searchable
{
  
  // ----------------------------------------------------------------------
  // CONSTRUCTORS
  // ----------------------------------------------------------------------  
  public Article() {}
 
 
 
  
  
  
  public Article(Article other) {
    super(other);
    summary = other.summary;
    summaryML = other.summaryML;
    intro = other.intro;
    introML = other.introML;
    picture = other.picture;
    pictureML = other.pictureML;
    pictureAlt = other.pictureAlt;
    pictureAltML = other.pictureAltML;
    content = other.content;
    contentML = other.contentML;
    relatedContents = other.relatedContents;
    relatedContentsDBID = other.relatedContentsDBID;
  }
  
  // ----------------------------------------------------------------------
  // Import / Export
  // ----------------------------------------------------------------------
  public void importXml(org.jdom.Element elt, ImportOptions options) {
    super.importXml(elt, options);
    
    setPicture(ImportUtil.parseFieldText(elt, "picture"));
    setPictureML(ImportUtil.parseFieldTextML(elt, "pictureML"));
    setPictureAlt(ImportUtil.parseFieldText(elt, "pictureAlt"));
    setPictureAltML(ImportUtil.parseFieldTextML(elt, "pictureAltML"));
  }
  
  protected void importXmlFieldsWithReferences(org.jdom.Element elt, ImportOptions options) {
    super.importXmlFieldsWithReferences(elt, options);
      
    if (options.isSelfImport()) {
      setSummary(ImportUtil.parseFieldText(elt, "summary"));
      setSummaryML(ImportUtil.parseFieldTextML(elt, "summaryML"));
      setIntro(ImportUtil.parseFieldText(elt, "intro"));
      setIntroML(ImportUtil.parseFieldTextML(elt, "introML"));
      setContent(ImportUtil.parseFieldText(elt, "content"));
      setContentML(ImportUtil.parseFieldTextML(elt, "contentML"));
      setRelatedContents(ImportUtil.parseSelfFieldDataArray(elt, "relatedContents", com.jalios.jcms.Content.class));
    } else {
    
    setSummaryML(ImportUtil.parseFieldWikiML(elt, "summaryML"));
    setSummary(ImportUtil.parseFieldWiki(elt, "summary"));
    setIntroML(ImportUtil.parseFieldWikiML(elt, "introML"));
    setIntro(ImportUtil.parseFieldWiki(elt, "intro"));
    setContentML(ImportUtil.parseFieldWysiwygML(elt, "contentML"));
    setContent(ImportUtil.parseFieldWysiwyg(elt, "content"));
    setRelatedContents((com.jalios.jcms.Content[])ImportUtil.parseFieldDataArray(elt, "relatedContents", com.jalios.jcms.Content.class));
    }
  }
  
  public void exportXmlField(StringBuffer sb, int indentLevel) {
    super.exportXmlField(sb, indentLevel);
    sb.append(ExportUtil.exportField(indentLevel, "summary", getSummary(), "summaryML", true, true));
    sb.append(ExportUtil.exportField(indentLevel, "summaryML", getSummaryML(), true));
    sb.append(ExportUtil.exportField(indentLevel, "intro", getIntro(), "introML", false, true));
    sb.append(ExportUtil.exportField(indentLevel, "introML", getIntroML(), true));
    sb.append(ExportUtil.exportField(indentLevel, "picture", getPicture(), "pictureML", false, true));
    sb.append(ExportUtil.exportField(indentLevel, "pictureML", getPictureML(), true));
    sb.append(ExportUtil.exportField(indentLevel, "pictureAlt", getPictureAlt(), "pictureAltML", false, true));
    sb.append(ExportUtil.exportField(indentLevel, "pictureAltML", getPictureAltML(), true));
    sb.append(ExportUtil.exportField(indentLevel, "content", getContent(), "contentML", false, false));
    sb.append(ExportUtil.exportField(indentLevel, "contentML", getContentML(), false));
    sb.append(ExportUtil.exportField(indentLevel, "relatedContents", getRelatedContents()));
  }
  
  public Set<FileDocument> getDocumentLinkSet() {
    Set<FileDocument> docSet = super.getDocumentLinkSet();
    JcmsUtil.addFileDocument(docSet, picture, pictureML);
    return docSet;
  }
  
  // ----------------------------------------------------------------------
  // TYPE AND FIELD INFOS (static methods)
  // ----------------------------------------------------------------------  
  /**
   * Returns the TypeEntry bound to <code>Article</code>. <br>
   * @see com.jalios.jcms.Channel#getTypeEntry(Class)
   * @since jcms-5.5
   */
  public static TypeEntry getTypeEntry() {
    return channel.getTypeEntry(Article.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>Article</code>. <br>
   * This array <strong>does not</strong> contain inherited TypeFieldEntry from super classes of <code>Article</code>. <br/>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>Article</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getTypeFieldEntries() {
    return channel.getTypeFieldEntries(Article.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>Article</code>. <br>
   * This array <strong>does</strong> contain inherited TypeFieldEntry from super classes of <code>Article</code>. <br>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>Article</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getAllTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getAllTypeFieldEntries() {
    return channel.getAllTypeFieldEntries(Article.class);
  }
  // ----------------------------------------------------------------------
  // FIELDs VALUE
  // ----------------------------------------------------------------------  
  /**
   * Gets the value of the given <code>int</code> field name for the current <code>Article</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public int getIntFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getIntFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>int</code> field name for the current <code>Article</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setIntFieldValue(String fieldName, int value) throws NoSuchFieldException {
    super.setIntFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>long</code> field name for the current <code>Article</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public long getLongFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getLongFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>long</code> field name for the current <code>Article</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setLongFieldValue(String fieldName, long value) throws NoSuchFieldException {
    super.setLongFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>double</code> field name for the current <code>Article</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public double getDoubleFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getDoubleFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>double</code> field name for the current <code>Article</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setDoubleFieldValue(String fieldName, double value) throws NoSuchFieldException {
     super.setDoubleFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>boolean</code> field name for the current <code>Article</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public boolean getBooleanFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getBooleanFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>boolean</code> field name for the current <code>Article</code>.
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
   * Gets the <code>Object</code> value of the given field name for this <code>Article</code>. <br>
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
    if ("summary".equals(fieldName)) { return getSummary(lang, useDefault); }
    if ("intro".equals(fieldName)) { return getIntro(lang, useDefault); }
    if ("picture".equals(fieldName)) { return getPicture(lang, useDefault); }
    if ("pictureAlt".equals(fieldName)) { return getPictureAlt(lang, useDefault); }
    if ("content".equals(fieldName)) { return getContent(lang, useDefault); }
    if ("relatedContents".equals(fieldName)) { return getRelatedContents(); }
    return super.getFieldValue(fieldName, lang, useDefault);
  }
  
  /**
   * Sets the <code>Object</code> value of the given field name for this <code>Article</code>. <br>
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
    if ("summary".equals(fieldName)) { setSummary(lang,(String)value); return; }
    if ("intro".equals(fieldName)) { setIntro(lang,(String)value); return; }
    if ("picture".equals(fieldName)) { setPicture(lang,(String)value); return; }
    if ("pictureAlt".equals(fieldName)) { setPictureAlt(lang,(String)value); return; }
    if ("content".equals(fieldName)) { setContent(lang,(String)value); return; }
    if ("relatedContents".equals(fieldName)) { setRelatedContents((com.jalios.jcms.Content[])value); return; }
    super.setFieldValue(fieldName, value, lang);
  }
  
  // ----------------------------------------------------------------------
  // summary
  // ----------------------------------------------------------------------  
  
  protected  String summary = channel.getTypeFieldEntry(Article.class, "summary", true).getDefaultTextString();
  
  public String getSummary() { return summary; }
  
  public void setSummary(String v) { summary = v; }
  
  
  
  
  protected HashMap<String,String> summaryML = channel.getTypeFieldEntry(Article.class, "summary", true).getDefaultTextMap();
  public String getSummary(String lang) { return (String)channel.getLangValue(lang, true, summary, summaryML, getMainLanguage()); }
  public String getSummary(String lang, boolean useDefault) { return (String)channel.getLangValue(lang, useDefault, summary, summaryML, getMainLanguage()); }
  public HashMap<String,String> getSummaryML() { return summaryML; }
  public void setSummaryML(HashMap<String,String> v) { summaryML = v; }
  
  public String getSummaryMLE() { 
    return JcmsUtil.encodeMLE(getSummaryML());
  }
  
  public void setSummaryMLE(String v) {
    setSummaryML(JcmsUtil.decodeMLE(v));
  }
  
  public void setSummary(String lang, String value) {
    if (channel.getLanguage().equals(lang)) {
      summary = value;
      return;
    }
    if (summaryML == null) {
      summaryML = new HashMap<>();
    } else if (this != channel.getData(id)) {
      summaryML = new HashMap<>(summaryML);
    }
    summaryML.put(lang, value);
  }
  // ----------------------------------------------------------------------
  // intro
  // ----------------------------------------------------------------------  
  
  protected  String intro = channel.getTypeFieldEntry(Article.class, "intro", true).getDefaultTextString();
  
  public String getIntro() { return intro; }
  
  public void setIntro(String v) { intro = v; }
  
  
  
  
  protected HashMap<String,String> introML = channel.getTypeFieldEntry(Article.class, "intro", true).getDefaultTextMap();
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
  // picture
  // ----------------------------------------------------------------------  
  
  protected  String picture = channel.getTypeFieldEntry(Article.class, "picture", true).getDefaultTextString();
  
  public String getPicture() { return picture; }
  
  public void setPicture(String v) { picture = v; }
  
  
  
  
  protected HashMap<String,String> pictureML = channel.getTypeFieldEntry(Article.class, "picture", true).getDefaultTextMap();
  public String getPicture(String lang) { return (String)channel.getLangValue(lang, true, picture, pictureML, getMainLanguage()); }
  public String getPicture(String lang, boolean useDefault) { return (String)channel.getLangValue(lang, useDefault, picture, pictureML, getMainLanguage()); }
  public HashMap<String,String> getPictureML() { return pictureML; }
  public void setPictureML(HashMap<String,String> v) { pictureML = v; }
  
  public String getPictureMLE() { 
    return JcmsUtil.encodeMLE(getPictureML());
  }
  
  public void setPictureMLE(String v) {
    setPictureML(JcmsUtil.decodeMLE(v));
  }
  
  public void setPicture(String lang, String value) {
    if (channel.getLanguage().equals(lang)) {
      picture = value;
      return;
    }
    if (pictureML == null) {
      pictureML = new HashMap<>();
    } else if (this != channel.getData(id)) {
      pictureML = new HashMap<>(pictureML);
    }
    pictureML.put(lang, value);
  }
  // ----------------------------------------------------------------------
  // pictureAlt
  // ----------------------------------------------------------------------  
  
  protected  String pictureAlt = channel.getTypeFieldEntry(Article.class, "pictureAlt", true).getDefaultTextString();
  
  public String getPictureAlt() { return pictureAlt; }
  
  public void setPictureAlt(String v) { pictureAlt = v; }
  
  
  
  
  protected HashMap<String,String> pictureAltML = channel.getTypeFieldEntry(Article.class, "pictureAlt", true).getDefaultTextMap();
  public String getPictureAlt(String lang) { return (String)channel.getLangValue(lang, true, pictureAlt, pictureAltML, getMainLanguage()); }
  public String getPictureAlt(String lang, boolean useDefault) { return (String)channel.getLangValue(lang, useDefault, pictureAlt, pictureAltML, getMainLanguage()); }
  public HashMap<String,String> getPictureAltML() { return pictureAltML; }
  public void setPictureAltML(HashMap<String,String> v) { pictureAltML = v; }
  
  public String getPictureAltMLE() { 
    return JcmsUtil.encodeMLE(getPictureAltML());
  }
  
  public void setPictureAltMLE(String v) {
    setPictureAltML(JcmsUtil.decodeMLE(v));
  }
  
  public void setPictureAlt(String lang, String value) {
    if (channel.getLanguage().equals(lang)) {
      pictureAlt = value;
      return;
    }
    if (pictureAltML == null) {
      pictureAltML = new HashMap<>();
    } else if (this != channel.getData(id)) {
      pictureAltML = new HashMap<>(pictureAltML);
    }
    pictureAltML.put(lang, value);
  }
  // ----------------------------------------------------------------------
  // content
  // ----------------------------------------------------------------------  
  
  protected  String content = channel.getTypeFieldEntry(Article.class, "content", true).getDefaultTextString();
  
  public String getContent() { return content; }
  
  public void setContent(String v) { content = v; }
  
  
  
  
  protected HashMap<String,String> contentML = channel.getTypeFieldEntry(Article.class, "content", true).getDefaultTextMap();
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
  // relatedContents
  // ----------------------------------------------------------------------  
  
  protected  com.jalios.jcms.Content[] relatedContents;
  
  public com.jalios.jcms.Content[] getRelatedContents() {
    return getRelatedContents(true);
  }
  public com.jalios.jcms.Content[] getRelatedContents(boolean queryDB) { 
    if (!queryDB || Util.isEmpty(relatedContentsDBID)) {
      return relatedContents;
    }
    return mergeHybridLink(com.jalios.jcms.Content.class, relatedContents, relatedContentsDBID);
  }
  protected String[] relatedContentsDBID;
  public String[] getRelatedContentsDBID() {
    return relatedContentsDBID;
  }
  public void setRelatedContents(com.jalios.jcms.Content[] v) { 
    relatedContents = v == null ? null : v.clone(); 
  }
  
  public void setRelatedContentsDBID(String[] v) { 
    relatedContentsDBID = v; 
  }
  
  
   
  // ----------------------------------------------------------------------
  // abstract
  // ----------------------------------------------------------------------  
  @Override
  public void setAbstract(String lang, String value) { setSummary(lang, value); }
  @Override
  public String getAbstract() { return summary; }
  @Override
  public String getAbstract(String lang, boolean useDefault) { return getSummary(lang, useDefault); }
  @Override
  public HashMap<String,String> getAbstractML() { return getSummaryML(); }
   
  // ----------------------------------------------------------------------
  // Data image
  // ----------------------------------------------------------------------  
  @Override
  public String getDataImage() {
    String _img = picture;
    if (Util.notEmpty(_img)) {
      return _img;
    }
  
    return super.getDataImage();
  }
  
  @Override
  public String getDataImage(String lang, boolean useDefault) {
    String _img = getPicture(lang, useDefault);
    if (Util.notEmpty(_img)) {
      return _img;
    }  
  
    return super.getDataImage(lang, useDefault);
  }
  
  @Override
  public String[] getSearchStrings() {
    StringBuffer sb = new StringBuffer(super.getSearchStrings()[0]);
    sb.ensureCapacity(500 * (0 + 4 + 0 + 0 + 0 + 0) );
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
    if (summary != null) {
      sb.append(summary); sb.append(' '); 
    }
    if (summaryML != null) {
      for (String str : summaryML.values()) {
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
    if (summary != null && !JHTMLUtils.isJHTML(null, summary)) {
      sb.append(summary); sb.append(' '); 
    }
    if (summaryML != null) {
      for (String str : summaryML.values()) {
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
    sb.ensureCapacity(500 * (0 + 1 + 0 + 0 + 0 + 0) );
    // Wiki fields containing JHTML
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
    if (summary != null && JHTMLUtils.isJHTML(null, summary)) {
      sb.append(summary); sb.append(' '); 
    }
    if (summaryML != null) {
      for (String str : summaryML.values()) {
        if (str != null && JHTMLUtils.isJHTML(null, str)) {
          sb.append(str); sb.append(' ');
        }
      }
    }
   // Wysiwyg fields
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
    return sb.toString();
  }
  
  @Override
  public <T extends Data> TreeSet<T> getLinkDataSet(Class<T> clazz) {
    if (clazz == null) {
      return Util.emptyTreeSet();
    }
    TreeSet<T> set = new TreeSet<>();
    JcmsUtil.addData(set, clazz, getRelatedContents());
    return set;
  }
  // ----------------------------------------------------------------------
  // DataController
  // ----------------------------------------------------------------------  
  public ControllerStatus checkHtmlContent() {
    ControllerStatus status = JcmsUtil.checkHtml(content, channel.getTypeFieldLabel(this, "content"));
    if (status.hasFailed()) {
      return status;
    }
    status = JcmsUtil.checkHtml(contentML, channel.getTypeFieldLabel(this, "content"));
    if (status.hasFailed()) {
      return status;
    }
    return ControllerStatus.OK;
  }
  
  public ControllerStatus checkIntegrity() {
    
    ControllerStatus status = super.checkIntegrity();
    if (status.hasFailed()) {
      return status;
    }
    
    if (JHTMLUtils.isEmpty(getFieldInMainLanguage(summary, summaryML))) {
      status = new ControllerStatus();
      status.setProp("msg.edit.empty-fieldml", channel.getTypeFieldLabel(this, "summary"), new LangProperty("lang." + getMainLanguage()));
      return status;
    }
    if (JHTMLUtils.isEmpty(getFieldInMainLanguage(content, contentML))) {
      status = new ControllerStatus();
      status.setProp("msg.edit.empty-fieldml", channel.getTypeFieldLabel(this, "content"), new LangProperty("lang." + getMainLanguage()));
      return status;
    }
    status = checkHtmlContent();
    if (status.hasFailed()) {
      return status;
    }
    return ControllerStatus.OK;
  }
  
  // ----------------------------------------------------------------------
  // splitHybridCollections
  // ----------------------------------------------------------------------
  @Override
  protected void splitHybridCollections(Data previousData) {
    super.splitHybridCollections(previousData);
    Article previous = (Article)previousData;
  
    if (previous == null || previous.relatedContents != relatedContents) {
      relatedContentsDBID = computeDBIDArray(relatedContents);
    }
  }
  
  // ----------------------------------------------------------------------
  // cleanHybridCollections
  // ----------------------------------------------------------------------
  @Override
  protected void cleanHybridCollections() {
    super.cleanHybridCollections();
    cleanHybridCollection(relatedContents);
  }
  
  // ----------------------------------------------------------------------
  // WorkCopy
  // ----------------------------------------------------------------------  
  protected void prepareMergeCopy(Publication mergeCopy) {
    super.prepareMergeCopy(mergeCopy);  
    ((Article)mergeCopy).setSummary(getSummary());
    ((Article)mergeCopy).setSummaryML(JcmsUtil.getMergedMLMap(getSummaryML(), ((Article)mergeCopy).getSummaryML()));
    ((Article)mergeCopy).setIntro(getIntro());
    ((Article)mergeCopy).setIntroML(JcmsUtil.getMergedMLMap(getIntroML(), ((Article)mergeCopy).getIntroML()));
    ((Article)mergeCopy).setPicture(getPicture());
    ((Article)mergeCopy).setPictureML(JcmsUtil.getMergedMLMap(getPictureML(), ((Article)mergeCopy).getPictureML()));
    ((Article)mergeCopy).setPictureAlt(getPictureAlt());
    ((Article)mergeCopy).setPictureAltML(JcmsUtil.getMergedMLMap(getPictureAltML(), ((Article)mergeCopy).getPictureAltML()));
    ((Article)mergeCopy).setContent(getContent());
    ((Article)mergeCopy).setContentML(JcmsUtil.getMergedMLMap(getContentML(), ((Article)mergeCopy).getContentML()));
    ((Article)mergeCopy).setRelatedContents(getRelatedContents());
  }
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// RzGAagYmzv8Lw+77iqDOuQ==
