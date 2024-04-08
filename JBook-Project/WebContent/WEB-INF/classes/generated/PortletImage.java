// This file has been automatically generated.

package generated;

import java.util.HashMap;
import java.util.Iterator;
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
import com.jalios.jcms.IntegerFormReport;
import com.jalios.jcms.JcmsUtil;
import com.jalios.jcms.Member;
import com.jalios.jcms.Publication;
import com.jalios.jcms.TypeEntry;
import com.jalios.jcms.TypeFieldEntry;
import com.jalios.jcms.mashup.ExportUtil;
import com.jalios.jcms.mashup.ImportOptions;
import com.jalios.jcms.mashup.ImportUtil;
import com.jalios.util.LangProperty;
import com.jalios.util.ObjectIntTreeMap;
import com.jalios.util.Util;

@SuppressWarnings({"unchecked", "unused"})
public  class PortletImage extends generated.AbstractPortletSkinable
             implements
                com.jalios.jstore.Searchable
{

  // ----------------------------------------------------------------------
  // CONSTRUCTORS
  // ----------------------------------------------------------------------
  public PortletImage() {}


  public PortletImage(AbstractPortletSkinable other) {
    super(other);
  }




  public PortletImage(PortletImage other) {
    super(other);
    image = other.image;
    imageML = other.imageML;
    link = other.link;
    linkML = other.linkML;
    alt = other.alt;
    altML = other.altML;
    targetWindow = other.targetWindow;
    imgWidth = other.imgWidth;
    imgHeight = other.imgHeight;
  }

  // ----------------------------------------------------------------------
  // Import / Export
  // ----------------------------------------------------------------------
  @Override
public void importXml(org.jdom.Element elt, ImportOptions options) {
    super.importXml(elt, options);

    setImage(ImportUtil.parseFieldText(elt, "image"));
    setImageML(ImportUtil.parseFieldTextML(elt, "imageML"));
    setLink(ImportUtil.parseFieldText(elt, "link"));
    setLinkML(ImportUtil.parseFieldTextML(elt, "linkML"));
    setAlt(ImportUtil.parseFieldText(elt, "alt"));
    setAltML(ImportUtil.parseFieldTextML(elt, "altML"));
    setTargetWindow(ImportUtil.parseFieldText(elt, "targetWindow"));
    setImgWidth(ImportUtil.parseFieldInt(elt, "imgWidth"));
    setImgHeight(ImportUtil.parseFieldInt(elt, "imgHeight"));
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
    sb.append(ExportUtil.exportField(indentLevel, "image", getImage(), "imageML", false, true));
    sb.append(ExportUtil.exportField(indentLevel, "imageML", getImageML(), true));
    sb.append(ExportUtil.exportField(indentLevel, "link", getLink(), "linkML", false, true));
    sb.append(ExportUtil.exportField(indentLevel, "linkML", getLinkML(), true));
    sb.append(ExportUtil.exportField(indentLevel, "alt", getAlt(), "altML", true, true));
    sb.append(ExportUtil.exportField(indentLevel, "altML", getAltML(), true));
    sb.append(ExportUtil.exportField(indentLevel, "targetWindow", getTargetWindow(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "imgWidth", getImgWidth()));
    sb.append(ExportUtil.exportField(indentLevel, "imgHeight", getImgHeight()));
  }

  @Override
public Set<FileDocument> getDocumentLinkSet() {
    Set<FileDocument> docSet = super.getDocumentLinkSet();
    JcmsUtil.addFileDocument(docSet, image, imageML);
    return docSet;
  }

  // ----------------------------------------------------------------------
  // TYPE AND FIELD INFOS (static methods)
  // ----------------------------------------------------------------------
  /**
   * Returns the TypeEntry bound to <code>PortletImage</code>. <br>
   * @see com.jalios.jcms.Channel#getTypeEntry(Class)
   * @since jcms-5.5
   */
  public static TypeEntry getTypeEntry() {
    return channel.getTypeEntry(PortletImage.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>PortletImage</code>. <br>
   * This array <strong>does not</strong> contain inherited TypeFieldEntry from super classes of <code>PortletImage</code>. <br/>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>PortletImage</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getTypeFieldEntries() {
    return channel.getTypeFieldEntries(PortletImage.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>PortletImage</code>. <br>
   * This array <strong>does</strong> contain inherited TypeFieldEntry from super classes of <code>PortletImage</code>. <br>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>PortletImage</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getAllTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getAllTypeFieldEntries() {
    return channel.getAllTypeFieldEntries(PortletImage.class);
  }
  // ----------------------------------------------------------------------
  // FIELDs VALUE
  // ----------------------------------------------------------------------
  /**
   * Gets the value of the given <code>int</code> field name for the current <code>PortletImage</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public int getIntFieldValue(String fieldName) throws NoSuchFieldException {
    if ("imgWidth".equals(fieldName)) { return getImgWidth(); }
    if ("imgHeight".equals(fieldName)) { return getImgHeight(); }
    return super.getIntFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>int</code> field name for the current <code>PortletImage</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0
   */
  @Override
public void setIntFieldValue(String fieldName, int value) throws NoSuchFieldException {
    if ("imgWidth".equals(fieldName)) { setImgWidth(value); return; }
    if ("imgHeight".equals(fieldName)) { setImgHeight(value); return; }
    super.setIntFieldValue(fieldName, value);
  }

  /**
   * Gets the value of the given <code>long</code> field name for the current <code>PortletImage</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public long getLongFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getLongFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>long</code> field name for the current <code>PortletImage</code>.
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
   * Gets the value of the given <code>double</code> field name for the current <code>PortletImage</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public double getDoubleFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getDoubleFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>double</code> field name for the current <code>PortletImage</code>.
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
   * Gets the value of the given <code>boolean</code> field name for the current <code>PortletImage</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public boolean getBooleanFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getBooleanFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>boolean</code> field name for the current <code>PortletImage</code>.
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
   * Gets the <code>Object</code> value of the given field name for this <code>PortletImage</code>. <br>
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
    if ("image".equals(fieldName)) { return getImage(lang, useDefault); }
    if ("link".equals(fieldName)) { return getLink(lang, useDefault); }
    if ("alt".equals(fieldName)) { return getAlt(lang, useDefault); }
    if ("targetWindow".equals(fieldName)) { return getTargetWindow(); }
    return super.getFieldValue(fieldName, lang, useDefault);
  }

  /**
   * Sets the <code>Object</code> value of the given field name for this <code>PortletImage</code>. <br>
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
    if ("image".equals(fieldName)) { setImage(lang,(String)value); return; }
    if ("link".equals(fieldName)) { setLink(lang,(String)value); return; }
    if ("alt".equals(fieldName)) { setAlt(lang,(String)value); return; }
    if ("targetWindow".equals(fieldName)) { setTargetWindow((String)value); return; }
    super.setFieldValue(fieldName, value, lang);
  }

  // ----------------------------------------------------------------------
  // image
  // ----------------------------------------------------------------------

  protected  String image = channel.getTypeFieldEntry(PortletImage.class, "image", true).getDefaultTextString();

  public String getImage() { return image; }

  public void setImage(String v) { image = v; }




  protected HashMap<String,String> imageML = channel.getTypeFieldEntry(PortletImage.class, "image", true).getDefaultTextMap();
  public String getImage(String lang) { return channel.getLangValue(lang, true, image, imageML, getMainLanguage()); }
  public String getImage(String lang, boolean useDefault) { return channel.getLangValue(lang, useDefault, image, imageML, getMainLanguage()); }
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
  // link
  // ----------------------------------------------------------------------

  protected  String link = channel.getTypeFieldEntry(PortletImage.class, "link", true).getDefaultTextString();

  public String getLink() { return link; }

  public void setLink(String v) { link = v; }




  protected HashMap<String,String> linkML = channel.getTypeFieldEntry(PortletImage.class, "link", true).getDefaultTextMap();
  public String getLink(String lang) { return channel.getLangValue(lang, true, link, linkML, getMainLanguage()); }
  public String getLink(String lang, boolean useDefault) { return channel.getLangValue(lang, useDefault, link, linkML, getMainLanguage()); }
  public HashMap<String,String> getLinkML() { return linkML; }
  public void setLinkML(HashMap<String,String> v) { linkML = v; }

  public String getLinkMLE() {
    return JcmsUtil.encodeMLE(getLinkML());
  }

  public void setLinkMLE(String v) {
    setLinkML(JcmsUtil.decodeMLE(v));
  }

  public void setLink(String lang, String value) {
    if (channel.getLanguage().equals(lang)) {
      link = value;
      return;
    }
    if (linkML == null) {
      linkML = new HashMap<>();
    } else if (this != channel.getData(id)) {
      linkML = new HashMap<>(linkML);
    }
    linkML.put(lang, value);
  }
  // ----------------------------------------------------------------------
  // alt
  // ----------------------------------------------------------------------

  protected  String alt = channel.getTypeFieldEntry(PortletImage.class, "alt", true).getDefaultTextString();

  public String getAlt() { return alt; }

  public void setAlt(String v) { alt = v; }




  protected HashMap<String,String> altML = channel.getTypeFieldEntry(PortletImage.class, "alt", true).getDefaultTextMap();
  public String getAlt(String lang) { return channel.getLangValue(lang, true, alt, altML, getMainLanguage()); }
  public String getAlt(String lang, boolean useDefault) { return channel.getLangValue(lang, useDefault, alt, altML, getMainLanguage()); }
  public HashMap<String,String> getAltML() { return altML; }
  public void setAltML(HashMap<String,String> v) { altML = v; }

  public String getAltMLE() {
    return JcmsUtil.encodeMLE(getAltML());
  }

  public void setAltMLE(String v) {
    setAltML(JcmsUtil.decodeMLE(v));
  }

  public void setAlt(String lang, String value) {
    if (channel.getLanguage().equals(lang)) {
      alt = value;
      return;
    }
    if (altML == null) {
      altML = new HashMap<>();
    } else if (this != channel.getData(id)) {
      altML = new HashMap<>(altML);
    }
    altML.put(lang, value);
  }
  // ----------------------------------------------------------------------
  // targetWindow
  // ----------------------------------------------------------------------

  protected  String targetWindow = channel.getTypeFieldEntry(PortletImage.class, "targetWindow", true).getDefaultTextString();

  public String getTargetWindow() { return targetWindow; }

  public void setTargetWindow(String v) { targetWindow = v; }



  public String getTargetWindow(String lang) { return targetWindow; }
  public String getTargetWindow(String lang, boolean useDefault) { return targetWindow; }
  private static String[] targetWindowValues;
  private static String[] targetWindowLabels;
  private static Map<String, String[]> targetWindowLabelsMap;

  public static String[] getTargetWindowValues() {
    if(targetWindowValues == null) {
      setTargetWindowValues(channel.getTypeFieldEntry(PortletImage.class, "targetWindow", true).getEnumerateValues());
    }
    return targetWindowValues;
  }
  public static void setTargetWindowValues(String[] values) {
    targetWindowValues = values;
  }
  public static String[] getTargetWindowLabels() {
    if(targetWindowLabels == null) {
      setTargetWindowLabels(channel.getTypeFieldEntry(PortletImage.class, "targetWindow", true).getEnumerateLabels());
    }
    return targetWindowLabels;
  }
  public static void setTargetWindowLabels(String[] labels) {
    targetWindowLabels = labels;
  }
  public static Map<String, String[]> getTargetWindowLabelsMap() {
    if(targetWindowLabelsMap == null) {
      setTargetWindowLabelsMap(channel.getTypeFieldEntry(PortletImage.class, "targetWindow", true).getEnumerateLabelsMap());
    }
    return targetWindowLabelsMap;
  }
  public static void setTargetWindowLabelsMap(Map<String, String[]> LabelsMap) {
    targetWindowLabelsMap = LabelsMap;
  }
  public static String[] getTargetWindowLabels(String userLang) {
    Map<String, String[]> targetWindowLabelMap = getTargetWindowLabelsMap();
    String[] labels = targetWindowLabelMap.get(userLang);
    if (labels == null) {
      labels = targetWindowLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getTargetWindowLabel(String value, String userLang) {
    String[] labels = getTargetWindowLabels(userLang);
    int i = 0;
    if (false) {
    }
    else if (value.equals("")) {
      i = 0;
    }
    else if (value.equals("_blank")) {
      i = 1;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return getTargetWindowLabel(value, channel.getLanguage());
  }

  public static String getTargetWindowLabel(String value) {
    String[] targetWindowLabels = getTargetWindowLabels();
    if (false) {
    }
    else if (value.equals("")) {
      return targetWindowLabels[0];
    }
    else if (value.equals("_blank")) {
      return targetWindowLabels[1];
    }
    return "???";
  }
  public static EnumerateFormReport getTargetWindowReport(SortedSet<PortletImage> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (PortletImage obj : set) {
      if (obj == null) {
        continue;
      }

      map.inc("" + obj.getTargetWindow());

      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }
  // ----------------------------------------------------------------------
  // imgWidth
  // ----------------------------------------------------------------------

  protected  int imgWidth = 0;

  public int getImgWidth() { return imgWidth; }

  public void setImgWidth(int v) { imgWidth = v; }



  public static IntegerFormReport getImgWidthReport(SortedSet<PortletImage> set) {
    long sum = 0;
    int min = Integer.MAX_VALUE;
    int max = Integer.MIN_VALUE;
    for (PortletImage obj : set) {
      if (obj == null) {
        continue;
      }
      int value = obj.getImgWidth();
      sum += value;
      min = Math.min(value, min);
      max = Math.max(value, max);
    }
    return new IntegerFormReport(set.size(), sum, min, max);
  }
  // ----------------------------------------------------------------------
  // imgHeight
  // ----------------------------------------------------------------------

  protected  int imgHeight = 0;

  public int getImgHeight() { return imgHeight; }

  public void setImgHeight(int v) { imgHeight = v; }



  public static IntegerFormReport getImgHeightReport(SortedSet<PortletImage> set) {
    long sum = 0;
    int min = Integer.MAX_VALUE;
    int max = Integer.MIN_VALUE;
    for (PortletImage obj : set) {
      if (obj == null) {
        continue;
      }
      int value = obj.getImgHeight();
      sum += value;
      min = Math.min(value, min);
      max = Math.max(value, max);
    }
    return new IntegerFormReport(set.size(), sum, min, max);
  }

  // ----------------------------------------------------------------------
  // abstract
  // ----------------------------------------------------------------------
  @Override
  public void setAbstract(String lang, String value) { setAlt(lang, value); }
  @Override
  public String getAbstract() { return alt; }
  @Override
  public String getAbstract(String lang, boolean useDefault) { return getAlt(lang, useDefault); }
  @Override
  public HashMap<String,String> getAbstractML() { return getAltML(); }

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
    sb.ensureCapacity(500 * (0 + 1 + 0 + 0 + 0 + 0) );
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
    JcmsUtil.addData(set, clazz, getOriginalPortlet());
    return set;
  }
  // ----------------------------------------------------------------------
  // DataController
  // ----------------------------------------------------------------------
  static Pattern _altPattern;
  static {
    try {
      _altPattern = (new Perl5Compiler()).compile("[^\"]*", Perl5Compiler.CASE_INSENSITIVE_MASK);
    }
    catch(org.apache.oro.text.regex.MalformedPatternException ex) {
      // Empty
    }
  }

  public boolean checkPatternAlt() {
    if (Util.notEmpty(alt) && !(new Perl5Matcher()).matches(alt, _altPattern)) {
      return false;
    }
    if (Util.notEmpty(altML)) {
      for (String str : ((Map<String,String>)altML).values()) {
        if (Util.notEmpty(str) && !(new Perl5Matcher()).matches(str, _altPattern)) {
          return false;
        }
      }
    }
    return true;
  }

  @Override
public ControllerStatus checkIntegrity() {

    ControllerStatus status = super.checkIntegrity();
    if (status.hasFailed()) {
      return status;
    }

    if (Util.isEmpty(getFieldInMainLanguage(image, imageML))) {
      status = new ControllerStatus();
      status.setProp("msg.edit.empty-fieldml", channel.getTypeFieldLabel(this, "image"), new LangProperty("lang." + getMainLanguage()));
      return status;
    }
    if (!Util.isValidUrl(link) || !Util.isValidUrl(linkML)) {
      status = new ControllerStatus();
      status.setProp("msg.edit.bad-url", channel.getTypeFieldLabel(this, "link"));
      return status;
    }
    if (!checkPatternAlt()) {
      status = new ControllerStatus();
      status.setProp("msg.edit.bad-field-format", channel.getTypeFieldLabel(this, "alt"), "[^\"]*");
      return status;
    }
    if (imgWidth < 0 ) {
      status = new ControllerStatus();
      status.setProp("msg.edit.lesser-number", channel.getTypeFieldLabel(this, "imgWidth"), "0");
      return status;
    }
    if (imgWidth > 10000 ) {
      status = new ControllerStatus();
      status.setProp("msg.edit.greater-number", channel.getTypeFieldLabel(this, "imgWidth"), "10000");
      return status;
    }
    if (imgHeight < 0 ) {
      status = new ControllerStatus();
      status.setProp("msg.edit.lesser-number", channel.getTypeFieldLabel(this, "imgHeight"), "0");
      return status;
    }
    if (imgHeight > 10000 ) {
      status = new ControllerStatus();
      status.setProp("msg.edit.greater-number", channel.getTypeFieldLabel(this, "imgHeight"), "10000");
      return status;
    }
    return ControllerStatus.OK;
  }

  @Override
public Set<String> getExternalLinkSet() {
    Set<String> set = super.getExternalLinkSet();

    if (Util.notEmpty(link)) {
      set.add(link);
    }
    if (linkML != null) {
      set.addAll(Util.collectionToCleanSet(linkML.values()));
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
    ((PortletImage)mergeCopy).setImage(getImage());
    ((PortletImage)mergeCopy).setImageML(JcmsUtil.getMergedMLMap(getImageML(), ((PortletImage)mergeCopy).getImageML()));
    ((PortletImage)mergeCopy).setLink(getLink());
    ((PortletImage)mergeCopy).setLinkML(JcmsUtil.getMergedMLMap(getLinkML(), ((PortletImage)mergeCopy).getLinkML()));
    ((PortletImage)mergeCopy).setAlt(getAlt());
    ((PortletImage)mergeCopy).setAltML(JcmsUtil.getMergedMLMap(getAltML(), ((PortletImage)mergeCopy).getAltML()));
    ((PortletImage)mergeCopy).setTargetWindow(getTargetWindow());
    ((PortletImage)mergeCopy).setImgWidth(getImgWidth());
    ((PortletImage)mergeCopy).setImgHeight(getImgHeight());
  }
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// jPpDiENkeFVzS8EIlr6HFg==
