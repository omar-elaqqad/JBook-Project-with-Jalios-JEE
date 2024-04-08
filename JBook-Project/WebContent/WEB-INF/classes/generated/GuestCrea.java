// This file has been automatically generated.

package generated;

import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

import org.apache.oro.text.regex.Pattern;
import org.apache.oro.text.regex.Perl5Compiler;
import org.apache.oro.text.regex.Perl5Matcher;

import com.jalios.jcms.Category;
import com.jalios.jcms.ControllerStatus;
import com.jalios.jcms.Data;
import com.jalios.jcms.FileDocument;
import com.jalios.jcms.JcmsUtil;
import com.jalios.jcms.Member;
import com.jalios.jcms.Publication;
import com.jalios.jcms.TypeEntry;
import com.jalios.jcms.TypeFieldEntry;
import com.jalios.jcms.db.DBData;
import com.jalios.jcms.mashup.ExportUtil;
import com.jalios.jcms.mashup.ImportOptions;
import com.jalios.jcms.mashup.ImportUtil;
import com.jalios.util.Util;

@SuppressWarnings({"unchecked", "unused"})
public  class GuestCrea extends generated.GuestRequest
             implements
                com.jalios.jstore.Searchable
               , DBData
{

  // ----------------------------------------------------------------------
  // CONSTRUCTORS
  // ----------------------------------------------------------------------
  public GuestCrea() {}


  public GuestCrea(GuestRequest other) {
    super(other);
  }




  public GuestCrea(GuestCrea other) {
    super(other);
    name = other.name;
    firstname = other.firstname;
    email = other.email;
    organization = other.organization;
    language = other.language;
    country = other.country;
  }

  // ----------------------------------------------------------------------
  // Import / Export
  // ----------------------------------------------------------------------
  @Override
public void importXml(org.jdom.Element elt, ImportOptions options) {
    super.importXml(elt, options);

    setName(ImportUtil.parseFieldText(elt, "name"));
    setFirstname(ImportUtil.parseFieldText(elt, "firstname"));
    setEmail(ImportUtil.parseFieldText(elt, "email"));
    setOrganization(ImportUtil.parseFieldText(elt, "organization"));
    setLanguage(ImportUtil.parseFieldText(elt, "language"));
    setCountry(ImportUtil.parseFieldText(elt, "country"));
  }

  @Override
protected void importXmlFieldsWithReferences(org.jdom.Element elt, ImportOptions options) {
    super.importXmlFieldsWithReferences(elt, options);

    if (options.isSelfImport()) {
    } else {

    }
  }

  @Override
public void exportXmlField(StringBuffer sb, int indentLevel) {
    super.exportXmlField(sb, indentLevel);
    sb.append(ExportUtil.exportField(indentLevel, "name", getName(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "firstname", getFirstname(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "email", getEmail(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "organization", getOrganization(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "language", getLanguage(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "country", getCountry(), false, true));
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
   * Returns the TypeEntry bound to <code>GuestCrea</code>. <br>
   * @see com.jalios.jcms.Channel#getTypeEntry(Class)
   * @since jcms-5.5
   */
  public static TypeEntry getTypeEntry() {
    return channel.getTypeEntry(GuestCrea.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>GuestCrea</code>. <br>
   * This array <strong>does not</strong> contain inherited TypeFieldEntry from super classes of <code>GuestCrea</code>. <br/>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>GuestCrea</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getTypeFieldEntries() {
    return channel.getTypeFieldEntries(GuestCrea.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>GuestCrea</code>. <br>
   * This array <strong>does</strong> contain inherited TypeFieldEntry from super classes of <code>GuestCrea</code>. <br>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>GuestCrea</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getAllTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getAllTypeFieldEntries() {
    return channel.getAllTypeFieldEntries(GuestCrea.class);
  }
  // ----------------------------------------------------------------------
  // FIELDs VALUE
  // ----------------------------------------------------------------------
  /**
   * Gets the value of the given <code>int</code> field name for the current <code>GuestCrea</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public int getIntFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getIntFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>int</code> field name for the current <code>GuestCrea</code>.
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
   * Gets the value of the given <code>long</code> field name for the current <code>GuestCrea</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public long getLongFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getLongFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>long</code> field name for the current <code>GuestCrea</code>.
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
   * Gets the value of the given <code>double</code> field name for the current <code>GuestCrea</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public double getDoubleFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getDoubleFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>double</code> field name for the current <code>GuestCrea</code>.
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
   * Gets the value of the given <code>boolean</code> field name for the current <code>GuestCrea</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public boolean getBooleanFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getBooleanFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>boolean</code> field name for the current <code>GuestCrea</code>.
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
   * Gets the <code>Object</code> value of the given field name for this <code>GuestCrea</code>. <br>
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
    if ("firstname".equals(fieldName)) { return getFirstname(); }
    if ("email".equals(fieldName)) { return getEmail(); }
    if ("organization".equals(fieldName)) { return getOrganization(); }
    if ("language".equals(fieldName)) { return getLanguage(); }
    if ("country".equals(fieldName)) { return getCountry(); }
    return super.getFieldValue(fieldName, lang, useDefault);
  }

  /**
   * Sets the <code>Object</code> value of the given field name for this <code>GuestCrea</code>. <br>
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
    if ("firstname".equals(fieldName)) { setFirstname((String)value); return; }
    if ("email".equals(fieldName)) { setEmail((String)value); return; }
    if ("organization".equals(fieldName)) { setOrganization((String)value); return; }
    if ("language".equals(fieldName)) { setLanguage((String)value); return; }
    if ("country".equals(fieldName)) { setCountry((String)value); return; }
    super.setFieldValue(fieldName, value, lang);
  }

  // ----------------------------------------------------------------------
  // name
  // ----------------------------------------------------------------------

  protected  String name = channel.getTypeFieldEntry(GuestCrea.class, "name", true).getDefaultTextString();

  public String getName() { return name; }

  public void setName(String v) { name = v; }



  public String getName(String lang) { return name; }
  public String getName(String lang, boolean useDefault) { return name; }
  // ----------------------------------------------------------------------
  // firstname
  // ----------------------------------------------------------------------

  protected  String firstname = channel.getTypeFieldEntry(GuestCrea.class, "firstname", true).getDefaultTextString();

  public String getFirstname() { return firstname; }

  public void setFirstname(String v) { firstname = v; }



  public String getFirstname(String lang) { return firstname; }
  public String getFirstname(String lang, boolean useDefault) { return firstname; }
  // ----------------------------------------------------------------------
  // email
  // ----------------------------------------------------------------------

  protected  String email = channel.getTypeFieldEntry(GuestCrea.class, "email", true).getDefaultTextString();

  public String getEmail() { return email; }

  public void setEmail(String v) { email = v; }



  public String getEmail(String lang) { return email; }
  public String getEmail(String lang, boolean useDefault) { return email; }
  // ----------------------------------------------------------------------
  // organization
  // ----------------------------------------------------------------------

  protected  String organization = channel.getTypeFieldEntry(GuestCrea.class, "organization", true).getDefaultTextString();

  public String getOrganization() { return organization; }

  public void setOrganization(String v) { organization = v; }



  public String getOrganization(String lang) { return organization; }
  public String getOrganization(String lang, boolean useDefault) { return organization; }
  // ----------------------------------------------------------------------
  // language
  // ----------------------------------------------------------------------

  protected  String language = channel.getTypeFieldEntry(GuestCrea.class, "language", true).getDefaultTextString();

  public String getLanguage() { return language; }

  public void setLanguage(String v) { language = v; }



  public String getLanguage(String lang) { return language; }
  public String getLanguage(String lang, boolean useDefault) { return language; }
  // ----------------------------------------------------------------------
  // country
  // ----------------------------------------------------------------------

  protected  String country = channel.getTypeFieldEntry(GuestCrea.class, "country", true).getDefaultTextString();

  public String getCountry() { return country; }

  public void setCountry(String v) { country = v; }



  public String getCountry(String lang) { return country; }
  public String getCountry(String lang, boolean useDefault) { return country; }
  @Override
  public String[] getSearchStrings() {
    StringBuffer sb = new StringBuffer(super.getSearchStrings()[0]);
    sb.ensureCapacity(500 * (2 + 0 + 0 + 0 + 0 + 0) );
    if (name != null) {
      sb.append(name); sb.append(' ');
    }
    if (title != null) {
      sb.append(title); sb.append(' ');
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
    JcmsUtil.addData(set, clazz, getGroups());
    return set;
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

  @Override
public ControllerStatus checkIntegrity() {

    ControllerStatus status = super.checkIntegrity();
    if (status.hasFailed()) {
      return status;
    }

    if (Util.isEmpty(name)) {
      status = new ControllerStatus();
      status.setProp("msg.edit.empty-field", channel.getTypeFieldLabel(this, "name"), null);
      return status;
    }
    if (Util.isEmpty(email)) {
      status = new ControllerStatus();
      status.setProp("msg.edit.empty-field", channel.getTypeFieldLabel(this, "email"), null);
      return status;
    }
    if (!Util.isValidEmail(email)) {
      status = new ControllerStatus();
      status.setProp("msg.edit.bad-email", channel.getTypeFieldLabel(this, "email"));
      return status;
    }
    if (Util.isEmpty(language)) {
      status = new ControllerStatus();
      status.setProp("msg.edit.empty-field", channel.getTypeFieldLabel(this, "language"), null);
      return status;
    }
    if (Util.isEmpty(country)) {
      status = new ControllerStatus();
      status.setProp("msg.edit.empty-field", channel.getTypeFieldLabel(this, "country"), null);
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
    ((GuestCrea)mergeCopy).setName(getName());
    ((GuestCrea)mergeCopy).setFirstname(getFirstname());
    ((GuestCrea)mergeCopy).setEmail(getEmail());
    ((GuestCrea)mergeCopy).setOrganization(getOrganization());
    ((GuestCrea)mergeCopy).setLanguage(getLanguage());
    ((GuestCrea)mergeCopy).setCountry(getCountry());
  }
  @Override
  public void performCreate(Member mbr, Map context) {
    name = Util.truncateVarchar(name);
    firstname = Util.truncateVarchar(firstname);
    organization = Util.truncateVarchar(organization);
    language = Util.truncateVarchar(language);
    country = Util.truncateVarchar(country);
    super.performCreate(mbr, context);
  }

  @Override
  public void performUpdate(Member mbr, Map context) {
    name = Util.truncateVarchar(name);
    firstname = Util.truncateVarchar(firstname);
    organization = Util.truncateVarchar(organization);
    language = Util.truncateVarchar(language);
    country = Util.truncateVarchar(country);
    super.performUpdate(mbr, context);
  }
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// 9o3M70fHiNbxK6h5GFiw0Q==
