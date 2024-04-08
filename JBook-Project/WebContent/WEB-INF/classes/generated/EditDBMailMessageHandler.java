// This file has been automatically generated.
package generated;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Set;

import com.jalios.jcms.Data;
import com.jalios.jcms.HttpUtil;
import com.jalios.jcms.Member;
import com.jalios.jcms.Publication;
import com.jalios.jcms.TypeFieldEntry;
import com.jalios.jcms.handler.EditPublicationHandler;
import com.jalios.util.Util;
@SuppressWarnings({"unchecked", "unused"})
public class EditDBMailMessageHandler extends EditPublicationHandler {

  protected DBMailMessage theContent;

  @Override
public Class<? extends Publication> getPublicationClass() {
    return DBMailMessage.class;
  }

  // ----------------------------------------------------------------------
  // validateBeforeOpDBMailMessage
  // ----------------------------------------------------------------------

  @Override
public boolean validateBeforeOp() {
    if (!super.validateBeforeOp()) {
      return false;
    }

    Member fdauthor = getLoggedMember();

           fdauthor = (fdauthor == null) ? getAvailableAuthor() : fdauthor;


    {
      Data data = processDataId("fromMember", __fromMemberStr, Member.class);
      if (data != null) {
        fromMember = (Member)data;
      } else {
        isFromMemberValidated = Util.isEmpty(__fromMemberStr);
      }
    }
    {
      List<Member> list = processDataIds("toMember",__toMemberStr,Member.class);
      this.toMember = list.toArray(new Member[0]);
    }
    {
      List<Member> list = processDataIds("ccMember",__ccMemberStr,Member.class);
      this.ccMember = list.toArray(new Member[0]);
    }
    {
      List<Member> list = processDataIds("bccMember",__bccMemberStr,Member.class);
      this.bccMember = list.toArray(new Member[0]);
    }
    {
      Data data = processDataId("replyToMember", __replyToMemberStr, Member.class);
      if (data != null) {
        replyToMember = (Member)data;
      } else {
        isReplyToMemberValidated = Util.isEmpty(__replyToMemberStr);
      }
    }
    {
      List<com.jalios.jcms.FileDocument> list = processDataIds("attachements",__attachementsStr,com.jalios.jcms.FileDocument.class);
      this.attachements = list.toArray(new com.jalios.jcms.FileDocument[0]);
    }
    if (!validateUploadedFileDocument(getAvailableAttachements(),   fdauthor, getAvailableWorkspace()) || !createUploadedFileDocument(getAvailableAttachements(),  fdauthor, getAvailableWorkspace())) {
      return false;
    }
    return true;
  }
  @Override
  public Object getAvailableField(String field) {

    if ("from".equals(field)) {
      return getAvailableFrom();
    }

    if ("to".equals(field)) {
      return getAvailableTo();
    }

    if ("cc".equals(field)) {
      return getAvailableCc();
    }

    if ("bcc".equals(field)) {
      return getAvailableBcc();
    }

    if ("replyTo".equals(field)) {
      return getAvailableReplyTo();
    }

    if ("fromMember".equals(field)) {
      return getAvailableFromMember();
    }

    if ("toMember".equals(field)) {
      return getAvailableToMember();
    }

    if ("ccMember".equals(field)) {
      return getAvailableCcMember();
    }

    if ("bccMember".equals(field)) {
      return getAvailableBccMember();
    }

    if ("replyToMember".equals(field)) {
      return getAvailableReplyToMember();
    }

    if ("contentText".equals(field)) {
      return getAvailableContentText();
    }

    if ("contentHtml".equals(field)) {
      return getAvailableContentHtml();
    }

    if ("attachements".equals(field)) {
      return getAvailableAttachements();
    }

    if ("sentDate".equals(field)) {
      return getAvailableSentDate();
    }

    if ("receivedDate".equals(field)) {
      return getAvailableReceivedDate();
    }

    if ("priority".equals(field)) {
      return getAvailablePriority();
    }

    if ("account".equals(field)) {
      return getAvailableAccount();
    }

    if ("inReplyTo".equals(field)) {
      return getAvailableInReplyTo();
    }

    if ("references".equals(field)) {
      return getAvailableReferences();
    }

    if ("messageId".equals(field)) {
      return getAvailableMessageId();
    }

    if ("thread".equals(field)) {
      return getAvailableThread();
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
  // validateCommonCreateUpdateDBMailMessage
  // ----------------------------------------------------------------------
  public boolean validateCommonCreateUpdateDBMailMessage() {
    if (!isFromMemberValidated) {
      setWarningMsg(glp("msg.edit.bad-link-id", channel.getTypeFieldLabel(getPublicationClass(), "fromMember", userLang)));
      return false;
    }
    if (!isReplyToMemberValidated) {
      setWarningMsg(glp("msg.edit.bad-link-id", channel.getTypeFieldLabel(getPublicationClass(), "replyToMember", userLang)));
      return false;
    }
    if (!isSentDateValidated) {
      setWarningMsg(glp("msg.edit.bad-date-value", channel.getTypeFieldLabel(getPublicationClass(), "sentDate", userLang), HttpUtil.encodeForHTML(__sentDateStr)));
      return false;
    }
    if (!isReceivedDateValidated) {
      setWarningMsg(glp("msg.edit.bad-date-value", channel.getTypeFieldLabel(getPublicationClass(), "receivedDate", userLang), HttpUtil.encodeForHTML(__receivedDateStr)));
      return false;
    }
    if (!isPriorityValidated) {
      setWarningMsg(glp("msg.edit.bad-number-format", channel.getTypeFieldLabel(getPublicationClass(), "priority", userLang)));
      return false;
    }
    return true;
  }

  // ----------------------------------------------------------------------
  // Create
  // ----------------------------------------------------------------------
  @Override
public boolean validateCreate() throws java.io.IOException {
    if (!super.validateCreate() || !validateCommonCreateUpdateDBMailMessage()) {
      return false;
    }
    return true;
  }

  // ----------------------------------------------------------------------
  // Update
  // ----------------------------------------------------------------------
  @Override
public boolean validateUpdate() throws java.io.IOException {
    if (!super.validateUpdate() || !validateCommonCreateUpdateDBMailMessage()) {
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
    if (!isSentDateValidated) {
      setWarningMsg(glp("msg.edit.bad-date-value", channel.getTypeFieldLabel(getPublicationClass(), "sentDate", userLang), HttpUtil.encodeForHTML(__sentDateStr)));
      return false;
    }
    if (!isReceivedDateValidated) {
      setWarningMsg(glp("msg.edit.bad-date-value", channel.getTypeFieldLabel(getPublicationClass(), "receivedDate", userLang), HttpUtil.encodeForHTML(__receivedDateStr)));
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
    if (!isSentDateValidated) {
      setWarningMsg(glp("msg.edit.bad-date-value", channel.getTypeFieldLabel(getPublicationClass(), "sentDate", userLang), HttpUtil.encodeForHTML(__sentDateStr)));
      return false;
    }
    if (!isReceivedDateValidated) {
      setWarningMsg(glp("msg.edit.bad-date-value", channel.getTypeFieldLabel(getPublicationClass(), "receivedDate", userLang), HttpUtil.encodeForHTML(__receivedDateStr)));
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
    if (!isSentDateValidated) {
      setWarningMsg(glp("msg.edit.bad-date-value", channel.getTypeFieldLabel(getPublicationClass(), "sentDate", userLang), HttpUtil.encodeForHTML(__sentDateStr)));
      return false;
    }
    if (!isReceivedDateValidated) {
      setWarningMsg(glp("msg.edit.bad-date-value", channel.getTypeFieldLabel(getPublicationClass(), "receivedDate", userLang), HttpUtil.encodeForHTML(__receivedDateStr)));
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
    DBMailMessage obj = (DBMailMessage)data;
    obj.setFrom(getAvailableFrom());
    if (data == null || !Util.isSameContent(((DBMailMessage)data).getTo(), Util.getHashSet(getAvailableTo()))) {
      obj.setTo(Util.getHashSet(getAvailableTo()));
    }
    if (data == null || !Util.isSameContent(((DBMailMessage)data).getCc(), Util.getHashSet(getAvailableCc()))) {
      obj.setCc(Util.getHashSet(getAvailableCc()));
    }
    if (data == null || !Util.isSameContent(((DBMailMessage)data).getBcc(), Util.getHashSet(getAvailableBcc()))) {
      obj.setBcc(Util.getHashSet(getAvailableBcc()));
    }
    obj.setReplyTo(getAvailableReplyTo());
    obj.setFromMember(getAvailableFromMember());
    if (data == null || !Util.isSameContent(((DBMailMessage)data).getToMember(), Util.getHashSet(getAvailableToMember()))) {
      obj.setToMember(Util.getHashSet(getAvailableToMember()));
    }
    if (data == null || !Util.isSameContent(((DBMailMessage)data).getCcMember(), Util.getHashSet(getAvailableCcMember()))) {
      obj.setCcMember(Util.getHashSet(getAvailableCcMember()));
    }
    if (data == null || !Util.isSameContent(((DBMailMessage)data).getBccMember(), Util.getHashSet(getAvailableBccMember()))) {
      obj.setBccMember(Util.getHashSet(getAvailableBccMember()));
    }
    obj.setReplyToMember(getAvailableReplyToMember());
    obj.setContentText(getAvailableContentText());
    obj.setContentHtml(getAvailableContentHtml());
    if (data == null || !Util.isSameContent(((DBMailMessage)data).getAttachements(), Util.getHashSet(getAvailableAttachements()))) {
      obj.setAttachements(Util.getHashSet(getAvailableAttachements()));
    }
    obj.setSentDate(getAvailableSentDate());
    obj.setReceivedDate(getAvailableReceivedDate());
    obj.setPriority(getAvailablePriority());
    obj.setAccount(getAvailableAccount());
    obj.setInReplyTo(getAvailableInReplyTo());
    if (data == null || !Util.isSameContent(((DBMailMessage)data).getReferences(), Util.getHashSet(getAvailableReferences()))) {
      obj.setReferences(Util.getHashSet(getAvailableReferences()));
    }
    obj.setMessageId(getAvailableMessageId());
    obj.setThread(getAvailableThread());
  }

  @Override
public void setId(String  v) {
    if (channel.getData(v) instanceof DBMailMessage) {
      super.setId(v);
      theContent = (DBMailMessage)publication;
    } else {
      super.setId(null);
      theContent = null;
    }
  }


  // ----------------------------------------------------------------------
  // from
  // ----------------------------------------------------------------------
  protected TypeFieldEntry fromTFE = channel.getTypeFieldEntry(DBMailMessage.class, "from", true);
  protected String from = channel.getTypeFieldEntry(DBMailMessage.class, "from", true).getDefaultTextString();
  public void setFrom(String[] v) {
    from = getMonolingualValue(fromTFE, v);
  }
  public String getAvailableFrom() {
    if (theContent != null && isFieldMissing("from")) {
     String objectValue = theContent.getFrom();
      return objectValue;
    }
    return from;
  }




  // ----------------------------------------------------------------------
  // to
  // ----------------------------------------------------------------------
  protected TypeFieldEntry toTFE = channel.getTypeFieldEntry(DBMailMessage.class, "to", true);
  protected String[] to;
  public void setTo(String[] v) {
    to = getMonolingualValueArray(toTFE, v);
  }

  public String[] getAvailableTo() {
    if (theContent != null && isFieldMissing("to")) {
	  Set<String> objectValue = theContent.getTo();
      if (objectValue == null) {
        return to;
      }
      return objectValue.toArray(new String[objectValue.size()]);
    }
    return to;
  }




  // ----------------------------------------------------------------------
  // cc
  // ----------------------------------------------------------------------
  protected TypeFieldEntry ccTFE = channel.getTypeFieldEntry(DBMailMessage.class, "cc", true);
  protected String[] cc;
  public void setCc(String[] v) {
    cc = getMonolingualValueArray(ccTFE, v);
  }

  public String[] getAvailableCc() {
    if (theContent != null && isFieldMissing("cc")) {
	  Set<String> objectValue = theContent.getCc();
      if (objectValue == null) {
        return cc;
      }
      return objectValue.toArray(new String[objectValue.size()]);
    }
    return cc;
  }




  // ----------------------------------------------------------------------
  // bcc
  // ----------------------------------------------------------------------
  protected TypeFieldEntry bccTFE = channel.getTypeFieldEntry(DBMailMessage.class, "bcc", true);
  protected String[] bcc;
  public void setBcc(String[] v) {
    bcc = getMonolingualValueArray(bccTFE, v);
  }

  public String[] getAvailableBcc() {
    if (theContent != null && isFieldMissing("bcc")) {
	  Set<String> objectValue = theContent.getBcc();
      if (objectValue == null) {
        return bcc;
      }
      return objectValue.toArray(new String[objectValue.size()]);
    }
    return bcc;
  }




  // ----------------------------------------------------------------------
  // replyTo
  // ----------------------------------------------------------------------
  protected TypeFieldEntry replyToTFE = channel.getTypeFieldEntry(DBMailMessage.class, "replyTo", true);
  protected String replyTo = channel.getTypeFieldEntry(DBMailMessage.class, "replyTo", true).getDefaultTextString();
  public void setReplyTo(String[] v) {
    replyTo = getMonolingualValue(replyToTFE, v);
  }
  public String getAvailableReplyTo() {
    if (theContent != null && isFieldMissing("replyTo")) {
     String objectValue = theContent.getReplyTo();
      return objectValue;
    }
    return replyTo;
  }




  // ----------------------------------------------------------------------
  // fromMember
  // ----------------------------------------------------------------------
  protected TypeFieldEntry fromMemberTFE = channel.getTypeFieldEntry(DBMailMessage.class, "fromMember", true);
  protected boolean isFromMemberValidated = true;
  protected Member fromMember;
  String __fromMemberStr = null;
  public void setFromMember(String v) {
    __fromMemberStr = v;
  }
  public Member getAvailableFromMember() {
    if (theContent != null && isFieldMissing("fromMember")) {
     Member objectValue = theContent.getFromMember();
      return objectValue;
    }
    return fromMember;
  }




  // ----------------------------------------------------------------------
  // toMember
  // ----------------------------------------------------------------------
  protected TypeFieldEntry toMemberTFE = channel.getTypeFieldEntry(DBMailMessage.class, "toMember", true);
  protected Member[] toMember = new Member[0];
  protected int toMemberAddCount = 0;
  String[] __toMemberStr = null;
  public void setToMember(String[]  v) {
    __toMemberStr = v;
  }
  public Member[] getAvailableToMember() {
    if (theContent != null && isFieldMissing("toMember")) {
	  Set<Member> objectValue = theContent.getToMember();
      if (objectValue == null) {
        return toMember;
      }
      return objectValue.toArray(new Member[objectValue.size()]);
    }
    return toMember;
  }




  // ----------------------------------------------------------------------
  // ccMember
  // ----------------------------------------------------------------------
  protected TypeFieldEntry ccMemberTFE = channel.getTypeFieldEntry(DBMailMessage.class, "ccMember", true);
  protected Member[] ccMember = new Member[0];
  protected int ccMemberAddCount = 0;
  String[] __ccMemberStr = null;
  public void setCcMember(String[]  v) {
    __ccMemberStr = v;
  }
  public Member[] getAvailableCcMember() {
    if (theContent != null && isFieldMissing("ccMember")) {
	  Set<Member> objectValue = theContent.getCcMember();
      if (objectValue == null) {
        return ccMember;
      }
      return objectValue.toArray(new Member[objectValue.size()]);
    }
    return ccMember;
  }




  // ----------------------------------------------------------------------
  // bccMember
  // ----------------------------------------------------------------------
  protected TypeFieldEntry bccMemberTFE = channel.getTypeFieldEntry(DBMailMessage.class, "bccMember", true);
  protected Member[] bccMember = new Member[0];
  protected int bccMemberAddCount = 0;
  String[] __bccMemberStr = null;
  public void setBccMember(String[]  v) {
    __bccMemberStr = v;
  }
  public Member[] getAvailableBccMember() {
    if (theContent != null && isFieldMissing("bccMember")) {
	  Set<Member> objectValue = theContent.getBccMember();
      if (objectValue == null) {
        return bccMember;
      }
      return objectValue.toArray(new Member[objectValue.size()]);
    }
    return bccMember;
  }




  // ----------------------------------------------------------------------
  // replyToMember
  // ----------------------------------------------------------------------
  protected TypeFieldEntry replyToMemberTFE = channel.getTypeFieldEntry(DBMailMessage.class, "replyToMember", true);
  protected boolean isReplyToMemberValidated = true;
  protected Member replyToMember;
  String __replyToMemberStr = null;
  public void setReplyToMember(String v) {
    __replyToMemberStr = v;
  }
  public Member getAvailableReplyToMember() {
    if (theContent != null && isFieldMissing("replyToMember")) {
     Member objectValue = theContent.getReplyToMember();
      return objectValue;
    }
    return replyToMember;
  }




  // ----------------------------------------------------------------------
  // contentText
  // ----------------------------------------------------------------------
  protected TypeFieldEntry contentTextTFE = channel.getTypeFieldEntry(DBMailMessage.class, "contentText", true);
  protected String contentText = channel.getTypeFieldEntry(DBMailMessage.class, "contentText", true).getDefaultTextString();
  public void setContentText(String[] v) {
    contentText = getMonolingualValue(contentTextTFE, v);
  }
  public String getAvailableContentText() {
    if (theContent != null && isFieldMissing("contentText")) {
     String objectValue = theContent.getContentText();
      return objectValue;
    }
    return contentText;
  }




  // ----------------------------------------------------------------------
  // contentHtml
  // ----------------------------------------------------------------------
  protected TypeFieldEntry contentHtmlTFE = channel.getTypeFieldEntry(DBMailMessage.class, "contentHtml", true);
  protected String contentHtml = channel.getTypeFieldEntry(DBMailMessage.class, "contentHtml", true).getDefaultTextString();
  public void setContentHtml(String[] v) {
    contentHtml = getMonolingualValue(contentHtmlTFE, v);
  }
  public String getAvailableContentHtml() {
    if (theContent != null && isFieldMissing("contentHtml")) {
     String objectValue = theContent.getContentHtml();
      return objectValue;
    }
    return contentHtml;
  }




  // ----------------------------------------------------------------------
  // attachements
  // ----------------------------------------------------------------------
  protected TypeFieldEntry attachementsTFE = channel.getTypeFieldEntry(DBMailMessage.class, "attachements", true);
  protected com.jalios.jcms.FileDocument[] attachements = new com.jalios.jcms.FileDocument[0];
  protected int attachementsAddCount = 0;
  String[] __attachementsStr = null;
  public void setAttachements(String[]  v) {
    __attachementsStr = v;
  }
  public com.jalios.jcms.FileDocument[] getAvailableAttachements() {
    if (theContent != null && isFieldMissing("attachements")) {
	  Set<com.jalios.jcms.FileDocument> objectValue = theContent.getAttachements();
      if (objectValue == null) {
        return attachements;
      }
      return objectValue.toArray(new com.jalios.jcms.FileDocument[objectValue.size()]);
    }
    return attachements;
  }




  // ----------------------------------------------------------------------
  // sentDate
  // ----------------------------------------------------------------------
  protected TypeFieldEntry sentDateTFE = channel.getTypeFieldEntry(DBMailMessage.class, "sentDate", true);
  protected String __sentDateStr = "";
  protected boolean isSentDateValidated = true;
  protected Date sentDate;
  public void setSentDate(String v) {
    try {
        SimpleDateFormat dateFormatter = channel.getDateTimeFormat(userLang);
        dateFormatter =  (SimpleDateFormat) dateFormatter.clone();
        dateFormatter.setLenient(false);
      __sentDateStr = v.trim();
      sentDate = dateFormatter.parse(__sentDateStr);
    } catch(java.text.ParseException ex) {
      isSentDateValidated = false;
    }
  }
  public java.util.Date getAvailableSentDate() {
    if (theContent != null && isFieldMissing("sentDate")) {
     java.util.Date objectValue = theContent.getSentDate();
      return objectValue;
    }
    return sentDate;
  }




  // ----------------------------------------------------------------------
  // receivedDate
  // ----------------------------------------------------------------------
  protected TypeFieldEntry receivedDateTFE = channel.getTypeFieldEntry(DBMailMessage.class, "receivedDate", true);
  protected String __receivedDateStr = "";
  protected boolean isReceivedDateValidated = true;
  protected Date receivedDate;
  public void setReceivedDate(String v) {
    try {
        SimpleDateFormat dateFormatter = channel.getDateTimeFormat(userLang);
        dateFormatter =  (SimpleDateFormat) dateFormatter.clone();
        dateFormatter.setLenient(false);
      __receivedDateStr = v.trim();
      receivedDate = dateFormatter.parse(__receivedDateStr);
    } catch(java.text.ParseException ex) {
      isReceivedDateValidated = false;
    }
  }
  public java.util.Date getAvailableReceivedDate() {
    if (theContent != null && isFieldMissing("receivedDate")) {
     java.util.Date objectValue = theContent.getReceivedDate();
      return objectValue;
    }
    return receivedDate;
  }




  // ----------------------------------------------------------------------
  // priority
  // ----------------------------------------------------------------------
  protected TypeFieldEntry priorityTFE = channel.getTypeFieldEntry(DBMailMessage.class, "priority", true);
  protected boolean isPriorityValidated = true;
  protected int priority = 0;
  public void setPriority(String v) {
    try {
      priority = Integer.parseInt(v.trim());
    } catch(NumberFormatException ex) {
      isPriorityValidated = false;
    }
  }
  public int getAvailablePriority() {
    if (theContent != null && isFieldMissing("priority")) {
     int objectValue = theContent.getPriority();
      return objectValue;
    }
    return priority;
  }




  // ----------------------------------------------------------------------
  // account
  // ----------------------------------------------------------------------
  protected TypeFieldEntry accountTFE = channel.getTypeFieldEntry(DBMailMessage.class, "account", true);
  protected String account = channel.getTypeFieldEntry(DBMailMessage.class, "account", true).getDefaultTextString();
  public void setAccount(String[] v) {
    account = getMonolingualValue(accountTFE, v);
  }
  public String getAvailableAccount() {
    if (theContent != null && isFieldMissing("account")) {
     String objectValue = theContent.getAccount();
      return objectValue;
    }
    return account;
  }




  // ----------------------------------------------------------------------
  // inReplyTo
  // ----------------------------------------------------------------------
  protected TypeFieldEntry inReplyToTFE = channel.getTypeFieldEntry(DBMailMessage.class, "inReplyTo", true);
  protected String inReplyTo = channel.getTypeFieldEntry(DBMailMessage.class, "inReplyTo", true).getDefaultTextString();
  public void setInReplyTo(String[] v) {
    inReplyTo = getMonolingualValue(inReplyToTFE, v);
  }
  public String getAvailableInReplyTo() {
    if (theContent != null && isFieldMissing("inReplyTo")) {
     String objectValue = theContent.getInReplyTo();
      return objectValue;
    }
    return inReplyTo;
  }




  // ----------------------------------------------------------------------
  // references
  // ----------------------------------------------------------------------
  protected TypeFieldEntry referencesTFE = channel.getTypeFieldEntry(DBMailMessage.class, "references", true);
  protected String[] references;
  public void setReferences(String[] v) {
    references = getMonolingualValueArray(referencesTFE, v);
  }

  public String[] getAvailableReferences() {
    if (theContent != null && isFieldMissing("references")) {
	  Set<String> objectValue = theContent.getReferences();
      if (objectValue == null) {
        return references;
      }
      return objectValue.toArray(new String[objectValue.size()]);
    }
    return references;
  }




  // ----------------------------------------------------------------------
  // messageId
  // ----------------------------------------------------------------------
  protected TypeFieldEntry messageIdTFE = channel.getTypeFieldEntry(DBMailMessage.class, "messageId", true);
  protected String messageId = channel.getTypeFieldEntry(DBMailMessage.class, "messageId", true).getDefaultTextString();
  public void setMessageId(String[] v) {
    messageId = getMonolingualValue(messageIdTFE, v);
  }
  public String getAvailableMessageId() {
    if (theContent != null && isFieldMissing("messageId")) {
     String objectValue = theContent.getMessageId();
      return objectValue;
    }
    return messageId;
  }




  // ----------------------------------------------------------------------
  // thread
  // ----------------------------------------------------------------------
  protected TypeFieldEntry threadTFE = channel.getTypeFieldEntry(DBMailMessage.class, "thread", true);
  protected String thread = channel.getTypeFieldEntry(DBMailMessage.class, "thread", true).getDefaultTextString();
  public void setThread(String[] v) {
    thread = getMonolingualValue(threadTFE, v);
  }
  public String getAvailableThread() {
    if (theContent != null && isFieldMissing("thread")) {
     String objectValue = theContent.getThread();
      return objectValue;
    }
    return thread;
  }






}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// dMNZ0qoy3JmyJ4cN4xx8Dw==
