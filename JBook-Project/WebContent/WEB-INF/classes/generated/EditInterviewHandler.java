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
public class EditInterviewHandler extends EditPublicationHandler {
   
  protected Interview theContent;
  
  public Class<? extends Publication> getPublicationClass() {
    return Interview.class;
  }
  
  // ----------------------------------------------------------------------
  // validateBeforeOpInterview  
  // ----------------------------------------------------------------------
  
  public boolean validateBeforeOp() {
    if (!super.validateBeforeOp()) {
      return false;
    }
    
    Member fdauthor = getLoggedMember();
    
           fdauthor = (fdauthor == null) ? getAvailableAuthor() : fdauthor;
    
    
    return true;
  }
  @Override
  public Object getAvailableField(String field) {
  
    if ("summary".equals(field)) {
      return getAllAvailableSummaryML();
    }
    
    if ("intro".equals(field)) {
      return getAllAvailableIntroML();
    }
    
    if ("bio".equals(field)) {
      return getAllAvailableBioML();
    }
    
    if ("questions".equals(field)) {
      return getAllAvailableQuestionsML();
    }
    
    if ("answers".equals(field)) {
      return getAvailableAnswers();
    }
    
    if ("questionPrefix".equals(field)) {
      return getAvailableQuestionPrefix();
    }
    
    if ("answerPrefix".equals(field)) {
      return getAvailableAnswerPrefix();
    }
    
    if ("photo".equals(field)) {
      return getAvailablePhoto();
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
  // validateCommonCreateUpdateInterview  
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdateInterview() {
    return true;
  }
  
  // ----------------------------------------------------------------------
  // Create
  // ----------------------------------------------------------------------
  public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate()) {
      return false;
    }
    if (!validateCommonCreateUpdateInterview()) {
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
    
    if (!validateCommonCreateUpdateInterview()) {
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
    Interview obj = (Interview)data;
    obj.setSummary(getAvailableSummary());
    obj.setSummaryML(getAvailableSummaryML());
    obj.setIntro(getAvailableIntro());
    obj.setIntroML(getAvailableIntroML());
    obj.setBio(getAvailableBio());
    obj.setBioML(getAvailableBioML());
    obj.setQuestions(getAvailableQuestions());
    obj.setQuestionsML(getAvailableQuestionsML());
    obj.setAnswers(getAvailableAnswers());
    obj.setQuestionPrefix(getAvailableQuestionPrefix());
    obj.setAnswerPrefix(getAvailableAnswerPrefix());
    obj.setPhoto(getAvailablePhoto());
  }
  
  public void setId(String  v) {
    if (channel.getData(v) instanceof Interview) {
      super.setId(v);
      theContent = (Interview)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }
  
   
  // ----------------------------------------------------------------------
  // summary
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry summaryTFE = channel.getTypeFieldEntry(Interview.class, "summary", true);
  protected String summary = channel.getTypeFieldEntry(Interview.class, "summary", true).getDefaultTextString();
  protected HashMap<String,String> summaryML = summaryTFE.getDefaultTextMap();
  public void setSummary(String[] v) {
    summary = getMultilingualMainValue(summaryTFE, v);
    summaryML = getMultilingualMLMap(summaryTFE, v);
  }
  public String getAvailableSummary() {
    if (theContent != null && isFieldMissing("summary")) {
     String objectValue = theContent.getSummary();
      return objectValue;
    }
    return summary;
  }
  
    
  public HashMap<String,String> getAllAvailableSummaryML() {
    HashMap<String,String> map = Util.getHashMap(getAvailableSummaryML());
    map.put(channel.getLanguage(),getAvailableSummary(channel.getLanguage()));
    return map;
  }
  
  public HashMap<String,String> getAvailableSummaryML() {
    if (theContent != null && isFieldMissing("summary")) {
      return theContent.getSummaryML();
    }
    return summaryML;
  }
  public String getAvailableSummary(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(summary, channel.getTypeFieldEntry(Interview.class, "summary", true).getDefaultTextString())) {
          return summary;
      	}
      } else {
      	if (summaryML != null && Util.notEmpty(summaryML.get(lang))) {
      	  return summaryML.get(lang);
      	}
      }
      return Util.getString(theContent.getSummary(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return summary;
    }
    return summaryML == null ? "" : Util.getString(summaryML.get(lang), "");
  }
  
   
  // ----------------------------------------------------------------------
  // intro
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry introTFE = channel.getTypeFieldEntry(Interview.class, "intro", true);
  protected String intro = channel.getTypeFieldEntry(Interview.class, "intro", true).getDefaultTextString();
  protected HashMap<String,String> introML = introTFE.getDefaultTextMap();
  public void setIntro(String[] v) {
    intro = getMultilingualMainValue(introTFE, v);
    introML = getMultilingualMLMap(introTFE, v);
  }
  public String getAvailableIntro() {
    if (theContent != null && isFieldMissing("intro")) {
     String objectValue = theContent.getIntro();
      return objectValue;
    }
    return intro;
  }
  
    
  public HashMap<String,String> getAllAvailableIntroML() {
    HashMap<String,String> map = Util.getHashMap(getAvailableIntroML());
    map.put(channel.getLanguage(),getAvailableIntro(channel.getLanguage()));
    return map;
  }
  
  public HashMap<String,String> getAvailableIntroML() {
    if (theContent != null && isFieldMissing("intro")) {
      return theContent.getIntroML();
    }
    return introML;
  }
  public String getAvailableIntro(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(intro, channel.getTypeFieldEntry(Interview.class, "intro", true).getDefaultTextString())) {
          return intro;
      	}
      } else {
      	if (introML != null && Util.notEmpty(introML.get(lang))) {
      	  return introML.get(lang);
      	}
      }
      return Util.getString(theContent.getIntro(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return intro;
    }
    return introML == null ? "" : Util.getString(introML.get(lang), "");
  }
  
   
  // ----------------------------------------------------------------------
  // bio
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry bioTFE = channel.getTypeFieldEntry(Interview.class, "bio", true);
  protected String bio = channel.getTypeFieldEntry(Interview.class, "bio", true).getDefaultTextString();
  protected HashMap<String,String> bioML = bioTFE.getDefaultTextMap();
  public void setBio(String[] v) {
    bio = getMultilingualMainValue(bioTFE, v);
    bioML = getMultilingualMLMap(bioTFE, v);
  }
  public String getAvailableBio() {
    if (theContent != null && isFieldMissing("bio")) {
     String objectValue = theContent.getBio();
      return objectValue;
    }
    return bio;
  }
  
    
  public HashMap<String,String> getAllAvailableBioML() {
    HashMap<String,String> map = Util.getHashMap(getAvailableBioML());
    map.put(channel.getLanguage(),getAvailableBio(channel.getLanguage()));
    return map;
  }
  
  public HashMap<String,String> getAvailableBioML() {
    if (theContent != null && isFieldMissing("bio")) {
      return theContent.getBioML();
    }
    return bioML;
  }
  public String getAvailableBio(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(bio, channel.getTypeFieldEntry(Interview.class, "bio", true).getDefaultTextString())) {
          return bio;
      	}
      } else {
      	if (bioML != null && Util.notEmpty(bioML.get(lang))) {
      	  return bioML.get(lang);
      	}
      }
      return Util.getString(theContent.getBio(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return bio;
    }
    return bioML == null ? "" : Util.getString(bioML.get(lang), "");
  }
  
   
  // ----------------------------------------------------------------------
  // questions
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry questionsTFE = channel.getTypeFieldEntry(Interview.class, "questions", true);
  protected String[] questions = new String[0];
  protected int questionsAddCount = 0;
  HashMap<String,String[]> questionsML;
  public void setQuestions(String[] v) {  
   questions = getMultilingualMainValueArray(questionsTFE, v);
   questionsML = getMultilingualMLMapArray(questionsTFE, v);    
  }
  public String[] getAvailableQuestions() {
    if (theContent != null && isFieldMissing("questions")) {
	  String[] objectValue = theContent.getQuestions();
      if (objectValue == null) {
        return questions;
      }
      return objectValue;
    }
    return questions;
  }
  
    
  public HashMap<String,String[]> getAllAvailableQuestionsML() {
    HashMap<String,String[]> map = Util.getHashMap(getAvailableQuestionsML());
    map.put(channel.getLanguage(),getAvailableQuestions(channel.getLanguage()));
    return map;
  }
  
  public HashMap<String,String[]> getAvailableQuestionsML() {
    if (theContent != null && isFieldMissing("questions")) {
      return theContent.getQuestionsML();
    }
    return questionsML;
  }
  public String[] getAvailableQuestions(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (Util.notEmpty(questions)) {
          return questions;
      	}
      } else {
      	if (questionsML != null && Util.notEmpty(questionsML.get(lang))) {
      	  return questionsML.get(lang);
      	}
      }
      return theContent.getQuestions(lang, false);
    }
    if (lang.equals(channel.getLanguage())) {
      return questions;
    }
    return questionsML == null ? null : questionsML.get(lang);
  }
  
  public void setQuestionsAddCount(int  v) {
    questionsAddCount = v;
  }
  
  public int getQuestionsCount() {
    int arraySize = Util.getSize(getAvailableQuestions());
    if (channel.isMultilingual()) {
      for (String lang : channel.getOtherLanguageList()) {
        String[] array = getAvailableQuestions(lang);
        if (array != null && array.length > arraySize) {
          arraySize = array.length;
        }
      }
    }
    int res = 3 + arraySize + questionsAddCount;
    return res;
  }
   
  // ----------------------------------------------------------------------
  // answers
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry answersTFE = channel.getTypeFieldEntry(Interview.class, "answers", true);
  protected String[] answers = new String[0];
  protected int answersAddCount = 0;
  public void setAnswers(String[] v) {
    answers = getMonolingualValueArray(answersTFE, v);
  }
  
  public String[] getAvailableAnswers() {
    if (theContent != null && isFieldMissing("answers")) {
	  String[] objectValue = theContent.getAnswers();
      if (objectValue == null) {
        return answers;
      }
      return objectValue;
    }
    return answers;
  }
  
    
  
  public void setAnswersAddCount(int  v) {
    answersAddCount = v;
  }
  
  public int getAnswersCount() {
    int arraySize = Util.getSize(getAvailableAnswers());
    int res = 3 + arraySize + answersAddCount;
    return res;
  }
   
  // ----------------------------------------------------------------------
  // questionPrefix
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry questionPrefixTFE = channel.getTypeFieldEntry(Interview.class, "questionPrefix", true);
  protected String questionPrefix = channel.getTypeFieldEntry(Interview.class, "questionPrefix", true).getDefaultTextString();
  public void setQuestionPrefix(String[] v) {
    questionPrefix = getMonolingualValue(questionPrefixTFE, v);
  }
  public String getAvailableQuestionPrefix() {
    if (theContent != null && isFieldMissing("questionPrefix")) {
     String objectValue = theContent.getQuestionPrefix();
      return objectValue;
    }
    return questionPrefix;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // answerPrefix
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry answerPrefixTFE = channel.getTypeFieldEntry(Interview.class, "answerPrefix", true);
  protected String answerPrefix = channel.getTypeFieldEntry(Interview.class, "answerPrefix", true).getDefaultTextString();
  public void setAnswerPrefix(String[] v) {
    answerPrefix = getMonolingualValue(answerPrefixTFE, v);
  }
  public String getAvailableAnswerPrefix() {
    if (theContent != null && isFieldMissing("answerPrefix")) {
     String objectValue = theContent.getAnswerPrefix();
      return objectValue;
    }
    return answerPrefix;
  }
  
    
  
   
  // ----------------------------------------------------------------------
  // photo
  // ----------------------------------------------------------------------  
  protected TypeFieldEntry photoTFE = channel.getTypeFieldEntry(Interview.class, "photo", true);
  protected String photo = channel.getTypeFieldEntry(Interview.class, "photo", true).getDefaultTextString();
  public void setPhoto(String[] v) {
    photo = getMonolingualValue(photoTFE, v);
  }
  public String getAvailablePhoto() {
    if (theContent != null && isFieldMissing("photo")) {
     String objectValue = theContent.getPhoto();
      return objectValue;
    }
    return photo;
  }
  
    
  
  public int getTabGroupMaxCount(String tabGroupName) {
    String tabGroup = Util.buildID(tabGroupName, "0-9a-zA-Z");
    
      
      if("item".equalsIgnoreCase(tabGroup)) {
        return getAvailableItemCount();
      }
    
    return super.getTabGroupMaxCount(tabGroupName);    
  }
  
  
  public int getAvailableItemCount() {
    int max = 0;
  
    
    
      for (String lang : channel.getLanguageList()) {
        int count = Util.getSize(getAvailableQuestions(lang));
        max = count > max ? count : max;
      }
    
  
    
    
      {
        int count = Util.getSize(getAvailableAnswers());
        max = count > max ? count : max;
      }
    
  
    return max;
  }
  
 
   
 
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// MQOs9fQiE134r1BSihoH5A==
