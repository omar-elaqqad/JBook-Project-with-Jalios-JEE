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
public  class Shortcut extends com.jalios.jcms.shortcut.AbstractShortcut 
             implements 
                com.jalios.jstore.Searchable
{
  
  // ----------------------------------------------------------------------
  // CONSTRUCTORS
  // ----------------------------------------------------------------------  
  public Shortcut() {}
 
 
 
  
  
  
  public Shortcut(Shortcut other) {
    super(other);
    image = other.image;
    imageML = other.imageML;
    icon = other.icon;
    text = other.text;
    textML = other.textML;
    link = other.link;
    pub = other.pub;
    pubDBID = other.pubDBID;
    parameters = other.parameters;
    keywords = other.keywords;
    keywordsML = other.keywordsML;
    openMode = other.openMode;
    showInToolsPage = other.showInToolsPage;
  }
  
  // ----------------------------------------------------------------------
  // Import / Export
  // ----------------------------------------------------------------------
  public void importXml(org.jdom.Element elt, ImportOptions options) {
    super.importXml(elt, options);
    
    setImage(ImportUtil.parseFieldText(elt, "image"));
    setImageML(ImportUtil.parseFieldTextML(elt, "imageML"));
    setIcon(ImportUtil.parseFieldText(elt, "icon"));
    setLink(ImportUtil.parseFieldText(elt, "link"));
    setParameters(ImportUtil.parseFieldText(elt, "parameters"));
    setKeywords(ImportUtil.parseFieldText(elt, "keywords"));
    setKeywordsML(ImportUtil.parseFieldTextML(elt, "keywordsML"));
    setOpenMode(ImportUtil.parseFieldText(elt, "openMode"));
    setShowInToolsPage(ImportUtil.parseFieldBoolean(elt, "showInToolsPage"));
  }
  
  protected void importXmlFieldsWithReferences(org.jdom.Element elt, ImportOptions options) {
    super.importXmlFieldsWithReferences(elt, options);
      
    if (options.isSelfImport()) {
      setText(ImportUtil.parseFieldText(elt, "text"));
      setTextML(ImportUtil.parseFieldTextML(elt, "textML"));
      setPub(ImportUtil.parseSelfFieldData(elt, "pub", com.jalios.jcms.Publication.class));
    } else {
    
    setTextML(ImportUtil.parseFieldWikiML(elt, "textML"));
    setText(ImportUtil.parseFieldWiki(elt, "text"));
    setPub((com.jalios.jcms.Publication)ImportUtil.parseFieldData(elt, "pub"));
    }
  }
  
  public void exportXmlField(StringBuffer sb, int indentLevel) {
    super.exportXmlField(sb, indentLevel);
    sb.append(ExportUtil.exportField(indentLevel, "image", getImage(), "imageML", false, true));
    sb.append(ExportUtil.exportField(indentLevel, "imageML", getImageML(), true));
    sb.append(ExportUtil.exportField(indentLevel, "icon", getIcon(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "text", getText(), "textML", true, true));
    sb.append(ExportUtil.exportField(indentLevel, "textML", getTextML(), true));
    sb.append(ExportUtil.exportField(indentLevel, "link", getLink(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "pub", getPub()));
    sb.append(ExportUtil.exportField(indentLevel, "parameters", getParameters(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "keywords", getKeywords(), "keywordsML", false, true));
    sb.append(ExportUtil.exportField(indentLevel, "keywordsML", getKeywordsML(), true));
    sb.append(ExportUtil.exportField(indentLevel, "openMode", getOpenMode(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "showInToolsPage", getShowInToolsPage()));
  }
  
  public Set<FileDocument> getDocumentLinkSet() {
    Set<FileDocument> docSet = super.getDocumentLinkSet();
    JcmsUtil.addFileDocument(docSet, image, imageML);
    JcmsUtil.addFileDocument(docSet, icon);
    return docSet;
  }
  
  // ----------------------------------------------------------------------
  // TYPE AND FIELD INFOS (static methods)
  // ----------------------------------------------------------------------  
  /**
   * Returns the TypeEntry bound to <code>Shortcut</code>. <br>
   * @see com.jalios.jcms.Channel#getTypeEntry(Class)
   * @since jcms-5.5
   */
  public static TypeEntry getTypeEntry() {
    return channel.getTypeEntry(Shortcut.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>Shortcut</code>. <br>
   * This array <strong>does not</strong> contain inherited TypeFieldEntry from super classes of <code>Shortcut</code>. <br/>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>Shortcut</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getTypeFieldEntries() {
    return channel.getTypeFieldEntries(Shortcut.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>Shortcut</code>. <br>
   * This array <strong>does</strong> contain inherited TypeFieldEntry from super classes of <code>Shortcut</code>. <br>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>Shortcut</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getAllTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getAllTypeFieldEntries() {
    return channel.getAllTypeFieldEntries(Shortcut.class);
  }
  // ----------------------------------------------------------------------
  // FIELDs VALUE
  // ----------------------------------------------------------------------  
  /**
   * Gets the value of the given <code>int</code> field name for the current <code>Shortcut</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public int getIntFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getIntFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>int</code> field name for the current <code>Shortcut</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setIntFieldValue(String fieldName, int value) throws NoSuchFieldException {
    super.setIntFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>long</code> field name for the current <code>Shortcut</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public long getLongFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getLongFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>long</code> field name for the current <code>Shortcut</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setLongFieldValue(String fieldName, long value) throws NoSuchFieldException {
    super.setLongFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>double</code> field name for the current <code>Shortcut</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public double getDoubleFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getDoubleFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>double</code> field name for the current <code>Shortcut</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setDoubleFieldValue(String fieldName, double value) throws NoSuchFieldException {
     super.setDoubleFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>boolean</code> field name for the current <code>Shortcut</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public boolean getBooleanFieldValue(String fieldName) throws NoSuchFieldException {
    if ("showInToolsPage".equals(fieldName)) { return getShowInToolsPage(); }
    return super.getBooleanFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>boolean</code> field name for the current <code>Shortcut</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setBooleanFieldValue(String fieldName, boolean value) throws NoSuchFieldException {
    if ("showInToolsPage".equals(fieldName)) { setShowInToolsPage(value); return; }
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
    if ("type".equals(fieldName)) { return getType(mbr); }
    return super.getCategoryFieldValue(fieldName, mbr);
  }
  /**
   * Gets the <code>Object</code> value of the given field name for this <code>Shortcut</code>. <br>
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
    if ("image".equals(fieldName)) { return getImage(lang, useDefault); }
    if ("icon".equals(fieldName)) { return getIcon(); }
    if ("text".equals(fieldName)) { return getText(lang, useDefault); }
    if ("link".equals(fieldName)) { return getLink(); }
    if ("pub".equals(fieldName)) { return getPub(); }
    if ("parameters".equals(fieldName)) { return getParameters(); }
    if ("keywords".equals(fieldName)) { return getKeywords(lang, useDefault); }
    if ("openMode".equals(fieldName)) { return getOpenMode(); }
    return super.getFieldValue(fieldName, lang, useDefault);
  }
  
  /**
   * Sets the <code>Object</code> value of the given field name for this <code>Shortcut</code>. <br>
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
    if ("image".equals(fieldName)) { setImage(lang,(String)value); return; }
    if ("icon".equals(fieldName)) { setIcon((String)value); return; }
    if ("text".equals(fieldName)) { setText(lang,(String)value); return; }
    if ("link".equals(fieldName)) { setLink((String)value); return; }
    if ("pub".equals(fieldName)) { setPub((com.jalios.jcms.Publication)value); return; }
    if ("parameters".equals(fieldName)) { setParameters((String)value); return; }
    if ("keywords".equals(fieldName)) { setKeywords(lang,(String)value); return; }
    if ("openMode".equals(fieldName)) { setOpenMode((String)value); return; }
    super.setFieldValue(fieldName, value, lang);
  }
  
  // ----------------------------------------------------------------------
  // image
  // ----------------------------------------------------------------------  
  
  protected  String image = channel.getTypeFieldEntry(Shortcut.class, "image", true).getDefaultTextString();
  
  public String getImage() { return image; }
  
  public void setImage(String v) { image = v; }
  
  
  
  
  protected HashMap<String,String> imageML = channel.getTypeFieldEntry(Shortcut.class, "image", true).getDefaultTextMap();
  public String getImage(String lang) { return (String)channel.getLangValue(lang, true, image, imageML, getMainLanguage()); }
  public String getImage(String lang, boolean useDefault) { return (String)channel.getLangValue(lang, useDefault, image, imageML, getMainLanguage()); }
  public HashMap<String,String> getImageML() { return imageML; }
  public void setImageML(HashMap<String,String> v) { imageML = v; }
  
  public String getImageMLE() { 
    return JcmsUtil.encodeMLE(getImageML());
  }
  
  public void setImageMLE(String v) {
    setImageML(JcmsUtil.decodeMLE(v));
  }
  
  public void setImage(String lang, String value) {
    if (channel.getLanguage().equals(lang)) {
      image = value;
      return;
    }
    if (imageML == null) {
      imageML = new HashMap<>();
    } else if (this != channel.getData(id)) {
      imageML = new HashMap<>(imageML);
    }
    imageML.put(lang, value);
  }
  // ----------------------------------------------------------------------
  // icon
  // ----------------------------------------------------------------------  
  
  protected  String icon = channel.getTypeFieldEntry(Shortcut.class, "icon", true).getDefaultTextString();
  
  public String getIcon() { return icon; }
  
  public void setIcon(String v) { icon = v; }
  
  
  
  public String getIcon(String lang) { return icon; }
  public String getIcon(String lang, boolean useDefault) { return icon; }
  // ----------------------------------------------------------------------
  // text
  // ----------------------------------------------------------------------  
  
  protected  String text = channel.getTypeFieldEntry(Shortcut.class, "text", true).getDefaultTextString();
  
  public String getText() { return text; }
  
  public void setText(String v) { text = v; }
  
  
  
  
  protected HashMap<String,String> textML = channel.getTypeFieldEntry(Shortcut.class, "text", true).getDefaultTextMap();
  public String getText(String lang) { return (String)channel.getLangValue(lang, true, text, textML, getMainLanguage()); }
  public String getText(String lang, boolean useDefault) { return (String)channel.getLangValue(lang, useDefault, text, textML, getMainLanguage()); }
  public HashMap<String,String> getTextML() { return textML; }
  public void setTextML(HashMap<String,String> v) { textML = v; }
  
  public String getTextMLE() { 
    return JcmsUtil.encodeMLE(getTextML());
  }
  
  public void setTextMLE(String v) {
    setTextML(JcmsUtil.decodeMLE(v));
  }
  
  public void setText(String lang, String value) {
    if (channel.getLanguage().equals(lang)) {
      text = value;
      return;
    }
    if (textML == null) {
      textML = new HashMap<>();
    } else if (this != channel.getData(id)) {
      textML = new HashMap<>(textML);
    }
    textML.put(lang, value);
  }
  // ----------------------------------------------------------------------
  // link
  // ----------------------------------------------------------------------  
  
  protected  String link = channel.getTypeFieldEntry(Shortcut.class, "link", true).getDefaultTextString();
  
  public String getLink() { return link; }
  
  public void setLink(String v) { link = v; }
  
  
  
  public String getLink(String lang) { return link; }
  public String getLink(String lang, boolean useDefault) { return link; }
  // ----------------------------------------------------------------------
  // pub
  // ----------------------------------------------------------------------  
  
  protected  com.jalios.jcms.Publication pub;
  
  public com.jalios.jcms.Publication getPub() { 
    return getPub(true);
  }
  public com.jalios.jcms.Publication getPub(boolean queryDB) { 
   if (pub != null) {
      return pub;
    }
    if (queryDB && Util.notEmpty(pubDBID)) {
      return channel.getData(com.jalios.jcms.Publication.class, pubDBID);
    }
    return null;
  }
  protected String pubDBID;
  public String getPubDBID() { return pubDBID; }
  public void setPub(com.jalios.jcms.Publication v) {
    if (v == null) {
      pub = null;
      pubDBID =null;
      return;
    }  
  
    if (v instanceof DBData) {
      setPubDBID(v.getId());
    } else {
      pub = v;
    }
  }
  public void setPubDBID(String v) { 
    pubDBID = v;
    if (Util.notEmpty(pubDBID)) { 
      pub = null;
    };    
  }  
  
  
  // ----------------------------------------------------------------------
  // parameters
  // ----------------------------------------------------------------------  
  
  protected  String parameters = channel.getTypeFieldEntry(Shortcut.class, "parameters", true).getDefaultTextString();
  
  public String getParameters() { return parameters; }
  
  public void setParameters(String v) { parameters = v; }
  
  
  
  public String getParameters(String lang) { return parameters; }
  public String getParameters(String lang, boolean useDefault) { return parameters; }
  // ----------------------------------------------------------------------
  // keywords
  // ----------------------------------------------------------------------  
  
  protected  String keywords = channel.getTypeFieldEntry(Shortcut.class, "keywords", true).getDefaultTextString();
  
  public String getKeywords() { return keywords; }
  
  public void setKeywords(String v) { keywords = v; }
  
  
  
  
  protected HashMap<String,String> keywordsML = channel.getTypeFieldEntry(Shortcut.class, "keywords", true).getDefaultTextMap();
  public String getKeywords(String lang) { return (String)channel.getLangValue(lang, true, keywords, keywordsML, getMainLanguage()); }
  public String getKeywords(String lang, boolean useDefault) { return (String)channel.getLangValue(lang, useDefault, keywords, keywordsML, getMainLanguage()); }
  public HashMap<String,String> getKeywordsML() { return keywordsML; }
  public void setKeywordsML(HashMap<String,String> v) { keywordsML = v; }
  
  public String getKeywordsMLE() { 
    return JcmsUtil.encodeMLE(getKeywordsML());
  }
  
  public void setKeywordsMLE(String v) {
    setKeywordsML(JcmsUtil.decodeMLE(v));
  }
  
  public void setKeywords(String lang, String value) {
    if (channel.getLanguage().equals(lang)) {
      keywords = value;
      return;
    }
    if (keywordsML == null) {
      keywordsML = new HashMap<>();
    } else if (this != channel.getData(id)) {
      keywordsML = new HashMap<>(keywordsML);
    }
    keywordsML.put(lang, value);
  }
  // ----------------------------------------------------------------------
  // openMode
  // ----------------------------------------------------------------------  
  
  protected  String openMode = channel.getTypeFieldEntry(Shortcut.class, "openMode", true).getDefaultTextString();
  
  public String getOpenMode() { return openMode; }
  
  public void setOpenMode(String v) { openMode = v; }
  
  
  
  public String getOpenMode(String lang) { return openMode; }
  public String getOpenMode(String lang, boolean useDefault) { return openMode; }
  private static String[] openModeValues;  
  private static String[] openModeLabels;
  private static Map<String, String[]> openModeLabelsMap;
  
  public static String[] getOpenModeValues() {
    if(openModeValues == null) {
      setOpenModeValues(channel.getTypeFieldEntry(Shortcut.class, "openMode", true).getEnumerateValues());
    }
    return openModeValues;
  }
  public static void setOpenModeValues(String[] values) {
    openModeValues = values;
  }
  public static String[] getOpenModeLabels() {
    if(openModeLabels == null) {
      setOpenModeLabels(channel.getTypeFieldEntry(Shortcut.class, "openMode", true).getEnumerateLabels());
    }
    return openModeLabels;
  }
  public static void setOpenModeLabels(String[] labels) {
    openModeLabels = labels;
  }
  public static Map<String, String[]> getOpenModeLabelsMap() {
    if(openModeLabelsMap == null) {
      setOpenModeLabelsMap(channel.getTypeFieldEntry(Shortcut.class, "openMode", true).getEnumerateLabelsMap());
    }
    return openModeLabelsMap;
  }
  public static void setOpenModeLabelsMap(Map<String, String[]> LabelsMap) {
    openModeLabelsMap = LabelsMap;
  }
  public static String[] getOpenModeLabels(String userLang) {
    Map<String, String[]> openModeLabelMap = getOpenModeLabelsMap();
    String[] labels = (String[])openModeLabelMap.get(userLang);
    if (labels == null) {
      labels = (String[])openModeLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getOpenModeLabel(String value, String userLang) {
    String[] labels = getOpenModeLabels(userLang);
    int i = 0;
    if (false) {
    }
    else if (value.equals("default")) {
      i = 0;
    }
    else if (value.equals("portal")) {
      i = 1;
    }
    else if (value.equals("modal")) {
      i = 2;
    }
    else if (value.equals("newpage")) {
      i = 3;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return getOpenModeLabel(value, channel.getLanguage());
  }
  
  public static String getOpenModeLabel(String value) {    
    String[] openModeLabels = getOpenModeLabels();
    if (false) {
    }
    else if (value.equals("default")) {
      return openModeLabels[0];
    }
    else if (value.equals("portal")) {
      return openModeLabels[1];
    }
    else if (value.equals("modal")) {
      return openModeLabels[2];
    }
    else if (value.equals("newpage")) {
      return openModeLabels[3];
    }
    return "???";
  }
  public static EnumerateFormReport getOpenModeReport(SortedSet<Shortcut> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (Shortcut obj : set) {
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getOpenMode());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
  // ----------------------------------------------------------------------
  // showInToolsPage
  // ----------------------------------------------------------------------  
  
  protected  boolean showInToolsPage = true;
  
  public boolean getShowInToolsPage() { return showInToolsPage; }
  
  public void setShowInToolsPage(boolean v) { showInToolsPage = v; }
  
  
  
  public String getShowInToolsPageLabel(String lang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(this.getClass(), "showInToolsPage", true);
    return showInToolsPage ? tfe.getOnLabel(lang) : tfe.getOffLabel(lang); 
  }
  public static String[] getShowInToolsPageValues() {
    return new String[]{ "true" , "false" };
  }
  
  public static String[] getShowInToolsPageLabels(String userLang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(Shortcut.class, "showInToolsPage", true);
    String onLabel = (String) tfe.getOnLabel(userLang);
    String offLabel = (String) tfe.getOffLabel(userLang);
    
    return new String[]{ onLabel, offLabel };
  }
  public static EnumerateFormReport getShowInToolsPageReport(SortedSet<Shortcut> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (Shortcut obj : set) {
      if (obj == null) {
        continue;
      }
      
      map.inc("" + obj.getShowInToolsPage());
      
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }    
   
  // ----------------------------------------------------------------------
  // abstract
  // ----------------------------------------------------------------------  
  @Override
  public void setAbstract(String lang, String value) { setText(lang, value); }
  @Override
  public String getAbstract() { return text; }
  @Override
  public String getAbstract(String lang, boolean useDefault) { return getText(lang, useDefault); }
  @Override
  public HashMap<String,String> getAbstractML() { return getTextML(); }
   
  // ----------------------------------------------------------------------
  // Data image
  // ----------------------------------------------------------------------  
  @Override
  public String getDataImage() {
    String _img = image;
    if (Util.notEmpty(_img)) {
      return _img;
    }
  
    return super.getDataImage();
  }
  
  @Override
  public String getDataImage(String lang, boolean useDefault) {
    String _img = getImage(lang, useDefault);
    if (Util.notEmpty(_img)) {
      return _img;
    }  
  
    return super.getDataImage(lang, useDefault);
  }
  
  @Override
  public String[] getSearchStrings() {
    StringBuffer sb = new StringBuffer(super.getSearchStrings()[0]);
    sb.ensureCapacity(500 * (0 + 3 + 0 + 0 + 0 + 0) );
    if (keywords != null) {
      sb.append(keywords); sb.append(' '); 
    }
    if (keywordsML != null) {
      for (String str : keywordsML.values()) {
        if (str != null) {
          sb.append(str); sb.append(' ');
        }
      }
    }
    if (text != null) {
      sb.append(text); sb.append(' '); 
    }
    if (textML != null) {
      for (String str : textML.values()) {
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
    if (text != null && !JHTMLUtils.isJHTML(null, text)) {
      sb.append(text); sb.append(' '); 
    }
    if (textML != null) {
      for (String str : textML.values()) {
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
    if (text != null && JHTMLUtils.isJHTML(null, text)) {
      sb.append(text); sb.append(' '); 
    }
    if (textML != null) {
      for (String str : textML.values()) {
        if (str != null && JHTMLUtils.isJHTML(null, str)) {
          sb.append(str); sb.append(' ');
        }
      }
    }
   // Wysiwyg fields
    return sb.toString();
  }
  
  public TreeSet<Category> getType(Member member) {
    return getDescendantCategorySet(channel.getCategory("$id.application.shortcut.category"), false, member);
  }
  public Category getFirstType(Member member) {
    return getFirstDescendantCategory(channel.getCategory("$id.application.shortcut.category"), false, member);
  }
  @Override
  public <T extends Data> TreeSet<T> getLinkDataSet(Class<T> clazz) {
    if (clazz == null) {
      return Util.emptyTreeSet();
    }
    TreeSet<T> set = new TreeSet<>();
    JcmsUtil.addData(set, clazz, getPub());
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
    
    if (!Util.isValidUrl(link)) {
      status = new ControllerStatus();
      status.setProp("msg.edit.bad-url", channel.getTypeFieldLabel(this, "link"));
      return status;
    }
    return ControllerStatus.OK;
  }
  
  public Set<String> getExternalLinkSet() {
    Set<String> set = super.getExternalLinkSet();
   
    if (Util.notEmpty(link)) {
      set.add(link);
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
    ((Shortcut)mergeCopy).setImage(getImage());
    ((Shortcut)mergeCopy).setImageML(JcmsUtil.getMergedMLMap(getImageML(), ((Shortcut)mergeCopy).getImageML()));
    ((Shortcut)mergeCopy).setIcon(getIcon());
    ((Shortcut)mergeCopy).setText(getText());
    ((Shortcut)mergeCopy).setTextML(JcmsUtil.getMergedMLMap(getTextML(), ((Shortcut)mergeCopy).getTextML()));
    ((Shortcut)mergeCopy).setLink(getLink());
    ((Shortcut)mergeCopy).setPub(getPub());
    ((Shortcut)mergeCopy).setParameters(getParameters());
    ((Shortcut)mergeCopy).setKeywords(getKeywords());
    ((Shortcut)mergeCopy).setKeywordsML(JcmsUtil.getMergedMLMap(getKeywordsML(), ((Shortcut)mergeCopy).getKeywordsML()));
    ((Shortcut)mergeCopy).setOpenMode(getOpenMode());
    ((Shortcut)mergeCopy).setShowInToolsPage(getShowInToolsPage());
  }
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// oLu2CIpZB98fKNb9TbVhCg==
