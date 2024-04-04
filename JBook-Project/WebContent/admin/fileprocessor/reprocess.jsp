<%@ include file="/jcore/doInitPage.jspf" %><%
%><%@ page import="org.hibernate.criterion.*" %><%
%><%@ page import="org.hibernate.*" %><%
%><%@ page import="com.jalios.jcms.fileprocessor.*" %><%
%><%@ page import="com.jalios.jcms.fileprocessor.processingmanagement.*" %><%
%><%@ page import="com.jalios.jcms.fileprocessor.repository.*" %><%
%><%@ page import="com.jalios.jcms.fileprocessor.ui.*" %><%
%><%@ page import="com.jalios.jcms.handler.*"%><%!
class DataIterator<E> implements Iterator<E> {

  boolean iterationStarted = false;
  Iterator<? extends E> curIt;
  ScrollableResults curSr;
  
  List<Iterator<? extends E>> itList = new ArrayList<Iterator<? extends E>>();
  List<ScrollableResults> srList = new ArrayList<ScrollableResults>();
  List<Class<?>> dbClazzList = new ArrayList<Class<?>>();
  int size;
  
  // Constructors

  /**
   * Creates a new empty DataIterator.
   */
  public DataIterator() { }
  
  /**
   * Creates a new DataIterator to iterate the
   * specified Collection of objects.
   * @param coll a collection to iterate
   */
  public DataIterator(Collection<? extends E> coll) {
    addCollection(coll);
  }

  /**
   * Creates a new DataIterator to iterate the specified JcmsDB results.
   * @param sr the JcmsDB ScrollableResults.
   * @param dbcount the number or result returned in the ScrollableResults.
   */
  public DataIterator(ScrollableResults sr, int dbcount) {
    addScrollableResults(sr, dbcount);
  }
  
  /**
   * Creates a new DataIterator to iterate both the specified Collection the JcmsDB results.
   * 
   * @param coll the collection to iterate (can be null, in which case iterate on collection is skipped).
   * @param sr the JcmsDB ScrollableResults.
   * @param dbcount the number or result returned in the ScrollableResults.
   */
  public DataIterator(Collection<? extends E> coll, ScrollableResults sr, int dbcount) {
    addCollection(coll);
    addScrollableResults(sr, dbcount);
  }

  // Add methods (Collection / ScrollableResults)

  /**
   * Add the specified Collection to the element to iterate.
   * @param coll the Collection to iterate (can be null, in which case iterate on collection is skipped).
   * @throws IllegalStateException if the iteration has already begun
   */
  public void addCollection(Collection<? extends E> coll) {
    if (iterationStarted) {
      throw new IllegalStateException("Cannot add a Collection when the iteration has already begun.");
    }
    if (coll == null) {
      return;
    }
    itList.add(coll.iterator());
    size += coll.size();
  }
  
  /**
   * Add the specified ScrollableResults to the element to iterate.
   * @param sr the JcmsDB ScrollableResults.
   * @param dbcount the number or result returned in the ScrollableResults.
   * @throws IllegalStateException if the iteration has already begun
   */
  public void addScrollableResults(ScrollableResults sr, int dbcount) {
    if (iterationStarted) {
      throw new IllegalStateException("Cannot add a ScrollableResults when the iteration has already begun.");
    }
    if (sr == null) {
      return;
    }
    srList.add(sr);
    size += dbcount;
  }

  /**
   * Add the specified DB Class to the element to iterate.
   * @param clazz a class of data inside the database
   * @throws IllegalStateException if the iteration has already begun
   * @since jcms-7.0.0
   */
  public void addDBClass(Class<?> clazz) {
    if (iterationStarted) {
      throw new IllegalStateException("Cannot add a ScrollableResults when the iteration has already begun.");
    }
    if (clazz == null) {
      return;
    }
    int dbcount = HibernateUtil.queryCount(clazz, null);
    size += dbcount;
    dbClazzList.add(clazz);
  }

  // Iterator methods
  
  /**
   * Returns <tt>true</tt> if the iteration has more elements. (In other
   * words, returns <tt>true</tt> if <tt>next</tt> would return an element
   * rather than throwing an exception.)
   *
   * @return <tt>true</tt> if the iterator has more elements.
   */
  public boolean hasNext() {
    iterationStarted = true;
    
    // Iterator
    if (curIt == null && itList.size() > 0) {
      curIt = itList.remove(0);
    }
    if (curIt != null) {
      if (curIt.hasNext()) {
        return true;
      }
      curIt = null;
      return hasNext();
    }

    // ScrollableResults
    if (curSr == null) {
      // Retrieve ScrollableResults directly
      if (srList.size() > 0) {
        curSr = srList.remove(0);
      }
      // Compute ScrollableResults from DBClass
      else if (dbClazzList.size() > 0) {
        Class<?> clazz = dbClazzList.remove(0);
        curSr = HibernateUtil.scroll(clazz);
      }
    }
    if (curSr != null) {
      if (curSr.next()) {
        return true;
      }
      curSr = null;
      return hasNext();
    }
    
    return false;
  }

  /**
   * Returns the next element in the iteration.  Calling this method
   * repeatedly until the {@link #hasNext()} method returns false will
   * return each element in the underlying collection exactly once.
   *
   * @return the next element in the iteration.
   * @exception NoSuchElementException iteration has no more elements.
   */
  public E next() {
    // Iterator
    if (curIt != null) {
      E obj = curIt.next();
      return obj;
    }
    // ScrollableResults
    if (curSr != null) {
      @SuppressWarnings("unchecked")
      E obj = (E) curSr.get(0);
      return obj;
    }
    throw new NoSuchElementException();
  }
  
  /**
   * Return the total number of object available in the iteration.
   * <p>
   * Warning : When used with JcmsDB results, the correctness of this
   *           number depends on the parameters specified at construction time !
   * @return the number of object being iterated
   */
  public int size() {
    return size;
  }
  
  /**
   * Unsupported Operation
   * @throws UnsupportedOperationException
   */
  public void remove() {
    throw new UnsupportedOperationException();
  }
}

%><%

  if (!checkAccess("admin/operation/file-processor") || !FileProcessorManager.isEnabled()) { 
    sendForbidden(request, response);
    return;
  }

  Repository repository = RepositoryManager.getInstance().getRepository("JCMSUpload"); 
  
  boolean opCleanAndReprocess = hasParameter("opCleanAndReprocess");
  if (opCleanAndReprocess && HttpUtil.isCSRFEnabled()) {
    boolean csrfOk =  HttpUtil.checkCSRF(request);
    if (!csrfOk) {
      jcmsContext.addMsg(new com.jalios.jcms.context.JcmsMessage(com.jalios.jcms.context.JcmsMessage.Level.WARN, glp("msg.security.csrf", "opCleanAndReprocess", ServletUtil.getRequestId(request))));
      opCleanAndReprocess = false;
    } else {
      if (logger.isTraceEnabled()) {
        logger.trace("[" + ServletUtil.getRequestId(request) + "] CSRF token successfully validated at " + ServletUtil.getResourcePath(request));
      }
    }
  }

  DataIterator<Data> allDocIterator = new DataIterator<Data>();
  {
    final TreeSet<FileDocument> _docSet = channel.getDataSet(FileDocument.class);
    final TreeSet<Publication> docSet = (_docSet != null) ? new TreeSet<Publication>(_docSet) : new TreeSet<Publication>();
    allDocIterator.addCollection(docSet);
    for (Class<? extends FileDocument> docSubClazz : channel.getSubTypeList(FileDocument.class)) {
      if (!DBData.class.isAssignableFrom(docSubClazz)) {
        continue;
      }
      allDocIterator.addDBClass(docSubClazz);
    }
  }
  
  %><%! 
  public void logAndAppend(Logger logger, StringBuilder sb, String msg) throws IOException {
    logger.info(msg);
    sb.append(msg).append("\n");
  } %><%
  

  StringBuilder logSB = new StringBuilder();
  if (opCleanAndReprocess) {
   
    logAndAppend(logger, logSB, "");
    logAndAppend(logger, logSB, "[fp-cleanup-reprocess] FileProcessor cleanup and full reprocess.");
    
    // 1. Start by removing "successful and ignored" FileProcessinInfo and FileProcessingLog 
      logAndAppend(logger, logSB, "[fp-cleanup-reprocess] [step-1] Remove all successful and ignored, FileProcessinInfo and FileProcessingLog");
        // 1.1 FileProcessingInfo -- successful and ignored
        int c1 = HibernateUtil.deleteQuery(FileProcessingInfo.class,
            new String[] { FileProcessingInfo.Fields.REPOSITORY_COLUMN, FileProcessingInfo.Fields.URID_COLUMN, FileProcessingInfo.Fields.PROCESSING_STATUS_COLUMN },
            new Object[] { repository.getId(),                          channel.getUrid(),                     ProcessingStatus.SUCCESSFUL.getCode()              }
        );
        int c2 = HibernateUtil.deleteQuery(FileProcessingInfo.class,
            new String[] { FileProcessingInfo.Fields.REPOSITORY_COLUMN, FileProcessingInfo.Fields.URID_COLUMN, FileProcessingInfo.Fields.PROCESSING_STATUS_COLUMN },
            new Object[] { repository.getId(),                          channel.getUrid(),                     ProcessingStatus.IGNORED.getCode()                 }
        );
        // 1.2 FileProcessingLog -- successful and ignored
        int c3 = HibernateUtil.deleteQuery(FileProcessingLog.class,
            new String[] { FileProcessingLog.Fields.REPOSITORY_COLUMN, FileProcessingLog.Fields.URID_COLUMN, FileProcessingLog.Fields.STATUS_COLUMN },
            new Object[] { repository.getId(),                         channel.getUrid(),                    ProcessingStatus.SUCCESSFUL.getCode()  }
        );
        int c4 = HibernateUtil.deleteQuery(FileProcessingLog.class,
            new String[] { FileProcessingLog.Fields.REPOSITORY_COLUMN, FileProcessingLog.Fields.URID_COLUMN, FileProcessingLog.Fields.STATUS_COLUMN },
            new Object[] { repository.getId(),                         channel.getUrid(),                    ProcessingStatus.IGNORED.getCode()     }
        );
    
        logAndAppend(logger, logSB, "[fp-cleanup-reprocess] [step-1] Cleaned : "+c1+" successful FileProcessingInfo, "+c2+" ignored FileProcessingInfo, "+c3+" successful FileProcessingLog, "+c4+" ignored FileProcessingLog");
        
        
        HibernateUtil.commitTransaction();
        HibernateUtil.closeSession();
        HibernateUtil.beginTransaction();
    
    // 2. Iterate the remaining FileProcessingInfo and FileProcessing Log to delete all logs pointing to unexisting FileDocument 
      logAndAppend(logger, logSB, "[fp-cleanup-reprocess] [step-2] Remove orphaned FileProcessingLog and FileProcessingInfo (which filename does not point a valid FileDocument)");
    
      // 2.1 
      logAndAppend(logger, logSB, "[fp-cleanup-reprocess] [step-2.1] Find ALL filenames in both FileProcessingLog and FileProcessingInfo...");
      Set<String> allFilenameSet = new HashSet<String>(); 
      {
        Criteria crit = HibernateUtil.getSession().createCriteria(FileProcessingLog.class);
        crit.setCacheable(false);
        crit.add(Restrictions.eq(FileProcessingLog.Fields.REPOSITORY_COLUMN, repository.getId()));
        crit.add(Restrictions.eq(FileProcessingLog.Fields.URID_COLUMN, channel.getUrid()));
        crit.setProjection(Projections.distinct(Projections.property(FileProcessingLog.Fields.FILENAME_COLUMN)));
        crit.setFetchSize(HibernateUtil.SCROLL_FETCH_SIZE);
      
        ScrollableResults cursor = crit.scroll(ScrollMode.FORWARD_ONLY);
        while (cursor.next()) {
          String filename = cursor.getString(0);
          if (filename != null) { allFilenameSet.add(filename); }
        }
        cursor.close();
      }
      {
        Criteria crit = HibernateUtil.getSession().createCriteria(FileProcessingInfo.class);
        crit.setCacheable(false);
        crit.add(Restrictions.eq(FileProcessingInfo.Fields.REPOSITORY_COLUMN, repository.getId()));
        crit.add(Restrictions.eq(FileProcessingInfo.Fields.URID_COLUMN, channel.getUrid()));
        crit.setProjection(Projections.distinct(Projections.property(FileProcessingInfo.Fields.FILENAME_COLUMN)));
        crit.setFetchSize(HibernateUtil.SCROLL_FETCH_SIZE);
      
        ScrollableResults cursor = crit.scroll(ScrollMode.FORWARD_ONLY);
        while (cursor.next()) {
          String filename = cursor.getString(0);
          if (filename != null) { allFilenameSet.add(filename); }
        }
        cursor.close();
      }
      logAndAppend(logger, logSB, "[fp-cleanup-reprocess] [step-2.1] " +allFilenameSet.size() + " filename(s) found.");
      
      HibernateUtil.commitTransaction();
      HibernateUtil.beginTransaction();
    
      // 2.2 
      logAndAppend(logger, logSB, "[fp-cleanup-reprocess] [step-2.2] For each filename, find the corresponding FileDocument, and if none found, delete FileProcessingLog and FileProcessingInfo");
      int i = 0;
      int deleteCount = 0;
      for (String filename : allFilenameSet) {
        FileDocument doc = FileDocument.getFileDocumentFromFilename("upload/"+filename);
        if (doc == null) {
          deleteCount++;
          logAndAppend(logger, logSB, "[fp-cleanup-reprocess] [step-2.2] '" + filename + "'. No corresponding FileDocument. Removing FileProcessing Log and Info...");
          HibernateUtil.deleteQuery(FileProcessingInfo.class, FileProcessingInfo.Fields.FILENAME_COLUMN, filename);
          HibernateUtil.deleteQuery(FileProcessingLog.class,  FileProcessingLog.Fields.FILENAME_COLUMN,  filename);
        }
        if (i%100 == 0) {
          HibernateUtil.commitTransaction();
          HibernateUtil.beginTransaction();
        }
        i++;
      }
      logAndAppend(logger, logSB, "[fp-cleanup-reprocess] [step-2] " + deleteCount + " orphan filename(s) processed and deleted in Log+Info.");
    
    HibernateUtil.commitTransaction();
    HibernateUtil.closeSession();
    HibernateUtil.beginTransaction();
    
    
    // 3. submit all FileDocument to manager
    
    logAndAppend(logger, logSB, "[fp-cleanup-reprocess] [step-3] Submit all FileDocument to manager for reprocessing...");
    
    logAndAppend(logger, logSB, "[fp-cleanup-reprocess] [step-3] " + allDocIterator.size() + " documents to iterate and submit...");
    
    Set<File> fileSet = new LinkedHashSet<File>(); 
    while (allDocIterator.hasNext()) {
      FileDocument doc = (FileDocument) allDocIterator.next();
      File file = doc.getFile();
      if (file != null && file.exists()) {
        fileSet.add(file);
      }
      %><%-- <li><jalios:link data='<%= doc %>'/><br/> 
      <%= file %></li>--%><%
    }
    
    ProcessingData processingData = new ProcessingData(repository, fileSet, FileActionComponent.Operation.FILE_UPDATE);
    FileProcessorManager.getInstance().add(processingData);
    logAndAppend(logger, logSB, "[fp-cleanup-reprocess] [step-3] " + allDocIterator.size() + " documents submited, check fileprocess manager.");
    
    logAndAppend(logger, logSB, "[fp-cleanup-reprocess] Done");
    logAndAppend(logger, logSB, "");
    
    String redirect = getValidHttpUrl("redirect");
    if (Util.notEmpty(redirect)) {
      sendRedirect(redirect);
      return;
    }
  }

%><%@ include file='/admin/doAdminHeader.jspf' %>
  <h1 class='boTitle'>
    FileProcessor cleaner and reprocess
  </h1>
  
  <%@ include file='/jcore/doMessageBox.jspf' %>
  
<% if (opCleanAndReprocess) { %>
  <ul>
    <li>Cleanup performed.</li>
    <li><%= allDocIterator.size() %> files submitted for processing.</li>
  </ul>
  <p>
   Check logs for details of operation and <a href="admin/fileprocessor/adminFileProcessor.jsp"> <jalios:icon src="fp-icon" /> <%= glp("fileprocessor.adminlink") %></a> for current processing status.<br/>
   <strong>DO NOT submit for reprocessing until proccessing is over !</strong>
  </p>
  <pre><%= HttpUtil.encodeForHTML( logSB.toString().trim() ) %></pre>
<% } else { %>
<form action="<%= ServletUtil.getResourcePath(request) %>" method="post">
  <p>
   This JSP is used for maintenance purpose !<br />
   <strong>DO NOT submit for reprocessing twice or more </strong> (validate the form once and wait at least a day/week or more depending on the number of files to process)<br/>
   Check <a href="admin/fileprocessor/adminFileProcessor.jsp"> <jalios:icon src="fp-icon" /> <%= glp("fileprocessor.adminlink") %></a> for current processing status.
  </p>
  <p>
   If you submit this form, the following actions will be performed, <strong>for this replica</strong> (repeat on each replica for which it is needed) : 
  </p>
   <ul>
     <li>All successful and ignored <code>FileProcessinInfo</code> and <code>FileProcessingLog</code> will be removed (so they can be submitted again)</li>
     <li>All orphaned <code>FileProcessinInfo</code> and <code>FileProcessingLog</code> (whose filename does not point a valid FileDocument) will be removed (to clean tables before reprocessing)</li>
     <li><strong>All <a href="work/queryWork.jsp?types=FileDocument&amp;types=DBFileDocument&amp;allWorkspaceFilter=true"><%= allDocIterator.size() %> FileDocuments</a> will be submitted for processing</strong> (missing or blacklisted files will be ignored during processing)</li>
   </ul>
  <input type="submit" data-jalios-text="<%= glp("msg.js.confirm") %>" name="opCleanAndReprocess" value="Clean FileProcessor status and reprocess all files" class="modal confirm btn btn-danger "/>
</form>
<% } %>

<%@ include file='/admin/doAdminFooter.jspf' %>
