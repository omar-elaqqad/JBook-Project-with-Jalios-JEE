// This file has been automatically generated.

package generated;

import java.util.HashMap;
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
public  class PortletCollaborativeSpaceSuggestion extends generated.AbstractPortletSkinable
             implements
                com.jalios.jstore.Searchable
{

  // ----------------------------------------------------------------------
  // CONSTRUCTORS
  // ----------------------------------------------------------------------
  public PortletCollaborativeSpaceSuggestion() {}


  public PortletCollaborativeSpaceSuggestion(AbstractPortletSkinable other) {
    super(other);
  }




  public PortletCollaborativeSpaceSuggestion(PortletCollaborativeSpaceSuggestion other) {
    super(other);
    threshold = other.threshold;
    maxItems = other.maxItems;
    hideWhenNoResults = other.hideWhenNoResults;
  }

  // ----------------------------------------------------------------------
  // Import / Export
  // ----------------------------------------------------------------------
  @Override
public void importXml(org.jdom.Element elt, ImportOptions options) {
    super.importXml(elt, options);

    setThreshold(ImportUtil.parseFieldInt(elt, "threshold"));
    setMaxItems(ImportUtil.parseFieldInt(elt, "maxItems"));
    setHideWhenNoResults(ImportUtil.parseFieldBoolean(elt, "hideWhenNoResults"));
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
    sb.append(ExportUtil.exportField(indentLevel, "threshold", getThreshold()));
    sb.append(ExportUtil.exportField(indentLevel, "maxItems", getMaxItems()));
    sb.append(ExportUtil.exportField(indentLevel, "hideWhenNoResults", getHideWhenNoResults()));
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
   * Returns the TypeEntry bound to <code>PortletCollaborativeSpaceSuggestion</code>. <br>
   * @see com.jalios.jcms.Channel#getTypeEntry(Class)
   * @since jcms-5.5
   */
  public static TypeEntry getTypeEntry() {
    return channel.getTypeEntry(PortletCollaborativeSpaceSuggestion.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>PortletCollaborativeSpaceSuggestion</code>. <br>
   * This array <strong>does not</strong> contain inherited TypeFieldEntry from super classes of <code>PortletCollaborativeSpaceSuggestion</code>. <br/>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>PortletCollaborativeSpaceSuggestion</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getTypeFieldEntries() {
    return channel.getTypeFieldEntries(PortletCollaborativeSpaceSuggestion.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>PortletCollaborativeSpaceSuggestion</code>. <br>
   * This array <strong>does</strong> contain inherited TypeFieldEntry from super classes of <code>PortletCollaborativeSpaceSuggestion</code>. <br>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>PortletCollaborativeSpaceSuggestion</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getAllTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getAllTypeFieldEntries() {
    return channel.getAllTypeFieldEntries(PortletCollaborativeSpaceSuggestion.class);
  }
  // ----------------------------------------------------------------------
  // FIELDs VALUE
  // ----------------------------------------------------------------------
  /**
   * Gets the value of the given <code>int</code> field name for the current <code>PortletCollaborativeSpaceSuggestion</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public int getIntFieldValue(String fieldName) throws NoSuchFieldException {
    if ("threshold".equals(fieldName)) { return getThreshold(); }
    if ("maxItems".equals(fieldName)) { return getMaxItems(); }
    return super.getIntFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>int</code> field name for the current <code>PortletCollaborativeSpaceSuggestion</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0
   */
  @Override
public void setIntFieldValue(String fieldName, int value) throws NoSuchFieldException {
    if ("threshold".equals(fieldName)) { setThreshold(value); return; }
    if ("maxItems".equals(fieldName)) { setMaxItems(value); return; }
    super.setIntFieldValue(fieldName, value);
  }

  /**
   * Gets the value of the given <code>long</code> field name for the current <code>PortletCollaborativeSpaceSuggestion</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public long getLongFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getLongFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>long</code> field name for the current <code>PortletCollaborativeSpaceSuggestion</code>.
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
   * Gets the value of the given <code>double</code> field name for the current <code>PortletCollaborativeSpaceSuggestion</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public double getDoubleFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getDoubleFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>double</code> field name for the current <code>PortletCollaborativeSpaceSuggestion</code>.
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
   * Gets the value of the given <code>boolean</code> field name for the current <code>PortletCollaborativeSpaceSuggestion</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public boolean getBooleanFieldValue(String fieldName) throws NoSuchFieldException {
    if ("hideWhenNoResults".equals(fieldName)) { return getHideWhenNoResults(); }
    return super.getBooleanFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>boolean</code> field name for the current <code>PortletCollaborativeSpaceSuggestion</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0
   */
  @Override
public void setBooleanFieldValue(String fieldName, boolean value) throws NoSuchFieldException {
    if ("hideWhenNoResults".equals(fieldName)) { setHideWhenNoResults(value); return; }
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
    if ("typology".equals(fieldName)) { return getTypology(mbr); }
    return super.getCategoryFieldValue(fieldName, mbr);
  }
  /**
   * Gets the <code>Object</code> value of the given field name for this <code>PortletCollaborativeSpaceSuggestion</code>. <br>
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
    return super.getFieldValue(fieldName, lang, useDefault);
  }

  /**
   * Sets the <code>Object</code> value of the given field name for this <code>PortletCollaborativeSpaceSuggestion</code>. <br>
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
    super.setFieldValue(fieldName, value, lang);
  }

  // ----------------------------------------------------------------------
  // threshold
  // ----------------------------------------------------------------------

  protected  int threshold = 1;

  public int getThreshold() { return threshold; }

  public void setThreshold(int v) { threshold = v; }



  public static IntegerFormReport getThresholdReport(SortedSet<PortletCollaborativeSpaceSuggestion> set) {
    long sum = 0;
    int min = Integer.MAX_VALUE;
    int max = Integer.MIN_VALUE;
    for (PortletCollaborativeSpaceSuggestion obj : set) {
      if (obj == null) {
        continue;
      }
      int value = obj.getThreshold();
      sum += value;
      min = Math.min(value, min);
      max = Math.max(value, max);
    }
    return new IntegerFormReport(set.size(), sum, min, max);
  }
  // ----------------------------------------------------------------------
  // maxItems
  // ----------------------------------------------------------------------

  protected  int maxItems = 10;

  public int getMaxItems() { return maxItems; }

  public void setMaxItems(int v) { maxItems = v; }



  public static IntegerFormReport getMaxItemsReport(SortedSet<PortletCollaborativeSpaceSuggestion> set) {
    long sum = 0;
    int min = Integer.MAX_VALUE;
    int max = Integer.MIN_VALUE;
    for (PortletCollaborativeSpaceSuggestion obj : set) {
      if (obj == null) {
        continue;
      }
      int value = obj.getMaxItems();
      sum += value;
      min = Math.min(value, min);
      max = Math.max(value, max);
    }
    return new IntegerFormReport(set.size(), sum, min, max);
  }
  // ----------------------------------------------------------------------
  // hideWhenNoResults
  // ----------------------------------------------------------------------

  protected  boolean hideWhenNoResults = false;

  public boolean getHideWhenNoResults() { return hideWhenNoResults; }

  public void setHideWhenNoResults(boolean v) { hideWhenNoResults = v; }



  public String getHideWhenNoResultsLabel(String lang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(this.getClass(), "hideWhenNoResults", true);
    return hideWhenNoResults ? tfe.getOnLabel(lang) : tfe.getOffLabel(lang);
  }
  public static String[] getHideWhenNoResultsValues() {
    return new String[]{ "true" , "false" };
  }

  public static String[] getHideWhenNoResultsLabels(String userLang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(PortletCollaborativeSpaceSuggestion.class, "hideWhenNoResults", true);
    String onLabel = tfe.getOnLabel(userLang);
    String offLabel = tfe.getOffLabel(userLang);

    return new String[]{ onLabel, offLabel };
  }
  public static EnumerateFormReport getHideWhenNoResultsReport(SortedSet<PortletCollaborativeSpaceSuggestion> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (PortletCollaborativeSpaceSuggestion obj : set) {
      if (obj == null) {
        continue;
      }

      map.inc("" + obj.getHideWhenNoResults());

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

  public TreeSet<Category> getTypology(Member member) {
    return getDescendantCategorySet(channel.getCategory("$id.jcmsplugin.collaborativespace.typology-root"), false, member);
  }
  public Category getFirstTypology(Member member) {
    return getFirstDescendantCategory(channel.getCategory("$id.jcmsplugin.collaborativespace.typology-root"), false, member);
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
  @Override
public ControllerStatus checkIntegrity() {

    ControllerStatus status = super.checkIntegrity();
    if (status.hasFailed()) {
      return status;
    }

    if (maxItems < 1 ) {
      status = new ControllerStatus();
      status.setProp("msg.edit.lesser-number", channel.getTypeFieldLabel(this, "maxItems"), "1");
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
    ((PortletCollaborativeSpaceSuggestion)mergeCopy).setThreshold(getThreshold());
    ((PortletCollaborativeSpaceSuggestion)mergeCopy).setMaxItems(getMaxItems());
    ((PortletCollaborativeSpaceSuggestion)mergeCopy).setHideWhenNoResults(getHideWhenNoResults());
  }
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// QrA26n9LKHCg0EylfVZOpg==
