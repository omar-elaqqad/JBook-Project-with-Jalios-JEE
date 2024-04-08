// This file has been automatically generated.

package generated;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;
import java.util.TreeSet;

import com.jalios.jcms.Category;
import com.jalios.jcms.ControllerStatus;
import com.jalios.jcms.Data;
import com.jalios.jcms.FileDocument;
import com.jalios.jcms.JcmsUtil;
import com.jalios.jcms.Member;
import com.jalios.jcms.Publication;
import com.jalios.jcms.TypeEntry;
import com.jalios.jcms.TypeFieldEntry;
import com.jalios.jcms.mashup.ExportUtil;
import com.jalios.jcms.mashup.ImportOptions;
import com.jalios.jcms.mashup.ImportUtil;
import com.jalios.jcms.wysiwyg.JHTMLUtils;
import com.jalios.util.Util;

@SuppressWarnings({"unchecked", "unused"})
public  class WebPage extends com.jalios.jcms.AbstractWebPage
             implements
                com.jalios.jstore.Searchable
{

  // ----------------------------------------------------------------------
  // CONSTRUCTORS
  // ----------------------------------------------------------------------
  public WebPage() {}






  public WebPage(WebPage other) {
    super(other);
    url = other.url;
    urlToShot = other.urlToShot;
    description = other.description;
    descriptionML = other.descriptionML;
  }

  // ----------------------------------------------------------------------
  // Import / Export
  // ----------------------------------------------------------------------
  @Override
public void importXml(org.jdom.Element elt, ImportOptions options) {
    super.importXml(elt, options);

    setUrl(ImportUtil.parseFieldText(elt, "url"));
    setUrlToShot(ImportUtil.parseFieldText(elt, "urlToShot"));
  }

  @Override
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

  @Override
public void exportXmlField(StringBuffer sb, int indentLevel) {
    super.exportXmlField(sb, indentLevel);
    sb.append(ExportUtil.exportField(indentLevel, "url", getUrl(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "urlToShot", getUrlToShot(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "description", getDescription(), "descriptionML", true, true));
    sb.append(ExportUtil.exportField(indentLevel, "descriptionML", getDescriptionML(), true));
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
   * Returns the TypeEntry bound to <code>WebPage</code>. <br>
   * @see com.jalios.jcms.Channel#getTypeEntry(Class)
   * @since jcms-5.5
   */
  public static TypeEntry getTypeEntry() {
    return channel.getTypeEntry(WebPage.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>WebPage</code>. <br>
   * This array <strong>does not</strong> contain inherited TypeFieldEntry from super classes of <code>WebPage</code>. <br/>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>WebPage</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getTypeFieldEntries() {
    return channel.getTypeFieldEntries(WebPage.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>WebPage</code>. <br>
   * This array <strong>does</strong> contain inherited TypeFieldEntry from super classes of <code>WebPage</code>. <br>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>WebPage</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getAllTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getAllTypeFieldEntries() {
    return channel.getAllTypeFieldEntries(WebPage.class);
  }
  // ----------------------------------------------------------------------
  // FIELDs VALUE
  // ----------------------------------------------------------------------
  /**
   * Gets the value of the given <code>int</code> field name for the current <code>WebPage</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public int getIntFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getIntFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>int</code> field name for the current <code>WebPage</code>.
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
   * Gets the value of the given <code>long</code> field name for the current <code>WebPage</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public long getLongFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getLongFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>long</code> field name for the current <code>WebPage</code>.
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
   * Gets the value of the given <code>double</code> field name for the current <code>WebPage</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public double getDoubleFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getDoubleFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>double</code> field name for the current <code>WebPage</code>.
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
   * Gets the value of the given <code>boolean</code> field name for the current <code>WebPage</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public boolean getBooleanFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getBooleanFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>boolean</code> field name for the current <code>WebPage</code>.
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
    return super.getCategoryFieldValue(fieldName, mbr);
  }
  /**
   * Gets the <code>Object</code> value of the given field name for this <code>WebPage</code>. <br>
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
    if ("url".equals(fieldName)) { return getUrl(); }
    if ("urlToShot".equals(fieldName)) { return getUrlToShot(); }
    if ("description".equals(fieldName)) { return getDescription(lang, useDefault); }
    return super.getFieldValue(fieldName, lang, useDefault);
  }

  /**
   * Sets the <code>Object</code> value of the given field name for this <code>WebPage</code>. <br>
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
    if ("url".equals(fieldName)) { setUrl((String)value); return; }
    if ("urlToShot".equals(fieldName)) { setUrlToShot((String)value); return; }
    if ("description".equals(fieldName)) { setDescription(lang,(String)value); return; }
    super.setFieldValue(fieldName, value, lang);
  }

  // ----------------------------------------------------------------------
  // url
  // ----------------------------------------------------------------------

  protected  String url = channel.getTypeFieldEntry(WebPage.class, "url", true).getDefaultTextString();

  @Override
public String getUrl() { return url; }

  public void setUrl(String v) { url = v; }



  public String getUrl(String lang) { return url; }
  public String getUrl(String lang, boolean useDefault) { return url; }
  // ----------------------------------------------------------------------
  // urlToShot
  // ----------------------------------------------------------------------

  protected  String urlToShot = channel.getTypeFieldEntry(WebPage.class, "urlToShot", true).getDefaultTextString();

  @Override
public String getUrlToShot() { return urlToShot; }

  @Override
public void setUrlToShot(String v) { urlToShot = v; }



  public String getUrlToShot(String lang) { return urlToShot; }
  public String getUrlToShot(String lang, boolean useDefault) { return urlToShot; }
  // ----------------------------------------------------------------------
  // description
  // ----------------------------------------------------------------------

  protected  String description = channel.getTypeFieldEntry(WebPage.class, "description", true).getDefaultTextString();

  public String getDescription() { return description; }

  public void setDescription(String v) { description = v; }




  protected HashMap<String,String> descriptionML = channel.getTypeFieldEntry(WebPage.class, "description", true).getDefaultTextMap();
  public String getDescription(String lang) { return channel.getLangValue(lang, true, description, descriptionML, getMainLanguage()); }
  public String getDescription(String lang, boolean useDefault) { return channel.getLangValue(lang, useDefault, description, descriptionML, getMainLanguage()); }
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
  @Override
  public String[] getSearchStrings() {
    StringBuffer sb = new StringBuffer(super.getSearchStrings()[0]);
    sb.ensureCapacity(500 * (2 + 2 + 0 + 0 + 0 + 0) );
    if (url != null) {
      sb.append(url); sb.append(' ');
    }
    if (urlToShot != null) {
      sb.append(urlToShot); sb.append(' ');
    }
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
  @Override
public ControllerStatus checkIntegrity() {

    ControllerStatus status = super.checkIntegrity();
    if (status.hasFailed()) {
      return status;
    }

    if (Util.isEmpty(url)) {
      status = new ControllerStatus();
      status.setProp("msg.edit.empty-field", channel.getTypeFieldLabel(this, "url"), null);
      return status;
    }
    if (!Util.isValidUrl(url)) {
      status = new ControllerStatus();
      status.setProp("msg.edit.bad-url", channel.getTypeFieldLabel(this, "url"));
      return status;
    }
    if (!Util.isValidUrl(urlToShot)) {
      status = new ControllerStatus();
      status.setProp("msg.edit.bad-url", channel.getTypeFieldLabel(this, "urlToShot"));
      return status;
    }
    return ControllerStatus.OK;
  }

  @Override
public Set<String> getExternalLinkSet() {
    Set<String> set = super.getExternalLinkSet();

    if (Util.notEmpty(url)) {
      set.add(url);
    }

    if (Util.notEmpty(urlToShot)) {
      set.add(urlToShot);
    }
    String prefixUrl = channel.getUrl();
    for (Iterator<String> it = set.iterator(); it.hasNext();) {
      String url = it.next();
      if (url.startsWith(prefixUrl)) {
        it.remove();
      }
    }

    return set;
  }

  // ----------------------------------------------------------------------
  // WorkCopy
  // ----------------------------------------------------------------------
  @Override
protected void prepareMergeCopy(Publication mergeCopy) {
    super.prepareMergeCopy(mergeCopy);
    ((WebPage)mergeCopy).setUrl(getUrl());
    ((WebPage)mergeCopy).setUrlToShot(getUrlToShot());
    ((WebPage)mergeCopy).setDescription(getDescription());
    ((WebPage)mergeCopy).setDescriptionML(JcmsUtil.getMergedMLMap(getDescriptionML(), ((WebPage)mergeCopy).getDescriptionML()));
  }
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// 7eRacmYw3G2Cn1pthYHtGQ==
