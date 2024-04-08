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
public  class PortletQueryForeachCards extends generated.PortletQueryForeach
             implements
                com.jalios.jstore.Searchable
{

  // ----------------------------------------------------------------------
  // CONSTRUCTORS
  // ----------------------------------------------------------------------
  public PortletQueryForeachCards() {}


  public PortletQueryForeachCards(AbstractPortletSkinable other) {
    super(other);
  }
  public PortletQueryForeachCards(PortletQueryForeach other) {
    super(other);
  }




  public PortletQueryForeachCards(PortletQueryForeachCards other) {
    super(other);
    cardsPerLine = other.cardsPerLine;
    cardCssClass = other.cardCssClass;
  }

  // ----------------------------------------------------------------------
  // Import / Export
  // ----------------------------------------------------------------------
  @Override
public void importXml(org.jdom.Element elt, ImportOptions options) {
    super.importXml(elt, options);

    setCardsPerLine(ImportUtil.parseFieldText(elt, "cardsPerLine"));
    setCardCssClass(ImportUtil.parseFieldText(elt, "cardCssClass"));
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
    sb.append(ExportUtil.exportField(indentLevel, "cardsPerLine", getCardsPerLine(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "cardCssClass", getCardCssClass(), false, true));
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
   * Returns the TypeEntry bound to <code>PortletQueryForeachCards</code>. <br>
   * @see com.jalios.jcms.Channel#getTypeEntry(Class)
   * @since jcms-5.5
   */
  public static TypeEntry getTypeEntry() {
    return channel.getTypeEntry(PortletQueryForeachCards.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>PortletQueryForeachCards</code>. <br>
   * This array <strong>does not</strong> contain inherited TypeFieldEntry from super classes of <code>PortletQueryForeachCards</code>. <br/>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>PortletQueryForeachCards</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getTypeFieldEntries() {
    return channel.getTypeFieldEntries(PortletQueryForeachCards.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>PortletQueryForeachCards</code>. <br>
   * This array <strong>does</strong> contain inherited TypeFieldEntry from super classes of <code>PortletQueryForeachCards</code>. <br>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>PortletQueryForeachCards</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getAllTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getAllTypeFieldEntries() {
    return channel.getAllTypeFieldEntries(PortletQueryForeachCards.class);
  }
  // ----------------------------------------------------------------------
  // FIELDs VALUE
  // ----------------------------------------------------------------------
  /**
   * Gets the value of the given <code>int</code> field name for the current <code>PortletQueryForeachCards</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public int getIntFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getIntFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>int</code> field name for the current <code>PortletQueryForeachCards</code>.
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
   * Gets the value of the given <code>long</code> field name for the current <code>PortletQueryForeachCards</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public long getLongFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getLongFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>long</code> field name for the current <code>PortletQueryForeachCards</code>.
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
   * Gets the value of the given <code>double</code> field name for the current <code>PortletQueryForeachCards</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public double getDoubleFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getDoubleFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>double</code> field name for the current <code>PortletQueryForeachCards</code>.
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
   * Gets the value of the given <code>boolean</code> field name for the current <code>PortletQueryForeachCards</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public boolean getBooleanFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getBooleanFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>boolean</code> field name for the current <code>PortletQueryForeachCards</code>.
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
   * Gets the <code>Object</code> value of the given field name for this <code>PortletQueryForeachCards</code>. <br>
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
    if ("cardsPerLine".equals(fieldName)) { return getCardsPerLine(); }
    if ("cardCssClass".equals(fieldName)) { return getCardCssClass(); }
    return super.getFieldValue(fieldName, lang, useDefault);
  }

  /**
   * Sets the <code>Object</code> value of the given field name for this <code>PortletQueryForeachCards</code>. <br>
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
    if ("cardsPerLine".equals(fieldName)) { setCardsPerLine((String)value); return; }
    if ("cardCssClass".equals(fieldName)) { setCardCssClass((String)value); return; }
    super.setFieldValue(fieldName, value, lang);
  }

  // ----------------------------------------------------------------------
  // cardsPerLine
  // ----------------------------------------------------------------------

  protected  String cardsPerLine = channel.getTypeFieldEntry(PortletQueryForeachCards.class, "cardsPerLine", true).getDefaultTextString();

  public String getCardsPerLine() { return cardsPerLine; }

  public void setCardsPerLine(String v) { cardsPerLine = v; }



  public String getCardsPerLine(String lang) { return cardsPerLine; }
  public String getCardsPerLine(String lang, boolean useDefault) { return cardsPerLine; }
  private static String[] cardsPerLineValues;
  private static String[] cardsPerLineLabels;
  private static Map<String, String[]> cardsPerLineLabelsMap;

  public static String[] getCardsPerLineValues() {
    if(cardsPerLineValues == null) {
      setCardsPerLineValues(channel.getTypeFieldEntry(PortletQueryForeachCards.class, "cardsPerLine", true).getEnumerateValues());
    }
    return cardsPerLineValues;
  }
  public static void setCardsPerLineValues(String[] values) {
    cardsPerLineValues = values;
  }
  public static String[] getCardsPerLineLabels() {
    if(cardsPerLineLabels == null) {
      setCardsPerLineLabels(channel.getTypeFieldEntry(PortletQueryForeachCards.class, "cardsPerLine", true).getEnumerateLabels());
    }
    return cardsPerLineLabels;
  }
  public static void setCardsPerLineLabels(String[] labels) {
    cardsPerLineLabels = labels;
  }
  public static Map<String, String[]> getCardsPerLineLabelsMap() {
    if(cardsPerLineLabelsMap == null) {
      setCardsPerLineLabelsMap(channel.getTypeFieldEntry(PortletQueryForeachCards.class, "cardsPerLine", true).getEnumerateLabelsMap());
    }
    return cardsPerLineLabelsMap;
  }
  public static void setCardsPerLineLabelsMap(Map<String, String[]> LabelsMap) {
    cardsPerLineLabelsMap = LabelsMap;
  }
  public static String[] getCardsPerLineLabels(String userLang) {
    Map<String, String[]> cardsPerLineLabelMap = getCardsPerLineLabelsMap();
    String[] labels = cardsPerLineLabelMap.get(userLang);
    if (labels == null) {
      labels = cardsPerLineLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getCardsPerLineLabel(String value, String userLang) {
    String[] labels = getCardsPerLineLabels(userLang);
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
    else if (value.equals("4")) {
      i = 3;
    }
    else if (value.equals("5")) {
      i = 4;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return getCardsPerLineLabel(value, channel.getLanguage());
  }

  public static String getCardsPerLineLabel(String value) {
    String[] cardsPerLineLabels = getCardsPerLineLabels();
    if (false) {
    }
    else if (value.equals("1")) {
      return cardsPerLineLabels[0];
    }
    else if (value.equals("2")) {
      return cardsPerLineLabels[1];
    }
    else if (value.equals("3")) {
      return cardsPerLineLabels[2];
    }
    else if (value.equals("4")) {
      return cardsPerLineLabels[3];
    }
    else if (value.equals("5")) {
      return cardsPerLineLabels[4];
    }
    return "???";
  }
  public static EnumerateFormReport getCardsPerLineReport(SortedSet<PortletQueryForeachCards> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (PortletQueryForeachCards obj : set) {
      if (obj == null) {
        continue;
      }

      map.inc("" + obj.getCardsPerLine());

      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }
  // ----------------------------------------------------------------------
  // cardCssClass
  // ----------------------------------------------------------------------

  protected  String cardCssClass = channel.getTypeFieldEntry(PortletQueryForeachCards.class, "cardCssClass", true).getDefaultTextString();

  public String getCardCssClass() { return cardCssClass; }

  public void setCardCssClass(String v) { cardCssClass = v; }



  public String getCardCssClass(String lang) { return cardCssClass; }
  public String getCardCssClass(String lang, boolean useDefault) { return cardCssClass; }

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
    ((PortletQueryForeachCards)mergeCopy).setCardsPerLine(getCardsPerLine());
    ((PortletQueryForeachCards)mergeCopy).setCardCssClass(getCardCssClass());
  }
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// xZQz7e+pwGQHTdTvB7SPUg==
