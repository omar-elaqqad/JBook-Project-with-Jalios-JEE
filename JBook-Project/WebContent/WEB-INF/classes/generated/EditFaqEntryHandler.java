// This file has been automatically generated.
package generated;


import java.util.HashMap;

import com.jalios.jcms.Data;
import com.jalios.jcms.Member;
import com.jalios.jcms.Publication;
import com.jalios.jcms.TypeFieldEntry;
import com.jalios.jcms.handler.EditPublicationHandler;
import com.jalios.util.Util;
@SuppressWarnings({"unchecked", "unused"})
public class EditFaqEntryHandler extends EditPublicationHandler {

  protected FaqEntry theContent;

  @Override
public Class<? extends Publication> getPublicationClass() {
    return FaqEntry.class;
  }

  // ----------------------------------------------------------------------
  // validateBeforeOpFaqEntry
  // ----------------------------------------------------------------------

  @Override
public boolean validateBeforeOp() {
    if (!super.validateBeforeOp()) {
      return false;
    }

    Member fdauthor = getLoggedMember();

           fdauthor = (fdauthor == null) ? getAvailableAuthor() : fdauthor;


    {
      Data data = processDataId("faq", __faqStr, generated.Faq.class);
      if (data != null) {
        faq = (generated.Faq)data;
      } else {
        isFaqValidated = Util.isEmpty(__faqStr);
      }
    }
    if (!validateUploadedFileDocument(getAvailableFaq(),   fdauthor, getAvailableWorkspace()) || !createUploadedFileDocument(getAvailableFaq(),  fdauthor, getAvailableWorkspace())) {
      return false;
    }
    return true;
  }
  @Override
  public Object getAvailableField(String field) {

    if ("answer".equals(field)) {
      return getAllAvailableAnswerML();
    }

    if ("faq".equals(field)) {
      return getAvailableFaq();
    }

    if ("order".equals(field)) {
      return getAvailableOrder();
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
  // validateCommonCreateUpdateFaqEntry
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdateFaqEntry() {
    if (!isFaqValidated) {
      setWarningMsg(glp("msg.edit.bad-link-id", channel.getTypeFieldLabel(getPublicationClass(), "faq", userLang)));
      return false;
    }
    if (!isOrderValidated) {
      setWarningMsg(glp("msg.edit.bad-number-format", channel.getTypeFieldLabel(getPublicationClass(), "order", userLang)));
      return false;
    }
    return true;
  }

  // ----------------------------------------------------------------------
  // Create
  // ----------------------------------------------------------------------
  @Override
public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate() || !validateCommonCreateUpdateFaqEntry()) {
      return false;
    }
    return true;
  }

  // ----------------------------------------------------------------------
  // Update
  // ----------------------------------------------------------------------
  @Override
public boolean validateUpdate() throws java.io.IOException {
    if (!super.validateUpdate() || !validateCommonCreateUpdateFaqEntry()) {
      return false;
    }

    return true;
  }

  // ----------------------------------------------------------------------
  // Next
  // ----------------------------------------------------------------------
  @Override
protected boolean validateNext() throws java.io.IOException {
   if (!super.validateNext()) {
      return false;
    }
	return true;
  }
  // ----------------------------------------------------------------------
  // Previous
  // ----------------------------------------------------------------------
  @Override
protected boolean validatePrevious() throws java.io.IOException {
  	if (!super.validatePrevious()) {
      return false;
    }
	return true;
  }
  // ----------------------------------------------------------------------
  // Finish
  // ----------------------------------------------------------------------
  @Override
protected boolean validateFinish() throws java.io.IOException {
  	if (!super.validateFinish()) {
      return false;
    }
	return true;
  }
  // ----------------------------------------------------------------------
  // setFields
  // ----------------------------------------------------------------------
  @Override
public void setFields(Publication data) {
    super.setFields(data);
    FaqEntry obj = (FaqEntry)data;
    obj.setAnswer(getAvailableAnswer());
    obj.setAnswerML(getAvailableAnswerML());
    obj.setFaq(getAvailableFaq());
    obj.setOrder(getAvailableOrder());
  }

  @Override
public void setId(String  v) {
    if (channel.getData(v) instanceof FaqEntry) {
      super.setId(v);
      theContent = (FaqEntry)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }


  // ----------------------------------------------------------------------
  // answer
  // ----------------------------------------------------------------------
  protected TypeFieldEntry answerTFE = channel.getTypeFieldEntry(FaqEntry.class, "answer", true);
  protected String answer = channel.getTypeFieldEntry(FaqEntry.class, "answer", true).getDefaultTextString();
  protected HashMap<String,String> answerML = answerTFE.getDefaultTextMap();
  public void setAnswer(String[] v) {
    answer = getMultilingualMainValue(answerTFE, v);
    answerML = getMultilingualMLMap(answerTFE, v);
  }
  public String getAvailableAnswer() {
    if (theContent != null && isFieldMissing("answer")) {
     String objectValue = theContent.getAnswer();
      return objectValue;
    }
    return answer;
  }


  public HashMap<String,String> getAllAvailableAnswerML() {
    HashMap<String,String> map = Util.getHashMap(getAvailableAnswerML());
    map.put(channel.getLanguage(),getAvailableAnswer(channel.getLanguage()));
    return map;
  }

  public HashMap<String,String> getAvailableAnswerML() {
    if (theContent != null && isFieldMissing("answer")) {
      return theContent.getAnswerML();
    }
    return answerML;
  }
  public String getAvailableAnswer(String lang) {
    if (theContent != null) {
      if (lang.equals(channel.getLanguage())) {
      	if (!Util.isSameContent(answer, channel.getTypeFieldEntry(FaqEntry.class, "answer", true).getDefaultTextString())) {
          return answer;
      	}
      } else {
      	if (answerML != null && Util.notEmpty(answerML.get(lang))) {
      	  return answerML.get(lang);
      	}
      }
      return Util.getString(theContent.getAnswer(lang, false), "");
    }
    if (lang.equals(channel.getLanguage())) {
      return answer;
    }
    return answerML == null ? "" : Util.getString(answerML.get(lang), "");
  }


  // ----------------------------------------------------------------------
  // faq
  // ----------------------------------------------------------------------
  protected TypeFieldEntry faqTFE = channel.getTypeFieldEntry(FaqEntry.class, "faq", true);
  protected boolean isFaqValidated = true;
  protected generated.Faq faq;
  String __faqStr = null;
  public void setFaq(String v) {
    __faqStr = v;
  }
  public generated.Faq getAvailableFaq() {
    if (theContent != null && isFieldMissing("faq")) {
     generated.Faq objectValue = theContent.getFaq();
      return objectValue;
    }
    return faq;
  }




  // ----------------------------------------------------------------------
  // order
  // ----------------------------------------------------------------------
  protected TypeFieldEntry orderTFE = channel.getTypeFieldEntry(FaqEntry.class, "order", true);
  protected boolean isOrderValidated = true;
  protected int order = 0;
  public void setOrder(String v) {
    try {
      order = Integer.parseInt(v.trim());
    } catch(NumberFormatException ex) {
      isOrderValidated = false;
    }
  }
  public int getAvailableOrder() {
    if (theContent != null && isFieldMissing("order")) {
     int objectValue = theContent.getOrder();
      return objectValue;
    }
    return order;
  }






}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// vjXKiNCP1SZuozFmtrdWNA==
