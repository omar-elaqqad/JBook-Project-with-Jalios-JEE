// This file has been automatically generated.

package generated;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.jalios.jcms.Category;
import com.jalios.jcms.ControllerStatus;
import com.jalios.jcms.Data;
import com.jalios.jcms.FileDocument;
import com.jalios.jcms.JcmsUtil;
import com.jalios.jcms.Member;
import com.jalios.jcms.Publication;
import com.jalios.jcms.TypeEntry;
import com.jalios.jcms.TypeFieldEntry;
import com.jalios.jcms.db.CategorizedDBData;
import com.jalios.jcms.db.DBData;
import com.jalios.jcms.db.HistorizedDBData;
import com.jalios.jcms.db.OpenRoleDBData;
import com.jalios.jcms.mashup.ExportUtil;
import com.jalios.jcms.mashup.ImportOptions;
import com.jalios.jcms.mashup.ImportUtil;
import com.jalios.jcms.wysiwyg.JHTMLUtils;
import com.jalios.util.LangProperty;
import com.jalios.util.TreeNode;
import com.jalios.util.Util;

@SuppressWarnings({"unchecked", "unused"})
public  class BlogPost extends com.jalios.jcmsplugin.blog.AbstractBlogPost
             implements
                com.jalios.jcms.db.TrackedDBData
               , com.jalios.jstore.Searchable
               , TreeNode
               , DBData
               , HistorizedDBData
               , CategorizedDBData
               , OpenRoleDBData
{

  // ----------------------------------------------------------------------
  // CONSTRUCTORS
  // ----------------------------------------------------------------------
  public BlogPost() {}






  public BlogPost(BlogPost other) {
    super(other);
    content = other.content;
    contentML = other.contentML;
    summary = other.summary;
    summaryML = other.summaryML;
    blog = other.blog;
    featuredImage = other.featuredImage;
    featuredImageAlt = other.featuredImageAlt;
    featuredImageAltML = other.featuredImageAltML;
    thumbnailImage = other.thumbnailImage;
    thumbnailImageAlt = other.thumbnailImageAlt;
    thumbnailImageAltML = other.thumbnailImageAltML;
  }

  // ----------------------------------------------------------------------
  // Import / Export
  // ----------------------------------------------------------------------
  @Override
public void importXml(org.jdom.Element elt, ImportOptions options) {
    super.importXml(elt, options);

    setFeaturedImage(ImportUtil.parseFieldText(elt, "featuredImage"));
    setFeaturedImageAlt(ImportUtil.parseFieldText(elt, "featuredImageAlt"));
    setFeaturedImageAltML(ImportUtil.parseFieldTextML(elt, "featuredImageAltML"));
    setThumbnailImage(ImportUtil.parseFieldText(elt, "thumbnailImage"));
    setThumbnailImageAlt(ImportUtil.parseFieldText(elt, "thumbnailImageAlt"));
    setThumbnailImageAltML(ImportUtil.parseFieldTextML(elt, "thumbnailImageAltML"));
  }

  @Override
protected void importXmlFieldsWithReferences(org.jdom.Element elt, ImportOptions options) {
    super.importXmlFieldsWithReferences(elt, options);

    if (options.isSelfImport()) {
      setContent(ImportUtil.parseFieldText(elt, "content"));
      setContentML(ImportUtil.parseFieldTextML(elt, "contentML"));
      setSummary(ImportUtil.parseFieldText(elt, "summary"));
      setSummaryML(ImportUtil.parseFieldTextML(elt, "summaryML"));
      setBlog(ImportUtil.parseSelfFieldData(elt, "blog", generated.Blog.class));
    } else {

    setContentML(ImportUtil.parseFieldWysiwygML(elt, "contentML"));
    setContent(ImportUtil.parseFieldWysiwyg(elt, "content"));
    setSummaryML(ImportUtil.parseFieldWikiML(elt, "summaryML"));
    setSummary(ImportUtil.parseFieldWiki(elt, "summary"));
    setBlog((generated.Blog)ImportUtil.parseFieldData(elt, "blog"));
    }
  }

  @Override
public void exportXmlField(StringBuffer sb, int indentLevel) {
    super.exportXmlField(sb, indentLevel);
    sb.append(ExportUtil.exportField(indentLevel, "content", getContent(), "contentML", false, false));
    sb.append(ExportUtil.exportField(indentLevel, "contentML", getContentML(), false));
    sb.append(ExportUtil.exportField(indentLevel, "summary", getSummary(), "summaryML", false, true));
    sb.append(ExportUtil.exportField(indentLevel, "summaryML", getSummaryML(), true));
    sb.append(ExportUtil.exportField(indentLevel, "blog", getBlog()));
    sb.append(ExportUtil.exportField(indentLevel, "featuredImage", getFeaturedImage(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "featuredImageAlt", getFeaturedImageAlt(), "featuredImageAltML", false, true));
    sb.append(ExportUtil.exportField(indentLevel, "featuredImageAltML", getFeaturedImageAltML(), true));
    sb.append(ExportUtil.exportField(indentLevel, "thumbnailImage", getThumbnailImage(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "thumbnailImageAlt", getThumbnailImageAlt(), "thumbnailImageAltML", false, true));
    sb.append(ExportUtil.exportField(indentLevel, "thumbnailImageAltML", getThumbnailImageAltML(), true));
  }

  @Override
public Set<FileDocument> getDocumentLinkSet() {
    Set<FileDocument> docSet = super.getDocumentLinkSet();
    JcmsUtil.addFileDocument(docSet, featuredImage);
    JcmsUtil.addFileDocument(docSet, thumbnailImage);
    return docSet;
  }

  // ----------------------------------------------------------------------
  // TYPE AND FIELD INFOS (static methods)
  // ----------------------------------------------------------------------
  /**
   * Returns the TypeEntry bound to <code>BlogPost</code>. <br>
   * @see com.jalios.jcms.Channel#getTypeEntry(Class)
   * @since jcms-5.5
   */
  public static TypeEntry getTypeEntry() {
    return channel.getTypeEntry(BlogPost.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>BlogPost</code>. <br>
   * This array <strong>does not</strong> contain inherited TypeFieldEntry from super classes of <code>BlogPost</code>. <br/>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>BlogPost</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getTypeFieldEntries() {
    return channel.getTypeFieldEntries(BlogPost.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>BlogPost</code>. <br>
   * This array <strong>does</strong> contain inherited TypeFieldEntry from super classes of <code>BlogPost</code>. <br>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>BlogPost</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getAllTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getAllTypeFieldEntries() {
    return channel.getAllTypeFieldEntries(BlogPost.class);
  }
  // ----------------------------------------------------------------------
  // FIELDs VALUE
  // ----------------------------------------------------------------------
  /**
   * Gets the value of the given <code>int</code> field name for the current <code>BlogPost</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public int getIntFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getIntFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>int</code> field name for the current <code>BlogPost</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0
   */
  @Override
public void setIntFieldValue(String fieldName, int value) throws NoSuchFieldException {
    super.setIntFieldValue(fieldName, value);
  }

  /**
   * Gets the value of the given <code>long</code> field name for the current <code>BlogPost</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public long getLongFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getLongFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>long</code> field name for the current <code>BlogPost</code>.
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
   * Gets the value of the given <code>double</code> field name for the current <code>BlogPost</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public double getDoubleFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getDoubleFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>double</code> field name for the current <code>BlogPost</code>.
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
   * Gets the value of the given <code>boolean</code> field name for the current <code>BlogPost</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public boolean getBooleanFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getBooleanFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>boolean</code> field name for the current <code>BlogPost</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0
   */
  @Override
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
  @Override
public TreeSet<Category> getCategoryFieldValue(String fieldName, Member mbr) throws NoSuchFieldException {
    if ("category".equals(fieldName)) { return getCategory(mbr); }
    return super.getCategoryFieldValue(fieldName, mbr);
  }
  /**
   * Gets the <code>Object</code> value of the given field name for this <code>BlogPost</code>. <br>
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
    if ("content".equals(fieldName)) { return getContent(lang, useDefault); }
    if ("summary".equals(fieldName)) { return getSummary(lang, useDefault); }
    if ("blog".equals(fieldName)) { return getBlog(); }
    if ("featuredImage".equals(fieldName)) { return getFeaturedImage(); }
    if ("featuredImageAlt".equals(fieldName)) { return getFeaturedImageAlt(lang, useDefault); }
    if ("thumbnailImage".equals(fieldName)) { return getThumbnailImage(); }
    if ("thumbnailImageAlt".equals(fieldName)) { return getThumbnailImageAlt(lang, useDefault); }
    return super.getFieldValue(fieldName, lang, useDefault);
  }

  /**
   * Sets the <code>Object</code> value of the given field name for this <code>BlogPost</code>. <br>
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
    if ("content".equals(fieldName)) { setContent(lang,(String)value); return; }
    if ("summary".equals(fieldName)) { setSummary(lang,(String)value); return; }
    if ("blog".equals(fieldName)) { setBlog((generated.Blog)value); return; }
    if ("featuredImage".equals(fieldName)) { setFeaturedImage((String)value); return; }
    if ("featuredImageAlt".equals(fieldName)) { setFeaturedImageAlt(lang,(String)value); return; }
    if ("thumbnailImage".equals(fieldName)) { setThumbnailImage((String)value); return; }
    if ("thumbnailImageAlt".equals(fieldName)) { setThumbnailImageAlt(lang,(String)value); return; }
    super.setFieldValue(fieldName, value, lang);
  }

  // ----------------------------------------------------------------------
  // content
  // ----------------------------------------------------------------------

  protected  String content = channel.getTypeFieldEntry(BlogPost.class, "content", true).getDefaultTextString();

  @Override
public String getContent() { return content; }

  @Override
public void setContent(String v) { content = v; }




  protected HashMap<String,String> contentML = channel.getTypeFieldEntry(BlogPost.class, "content", true).getDefaultTextMap();
  public String getContent(String lang) { return channel.getLangValue(lang, true, content, contentML, getMainLanguage()); }
  @Override
public String getContent(String lang, boolean useDefault) { return channel.getLangValue(lang, useDefault, content, contentML, getMainLanguage()); }
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
  // summary
  // ----------------------------------------------------------------------

  protected  String summary = channel.getTypeFieldEntry(BlogPost.class, "summary", true).getDefaultTextString();

  @Override
public String getSummary() { return summary; }

  public void setSummary(String v) { summary = v; }




  protected HashMap<String,String> summaryML = channel.getTypeFieldEntry(BlogPost.class, "summary", true).getDefaultTextMap();
  public String getSummary(String lang) { return channel.getLangValue(lang, true, summary, summaryML, getMainLanguage()); }
  @Override
public String getSummary(String lang, boolean useDefault) { return channel.getLangValue(lang, useDefault, summary, summaryML, getMainLanguage()); }
  @Override
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
  // blog
  // ----------------------------------------------------------------------

  @JsonProperty
  protected transient generated.Blog blog;
  protected transient String blogId;

  @Override
public generated.Blog getBlog() { return blog; }
  public void setBlog(generated.Blog v) {
    blogId = null;
    blog = v;
  }

  @Override
public String getBlogId() {
    if (blog == null) {
      return blogId;
    }
    return blog.getId();
  }
  public void setBlogId(String v) {
    blogId = v;
    blog = channel.getData(generated.Blog.class, v);
  }


  // ----------------------------------------------------------------------
  // featuredImage
  // ----------------------------------------------------------------------

  protected  String featuredImage = channel.getTypeFieldEntry(BlogPost.class, "featuredImage", true).getDefaultTextString();

  @Override
public String getFeaturedImage() { return featuredImage; }

  public void setFeaturedImage(String v) { featuredImage = v; }



  public String getFeaturedImage(String lang) { return featuredImage; }
  public String getFeaturedImage(String lang, boolean useDefault) { return featuredImage; }
  // ----------------------------------------------------------------------
  // featuredImageAlt
  // ----------------------------------------------------------------------

  protected  String featuredImageAlt = channel.getTypeFieldEntry(BlogPost.class, "featuredImageAlt", true).getDefaultTextString();

  public String getFeaturedImageAlt() { return featuredImageAlt; }

  public void setFeaturedImageAlt(String v) { featuredImageAlt = v; }




  protected HashMap<String,String> featuredImageAltML = channel.getTypeFieldEntry(BlogPost.class, "featuredImageAlt", true).getDefaultTextMap();
  public String getFeaturedImageAlt(String lang) { return channel.getLangValue(lang, true, featuredImageAlt, featuredImageAltML, getMainLanguage()); }
  public String getFeaturedImageAlt(String lang, boolean useDefault) { return channel.getLangValue(lang, useDefault, featuredImageAlt, featuredImageAltML, getMainLanguage()); }
  public HashMap<String,String> getFeaturedImageAltML() { return featuredImageAltML; }
  public void setFeaturedImageAltML(HashMap<String,String> v) { featuredImageAltML = v; }

  public String getFeaturedImageAltMLE() {
    return JcmsUtil.encodeMLE(getFeaturedImageAltML());
  }

  public void setFeaturedImageAltMLE(String v) {
    setFeaturedImageAltML(JcmsUtil.decodeMLE(v));
  }

  public void setFeaturedImageAlt(String lang, String value) {
    if (channel.getLanguage().equals(lang)) {
      featuredImageAlt = value;
      return;
    }
    if (featuredImageAltML == null) {
      featuredImageAltML = new HashMap<>();
    } else if (this != channel.getData(id)) {
      featuredImageAltML = new HashMap<>(featuredImageAltML);
    }
    featuredImageAltML.put(lang, value);
  }
  // ----------------------------------------------------------------------
  // thumbnailImage
  // ----------------------------------------------------------------------

  protected  String thumbnailImage = channel.getTypeFieldEntry(BlogPost.class, "thumbnailImage", true).getDefaultTextString();

  @Override
public String getThumbnailImage() { return thumbnailImage; }

  public void setThumbnailImage(String v) { thumbnailImage = v; }



  public String getThumbnailImage(String lang) { return thumbnailImage; }
  public String getThumbnailImage(String lang, boolean useDefault) { return thumbnailImage; }
  // ----------------------------------------------------------------------
  // thumbnailImageAlt
  // ----------------------------------------------------------------------

  protected  String thumbnailImageAlt = channel.getTypeFieldEntry(BlogPost.class, "thumbnailImageAlt", true).getDefaultTextString();

  public String getThumbnailImageAlt() { return thumbnailImageAlt; }

  public void setThumbnailImageAlt(String v) { thumbnailImageAlt = v; }




  protected HashMap<String,String> thumbnailImageAltML = channel.getTypeFieldEntry(BlogPost.class, "thumbnailImageAlt", true).getDefaultTextMap();
  public String getThumbnailImageAlt(String lang) { return channel.getLangValue(lang, true, thumbnailImageAlt, thumbnailImageAltML, getMainLanguage()); }
  public String getThumbnailImageAlt(String lang, boolean useDefault) { return channel.getLangValue(lang, useDefault, thumbnailImageAlt, thumbnailImageAltML, getMainLanguage()); }
  public HashMap<String,String> getThumbnailImageAltML() { return thumbnailImageAltML; }
  public void setThumbnailImageAltML(HashMap<String,String> v) { thumbnailImageAltML = v; }

  public String getThumbnailImageAltMLE() {
    return JcmsUtil.encodeMLE(getThumbnailImageAltML());
  }

  public void setThumbnailImageAltMLE(String v) {
    setThumbnailImageAltML(JcmsUtil.decodeMLE(v));
  }

  public void setThumbnailImageAlt(String lang, String value) {
    if (channel.getLanguage().equals(lang)) {
      thumbnailImageAlt = value;
      return;
    }
    if (thumbnailImageAltML == null) {
      thumbnailImageAltML = new HashMap<>();
    } else if (this != channel.getData(id)) {
      thumbnailImageAltML = new HashMap<>(thumbnailImageAltML);
    }
    thumbnailImageAltML.put(lang, value);
  }
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
    sb.ensureCapacity(500 * (0 + 1 + 0 + 0 + 0 + 0) );
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

  public TreeSet<Category> getCategory(Member member) {
    return getDescendantCategorySet(channel.getCategory("j_3"), false, member);
  }
  public Category getFirstCategory(Member member) {
    return getFirstDescendantCategory(channel.getCategory("j_3"), false, member);
  }
  @Override
  public <T extends Data> TreeSet<T> getLinkDataSet(Class<T> clazz) {
    if (clazz == null) {
      return Util.emptyTreeSet();
    }
    TreeSet<T> set = new TreeSet<>();
    JcmsUtil.addData(set, clazz, getBlog());
    return set;
  }

  // ----------------------------------------------------------------------
  // TreeNode implementation
  // ----------------------------------------------------------------------
  @Override
  public Collection<? extends TreeNode> getTreeChildren() {
    return Util.emptyTreeSet();
  }

  @Override
public TreeNode getTreeParent() {
    return getBlog();
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

    if (JHTMLUtils.isEmpty(getFieldInMainLanguage(content, contentML))) {
      status = new ControllerStatus();
      status.setProp("msg.edit.empty-fieldml", channel.getTypeFieldLabel(this, "content"), new LangProperty("lang." + getMainLanguage()));
      return status;
    }
    if (getBlog() == null) {
      status = new ControllerStatus();
      status.setProp("msg.edit.empty-field", channel.getTypeFieldLabel(this, "blog"));
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
    ((BlogPost)mergeCopy).setContent(getContent());
    ((BlogPost)mergeCopy).setContentML(JcmsUtil.getMergedMLMap(getContentML(), ((BlogPost)mergeCopy).getContentML()));
    ((BlogPost)mergeCopy).setSummary(getSummary());
    ((BlogPost)mergeCopy).setSummaryML(JcmsUtil.getMergedMLMap(getSummaryML(), ((BlogPost)mergeCopy).getSummaryML()));
    ((BlogPost)mergeCopy).setBlog(getBlog());
    ((BlogPost)mergeCopy).setFeaturedImage(getFeaturedImage());
    ((BlogPost)mergeCopy).setFeaturedImageAlt(getFeaturedImageAlt());
    ((BlogPost)mergeCopy).setFeaturedImageAltML(JcmsUtil.getMergedMLMap(getFeaturedImageAltML(), ((BlogPost)mergeCopy).getFeaturedImageAltML()));
    ((BlogPost)mergeCopy).setThumbnailImage(getThumbnailImage());
    ((BlogPost)mergeCopy).setThumbnailImageAlt(getThumbnailImageAlt());
    ((BlogPost)mergeCopy).setThumbnailImageAltML(JcmsUtil.getMergedMLMap(getThumbnailImageAltML(), ((BlogPost)mergeCopy).getThumbnailImageAltML()));
  }
  @Override
  public void performCreate(Member mbr, Map context) {
    featuredImageAlt = Util.truncateVarchar(featuredImageAlt);
    thumbnailImageAlt = Util.truncateVarchar(thumbnailImageAlt);
    super.performCreate(mbr, context);
  }

  @Override
  public void performUpdate(Member mbr, Map context) {
    featuredImageAlt = Util.truncateVarchar(featuredImageAlt);
    thumbnailImageAlt = Util.truncateVarchar(thumbnailImageAlt);
    super.performUpdate(mbr, context);
  }
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// wHEWNPpQkmIPIMu6XtvlDg==
