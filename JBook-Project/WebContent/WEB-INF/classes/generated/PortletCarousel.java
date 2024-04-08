// This file has been automatically generated.

package generated;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.SortedSet;
import java.util.TreeSet;

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
import com.jalios.util.ObjectIntTreeMap;
import com.jalios.util.Util;

@SuppressWarnings({"unchecked", "unused"})
public  class PortletCarousel extends generated.PortletQueryForeach
             implements
                com.jalios.jstore.Searchable
{

  // ----------------------------------------------------------------------
  // CONSTRUCTORS
  // ----------------------------------------------------------------------
  public PortletCarousel() {}


  public PortletCarousel(AbstractPortletSkinable other) {
    super(other);
  }
  public PortletCarousel(PortletQueryForeach other) {
    super(other);
  }




  public PortletCarousel(PortletCarousel other) {
    super(other);
    autoplaycarousel = other.autoplaycarousel;
    arrows = other.arrows;
    dots = other.dots;
    showTitle = other.showTitle;
    showDate = other.showDate;
    showAuthor = other.showAuthor;
    slidesToShow = other.slidesToShow;
    numberOfLinesInTheTitle = other.numberOfLinesInTheTitle;
  }

  // ----------------------------------------------------------------------
  // Import / Export
  // ----------------------------------------------------------------------
  @Override
public void importXml(org.jdom.Element elt, ImportOptions options) {
    super.importXml(elt, options);

    setAutoplaycarousel(ImportUtil.parseFieldLong(elt, "autoplaycarousel"));
    setArrows(ImportUtil.parseFieldBoolean(elt, "arrows"));
    setDots(ImportUtil.parseFieldBoolean(elt, "dots"));
    setShowTitle(ImportUtil.parseFieldBoolean(elt, "showTitle"));
    setShowDate(ImportUtil.parseFieldBoolean(elt, "showDate"));
    setShowAuthor(ImportUtil.parseFieldBoolean(elt, "showAuthor"));
    setSlidesToShow(ImportUtil.parseFieldInt(elt, "slidesToShow"));
    setNumberOfLinesInTheTitle(ImportUtil.parseFieldText(elt, "numberOfLinesInTheTitle"));
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
    sb.append(ExportUtil.exportField(indentLevel, "autoplaycarousel", getAutoplaycarousel()));
    sb.append(ExportUtil.exportField(indentLevel, "arrows", getArrows()));
    sb.append(ExportUtil.exportField(indentLevel, "dots", getDots()));
    sb.append(ExportUtil.exportField(indentLevel, "showTitle", getShowTitle()));
    sb.append(ExportUtil.exportField(indentLevel, "showDate", getShowDate()));
    sb.append(ExportUtil.exportField(indentLevel, "showAuthor", getShowAuthor()));
    sb.append(ExportUtil.exportField(indentLevel, "slidesToShow", getSlidesToShow()));
    sb.append(ExportUtil.exportField(indentLevel, "numberOfLinesInTheTitle", getNumberOfLinesInTheTitle(), false, true));
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
   * Returns the TypeEntry bound to <code>PortletCarousel</code>. <br>
   * @see com.jalios.jcms.Channel#getTypeEntry(Class)
   * @since jcms-5.5
   */
  public static TypeEntry getTypeEntry() {
    return channel.getTypeEntry(PortletCarousel.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>PortletCarousel</code>. <br>
   * This array <strong>does not</strong> contain inherited TypeFieldEntry from super classes of <code>PortletCarousel</code>. <br/>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>PortletCarousel</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getTypeFieldEntries() {
    return channel.getTypeFieldEntries(PortletCarousel.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>PortletCarousel</code>. <br>
   * This array <strong>does</strong> contain inherited TypeFieldEntry from super classes of <code>PortletCarousel</code>. <br>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>PortletCarousel</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getAllTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getAllTypeFieldEntries() {
    return channel.getAllTypeFieldEntries(PortletCarousel.class);
  }
  // ----------------------------------------------------------------------
  // FIELDs VALUE
  // ----------------------------------------------------------------------
  /**
   * Gets the value of the given <code>int</code> field name for the current <code>PortletCarousel</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public int getIntFieldValue(String fieldName) throws NoSuchFieldException {
    if ("slidesToShow".equals(fieldName)) { return getSlidesToShow(); }
    return super.getIntFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>int</code> field name for the current <code>PortletCarousel</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0
   */
  @Override
public void setIntFieldValue(String fieldName, int value) throws NoSuchFieldException {
    if ("slidesToShow".equals(fieldName)) { setSlidesToShow(value); return; }
    super.setIntFieldValue(fieldName, value);
  }

  /**
   * Gets the value of the given <code>long</code> field name for the current <code>PortletCarousel</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public long getLongFieldValue(String fieldName) throws NoSuchFieldException {
    if ("autoplaycarousel".equals(fieldName)) { return getAutoplaycarousel(); }
    return super.getLongFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>long</code> field name for the current <code>PortletCarousel</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0
   */
  @Override
public void setLongFieldValue(String fieldName, long value) throws NoSuchFieldException {
    if ("autoplaycarousel".equals(fieldName)) { setAutoplaycarousel(value); return; }
    super.setLongFieldValue(fieldName, value);
  }

  /**
   * Gets the value of the given <code>double</code> field name for the current <code>PortletCarousel</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public double getDoubleFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getDoubleFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>double</code> field name for the current <code>PortletCarousel</code>.
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
   * Gets the value of the given <code>boolean</code> field name for the current <code>PortletCarousel</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public boolean getBooleanFieldValue(String fieldName) throws NoSuchFieldException {
    if ("arrows".equals(fieldName)) { return getArrows(); }
    if ("dots".equals(fieldName)) { return getDots(); }
    if ("showTitle".equals(fieldName)) { return getShowTitle(); }
    if ("showDate".equals(fieldName)) { return getShowDate(); }
    if ("showAuthor".equals(fieldName)) { return getShowAuthor(); }
    return super.getBooleanFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>boolean</code> field name for the current <code>PortletCarousel</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0
   */
  @Override
public void setBooleanFieldValue(String fieldName, boolean value) throws NoSuchFieldException {
    if ("arrows".equals(fieldName)) { setArrows(value); return; }
    if ("dots".equals(fieldName)) { setDots(value); return; }
    if ("showTitle".equals(fieldName)) { setShowTitle(value); return; }
    if ("showDate".equals(fieldName)) { setShowDate(value); return; }
    if ("showAuthor".equals(fieldName)) { setShowAuthor(value); return; }
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
   * Gets the <code>Object</code> value of the given field name for this <code>PortletCarousel</code>. <br>
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
    if ("numberOfLinesInTheTitle".equals(fieldName)) { return getNumberOfLinesInTheTitle(); }
    return super.getFieldValue(fieldName, lang, useDefault);
  }

  /**
   * Sets the <code>Object</code> value of the given field name for this <code>PortletCarousel</code>. <br>
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
    if ("numberOfLinesInTheTitle".equals(fieldName)) { setNumberOfLinesInTheTitle((String)value); return; }
    super.setFieldValue(fieldName, value, lang);
  }

  // ----------------------------------------------------------------------
  // autoplaycarousel
  // ----------------------------------------------------------------------

  protected  long autoplaycarousel = 0;

  public long getAutoplaycarousel() { return autoplaycarousel; }

  public void setAutoplaycarousel(long v) { autoplaycarousel = v; }



  // ----------------------------------------------------------------------
  // arrows
  // ----------------------------------------------------------------------

  protected  boolean arrows = true;

  public boolean getArrows() { return arrows; }

  public void setArrows(boolean v) { arrows = v; }



  public String getArrowsLabel(String lang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(this.getClass(), "arrows", true);
    return arrows ? tfe.getOnLabel(lang) : tfe.getOffLabel(lang);
  }
  public static String[] getArrowsValues() {
    return new String[]{ "true" , "false" };
  }

  public static String[] getArrowsLabels(String userLang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(PortletCarousel.class, "arrows", true);
    String onLabel = tfe.getOnLabel(userLang);
    String offLabel = tfe.getOffLabel(userLang);

    return new String[]{ onLabel, offLabel };
  }
  public static EnumerateFormReport getArrowsReport(SortedSet<PortletCarousel> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (PortletCarousel obj : set) {
      if (obj == null) {
        continue;
      }

      map.inc("" + obj.getArrows());

      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }
  // ----------------------------------------------------------------------
  // dots
  // ----------------------------------------------------------------------

  protected  boolean dots = true;

  public boolean getDots() { return dots; }

  public void setDots(boolean v) { dots = v; }



  public String getDotsLabel(String lang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(this.getClass(), "dots", true);
    return dots ? tfe.getOnLabel(lang) : tfe.getOffLabel(lang);
  }
  public static String[] getDotsValues() {
    return new String[]{ "true" , "false" };
  }

  public static String[] getDotsLabels(String userLang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(PortletCarousel.class, "dots", true);
    String onLabel = tfe.getOnLabel(userLang);
    String offLabel = tfe.getOffLabel(userLang);

    return new String[]{ onLabel, offLabel };
  }
  public static EnumerateFormReport getDotsReport(SortedSet<PortletCarousel> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (PortletCarousel obj : set) {
      if (obj == null) {
        continue;
      }

      map.inc("" + obj.getDots());

      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }
  // ----------------------------------------------------------------------
  // showTitle
  // ----------------------------------------------------------------------

  protected  boolean showTitle = true;

  public boolean getShowTitle() { return showTitle; }

  public void setShowTitle(boolean v) { showTitle = v; }



  public String getShowTitleLabel(String lang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(this.getClass(), "showTitle", true);
    return showTitle ? tfe.getOnLabel(lang) : tfe.getOffLabel(lang);
  }
  public static String[] getShowTitleValues() {
    return new String[]{ "true" , "false" };
  }

  public static String[] getShowTitleLabels(String userLang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(PortletCarousel.class, "showTitle", true);
    String onLabel = tfe.getOnLabel(userLang);
    String offLabel = tfe.getOffLabel(userLang);

    return new String[]{ onLabel, offLabel };
  }
  public static EnumerateFormReport getShowTitleReport(SortedSet<PortletCarousel> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (PortletCarousel obj : set) {
      if (obj == null) {
        continue;
      }

      map.inc("" + obj.getShowTitle());

      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }
  // ----------------------------------------------------------------------
  // showDate
  // ----------------------------------------------------------------------

  protected  boolean showDate = true;

  public boolean getShowDate() { return showDate; }

  public void setShowDate(boolean v) { showDate = v; }



  public String getShowDateLabel(String lang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(this.getClass(), "showDate", true);
    return showDate ? tfe.getOnLabel(lang) : tfe.getOffLabel(lang);
  }
  public static String[] getShowDateValues() {
    return new String[]{ "true" , "false" };
  }

  public static String[] getShowDateLabels(String userLang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(PortletCarousel.class, "showDate", true);
    String onLabel = tfe.getOnLabel(userLang);
    String offLabel = tfe.getOffLabel(userLang);

    return new String[]{ onLabel, offLabel };
  }
  public static EnumerateFormReport getShowDateReport(SortedSet<PortletCarousel> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (PortletCarousel obj : set) {
      if (obj == null) {
        continue;
      }

      map.inc("" + obj.getShowDate());

      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }
  // ----------------------------------------------------------------------
  // showAuthor
  // ----------------------------------------------------------------------

  protected  boolean showAuthor = true;

  public boolean getShowAuthor() { return showAuthor; }

  public void setShowAuthor(boolean v) { showAuthor = v; }



  public String getShowAuthorLabel(String lang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(this.getClass(), "showAuthor", true);
    return showAuthor ? tfe.getOnLabel(lang) : tfe.getOffLabel(lang);
  }
  public static String[] getShowAuthorValues() {
    return new String[]{ "true" , "false" };
  }

  public static String[] getShowAuthorLabels(String userLang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(PortletCarousel.class, "showAuthor", true);
    String onLabel = tfe.getOnLabel(userLang);
    String offLabel = tfe.getOffLabel(userLang);

    return new String[]{ onLabel, offLabel };
  }
  public static EnumerateFormReport getShowAuthorReport(SortedSet<PortletCarousel> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (PortletCarousel obj : set) {
      if (obj == null) {
        continue;
      }

      map.inc("" + obj.getShowAuthor());

      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }
  // ----------------------------------------------------------------------
  // slidesToShow
  // ----------------------------------------------------------------------

  protected  int slidesToShow = 1;

  public int getSlidesToShow() { return slidesToShow; }

  public void setSlidesToShow(int v) { slidesToShow = v; }



  public static IntegerFormReport getSlidesToShowReport(SortedSet<PortletCarousel> set) {
    long sum = 0;
    int min = Integer.MAX_VALUE;
    int max = Integer.MIN_VALUE;
    for (PortletCarousel obj : set) {
      if (obj == null) {
        continue;
      }
      int value = obj.getSlidesToShow();
      sum += value;
      min = Math.min(value, min);
      max = Math.max(value, max);
    }
    return new IntegerFormReport(set.size(), sum, min, max);
  }
  // ----------------------------------------------------------------------
  // numberOfLinesInTheTitle
  // ----------------------------------------------------------------------

  protected  String numberOfLinesInTheTitle = channel.getTypeFieldEntry(PortletCarousel.class, "numberOfLinesInTheTitle", true).getDefaultTextString();

  public String getNumberOfLinesInTheTitle() { return numberOfLinesInTheTitle; }

  public void setNumberOfLinesInTheTitle(String v) { numberOfLinesInTheTitle = v; }



  public String getNumberOfLinesInTheTitle(String lang) { return numberOfLinesInTheTitle; }
  public String getNumberOfLinesInTheTitle(String lang, boolean useDefault) { return numberOfLinesInTheTitle; }
  private static String[] numberOfLinesInTheTitleValues;
  private static String[] numberOfLinesInTheTitleLabels;
  private static Map<String, String[]> numberOfLinesInTheTitleLabelsMap;

  public static String[] getNumberOfLinesInTheTitleValues() {
    if(numberOfLinesInTheTitleValues == null) {
      setNumberOfLinesInTheTitleValues(channel.getTypeFieldEntry(PortletCarousel.class, "numberOfLinesInTheTitle", true).getEnumerateValues());
    }
    return numberOfLinesInTheTitleValues;
  }
  public static void setNumberOfLinesInTheTitleValues(String[] values) {
    numberOfLinesInTheTitleValues = values;
  }
  public static String[] getNumberOfLinesInTheTitleLabels() {
    if(numberOfLinesInTheTitleLabels == null) {
      setNumberOfLinesInTheTitleLabels(channel.getTypeFieldEntry(PortletCarousel.class, "numberOfLinesInTheTitle", true).getEnumerateLabels());
    }
    return numberOfLinesInTheTitleLabels;
  }
  public static void setNumberOfLinesInTheTitleLabels(String[] labels) {
    numberOfLinesInTheTitleLabels = labels;
  }
  public static Map<String, String[]> getNumberOfLinesInTheTitleLabelsMap() {
    if(numberOfLinesInTheTitleLabelsMap == null) {
      setNumberOfLinesInTheTitleLabelsMap(channel.getTypeFieldEntry(PortletCarousel.class, "numberOfLinesInTheTitle", true).getEnumerateLabelsMap());
    }
    return numberOfLinesInTheTitleLabelsMap;
  }
  public static void setNumberOfLinesInTheTitleLabelsMap(Map<String, String[]> LabelsMap) {
    numberOfLinesInTheTitleLabelsMap = LabelsMap;
  }
  public static String[] getNumberOfLinesInTheTitleLabels(String userLang) {
    Map<String, String[]> numberOfLinesInTheTitleLabelMap = getNumberOfLinesInTheTitleLabelsMap();
    String[] labels = numberOfLinesInTheTitleLabelMap.get(userLang);
    if (labels == null) {
      labels = numberOfLinesInTheTitleLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getNumberOfLinesInTheTitleLabel(String value, String userLang) {
    String[] labels = getNumberOfLinesInTheTitleLabels(userLang);
    int i = 0;
    if (false) {
    }
    else if (value.equals("1")) {
      i = 0;
    }
    else if (value.equals("2")) {
      i = 1;
    }
    else if (value.equals("3")) {
      i = 2;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return getNumberOfLinesInTheTitleLabel(value, channel.getLanguage());
  }

  public static String getNumberOfLinesInTheTitleLabel(String value) {
    String[] numberOfLinesInTheTitleLabels = getNumberOfLinesInTheTitleLabels();
    if (false) {
    }
    else if (value.equals("1")) {
      return numberOfLinesInTheTitleLabels[0];
    }
    else if (value.equals("2")) {
      return numberOfLinesInTheTitleLabels[1];
    }
    else if (value.equals("3")) {
      return numberOfLinesInTheTitleLabels[2];
    }
    return "???";
  }
  public static EnumerateFormReport getNumberOfLinesInTheTitleReport(SortedSet<PortletCarousel> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (PortletCarousel obj : set) {
      if (obj == null) {
        continue;
      }

      map.inc("" + obj.getNumberOfLinesInTheTitle());

      sum++;
    }
    return new EnumerateFormReport(map, sum);
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

  // ----------------------------------------------------------------------
  // Data image
  // ----------------------------------------------------------------------
  @Override
  public String getDataImage() {
    String _img = portletImage;
    if (Util.notEmpty(_img)) {
      return _img;
    }

    return super.getDataImage();
  }

  @Override
  public String getDataImage(String lang, boolean useDefault) {
    String _img = getPortletImage(lang, useDefault);
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
    JcmsUtil.addData(set, clazz, getFirstPublications());
    JcmsUtil.addData(set, clazz, getOriginalPortlet());
    JcmsUtil.addData(set, clazz, getPublications());
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

    return ControllerStatus.OK;
  }


  // ----------------------------------------------------------------------
  // WorkCopy
  // ----------------------------------------------------------------------
  @Override
protected void prepareMergeCopy(Publication mergeCopy) {
    super.prepareMergeCopy(mergeCopy);
    ((PortletCarousel)mergeCopy).setAutoplaycarousel(getAutoplaycarousel());
    ((PortletCarousel)mergeCopy).setArrows(getArrows());
    ((PortletCarousel)mergeCopy).setDots(getDots());
    ((PortletCarousel)mergeCopy).setShowTitle(getShowTitle());
    ((PortletCarousel)mergeCopy).setShowDate(getShowDate());
    ((PortletCarousel)mergeCopy).setShowAuthor(getShowAuthor());
    ((PortletCarousel)mergeCopy).setSlidesToShow(getSlidesToShow());
    ((PortletCarousel)mergeCopy).setNumberOfLinesInTheTitle(getNumberOfLinesInTheTitle());
  }
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// KNPG+PX8S8NFs2tu9fPGrg==
