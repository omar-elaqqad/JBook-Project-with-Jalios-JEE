// This file has been automatically generated.

package generated;

import java.util.Map;
import java.util.Set;
import java.util.SortedSet;
import java.util.TreeSet;

import org.apache.oro.text.regex.Pattern;
import org.apache.oro.text.regex.Perl5Compiler;
import org.apache.oro.text.regex.Perl5Matcher;

import com.jalios.jcms.Category;
import com.jalios.jcms.ControllerStatus;
import com.jalios.jcms.Data;
import com.jalios.jcms.EnumerateFormReport;
import com.jalios.jcms.FileDocument;
import com.jalios.jcms.Member;
import com.jalios.jcms.Publication;
import com.jalios.jcms.TypeEntry;
import com.jalios.jcms.TypeFieldEntry;
import com.jalios.jcms.mashup.ExportUtil;
import com.jalios.jcms.mashup.ImportOptions;
import com.jalios.jcms.mashup.ImportUtil;
import com.jalios.util.ObjectIntTreeMap;
import com.jalios.util.Util;

@SuppressWarnings({"unchecked", "unused"})
public  class SignUp extends com.jalios.jcms.Form
             implements
                com.jalios.jstore.Searchable
{

  // ----------------------------------------------------------------------
  // CONSTRUCTORS
  // ----------------------------------------------------------------------
  public SignUp() {}






  public SignUp(SignUp other) {
    super(other);
    name = other.name;
    firstName = other.firstName;
    email = other.email;
    salutation = other.salutation;
    jobTitle = other.jobTitle;
    favoriteLogin = other.favoriteLogin;
    message = other.message;
  }

  // ----------------------------------------------------------------------
  // Import / Export
  // ----------------------------------------------------------------------
  @Override
public void importXml(org.jdom.Element elt, ImportOptions options) {
    super.importXml(elt, options);

    setName(ImportUtil.parseFieldText(elt, "name"));
    setFirstName(ImportUtil.parseFieldText(elt, "firstName"));
    setEmail(ImportUtil.parseFieldText(elt, "email"));
    setSalutation(ImportUtil.parseFieldText(elt, "salutation"));
    setJobTitle(ImportUtil.parseFieldText(elt, "jobTitle"));
    setFavoriteLogin(ImportUtil.parseFieldText(elt, "favoriteLogin"));
    setMessage(ImportUtil.parseFieldText(elt, "message"));
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
    sb.append(ExportUtil.exportField(indentLevel, "firstName", getFirstName(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "email", getEmail(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "salutation", getSalutation(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "jobTitle", getJobTitle(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "favoriteLogin", getFavoriteLogin(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "message", getMessage(), false, true));
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
   * Returns the TypeEntry bound to <code>SignUp</code>. <br>
   * @see com.jalios.jcms.Channel#getTypeEntry(Class)
   * @since jcms-5.5
   */
  public static TypeEntry getTypeEntry() {
    return channel.getTypeEntry(SignUp.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>SignUp</code>. <br>
   * This array <strong>does not</strong> contain inherited TypeFieldEntry from super classes of <code>SignUp</code>. <br/>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>SignUp</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getTypeFieldEntries() {
    return channel.getTypeFieldEntries(SignUp.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>SignUp</code>. <br>
   * This array <strong>does</strong> contain inherited TypeFieldEntry from super classes of <code>SignUp</code>. <br>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>SignUp</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getAllTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getAllTypeFieldEntries() {
    return channel.getAllTypeFieldEntries(SignUp.class);
  }
  // ----------------------------------------------------------------------
  // FIELDs VALUE
  // ----------------------------------------------------------------------
  /**
   * Gets the value of the given <code>int</code> field name for the current <code>SignUp</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public int getIntFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getIntFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>int</code> field name for the current <code>SignUp</code>.
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
   * Gets the value of the given <code>long</code> field name for the current <code>SignUp</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public long getLongFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getLongFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>long</code> field name for the current <code>SignUp</code>.
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
   * Gets the value of the given <code>double</code> field name for the current <code>SignUp</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public double getDoubleFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getDoubleFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>double</code> field name for the current <code>SignUp</code>.
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
   * Gets the value of the given <code>boolean</code> field name for the current <code>SignUp</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public boolean getBooleanFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getBooleanFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>boolean</code> field name for the current <code>SignUp</code>.
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
   * Gets the <code>Object</code> value of the given field name for this <code>SignUp</code>. <br>
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
    if ("firstName".equals(fieldName)) { return getFirstName(); }
    if ("email".equals(fieldName)) { return getEmail(); }
    if ("salutation".equals(fieldName)) { return getSalutation(); }
    if ("jobTitle".equals(fieldName)) { return getJobTitle(); }
    if ("favoriteLogin".equals(fieldName)) { return getFavoriteLogin(); }
    if ("message".equals(fieldName)) { return getMessage(); }
    return super.getFieldValue(fieldName, lang, useDefault);
  }

  /**
   * Sets the <code>Object</code> value of the given field name for this <code>SignUp</code>. <br>
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
    if ("firstName".equals(fieldName)) { setFirstName((String)value); return; }
    if ("email".equals(fieldName)) { setEmail((String)value); return; }
    if ("salutation".equals(fieldName)) { setSalutation((String)value); return; }
    if ("jobTitle".equals(fieldName)) { setJobTitle((String)value); return; }
    if ("favoriteLogin".equals(fieldName)) { setFavoriteLogin((String)value); return; }
    if ("message".equals(fieldName)) { setMessage((String)value); return; }
    super.setFieldValue(fieldName, value, lang);
  }

  // ----------------------------------------------------------------------
  // name
  // ----------------------------------------------------------------------

  protected  String name = channel.getTypeFieldEntry(SignUp.class, "name", true).getDefaultTextString();

  public String getName() { return name; }

  public void setName(String v) { name = v; }



  public String getName(String lang) { return name; }
  public String getName(String lang, boolean useDefault) { return name; }
  // ----------------------------------------------------------------------
  // firstName
  // ----------------------------------------------------------------------

  protected  String firstName = channel.getTypeFieldEntry(SignUp.class, "firstName", true).getDefaultTextString();

  public String getFirstName() { return firstName; }

  public void setFirstName(String v) { firstName = v; }



  public String getFirstName(String lang) { return firstName; }
  public String getFirstName(String lang, boolean useDefault) { return firstName; }
  // ----------------------------------------------------------------------
  // email
  // ----------------------------------------------------------------------

  protected  String email = channel.getTypeFieldEntry(SignUp.class, "email", true).getDefaultTextString();

  public String getEmail() { return email; }

  public void setEmail(String v) { email = v; }



  public String getEmail(String lang) { return email; }
  public String getEmail(String lang, boolean useDefault) { return email; }
  // ----------------------------------------------------------------------
  // salutation
  // ----------------------------------------------------------------------

  protected  String salutation = channel.getTypeFieldEntry(SignUp.class, "salutation", true).getDefaultTextString();

  public String getSalutation() { return salutation; }

  public void setSalutation(String v) { salutation = v; }



  public String getSalutation(String lang) { return salutation; }
  public String getSalutation(String lang, boolean useDefault) { return salutation; }
  private static String[] salutationValues;
  private static String[] salutationLabels;
  private static Map<String, String[]> salutationLabelsMap;

  public static String[] getSalutationValues() {
    if(salutationValues == null) {
      setSalutationValues(channel.getTypeFieldEntry(SignUp.class, "salutation", true).getEnumerateValues());
    }
    return salutationValues;
  }
  public static void setSalutationValues(String[] values) {
    salutationValues = values;
  }
  public static String[] getSalutationLabels() {
    if(salutationLabels == null) {
      setSalutationLabels(channel.getTypeFieldEntry(SignUp.class, "salutation", true).getEnumerateLabels());
    }
    return salutationLabels;
  }
  public static void setSalutationLabels(String[] labels) {
    salutationLabels = labels;
  }
  public static Map<String, String[]> getSalutationLabelsMap() {
    if(salutationLabelsMap == null) {
      setSalutationLabelsMap(channel.getTypeFieldEntry(SignUp.class, "salutation", true).getEnumerateLabelsMap());
    }
    return salutationLabelsMap;
  }
  public static void setSalutationLabelsMap(Map<String, String[]> LabelsMap) {
    salutationLabelsMap = LabelsMap;
  }
  public static String[] getSalutationLabels(String userLang) {
    Map<String, String[]> salutationLabelMap = getSalutationLabelsMap();
    String[] labels = salutationLabelMap.get(userLang);
    if (labels == null) {
      labels = salutationLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getSalutationLabel(String value, String userLang) {
    String[] labels = getSalutationLabels(userLang);
    int i = 0;
    if (false) {
    }
    else if (value.equals("miss")) {
      i = 0;
    }
    else if (value.equals("mr")) {
      i = 1;
    }
    else if (value.equals("mrs")) {
      i = 2;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return getSalutationLabel(value, channel.getLanguage());
  }

  public static String getSalutationLabel(String value) {
    String[] salutationLabels = getSalutationLabels();
    if (false) {
    }
    else if (value.equals("miss")) {
      return salutationLabels[0];
    }
    else if (value.equals("mr")) {
      return salutationLabels[1];
    }
    else if (value.equals("mrs")) {
      return salutationLabels[2];
    }
    return "???";
  }
  public static EnumerateFormReport getSalutationReport(SortedSet<SignUp> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (SignUp obj : set) {
      if (obj == null) {
        continue;
      }

      map.inc("" + obj.getSalutation());

      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }
  // ----------------------------------------------------------------------
  // jobTitle
  // ----------------------------------------------------------------------

  protected  String jobTitle = channel.getTypeFieldEntry(SignUp.class, "jobTitle", true).getDefaultTextString();

  public String getJobTitle() { return jobTitle; }

  public void setJobTitle(String v) { jobTitle = v; }



  public String getJobTitle(String lang) { return jobTitle; }
  public String getJobTitle(String lang, boolean useDefault) { return jobTitle; }
  // ----------------------------------------------------------------------
  // favoriteLogin
  // ----------------------------------------------------------------------

  protected  String favoriteLogin = channel.getTypeFieldEntry(SignUp.class, "favoriteLogin", true).getDefaultTextString();

  public String getFavoriteLogin() { return favoriteLogin; }

  public void setFavoriteLogin(String v) { favoriteLogin = v; }



  public String getFavoriteLogin(String lang) { return favoriteLogin; }
  public String getFavoriteLogin(String lang, boolean useDefault) { return favoriteLogin; }
  // ----------------------------------------------------------------------
  // message
  // ----------------------------------------------------------------------

  protected  String message = channel.getTypeFieldEntry(SignUp.class, "message", true).getDefaultTextString();

  public String getMessage() { return message; }

  public void setMessage(String v) { message = v; }



  public String getMessage(String lang) { return message; }
  public String getMessage(String lang, boolean useDefault) { return message; }
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
    return set;
  }
  // ----------------------------------------------------------------------
  // DataController
  // ----------------------------------------------------------------------
  static Pattern _emailPattern;
  static {
    try {
      _emailPattern = (new Perl5Compiler()).compile("([-+0-9a-zA-Z_\\.]+@[-0-9a-zA-Z_\\.]+)?", Perl5Compiler.CASE_INSENSITIVE_MASK);
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
    if (Util.isEmpty(firstName)) {
      status = new ControllerStatus();
      status.setProp("msg.edit.empty-field", channel.getTypeFieldLabel(this, "firstName"), null);
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
    if (Util.isEmpty(favoriteLogin)) {
      status = new ControllerStatus();
      status.setProp("msg.edit.empty-field", channel.getTypeFieldLabel(this, "favoriteLogin"), null);
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
    ((SignUp)mergeCopy).setName(getName());
    ((SignUp)mergeCopy).setFirstName(getFirstName());
    ((SignUp)mergeCopy).setEmail(getEmail());
    ((SignUp)mergeCopy).setSalutation(getSalutation());
    ((SignUp)mergeCopy).setJobTitle(getJobTitle());
    ((SignUp)mergeCopy).setFavoriteLogin(getFavoriteLogin());
    ((SignUp)mergeCopy).setMessage(getMessage());
  }
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// r3aXKKW91Fzfg36g8/Y9nQ==
