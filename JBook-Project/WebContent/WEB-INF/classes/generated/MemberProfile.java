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
public  class MemberProfile extends com.jalios.jcmsplugin.esn.AbstractMemberInfo 
             implements 
                com.jalios.jstore.Searchable
               , DBData
{
  
  // ----------------------------------------------------------------------
  // CONSTRUCTORS
  // ----------------------------------------------------------------------  
  public MemberProfile() {}
 
 
 
  
  
  
  public MemberProfile(MemberProfile other) {
    super(other);
    introduction = other.introduction;
    interest = other.interest;
    dateOfBirth = other.dateOfBirth;
    dateOfArrival = other.dateOfArrival;
  }
  
  // ----------------------------------------------------------------------
  // Import / Export
  // ----------------------------------------------------------------------
  public void importXml(org.jdom.Element elt, ImportOptions options) {
    super.importXml(elt, options);
    
    setInterest(ImportUtil.parseFieldTextList(elt, "interest"));
    setDateOfBirth(ImportUtil.parseFieldDate(elt, "dateOfBirth"));
    setDateOfArrival(ImportUtil.parseFieldDate(elt, "dateOfArrival"));
  }
  
  protected void importXmlFieldsWithReferences(org.jdom.Element elt, ImportOptions options) {
    super.importXmlFieldsWithReferences(elt, options);
      
    if (options.isSelfImport()) {
      setIntroduction(ImportUtil.parseFieldText(elt, "introduction"));
    } else {
    
    setIntroduction(ImportUtil.parseFieldWiki(elt, "introduction"));
    }
  }
  
  public void exportXmlField(StringBuffer sb, int indentLevel) {
    super.exportXmlField(sb, indentLevel);
    sb.append(ExportUtil.exportField(indentLevel, "introduction", getIntroduction(), true, true));
    sb.append(ExportUtil.exportField(indentLevel, "interest", getInterest()));
    sb.append(ExportUtil.exportField(indentLevel, "dateOfBirth", getDateOfBirth()));
    sb.append(ExportUtil.exportField(indentLevel, "dateOfArrival", getDateOfArrival()));
  }
  
  public Set<FileDocument> getDocumentLinkSet() {
    Set<FileDocument> docSet = super.getDocumentLinkSet();
    return docSet;
  }
  
  // ----------------------------------------------------------------------
  // TYPE AND FIELD INFOS (static methods)
  // ----------------------------------------------------------------------  
  /**
   * Returns the TypeEntry bound to <code>MemberProfile</code>. <br>
   * @see com.jalios.jcms.Channel#getTypeEntry(Class)
   * @since jcms-5.5
   */
  public static TypeEntry getTypeEntry() {
    return channel.getTypeEntry(MemberProfile.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>MemberProfile</code>. <br>
   * This array <strong>does not</strong> contain inherited TypeFieldEntry from super classes of <code>MemberProfile</code>. <br/>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>MemberProfile</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getTypeFieldEntries() {
    return channel.getTypeFieldEntries(MemberProfile.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>MemberProfile</code>. <br>
   * This array <strong>does</strong> contain inherited TypeFieldEntry from super classes of <code>MemberProfile</code>. <br>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>MemberProfile</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getAllTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getAllTypeFieldEntries() {
    return channel.getAllTypeFieldEntries(MemberProfile.class);
  }
  // ----------------------------------------------------------------------
  // FIELDs VALUE
  // ----------------------------------------------------------------------  
  /**
   * Gets the value of the given <code>int</code> field name for the current <code>MemberProfile</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public int getIntFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getIntFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>int</code> field name for the current <code>MemberProfile</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setIntFieldValue(String fieldName, int value) throws NoSuchFieldException {
    super.setIntFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>long</code> field name for the current <code>MemberProfile</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public long getLongFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getLongFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>long</code> field name for the current <code>MemberProfile</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setLongFieldValue(String fieldName, long value) throws NoSuchFieldException {
    super.setLongFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>double</code> field name for the current <code>MemberProfile</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public double getDoubleFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getDoubleFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>double</code> field name for the current <code>MemberProfile</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setDoubleFieldValue(String fieldName, double value) throws NoSuchFieldException {
     super.setDoubleFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>boolean</code> field name for the current <code>MemberProfile</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public boolean getBooleanFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getBooleanFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>boolean</code> field name for the current <code>MemberProfile</code>.
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
   * Gets the <code>Object</code> value of the given field name for this <code>MemberProfile</code>. <br>
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
    if ("introduction".equals(fieldName)) { return getIntroduction(); }
    if ("interest".equals(fieldName)) { return getInterest(); }
    if ("dateOfBirth".equals(fieldName)) { return getDateOfBirth(); }
    if ("dateOfArrival".equals(fieldName)) { return getDateOfArrival(); }
    return super.getFieldValue(fieldName, lang, useDefault);
  }
  
  /**
   * Sets the <code>Object</code> value of the given field name for this <code>MemberProfile</code>. <br>
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
    if ("introduction".equals(fieldName)) { setIntroduction((String)value); return; }
    if ("interest".equals(fieldName)) { setInterest((List<String>)value); return; }
    if ("dateOfBirth".equals(fieldName)) { setDateOfBirth((java.util.Date)value); return; }
    if ("dateOfArrival".equals(fieldName)) { setDateOfArrival((java.util.Date)value); return; }
    super.setFieldValue(fieldName, value, lang);
  }
  
  // ----------------------------------------------------------------------
  // introduction
  // ----------------------------------------------------------------------  
  
  protected  String introduction = channel.getTypeFieldEntry(MemberProfile.class, "introduction", true).getDefaultTextString();
  
  public String getIntroduction() { return introduction; }
  
  public void setIntroduction(String v) { introduction = v; }
  
  
  
  public String getIntroduction(String lang) { return introduction; }
  public String getIntroduction(String lang, boolean useDefault) { return introduction; }
  // ----------------------------------------------------------------------
  // interest
  // ----------------------------------------------------------------------  
  
  protected  List<String> interest = new ArrayList<String>();
  
  public List<String> getInterest() { return interest; }
  
  public void setInterest(List<String> v) { 
    interest = HibernateUtil.updateCollection(interest, v, false);
  }
  
  
  
  public List<String> getInterest(String lang) { return interest; }
  public List<String> getInterest(String lang, boolean useDefault) { return interest; }
  // ----------------------------------------------------------------------
  // dateOfBirth
  // ----------------------------------------------------------------------  
  
  protected  java.util.Date dateOfBirth;
  
  public java.util.Date getDateOfBirth() { return dateOfBirth; }
  
  public void setDateOfBirth(java.util.Date v) { dateOfBirth = v; }
  
  
  
  // ----------------------------------------------------------------------
  // dateOfArrival
  // ----------------------------------------------------------------------  
  
  protected  java.util.Date dateOfArrival;
  
  public java.util.Date getDateOfArrival() { return dateOfArrival; }
  
  public void setDateOfArrival(java.util.Date v) { dateOfArrival = v; }
  
  
  
   
  // ----------------------------------------------------------------------
  // abstract
  // ----------------------------------------------------------------------  
  @Override
  public void setAbstract(String lang, String value) { setIntroduction(value); }
  @Override
  public String getAbstract() { return introduction; }
  @Override
  public String getAbstract(String lang, boolean useDefault) { return getIntroduction(lang, useDefault); }
  @Override
  public String[] getSearchStrings() {
    StringBuffer sb = new StringBuffer(super.getSearchStrings()[0]);
    sb.ensureCapacity(500 * (1 + 0 + 0 + 0 + 1 + 0) );
    if (introduction != null) {
      sb.append(introduction); sb.append(' ');
    }
    if (interest != null) {
      for (String str : interest) {
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
    sb.ensureCapacity(500 * (1 + 0 + 0 + 0 + 0 + 0) );
    if (introduction != null && !JHTMLUtils.isJHTML(null, introduction)) {
      sb.append(introduction); sb.append(' ');
    }
    return sb.toString();
  }
  
  @Override
  public String getAllWysiwygText() {
    StringBuffer sb = new StringBuffer(super.getAllWysiwygText());
    sb.ensureCapacity(500 * (0 + 0 + 0 + 0 + 0 + 0) );
    // Wiki fields containing JHTML
    if (introduction != null && JHTMLUtils.isJHTML(null, introduction)) {
      sb.append(introduction); sb.append(' ');
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
    
    return ControllerStatus.OK;
  }
  
  // ----------------------------------------------------------------------
  // initializeDBDataCollections
  // ----------------------------------------------------------------------  
  @Override
  public void initializeDBDataCollections() { 
    super.initializeDBDataCollections();
    Hibernate.initialize(interest);
  }
  
  // ----------------------------------------------------------------------
  // cloneDBDataCollections
  // ----------------------------------------------------------------------  
  @Override
  public void cloneDBDataCollections() { 
    super.cloneDBDataCollections();
    if (interest != null) { interest = new ArrayList<>(interest); }
  
  }
  
  // ----------------------------------------------------------------------
  // WorkCopy
  // ----------------------------------------------------------------------  
  protected void prepareMergeCopy(Publication mergeCopy) {
    super.prepareMergeCopy(mergeCopy);  
    ((MemberProfile)mergeCopy).setIntroduction(getIntroduction());
    ((MemberProfile)mergeCopy).setInterest(getInterest());
    ((MemberProfile)mergeCopy).setDateOfBirth(getDateOfBirth());
    ((MemberProfile)mergeCopy).setDateOfArrival(getDateOfArrival());
  }
  @Override 
  public void performCreate(Member mbr, Map context) {
    interest = Util.truncateVarchar(interest);
    super.performCreate(mbr, context);
  }
  
  @Override 
  public void performUpdate(Member mbr, Map context) {
    interest = Util.truncateVarchar(interest);
    super.performUpdate(mbr, context);
  }
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// bbk9Rjz4myY3AFFiLEqBGA==
