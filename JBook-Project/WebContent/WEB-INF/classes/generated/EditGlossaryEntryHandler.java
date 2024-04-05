// This file has been automatically generated.
package generated;
   
   
import java.text.*;
import java.util.*;
import org.apache.oro.text.regex.*;
import com.jalios.jcms.*;
import com.jalios.jcms.handler.*;
import com.jalios.jcms.wysiwyg.WysiwygManager;
import com.jalios.util.ObjectIntTreeMap;
import com.jalios.util.Util;
import custom.*;
@SuppressWarnings({"unchecked", "unused"})
public class EditGlossaryEntryHandler extends EditPublicationHandler {
   
  protected GlossaryEntry theContent;
  
  public Class<? extends Publication> getPublicationClass() {
    return GlossaryEntry.class;
  }
  
  // ----------------------------------------------------------------------
  // validateBeforeOpGlossaryEntry  
  // ----------------------------------------------------------------------
  
  public boolean validateBeforeOp() {
    if (!super.validateBeforeOp()) {
      return false;
    }
    
    Member fdauthor = getLoggedMember();
    
           fdauthor = (fdauthor == null) ? getAvailableAuthor() : fdauthor;
    
    
    {
      List<generated.GlossaryEntry> list = processDataIds("seeAlso",__seeAlsoStr,generated.GlossaryEntry.class);
      this.seeAlso = (generated.GlossaryEntry[])list.toArray(new generated.GlossaryEntry[0]);
    }
    {
      Data data = processDataId("glossary", __glossaryStr, generated.Glossary.class);
      if (data != null) { 
        glossary = (generated.Glossary)data;
      } else {
        isGlossaryValidated = Util.isEmpty(__glossaryStr);
      }
    }
    if (!validateUploadedFileDocument(getAvailableSeeAlso(),   fdauthor, getAvailableWorkspace())) {
      return false;
    }
    if (!validateUploadedFileDocument(getAvailableGlossary(),   fdauthor, getAvailableWorkspace())) {
      return false;
    }
    if (!createUploadedFileDocument(getAvailableSeeAlso(),  fdauthor, getAvailableWorkspace())) {
      return false;
    }
    if (!createUploadedFileDocument(getAvailableGlossary(),  fdauthor, getAvailableWorkspace())) {
      return false;
    }
    return true;
  }
  @Override
  public Object getAvailableField(String field) {
  
    if ("definition".equals(field)) {
      return getAllAvailableDefinitionML();
    }
    
    if ("seeAlso".equals(field)) {
      return getAvailableSeeAlso();
    }
    
    if ("glossary".equals(field)) {
      return getAvailableGlossary();
    }
    
    return super.getAvailableField(field);
  }
  @Override
  public Object getEnumValues(String field) {
  
    return super.getEnumValues(field);
  }
  @Override
  public Object getEnumLabels(String field, String userLang) {
  
    return super.getEnumLabels(field, userLang);
  }
  // ----------------------------------------------------------------------
  // validateCommonCreateUpdateGlossaryEntry  
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdateGlossaryEntry() {
    if (!isGlossaryValidated) {
      setWarningMsg(glp("msg.edit.bad-link-id", channel.getTypeFieldLabel(getPublicationClass(), "glossary", userLang)));
      return false;
    }
    return true;
  }
  
  // ----------------------------------------------------------------------
  // Create
  // ----------------------------------------------------------------------
  public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate()) {
      return false;
    }
    if (!validateCommonCreateUpdateGlossaryEntry()) {
      return false;
    }
    return true;
  }
  
  // ----------------------------------------------------------------------
  // Update
  // ----------------------------------------------------------------------
  public boolean validateUpdate() throws java.io.IOException {
    if (!super.validateUpdate()) {
      return false;
    }
    
    if (!validateCommonCreateUpdateGlossaryEntry()) {
      return false;
    }
    
    return true;
  }
 
  // ----------------------------------------------------------------------
  // Next
  // ----------------------------------------------------------------------
  protected boolean validateNext() throws java.io.IOException {
   if (!super.validateNext()) {
      return false;
    }
	return true;
  }
  // ----------------------------------------------------------------------
  // Previous
  // ----------------------------------------------------------------------
  protected boolean validatePrevious() throws java.io.IOException {
  	if (!super.validatePrevious()) {
      return false;
    }
	return true;
  }
  // ----------------------------------------------------------------------
  // Finish
  // ----------------------------------------------------------------------
  protected boolean validateFinish() throws java.io.IOException {
  	if (!super.validateFinish()) {
      return false;
    }
	return true;
  }
  // ----------------------------------------------------------------------
  // setFields
  // ----------------------------------------------------------------------
  public void setFields(Publication data) {
    super.setFields(data);
    GlossaryEntry obj = (GlossaryEntry)data;
    obj.setDefinition(getAvailableDefinition());
    obj.setDefinitionML(getAvailableDefinitionML());
    obj.setSeeAlso(getAvailableSeeAlso());
    obj.setGlossary(getAvailableGlossary());
  }
  
  public void setId(String  v) {
    if (channel.getData(v) instanceof GlossaryEntry) {
      super.setId(v);
      theContent = (GlossaryEntry)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }
  
   
  // ----------------------------------------------------------------------
  // definition
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry definitionTFE = channel.getTypeFieldEntry(GlossaryEntry.class, "definition", true);
  protected String definition = channel.getTypeFieldEntry(GlossaryEntry.class, "definition", true).getDefaultTextString();
  protected HashMap<String,String> definitionML = definitionTFE.getDefaultTextMap();
  public void setDefinition(String[] v) {
    definition = getMultilingualMainValue(definitionTFE, v);
    definitionML = getMultilingualMLMap(definitionTFE, v);
  }
  public String getAvailableDefinition() {
    if (theContent != null && isFieldMissing("definition")) {
     String objectValue = theContent.getDefinition();
      return objectValue;
    }
    return definition;
  }
  
    
  public HashMap<String,String> getAllAvailableDefinitionML() {
    HashMap<String,String> map = Util.getHashMap(getAvailableDefinitionML());
    map.put(channel.getLanguage(),getAvailableDefinition(channel.getLanguage()));
    return map;
  }
  
  public HashMap<String,String> getAvailableDefinitionML() {
    if (theContent != null && isFieldMissing("definition")) {
      return theContent.getDefinitionML();
    }
    return definitionML;
  }
  public String getAvailableDefinition(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(definition, channel.getTypeFieldEntry(GlossaryEntry.class, "definition", true).getDefaultTextString())) {
          return definition;
      	}
      } else {
      	if (definitionML != null && Util.notEmpty(definitionML.get(lang))) {
      	  return definitionML.get(lang);
      	}
      }
      return Util.getString(theContent.getDefinition(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return definition;
    }
    return definitionML == null ? "" : Util.getString(definitionML.get(lang), "");
  }
  
   
  // ----------------------------------------------------------------------
  // seeAlso
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry seeAlsoTFE = channel.getTypeFieldEntry(GlossaryEntry.class, "seeAlso", true);
  protected generated.GlossaryEntry[] seeAlso = new generated.GlossaryEntry[0];
  protected int seeAlsoAddCount = 0;
  String[] __seeAlsoStr = null;
  public void setSeeAlso(String[]  v) {
    __seeAlsoStr = v;
  }
  public generated.GlossaryEntry[] getAvailableSeeAlso() {
    if (theContent != null && isFieldMissing("seeAlso")) {
	  generated.GlossaryEntry[] objectValue = theContent.getSeeAlso();
      if (objectValue == null) {
        return seeAlso;
      }
      return objectValue;
    }
    return seeAlso;
  }
  
    
  
  public void setSeeAlsoAddCount(int  v) {
    seeAlsoAddCount = v;
  }
  
  public int getSeeAlsoCount() {
    int arraySize = Util.getSize(getAvailableSeeAlso());
    int res = 3 + arraySize + seeAlsoAddCount;
    return res;
  }
   
  // ----------------------------------------------------------------------
  // glossary
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry glossaryTFE = channel.getTypeFieldEntry(GlossaryEntry.class, "glossary", true);
  protected boolean isGlossaryValidated = true;
  protected generated.Glossary glossary;
  String __glossaryStr = null;
  public void setGlossary(String v) {
    __glossaryStr = v;
  }
  public generated.Glossary getAvailableGlossary() {
    if (theContent != null && isFieldMissing("glossary")) {
     generated.Glossary objectValue = theContent.getGlossary();
      return objectValue;
    }
    return glossary;
  }
  
    
  
 
   
 
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// gPcxdNpPGrO/1fBcoH+f7Q==
