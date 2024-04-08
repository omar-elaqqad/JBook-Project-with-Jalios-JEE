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
public  class PortletMemberActivity extends generated.AbstractPortletSkinable
             implements
                com.jalios.jstore.Searchable
{

  // ----------------------------------------------------------------------
  // CONSTRUCTORS
  // ----------------------------------------------------------------------
  public PortletMemberActivity() {}


  public PortletMemberActivity(AbstractPortletSkinable other) {
    super(other);
  }




  public PortletMemberActivity(PortletMemberActivity other) {
    super(other);
    activityMode = other.activityMode;
    showAbstract = other.showAbstract;
    showMedia = other.showMedia;
    showComments = other.showComments;
    displayAllEvent = other.displayAllEvent;
    filters = other.filters;
    defaultPageSize = other.defaultPageSize;
  }

  // ----------------------------------------------------------------------
  // Import / Export
  // ----------------------------------------------------------------------
  @Override
public void importXml(org.jdom.Element elt, ImportOptions options) {
    super.importXml(elt, options);

    setActivityMode(ImportUtil.parseFieldText(elt, "activityMode"));
    setShowAbstract(ImportUtil.parseFieldBoolean(elt, "showAbstract"));
    setShowMedia(ImportUtil.parseFieldBoolean(elt, "showMedia"));
    setShowComments(ImportUtil.parseFieldBoolean(elt, "showComments"));
    setDisplayAllEvent(ImportUtil.parseFieldBoolean(elt, "displayAllEvent"));
    setFilters(ImportUtil.parseFieldText(elt, "filters"));
    setDefaultPageSize(ImportUtil.parseFieldInt(elt, "defaultPageSize"));
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
    sb.append(ExportUtil.exportField(indentLevel, "activityMode", getActivityMode(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "showAbstract", getShowAbstract()));
    sb.append(ExportUtil.exportField(indentLevel, "showMedia", getShowMedia()));
    sb.append(ExportUtil.exportField(indentLevel, "showComments", getShowComments()));
    sb.append(ExportUtil.exportField(indentLevel, "displayAllEvent", getDisplayAllEvent()));
    sb.append(ExportUtil.exportField(indentLevel, "filters", getFilters(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "defaultPageSize", getDefaultPageSize()));
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
   * Returns the TypeEntry bound to <code>PortletMemberActivity</code>. <br>
   * @see com.jalios.jcms.Channel#getTypeEntry(Class)
   * @since jcms-5.5
   */
  public static TypeEntry getTypeEntry() {
    return channel.getTypeEntry(PortletMemberActivity.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>PortletMemberActivity</code>. <br>
   * This array <strong>does not</strong> contain inherited TypeFieldEntry from super classes of <code>PortletMemberActivity</code>. <br/>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>PortletMemberActivity</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getTypeFieldEntries() {
    return channel.getTypeFieldEntries(PortletMemberActivity.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>PortletMemberActivity</code>. <br>
   * This array <strong>does</strong> contain inherited TypeFieldEntry from super classes of <code>PortletMemberActivity</code>. <br>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>PortletMemberActivity</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getAllTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getAllTypeFieldEntries() {
    return channel.getAllTypeFieldEntries(PortletMemberActivity.class);
  }
  // ----------------------------------------------------------------------
  // FIELDs VALUE
  // ----------------------------------------------------------------------
  /**
   * Gets the value of the given <code>int</code> field name for the current <code>PortletMemberActivity</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public int getIntFieldValue(String fieldName) throws NoSuchFieldException {
    if ("defaultPageSize".equals(fieldName)) { return getDefaultPageSize(); }
    return super.getIntFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>int</code> field name for the current <code>PortletMemberActivity</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0
   */
  @Override
public void setIntFieldValue(String fieldName, int value) throws NoSuchFieldException {
    if ("defaultPageSize".equals(fieldName)) { setDefaultPageSize(value); return; }
    super.setIntFieldValue(fieldName, value);
  }

  /**
   * Gets the value of the given <code>long</code> field name for the current <code>PortletMemberActivity</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public long getLongFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getLongFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>long</code> field name for the current <code>PortletMemberActivity</code>.
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
   * Gets the value of the given <code>double</code> field name for the current <code>PortletMemberActivity</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public double getDoubleFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getDoubleFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>double</code> field name for the current <code>PortletMemberActivity</code>.
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
   * Gets the value of the given <code>boolean</code> field name for the current <code>PortletMemberActivity</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public boolean getBooleanFieldValue(String fieldName) throws NoSuchFieldException {
    if ("showAbstract".equals(fieldName)) { return getShowAbstract(); }
    if ("showMedia".equals(fieldName)) { return getShowMedia(); }
    if ("showComments".equals(fieldName)) { return getShowComments(); }
    if ("displayAllEvent".equals(fieldName)) { return getDisplayAllEvent(); }
    return super.getBooleanFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>boolean</code> field name for the current <code>PortletMemberActivity</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0
   */
  @Override
public void setBooleanFieldValue(String fieldName, boolean value) throws NoSuchFieldException {
    if ("showAbstract".equals(fieldName)) { setShowAbstract(value); return; }
    if ("showMedia".equals(fieldName)) { setShowMedia(value); return; }
    if ("showComments".equals(fieldName)) { setShowComments(value); return; }
    if ("displayAllEvent".equals(fieldName)) { setDisplayAllEvent(value); return; }
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
   * Gets the <code>Object</code> value of the given field name for this <code>PortletMemberActivity</code>. <br>
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
    if ("activityMode".equals(fieldName)) { return getActivityMode(); }
    if ("filters".equals(fieldName)) { return getFilters(); }
    return super.getFieldValue(fieldName, lang, useDefault);
  }

  /**
   * Sets the <code>Object</code> value of the given field name for this <code>PortletMemberActivity</code>. <br>
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
    if ("activityMode".equals(fieldName)) { setActivityMode((String)value); return; }
    if ("filters".equals(fieldName)) { setFilters((String)value); return; }
    super.setFieldValue(fieldName, value, lang);
  }

  // ----------------------------------------------------------------------
  // activityMode
  // ----------------------------------------------------------------------

  protected  String activityMode = channel.getTypeFieldEntry(PortletMemberActivity.class, "activityMode", true).getDefaultTextString();

  public String getActivityMode() { return activityMode; }

  public void setActivityMode(String v) { activityMode = v; }



  public String getActivityMode(String lang) { return activityMode; }
  public String getActivityMode(String lang, boolean useDefault) { return activityMode; }
  private static String[] activityModeValues;
  private static String[] activityModeLabels;
  private static Map<String, String[]> activityModeLabelsMap;

  public static String[] getActivityModeValues() {
    if(activityModeValues == null) {
      setActivityModeValues(channel.getTypeFieldEntry(PortletMemberActivity.class, "activityMode", true).getEnumerateValues());
    }
    return activityModeValues;
  }
  public static void setActivityModeValues(String[] values) {
    activityModeValues = values;
  }
  public static String[] getActivityModeLabels() {
    if(activityModeLabels == null) {
      setActivityModeLabels(channel.getTypeFieldEntry(PortletMemberActivity.class, "activityMode", true).getEnumerateLabels());
    }
    return activityModeLabels;
  }
  public static void setActivityModeLabels(String[] labels) {
    activityModeLabels = labels;
  }
  public static Map<String, String[]> getActivityModeLabelsMap() {
    if(activityModeLabelsMap == null) {
      setActivityModeLabelsMap(channel.getTypeFieldEntry(PortletMemberActivity.class, "activityMode", true).getEnumerateLabelsMap());
    }
    return activityModeLabelsMap;
  }
  public static void setActivityModeLabelsMap(Map<String, String[]> LabelsMap) {
    activityModeLabelsMap = LabelsMap;
  }
  public static String[] getActivityModeLabels(String userLang) {
    Map<String, String[]> activityModeLabelMap = getActivityModeLabelsMap();
    String[] labels = activityModeLabelMap.get(userLang);
    if (labels == null) {
      labels = activityModeLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getActivityModeLabel(String value, String userLang) {
    String[] labels = getActivityModeLabels(userLang);
    int i = 0;
    if (false) {
    }
    else if (value.equals("members")) {
      i = 0;
    }
    else if (value.equals("membersWS")) {
      i = 1;
    }
    else if (value.equals("allWS")) {
      i = 2;
    }
    else if (value.equals("currentWS")) {
      i = 3;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return getActivityModeLabel(value, channel.getLanguage());
  }

  public static String getActivityModeLabel(String value) {
    String[] activityModeLabels = getActivityModeLabels();
    if (false) {
    }
    else if (value.equals("members")) {
      return activityModeLabels[0];
    }
    else if (value.equals("membersWS")) {
      return activityModeLabels[1];
    }
    else if (value.equals("allWS")) {
      return activityModeLabels[2];
    }
    else if (value.equals("currentWS")) {
      return activityModeLabels[3];
    }
    return "???";
  }
  public static EnumerateFormReport getActivityModeReport(SortedSet<PortletMemberActivity> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (PortletMemberActivity obj : set) {
      if (obj == null) {
        continue;
      }

      map.inc("" + obj.getActivityMode());

      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }
  // ----------------------------------------------------------------------
  // showAbstract
  // ----------------------------------------------------------------------

  protected  boolean showAbstract = true;

  public boolean getShowAbstract() { return showAbstract; }

  public void setShowAbstract(boolean v) { showAbstract = v; }



  public String getShowAbstractLabel(String lang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(this.getClass(), "showAbstract", true);
    return showAbstract ? tfe.getOnLabel(lang) : tfe.getOffLabel(lang);
  }
  public static String[] getShowAbstractValues() {
    return new String[]{ "true" , "false" };
  }

  public static String[] getShowAbstractLabels(String userLang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(PortletMemberActivity.class, "showAbstract", true);
    String onLabel = tfe.getOnLabel(userLang);
    String offLabel = tfe.getOffLabel(userLang);

    return new String[]{ onLabel, offLabel };
  }
  public static EnumerateFormReport getShowAbstractReport(SortedSet<PortletMemberActivity> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (PortletMemberActivity obj : set) {
      if (obj == null) {
        continue;
      }

      map.inc("" + obj.getShowAbstract());

      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }
  // ----------------------------------------------------------------------
  // showMedia
  // ----------------------------------------------------------------------

  protected  boolean showMedia = true;

  public boolean getShowMedia() { return showMedia; }

  public void setShowMedia(boolean v) { showMedia = v; }



  public String getShowMediaLabel(String lang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(this.getClass(), "showMedia", true);
    return showMedia ? tfe.getOnLabel(lang) : tfe.getOffLabel(lang);
  }
  public static String[] getShowMediaValues() {
    return new String[]{ "true" , "false" };
  }

  public static String[] getShowMediaLabels(String userLang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(PortletMemberActivity.class, "showMedia", true);
    String onLabel = tfe.getOnLabel(userLang);
    String offLabel = tfe.getOffLabel(userLang);

    return new String[]{ onLabel, offLabel };
  }
  public static EnumerateFormReport getShowMediaReport(SortedSet<PortletMemberActivity> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (PortletMemberActivity obj : set) {
      if (obj == null) {
        continue;
      }

      map.inc("" + obj.getShowMedia());

      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }
  // ----------------------------------------------------------------------
  // showComments
  // ----------------------------------------------------------------------

  protected  boolean showComments = true;

  public boolean getShowComments() { return showComments; }

  public void setShowComments(boolean v) { showComments = v; }



  public String getShowCommentsLabel(String lang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(this.getClass(), "showComments", true);
    return showComments ? tfe.getOnLabel(lang) : tfe.getOffLabel(lang);
  }
  public static String[] getShowCommentsValues() {
    return new String[]{ "true" , "false" };
  }

  public static String[] getShowCommentsLabels(String userLang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(PortletMemberActivity.class, "showComments", true);
    String onLabel = tfe.getOnLabel(userLang);
    String offLabel = tfe.getOffLabel(userLang);

    return new String[]{ onLabel, offLabel };
  }
  public static EnumerateFormReport getShowCommentsReport(SortedSet<PortletMemberActivity> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (PortletMemberActivity obj : set) {
      if (obj == null) {
        continue;
      }

      map.inc("" + obj.getShowComments());

      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }
  // ----------------------------------------------------------------------
  // displayAllEvent
  // ----------------------------------------------------------------------

  protected  boolean displayAllEvent = true;

  public boolean getDisplayAllEvent() { return displayAllEvent; }

  public void setDisplayAllEvent(boolean v) { displayAllEvent = v; }



  public String getDisplayAllEventLabel(String lang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(this.getClass(), "displayAllEvent", true);
    return displayAllEvent ? tfe.getOnLabel(lang) : tfe.getOffLabel(lang);
  }
  public static String[] getDisplayAllEventValues() {
    return new String[]{ "true" , "false" };
  }

  public static String[] getDisplayAllEventLabels(String userLang) {
    TypeFieldEntry tfe = channel.getTypeFieldEntry(PortletMemberActivity.class, "displayAllEvent", true);
    String onLabel = tfe.getOnLabel(userLang);
    String offLabel = tfe.getOffLabel(userLang);

    return new String[]{ onLabel, offLabel };
  }
  public static EnumerateFormReport getDisplayAllEventReport(SortedSet<PortletMemberActivity> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (PortletMemberActivity obj : set) {
      if (obj == null) {
        continue;
      }

      map.inc("" + obj.getDisplayAllEvent());

      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }
  // ----------------------------------------------------------------------
  // filters
  // ----------------------------------------------------------------------

  protected  String filters = channel.getTypeFieldEntry(PortletMemberActivity.class, "filters", true).getDefaultTextString();

  public String getFilters() { return filters; }

  public void setFilters(String v) { filters = v; }



  public String getFilters(String lang) { return filters; }
  public String getFilters(String lang, boolean useDefault) { return filters; }
  // ----------------------------------------------------------------------
  // defaultPageSize
  // ----------------------------------------------------------------------

  protected  int defaultPageSize = 10;

  public int getDefaultPageSize() { return defaultPageSize; }

  public void setDefaultPageSize(int v) { defaultPageSize = v; }



  public static IntegerFormReport getDefaultPageSizeReport(SortedSet<PortletMemberActivity> set) {
    long sum = 0;
    int min = Integer.MAX_VALUE;
    int max = Integer.MIN_VALUE;
    for (PortletMemberActivity obj : set) {
      if (obj == null) {
        continue;
      }
      int value = obj.getDefaultPageSize();
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

    if (Util.isEmpty(activityMode)) {
      status = new ControllerStatus();
      status.setProp("msg.edit.empty-field", channel.getTypeFieldLabel(this, "activityMode"), null);
      return status;
    }
    if (defaultPageSize < 0 ) {
      status = new ControllerStatus();
      status.setProp("msg.edit.lesser-number", channel.getTypeFieldLabel(this, "defaultPageSize"), "0");
      return status;
    }
    if (defaultPageSize > 500 ) {
      status = new ControllerStatus();
      status.setProp("msg.edit.greater-number", channel.getTypeFieldLabel(this, "defaultPageSize"), "500");
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
    ((PortletMemberActivity)mergeCopy).setActivityMode(getActivityMode());
    ((PortletMemberActivity)mergeCopy).setShowAbstract(getShowAbstract());
    ((PortletMemberActivity)mergeCopy).setShowMedia(getShowMedia());
    ((PortletMemberActivity)mergeCopy).setShowComments(getShowComments());
    ((PortletMemberActivity)mergeCopy).setDisplayAllEvent(getDisplayAllEvent());
    ((PortletMemberActivity)mergeCopy).setFilters(getFilters());
    ((PortletMemberActivity)mergeCopy).setDefaultPageSize(getDefaultPageSize());
  }
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// 8ZzVjlODxtqN9OeWHbPvsg==
