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
public  class MemberEducation extends com.jalios.jcmsplugin.esn.AbstractMemberInfo 
             implements 
                com.jalios.jstore.Searchable
               , DBData
{
  
  // ----------------------------------------------------------------------
  // CONSTRUCTORS
  // ----------------------------------------------------------------------  
  public MemberEducation() {}
 
 
 
  
  
  
  public MemberEducation(MemberEducation other) {
    super(other);
    trainingCenter = other.trainingCenter;
    degree = other.degree;
    description = other.description;
    place = other.place;
    site = other.site;
    startDate = other.startDate;
    endDate = other.endDate;
  }
  
  // ----------------------------------------------------------------------
  // Import / Export
  // ----------------------------------------------------------------------
  public void importXml(org.jdom.Element elt, ImportOptions options) {
    super.importXml(elt, options);
    
    setTrainingCenter(ImportUtil.parseFieldText(elt, "trainingCenter"));
    setDegree(ImportUtil.parseFieldText(elt, "degree"));
    setPlace(ImportUtil.parseFieldText(elt, "place"));
    setSite(ImportUtil.parseFieldText(elt, "site"));
    setStartDate(ImportUtil.parseFieldDate(elt, "startDate"));
    setEndDate(ImportUtil.parseFieldDate(elt, "endDate"));
  }
  
  protected void importXmlFieldsWithReferences(org.jdom.Element elt, ImportOptions options) {
    super.importXmlFieldsWithReferences(elt, options);
      
    if (options.isSelfImport()) {
      setDescription(ImportUtil.parseFieldText(elt, "description"));
    } else {
    
    setDescription(ImportUtil.parseFieldWiki(elt, "description"));
    }
  }
  
  public void exportXmlField(StringBuffer sb, int indentLevel) {
    super.exportXmlField(sb, indentLevel);
    sb.append(ExportUtil.exportField(indentLevel, "trainingCenter", getTrainingCenter(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "degree", getDegree(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "description", getDescription(), true, true));
    sb.append(ExportUtil.exportField(indentLevel, "place", getPlace(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "site", getSite(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "startDate", getStartDate()));
    sb.append(ExportUtil.exportField(indentLevel, "endDate", getEndDate()));
  }
  
  public Set<FileDocument> getDocumentLinkSet() {
    Set<FileDocument> docSet = super.getDocumentLinkSet();
    return docSet;
  }
  
  // ----------------------------------------------------------------------
  // TYPE AND FIELD INFOS (static methods)
  // ----------------------------------------------------------------------  
  /**
   * Returns the TypeEntry bound to <code>MemberEducation</code>. <br>
   * @see com.jalios.jcms.Channel#getTypeEntry(Class)
   * @since jcms-5.5
   */
  public static TypeEntry getTypeEntry() {
    return channel.getTypeEntry(MemberEducation.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>MemberEducation</code>. <br>
   * This array <strong>does not</strong> contain inherited TypeFieldEntry from super classes of <code>MemberEducation</code>. <br/>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>MemberEducation</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getTypeFieldEntries() {
    return channel.getTypeFieldEntries(MemberEducation.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>MemberEducation</code>. <br>
   * This array <strong>does</strong> contain inherited TypeFieldEntry from super classes of <code>MemberEducation</code>. <br>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>MemberEducation</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getAllTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getAllTypeFieldEntries() {
    return channel.getAllTypeFieldEntries(MemberEducation.class);
  }
  // ----------------------------------------------------------------------
  // FIELDs VALUE
  // ----------------------------------------------------------------------  
  /**
   * Gets the value of the given <code>int</code> field name for the current <code>MemberEducation</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public int getIntFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getIntFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>int</code> field name for the current <code>MemberEducation</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setIntFieldValue(String fieldName, int value) throws NoSuchFieldException {
    super.setIntFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>long</code> field name for the current <code>MemberEducation</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public long getLongFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getLongFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>long</code> field name for the current <code>MemberEducation</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setLongFieldValue(String fieldName, long value) throws NoSuchFieldException {
    super.setLongFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>double</code> field name for the current <code>MemberEducation</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public double getDoubleFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getDoubleFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>double</code> field name for the current <code>MemberEducation</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setDoubleFieldValue(String fieldName, double value) throws NoSuchFieldException {
     super.setDoubleFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>boolean</code> field name for the current <code>MemberEducation</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public boolean getBooleanFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getBooleanFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>boolean</code> field name for the current <code>MemberEducation</code>.
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
   * Gets the <code>Object</code> value of the given field name for this <code>MemberEducation</code>. <br>
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
    if ("trainingCenter".equals(fieldName)) { return getTrainingCenter(); }
    if ("degree".equals(fieldName)) { return getDegree(); }
    if ("description".equals(fieldName)) { return getDescription(); }
    if ("place".equals(fieldName)) { return getPlace(); }
    if ("site".equals(fieldName)) { return getSite(); }
    if ("startDate".equals(fieldName)) { return getStartDate(); }
    if ("endDate".equals(fieldName)) { return getEndDate(); }
    return super.getFieldValue(fieldName, lang, useDefault);
  }
  
  /**
   * Sets the <code>Object</code> value of the given field name for this <code>MemberEducation</code>. <br>
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
    if ("trainingCenter".equals(fieldName)) { setTrainingCenter((String)value); return; }
    if ("degree".equals(fieldName)) { setDegree((String)value); return; }
    if ("description".equals(fieldName)) { setDescription((String)value); return; }
    if ("place".equals(fieldName)) { setPlace((String)value); return; }
    if ("site".equals(fieldName)) { setSite((String)value); return; }
    if ("startDate".equals(fieldName)) { setStartDate((java.util.Date)value); return; }
    if ("endDate".equals(fieldName)) { setEndDate((java.util.Date)value); return; }
    super.setFieldValue(fieldName, value, lang);
  }
  
  // ----------------------------------------------------------------------
  // trainingCenter
  // ----------------------------------------------------------------------  
  
  protected  String trainingCenter = channel.getTypeFieldEntry(MemberEducation.class, "trainingCenter", true).getDefaultTextString();
  
  public String getTrainingCenter() { return trainingCenter; }
  
  public void setTrainingCenter(String v) { trainingCenter = v; }
  
  
  
  public String getTrainingCenter(String lang) { return trainingCenter; }
  public String getTrainingCenter(String lang, boolean useDefault) { return trainingCenter; }
  // ----------------------------------------------------------------------
  // degree
  // ----------------------------------------------------------------------  
  
  protected  String degree = channel.getTypeFieldEntry(MemberEducation.class, "degree", true).getDefaultTextString();
  
  public String getDegree() { return degree; }
  
  public void setDegree(String v) { degree = v; }
  
  
  
  public String getDegree(String lang) { return degree; }
  public String getDegree(String lang, boolean useDefault) { return degree; }
  // ----------------------------------------------------------------------
  // description
  // ----------------------------------------------------------------------  
  
  protected  String description = channel.getTypeFieldEntry(MemberEducation.class, "description", true).getDefaultTextString();
  
  public String getDescription() { return description; }
  
  public void setDescription(String v) { description = v; }
  
  
  
  public String getDescription(String lang) { return description; }
  public String getDescription(String lang, boolean useDefault) { return description; }
  // ----------------------------------------------------------------------
  // place
  // ----------------------------------------------------------------------  
  
  protected  String place = channel.getTypeFieldEntry(MemberEducation.class, "place", true).getDefaultTextString();
  
  public String getPlace() { return place; }
  
  public void setPlace(String v) { place = v; }
  
  
  
  public String getPlace(String lang) { return place; }
  public String getPlace(String lang, boolean useDefault) { return place; }
  // ----------------------------------------------------------------------
  // site
  // ----------------------------------------------------------------------  
  
  protected  String site = channel.getTypeFieldEntry(MemberEducation.class, "site", true).getDefaultTextString();
  
  public String getSite() { return site; }
  
  public void setSite(String v) { site = v; }
  
  
  
  public String getSite(String lang) { return site; }
  public String getSite(String lang, boolean useDefault) { return site; }
  // ----------------------------------------------------------------------
  // startDate
  // ----------------------------------------------------------------------  
  
  protected  java.util.Date startDate;
  
  public java.util.Date getStartDate() { return startDate; }
  
  public void setStartDate(java.util.Date v) { startDate = v; }
  
  
  
  // ----------------------------------------------------------------------
  // endDate
  // ----------------------------------------------------------------------  
  
  protected  java.util.Date endDate;
  
  public java.util.Date getEndDate() { return endDate; }
  
  public void setEndDate(java.util.Date v) { endDate = v; }
  
  
  
   
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
    sb.ensureCapacity(500 * (5 + 0 + 0 + 0 + 0 + 0) );
    if (degree != null) {
      sb.append(degree); sb.append(' ');
    }
    if (description != null) {
      sb.append(description); sb.append(' ');
    }
    if (place != null) {
      sb.append(place); sb.append(' ');
    }
    if (title != null) {
      sb.append(title); sb.append(' ');
    }
    if (trainingCenter != null) {
      sb.append(trainingCenter); sb.append(' ');
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
    return set;
  }
  // ----------------------------------------------------------------------
  // DataController
  // ----------------------------------------------------------------------  
  static Pattern _sitePattern;
  static {
    try {
      _sitePattern = (new Perl5Compiler()).compile("^((http)|(https)|(ftp)|(mailto)):.*", Perl5Compiler.CASE_INSENSITIVE_MASK);
    }
    catch(org.apache.oro.text.regex.MalformedPatternException ex) {
      // Empty
    }
  }
  
  public boolean checkPatternSite() {
    if (Util.notEmpty(site) && !(new Perl5Matcher()).matches(site, _sitePattern)) {
      return false; 
    }
    return true;
  }
  
  public ControllerStatus checkIntegrity() {
    
    ControllerStatus status = super.checkIntegrity();
    if (status.hasFailed()) {
      return status;
    }
    
    if (Util.isEmpty(trainingCenter)) {
      status = new ControllerStatus();
      status.setProp("msg.edit.empty-field", channel.getTypeFieldLabel(this, "trainingCenter"), null);
      return status;
    }
    if (!Util.isValidUrl(site)) {
      status = new ControllerStatus();
      status.setProp("msg.edit.bad-url", channel.getTypeFieldLabel(this, "site"));
      return status;
    }
    if (getStartDate() == null) {
      status = new ControllerStatus();
      status.setProp("msg.edit.empty-field", channel.getTypeFieldLabel(this, "startDate"));
      return status;
    }
    return ControllerStatus.OK;
  }
  
  public Set<String> getExternalLinkSet() {
    Set<String> set = super.getExternalLinkSet();
   
    if (Util.notEmpty(site)) {
      set.add(site);
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
  protected void prepareMergeCopy(Publication mergeCopy) {
    super.prepareMergeCopy(mergeCopy);  
    ((MemberEducation)mergeCopy).setTrainingCenter(getTrainingCenter());
    ((MemberEducation)mergeCopy).setDegree(getDegree());
    ((MemberEducation)mergeCopy).setDescription(getDescription());
    ((MemberEducation)mergeCopy).setPlace(getPlace());
    ((MemberEducation)mergeCopy).setSite(getSite());
    ((MemberEducation)mergeCopy).setStartDate(getStartDate());
    ((MemberEducation)mergeCopy).setEndDate(getEndDate());
  }
  @Override 
  public void performCreate(Member mbr, Map context) {
    trainingCenter = Util.truncateVarchar(trainingCenter);
    degree = Util.truncateVarchar(degree);
    place = Util.truncateVarchar(place);
    super.performCreate(mbr, context);
  }
  
  @Override 
  public void performUpdate(Member mbr, Map context) {
    trainingCenter = Util.truncateVarchar(trainingCenter);
    degree = Util.truncateVarchar(degree);
    place = Util.truncateVarchar(place);
    super.performUpdate(mbr, context);
  }
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// Ojm9gZbnEV7YnxFvOtShWQ==
