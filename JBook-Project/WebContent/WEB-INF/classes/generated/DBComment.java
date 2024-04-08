// This file has been automatically generated.

package generated;

import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.SortedSet;
import java.util.TreeSet;

import org.apache.oro.text.regex.Pattern;
import org.apache.oro.text.regex.Perl5Compiler;
import org.apache.oro.text.regex.Perl5Matcher;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.jalios.jcms.Category;
import com.jalios.jcms.ControllerStatus;
import com.jalios.jcms.Data;
import com.jalios.jcms.EnumerateFormReport;
import com.jalios.jcms.FileDocument;
import com.jalios.jcms.JcmsUtil;
import com.jalios.jcms.Member;
import com.jalios.jcms.Publication;
import com.jalios.jcms.TypeEntry;
import com.jalios.jcms.TypeFieldEntry;
import com.jalios.jcms.db.DBData;
import com.jalios.jcms.db.HistorizedDBData;
import com.jalios.jcms.mashup.ExportUtil;
import com.jalios.jcms.mashup.ImportOptions;
import com.jalios.jcms.mashup.ImportUtil;
import com.jalios.jcms.wysiwyg.JHTMLUtils;
import com.jalios.util.ObjectIntTreeMap;
import com.jalios.util.TreeNode;
import com.jalios.util.Util;

@SuppressWarnings({"unchecked", "unused"})
public  class DBComment extends com.jalios.jcmsplugin.dbcomment.AbstractDBComment
             implements
                com.jalios.jstore.Searchable
               , TreeNode
               , DBData
               , HistorizedDBData
{

  // ----------------------------------------------------------------------
  // CONSTRUCTORS
  // ----------------------------------------------------------------------
  public DBComment() {}






  public DBComment(DBComment other) {
    super(other);
    name = other.name;
    email = other.email;
    webSite = other.webSite;
    description = other.description;
    targetContent = other.targetContent;
    ipAddress = other.ipAddress;
    userAgent = other.userAgent;
    referer = other.referer;
    privateComment = other.privateComment;
  }

  // ----------------------------------------------------------------------
  // Import / Export
  // ----------------------------------------------------------------------
  @Override
public void importXml(org.jdom.Element elt, ImportOptions options) {
    super.importXml(elt, options);

    setName(ImportUtil.parseFieldText(elt, "name"));
    setEmail(ImportUtil.parseFieldText(elt, "email"));
    setWebSite(ImportUtil.parseFieldText(elt, "webSite"));
    setIpAddress(ImportUtil.parseFieldText(elt, "ipAddress"));
    setUserAgent(ImportUtil.parseFieldText(elt, "userAgent"));
    setReferer(ImportUtil.parseFieldText(elt, "referer"));
    setPrivateComment(ImportUtil.parseFieldBoolean(elt, "privateComment"));
  }

  @Override
protected void importXmlFieldsWithReferences(org.jdom.Element elt, ImportOptions options) {
    super.importXmlFieldsWithReferences(elt, options);

    if (options.isSelfImport()) {
      setDescription(ImportUtil.parseFieldText(elt, "description"));
      setTargetContent(ImportUtil.parseSelfFieldData(elt, "targetContent", com.jalios.jcms.Publication.class));
    } else {

    setDescription(ImportUtil.parseFieldWiki(elt, "description"));
    setTargetContent((com.jalios.jcms.Publication)ImportUtil.parseFieldData(elt, "targetContent"));
    }
  }

  @Override
public void exportXmlField(StringBuffer sb, int indentLevel) {
    super.exportXmlField(sb, indentLevel);
    sb.append(ExportUtil.exportField(indentLevel, "name", getName(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "email", getEmail(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "webSite", getWebSite(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "description", getDescription(), true, true));
    sb.append(ExportUtil.exportField(indentLevel, "targetContent", getTargetContent()));
    sb.append(ExportUtil.exportField(indentLevel, "ipAddress", getIpAddress(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "userAgent", getUserAgent(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "referer", getReferer(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "privateComment", getPrivateComment()));
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
   * Returns the TypeEntry bound to <code>DBComment</code>. <br>
   * @see com.jalios.jcms.Channel#getTypeEntry(Class)
   * @since jcms-5.5
   */
  public static TypeEntry getTypeEntry() {
    return channel.getTypeEntry(DBComment.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>DBComment</code>. <br>
   * This array <strong>does not</strong> contain inherited TypeFieldEntry from super classes of <code>DBComment</code>. <br/>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>DBComment</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getTypeFieldEntries() {
    return channel.getTypeFieldEntries(DBComment.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>DBComment</code>. <br>
   * This array <strong>does</strong> contain inherited TypeFieldEntry from super classes of <code>DBComment</code>. <br>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>DBComment</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getAllTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getAllTypeFieldEntries() {
    return channel.getAllTypeFieldEntries(DBComment.class);
  }
  // ----------------------------------------------------------------------
  // FIELDs VALUE
  // ----------------------------------------------------------------------
  /**
   * Gets the value of the given <code>int</code> field name for the current <code>DBComment</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public int getIntFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getIntFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>int</code> field name for the current <code>DBComment</code>.
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
   * Gets the value of the given <code>long</code> field name for the current <code>DBComment</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public long getLongFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getLongFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>long</code> field name for the current <code>DBComment</code>.
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
   * Gets the value of the given <code>double</code> field name for the current <code>DBComment</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public double getDoubleFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getDoubleFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>double</code> field name for the current <code>DBComment</code>.
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
   * Gets the value of the given <code>boolean</code> field name for the current <code>DBComment</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public boolean getBooleanFieldValue(String fieldName) throws NoSuchFieldException {
    if ("privateComment".equals(fieldName)) { return getPrivateComment(); }
    return super.getBooleanFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>boolean</code> field name for the current <code>DBComment</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0
   */
  @Override
public void setBooleanFieldValue(String fieldName, boolean value) throws NoSuchFieldException {
    if ("privateComment".equals(fieldName)) { setPrivateComment(value); return; }
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
   * Gets the <code>Object</code> value of the given field name for this <code>DBComment</code>. <br>
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
    if ("name".equals(fieldName)) { return getName(); }
    if ("email".equals(fieldName)) { return getEmail(); }
    if ("webSite".equals(fieldName)) { return getWebSite(); }
    if ("description".equals(fieldName)) { return getDescription(); }
    if ("targetContent".equals(fieldName)) { return getTargetContent(); }
    if ("ipAddress".equals(fieldName)) { return getIpAddress(); }
    if ("userAgent".equals(fieldName)) { return getUserAgent(); }
    if ("referer".equals(fieldName)) { return getReferer(); }
    return super.getFieldValue(fieldName, lang, useDefault);
  }

  /**
   * Sets the <code>Object</code> value of the given field name for this <code>DBComment</code>. <br>
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
    if ("name".equals(fieldName)) { setName((String)value); return; }
    if ("email".equals(fieldName)) { setEmail((String)value); return; }
    if ("webSite".equals(fieldName)) { setWebSite((String)value); return; }
    if ("description".equals(fieldName)) { setDescription((String)value); return; }
    if ("targetContent".equals(fieldName)) { setTargetContent((com.jalios.jcms.Publication)value); return; }
    if ("ipAddress".equals(fieldName)) { setIpAddress((String)value); return; }
    if ("userAgent".equals(fieldName)) { setUserAgent((String)value); return; }
    if ("referer".equals(fieldName)) { setReferer((String)value); return; }
    super.setFieldValue(fieldName, value, lang);
  }

  // ----------------------------------------------------------------------
  // name
  // ----------------------------------------------------------------------

  protected  String name = channel.getTypeFieldEntry(DBComment.class, "name", true).getDefaultTextString();

  @Override
public String getName() { return name; }

  public void setName(String v) { name = v; }



  public String getName(String lang) { return name; }
  public String getName(String lang, boolean useDefault) { return name; }
  // ----------------------------------------------------------------------
  // email
  // ----------------------------------------------------------------------

  protected  String email = channel.getTypeFieldEntry(DBComment.class, "email", true).getDefaultTextString();

  @Override
public String getEmail() { return email; }

  public void setEmail(String v) { email = v; }



  public String getEmail(String lang) { return email; }
  public String getEmail(String lang, boolean useDefault) { return email; }
  // ----------------------------------------------------------------------
  // webSite
  // ----------------------------------------------------------------------

  protected  String webSite = channel.getTypeFieldEntry(DBComment.class, "webSite", true).getDefaultTextString();

  public String getWebSite() { return webSite; }

  public void setWebSite(String v) { webSite = v; }



  public String getWebSite(String lang) { return webSite; }
  public String getWebSite(String lang, boolean useDefault) { return webSite; }
  // ----------------------------------------------------------------------
  // description
  // ----------------------------------------------------------------------

  protected  String description = channel.getTypeFieldEntry(DBComment.class, "description", true).getDefaultTextString();

  @Override
public String getDescription() { return description; }

  public void setDescription(String v) { description = v; }



  public String getDescription(String lang) { return description; }
  public String getDescription(String lang, boolean useDefault) { return description; }
  // ----------------------------------------------------------------------
  // targetContent
  // ----------------------------------------------------------------------

  @JsonProperty
  protected transient com.jalios.jcms.Publication targetContent;
  protected transient String targetContentId;

  @Override
public com.jalios.jcms.Publication getTargetContent() { return targetContent; }
  public void setTargetContent(com.jalios.jcms.Publication v) {
    targetContentId = null;
    targetContent = v;
  }

  @Override
public String getTargetContentId() {
    if (targetContent == null) {
      return targetContentId;
    }
    return targetContent.getId();
  }
  public void setTargetContentId(String v) {
    targetContentId = v;
    targetContent = channel.getData(com.jalios.jcms.Publication.class, v);
  }


  // ----------------------------------------------------------------------
  // ipAddress
  // ----------------------------------------------------------------------

  protected  String ipAddress = channel.getTypeFieldEntry(DBComment.class, "ipAddress", true).getDefaultTextString();

  public String getIpAddress() { return ipAddress; }

  public void setIpAddress(String v) { ipAddress = v; }



  public String getIpAddress(String lang) { return ipAddress; }
  public String getIpAddress(String lang, boolean useDefault) { return ipAddress; }
  // ----------------------------------------------------------------------
  // userAgent
  // ----------------------------------------------------------------------

  protected  String userAgent = channel.getTypeFieldEntry(DBComment.class, "userAgent", true).getDefaultTextString();

  public String getUserAgent() { return userAgent; }

  public void setUserAgent(String v) { userAgent = v; }



  public String getUserAgent(String lang) { return userAgent; }
  public String getUserAgent(String lang, boolean useDefault) { return userAgent; }
  // ----------------------------------------------------------------------
  // referer
  // ----------------------------------------------------------------------

  protected  String referer = channel.getTypeFieldEntry(DBComment.class, "referer", true).getDefaultTextString();

  public String getReferer() { return referer; }

  public void setReferer(String v) { referer = v; }



  public String getReferer(String lang) { return referer; }
  public String getReferer(String lang, boolean useDefault) { return referer; }
  // ----------------------------------------------------------------------
  // privateComment
  // ----------------------------------------------------------------------

  protected  boolean privateComment = false;

  @Override
public boolean getPrivateComment() { return privateComment; }

  public void setPrivateComment(Boolean v) {
    privateComment = v == null ? false : v.booleanValue();
  }



  public String getPrivateCommentLabel(String lang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(this.getClass(), "privateComment", true);
    return privateComment ? tfe.getOnLabel(lang) : tfe.getOffLabel(lang);
  }
  public static String[] getPrivateCommentValues() {
    return new String[]{ "true" , "false" };
  }

  public static String[] getPrivateCommentLabels(String userLang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(DBComment.class, "privateComment", true);
    String onLabel = tfe.getOnLabel(userLang);
    String offLabel = tfe.getOffLabel(userLang);

    return new String[]{ onLabel, offLabel };
  }
  public static EnumerateFormReport getPrivateCommentReport(SortedSet<DBComment> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (DBComment obj : set) {
      if (obj == null) {
        continue;
      }

      map.inc("" + obj.getPrivateComment());

      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }

  // ----------------------------------------------------------------------
  // abstract
  // ----------------------------------------------------------------------
  @Override
  public void setAbstract(String lang, String value) { setDescription(value); }
  @Override
  public String getAbstract() { return description; }
  @Override
  public String getAbstract(String lang, boolean useDefault) { return getDescription(lang, useDefault); }
  @Override
  public String[] getSearchStrings() {
    StringBuffer sb = new StringBuffer(super.getSearchStrings()[0]);
    sb.ensureCapacity(500 * (2 + 0 + 0 + 0 + 0 + 0) );
    if (description != null) {
      sb.append(description); sb.append(' ');
    }
    if (name != null) {
      sb.append(name); sb.append(' ');
    }
    return new String[] {sb.toString()};
  }

  @Override
  public String getAllWikiText() {
    StringBuffer sb = new StringBuffer(super.getAllWikiText());
    sb.ensureCapacity(500 * (1 + 0 + 0 + 0 + 0 + 0) );
    if (description != null && !JHTMLUtils.isJHTML(null, description)) {
      sb.append(description); sb.append(' ');
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
   // Wysiwyg fields
    return sb.toString();
  }

  @Override
  public <T extends Data> TreeSet<T> getLinkDataSet(Class<T> clazz) {
    if (clazz == null) {
      return Util.emptyTreeSet();
    }
    TreeSet<T> set = new TreeSet<>();
    JcmsUtil.addData(set, clazz, getTargetContent());
    return set;
  }

  // ----------------------------------------------------------------------
  // TreeNode implementation
  // ----------------------------------------------------------------------
  @Override
  public Collection<? extends TreeNode> getTreeChildren() {
    return getLinkIndexedDataSet(com.jalios.jcms.Publication.class, "parent");
  }

  @Override
public TreeNode getTreeParent() {
    return getTargetContent();
  }
  // ----------------------------------------------------------------------
  // DataController
  // ----------------------------------------------------------------------
  static Pattern _emailPattern;
  static {
    try {
      _emailPattern = (new Perl5Compiler()).compile("([-0-9a-zA-Z_\\.']+@[-0-9a-zA-Z_\\.]+)?", Perl5Compiler.CASE_INSENSITIVE_MASK);
    }
    catch(org.apache.oro.text.regex.MalformedPatternException ex) {
      // Empty
    }
  }

  public boolean checkPatternEmail() {
    if (Util.notEmpty(email) && !(new Perl5Matcher()).matches(email, _emailPattern)) {
      return false;
    }
    return true;
  }

  static Pattern _webSitePattern;
  static {
    try {
      _webSitePattern = (new Perl5Compiler()).compile("^((http)|(https)|(ftp)|(mailto)):.*", Perl5Compiler.CASE_INSENSITIVE_MASK);
    }
    catch(org.apache.oro.text.regex.MalformedPatternException ex) {
      // Empty
    }
  }

  public boolean checkPatternWebSite() {
    if (Util.notEmpty(webSite) && !(new Perl5Matcher()).matches(webSite, _webSitePattern)) {
      return false;
    }
    return true;
  }

  @Override
public ControllerStatus checkIntegrity() {

    ControllerStatus status = super.checkIntegrity();
    if (status.hasFailed()) {
      return status;
    }

    if (!Util.isValidEmail(email)) {
      status = new ControllerStatus();
      status.setProp("msg.edit.bad-email", channel.getTypeFieldLabel(this, "email"));
      return status;
    }
    if (!Util.isValidUrl(webSite)) {
      status = new ControllerStatus();
      status.setProp("msg.edit.bad-url", channel.getTypeFieldLabel(this, "webSite"));
      return status;
    }
    if (JHTMLUtils.isEmpty(description)) {
      status = new ControllerStatus();
      status.setProp("msg.edit.empty-field", channel.getTypeFieldLabel(this, "description"), null);
      return status;
    }
    if (getTargetContent() == null) {
      status = new ControllerStatus();
      status.setProp("msg.edit.empty-field", channel.getTypeFieldLabel(this, "targetContent"));
      return status;
    }
    return ControllerStatus.OK;
  }

  @Override
public Set<String> getExternalLinkSet() {
    Set<String> set = super.getExternalLinkSet();

    if (Util.notEmpty(webSite)) {
      set.add(webSite);
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
    ((DBComment)mergeCopy).setName(getName());
    ((DBComment)mergeCopy).setEmail(getEmail());
    ((DBComment)mergeCopy).setWebSite(getWebSite());
    ((DBComment)mergeCopy).setDescription(getDescription());
    ((DBComment)mergeCopy).setTargetContent(getTargetContent());
    ((DBComment)mergeCopy).setIpAddress(getIpAddress());
    ((DBComment)mergeCopy).setUserAgent(getUserAgent());
    ((DBComment)mergeCopy).setReferer(getReferer());
    ((DBComment)mergeCopy).setPrivateComment(getPrivateComment());
  }
  @Override
  public void performCreate(Member mbr, Map context) {
    name = Util.truncateVarchar(name);
    ipAddress = Util.truncateVarchar(ipAddress);
    userAgent = Util.truncateVarchar(userAgent);
    referer = Util.truncateVarchar(referer);
    super.performCreate(mbr, context);
  }

  @Override
  public void performUpdate(Member mbr, Map context) {
    name = Util.truncateVarchar(name);
    ipAddress = Util.truncateVarchar(ipAddress);
    userAgent = Util.truncateVarchar(userAgent);
    referer = Util.truncateVarchar(referer);
    super.performUpdate(mbr, context);
  }
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// gDO5FEvZGxbRtUQOFVuDZA==
