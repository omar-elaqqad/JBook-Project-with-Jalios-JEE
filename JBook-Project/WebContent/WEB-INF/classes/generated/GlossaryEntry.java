// This file has been automatically generated.

package generated;

import java.util.Collection;
import java.util.HashMap;
import java.util.Set;
import java.util.TreeSet;

import com.jalios.jcms.Category;
import com.jalios.jcms.ControllerStatus;
import com.jalios.jcms.Data;
import com.jalios.jcms.FileDocument;
import com.jalios.jcms.JcmsUtil;
import com.jalios.jcms.Member;
import com.jalios.jcms.Publication;
import com.jalios.jcms.TypeEntry;
import com.jalios.jcms.TypeFieldEntry;
import com.jalios.jcms.mashup.ExportUtil;
import com.jalios.jcms.mashup.ImportOptions;
import com.jalios.jcms.mashup.ImportUtil;
import com.jalios.jcms.wysiwyg.JHTMLUtils;
import com.jalios.util.TreeNode;
import com.jalios.util.Util;

@SuppressWarnings({"unchecked", "unused"})
public  class GlossaryEntry extends com.jalios.jcms.Content
             implements
                com.jalios.jstore.Searchable
               , TreeNode
{

  // ----------------------------------------------------------------------
  // CONSTRUCTORS
  // ----------------------------------------------------------------------
  public GlossaryEntry() {}






  public GlossaryEntry(GlossaryEntry other) {
    super(other);
    definition = other.definition;
    definitionML = other.definitionML;
    seeAlso = other.seeAlso;
    glossary = other.glossary;
  }

  // ----------------------------------------------------------------------
  // Import / Export
  // ----------------------------------------------------------------------
  @Override
public void importXml(org.jdom.Element elt, ImportOptions options) {
    super.importXml(elt, options);

  }

  @Override
protected void importXmlFieldsWithReferences(org.jdom.Element elt, ImportOptions options) {
    super.importXmlFieldsWithReferences(elt, options);

    if (options.isSelfImport()) {
      setDefinition(ImportUtil.parseFieldText(elt, "definition"));
      setDefinitionML(ImportUtil.parseFieldTextML(elt, "definitionML"));
      setSeeAlso(ImportUtil.parseSelfFieldDataArray(elt, "seeAlso", generated.GlossaryEntry.class));
      setGlossary(ImportUtil.parseSelfFieldData(elt, "glossary", generated.Glossary.class));
    } else {

    setDefinitionML(ImportUtil.parseFieldWikiML(elt, "definitionML"));
    setDefinition(ImportUtil.parseFieldWiki(elt, "definition"));
    setSeeAlso((generated.GlossaryEntry[])ImportUtil.parseFieldDataArray(elt, "seeAlso", generated.GlossaryEntry.class));
    setGlossary((generated.Glossary)ImportUtil.parseFieldData(elt, "glossary"));
    }
  }

  @Override
public void exportXmlField(StringBuffer sb, int indentLevel) {
    super.exportXmlField(sb, indentLevel);
    sb.append(ExportUtil.exportField(indentLevel, "definition", getDefinition(), "definitionML", true, true));
    sb.append(ExportUtil.exportField(indentLevel, "definitionML", getDefinitionML(), true));
    sb.append(ExportUtil.exportField(indentLevel, "seeAlso", getSeeAlso()));
    sb.append(ExportUtil.exportField(indentLevel, "glossary", getGlossary()));
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
   * Returns the TypeEntry bound to <code>GlossaryEntry</code>. <br>
   * @see com.jalios.jcms.Channel#getTypeEntry(Class)
   * @since jcms-5.5
   */
  public static TypeEntry getTypeEntry() {
    return channel.getTypeEntry(GlossaryEntry.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>GlossaryEntry</code>. <br>
   * This array <strong>does not</strong> contain inherited TypeFieldEntry from super classes of <code>GlossaryEntry</code>. <br/>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>GlossaryEntry</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getTypeFieldEntries() {
    return channel.getTypeFieldEntries(GlossaryEntry.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>GlossaryEntry</code>. <br>
   * This array <strong>does</strong> contain inherited TypeFieldEntry from super classes of <code>GlossaryEntry</code>. <br>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>GlossaryEntry</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getAllTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getAllTypeFieldEntries() {
    return channel.getAllTypeFieldEntries(GlossaryEntry.class);
  }
  // ----------------------------------------------------------------------
  // FIELDs VALUE
  // ----------------------------------------------------------------------
  /**
   * Gets the value of the given <code>int</code> field name for the current <code>GlossaryEntry</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public int getIntFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getIntFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>int</code> field name for the current <code>GlossaryEntry</code>.
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
   * Gets the value of the given <code>long</code> field name for the current <code>GlossaryEntry</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public long getLongFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getLongFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>long</code> field name for the current <code>GlossaryEntry</code>.
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
   * Gets the value of the given <code>double</code> field name for the current <code>GlossaryEntry</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public double getDoubleFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getDoubleFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>double</code> field name for the current <code>GlossaryEntry</code>.
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
   * Gets the value of the given <code>boolean</code> field name for the current <code>GlossaryEntry</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  @Override
public boolean getBooleanFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getBooleanFieldValue(fieldName);
  }

  /**
   * Sets the value of the given <code>boolean</code> field name for the current <code>GlossaryEntry</code>.
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
   * Gets the <code>Object</code> value of the given field name for this <code>GlossaryEntry</code>. <br>
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
    if ("definition".equals(fieldName)) { return getDefinition(lang, useDefault); }
    if ("seeAlso".equals(fieldName)) { return getSeeAlso(); }
    if ("glossary".equals(fieldName)) { return getGlossary(); }
    return super.getFieldValue(fieldName, lang, useDefault);
  }

  /**
   * Sets the <code>Object</code> value of the given field name for this <code>GlossaryEntry</code>. <br>
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
    if ("definition".equals(fieldName)) { setDefinition(lang,(String)value); return; }
    if ("seeAlso".equals(fieldName)) { setSeeAlso((generated.GlossaryEntry[])value); return; }
    if ("glossary".equals(fieldName)) { setGlossary((generated.Glossary)value); return; }
    super.setFieldValue(fieldName, value, lang);
  }

  // ----------------------------------------------------------------------
  // definition
  // ----------------------------------------------------------------------

  protected  String definition = channel.getTypeFieldEntry(GlossaryEntry.class, "definition", true).getDefaultTextString();

  public String getDefinition() { return definition; }

  public void setDefinition(String v) { definition = v; }




  protected HashMap<String,String> definitionML = channel.getTypeFieldEntry(GlossaryEntry.class, "definition", true).getDefaultTextMap();
  public String getDefinition(String lang) { return channel.getLangValue(lang, true, definition, definitionML, getMainLanguage()); }
  public String getDefinition(String lang, boolean useDefault) { return channel.getLangValue(lang, useDefault, definition, definitionML, getMainLanguage()); }
  public HashMap<String,String> getDefinitionML() { return definitionML; }
  public void setDefinitionML(HashMap<String,String> v) { definitionML = v; }

  public String getDefinitionMLE() {
    return JcmsUtil.encodeMLE(getDefinitionML());
  }

  public void setDefinitionMLE(String v) {
    setDefinitionML(JcmsUtil.decodeMLE(v));
  }

  public void setDefinition(String lang, String value) {
    if (channel.getLanguage().equals(lang)) {
      definition = value;
      return;
    }
    if (definitionML == null) {
      definitionML = new HashMap<>();
    } else if (this != channel.getData(id)) {
      definitionML = new HashMap<>(definitionML);
    }
    definitionML.put(lang, value);
  }
  // ----------------------------------------------------------------------
  // seeAlso
  // ----------------------------------------------------------------------

  protected  generated.GlossaryEntry[] seeAlso;

  public generated.GlossaryEntry[] getSeeAlso() { return seeAlso; }

  public void setSeeAlso(generated.GlossaryEntry[] v) { seeAlso = v; }



  // ----------------------------------------------------------------------
  // glossary
  // ----------------------------------------------------------------------

  protected  generated.Glossary glossary;

  public generated.Glossary getGlossary() { return glossary; }

  public void setGlossary(generated.Glossary v) { glossary = v; }




  // ----------------------------------------------------------------------
  // abstract
  // ----------------------------------------------------------------------
  @Override
  public void setAbstract(String lang, String value) { setDefinition(lang, value); }
  @Override
  public String getAbstract() { return definition; }
  @Override
  public String getAbstract(String lang, boolean useDefault) { return getDefinition(lang, useDefault); }
  @Override
  public HashMap<String,String> getAbstractML() { return getDefinitionML(); }
  @Override
  public String[] getSearchStrings() {
    StringBuffer sb = new StringBuffer(super.getSearchStrings()[0]);
    sb.ensureCapacity(500 * (0 + 2 + 0 + 0 + 0 + 0) );
    if (definition != null) {
      sb.append(definition); sb.append(' ');
    }
    if (definitionML != null) {
      for (String str : definitionML.values()) {
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
    if (definition != null && !JHTMLUtils.isJHTML(null, definition)) {
      sb.append(definition); sb.append(' ');
    }
    if (definitionML != null) {
      for (String str : definitionML.values()) {
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
    if (definition != null && JHTMLUtils.isJHTML(null, definition)) {
      sb.append(definition); sb.append(' ');
    }
    if (definitionML != null) {
      for (String str : definitionML.values()) {
        if (str != null && JHTMLUtils.isJHTML(null, str)) {
          sb.append(str); sb.append(' ');
        }
      }
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
    JcmsUtil.addData(set, clazz, getGlossary());
    JcmsUtil.addData(set, clazz, getSeeAlso());
    return set;
  }

  // ----------------------------------------------------------------------
  // TreeNode implementation
  // ----------------------------------------------------------------------
  @Override
  public Collection<? extends TreeNode> getTreeChildren() {
    return Util.emptyTreeSet();
  }

  @Override
public TreeNode getTreeParent() {
    return getGlossary();
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
    ((GlossaryEntry)mergeCopy).setDefinition(getDefinition());
    ((GlossaryEntry)mergeCopy).setDefinitionML(JcmsUtil.getMergedMLMap(getDefinitionML(), ((GlossaryEntry)mergeCopy).getDefinitionML()));
    ((GlossaryEntry)mergeCopy).setSeeAlso(getSeeAlso());
    ((GlossaryEntry)mergeCopy).setGlossary(getGlossary());
  }
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// TD5eYY5Ho2AmJ6eTpT0xQQ==
