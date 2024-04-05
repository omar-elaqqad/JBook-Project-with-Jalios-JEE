// This file has been automatically generated.
   
package generated;
 
import java.util.*;
 
import org.apache.oro.text.regex.Pattern;
import org.apache.oro.text.regex.Perl5Compiler;
import org.apache.oro.text.regex.Perl5Matcher;
import org.hibernate.Hibernate;
 
import com.jalios.jcms.*;
import com.jalios.jcms.db.*;
import com.jalios.jcms.mashup.*;
import com.jalios.jcms.wysiwyg.*;
import com.jalios.util.*;
import com.fasterxml.jackson.annotation.JsonIgnore; 
import com.fasterxml.jackson.annotation.JsonProperty;
 
@SuppressWarnings({"unchecked", "unused"})
public  class DBMailMessage extends com.jalios.jcms.mail.MailMessage 
             implements 
                com.jalios.jcms.db.TrackedDBData
               , com.jalios.jstore.Searchable
               , DBData
               , CategorizedDBData
{
  
  // ----------------------------------------------------------------------
  // CONSTRUCTORS
  // ----------------------------------------------------------------------  
  public DBMailMessage() {}
 
 
 
  
  
  
  public DBMailMessage(DBMailMessage other) {
    super(other);
    from = other.from;
    to = other.to;
    cc = other.cc;
    bcc = other.bcc;
    replyTo = other.replyTo;
    fromMember = other.fromMember;
    toMember = other.toMember;
    ccMember = other.ccMember;
    bccMember = other.bccMember;
    replyToMember = other.replyToMember;
    contentText = other.contentText;
    contentHtml = other.contentHtml;
    attachements = other.attachements;
    sentDate = other.sentDate;
    receivedDate = other.receivedDate;
    priority = other.priority;
    account = other.account;
    inReplyTo = other.inReplyTo;
    references = other.references;
    messageId = other.messageId;
    thread = other.thread;
  }
  
  // ----------------------------------------------------------------------
  // Import / Export
  // ----------------------------------------------------------------------
  public void importXml(org.jdom.Element elt, ImportOptions options) {
    super.importXml(elt, options);
    
    setFrom(ImportUtil.parseFieldText(elt, "from"));
    setTo(ImportUtil.parseFieldTextSet(elt, "to"));
    setCc(ImportUtil.parseFieldTextSet(elt, "cc"));
    setBcc(ImportUtil.parseFieldTextSet(elt, "bcc"));
    setReplyTo(ImportUtil.parseFieldText(elt, "replyTo"));
    setContentText(ImportUtil.parseFieldText(elt, "contentText"));
    setSentDate(ImportUtil.parseFieldDate(elt, "sentDate"));
    setReceivedDate(ImportUtil.parseFieldDate(elt, "receivedDate"));
    setPriority(ImportUtil.parseFieldInt(elt, "priority"));
    setAccount(ImportUtil.parseFieldText(elt, "account"));
    setInReplyTo(ImportUtil.parseFieldText(elt, "inReplyTo"));
    setReferences(ImportUtil.parseFieldTextSet(elt, "references"));
    setMessageId(ImportUtil.parseFieldText(elt, "messageId"));
    setThread(ImportUtil.parseFieldText(elt, "thread"));
  }
  
  protected void importXmlFieldsWithReferences(org.jdom.Element elt, ImportOptions options) {
    super.importXmlFieldsWithReferences(elt, options);
      
    if (options.isSelfImport()) {
      setContentHtml(ImportUtil.parseFieldText(elt, "contentHtml"));
      setAttachements(ImportUtil.parseSelfFieldDataSet(elt, "attachements", com.jalios.jcms.FileDocument.class));
    } else {
    
    setContentHtml(ImportUtil.parseFieldWysiwyg(elt, "contentHtml"));
    setAttachements((Set<com.jalios.jcms.FileDocument>)ImportUtil.parseFieldDataSet(elt, "attachements", com.jalios.jcms.FileDocument.class));
    }
  }
  
  public void exportXmlField(StringBuffer sb, int indentLevel) {
    super.exportXmlField(sb, indentLevel);
    sb.append(ExportUtil.exportField(indentLevel, "from", getFrom(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "to", getTo()));
    sb.append(ExportUtil.exportField(indentLevel, "cc", getCc()));
    sb.append(ExportUtil.exportField(indentLevel, "bcc", getBcc()));
    sb.append(ExportUtil.exportField(indentLevel, "replyTo", getReplyTo(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "fromMember", getFromMember()));
    sb.append(ExportUtil.exportField(indentLevel, "toMember", getToMember()));
    sb.append(ExportUtil.exportField(indentLevel, "ccMember", getCcMember()));
    sb.append(ExportUtil.exportField(indentLevel, "bccMember", getBccMember()));
    sb.append(ExportUtil.exportField(indentLevel, "replyToMember", getReplyToMember()));
    sb.append(ExportUtil.exportField(indentLevel, "contentText", getContentText(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "contentHtml", getContentHtml(), false, false));
    sb.append(ExportUtil.exportField(indentLevel, "attachements", getAttachements()));
    sb.append(ExportUtil.exportField(indentLevel, "sentDate", getSentDate()));
    sb.append(ExportUtil.exportField(indentLevel, "receivedDate", getReceivedDate()));
    sb.append(ExportUtil.exportField(indentLevel, "priority", getPriority()));
    sb.append(ExportUtil.exportField(indentLevel, "account", getAccount(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "inReplyTo", getInReplyTo(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "references", getReferences()));
    sb.append(ExportUtil.exportField(indentLevel, "messageId", getMessageId(), false, true));
    sb.append(ExportUtil.exportField(indentLevel, "thread", getThread(), false, true));
  }
  
  public Set<FileDocument> getDocumentLinkSet() {
    Set<FileDocument> docSet = super.getDocumentLinkSet();
    return docSet;
  }
  
  // ----------------------------------------------------------------------
  // TYPE AND FIELD INFOS (static methods)
  // ----------------------------------------------------------------------  
  /**
   * Returns the TypeEntry bound to <code>DBMailMessage</code>. <br>
   * @see com.jalios.jcms.Channel#getTypeEntry(Class)
   * @since jcms-5.5
   */
  public static TypeEntry getTypeEntry() {
    return channel.getTypeEntry(DBMailMessage.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>DBMailMessage</code>. <br>
   * This array <strong>does not</strong> contain inherited TypeFieldEntry from super classes of <code>DBMailMessage</code>. <br/>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>DBMailMessage</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getTypeFieldEntries() {
    return channel.getTypeFieldEntries(DBMailMessage.class);
  }
  /**
   * Return an array of <code>TypeFieldEntry</code> bound to <code>DBMailMessage</code>. <br>
   * This array <strong>does</strong> contain inherited TypeFieldEntry from super classes of <code>DBMailMessage</code>. <br>
   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>DBMailMessage</code> or an empty array (never return null)
   * @see com.jalios.jcms.Channel#getAllTypeFieldEntries(Class)
   * @since jcms-5.5
   */
  public static TypeFieldEntry[] getAllTypeFieldEntries() {
    return channel.getAllTypeFieldEntries(DBMailMessage.class);
  }
  // ----------------------------------------------------------------------
  // FIELDs VALUE
  // ----------------------------------------------------------------------  
  /**
   * Gets the value of the given <code>int</code> field name for the current <code>DBMailMessage</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public int getIntFieldValue(String fieldName) throws NoSuchFieldException {
    if ("priority".equals(fieldName)) { return getPriority(); }
    return super.getIntFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>int</code> field name for the current <code>DBMailMessage</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>int</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setIntFieldValue(String fieldName, int value) throws NoSuchFieldException {
    if ("priority".equals(fieldName)) { setPriority(value); return; }
    super.setIntFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>long</code> field name for the current <code>DBMailMessage</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public long getLongFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getLongFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>long</code> field name for the current <code>DBMailMessage</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>long</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setLongFieldValue(String fieldName, long value) throws NoSuchFieldException {
    super.setLongFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>double</code> field name for the current <code>DBMailMessage</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public double getDoubleFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getDoubleFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>double</code> field name for the current <code>DBMailMessage</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>double</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
  public void setDoubleFieldValue(String fieldName, double value) throws NoSuchFieldException {
     super.setDoubleFieldValue(fieldName, value);
  }
  
  /**
   * Gets the value of the given <code>boolean</code> field name for the current <code>DBMailMessage</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @return the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   */
  public boolean getBooleanFieldValue(String fieldName) throws NoSuchFieldException {
    return super.getBooleanFieldValue(fieldName);
  }
  
  /**
   * Sets the value of the given <code>boolean</code> field name for the current <code>DBMailMessage</code>.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>boolean</code> field value
   * @throws NoSuchFieldException if the field was not found.
   * @since jcms-6.3.0 
   */
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
  public TreeSet<Category> getCategoryFieldValue(String fieldName, Member mbr) throws NoSuchFieldException {
    return super.getCategoryFieldValue(fieldName, mbr);
  }
  /**
   * Gets the <code>Object</code> value of the given field name for this <code>DBMailMessage</code>. <br>
   * Do not retrieve <code>Category</code> fields, see {@link #getCategoryFieldValue(String, Member)}.
   * @param fieldName the field name from which to retrieve the field value.
   * @param lang the language (ISO-639 code) in which to retrieve the field value
   *        (used only for multilingual fields).
   * @param useDefault whether to use the publication main language if the field value 
   *        is not available in the requested language (used only for multilingual fields).
   * @return the <code>Object</code> field value
   * @throws NoSuchFieldException if the field was not found in the given <code>Publication</code>.
   */
  public Object getFieldValue(String fieldName, String lang, boolean useDefault) throws NoSuchFieldException {
    if ("from".equals(fieldName)) { return getFrom(); }
    if ("to".equals(fieldName)) { return getTo(); }
    if ("cc".equals(fieldName)) { return getCc(); }
    if ("bcc".equals(fieldName)) { return getBcc(); }
    if ("replyTo".equals(fieldName)) { return getReplyTo(); }
    if ("fromMember".equals(fieldName)) { return getFromMember(); }
    if ("toMember".equals(fieldName)) { return getToMember(); }
    if ("ccMember".equals(fieldName)) { return getCcMember(); }
    if ("bccMember".equals(fieldName)) { return getBccMember(); }
    if ("replyToMember".equals(fieldName)) { return getReplyToMember(); }
    if ("contentText".equals(fieldName)) { return getContentText(); }
    if ("contentHtml".equals(fieldName)) { return getContentHtml(); }
    if ("attachements".equals(fieldName)) { return getAttachements(); }
    if ("sentDate".equals(fieldName)) { return getSentDate(); }
    if ("receivedDate".equals(fieldName)) { return getReceivedDate(); }
    if ("account".equals(fieldName)) { return getAccount(); }
    if ("inReplyTo".equals(fieldName)) { return getInReplyTo(); }
    if ("references".equals(fieldName)) { return getReferences(); }
    if ("messageId".equals(fieldName)) { return getMessageId(); }
    if ("thread".equals(fieldName)) { return getThread(); }
    return super.getFieldValue(fieldName, lang, useDefault);
  }
  
  /**
   * Sets the <code>Object</code> value of the given field name for this <code>DBMailMessage</code>. <br>
   * Do not set <code>Category</code> fields, see {@link #setCategoryFieldValue(String, TreeSet)}.
   * @param fieldName the field name from which to retrieve the field value.
   * @param value the <code>Object</code> field value
   * @param lang the language (ISO-639 code) in which to retrieve the field value
   *        (used only for multilingual fields).
   * 
   * @throws NoSuchFieldException if the field was not found in the given <code>Publication</code>.
   * @since jcms-6.3.0 
   */
  public void setFieldValue(String fieldName, Object value, String lang) throws NoSuchFieldException {
    if ("from".equals(fieldName)) { setFrom((String)value); return; }
    if ("to".equals(fieldName)) { setTo((Set<String>)value); return; }
    if ("cc".equals(fieldName)) { setCc((Set<String>)value); return; }
    if ("bcc".equals(fieldName)) { setBcc((Set<String>)value); return; }
    if ("replyTo".equals(fieldName)) { setReplyTo((String)value); return; }
    if ("fromMember".equals(fieldName)) { setFromMember((Member)value); return; }
    if ("toMember".equals(fieldName)) { setToMember((Set<Member>)value); return; }
    if ("ccMember".equals(fieldName)) { setCcMember((Set<Member>)value); return; }
    if ("bccMember".equals(fieldName)) { setBccMember((Set<Member>)value); return; }
    if ("replyToMember".equals(fieldName)) { setReplyToMember((Member)value); return; }
    if ("contentText".equals(fieldName)) { setContentText((String)value); return; }
    if ("contentHtml".equals(fieldName)) { setContentHtml((String)value); return; }
    if ("attachements".equals(fieldName)) { setAttachements((Set<com.jalios.jcms.FileDocument>)value); return; }
    if ("sentDate".equals(fieldName)) { setSentDate((java.util.Date)value); return; }
    if ("receivedDate".equals(fieldName)) { setReceivedDate((java.util.Date)value); return; }
    if ("account".equals(fieldName)) { setAccount((String)value); return; }
    if ("inReplyTo".equals(fieldName)) { setInReplyTo((String)value); return; }
    if ("references".equals(fieldName)) { setReferences((Set<String>)value); return; }
    if ("messageId".equals(fieldName)) { setMessageId((String)value); return; }
    if ("thread".equals(fieldName)) { setThread((String)value); return; }
    super.setFieldValue(fieldName, value, lang);
  }
  
  // ----------------------------------------------------------------------
  // from
  // ----------------------------------------------------------------------  
  
  protected  String from = channel.getTypeFieldEntry(DBMailMessage.class, "from", true).getDefaultTextString();
  
  public String getFrom() { return from; }
  
  public void setFrom(String v) { from = v; }
  
  
  
  public String getFrom(String lang) { return from; }
  public String getFrom(String lang, boolean useDefault) { return from; }
  // ----------------------------------------------------------------------
  // to
  // ----------------------------------------------------------------------  
  
  protected  Set<String> to = new HashSet<String>();
  
  public Set<String> getTo() { return to; }
  
  public void setTo(Set<String> v) { 
    to = HibernateUtil.updateCollection(to, v, false);
  }
  
  
  
  public Set<String> getTo(String lang) { return to; }
  public Set<String> getTo(String lang, boolean useDefault) { return to; }
  // ----------------------------------------------------------------------
  // cc
  // ----------------------------------------------------------------------  
  
  protected  Set<String> cc = new HashSet<String>();
  
  public Set<String> getCc() { return cc; }
  
  public void setCc(Set<String> v) { 
    cc = HibernateUtil.updateCollection(cc, v, false);
  }
  
  
  
  public Set<String> getCc(String lang) { return cc; }
  public Set<String> getCc(String lang, boolean useDefault) { return cc; }
  // ----------------------------------------------------------------------
  // bcc
  // ----------------------------------------------------------------------  
  
  protected  Set<String> bcc = new HashSet<String>();
  
  public Set<String> getBcc() { return bcc; }
  
  public void setBcc(Set<String> v) { 
    bcc = HibernateUtil.updateCollection(bcc, v, false);
  }
  
  
  
  public Set<String> getBcc(String lang) { return bcc; }
  public Set<String> getBcc(String lang, boolean useDefault) { return bcc; }
  // ----------------------------------------------------------------------
  // replyTo
  // ----------------------------------------------------------------------  
  
  protected  String replyTo = channel.getTypeFieldEntry(DBMailMessage.class, "replyTo", true).getDefaultTextString();
  
  public String getReplyTo() { return replyTo; }
  
  public void setReplyTo(String v) { replyTo = v; }
  
  
  
  public String getReplyTo(String lang) { return replyTo; }
  public String getReplyTo(String lang, boolean useDefault) { return replyTo; }
  // ----------------------------------------------------------------------
  // fromMember
  // ----------------------------------------------------------------------  
  
  @JsonProperty
  protected transient Member fromMember;
  protected transient String fromMemberId;
  
  public Member getFromMember() { return fromMember; }
  public void setFromMember(Member v) { 
    fromMemberId = null;
    fromMember = v;
  }
  
  public String getFromMemberId() { 
    if (fromMember == null) {
      return fromMemberId;
    }
    return fromMember.getId(); 
  }
  public void setFromMemberId(String v) {
    fromMemberId = v;
    fromMember = channel.getData(Member.class, v);   
  }
  
  
  // ----------------------------------------------------------------------
  // toMember
  // ----------------------------------------------------------------------  
  
  @JsonProperty
  protected transient Set<Member> toMember = new HashSet<Member>();
  private transient DataSetHelper<Member> toMemberSetHelper = DataSetHelper.build(this, Member.class, this::setToMember);
  
  public Set<Member> getToMember() {
    return getToMember(false);
  }
  public Set<Member> getToMember(boolean modifiable) {
    if (isDBData()) {
      toMemberSetHelper.refreshDataCollectionIfNeeded();
    }
    if (toMember != null && !modifiable) {
      return Collections.unmodifiableSet(toMember);
    }
    return toMember; 
  }
  public void setToMember(Set<Member> v) { 
    toMember = v; 
    if (isDBData()) {
      toMemberSetHelper.updateIdSet(v);
    }
  }
  
  @JsonIgnore
  public Set<String> getToMemberId() {
    if (isDBData()) { 
      return toMemberSetHelper.getIdSet();
    }
    return null;
  }
  public void setToMemberId(Set<String> v) { 
    if (isDBData()) { 
      toMemberSetHelper.setIdSet(v);
    }
  }
  
  
  // ----------------------------------------------------------------------
  // ccMember
  // ----------------------------------------------------------------------  
  
  @JsonProperty
  protected transient Set<Member> ccMember = new HashSet<Member>();
  private transient DataSetHelper<Member> ccMemberSetHelper = DataSetHelper.build(this, Member.class, this::setCcMember);
  
  public Set<Member> getCcMember() {
    return getCcMember(false);
  }
  public Set<Member> getCcMember(boolean modifiable) {
    if (isDBData()) {
      ccMemberSetHelper.refreshDataCollectionIfNeeded();
    }
    if (ccMember != null && !modifiable) {
      return Collections.unmodifiableSet(ccMember);
    }
    return ccMember; 
  }
  public void setCcMember(Set<Member> v) { 
    ccMember = v; 
    if (isDBData()) {
      ccMemberSetHelper.updateIdSet(v);
    }
  }
  
  @JsonIgnore
  public Set<String> getCcMemberId() {
    if (isDBData()) { 
      return ccMemberSetHelper.getIdSet();
    }
    return null;
  }
  public void setCcMemberId(Set<String> v) { 
    if (isDBData()) { 
      ccMemberSetHelper.setIdSet(v);
    }
  }
  
  
  // ----------------------------------------------------------------------
  // bccMember
  // ----------------------------------------------------------------------  
  
  @JsonProperty
  protected transient Set<Member> bccMember = new HashSet<Member>();
  private transient DataSetHelper<Member> bccMemberSetHelper = DataSetHelper.build(this, Member.class, this::setBccMember);
  
  public Set<Member> getBccMember() {
    return getBccMember(false);
  }
  public Set<Member> getBccMember(boolean modifiable) {
    if (isDBData()) {
      bccMemberSetHelper.refreshDataCollectionIfNeeded();
    }
    if (bccMember != null && !modifiable) {
      return Collections.unmodifiableSet(bccMember);
    }
    return bccMember; 
  }
  public void setBccMember(Set<Member> v) { 
    bccMember = v; 
    if (isDBData()) {
      bccMemberSetHelper.updateIdSet(v);
    }
  }
  
  @JsonIgnore
  public Set<String> getBccMemberId() {
    if (isDBData()) { 
      return bccMemberSetHelper.getIdSet();
    }
    return null;
  }
  public void setBccMemberId(Set<String> v) { 
    if (isDBData()) { 
      bccMemberSetHelper.setIdSet(v);
    }
  }
  
  
  // ----------------------------------------------------------------------
  // replyToMember
  // ----------------------------------------------------------------------  
  
  @JsonProperty
  protected transient Member replyToMember;
  protected transient String replyToMemberId;
  
  public Member getReplyToMember() { return replyToMember; }
  public void setReplyToMember(Member v) { 
    replyToMemberId = null;
    replyToMember = v;
  }
  
  public String getReplyToMemberId() { 
    if (replyToMember == null) {
      return replyToMemberId;
    }
    return replyToMember.getId(); 
  }
  public void setReplyToMemberId(String v) {
    replyToMemberId = v;
    replyToMember = channel.getData(Member.class, v);   
  }
  
  
  // ----------------------------------------------------------------------
  // contentText
  // ----------------------------------------------------------------------  
  
  protected  String contentText = channel.getTypeFieldEntry(DBMailMessage.class, "contentText", true).getDefaultTextString();
  
  public String getContentText() { return contentText; }
  
  public void setContentText(String v) { contentText = v; }
  
  
  
  public String getContentText(String lang) { return contentText; }
  public String getContentText(String lang, boolean useDefault) { return contentText; }
  // ----------------------------------------------------------------------
  // contentHtml
  // ----------------------------------------------------------------------  
  
  protected  String contentHtml = channel.getTypeFieldEntry(DBMailMessage.class, "contentHtml", true).getDefaultTextString();
  
  public String getContentHtml() { return contentHtml; }
  
  public void setContentHtml(String v) { contentHtml = v; }
  
  
  
  public String getContentHtml(String lang) { return contentHtml; }
  public String getContentHtml(String lang, boolean useDefault) { return contentHtml; }
  // ----------------------------------------------------------------------
  // attachements
  // ----------------------------------------------------------------------  
  
  @JsonProperty
  protected transient Set<com.jalios.jcms.FileDocument> attachements = new HashSet<com.jalios.jcms.FileDocument>();
  private transient DataSetHelper<com.jalios.jcms.FileDocument> attachementsSetHelper = DataSetHelper.build(this, com.jalios.jcms.FileDocument.class, this::setAttachements);
  
  public Set<com.jalios.jcms.FileDocument> getAttachements() {
    return getAttachements(false);
  }
  public Set<com.jalios.jcms.FileDocument> getAttachements(boolean modifiable) {
    if (isDBData()) {
      attachementsSetHelper.refreshDataCollectionIfNeeded();
    }
    if (attachements != null && !modifiable) {
      return Collections.unmodifiableSet(attachements);
    }
    return attachements; 
  }
  public void setAttachements(Set<com.jalios.jcms.FileDocument> v) { 
    attachements = v; 
    if (isDBData()) {
      attachementsSetHelper.updateIdSet(v);
    }
  }
  
  @JsonIgnore
  public Set<String> getAttachementsId() {
    if (isDBData()) { 
      return attachementsSetHelper.getIdSet();
    }
    return null;
  }
  public void setAttachementsId(Set<String> v) { 
    if (isDBData()) { 
      attachementsSetHelper.setIdSet(v);
    }
  }
  
  
  public Set<com.jalios.jcms.FileDocument> getAttachements(String lang) { return attachements; }
  public Set<com.jalios.jcms.FileDocument> getAttachements(String lang, boolean useDefault) { return attachements; }
  // ----------------------------------------------------------------------
  // sentDate
  // ----------------------------------------------------------------------  
  
  protected  java.util.Date sentDate;
  
  public java.util.Date getSentDate() { return sentDate; }
  
  public void setSentDate(java.util.Date v) { sentDate = v; }
  
  
  
  // ----------------------------------------------------------------------
  // receivedDate
  // ----------------------------------------------------------------------  
  
  protected  java.util.Date receivedDate;
  
  public java.util.Date getReceivedDate() { return receivedDate; }
  
  public void setReceivedDate(java.util.Date v) { receivedDate = v; }
  
  
  
  // ----------------------------------------------------------------------
  // priority
  // ----------------------------------------------------------------------  
  
  protected  int priority = 0;
  
  public int getPriority() { return priority; }
  
  public void setPriority(Integer v) {
    priority = v == null ? 0 : v.intValue();
  }
  
  
  
  public static IntegerFormReport getPriorityReport(SortedSet<DBMailMessage> set) {
    long sum = 0;
    int min = Integer.MAX_VALUE;
    int max = Integer.MIN_VALUE;
    for (DBMailMessage obj : set) {
      if (obj == null) {
        continue;
      }
      int value = obj.getPriority();
      sum += value;
      min = Math.min(value, min);
      max = Math.max(value, max);
    }
    return new IntegerFormReport(set.size(), sum, min, max);
  }  
  // ----------------------------------------------------------------------
  // account
  // ----------------------------------------------------------------------  
  
  protected  String account = channel.getTypeFieldEntry(DBMailMessage.class, "account", true).getDefaultTextString();
  
  public String getAccount() { return account; }
  
  public void setAccount(String v) { account = v; }
  
  
  
  public String getAccount(String lang) { return account; }
  public String getAccount(String lang, boolean useDefault) { return account; }
  // ----------------------------------------------------------------------
  // inReplyTo
  // ----------------------------------------------------------------------  
  
  protected  String inReplyTo = channel.getTypeFieldEntry(DBMailMessage.class, "inReplyTo", true).getDefaultTextString();
  
  public String getInReplyTo() { return inReplyTo; }
  
  public void setInReplyTo(String v) { inReplyTo = v; }
  
  
  
  public String getInReplyTo(String lang) { return inReplyTo; }
  public String getInReplyTo(String lang, boolean useDefault) { return inReplyTo; }
  // ----------------------------------------------------------------------
  // references
  // ----------------------------------------------------------------------  
  
  protected  Set<String> references = new HashSet<String>();
  
  public Set<String> getReferences() { return references; }
  
  public void setReferences(Set<String> v) { 
    references = HibernateUtil.updateCollection(references, v, false);
  }
  
  
  
  public Set<String> getReferences(String lang) { return references; }
  public Set<String> getReferences(String lang, boolean useDefault) { return references; }
  // ----------------------------------------------------------------------
  // messageId
  // ----------------------------------------------------------------------  
  
  protected  String messageId = channel.getTypeFieldEntry(DBMailMessage.class, "messageId", true).getDefaultTextString();
  
  public String getMessageId() { return messageId; }
  
  public void setMessageId(String v) { messageId = v; }
  
  
  
  public String getMessageId(String lang) { return messageId; }
  public String getMessageId(String lang, boolean useDefault) { return messageId; }
  // ----------------------------------------------------------------------
  // thread
  // ----------------------------------------------------------------------  
  
  protected  String thread = channel.getTypeFieldEntry(DBMailMessage.class, "thread", true).getDefaultTextString();
  
  public String getThread() { return thread; }
  
  public void setThread(String v) { thread = v; }
  
  
  
  public String getThread(String lang) { return thread; }
  public String getThread(String lang, boolean useDefault) { return thread; }
  @Override
  public String[] getSearchStrings() {
    StringBuffer sb = new StringBuffer(super.getSearchStrings()[0]);
    sb.ensureCapacity(500 * (9 + 0 + 0 + 0 + 0 + 0) );
    if (account != null) {
      sb.append(account); sb.append(' ');
    }
    if (contentHtml != null) {
      sb.append(contentHtml); sb.append(' ');
    }
    if (contentText != null) {
      sb.append(contentText); sb.append(' ');
    }
    if (from != null) {
      sb.append(from); sb.append(' ');
    }
    if (inReplyTo != null) {
      sb.append(inReplyTo); sb.append(' ');
    }
    if (messageId != null) {
      sb.append(messageId); sb.append(' ');
    }
    if (replyTo != null) {
      sb.append(replyTo); sb.append(' ');
    }
    if (thread != null) {
      sb.append(thread); sb.append(' ');
    }
    if (title != null) {
      sb.append(title); sb.append(' ');
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
    sb.ensureCapacity(500 * (1 + 0 + 0 + 0 + 0 + 0) );
    // Wiki fields containing JHTML
   // Wysiwyg fields
    if (contentHtml != null) {
      sb.append(contentHtml); sb.append(' ');
    }
    return sb.toString();
  }
  
  @Override
  public <T extends Data> TreeSet<T> getLinkDataSet(Class<T> clazz) {
    if (clazz == null) {
      return Util.emptyTreeSet();
    }
    TreeSet<T> set = new TreeSet<>();
    JcmsUtil.addData(set, clazz, getAttachements());
    JcmsUtil.addData(set, clazz, getBccMember());
    JcmsUtil.addData(set, clazz, getCcMember());
    JcmsUtil.addData(set, clazz, getFromMember());
    JcmsUtil.addData(set, clazz, getReplyToMember());
    JcmsUtil.addData(set, clazz, getToMember());
    return set;
  }
  // ----------------------------------------------------------------------
  // DataController
  // ----------------------------------------------------------------------  
  public ControllerStatus checkIntegrity() {
    
    ControllerStatus status = super.checkIntegrity();
    if (status.hasFailed()) {
      return status;
    }
    
    return ControllerStatus.OK;
  }
  
  // ----------------------------------------------------------------------
  // initializeDBDataCollections
  // ----------------------------------------------------------------------  
  @Override
  public void initializeDBDataCollections() { 
    super.initializeDBDataCollections();
    Hibernate.initialize(to);
    Hibernate.initialize(cc);
    Hibernate.initialize(bcc);
    if (toMemberSetHelper != null) { toMemberSetHelper.initializeHibernateCollection(); }  
    if (ccMemberSetHelper != null) { ccMemberSetHelper.initializeHibernateCollection(); }  
    if (bccMemberSetHelper != null) { bccMemberSetHelper.initializeHibernateCollection(); }  
    if (attachementsSetHelper != null) { attachementsSetHelper.initializeHibernateCollection(); }  
    Hibernate.initialize(references);
  }
  
  // ----------------------------------------------------------------------
  // cloneDBDataCollections
  // ----------------------------------------------------------------------  
  @Override
  public void cloneDBDataCollections() { 
    super.cloneDBDataCollections();
    if (to != null) { to = new HashSet<>(to); }
    if (cc != null) { cc = new HashSet<>(cc); }
    if (bcc != null) { bcc = new HashSet<>(bcc); }
    if (toMemberSetHelper != null) { toMemberSetHelper = toMemberSetHelper.copy(this::setToMember); }  
    if (ccMemberSetHelper != null) { ccMemberSetHelper = ccMemberSetHelper.copy(this::setCcMember); }  
    if (bccMemberSetHelper != null) { bccMemberSetHelper = bccMemberSetHelper.copy(this::setBccMember); }  
    if (attachementsSetHelper != null) { attachementsSetHelper = attachementsSetHelper.copy(this::setAttachements); }  
    if (references != null) { references = new HashSet<>(references); }
  
  }
  
  // ----------------------------------------------------------------------
  // WorkCopy
  // ----------------------------------------------------------------------  
  protected void prepareMergeCopy(Publication mergeCopy) {
    super.prepareMergeCopy(mergeCopy);  
    ((DBMailMessage)mergeCopy).setFrom(getFrom());
    ((DBMailMessage)mergeCopy).setTo(getTo());
    ((DBMailMessage)mergeCopy).setCc(getCc());
    ((DBMailMessage)mergeCopy).setBcc(getBcc());
    ((DBMailMessage)mergeCopy).setReplyTo(getReplyTo());
    ((DBMailMessage)mergeCopy).setFromMember(getFromMember());
    ((DBMailMessage)mergeCopy).setToMember(getToMember());
    ((DBMailMessage)mergeCopy).setCcMember(getCcMember());
    ((DBMailMessage)mergeCopy).setBccMember(getBccMember());
    ((DBMailMessage)mergeCopy).setReplyToMember(getReplyToMember());
    ((DBMailMessage)mergeCopy).setContentText(getContentText());
    ((DBMailMessage)mergeCopy).setContentHtml(getContentHtml());
    ((DBMailMessage)mergeCopy).setAttachements(getAttachements());
    ((DBMailMessage)mergeCopy).setSentDate(getSentDate());
    ((DBMailMessage)mergeCopy).setReceivedDate(getReceivedDate());
    ((DBMailMessage)mergeCopy).setPriority(getPriority());
    ((DBMailMessage)mergeCopy).setAccount(getAccount());
    ((DBMailMessage)mergeCopy).setInReplyTo(getInReplyTo());
    ((DBMailMessage)mergeCopy).setReferences(getReferences());
    ((DBMailMessage)mergeCopy).setMessageId(getMessageId());
    ((DBMailMessage)mergeCopy).setThread(getThread());
  }
  @Override 
  public void performCreate(Member mbr, Map context) {
    from = Util.truncateVarchar(from);
    to = Util.truncateVarchar(to);
    cc = Util.truncateVarchar(cc);
    bcc = Util.truncateVarchar(bcc);
    replyTo = Util.truncateVarchar(replyTo);
    account = Util.truncateVarchar(account);
    inReplyTo = Util.truncateVarchar(inReplyTo);
    references = Util.truncateVarchar(references);
    messageId = Util.truncateVarchar(messageId);
    thread = Util.truncateVarchar(thread);
    super.performCreate(mbr, context);
  }
  
  @Override 
  public void performUpdate(Member mbr, Map context) {
    from = Util.truncateVarchar(from);
    to = Util.truncateVarchar(to);
    cc = Util.truncateVarchar(cc);
    bcc = Util.truncateVarchar(bcc);
    replyTo = Util.truncateVarchar(replyTo);
    account = Util.truncateVarchar(account);
    inReplyTo = Util.truncateVarchar(inReplyTo);
    references = Util.truncateVarchar(references);
    messageId = Util.truncateVarchar(messageId);
    thread = Util.truncateVarchar(thread);
    super.performUpdate(mbr, context);
  }
}
// **********4A616C696F73204A434D53 *** SIGNATURE BOUNDARY ***
// e/el3bEOxG3VPf5pL56MQw==
