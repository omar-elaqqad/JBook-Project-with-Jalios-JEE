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
public  class SmartPhonePortal extends com.jalios.jcmsplugin.smartphone.portal.AbstractSmartPhonePortal 
             implements 
                com.jalios.jstore.Searchable
{
  
  // ----------------------------------------------------------------------
  // CONSTRUCTORS
  // ----------------------------------------------------------------------  
  public SmartPhonePortal() {}
 
 
 
  
  
  
  public SmartPhonePortal(SmartPhonePortal other) {
    super(other);
    description = other.description;
    descriptionML = other.descriptionML;
    structure = other.structure;
    portlets = other.portlets;
    displayScrollToTop = other.displayScrollToTop;
    pageTitle = other.pageTitle;
    pageTitleML = other.pageTitleML;
    image = other.image;
    css = other.css;
  }
  
  // ----------------------------------------------------------------------
  // Import / Export
  // ----------------------------------------------------------------------
  public void importXml(org.jdom.Element elt, ImportOptions options) {
    super.importXml(elt, options);
    
    setStructure(ImportUtil.parseFieldText(elt, "structure"));
    setDisplayScrollToTop(ImportUtil.parseFieldBoolean(elt, "displayScrollToTop"));
    setPageTitle(ImportUtil.parseFieldText(elt, "pageTitle"));
    setPageTitleML(ImportUtil.parseFieldTextML(elt, "pageTitleML"));
    setImage(ImportUtil.parseFieldText(elt, "image"));
    setCss(ImportUtil.parseFieldText(elt, "css"));
  }
  
  protected void importXmlFieldsWithReferences(org.jdom.Element elt, ImportOptions options) {
    super.importXmlFieldsWithReferences(elt, options);
      
    if (options.isSelfImport()) {
      setDescription(ImportUtil.parseFieldText(elt, "description"));
      setDescriptionML(ImportUtil.parseFieldTextML(elt, "descriptionML"));
      setPortlets(ImportUtil.parseSelfFieldDataArray(elt, "portlets", com.jalios.jcms.portlet.PortalElement.class));
    } else {
    
    setDescriptionML(ImportUtil.parseFieldWysiwygML(elt, "descriptionML"));
    setDescription(ImportUtil.parseFieldWysiwyg(elt, "description"));
    }
  }
  
  public void exportXmlField(StringBuffer sb, int indentLevel) {
    super.exportXmlField(sb, indentLevel);
    sb.append(ExportUtil.exportField(indentLevel, "description", getDescription(), "descriptionML", true, false));
    sb.append(ExportUtil.exportField(indentLevel, "descriptionML", getDescriptionML(), false));
    sb.append(ExportUtil.exportField(indentLevel, "structure", getStructure(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "portlets", getPortlets()));
    sb.append(ExportUtil.exportField(indentLevel, "displayScrollToTop", getDisplayScrollToTop()));
    sb.append(ExportUtil.exportField(indentLevel, "pageTitle", getPageTitle(), "pageTitleML", false, true));
    sb.append(ExportUtil.exportField(indentLevel, "pageTitleML", getPageTitleML(), true));
    sb.append(ExportUtil.exportField(indentLevel, "image", getImage(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "css", getCss(), false, true));
  }
  
  public Set<FileDocument> getDocumentLinkSet() {
    Set<FileDocument> docSet = super.getDocumentLinkSet();
    return docSet;
  }
  
  // ----------------------------------------------------------------------
  // TYPE AND FIELD INFOS (static methods)
  // ----------------------------------------------------------------------  
  /**
   * Returns the TypeEntry bound to <code>SmartPhonePortal</code>. <br>
   * @see com.jalios.jcms.Channel#getTypeEntry(Class)
   * @since jcms-5.5
   */
  public static TypeEntry getTypeEntry() {
    return channel.getTypeEntry(SmartPhonePortal.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>SmartPhonePortal</code>. <br>
   * This array <strong>does not</strong> contain inherited TypeFieldEntry from super classes of <code>SmartPhonePortal</code>. <br/>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>SmartPhonePortal</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getTypeFieldEntries() {
    return channel.getTypeFieldEntries(SmartPhonePortal.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>SmartPhonePortal</code>. <br>
   * This array <strong>does</strong> contain inherited TypeFieldEntry from super classes of <code>SmartPhonePortal</code>. <br>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>SmartPhonePortal</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getAllTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getAllTypeFieldEntries() {
    return channel.getAllTypeFieldEntries(SmartPhonePortal.class);
  }
  // ----------------------------------------------------------------------
  // FIELDs VALUE
  // ----------------------------------------------------------------------  
  /**
   * Gets the value of the given <code>int</code> field name for the current <code>SmartPhonePortal</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public int getIntFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getIntFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>int</code> field name for the current <code>SmartPhonePortal</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setIntFieldValue(String fieldName, int value) throws NoSuchFieldException {
    super.setIntFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>long</code> field name for the current <code>SmartPhonePortal</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public long getLongFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getLongFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>long</code> field name for the current <code>SmartPhonePortal</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setLongFieldValue(String fieldName, long value) throws NoSuchFieldException {
    super.setLongFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>double</code> field name for the current <code>SmartPhonePortal</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public double getDoubleFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getDoubleFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>double</code> field name for the current <code>SmartPhonePortal</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setDoubleFieldValue(String fieldName, double value) throws NoSuchFieldException {
     super.setDoubleFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>boolean</code> field name for the current <code>SmartPhonePortal</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public boolean getBooleanFieldValue(String fieldName) throws NoSuchFieldException {
    if ("displayScrollToTop".equals(fieldName)) { return getDisplayScrollToTop(); }
    return super.getBooleanFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>boolean</code> field name for the current <code>SmartPhonePortal</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setBooleanFieldValue(String fieldName, boolean value) throws NoSuchFieldException {
    if ("displayScrollToTop".equals(fieldName)) { setDisplayScrollToTop(value); return; }
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
   * Gets the <code>Object</code> value of the given field name for this <code>SmartPhonePortal</code>. <br>
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
    if ("structure".equals(fieldName)) { return getStructure(); }
    if ("portlets".equals(fieldName)) { return getPortlets(); }
    if ("pageTitle".equals(fieldName)) { return getPageTitle(lang, useDefault); }
    if ("image".equals(fieldName)) { return getImage(); }
    if ("css".equals(fieldName)) { return getCss(); }
    return super.getFieldValue(fieldName, lang, useDefault);
  }
  
  /**
   * Sets the <code>Object</code> value of the given field name for this <code>SmartPhonePortal</code>. <br>
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
    if ("structure".equals(fieldName)) { setStructure((String)value); return; }
    if ("portlets".equals(fieldName)) { setPortlets((com.jalios.jcms.portlet.PortalElement[])value); return; }
    if ("pageTitle".equals(fieldName)) { setPageTitle(lang,(String)value); return; }
    if ("image".equals(fieldName)) { setImage((String)value); return; }
    if ("css".equals(fieldName)) { setCss((String)value); return; }
    super.setFieldValue(fieldName, value, lang);
  }
  
  // ----------------------------------------------------------------------
  // description
  // ----------------------------------------------------------------------  
  
  protected  String description = channel.getTypeFieldEntry(SmartPhonePortal.class, "description", true).getDefaultTextString();
  
  public String getDescription() { return description; }
  
  public void setDescription(String v) { description = v; }
  
  
  
  
  protected HashMap<String,String> descriptionML = channel.getTypeFieldEntry(SmartPhonePortal.class, "description", true).getDefaultTextMap();
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
  // structure
  // ----------------------------------------------------------------------  
  
  protected  String structure = channel.getTypeFieldEntry(SmartPhonePortal.class, "structure", true).getDefaultTextString();
  
  public String getStructure() { return structure; }
  
  public void setStructure(String v) { structure = v; }
  
  
  
  public String getStructure(String lang) { return structure; }
  public String getStructure(String lang, boolean useDefault) { return structure; }
  // ----------------------------------------------------------------------
  // portlets
  // ----------------------------------------------------------------------  
  
  protected  com.jalios.jcms.portlet.PortalElement[] portlets;
  
  public com.jalios.jcms.portlet.PortalElement[] getPortlets() { return portlets; }
  
  public void setPortlets(com.jalios.jcms.portlet.PortalElement[] v) { portlets = v; }
  
  
  
  // ----------------------------------------------------------------------
  // displayScrollToTop
  // ----------------------------------------------------------------------  
  
  protected  boolean displayScrollToTop = true;
  
  public boolean getDisplayScrollToTop() { return displayScrollToTop; }
  
  public void setDisplayScrollToTop(boolean v) { displayScrollToTop = v; }
  
  
  
  public String getDisplayScrollToTopLabel(String lang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(this.getClass(), "displayScrollToTop", true);
    return displayScrollToTop ? tfe.getOnLabel(lang) : tfe.getOffLabel(lang); 
  }
  public static String[] getDisplayScrollToTopValues() {
    return new String[]{ "true" , "false" };
  }
  
  public static String[] getDisplayScrollToTopLabels(String userLang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(SmartPhonePortal.class, "displayScrollToTop", true);
    String onLabel = (String) tfe.getOnLabel(userLang);
    String offLabel = (String) tfe.getOffLabel(userLang);
    
    return new String[]{ onLabel, offLabel };
  }
  public static EnumerateFormReport getDisplayScrollToTopReport(SortedSet<SmartPhonePortal> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (SmartPhonePortal obj : set) {
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getDisplayScrollToTop());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // pageTitle
  // ----------------------------------------------------------------------  
  
  protected  String pageTitle = channel.getTypeFieldEntry(SmartPhonePortal.class, "pageTitle", true).getDefaultTextString();
  
  public String getPageTitle() { return pageTitle; }
  
  public void setPageTitle(String v) { pageTitle = v; }
  
  
  
  
  protected HashMap<String,String> pageTitleML = channel.getTypeFieldEntry(SmartPhonePortal.class, "pageTitle", true).getDefaultTextMap();
  public String getPageTitle(String lang) { return (String)channel.getLangValue(lang, true, pageTitle, pageTitleML, getMainLanguage()); }
  public String getPageTitle(String lang, boolean useDefault) { return (String)channel.getLangValue(lang, useDefault, pageTitle, pageTitleML, getMainLanguage()); }
  public HashMap<String,String> getPageTitleML() { return pageTitleML; }
  public void setPageTitleML(HashMap<String,String> v) { pageTitleML = v; }
  
  public String getPageTitleMLE() { 
    return JcmsUtil.encodeMLE(getPageTitleML());
  }
  
  public void setPageTitleMLE(String v) {
    setPageTitleML(JcmsUtil.decodeMLE(v));
  }
  
  public void setPageTitle(String lang, String value) {
    if (channel.getLanguage().equals(lang)) {
      pageTitle = value;
      return;
    }
    if (pageTitleML == null) {
      pageTitleML = new HashMap<>();
    } else if (this != channel.getData(id)) {
      pageTitleML = new HashMap<>(pageTitleML);
    }
    pageTitleML.put(lang, value);
  }
  // ----------------------------------------------------------------------
  // image
  // ----------------------------------------------------------------------  
  
  protected  String image = channel.getTypeFieldEntry(SmartPhonePortal.class, "image", true).getDefaultTextString();
  
  public String getImage() { return image; }
  
  public void setImage(String v) { image = v; }
  
  
  
  public String getImage(String lang) { return image; }
  public String getImage(String lang, boolean useDefault) { return image; }
  // ----------------------------------------------------------------------
  // css
  // ----------------------------------------------------------------------  
  
  protected  String css = channel.getTypeFieldEntry(SmartPhonePortal.class, "css", true).getDefaultTextString();
  
  public String getCss() { return css; }
  
  public void setCss(String v) { css = v; }
  
  
  
  public String getCss(String lang) { return css; }
  public String getCss(String lang, boolean useDefault) { return css; }
   
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
    sb.ensureCapacity(500 * (0 + 2 + 0 + 0 + 0 + 0) );
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
    sb.ensureCapacity(500 * (0 + 0 + 0 + 0 + 0 + 0) );
    return sb.toString();
  }
  
  @Override
  public String getAllWysiwygText() {
    StringBuffer sb = new StringBuffer(super.getAllWysiwygText());
    sb.ensureCapacity(500 * (0 + 1 + 0 + 0 + 0 + 0) );
    // Wiki fields containing JHTML
   // Wysiwyg fields
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
    return sb.toString();
  }
  
  @Override
  public <T extends Data> TreeSet<T> getLinkDataSet(Class<T> clazz) {
    if (clazz == null) {
      return Util.emptyTreeSet();
    }
    TreeSet<T> set = new TreeSet<>();
    JcmsUtil.addData(set, clazz, getPortlets());
    return set;
  }
  // ----------------------------------------------------------------------
  // DataController
  // ----------------------------------------------------------------------  
  public ControllerStatus checkHtmlDescription() {
    ControllerStatus status = JcmsUtil.checkHtml(description, channel.getTypeFieldLabel(this, "description"));
    if (status.hasFailed()) {
      return status;
    }
    status = JcmsUtil.checkHtml(descriptionML, channel.getTypeFieldLabel(this, "description"));
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
    
    status = checkHtmlDescription();
    if (status.hasFailed()) {
      return status;
    }
    return ControllerStatus.OK;
  }
  
  
  // ----------------------------------------------------------------------
  // WorkCopy
  // ----------------------------------------------------------------------  
  protected void prepareMergeCopy(Publication mergeCopy) {
    super.prepareMergeCopy(mergeCopy);  
    ((SmartPhonePortal)mergeCopy).setDescription(getDescription());
    ((SmartPhonePortal)mergeCopy).setDescriptionML(JcmsUtil.getMergedMLMap(getDescriptionML(), ((SmartPhonePortal)mergeCopy).getDescriptionML()));
    ((SmartPhonePortal)mergeCopy).setStructure(getStructure());
    ((SmartPhonePortal)mergeCopy).setPortlets(getPortlets());
    ((SmartPhonePortal)mergeCopy).setDisplayScrollToTop(getDisplayScrollToTop());
    ((SmartPhonePortal)mergeCopy).setPageTitle(getPageTitle());
    ((SmartPhonePortal)mergeCopy).setPageTitleML(JcmsUtil.getMergedMLMap(getPageTitleML(), ((SmartPhonePortal)mergeCopy).getPageTitleML()));
    ((SmartPhonePortal)mergeCopy).setImage(getImage());
    ((SmartPhonePortal)mergeCopy).setCss(getCss());
  }
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// /yGllZzRSpzI+or8QxOdGA==
