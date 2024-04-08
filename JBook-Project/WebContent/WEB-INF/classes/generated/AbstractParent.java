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
import com.jalios.jcms.wysiwyg.JHTMLUtils;
import com.jalios.util.ObjectIntTreeMap;
import com.jalios.util.Util;

@SuppressWarnings({"unchecked", "unused"})
public abstract class AbstractParent extends com.jalios.jcms.portlet.PortletParent
             implements
                com.jalios.jstore.Searchable
{

  // ----------------------------------------------------------------------
  // CONSTRUCTORS
  // ----------------------------------------------------------------------
  public AbstractParent() {}






  public AbstractParent(AbstractParent other) {
    super(other);
    child = other.child;
    description = other.description;
    descriptionML = other.descriptionML;
    portletImage = other.portletImage;
    portletImageML = other.portletImageML;
    cacheType = other.cacheType;
    cacheSensibility = other.cacheSensibility;
    invalidClass = other.invalidClass;
    invalidTime = other.invalidTime;
    displayCSS = other.displayCSS;
    width = other.width;
    insetLeft = other.insetLeft;
    insetRight = other.insetRight;
    insetTop = other.insetTop;
    insetBottom = other.insetBottom;
    cellPadding = other.cellPadding;
    alignH = other.alignH;
    alignV = other.alignV;
    alignTable = other.alignTable;
    border = other.border;
    borderColor = other.borderColor;
    backColor = other.backColor;
    backImage = other.backImage;
    displayTitle = other.displayTitle;
    displayTitleML = other.displayTitleML;
    skins = other.skins;
    skinCSS = other.skinCSS;
    popupState = other.popupState;
    expandState = other.expandState;
    behaviorCopy = other.behaviorCopy;
    originalPortlet = other.originalPortlet;
    condition = other.condition;
    cssId = other.cssId;
    cssClasses = other.cssClasses;
    skinClasses = other.skinClasses;
    skinFooter = other.skinFooter;
    skinFooterML = other.skinFooterML;
    skinHeaderIcon = other.skinHeaderIcon;
    skinHeaderIconColor = other.skinHeaderIconColor;
    skinFooterButtonLabel = other.skinFooterButtonLabel;
    skinFooterButtonLabelML = other.skinFooterButtonLabelML;
    skinFooterButtonLink = other.skinFooterButtonLink;
    skinFooterButtonAlign = other.skinFooterButtonAlign;
    skinHeaderButtonLabel = other.skinHeaderButtonLabel;
    skinHeaderButtonLabelML = other.skinHeaderButtonLabelML;
    skinHeaderButtonLink = other.skinHeaderButtonLink;
    skinHeaderSubText = other.skinHeaderSubText;
    skinHeaderSubTextML = other.skinHeaderSubTextML;
  }

  // ----------------------------------------------------------------------
  // Import / Export
  // ----------------------------------------------------------------------
  @Override
public void importXml(org.jdom.Element elt, ImportOptions options) {
    super.importXml(elt, options);

    setPortletImage(ImportUtil.parseFieldText(elt, "portletImage"));
    setPortletImageML(ImportUtil.parseFieldTextML(elt, "portletImageML"));
    setCacheType(ImportUtil.parseFieldText(elt, "cacheType"));
    setCacheSensibility(ImportUtil.parseFieldText(elt, "cacheSensibility"));
    setInvalidClass(ImportUtil.parseFieldTextArray(elt, "invalidClass"));
    setInvalidTime(ImportUtil.parseFieldLong(elt, "invalidTime"));
    setDisplayCSS(ImportUtil.parseFieldText(elt, "displayCSS"));
    setWidth(ImportUtil.parseFieldText(elt, "width"));
    setInsetLeft(ImportUtil.parseFieldInt(elt, "insetLeft"));
    setInsetRight(ImportUtil.parseFieldInt(elt, "insetRight"));
    setInsetTop(ImportUtil.parseFieldInt(elt, "insetTop"));
    setInsetBottom(ImportUtil.parseFieldInt(elt, "insetBottom"));
    setCellPadding(ImportUtil.parseFieldInt(elt, "cellPadding"));
    setAlignH(ImportUtil.parseFieldText(elt, "alignH"));
    setAlignV(ImportUtil.parseFieldText(elt, "alignV"));
    setAlignTable(ImportUtil.parseFieldText(elt, "alignTable"));
    setBorder(ImportUtil.parseFieldInt(elt, "border"));
    setBorderColor(ImportUtil.parseFieldText(elt, "borderColor"));
    setBackColor(ImportUtil.parseFieldText(elt, "backColor"));
    setBackImage(ImportUtil.parseFieldText(elt, "backImage"));
    setDisplayTitle(ImportUtil.parseFieldText(elt, "displayTitle"));
    setDisplayTitleML(ImportUtil.parseFieldTextML(elt, "displayTitleML"));
    setSkins(ImportUtil.parseFieldTextArray(elt, "skins"));
    setSkinCSS(ImportUtil.parseFieldText(elt, "skinCSS"));
    setPopupState(ImportUtil.parseFieldText(elt, "popupState"));
    setExpandState(ImportUtil.parseFieldText(elt, "expandState"));
    setBehaviorCopy(ImportUtil.parseFieldText(elt, "behaviorCopy"));
    setCondition(ImportUtil.parseFieldTextArray(elt, "condition"));
    setCssId(ImportUtil.parseFieldText(elt, "cssId"));
    setCssClasses(ImportUtil.parseFieldText(elt, "cssClasses"));
    setSkinClasses(ImportUtil.parseFieldText(elt, "skinClasses"));
    setSkinHeaderIcon(ImportUtil.parseFieldText(elt, "skinHeaderIcon"));
    setSkinHeaderIconColor(ImportUtil.parseFieldText(elt, "skinHeaderIconColor"));
    setSkinFooterButtonLabel(ImportUtil.parseFieldText(elt, "skinFooterButtonLabel"));
    setSkinFooterButtonLabelML(ImportUtil.parseFieldTextML(elt, "skinFooterButtonLabelML"));
    setSkinFooterButtonLink(ImportUtil.parseFieldText(elt, "skinFooterButtonLink"));
    setSkinFooterButtonAlign(ImportUtil.parseFieldText(elt, "skinFooterButtonAlign"));
    setSkinHeaderButtonLabel(ImportUtil.parseFieldText(elt, "skinHeaderButtonLabel"));
    setSkinHeaderButtonLabelML(ImportUtil.parseFieldTextML(elt, "skinHeaderButtonLabelML"));
    setSkinHeaderButtonLink(ImportUtil.parseFieldText(elt, "skinHeaderButtonLink"));
    setSkinHeaderSubText(ImportUtil.parseFieldText(elt, "skinHeaderSubText"));
    setSkinHeaderSubTextML(ImportUtil.parseFieldTextML(elt, "skinHeaderSubTextML"));
  }

  @Override
protected void importXmlFieldsWithReferences(org.jdom.Element elt, ImportOptions options) {
    super.importXmlFieldsWithReferences(elt, options);

    if (options.isSelfImport()) {
      setChild(ImportUtil.parseSelfFieldData(elt, "child", com.jalios.jcms.portlet.PortalElement.class));
      setDescription(ImportUtil.parseFieldText(elt, "description"));
      setDescriptionML(ImportUtil.parseFieldTextML(elt, "descriptionML"));
      setOriginalPortlet(ImportUtil.parseSelfFieldData(elt, "originalPortlet", com.jalios.jcms.portlet.PortalElement.class));
      setSkinFooter(ImportUtil.parseFieldText(elt, "skinFooter"));
      setSkinFooterML(ImportUtil.parseFieldTextML(elt, "skinFooterML"));
    } else {

    setDescriptionML(ImportUtil.parseFieldWikiML(elt, "descriptionML"));
    setDescription(ImportUtil.parseFieldWiki(elt, "description"));
    setSkinFooterML(ImportUtil.parseFieldWysiwygML(elt, "skinFooterML"));
    setSkinFooter(ImportUtil.parseFieldWysiwyg(elt, "skinFooter"));
    }
  }

  @Override
public void exportXmlField(StringBuffer sb, int indentLevel) {
    super.exportXmlField(sb, indentLevel);
    sb.append(ExportUtil.exportField(indentLevel, "child", getChild()));
    sb.append(ExportUtil.exportField(indentLevel, "description", getDescription(), "descriptionML", true, true));
    sb.append(ExportUtil.exportField(indentLevel, "descriptionML", getDescriptionML(), true));
    sb.append(ExportUtil.exportField(indentLevel, "portletImage", getPortletImage(), "portletImageML", false, true));
    sb.append(ExportUtil.exportField(indentLevel, "portletImageML", getPortletImageML(), true));
    sb.append(ExportUtil.exportField(indentLevel, "cacheType", getCacheType(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "cacheSensibility", getCacheSensibility(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "invalidClass", getInvalidClass(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "invalidTime", getInvalidTime()));
    sb.append(ExportUtil.exportField(indentLevel, "displayCSS", getDisplayCSS(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "width", getWidth(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "insetLeft", getInsetLeft()));
    sb.append(ExportUtil.exportField(indentLevel, "insetRight", getInsetRight()));
    sb.append(ExportUtil.exportField(indentLevel, "insetTop", getInsetTop()));
    sb.append(ExportUtil.exportField(indentLevel, "insetBottom", getInsetBottom()));
    sb.append(ExportUtil.exportField(indentLevel, "cellPadding", getCellPadding()));
    sb.append(ExportUtil.exportField(indentLevel, "alignH", getAlignH(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "alignV", getAlignV(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "alignTable", getAlignTable(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "border", getBorder()));
    sb.append(ExportUtil.exportField(indentLevel, "borderColor", getBorderColor(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "backColor", getBackColor(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "backImage", getBackImage(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "displayTitle", getDisplayTitle(), "displayTitleML", false, true));
    sb.append(ExportUtil.exportField(indentLevel, "displayTitleML", getDisplayTitleML(), true));
    sb.append(ExportUtil.exportField(indentLevel, "skins", getSkins(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "skinCSS", getSkinCSS(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "popupState", getPopupState(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "expandState", getExpandState(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "behaviorCopy", getBehaviorCopy(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "originalPortlet", getOriginalPortlet()));
    sb.append(ExportUtil.exportField(indentLevel, "condition", getCondition(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "cssId", getCssId(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "cssClasses", getCssClasses(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "skinClasses", getSkinClasses(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "skinFooter", getSkinFooter(), "skinFooterML", false, false));
    sb.append(ExportUtil.exportField(indentLevel, "skinFooterML", getSkinFooterML(), false));
    sb.append(ExportUtil.exportField(indentLevel, "skinHeaderIcon", getSkinHeaderIcon(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "skinHeaderIconColor", getSkinHeaderIconColor(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "skinFooterButtonLabel", getSkinFooterButtonLabel(), "skinFooterButtonLabelML", false, true));
    sb.append(ExportUtil.exportField(indentLevel, "skinFooterButtonLabelML", getSkinFooterButtonLabelML(), true));
    sb.append(ExportUtil.exportField(indentLevel, "skinFooterButtonLink", getSkinFooterButtonLink(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "skinFooterButtonAlign", getSkinFooterButtonAlign(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "skinHeaderButtonLabel", getSkinHeaderButtonLabel(), "skinHeaderButtonLabelML", false, true));
    sb.append(ExportUtil.exportField(indentLevel, "skinHeaderButtonLabelML", getSkinHeaderButtonLabelML(), true));
    sb.append(ExportUtil.exportField(indentLevel, "skinHeaderButtonLink", getSkinHeaderButtonLink(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "skinHeaderSubText", getSkinHeaderSubText(), "skinHeaderSubTextML", false, true));
    sb.append(ExportUtil.exportField(indentLevel, "skinHeaderSubTextML", getSkinHeaderSubTextML(), true));
  }

  @Override
public Set<FileDocument> getDocumentLinkSet() {
    Set<FileDocument> docSet = super.getDocumentLinkSet();
    JcmsUtil.addFileDocument(docSet, portletImage, portletImageML);
    JcmsUtil.addFileDocument(docSet, backImage);
    return docSet;
  }

  // ----------------------------------------------------------------------
  // TYPE AND FIELD INFOS (static methods)
  // ----------------------------------------------------------------------
  /**
   * Returns the TypeEntry bound to <code>AbstractParent</code>. <br>
   * @see com.jalios.jcms.Channel#getTypeEntry(Class)
   * @since jcms-5.5
   */
  public static TypeEntry getTypeEntry() {
    return channel.getTypeEntry(AbstractParent.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>AbstractParent</code>. <br>
   * This array <strong>does not</strong> contain inherited TypeFieldEntry from super classes of <code>AbstractParent</code>. <br/>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>AbstractParent</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getTypeFieldEntries() {
    return channel.getTypeFieldEntries(AbstractParent.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>AbstractParent</code>. <br>
   * This array <strong>does</strong> contain inherited TypeFieldEntry from super classes of <code>AbstractParent</code>. <br>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>AbstractParent</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getAllTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getAllTypeFieldEntries() {
    return channel.getAllTypeFieldEntries(AbstractParent.class);
  }
  // ----------------------------------------------------------------------
  // FIELDs VALUE
  // ----------------------------------------------------------------------
  /**
   * Gets the value of the given <code>int</code> field name for the current <code>AbstractParent</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public int getIntFieldValue(String fieldName) throws NoSuchFieldException {
    if ("insetLeft".equals(fieldName)) { return getInsetLeft(); }
    if ("insetRight".equals(fieldName)) { return getInsetRight(); }
    if ("insetTop".equals(fieldName)) { return getInsetTop(); }
    if ("insetBottom".equals(fieldName)) { return getInsetBottom(); }
    if ("cellPadding".equals(fieldName)) { return getCellPadding(); }
    if ("border".equals(fieldName)) { return getBorder(); }
    return super.getIntFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>int</code> field name for the current <code>AbstractParent</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0
   */
  @Override
public void setIntFieldValue(String fieldName, int value) throws NoSuchFieldException {
    if ("insetLeft".equals(fieldName)) { setInsetLeft(value); return; }
    if ("insetRight".equals(fieldName)) { setInsetRight(value); return; }
    if ("insetTop".equals(fieldName)) { setInsetTop(value); return; }
    if ("insetBottom".equals(fieldName)) { setInsetBottom(value); return; }
    if ("cellPadding".equals(fieldName)) { setCellPadding(value); return; }
    if ("border".equals(fieldName)) { setBorder(value); return; }
    super.setIntFieldValue(fieldName, value);
  }

  /**
   * Gets the value of the given <code>long</code> field name for the current <code>AbstractParent</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public long getLongFieldValue(String fieldName) throws NoSuchFieldException {
    if ("invalidTime".equals(fieldName)) { return getInvalidTime(); }
    return super.getLongFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>long</code> field name for the current <code>AbstractParent</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0
   */
  @Override
public void setLongFieldValue(String fieldName, long value) throws NoSuchFieldException {
    if ("invalidTime".equals(fieldName)) { setInvalidTime(value); return; }
    super.setLongFieldValue(fieldName, value);
  }

  /**
   * Gets the value of the given <code>double</code> field name for the current <code>AbstractParent</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public double getDoubleFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getDoubleFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>double</code> field name for the current <code>AbstractParent</code>.
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
   * Gets the value of the given <code>boolean</code> field name for the current <code>AbstractParent</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public boolean getBooleanFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getBooleanFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>boolean</code> field name for the current <code>AbstractParent</code>.
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
   * Gets the <code>Object</code> value of the given field name for this <code>AbstractParent</code>. <br>
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
    if ("child".equals(fieldName)) { return getChild(); }
    if ("description".equals(fieldName)) { return getDescription(lang, useDefault); }
    if ("portletImage".equals(fieldName)) { return getPortletImage(lang, useDefault); }
    if ("cacheType".equals(fieldName)) { return getCacheType(); }
    if ("cacheSensibility".equals(fieldName)) { return getCacheSensibility(); }
    if ("invalidClass".equals(fieldName)) { return getInvalidClass(); }
    if ("displayCSS".equals(fieldName)) { return getDisplayCSS(); }
    if ("width".equals(fieldName)) { return getWidth(); }
    if ("alignH".equals(fieldName)) { return getAlignH(); }
    if ("alignV".equals(fieldName)) { return getAlignV(); }
    if ("alignTable".equals(fieldName)) { return getAlignTable(); }
    if ("borderColor".equals(fieldName)) { return getBorderColor(); }
    if ("backColor".equals(fieldName)) { return getBackColor(); }
    if ("backImage".equals(fieldName)) { return getBackImage(); }
    if ("displayTitle".equals(fieldName)) { return getDisplayTitle(lang, useDefault); }
    if ("skins".equals(fieldName)) { return getSkins(); }
    if ("skinCSS".equals(fieldName)) { return getSkinCSS(); }
    if ("popupState".equals(fieldName)) { return getPopupState(); }
    if ("expandState".equals(fieldName)) { return getExpandState(); }
    if ("behaviorCopy".equals(fieldName)) { return getBehaviorCopy(); }
    if ("originalPortlet".equals(fieldName)) { return getOriginalPortlet(); }
    if ("condition".equals(fieldName)) { return getCondition(); }
    if ("cssId".equals(fieldName)) { return getCssId(); }
    if ("cssClasses".equals(fieldName)) { return getCssClasses(); }
    if ("skinClasses".equals(fieldName)) { return getSkinClasses(); }
    if ("skinFooter".equals(fieldName)) { return getSkinFooter(lang, useDefault); }
    if ("skinHeaderIcon".equals(fieldName)) { return getSkinHeaderIcon(); }
    if ("skinHeaderIconColor".equals(fieldName)) { return getSkinHeaderIconColor(); }
    if ("skinFooterButtonLabel".equals(fieldName)) { return getSkinFooterButtonLabel(lang, useDefault); }
    if ("skinFooterButtonLink".equals(fieldName)) { return getSkinFooterButtonLink(); }
    if ("skinFooterButtonAlign".equals(fieldName)) { return getSkinFooterButtonAlign(); }
    if ("skinHeaderButtonLabel".equals(fieldName)) { return getSkinHeaderButtonLabel(lang, useDefault); }
    if ("skinHeaderButtonLink".equals(fieldName)) { return getSkinHeaderButtonLink(); }
    if ("skinHeaderSubText".equals(fieldName)) { return getSkinHeaderSubText(lang, useDefault); }
    return super.getFieldValue(fieldName, lang, useDefault);
  }

  /**
   * Sets the <code>Object</code> value of the given field name for this <code>AbstractParent</code>. <br>
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
    if ("child".equals(fieldName)) { setChild((com.jalios.jcms.portlet.PortalElement)value); return; }
    if ("description".equals(fieldName)) { setDescription(lang,(String)value); return; }
    if ("portletImage".equals(fieldName)) { setPortletImage(lang,(String)value); return; }
    if ("cacheType".equals(fieldName)) { setCacheType((String)value); return; }
    if ("cacheSensibility".equals(fieldName)) { setCacheSensibility((String)value); return; }
    if ("invalidClass".equals(fieldName)) { setInvalidClass((String[])value); return; }
    if ("displayCSS".equals(fieldName)) { setDisplayCSS((String)value); return; }
    if ("width".equals(fieldName)) { setWidth((String)value); return; }
    if ("alignH".equals(fieldName)) { setAlignH((String)value); return; }
    if ("alignV".equals(fieldName)) { setAlignV((String)value); return; }
    if ("alignTable".equals(fieldName)) { setAlignTable((String)value); return; }
    if ("borderColor".equals(fieldName)) { setBorderColor((String)value); return; }
    if ("backColor".equals(fieldName)) { setBackColor((String)value); return; }
    if ("backImage".equals(fieldName)) { setBackImage((String)value); return; }
    if ("displayTitle".equals(fieldName)) { setDisplayTitle(lang,(String)value); return; }
    if ("skins".equals(fieldName)) { setSkins((String[])value); return; }
    if ("skinCSS".equals(fieldName)) { setSkinCSS((String)value); return; }
    if ("popupState".equals(fieldName)) { setPopupState((String)value); return; }
    if ("expandState".equals(fieldName)) { setExpandState((String)value); return; }
    if ("behaviorCopy".equals(fieldName)) { setBehaviorCopy((String)value); return; }
    if ("originalPortlet".equals(fieldName)) { setOriginalPortlet((com.jalios.jcms.portlet.PortalElement)value); return; }
    if ("condition".equals(fieldName)) { setCondition((String[])value); return; }
    if ("cssId".equals(fieldName)) { setCssId((String)value); return; }
    if ("cssClasses".equals(fieldName)) { setCssClasses((String)value); return; }
    if ("skinClasses".equals(fieldName)) { setSkinClasses((String)value); return; }
    if ("skinFooter".equals(fieldName)) { setSkinFooter(lang,(String)value); return; }
    if ("skinHeaderIcon".equals(fieldName)) { setSkinHeaderIcon((String)value); return; }
    if ("skinHeaderIconColor".equals(fieldName)) { setSkinHeaderIconColor((String)value); return; }
    if ("skinFooterButtonLabel".equals(fieldName)) { setSkinFooterButtonLabel(lang,(String)value); return; }
    if ("skinFooterButtonLink".equals(fieldName)) { setSkinFooterButtonLink((String)value); return; }
    if ("skinFooterButtonAlign".equals(fieldName)) { setSkinFooterButtonAlign((String)value); return; }
    if ("skinHeaderButtonLabel".equals(fieldName)) { setSkinHeaderButtonLabel(lang,(String)value); return; }
    if ("skinHeaderButtonLink".equals(fieldName)) { setSkinHeaderButtonLink((String)value); return; }
    if ("skinHeaderSubText".equals(fieldName)) { setSkinHeaderSubText(lang,(String)value); return; }
    super.setFieldValue(fieldName, value, lang);
  }

  // ----------------------------------------------------------------------
  // child
  // ----------------------------------------------------------------------

  protected  com.jalios.jcms.portlet.PortalElement child;

  @Override
public com.jalios.jcms.portlet.PortalElement getChild() { return child; }

  @Override
public void setChild(com.jalios.jcms.portlet.PortalElement v) { child = v; }



  // ----------------------------------------------------------------------
  // description
  // ----------------------------------------------------------------------

  protected  String description = channel.getTypeFieldEntry(AbstractParent.class, "description", true).getDefaultTextString();

  public String getDescription() { return description; }

  @Override
public void setDescription(String v) { description = v; }




  protected HashMap<String,String> descriptionML = channel.getTypeFieldEntry(AbstractParent.class, "description", true).getDefaultTextMap();
  @Override
public String getDescription(String lang) { return channel.getLangValue(lang, true, description, descriptionML, getMainLanguage()); }
  @Override
public String getDescription(String lang, boolean useDefault) { return channel.getLangValue(lang, useDefault, description, descriptionML, getMainLanguage()); }
  @Override
public HashMap<String,String> getDescriptionML() { return descriptionML; }
  @Override
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
  // portletImage
  // ----------------------------------------------------------------------

  protected  String portletImage = channel.getTypeFieldEntry(AbstractParent.class, "portletImage", true).getDefaultTextString();

  public String getPortletImage() { return portletImage; }

  @Override
public void setPortletImage(String v) { portletImage = v; }




  protected HashMap<String,String> portletImageML = channel.getTypeFieldEntry(AbstractParent.class, "portletImage", true).getDefaultTextMap();
  @Override
public String getPortletImage(String lang) { return channel.getLangValue(lang, true, portletImage, portletImageML, getMainLanguage()); }
  @Override
public String getPortletImage(String lang, boolean useDefault) { return channel.getLangValue(lang, useDefault, portletImage, portletImageML, getMainLanguage()); }
  @Override
public HashMap<String,String> getPortletImageML() { return portletImageML; }
  @Override
public void setPortletImageML(HashMap<String,String> v) { portletImageML = v; }

  public String getPortletImageMLE() {
    return JcmsUtil.encodeMLE(getPortletImageML());
  }

  public void setPortletImageMLE(String v) {
    setPortletImageML(JcmsUtil.decodeMLE(v));
  }

  public void setPortletImage(String lang, String value) {
    if (channel.getLanguage().equals(lang)) {
      portletImage = value;
      return;
    }
    if (portletImageML == null) {
      portletImageML = new HashMap<>();
    } else if (this != channel.getData(id)) {
      portletImageML = new HashMap<>(portletImageML);
    }
    portletImageML.put(lang, value);
  }
  // ----------------------------------------------------------------------
  // cacheType
  // ----------------------------------------------------------------------

  protected  String cacheType = channel.getTypeFieldEntry(AbstractParent.class, "cacheType", true).getDefaultTextString();

  @Override
public String getCacheType() { return cacheType; }

  @Override
public void setCacheType(String v) { cacheType = v; }



  public String getCacheType(String lang) { return cacheType; }
  public String getCacheType(String lang, boolean useDefault) { return cacheType; }
  private static String[] cacheTypeValues;
  private static String[] cacheTypeLabels;
  private static Map<String, String[]> cacheTypeLabelsMap;

  public static String[] getCacheTypeValues() {
    if(cacheTypeValues == null) {
      setCacheTypeValues(channel.getTypeFieldEntry(AbstractParent.class, "cacheType", true).getEnumerateValues());
    }
    return cacheTypeValues;
  }
  public static void setCacheTypeValues(String[] values) {
    cacheTypeValues = values;
  }
  public static String[] getCacheTypeLabels() {
    if(cacheTypeLabels == null) {
      setCacheTypeLabels(channel.getTypeFieldEntry(AbstractParent.class, "cacheType", true).getEnumerateLabels());
    }
    return cacheTypeLabels;
  }
  public static void setCacheTypeLabels(String[] labels) {
    cacheTypeLabels = labels;
  }
  public static Map<String, String[]> getCacheTypeLabelsMap() {
    if(cacheTypeLabelsMap == null) {
      setCacheTypeLabelsMap(channel.getTypeFieldEntry(AbstractParent.class, "cacheType", true).getEnumerateLabelsMap());
    }
    return cacheTypeLabelsMap;
  }
  public static void setCacheTypeLabelsMap(Map<String, String[]> LabelsMap) {
    cacheTypeLabelsMap = LabelsMap;
  }
  public static String[] getCacheTypeLabels(String userLang) {
    Map<String, String[]> cacheTypeLabelMap = getCacheTypeLabelsMap();
    String[] labels = cacheTypeLabelMap.get(userLang);
    if (labels == null) {
      labels = cacheTypeLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getCacheTypeLabel(String value, String userLang) {
    String[] labels = getCacheTypeLabels(userLang);
    int i = 0;
    if (false) {
    }
    else if (value.equals("None")) {
      i = 0;
    }
    else if (value.equals("Server")) {
      i = 1;
    }
    else if (value.equals("Groups")) {
      i = 2;
    }
    else if (value.equals("Members")) {
      i = 3;
    }
    else if (value.equals("Session")) {
      i = 4;
    }
    else if (value.equals("SessionAndVisitors")) {
      i = 5;
    }
    else if (value.equals("VisitorsOnly")) {
      i = 6;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return getCacheTypeLabel(value, channel.getLanguage());
  }

  public static String getCacheTypeLabel(String value) {
    String[] cacheTypeLabels = getCacheTypeLabels();
    if (false) {
    }
    else if (value.equals("None")) {
      return cacheTypeLabels[0];
    }
    else if (value.equals("Server")) {
      return cacheTypeLabels[1];
    }
    else if (value.equals("Groups")) {
      return cacheTypeLabels[2];
    }
    else if (value.equals("Members")) {
      return cacheTypeLabels[3];
    }
    else if (value.equals("Session")) {
      return cacheTypeLabels[4];
    }
    else if (value.equals("SessionAndVisitors")) {
      return cacheTypeLabels[5];
    }
    else if (value.equals("VisitorsOnly")) {
      return cacheTypeLabels[6];
    }
    return "???";
  }
  public static EnumerateFormReport getCacheTypeReport(SortedSet<AbstractParent> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (AbstractParent obj : set) {
      if (obj == null) {
        continue;
      }

      map.inc("" + obj.getCacheType());

      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }
  // ----------------------------------------------------------------------
  // cacheSensibility
  // ----------------------------------------------------------------------

  protected  String cacheSensibility = channel.getTypeFieldEntry(AbstractParent.class, "cacheSensibility", true).getDefaultTextString();

  @Override
public String getCacheSensibility() { return cacheSensibility; }

  @Override
public void setCacheSensibility(String v) { cacheSensibility = v; }



  public String getCacheSensibility(String lang) { return cacheSensibility; }
  public String getCacheSensibility(String lang, boolean useDefault) { return cacheSensibility; }
  private static String[] cacheSensibilityValues;
  private static String[] cacheSensibilityLabels;
  private static Map<String, String[]> cacheSensibilityLabelsMap;

  public static String[] getCacheSensibilityValues() {
    if(cacheSensibilityValues == null) {
      setCacheSensibilityValues(channel.getTypeFieldEntry(AbstractParent.class, "cacheSensibility", true).getEnumerateValues());
    }
    return cacheSensibilityValues;
  }
  public static void setCacheSensibilityValues(String[] values) {
    cacheSensibilityValues = values;
  }
  public static String[] getCacheSensibilityLabels() {
    if(cacheSensibilityLabels == null) {
      setCacheSensibilityLabels(channel.getTypeFieldEntry(AbstractParent.class, "cacheSensibility", true).getEnumerateLabels());
    }
    return cacheSensibilityLabels;
  }
  public static void setCacheSensibilityLabels(String[] labels) {
    cacheSensibilityLabels = labels;
  }
  public static Map<String, String[]> getCacheSensibilityLabelsMap() {
    if(cacheSensibilityLabelsMap == null) {
      setCacheSensibilityLabelsMap(channel.getTypeFieldEntry(AbstractParent.class, "cacheSensibility", true).getEnumerateLabelsMap());
    }
    return cacheSensibilityLabelsMap;
  }
  public static void setCacheSensibilityLabelsMap(Map<String, String[]> LabelsMap) {
    cacheSensibilityLabelsMap = LabelsMap;
  }
  public static String[] getCacheSensibilityLabels(String userLang) {
    Map<String, String[]> cacheSensibilityLabelMap = getCacheSensibilityLabelsMap();
    String[] labels = cacheSensibilityLabelMap.get(userLang);
    if (labels == null) {
      labels = cacheSensibilityLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getCacheSensibilityLabel(String value, String userLang) {
    String[] labels = getCacheSensibilityLabels(userLang);
    int i = 0;
    if (false) {
    }
    else if (value.equals("None")) {
      i = 0;
    }
    else if (value.equals("Portal")) {
      i = 1;
    }
    else if (value.equals("Current")) {
      i = 2;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return getCacheSensibilityLabel(value, channel.getLanguage());
  }

  public static String getCacheSensibilityLabel(String value) {
    String[] cacheSensibilityLabels = getCacheSensibilityLabels();
    if (false) {
    }
    else if (value.equals("None")) {
      return cacheSensibilityLabels[0];
    }
    else if (value.equals("Portal")) {
      return cacheSensibilityLabels[1];
    }
    else if (value.equals("Current")) {
      return cacheSensibilityLabels[2];
    }
    return "???";
  }
  public static EnumerateFormReport getCacheSensibilityReport(SortedSet<AbstractParent> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (AbstractParent obj : set) {
      if (obj == null) {
        continue;
      }

      map.inc("" + obj.getCacheSensibility());

      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }
  // ----------------------------------------------------------------------
  // invalidClass
  // ----------------------------------------------------------------------

  protected  String[] invalidClass;

  @Override
public String[] getInvalidClass() { return invalidClass; }

  @Override
public void setInvalidClass(String[] v) { invalidClass = v; }



  public String[] getInvalidClass(String lang) { return invalidClass; }
  public String[] getInvalidClass(String lang, boolean useDefault) { return invalidClass; }
  private static String[] invalidClassValues;
  private static String[] invalidClassLabels;
  private static Map<String, String[]> invalidClassLabelsMap;

  public static String[] getInvalidClassValues() {
    if(invalidClassValues == null) {
      setInvalidClassValues(channel.getTypeFieldEntry(AbstractParent.class, "invalidClass", true).getEnumerateValues());
    }
    return invalidClassValues;
  }
  public static void setInvalidClassValues(String[] values) {
    invalidClassValues = values;
  }
  public static String[] getInvalidClassLabels() {
    if(invalidClassLabels == null) {
      setInvalidClassLabels(channel.getTypeFieldEntry(AbstractParent.class, "invalidClass", true).getEnumerateLabels());
    }
    return invalidClassLabels;
  }
  public static void setInvalidClassLabels(String[] labels) {
    invalidClassLabels = labels;
  }
  public static Map<String, String[]> getInvalidClassLabelsMap() {
    if(invalidClassLabelsMap == null) {
      setInvalidClassLabelsMap(channel.getTypeFieldEntry(AbstractParent.class, "invalidClass", true).getEnumerateLabelsMap());
    }
    return invalidClassLabelsMap;
  }
  public static void setInvalidClassLabelsMap(Map<String, String[]> LabelsMap) {
    invalidClassLabelsMap = LabelsMap;
  }
  public static String[] getInvalidClassLabels(String userLang) {
    Map<String, String[]> invalidClassLabelMap = getInvalidClassLabelsMap();
    String[] labels = invalidClassLabelMap.get(userLang);
    if (labels == null) {
      labels = invalidClassLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getInvalidClassLabel(String value, String userLang) {
    String[] labels = getInvalidClassLabels(userLang);
    int i = 0;
    if (false) {
    }
    else if (value.equals("Data")) {
      i = 0;
    }
    else if (value.equals("Publication")) {
      i = 1;
    }
    else if (value.equals("Content")) {
      i = 2;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return getInvalidClassLabel(value, channel.getLanguage());
  }

  public static String getInvalidClassLabel(String value) {
    String[] invalidClassLabels = getInvalidClassLabels();
    if (false) {
    }
    else if (value.equals("Data")) {
      return invalidClassLabels[0];
    }
    else if (value.equals("Publication")) {
      return invalidClassLabels[1];
    }
    else if (value.equals("Content")) {
      return invalidClassLabels[2];
    }
    return "???";
  }
  public static EnumerateFormReport getInvalidClassReport(SortedSet<AbstractParent> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (AbstractParent obj : set) {
      if (obj == null || obj.getInvalidClass() == null) {
        continue;
      }
      for(int i = 0; i < obj.getInvalidClass().length; i++) {
        if (obj.getInvalidClass()[i] != null) {
          map.inc(obj.getInvalidClass()[i]);
        }
      }
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }
  // ----------------------------------------------------------------------
  // invalidTime
  // ----------------------------------------------------------------------

  protected  long invalidTime = 60;

  @Override
public long getInvalidTime() { return invalidTime; }

  @Override
public void setInvalidTime(long v) { invalidTime = v; }



  // ----------------------------------------------------------------------
  // displayCSS
  // ----------------------------------------------------------------------

  protected  String displayCSS = channel.getTypeFieldEntry(AbstractParent.class, "displayCSS", true).getDefaultTextString();

  @Override
public String getDisplayCSS() { return displayCSS; }

  @Override
public void setDisplayCSS(String v) { displayCSS = v; }



  public String getDisplayCSS(String lang) { return displayCSS; }
  public String getDisplayCSS(String lang, boolean useDefault) { return displayCSS; }
  private static String[] displayCSSValues;
  private static String[] displayCSSLabels;
  private static Map<String, String[]> displayCSSLabelsMap;

  public static String[] getDisplayCSSValues() {
    if(displayCSSValues == null) {
      setDisplayCSSValues(channel.getTypeFieldEntry(AbstractParent.class, "displayCSS", true).getEnumerateValues());
    }
    return displayCSSValues;
  }
  public static void setDisplayCSSValues(String[] values) {
    displayCSSValues = values;
  }
  public static String[] getDisplayCSSLabels() {
    if(displayCSSLabels == null) {
      setDisplayCSSLabels(channel.getTypeFieldEntry(AbstractParent.class, "displayCSS", true).getEnumerateLabels());
    }
    return displayCSSLabels;
  }
  public static void setDisplayCSSLabels(String[] labels) {
    displayCSSLabels = labels;
  }
  public static Map<String, String[]> getDisplayCSSLabelsMap() {
    if(displayCSSLabelsMap == null) {
      setDisplayCSSLabelsMap(channel.getTypeFieldEntry(AbstractParent.class, "displayCSS", true).getEnumerateLabelsMap());
    }
    return displayCSSLabelsMap;
  }
  public static void setDisplayCSSLabelsMap(Map<String, String[]> LabelsMap) {
    displayCSSLabelsMap = LabelsMap;
  }
  public static String[] getDisplayCSSLabels(String userLang) {
    Map<String, String[]> displayCSSLabelMap = getDisplayCSSLabelsMap();
    String[] labels = displayCSSLabelMap.get(userLang);
    if (labels == null) {
      labels = displayCSSLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getDisplayCSSLabel(String value, String userLang) {
    String[] labels = getDisplayCSSLabels(userLang);
    int i = 0;
    if (false) {
    }
    else if (value.equals("value1")) {
      i = 0;
    }
    else if (value.equals("value2")) {
      i = 1;
    }
    else if (value.equals("value3")) {
      i = 2;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return getDisplayCSSLabel(value, channel.getLanguage());
  }

  public static String getDisplayCSSLabel(String value) {
    String[] displayCSSLabels = getDisplayCSSLabels();
    if (false) {
    }
    else if (value.equals("value1")) {
      return displayCSSLabels[0];
    }
    else if (value.equals("value2")) {
      return displayCSSLabels[1];
    }
    else if (value.equals("value3")) {
      return displayCSSLabels[2];
    }
    return "???";
  }
  public static EnumerateFormReport getDisplayCSSReport(SortedSet<AbstractParent> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (AbstractParent obj : set) {
      if (obj == null) {
        continue;
      }

      map.inc("" + obj.getDisplayCSS());

      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }
  // ----------------------------------------------------------------------
  // width
  // ----------------------------------------------------------------------

  protected  String width = channel.getTypeFieldEntry(AbstractParent.class, "width", true).getDefaultTextString();

  @Override
public String getWidth() { return width; }

  @Override
public void setWidth(String v) { width = v; }



  public String getWidth(String lang) { return width; }
  public String getWidth(String lang, boolean useDefault) { return width; }
  // ----------------------------------------------------------------------
  // insetLeft
  // ----------------------------------------------------------------------

  protected  int insetLeft = 0;

  @Override
public int getInsetLeft() { return insetLeft; }

  @Override
public void setInsetLeft(int v) { insetLeft = v; }



  public static IntegerFormReport getInsetLeftReport(SortedSet<AbstractParent> set) {
    long sum = 0;
    int min = Integer.MAX_VALUE;
    int max = Integer.MIN_VALUE;
    for (AbstractParent obj : set) {
      if (obj == null) {
        continue;
      }
      int value = obj.getInsetLeft();
      sum += value;
      min = Math.min(value, min);
      max = Math.max(value, max);
    }
    return new IntegerFormReport(set.size(), sum, min, max);
  }
  // ----------------------------------------------------------------------
  // insetRight
  // ----------------------------------------------------------------------

  protected  int insetRight = 0;

  @Override
public int getInsetRight() { return insetRight; }

  @Override
public void setInsetRight(int v) { insetRight = v; }



  public static IntegerFormReport getInsetRightReport(SortedSet<AbstractParent> set) {
    long sum = 0;
    int min = Integer.MAX_VALUE;
    int max = Integer.MIN_VALUE;
    for (AbstractParent obj : set) {
      if (obj == null) {
        continue;
      }
      int value = obj.getInsetRight();
      sum += value;
      min = Math.min(value, min);
      max = Math.max(value, max);
    }
    return new IntegerFormReport(set.size(), sum, min, max);
  }
  // ----------------------------------------------------------------------
  // insetTop
  // ----------------------------------------------------------------------

  protected  int insetTop = 0;

  @Override
public int getInsetTop() { return insetTop; }

  @Override
public void setInsetTop(int v) { insetTop = v; }



  public static IntegerFormReport getInsetTopReport(SortedSet<AbstractParent> set) {
    long sum = 0;
    int min = Integer.MAX_VALUE;
    int max = Integer.MIN_VALUE;
    for (AbstractParent obj : set) {
      if (obj == null) {
        continue;
      }
      int value = obj.getInsetTop();
      sum += value;
      min = Math.min(value, min);
      max = Math.max(value, max);
    }
    return new IntegerFormReport(set.size(), sum, min, max);
  }
  // ----------------------------------------------------------------------
  // insetBottom
  // ----------------------------------------------------------------------

  protected  int insetBottom = 0;

  @Override
public int getInsetBottom() { return insetBottom; }

  @Override
public void setInsetBottom(int v) { insetBottom = v; }



  public static IntegerFormReport getInsetBottomReport(SortedSet<AbstractParent> set) {
    long sum = 0;
    int min = Integer.MAX_VALUE;
    int max = Integer.MIN_VALUE;
    for (AbstractParent obj : set) {
      if (obj == null) {
        continue;
      }
      int value = obj.getInsetBottom();
      sum += value;
      min = Math.min(value, min);
      max = Math.max(value, max);
    }
    return new IntegerFormReport(set.size(), sum, min, max);
  }
  // ----------------------------------------------------------------------
  // cellPadding
  // ----------------------------------------------------------------------

  protected  int cellPadding = 0;

  @Override
public int getCellPadding() { return cellPadding; }

  @Override
public void setCellPadding(int v) { cellPadding = v; }



  public static IntegerFormReport getCellPaddingReport(SortedSet<AbstractParent> set) {
    long sum = 0;
    int min = Integer.MAX_VALUE;
    int max = Integer.MIN_VALUE;
    for (AbstractParent obj : set) {
      if (obj == null) {
        continue;
      }
      int value = obj.getCellPadding();
      sum += value;
      min = Math.min(value, min);
      max = Math.max(value, max);
    }
    return new IntegerFormReport(set.size(), sum, min, max);
  }
  // ----------------------------------------------------------------------
  // alignH
  // ----------------------------------------------------------------------

  protected  String alignH = channel.getTypeFieldEntry(AbstractParent.class, "alignH", true).getDefaultTextString();

  @Override
public String getAlignH() { return alignH; }

  @Override
public void setAlignH(String v) { alignH = v; }



  public String getAlignH(String lang) { return alignH; }
  public String getAlignH(String lang, boolean useDefault) { return alignH; }
  private static String[] alignHValues;
  private static String[] alignHLabels;
  private static Map<String, String[]> alignHLabelsMap;

  public static String[] getAlignHValues() {
    if(alignHValues == null) {
      setAlignHValues(channel.getTypeFieldEntry(AbstractParent.class, "alignH", true).getEnumerateValues());
    }
    return alignHValues;
  }
  public static void setAlignHValues(String[] values) {
    alignHValues = values;
  }
  public static String[] getAlignHLabels() {
    if(alignHLabels == null) {
      setAlignHLabels(channel.getTypeFieldEntry(AbstractParent.class, "alignH", true).getEnumerateLabels());
    }
    return alignHLabels;
  }
  public static void setAlignHLabels(String[] labels) {
    alignHLabels = labels;
  }
  public static Map<String, String[]> getAlignHLabelsMap() {
    if(alignHLabelsMap == null) {
      setAlignHLabelsMap(channel.getTypeFieldEntry(AbstractParent.class, "alignH", true).getEnumerateLabelsMap());
    }
    return alignHLabelsMap;
  }
  public static void setAlignHLabelsMap(Map<String, String[]> LabelsMap) {
    alignHLabelsMap = LabelsMap;
  }
  public static String[] getAlignHLabels(String userLang) {
    Map<String, String[]> alignHLabelMap = getAlignHLabelsMap();
    String[] labels = alignHLabelMap.get(userLang);
    if (labels == null) {
      labels = alignHLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getAlignHLabel(String value, String userLang) {
    String[] labels = getAlignHLabels(userLang);
    int i = 0;
    if (false) {
    }
    else if (value.equals("left")) {
      i = 0;
    }
    else if (value.equals("center")) {
      i = 1;
    }
    else if (value.equals("right")) {
      i = 2;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return getAlignHLabel(value, channel.getLanguage());
  }

  public static String getAlignHLabel(String value) {
    String[] alignHLabels = getAlignHLabels();
    if (false) {
    }
    else if (value.equals("left")) {
      return alignHLabels[0];
    }
    else if (value.equals("center")) {
      return alignHLabels[1];
    }
    else if (value.equals("right")) {
      return alignHLabels[2];
    }
    return "???";
  }
  public static EnumerateFormReport getAlignHReport(SortedSet<AbstractParent> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (AbstractParent obj : set) {
      if (obj == null) {
        continue;
      }

      map.inc("" + obj.getAlignH());

      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }
  // ----------------------------------------------------------------------
  // alignV
  // ----------------------------------------------------------------------

  protected  String alignV = channel.getTypeFieldEntry(AbstractParent.class, "alignV", true).getDefaultTextString();

  @Override
public String getAlignV() { return alignV; }

  @Override
public void setAlignV(String v) { alignV = v; }



  public String getAlignV(String lang) { return alignV; }
  public String getAlignV(String lang, boolean useDefault) { return alignV; }
  private static String[] alignVValues;
  private static String[] alignVLabels;
  private static Map<String, String[]> alignVLabelsMap;

  public static String[] getAlignVValues() {
    if(alignVValues == null) {
      setAlignVValues(channel.getTypeFieldEntry(AbstractParent.class, "alignV", true).getEnumerateValues());
    }
    return alignVValues;
  }
  public static void setAlignVValues(String[] values) {
    alignVValues = values;
  }
  public static String[] getAlignVLabels() {
    if(alignVLabels == null) {
      setAlignVLabels(channel.getTypeFieldEntry(AbstractParent.class, "alignV", true).getEnumerateLabels());
    }
    return alignVLabels;
  }
  public static void setAlignVLabels(String[] labels) {
    alignVLabels = labels;
  }
  public static Map<String, String[]> getAlignVLabelsMap() {
    if(alignVLabelsMap == null) {
      setAlignVLabelsMap(channel.getTypeFieldEntry(AbstractParent.class, "alignV", true).getEnumerateLabelsMap());
    }
    return alignVLabelsMap;
  }
  public static void setAlignVLabelsMap(Map<String, String[]> LabelsMap) {
    alignVLabelsMap = LabelsMap;
  }
  public static String[] getAlignVLabels(String userLang) {
    Map<String, String[]> alignVLabelMap = getAlignVLabelsMap();
    String[] labels = alignVLabelMap.get(userLang);
    if (labels == null) {
      labels = alignVLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getAlignVLabel(String value, String userLang) {
    String[] labels = getAlignVLabels(userLang);
    int i = 0;
    if (false) {
    }
    else if (value.equals("middle")) {
      i = 0;
    }
    else if (value.equals("top")) {
      i = 1;
    }
    else if (value.equals("bottom")) {
      i = 2;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return getAlignVLabel(value, channel.getLanguage());
  }

  public static String getAlignVLabel(String value) {
    String[] alignVLabels = getAlignVLabels();
    if (false) {
    }
    else if (value.equals("middle")) {
      return alignVLabels[0];
    }
    else if (value.equals("top")) {
      return alignVLabels[1];
    }
    else if (value.equals("bottom")) {
      return alignVLabels[2];
    }
    return "???";
  }
  public static EnumerateFormReport getAlignVReport(SortedSet<AbstractParent> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (AbstractParent obj : set) {
      if (obj == null) {
        continue;
      }

      map.inc("" + obj.getAlignV());

      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }
  // ----------------------------------------------------------------------
  // alignTable
  // ----------------------------------------------------------------------

  protected  String alignTable = channel.getTypeFieldEntry(AbstractParent.class, "alignTable", true).getDefaultTextString();

  @Override
public String getAlignTable() { return alignTable; }

  @Override
public void setAlignTable(String v) { alignTable = v; }



  public String getAlignTable(String lang) { return alignTable; }
  public String getAlignTable(String lang, boolean useDefault) { return alignTable; }
  private static String[] alignTableValues;
  private static String[] alignTableLabels;
  private static Map<String, String[]> alignTableLabelsMap;

  public static String[] getAlignTableValues() {
    if(alignTableValues == null) {
      setAlignTableValues(channel.getTypeFieldEntry(AbstractParent.class, "alignTable", true).getEnumerateValues());
    }
    return alignTableValues;
  }
  public static void setAlignTableValues(String[] values) {
    alignTableValues = values;
  }
  public static String[] getAlignTableLabels() {
    if(alignTableLabels == null) {
      setAlignTableLabels(channel.getTypeFieldEntry(AbstractParent.class, "alignTable", true).getEnumerateLabels());
    }
    return alignTableLabels;
  }
  public static void setAlignTableLabels(String[] labels) {
    alignTableLabels = labels;
  }
  public static Map<String, String[]> getAlignTableLabelsMap() {
    if(alignTableLabelsMap == null) {
      setAlignTableLabelsMap(channel.getTypeFieldEntry(AbstractParent.class, "alignTable", true).getEnumerateLabelsMap());
    }
    return alignTableLabelsMap;
  }
  public static void setAlignTableLabelsMap(Map<String, String[]> LabelsMap) {
    alignTableLabelsMap = LabelsMap;
  }
  public static String[] getAlignTableLabels(String userLang) {
    Map<String, String[]> alignTableLabelMap = getAlignTableLabelsMap();
    String[] labels = alignTableLabelMap.get(userLang);
    if (labels == null) {
      labels = alignTableLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getAlignTableLabel(String value, String userLang) {
    String[] labels = getAlignTableLabels(userLang);
    int i = 0;
    if (false) {
    }
    else if (value.equals("")) {
      i = 0;
    }
    else if (value.equals("center")) {
      i = 1;
    }
    else if (value.equals("left")) {
      i = 2;
    }
    else if (value.equals("right")) {
      i = 3;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return getAlignTableLabel(value, channel.getLanguage());
  }

  public static String getAlignTableLabel(String value) {
    String[] alignTableLabels = getAlignTableLabels();
    if (false) {
    }
    else if (value.equals("")) {
      return alignTableLabels[0];
    }
    else if (value.equals("center")) {
      return alignTableLabels[1];
    }
    else if (value.equals("left")) {
      return alignTableLabels[2];
    }
    else if (value.equals("right")) {
      return alignTableLabels[3];
    }
    return "???";
  }
  public static EnumerateFormReport getAlignTableReport(SortedSet<AbstractParent> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (AbstractParent obj : set) {
      if (obj == null) {
        continue;
      }

      map.inc("" + obj.getAlignTable());

      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }
  // ----------------------------------------------------------------------
  // border
  // ----------------------------------------------------------------------

  protected  int border = 0;

  @Override
public int getBorder() { return border; }

  @Override
public void setBorder(int v) { border = v; }



  public static IntegerFormReport getBorderReport(SortedSet<AbstractParent> set) {
    long sum = 0;
    int min = Integer.MAX_VALUE;
    int max = Integer.MIN_VALUE;
    for (AbstractParent obj : set) {
      if (obj == null) {
        continue;
      }
      int value = obj.getBorder();
      sum += value;
      min = Math.min(value, min);
      max = Math.max(value, max);
    }
    return new IntegerFormReport(set.size(), sum, min, max);
  }
  // ----------------------------------------------------------------------
  // borderColor
  // ----------------------------------------------------------------------

  protected  String borderColor = channel.getTypeFieldEntry(AbstractParent.class, "borderColor", true).getDefaultTextString();

  @Override
public String getBorderColor() { return borderColor; }

  @Override
public void setBorderColor(String v) { borderColor = v; }



  public String getBorderColor(String lang) { return borderColor; }
  public String getBorderColor(String lang, boolean useDefault) { return borderColor; }
  // ----------------------------------------------------------------------
  // backColor
  // ----------------------------------------------------------------------

  protected  String backColor = channel.getTypeFieldEntry(AbstractParent.class, "backColor", true).getDefaultTextString();

  @Override
public String getBackColor() { return backColor; }

  @Override
public void setBackColor(String v) { backColor = v; }



  public String getBackColor(String lang) { return backColor; }
  public String getBackColor(String lang, boolean useDefault) { return backColor; }
  // ----------------------------------------------------------------------
  // backImage
  // ----------------------------------------------------------------------

  protected  String backImage = channel.getTypeFieldEntry(AbstractParent.class, "backImage", true).getDefaultTextString();

  @Override
public String getBackImage() { return backImage; }

  @Override
public void setBackImage(String v) { backImage = v; }



  public String getBackImage(String lang) { return backImage; }
  public String getBackImage(String lang, boolean useDefault) { return backImage; }
  // ----------------------------------------------------------------------
  // displayTitle
  // ----------------------------------------------------------------------

  protected  String displayTitle = channel.getTypeFieldEntry(AbstractParent.class, "displayTitle", true).getDefaultTextString();

  public String getDisplayTitle() { return displayTitle; }

  @Override
public void setDisplayTitle(String v) { displayTitle = v; }




  protected HashMap<String,String> displayTitleML = channel.getTypeFieldEntry(AbstractParent.class, "displayTitle", true).getDefaultTextMap();
  @Override
public String getDisplayTitle(String lang) { return channel.getLangValue(lang, true, displayTitle, displayTitleML, getMainLanguage()); }
  @Override
public String getDisplayTitle(String lang, boolean useDefault) { return channel.getLangValue(lang, useDefault, displayTitle, displayTitleML, getMainLanguage()); }
  @Override
public HashMap<String,String> getDisplayTitleML() { return displayTitleML; }
  @Override
public void setDisplayTitleML(HashMap<String,String> v) { displayTitleML = v; }

  public String getDisplayTitleMLE() {
    return JcmsUtil.encodeMLE(getDisplayTitleML());
  }

  public void setDisplayTitleMLE(String v) {
    setDisplayTitleML(JcmsUtil.decodeMLE(v));
  }

  public void setDisplayTitle(String lang, String value) {
    if (channel.getLanguage().equals(lang)) {
      displayTitle = value;
      return;
    }
    if (displayTitleML == null) {
      displayTitleML = new HashMap<>();
    } else if (this != channel.getData(id)) {
      displayTitleML = new HashMap<>(displayTitleML);
    }
    displayTitleML.put(lang, value);
  }
  // ----------------------------------------------------------------------
  // skins
  // ----------------------------------------------------------------------

  protected  String[] skins;

  @Override
public String[] getSkins() { return skins; }

  @Override
public void setSkins(String[] v) { skins = v; }



  public String[] getSkins(String lang) { return skins; }
  public String[] getSkins(String lang, boolean useDefault) { return skins; }
  // ----------------------------------------------------------------------
  // skinCSS
  // ----------------------------------------------------------------------

  protected  String skinCSS = channel.getTypeFieldEntry(AbstractParent.class, "skinCSS", true).getDefaultTextString();

  @Override
public String getSkinCSS() { return skinCSS; }

  @Override
public void setSkinCSS(String v) { skinCSS = v; }



  public String getSkinCSS(String lang) { return skinCSS; }
  public String getSkinCSS(String lang, boolean useDefault) { return skinCSS; }
  private static String[] skinCSSValues;
  private static String[] skinCSSLabels;
  private static Map<String, String[]> skinCSSLabelsMap;

  public static String[] getSkinCSSValues() {
    if(skinCSSValues == null) {
      setSkinCSSValues(channel.getTypeFieldEntry(AbstractParent.class, "skinCSS", true).getEnumerateValues());
    }
    return skinCSSValues;
  }
  public static void setSkinCSSValues(String[] values) {
    skinCSSValues = values;
  }
  public static String[] getSkinCSSLabels() {
    if(skinCSSLabels == null) {
      setSkinCSSLabels(channel.getTypeFieldEntry(AbstractParent.class, "skinCSS", true).getEnumerateLabels());
    }
    return skinCSSLabels;
  }
  public static void setSkinCSSLabels(String[] labels) {
    skinCSSLabels = labels;
  }
  public static Map<String, String[]> getSkinCSSLabelsMap() {
    if(skinCSSLabelsMap == null) {
      setSkinCSSLabelsMap(channel.getTypeFieldEntry(AbstractParent.class, "skinCSS", true).getEnumerateLabelsMap());
    }
    return skinCSSLabelsMap;
  }
  public static void setSkinCSSLabelsMap(Map<String, String[]> LabelsMap) {
    skinCSSLabelsMap = LabelsMap;
  }
  public static String[] getSkinCSSLabels(String userLang) {
    Map<String, String[]> skinCSSLabelMap = getSkinCSSLabelsMap();
    String[] labels = skinCSSLabelMap.get(userLang);
    if (labels == null) {
      labels = skinCSSLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getSkinCSSLabel(String value, String userLang) {
    String[] labels = getSkinCSSLabels(userLang);
    int i = 0;
    if (false) {
    }
    else if (value.equals("value1")) {
      i = 0;
    }
    else if (value.equals("value2")) {
      i = 1;
    }
    else if (value.equals("value3")) {
      i = 2;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return getSkinCSSLabel(value, channel.getLanguage());
  }

  public static String getSkinCSSLabel(String value) {
    String[] skinCSSLabels = getSkinCSSLabels();
    if (false) {
    }
    else if (value.equals("value1")) {
      return skinCSSLabels[0];
    }
    else if (value.equals("value2")) {
      return skinCSSLabels[1];
    }
    else if (value.equals("value3")) {
      return skinCSSLabels[2];
    }
    return "???";
  }
  public static EnumerateFormReport getSkinCSSReport(SortedSet<AbstractParent> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (AbstractParent obj : set) {
      if (obj == null) {
        continue;
      }

      map.inc("" + obj.getSkinCSS());

      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }
  // ----------------------------------------------------------------------
  // popupState
  // ----------------------------------------------------------------------

  protected  String popupState = channel.getTypeFieldEntry(AbstractParent.class, "popupState", true).getDefaultTextString();

  @Override
public String getPopupState() { return popupState; }

  @Override
public void setPopupState(String v) { popupState = v; }



  public String getPopupState(String lang) { return popupState; }
  public String getPopupState(String lang, boolean useDefault) { return popupState; }
  private static String[] popupStateValues;
  private static String[] popupStateLabels;
  private static Map<String, String[]> popupStateLabelsMap;

  public static String[] getPopupStateValues() {
    if(popupStateValues == null) {
      setPopupStateValues(channel.getTypeFieldEntry(AbstractParent.class, "popupState", true).getEnumerateValues());
    }
    return popupStateValues;
  }
  public static void setPopupStateValues(String[] values) {
    popupStateValues = values;
  }
  public static String[] getPopupStateLabels() {
    if(popupStateLabels == null) {
      setPopupStateLabels(channel.getTypeFieldEntry(AbstractParent.class, "popupState", true).getEnumerateLabels());
    }
    return popupStateLabels;
  }
  public static void setPopupStateLabels(String[] labels) {
    popupStateLabels = labels;
  }
  public static Map<String, String[]> getPopupStateLabelsMap() {
    if(popupStateLabelsMap == null) {
      setPopupStateLabelsMap(channel.getTypeFieldEntry(AbstractParent.class, "popupState", true).getEnumerateLabelsMap());
    }
    return popupStateLabelsMap;
  }
  public static void setPopupStateLabelsMap(Map<String, String[]> LabelsMap) {
    popupStateLabelsMap = LabelsMap;
  }
  public static String[] getPopupStateLabels(String userLang) {
    Map<String, String[]> popupStateLabelMap = getPopupStateLabelsMap();
    String[] labels = popupStateLabelMap.get(userLang);
    if (labels == null) {
      labels = popupStateLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getPopupStateLabel(String value, String userLang) {
    String[] labels = getPopupStateLabels(userLang);
    int i = 0;
    if (false) {
    }
    else if (value.equals("Hidden")) {
      i = 0;
    }
    else if (value.equals("Enable")) {
      i = 1;
    }
    else if (value.equals("Popup")) {
      i = 2;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return getPopupStateLabel(value, channel.getLanguage());
  }

  public static String getPopupStateLabel(String value) {
    String[] popupStateLabels = getPopupStateLabels();
    if (false) {
    }
    else if (value.equals("Hidden")) {
      return popupStateLabels[0];
    }
    else if (value.equals("Enable")) {
      return popupStateLabels[1];
    }
    else if (value.equals("Popup")) {
      return popupStateLabels[2];
    }
    return "???";
  }
  public static EnumerateFormReport getPopupStateReport(SortedSet<AbstractParent> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (AbstractParent obj : set) {
      if (obj == null) {
        continue;
      }

      map.inc("" + obj.getPopupState());

      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }
  // ----------------------------------------------------------------------
  // expandState
  // ----------------------------------------------------------------------

  protected  String expandState = channel.getTypeFieldEntry(AbstractParent.class, "expandState", true).getDefaultTextString();

  @Override
public String getExpandState() { return expandState; }

  @Override
public void setExpandState(String v) { expandState = v; }



  public String getExpandState(String lang) { return expandState; }
  public String getExpandState(String lang, boolean useDefault) { return expandState; }
  private static String[] expandStateValues;
  private static String[] expandStateLabels;
  private static Map<String, String[]> expandStateLabelsMap;

  public static String[] getExpandStateValues() {
    if(expandStateValues == null) {
      setExpandStateValues(channel.getTypeFieldEntry(AbstractParent.class, "expandState", true).getEnumerateValues());
    }
    return expandStateValues;
  }
  public static void setExpandStateValues(String[] values) {
    expandStateValues = values;
  }
  public static String[] getExpandStateLabels() {
    if(expandStateLabels == null) {
      setExpandStateLabels(channel.getTypeFieldEntry(AbstractParent.class, "expandState", true).getEnumerateLabels());
    }
    return expandStateLabels;
  }
  public static void setExpandStateLabels(String[] labels) {
    expandStateLabels = labels;
  }
  public static Map<String, String[]> getExpandStateLabelsMap() {
    if(expandStateLabelsMap == null) {
      setExpandStateLabelsMap(channel.getTypeFieldEntry(AbstractParent.class, "expandState", true).getEnumerateLabelsMap());
    }
    return expandStateLabelsMap;
  }
  public static void setExpandStateLabelsMap(Map<String, String[]> LabelsMap) {
    expandStateLabelsMap = LabelsMap;
  }
  public static String[] getExpandStateLabels(String userLang) {
    Map<String, String[]> expandStateLabelMap = getExpandStateLabelsMap();
    String[] labels = expandStateLabelMap.get(userLang);
    if (labels == null) {
      labels = expandStateLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getExpandStateLabel(String value, String userLang) {
    String[] labels = getExpandStateLabels(userLang);
    int i = 0;
    if (false) {
    }
    else if (value.equals("Enable")) {
      i = 0;
    }
    else if (value.equals("Hidden")) {
      i = 1;
    }
    else if (value.equals("Minimized")) {
      i = 2;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return getExpandStateLabel(value, channel.getLanguage());
  }

  public static String getExpandStateLabel(String value) {
    String[] expandStateLabels = getExpandStateLabels();
    if (false) {
    }
    else if (value.equals("Enable")) {
      return expandStateLabels[0];
    }
    else if (value.equals("Hidden")) {
      return expandStateLabels[1];
    }
    else if (value.equals("Minimized")) {
      return expandStateLabels[2];
    }
    return "???";
  }
  public static EnumerateFormReport getExpandStateReport(SortedSet<AbstractParent> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (AbstractParent obj : set) {
      if (obj == null) {
        continue;
      }

      map.inc("" + obj.getExpandState());

      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }
  // ----------------------------------------------------------------------
  // behaviorCopy
  // ----------------------------------------------------------------------

  protected  String behaviorCopy = channel.getTypeFieldEntry(AbstractParent.class, "behaviorCopy", true).getDefaultTextString();

  @Override
public String getBehaviorCopy() { return behaviorCopy; }

  @Override
public void setBehaviorCopy(String v) { behaviorCopy = v; }



  public String getBehaviorCopy(String lang) { return behaviorCopy; }
  public String getBehaviorCopy(String lang, boolean useDefault) { return behaviorCopy; }
  private static String[] behaviorCopyValues;
  private static String[] behaviorCopyLabels;
  private static Map<String, String[]> behaviorCopyLabelsMap;

  public static String[] getBehaviorCopyValues() {
    if(behaviorCopyValues == null) {
      setBehaviorCopyValues(channel.getTypeFieldEntry(AbstractParent.class, "behaviorCopy", true).getEnumerateValues());
    }
    return behaviorCopyValues;
  }
  public static void setBehaviorCopyValues(String[] values) {
    behaviorCopyValues = values;
  }
  public static String[] getBehaviorCopyLabels() {
    if(behaviorCopyLabels == null) {
      setBehaviorCopyLabels(channel.getTypeFieldEntry(AbstractParent.class, "behaviorCopy", true).getEnumerateLabels());
    }
    return behaviorCopyLabels;
  }
  public static void setBehaviorCopyLabels(String[] labels) {
    behaviorCopyLabels = labels;
  }
  public static Map<String, String[]> getBehaviorCopyLabelsMap() {
    if(behaviorCopyLabelsMap == null) {
      setBehaviorCopyLabelsMap(channel.getTypeFieldEntry(AbstractParent.class, "behaviorCopy", true).getEnumerateLabelsMap());
    }
    return behaviorCopyLabelsMap;
  }
  public static void setBehaviorCopyLabelsMap(Map<String, String[]> LabelsMap) {
    behaviorCopyLabelsMap = LabelsMap;
  }
  public static String[] getBehaviorCopyLabels(String userLang) {
    Map<String, String[]> behaviorCopyLabelMap = getBehaviorCopyLabelsMap();
    String[] labels = behaviorCopyLabelMap.get(userLang);
    if (labels == null) {
      labels = behaviorCopyLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getBehaviorCopyLabel(String value, String userLang) {
    String[] labels = getBehaviorCopyLabels(userLang);
    int i = 0;
    if (false) {
    }
    else if (value.equals("true")) {
      i = 0;
    }
    else if (value.equals("false")) {
      i = 1;
    }
    else if (value.equals("ws")) {
      i = 2;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return getBehaviorCopyLabel(value, channel.getLanguage());
  }

  public static String getBehaviorCopyLabel(String value) {
    String[] behaviorCopyLabels = getBehaviorCopyLabels();
    if (false) {
    }
    else if (value.equals("true")) {
      return behaviorCopyLabels[0];
    }
    else if (value.equals("false")) {
      return behaviorCopyLabels[1];
    }
    else if (value.equals("ws")) {
      return behaviorCopyLabels[2];
    }
    return "???";
  }
  public static EnumerateFormReport getBehaviorCopyReport(SortedSet<AbstractParent> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (AbstractParent obj : set) {
      if (obj == null) {
        continue;
      }

      map.inc("" + obj.getBehaviorCopy());

      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }
  // ----------------------------------------------------------------------
  // originalPortlet
  // ----------------------------------------------------------------------

  protected  com.jalios.jcms.portlet.PortalElement originalPortlet;

  public com.jalios.jcms.portlet.PortalElement getOriginalPortlet() { return originalPortlet; }

  public void setOriginalPortlet(com.jalios.jcms.portlet.PortalElement v) { originalPortlet = v; }



  // ----------------------------------------------------------------------
  // condition
  // ----------------------------------------------------------------------

  protected  String[] condition;

  @Override
public String[] getCondition() { return condition; }

  @Override
public void setCondition(String[] v) { condition = v; }



  public String[] getCondition(String lang) { return condition; }
  public String[] getCondition(String lang, boolean useDefault) { return condition; }
  private static String[] conditionValues;
  private static String[] conditionLabels;
  private static Map<String, String[]> conditionLabelsMap;

  public static String[] getConditionValues() {
    if(conditionValues == null) {
      setConditionValues(channel.getTypeFieldEntry(AbstractParent.class, "condition", true).getEnumerateValues());
    }
    return conditionValues;
  }
  public static void setConditionValues(String[] values) {
    conditionValues = values;
  }
  public static String[] getConditionLabels() {
    if(conditionLabels == null) {
      setConditionLabels(channel.getTypeFieldEntry(AbstractParent.class, "condition", true).getEnumerateLabels());
    }
    return conditionLabels;
  }
  public static void setConditionLabels(String[] labels) {
    conditionLabels = labels;
  }
  public static Map<String, String[]> getConditionLabelsMap() {
    if(conditionLabelsMap == null) {
      setConditionLabelsMap(channel.getTypeFieldEntry(AbstractParent.class, "condition", true).getEnumerateLabelsMap());
    }
    return conditionLabelsMap;
  }
  public static void setConditionLabelsMap(Map<String, String[]> LabelsMap) {
    conditionLabelsMap = LabelsMap;
  }
  public static String[] getConditionLabels(String userLang) {
    Map<String, String[]> conditionLabelMap = getConditionLabelsMap();
    String[] labels = conditionLabelMap.get(userLang);
    if (labels == null) {
      labels = conditionLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getConditionLabel(String value, String userLang) {
    String[] labels = getConditionLabels(userLang);
    int i = 0;
    if (false) {
    }
    else if (value.equals("None")) {
      i = 0;
    }
    else if (value.equals("isLogged")) {
      i = 1;
    }
    else if (value.equals("notLogged")) {
      i = 2;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return getConditionLabel(value, channel.getLanguage());
  }

  public static String getConditionLabel(String value) {
    String[] conditionLabels = getConditionLabels();
    if (false) {
    }
    else if (value.equals("None")) {
      return conditionLabels[0];
    }
    else if (value.equals("isLogged")) {
      return conditionLabels[1];
    }
    else if (value.equals("notLogged")) {
      return conditionLabels[2];
    }
    return "???";
  }
  public static EnumerateFormReport getConditionReport(SortedSet<AbstractParent> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (AbstractParent obj : set) {
      if (obj == null || obj.getCondition() == null) {
        continue;
      }
      for(int i = 0; i < obj.getCondition().length; i++) {
        if (obj.getCondition()[i] != null) {
          map.inc(obj.getCondition()[i]);
        }
      }
      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }
  // ----------------------------------------------------------------------
  // cssId
  // ----------------------------------------------------------------------

  protected  String cssId = channel.getTypeFieldEntry(AbstractParent.class, "cssId", true).getDefaultTextString();

  @Override
public String getCssId() { return cssId; }

  @Override
public void setCssId(String v) { cssId = v; }



  public String getCssId(String lang) { return cssId; }
  public String getCssId(String lang, boolean useDefault) { return cssId; }
  // ----------------------------------------------------------------------
  // cssClasses
  // ----------------------------------------------------------------------

  protected  String cssClasses = channel.getTypeFieldEntry(AbstractParent.class, "cssClasses", true).getDefaultTextString();

  @Override
public String getCssClasses() { return cssClasses; }

  @Override
public void setCssClasses(String v) { cssClasses = v; }



  public String getCssClasses(String lang) { return cssClasses; }
  public String getCssClasses(String lang, boolean useDefault) { return cssClasses; }
  // ----------------------------------------------------------------------
  // skinClasses
  // ----------------------------------------------------------------------

  protected  String skinClasses = channel.getTypeFieldEntry(AbstractParent.class, "skinClasses", true).getDefaultTextString();

  @Override
public String getSkinClasses() { return skinClasses; }

  @Override
public void setSkinClasses(String v) { skinClasses = v; }



  public String getSkinClasses(String lang) { return skinClasses; }
  public String getSkinClasses(String lang, boolean useDefault) { return skinClasses; }
  // ----------------------------------------------------------------------
  // skinFooter
  // ----------------------------------------------------------------------

  protected  String skinFooter = channel.getTypeFieldEntry(AbstractParent.class, "skinFooter", true).getDefaultTextString();

  public String getSkinFooter() { return skinFooter; }

  public void setSkinFooter(String v) { skinFooter = v; }




  protected HashMap<String,String> skinFooterML = channel.getTypeFieldEntry(AbstractParent.class, "skinFooter", true).getDefaultTextMap();
  public String getSkinFooter(String lang) { return channel.getLangValue(lang, true, skinFooter, skinFooterML, getMainLanguage()); }
  public String getSkinFooter(String lang, boolean useDefault) { return channel.getLangValue(lang, useDefault, skinFooter, skinFooterML, getMainLanguage()); }
  public HashMap<String,String> getSkinFooterML() { return skinFooterML; }
  public void setSkinFooterML(HashMap<String,String> v) { skinFooterML = v; }

  public String getSkinFooterMLE() {
    return JcmsUtil.encodeMLE(getSkinFooterML());
  }

  public void setSkinFooterMLE(String v) {
    setSkinFooterML(JcmsUtil.decodeMLE(v));
  }

  public void setSkinFooter(String lang, String value) {
    if (channel.getLanguage().equals(lang)) {
      skinFooter = value;
      return;
    }
    if (skinFooterML == null) {
      skinFooterML = new HashMap<>();
    } else if (this != channel.getData(id)) {
      skinFooterML = new HashMap<>(skinFooterML);
    }
    skinFooterML.put(lang, value);
  }
  // ----------------------------------------------------------------------
  // skinHeaderIcon
  // ----------------------------------------------------------------------

  protected  String skinHeaderIcon = channel.getTypeFieldEntry(AbstractParent.class, "skinHeaderIcon", true).getDefaultTextString();

  @Override
public String getSkinHeaderIcon() { return skinHeaderIcon; }

  @Override
public void setSkinHeaderIcon(String v) { skinHeaderIcon = v; }



  public String getSkinHeaderIcon(String lang) { return skinHeaderIcon; }
  public String getSkinHeaderIcon(String lang, boolean useDefault) { return skinHeaderIcon; }
  // ----------------------------------------------------------------------
  // skinHeaderIconColor
  // ----------------------------------------------------------------------

  protected  String skinHeaderIconColor = channel.getTypeFieldEntry(AbstractParent.class, "skinHeaderIconColor", true).getDefaultTextString();

  @Override
public String getSkinHeaderIconColor() { return skinHeaderIconColor; }

  @Override
public void setSkinHeaderIconColor(String v) { skinHeaderIconColor = v; }



  public String getSkinHeaderIconColor(String lang) { return skinHeaderIconColor; }
  public String getSkinHeaderIconColor(String lang, boolean useDefault) { return skinHeaderIconColor; }
  // ----------------------------------------------------------------------
  // skinFooterButtonLabel
  // ----------------------------------------------------------------------

  protected  String skinFooterButtonLabel = channel.getTypeFieldEntry(AbstractParent.class, "skinFooterButtonLabel", true).getDefaultTextString();

  public String getSkinFooterButtonLabel() { return skinFooterButtonLabel; }

  public void setSkinFooterButtonLabel(String v) { skinFooterButtonLabel = v; }




  protected HashMap<String,String> skinFooterButtonLabelML = channel.getTypeFieldEntry(AbstractParent.class, "skinFooterButtonLabel", true).getDefaultTextMap();
  public String getSkinFooterButtonLabel(String lang) { return channel.getLangValue(lang, true, skinFooterButtonLabel, skinFooterButtonLabelML, getMainLanguage()); }
  public String getSkinFooterButtonLabel(String lang, boolean useDefault) { return channel.getLangValue(lang, useDefault, skinFooterButtonLabel, skinFooterButtonLabelML, getMainLanguage()); }
  public HashMap<String,String> getSkinFooterButtonLabelML() { return skinFooterButtonLabelML; }
  @Override
public void setSkinFooterButtonLabelML(HashMap<String,String> v) { skinFooterButtonLabelML = v; }

  public String getSkinFooterButtonLabelMLE() {
    return JcmsUtil.encodeMLE(getSkinFooterButtonLabelML());
  }

  public void setSkinFooterButtonLabelMLE(String v) {
    setSkinFooterButtonLabelML(JcmsUtil.decodeMLE(v));
  }

  @Override
public void setSkinFooterButtonLabel(String lang, String value) {
    if (channel.getLanguage().equals(lang)) {
      skinFooterButtonLabel = value;
      return;
    }
    if (skinFooterButtonLabelML == null) {
      skinFooterButtonLabelML = new HashMap<>();
    } else if (this != channel.getData(id)) {
      skinFooterButtonLabelML = new HashMap<>(skinFooterButtonLabelML);
    }
    skinFooterButtonLabelML.put(lang, value);
  }
  // ----------------------------------------------------------------------
  // skinFooterButtonLink
  // ----------------------------------------------------------------------

  protected  String skinFooterButtonLink = channel.getTypeFieldEntry(AbstractParent.class, "skinFooterButtonLink", true).getDefaultTextString();

  @Override
public String getSkinFooterButtonLink() { return skinFooterButtonLink; }

  @Override
public void setSkinFooterButtonLink(String v) { skinFooterButtonLink = v; }



  public String getSkinFooterButtonLink(String lang) { return skinFooterButtonLink; }
  public String getSkinFooterButtonLink(String lang, boolean useDefault) { return skinFooterButtonLink; }
  // ----------------------------------------------------------------------
  // skinFooterButtonAlign
  // ----------------------------------------------------------------------

  protected  String skinFooterButtonAlign = channel.getTypeFieldEntry(AbstractParent.class, "skinFooterButtonAlign", true).getDefaultTextString();

  @Override
public String getSkinFooterButtonAlign() { return skinFooterButtonAlign; }

  @Override
public void setSkinFooterButtonAlign(String v) { skinFooterButtonAlign = v; }



  public String getSkinFooterButtonAlign(String lang) { return skinFooterButtonAlign; }
  public String getSkinFooterButtonAlign(String lang, boolean useDefault) { return skinFooterButtonAlign; }
  private static String[] skinFooterButtonAlignValues;
  private static String[] skinFooterButtonAlignLabels;
  private static Map<String, String[]> skinFooterButtonAlignLabelsMap;

  public static String[] getSkinFooterButtonAlignValues() {
    if(skinFooterButtonAlignValues == null) {
      setSkinFooterButtonAlignValues(channel.getTypeFieldEntry(AbstractParent.class, "skinFooterButtonAlign", true).getEnumerateValues());
    }
    return skinFooterButtonAlignValues;
  }
  public static void setSkinFooterButtonAlignValues(String[] values) {
    skinFooterButtonAlignValues = values;
  }
  public static String[] getSkinFooterButtonAlignLabels() {
    if(skinFooterButtonAlignLabels == null) {
      setSkinFooterButtonAlignLabels(channel.getTypeFieldEntry(AbstractParent.class, "skinFooterButtonAlign", true).getEnumerateLabels());
    }
    return skinFooterButtonAlignLabels;
  }
  public static void setSkinFooterButtonAlignLabels(String[] labels) {
    skinFooterButtonAlignLabels = labels;
  }
  public static Map<String, String[]> getSkinFooterButtonAlignLabelsMap() {
    if(skinFooterButtonAlignLabelsMap == null) {
      setSkinFooterButtonAlignLabelsMap(channel.getTypeFieldEntry(AbstractParent.class, "skinFooterButtonAlign", true).getEnumerateLabelsMap());
    }
    return skinFooterButtonAlignLabelsMap;
  }
  public static void setSkinFooterButtonAlignLabelsMap(Map<String, String[]> LabelsMap) {
    skinFooterButtonAlignLabelsMap = LabelsMap;
  }
  public static String[] getSkinFooterButtonAlignLabels(String userLang) {
    Map<String, String[]> skinFooterButtonAlignLabelMap = getSkinFooterButtonAlignLabelsMap();
    String[] labels = skinFooterButtonAlignLabelMap.get(userLang);
    if (labels == null) {
      labels = skinFooterButtonAlignLabelMap.get(channel.getLanguage());
    }
    return labels;
  }
  public static String getSkinFooterButtonAlignLabel(String value, String userLang) {
    String[] labels = getSkinFooterButtonAlignLabels(userLang);
    int i = 0;
    if (false) {
    }
    else if (value.equals("centered")) {
      i = 0;
    }
    else if (value.equals("left")) {
      i = 1;
    }
    else if (value.equals("right")) {
      i = 2;
    }
    else {
      return "???";
    }
    if (i < labels.length) {
      return labels[i];
    }
    return getSkinFooterButtonAlignLabel(value, channel.getLanguage());
  }

  public static String getSkinFooterButtonAlignLabel(String value) {
    String[] skinFooterButtonAlignLabels = getSkinFooterButtonAlignLabels();
    if (false) {
    }
    else if (value.equals("centered")) {
      return skinFooterButtonAlignLabels[0];
    }
    else if (value.equals("left")) {
      return skinFooterButtonAlignLabels[1];
    }
    else if (value.equals("right")) {
      return skinFooterButtonAlignLabels[2];
    }
    return "???";
  }
  public static EnumerateFormReport getSkinFooterButtonAlignReport(SortedSet<AbstractParent> set) {
    long sum = 0;
    ObjectIntTreeMap map = new ObjectIntTreeMap();
    for (AbstractParent obj : set) {
      if (obj == null) {
        continue;
      }

      map.inc("" + obj.getSkinFooterButtonAlign());

      sum++;
    }
    return new EnumerateFormReport(map, sum);
  }
  // ----------------------------------------------------------------------
  // skinHeaderButtonLabel
  // ----------------------------------------------------------------------

  protected  String skinHeaderButtonLabel = channel.getTypeFieldEntry(AbstractParent.class, "skinHeaderButtonLabel", true).getDefaultTextString();

  @Override
public String getSkinHeaderButtonLabel() { return skinHeaderButtonLabel; }

  public void setSkinHeaderButtonLabel(String v) { skinHeaderButtonLabel = v; }




  protected HashMap<String,String> skinHeaderButtonLabelML = channel.getTypeFieldEntry(AbstractParent.class, "skinHeaderButtonLabel", true).getDefaultTextMap();
  public String getSkinHeaderButtonLabel(String lang) { return channel.getLangValue(lang, true, skinHeaderButtonLabel, skinHeaderButtonLabelML, getMainLanguage()); }
  @Override
public String getSkinHeaderButtonLabel(String lang, boolean useDefault) { return channel.getLangValue(lang, useDefault, skinHeaderButtonLabel, skinHeaderButtonLabelML, getMainLanguage()); }
  @Override
public HashMap<String,String> getSkinHeaderButtonLabelML() { return skinHeaderButtonLabelML; }
  @Override
public void setSkinHeaderButtonLabelML(HashMap<String,String> v) { skinHeaderButtonLabelML = v; }

  public String getSkinHeaderButtonLabelMLE() {
    return JcmsUtil.encodeMLE(getSkinHeaderButtonLabelML());
  }

  public void setSkinHeaderButtonLabelMLE(String v) {
    setSkinHeaderButtonLabelML(JcmsUtil.decodeMLE(v));
  }

  @Override
public void setSkinHeaderButtonLabel(String lang, String value) {
    if (channel.getLanguage().equals(lang)) {
      skinHeaderButtonLabel = value;
      return;
    }
    if (skinHeaderButtonLabelML == null) {
      skinHeaderButtonLabelML = new HashMap<>();
    } else if (this != channel.getData(id)) {
      skinHeaderButtonLabelML = new HashMap<>(skinHeaderButtonLabelML);
    }
    skinHeaderButtonLabelML.put(lang, value);
  }
  // ----------------------------------------------------------------------
  // skinHeaderButtonLink
  // ----------------------------------------------------------------------

  protected  String skinHeaderButtonLink = channel.getTypeFieldEntry(AbstractParent.class, "skinHeaderButtonLink", true).getDefaultTextString();

  @Override
public String getSkinHeaderButtonLink() { return skinHeaderButtonLink; }

  @Override
public void setSkinHeaderButtonLink(String v) { skinHeaderButtonLink = v; }



  public String getSkinHeaderButtonLink(String lang) { return skinHeaderButtonLink; }
  public String getSkinHeaderButtonLink(String lang, boolean useDefault) { return skinHeaderButtonLink; }
  // ----------------------------------------------------------------------
  // skinHeaderSubText
  // ----------------------------------------------------------------------

  protected  String skinHeaderSubText = channel.getTypeFieldEntry(AbstractParent.class, "skinHeaderSubText", true).getDefaultTextString();

  @Override
public String getSkinHeaderSubText() { return skinHeaderSubText; }

  @Override
public void setSkinHeaderSubText(String v) { skinHeaderSubText = v; }




  protected HashMap<String,String> skinHeaderSubTextML = channel.getTypeFieldEntry(AbstractParent.class, "skinHeaderSubText", true).getDefaultTextMap();
  @Override
public String getSkinHeaderSubText(String lang) { return channel.getLangValue(lang, true, skinHeaderSubText, skinHeaderSubTextML, getMainLanguage()); }
  @Override
public String getSkinHeaderSubText(String lang, boolean useDefault) { return channel.getLangValue(lang, useDefault, skinHeaderSubText, skinHeaderSubTextML, getMainLanguage()); }
  @Override
public HashMap<String,String> getSkinHeaderSubTextML() { return skinHeaderSubTextML; }
  @Override
public void setSkinHeaderSubTextML(HashMap<String,String> v) { skinHeaderSubTextML = v; }

  @Override
public String getSkinHeaderSubTextMLE() {
    return JcmsUtil.encodeMLE(getSkinHeaderSubTextML());
  }

  @Override
public void setSkinHeaderSubTextMLE(String v) {
    setSkinHeaderSubTextML(JcmsUtil.decodeMLE(v));
  }

  @Override
public void setSkinHeaderSubText(String lang, String value) {
    if (channel.getLanguage().equals(lang)) {
      skinHeaderSubText = value;
      return;
    }
    if (skinHeaderSubTextML == null) {
      skinHeaderSubTextML = new HashMap<>();
    } else if (this != channel.getData(id)) {
      skinHeaderSubTextML = new HashMap<>(skinHeaderSubTextML);
    }
    skinHeaderSubTextML.put(lang, value);
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
    sb.ensureCapacity(500 * (0 + 5 + 0 + 0 + 0 + 0) );
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
    if (displayTitle != null) {
      sb.append(displayTitle); sb.append(' ');
    }
    if (displayTitleML != null) {
      for (String str : displayTitleML.values()) {
        if (str != null) {
          sb.append(str); sb.append(' ');
        }
      }
    }
    if (portletImage != null) {
      sb.append(portletImage); sb.append(' ');
    }
    if (portletImageML != null) {
      for (String str : portletImageML.values()) {
        if (str != null) {
          sb.append(str); sb.append(' ');
        }
      }
    }
    if (skinFooter != null) {
      sb.append(skinFooter); sb.append(' ');
    }
    if (skinFooterML != null) {
      for (String str : skinFooterML.values()) {
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
    if (description != null && !JHTMLUtils.isJHTML(null, description)) {
      sb.append(description); sb.append(' ');
    }
    if (descriptionML != null) {
      for (String str : descriptionML.values()) {
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
    sb.ensureCapacity(500 * (0 + 1 + 0 + 0 + 0 + 0) );
    // Wiki fields containing JHTML
    if (description != null && JHTMLUtils.isJHTML(null, description)) {
      sb.append(description); sb.append(' ');
    }
    if (descriptionML != null) {
      for (String str : descriptionML.values()) {
        if (str != null && JHTMLUtils.isJHTML(null, str)) {
          sb.append(str); sb.append(' ');
        }
      }
    }
   // Wysiwyg fields
    if (skinFooter != null) {
      sb.append(skinFooter); sb.append(' ');
    }
    if (skinFooterML != null) {
      for (String str : skinFooterML.values()) {
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
    JcmsUtil.addData(set, clazz, getChild());
    JcmsUtil.addData(set, clazz, getOriginalPortlet());
    return set;
  }
  // ----------------------------------------------------------------------
  // DataController
  // ----------------------------------------------------------------------
  static Pattern _widthPattern;
  static {
    try {
      _widthPattern = (new Perl5Compiler()).compile("[\\d]+\\s*(pt|pc|in|mm|cm|px|em|ex|%)*", Perl5Compiler.CASE_INSENSITIVE_MASK);
    }
    catch(org.apache.oro.text.regex.MalformedPatternException ex) {
      // Empty
    }
  }

  public boolean checkPatternWidth() {
    if (Util.notEmpty(width) && !(new Perl5Matcher()).matches(width, _widthPattern)) {
      return false;
    }
    return true;
  }

  public ControllerStatus checkHtmlSkinFooter() {
    ControllerStatus status = JcmsUtil.checkHtml(skinFooter, channel.getTypeFieldLabel(this, "skinFooter"));
    if (status.hasFailed()) {
      return status;
    }
    status = JcmsUtil.checkHtml(skinFooterML, channel.getTypeFieldLabel(this, "skinFooter"));
    if (status.hasFailed()) {
      return status;
    }
    return ControllerStatus.OK;
  }

  @Override
public ControllerStatus checkIntegrity() {

    ControllerStatus status = super.checkIntegrity();
    if (status.hasFailed()) {
      return status;
    }

    if (!checkPatternWidth()) {
      status = new ControllerStatus();
      status.setProp("msg.edit.bad-field-format", channel.getTypeFieldLabel(this, "width"), "[\\d]+\\s*(pt|pc|in|mm|cm|px|em|ex|%)*");
      return status;
    }
    if (insetLeft < 0 ) {
      status = new ControllerStatus();
      status.setProp("msg.edit.lesser-number", channel.getTypeFieldLabel(this, "insetLeft"), "0");
      return status;
    }
    if (insetLeft > 1000 ) {
      status = new ControllerStatus();
      status.setProp("msg.edit.greater-number", channel.getTypeFieldLabel(this, "insetLeft"), "1000");
      return status;
    }
    if (insetRight < 0 ) {
      status = new ControllerStatus();
      status.setProp("msg.edit.lesser-number", channel.getTypeFieldLabel(this, "insetRight"), "0");
      return status;
    }
    if (insetRight > 1000 ) {
      status = new ControllerStatus();
      status.setProp("msg.edit.greater-number", channel.getTypeFieldLabel(this, "insetRight"), "1000");
      return status;
    }
    if (insetTop < 0 ) {
      status = new ControllerStatus();
      status.setProp("msg.edit.lesser-number", channel.getTypeFieldLabel(this, "insetTop"), "0");
      return status;
    }
    if (insetTop > 1000 ) {
      status = new ControllerStatus();
      status.setProp("msg.edit.greater-number", channel.getTypeFieldLabel(this, "insetTop"), "1000");
      return status;
    }
    if (insetBottom < 0 ) {
      status = new ControllerStatus();
      status.setProp("msg.edit.lesser-number", channel.getTypeFieldLabel(this, "insetBottom"), "0");
      return status;
    }
    if (insetBottom > 1000 ) {
      status = new ControllerStatus();
      status.setProp("msg.edit.greater-number", channel.getTypeFieldLabel(this, "insetBottom"), "1000");
      return status;
    }
    if (cellPadding < 0 ) {
      status = new ControllerStatus();
      status.setProp("msg.edit.lesser-number", channel.getTypeFieldLabel(this, "cellPadding"), "0");
      return status;
    }
    if (cellPadding > 1000 ) {
      status = new ControllerStatus();
      status.setProp("msg.edit.greater-number", channel.getTypeFieldLabel(this, "cellPadding"), "1000");
      return status;
    }
    if (border < 0 ) {
      status = new ControllerStatus();
      status.setProp("msg.edit.lesser-number", channel.getTypeFieldLabel(this, "border"), "0");
      return status;
    }
    if (border > 100 ) {
      status = new ControllerStatus();
      status.setProp("msg.edit.greater-number", channel.getTypeFieldLabel(this, "border"), "100");
      return status;
    }
    status = checkHtmlSkinFooter();
    if (status.hasFailed()) {
      return status;
    }
    if (!Util.isValidUrl(skinFooterButtonLink)) {
      status = new ControllerStatus();
      status.setProp("msg.edit.bad-url", channel.getTypeFieldLabel(this, "skinFooterButtonLink"));
      return status;
    }
    if (!Util.isValidUrl(skinHeaderButtonLink)) {
      status = new ControllerStatus();
      status.setProp("msg.edit.bad-url", channel.getTypeFieldLabel(this, "skinHeaderButtonLink"));
      return status;
    }
    return ControllerStatus.OK;
  }

  @Override
public Set<String> getExternalLinkSet() {
    Set<String> set = super.getExternalLinkSet();

    if (Util.notEmpty(skinFooterButtonLink)) {
      set.add(skinFooterButtonLink);
    }

    if (Util.notEmpty(skinHeaderButtonLink)) {
      set.add(skinHeaderButtonLink);
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
    ((AbstractParent)mergeCopy).setChild(getChild());
    ((AbstractParent)mergeCopy).setDescription(getDescription());
    ((AbstractParent)mergeCopy).setDescriptionML(JcmsUtil.getMergedMLMap(getDescriptionML(), ((AbstractParent)mergeCopy).getDescriptionML()));
    ((AbstractParent)mergeCopy).setPortletImage(getPortletImage());
    ((AbstractParent)mergeCopy).setPortletImageML(JcmsUtil.getMergedMLMap(getPortletImageML(), ((AbstractParent)mergeCopy).getPortletImageML()));
    ((AbstractParent)mergeCopy).setCacheType(getCacheType());
    ((AbstractParent)mergeCopy).setCacheSensibility(getCacheSensibility());
    ((AbstractParent)mergeCopy).setInvalidClass(getInvalidClass());
    ((AbstractParent)mergeCopy).setInvalidTime(getInvalidTime());
    ((AbstractParent)mergeCopy).setDisplayCSS(getDisplayCSS());
    ((AbstractParent)mergeCopy).setWidth(getWidth());
    ((AbstractParent)mergeCopy).setInsetLeft(getInsetLeft());
    ((AbstractParent)mergeCopy).setInsetRight(getInsetRight());
    ((AbstractParent)mergeCopy).setInsetTop(getInsetTop());
    ((AbstractParent)mergeCopy).setInsetBottom(getInsetBottom());
    ((AbstractParent)mergeCopy).setCellPadding(getCellPadding());
    ((AbstractParent)mergeCopy).setAlignH(getAlignH());
    ((AbstractParent)mergeCopy).setAlignV(getAlignV());
    ((AbstractParent)mergeCopy).setAlignTable(getAlignTable());
    ((AbstractParent)mergeCopy).setBorder(getBorder());
    ((AbstractParent)mergeCopy).setBorderColor(getBorderColor());
    ((AbstractParent)mergeCopy).setBackColor(getBackColor());
    ((AbstractParent)mergeCopy).setBackImage(getBackImage());
    ((AbstractParent)mergeCopy).setDisplayTitle(getDisplayTitle());
    ((AbstractParent)mergeCopy).setDisplayTitleML(JcmsUtil.getMergedMLMap(getDisplayTitleML(), ((AbstractParent)mergeCopy).getDisplayTitleML()));
    ((AbstractParent)mergeCopy).setSkins(getSkins());
    ((AbstractParent)mergeCopy).setSkinCSS(getSkinCSS());
    ((AbstractParent)mergeCopy).setPopupState(getPopupState());
    ((AbstractParent)mergeCopy).setExpandState(getExpandState());
    ((AbstractParent)mergeCopy).setBehaviorCopy(getBehaviorCopy());
    ((AbstractParent)mergeCopy).setOriginalPortlet(getOriginalPortlet());
    ((AbstractParent)mergeCopy).setCondition(getCondition());
    ((AbstractParent)mergeCopy).setCssId(getCssId());
    ((AbstractParent)mergeCopy).setCssClasses(getCssClasses());
    ((AbstractParent)mergeCopy).setSkinClasses(getSkinClasses());
    ((AbstractParent)mergeCopy).setSkinFooter(getSkinFooter());
    ((AbstractParent)mergeCopy).setSkinFooterML(JcmsUtil.getMergedMLMap(getSkinFooterML(), ((AbstractParent)mergeCopy).getSkinFooterML()));
    ((AbstractParent)mergeCopy).setSkinHeaderIcon(getSkinHeaderIcon());
    ((AbstractParent)mergeCopy).setSkinHeaderIconColor(getSkinHeaderIconColor());
    ((AbstractParent)mergeCopy).setSkinFooterButtonLabel(getSkinFooterButtonLabel());
    ((AbstractParent)mergeCopy).setSkinFooterButtonLabelML(JcmsUtil.getMergedMLMap(getSkinFooterButtonLabelML(), ((AbstractParent)mergeCopy).getSkinFooterButtonLabelML()));
    ((AbstractParent)mergeCopy).setSkinFooterButtonLink(getSkinFooterButtonLink());
    ((AbstractParent)mergeCopy).setSkinFooterButtonAlign(getSkinFooterButtonAlign());
    ((AbstractParent)mergeCopy).setSkinHeaderButtonLabel(getSkinHeaderButtonLabel());
    ((AbstractParent)mergeCopy).setSkinHeaderButtonLabelML(JcmsUtil.getMergedMLMap(getSkinHeaderButtonLabelML(), ((AbstractParent)mergeCopy).getSkinHeaderButtonLabelML()));
    ((AbstractParent)mergeCopy).setSkinHeaderButtonLink(getSkinHeaderButtonLink());
    ((AbstractParent)mergeCopy).setSkinHeaderSubText(getSkinHeaderSubText());
    ((AbstractParent)mergeCopy).setSkinHeaderSubTextML(JcmsUtil.getMergedMLMap(getSkinHeaderSubTextML(), ((AbstractParent)mergeCopy).getSkinHeaderSubTextML()));
  }
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// tRniRHk9rDBJJr8qoMk5Wg==
