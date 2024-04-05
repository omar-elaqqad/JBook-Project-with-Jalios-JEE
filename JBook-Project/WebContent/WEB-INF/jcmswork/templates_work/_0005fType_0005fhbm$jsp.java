import com.jalios.util.*;
import  java.io.*;
import  java.util.*;
import  java.text.*;
import  java.net.*;
import  org.jdom.*;
import  com.jalios.jcms.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.jalios.jspengine.runtime.*;


public class _0005fType_0005fhbm$jsp extends HttpJspBase {

    // begin [file="/_Type_hbm.jsp";from=(11,7);to=(18,0)]
        
        static private Map<String,String> truncatedMap = new HashMap<String,String>();
        
        public String truncate(String str, int limit) {
          return Util.truncate(str, limit, truncatedMap);
        }
        
    // end

    static {
    }
    public _0005fType_0005fhbm$jsp( ) {
    }

    private static boolean _jspx_inited = false;

    public final void _jspx_init() throws com.jalios.jspengine.runtime.JspException {
    }

    public void _jspService(HttpServletRequest request, HttpServletResponse  response)
        throws java.io.IOException, ServletException {

        JspFactory _jspxFactory = null;
        PageContext pageContext = null;
        HttpSession session = null;
        ServletContext application = null;
        ServletConfig config = null;
        JspWriter out = null;
        Object page = this;
        String  _value = null;
        try {

            if (_jspx_inited == false) {
                synchronized (this) {
                    if (_jspx_inited == false) {
                        _jspx_init();
                        _jspx_inited = true;
                    }
                }
            }
            _jspxFactory = com.jalios.jspengine.runtime.JspFactoryImpl.getInstance();
            response.setContentType("text/plain; charset=UTF-8");
            pageContext = _jspxFactory.getPageContext(this, request, response,
            			"", true, 0, true);

            application = pageContext.getServletContext();
            config = pageContext.getServletConfig();
            session = pageContext.getSession();
            out = pageContext.getOut();

            // HTML // begin [file="/_Type_hbm.jsp";from=(0,0);to=(6,0)]
                out.write("<?xml version=\"1.0\"?>\n<!DOCTYPE hibernate-mapping PUBLIC\n        \"-//Hibernate/Hibernate Mapping DTD 3.0//EN\"\n        \"classpath://org/hibernate/hibernate-mapping-3.0.dtd\">\n\n<hibernate-mapping>\n");

            // end
            // begin [file="/_Type_hbm.jsp";from=(18,4);to=(116,0)]
                
                request.setCharacterEncoding("UTF-8");
                
                truncatedMap.clear();
                
                final Channel channel = Channel.getChannel();
                
                // Uncomment this to test template under JCMS without the need to restart
                // session.setAttribute("typeElt", channel.getTypeEntry(generated.DBComment.class).getXmlElement());
                
                Element typeElt = (Element)session.getAttribute("typeElt");
                String className = typeElt.getAttributeValue("name");
                
                int limit = 30; // Oracle tables are limited to 30 chars
                
                String tableName = typeElt.getAttributeValue("tableName");
                if (Util.isEmpty(tableName)) {
                  tableName = className;
                }
                
                tableName = tableName.toUpperCase();
                
                String table = truncate("G_" + tableName, limit); 
                
                String tablePrefix = table + "_"; 
                
                String indexPrefix = "IG_" + tableName + "_";
                
                //Get the fields (and the inherited fields)                             
                ArrayList fieldList = new ArrayList();
                TypeUtil.buildInheritedFieldList(typeElt, fieldList, true);
                
                boolean isForm = typeElt.getAttribute("formAuthor") != null;
                
                boolean isContent = TypeUtil.isSubTypeOf(typeElt, com.jalios.jcms.Content.class);
                boolean isUserContent = TypeUtil.isSubTypeOf(typeElt, com.jalios.jcms.UserContent.class);
                
                boolean isDBFileDocument = TypeUtil.isSubTypeOf(typeElt, com.jalios.jcms.DBFileDocument.class);
                
                boolean openRole = Util.toBoolean(typeElt.getAttributeValue("openRole"), false);
                
                Element titleElt = typeElt.getChild("title");
                boolean titleML = Util.toBoolean(titleElt.getAttributeValue("ml"), false);
                if (!titleML) {
                  titleML = Util.toBoolean(typeElt.getAttributeValue("titleML"), false);
                }
                boolean hasMLField = titleML;
                
                boolean addReadRights = isContent || isForm;
                boolean addUpdateRights = isContent;
                boolean addVersion = isContent;
                boolean addFriendlyURLSet = isContent;
                boolean addAttachWorkspaceSet = isContent;
                
                String[] customInterfaces = Util.split(Util.getString(typeElt.getAttributeValue("interfaces"), ""), ", ");
                
                if (!addVersion) {
                  if (Util.toBoolean(typeElt.getAttributeValue("revision"), false)) {
                	  addVersion = true;
                  } else {
                	  for(String customInterface: customInterfaces) {
                	    if (customInterface.endsWith(".HistorizedDBData")) {
                	      addVersion = true;
                	      break;
                	    }
                	  }
                  }
                }
                
                boolean addCategories = isContent;
                if (!addCategories) {
                  for(String customInterface: customInterfaces) {
                    if (customInterface.endsWith(".CategorizedDBData")) {
                      addCategories = true;
                      break;
                    }
                  }
                  
                  TypeFieldEntry[] allTFE = channel.getAllTypeFieldEntries(TypeProcessor.PACKAGE_NAME + "." + className);
                  for(TypeFieldEntry fieldEntry: allTFE) {
                    String editor = fieldEntry.getEditor();    
                    if ("category".equals(editor)) {
                      addCategories = true;
                      break;      
                    }
                  }
                }
                
                boolean addReaderTracker = isContent;
                if (!addReaderTracker) {
                  for(String customInterface: customInterfaces) {
                    if (customInterface.endsWith(".TrackedDBData")) {
                      addReaderTracker = true;
                      break;
                    }
                  }  
                }
                List fieldEntryList = Arrays.asList(channel.getAllTypeFieldEntries(TypeProcessor.PACKAGE_NAME + "." + className));
            // end
            // HTML // begin [file="/_Type_hbm.jsp";from=(116,2);to=(117,25)]
                out.write("\n  <class name=\"generated.");

            // end
            // begin [file="/_Type_hbm.jsp";from=(117,28);to=(117,39)]
                out.print( className );
            // end
            // HTML // begin [file="/_Type_hbm.jsp";from=(117,41);to=(117,50)]
                out.write("\" table=\"");

            // end
            // begin [file="/_Type_hbm.jsp";from=(117,53);to=(117,60)]
                out.print( table );
            // end
            // HTML // begin [file="/_Type_hbm.jsp";from=(117,62);to=(122,50)]
                out.write("\">\n    <cache usage=\"read-write\" />  \n    <id name=\"rowId\" column=\"rowId\">\n      <generator class=\"native\"/>\n    </id>\n    <property name=\"cdate\" not-null=\"true\" index=\"");

            // end
            // begin [file="/_Type_hbm.jsp";from=(122,53);to=(122,94)]
                out.print( truncate(indexPrefix + "CDATE", limit)  );
            // end
            // HTML // begin [file="/_Type_hbm.jsp";from=(122,96);to=(123,50)]
                out.write("\" />\n    <property name=\"mdate\" not-null=\"true\" index=\"");

            // end
            // begin [file="/_Type_hbm.jsp";from=(123,53);to=(123,94)]
                out.print( truncate(indexPrefix + "MDATE", limit)  );
            // end
            // HTML // begin [file="/_Type_hbm.jsp";from=(123,96);to=(124,49)]
                out.write("\" />\n    <property name=\"authorId\" length=\"32\" index=\"");

            // end
            // begin [file="/_Type_hbm.jsp";from=(124,52);to=(124,96)]
                out.print( truncate(indexPrefix + "AUTHORID", limit)  );
            // end
            // HTML // begin [file="/_Type_hbm.jsp";from=(124,98);to=(126,52)]
                out.write("\" />\n    \n    <property name=\"pstatus\" not-null=\"true\" index=\"");

            // end
            // begin [file="/_Type_hbm.jsp";from=(126,55);to=(126,97)]
                out.print( truncate(indexPrefix + "PSTATUS", limit) );
            // end
            // HTML // begin [file="/_Type_hbm.jsp";from=(126,99);to=(127,68)]
                out.write("\" />\n    <property name=\"workspaceId\" not-null=\"true\" length=\"32\" index=\"");

            // end
            // begin [file="/_Type_hbm.jsp";from=(127,71);to=(127,110)]
                out.print( truncate(indexPrefix + "WSID", limit) );
            // end
            // HTML // begin [file="/_Type_hbm.jsp";from=(127,112);to=(129,35)]
                out.write("\" />\n    \n    <property name=\"pdate\"  index=\"");

            // end
            // begin [file="/_Type_hbm.jsp";from=(129,38);to=(129,79)]
                out.print( truncate(indexPrefix + "PDATE", limit)  );
            // end
            // HTML // begin [file="/_Type_hbm.jsp";from=(129,81);to=(133,39)]
                out.write("\" />\n    <property name=\"edate\" />\n    <property name=\"adate\" />\n    <property name=\"title\" />\n    <property name=\"workflowId\" index=\"");

            // end
            // begin [file="/_Type_hbm.jsp";from=(133,42);to=(133,81)]
                out.print( truncate(indexPrefix + "WFID", limit) );
            // end
            // HTML // begin [file="/_Type_hbm.jsp";from=(133,83);to=(134,0)]
                out.write("\" />\n");

            // end
            // begin [file="/_Type_hbm.jsp";from=(134,2);to=(134,21)]
                 if (addVersion) { 
            // end
            // HTML // begin [file="/_Type_hbm.jsp";from=(134,23);to=(138,0)]
                out.write("\n    <property name=\"udate\" />\n    <property name=\"majorVersion\" />\n    <property name=\"minorVersion\" />\n");

            // end
            // begin [file="/_Type_hbm.jsp";from=(138,2);to=(138,5)]
                 } 
            // end
            // HTML // begin [file="/_Type_hbm.jsp";from=(138,7);to=(139,0)]
                out.write("\n");

            // end
            // begin [file="/_Type_hbm.jsp";from=(139,2);to=(139,24)]
                 if (addReadRights) { 
            // end
            // HTML // begin [file="/_Type_hbm.jsp";from=(139,26);to=(140,44)]
                out.write("\n    <property name=\"hasNoReadRights\" index=\"");

            // end
            // begin [file="/_Type_hbm.jsp";from=(140,47);to=(140,97)]
                out.print( truncate(indexPrefix + "HASNOREADRIGHTS", limit) );
            // end
            // HTML // begin [file="/_Type_hbm.jsp";from=(140,99);to=(141,0)]
                out.write("\" />\n");

            // end
            // begin [file="/_Type_hbm.jsp";from=(141,2);to=(141,5)]
                 } 
            // end
            // HTML // begin [file="/_Type_hbm.jsp";from=(141,7);to=(142,0)]
                out.write("\n");

            // end
            // begin [file="/_Type_hbm.jsp";from=(142,2);to=(142,27)]
                 if (addReaderTracker) { 
            // end
            // HTML // begin [file="/_Type_hbm.jsp";from=(142,29);to=(144,40)]
                out.write("\n    <property name=\"tracked\" />\n    <property name=\"readerCount\" index=\"");

            // end
            // begin [file="/_Type_hbm.jsp";from=(144,43);to=(144,89)]
                out.print( truncate(indexPrefix + "READERCOUNT", limit) );
            // end
            // HTML // begin [file="/_Type_hbm.jsp";from=(144,91);to=(145,0)]
                out.write("\" />\n");

            // end
            // begin [file="/_Type_hbm.jsp";from=(145,2);to=(145,5)]
                 } 
            // end
            // HTML // begin [file="/_Type_hbm.jsp";from=(145,7);to=(146,0)]
                out.write("\n");

            // end
            // begin [file="/_Type_hbm.jsp";from=(146,2);to=(146,35)]
                 if(isUserContent || isContent){ 
            // end
            // HTML // begin [file="/_Type_hbm.jsp";from=(146,37);to=(147,55)]
                out.write("\n    <property name=\"voteCount\" not-null=\"false\" index=\"");

            // end
            // begin [file="/_Type_hbm.jsp";from=(147,58);to=(147,102)]
                out.print( truncate(indexPrefix + "VOTECOUNT", limit) );
            // end
            // HTML // begin [file="/_Type_hbm.jsp";from=(147,104);to=(148,55)]
                out.write("\" />\n    <property name=\"voteScore\" not-null=\"false\" index=\"");

            // end
            // begin [file="/_Type_hbm.jsp";from=(148,58);to=(148,102)]
                out.print( truncate(indexPrefix + "VOTESCORE", limit) );
            // end
            // HTML // begin [file="/_Type_hbm.jsp";from=(148,104);to=(149,0)]
                out.write("\" />\n");

            // end
            // begin [file="/_Type_hbm.jsp";from=(149,2);to=(149,5)]
                 } 
            // end
            // HTML // begin [file="/_Type_hbm.jsp";from=(149,7);to=(150,0)]
                out.write("\n");

            // end
            // begin [file="/_Type_hbm.jsp";from=(150,2);to=(150,18)]
                 if(isContent){ 
            // end
            // HTML // begin [file="/_Type_hbm.jsp";from=(150,20);to=(151,72)]
                out.write("    \n    <property name=\"mainInstanceId\" not-null=\"false\" length=\"32\" index=\"");

            // end
            // begin [file="/_Type_hbm.jsp";from=(151,75);to=(151,118)]
                out.print( truncate(indexPrefix + "MAINSTID", limit) );
            // end
            // HTML // begin [file="/_Type_hbm.jsp";from=(151,120);to=(154,40)]
                out.write("\" />    \n    <property name=\"mergeId\" length=\"32\" />    \n    <property name=\"mergeDate\" />\n    <property name=\"hasAttachWS\" index=\"");

            // end
            // begin [file="/_Type_hbm.jsp";from=(154,43);to=(154,84)]
                out.print( truncate(indexPrefix + "HATHWS", limit) );
            // end
            // HTML // begin [file="/_Type_hbm.jsp";from=(154,86);to=(155,0)]
                out.write("\"  />\n");

            // end
            // begin [file="/_Type_hbm.jsp";from=(155,2);to=(155,5)]
                 } 
            // end
            // HTML // begin [file="/_Type_hbm.jsp";from=(155,7);to=(156,51)]
                out.write("\n    <property name=\"opAuthorId\" length=\"32\" index=\"");

            // end
            // begin [file="/_Type_hbm.jsp";from=(156,54);to=(156,99)]
                out.print( truncate(indexPrefix + "OPAUTHORID", limit) );
            // end
            // HTML // begin [file="/_Type_hbm.jsp";from=(156,101);to=(158,0)]
                out.write("\"  />\n    <property name=\"readAck\" />\n");

            // end
            // begin [file="/_Type_hbm.jsp";from=(158,2);to=(158,26)]
                 if (addUpdateRights) { 
            // end
            // HTML // begin [file="/_Type_hbm.jsp";from=(158,28);to=(160,0)]
                out.write("\n    <property name=\"restrictUpdateRights\" />\n");

            // end
            // begin [file="/_Type_hbm.jsp";from=(160,2);to=(160,5)]
                 } 
            // end
            // HTML // begin [file="/_Type_hbm.jsp";from=(160,7);to=(161,0)]
                out.write("\n");

            // end
            // begin [file="/_Type_hbm.jsp";from=(161,2);to=(161,27)]
                 if (isDBFileDocument) { 
            // end
            // HTML // begin [file="/_Type_hbm.jsp";from=(161,29);to=(162,37)]
                out.write("\n    <property name=\"filename\" index=\"");

            // end
            // begin [file="/_Type_hbm.jsp";from=(162,40);to=(162,83)]
                out.print( truncate(indexPrefix + "FILENAME", limit) );
            // end
            // HTML // begin [file="/_Type_hbm.jsp";from=(162,85);to=(164,41)]
                out.write("\" />\n    <property name=\"originalFilename\" />\n    <property name=\"contentType\"  index=\"");

            // end
            // begin [file="/_Type_hbm.jsp";from=(164,44);to=(164,90)]
                out.print( truncate(indexPrefix + "CONTENTTYPE", limit) );
            // end
            // HTML // begin [file="/_Type_hbm.jsp";from=(164,92);to=(168,0)]
                out.write("\"  />\n    <property name=\"remoteUri\" />\n    <property name=\"uploadDate\" />\n    <property name=\"pdfUploadDate\" />\n");

            // end
            // begin [file="/_Type_hbm.jsp";from=(168,2);to=(168,5)]
                 } 
            // end
            // HTML // begin [file="/_Type_hbm.jsp";from=(168,7);to=(169,0)]
                out.write("    \n");

            // end
            // begin [file="/_Type_hbm.jsp";from=(169,2);to=(169,17)]
                 if (isForm) { 
            // end
            // HTML // begin [file="/_Type_hbm.jsp";from=(169,19);to=(170,43)]
                out.write("\n    <property name=\"submitMemberId\" index=\"");

            // end
            // begin [file="/_Type_hbm.jsp";from=(170,46);to=(170,87)]
                out.print( truncate(indexPrefix + "SUBMID", limit) );
            // end
            // HTML // begin [file="/_Type_hbm.jsp";from=(170,89);to=(172,0)]
                out.write("\" />\n    <property name=\"submitRemoteAddr\" />\n");

            // end
            // begin [file="/_Type_hbm.jsp";from=(172,2);to=(172,5)]
                 } 
            // end
            // HTML // begin [file="/_Type_hbm.jsp";from=(172,7);to=(173,0)]
                out.write("\n");

            // end
            // begin [file="/_Type_hbm.jsp";from=(173,2);to=(173,19)]
                 if (openRole) { 
            // end
            // HTML // begin [file="/_Type_hbm.jsp";from=(173,21);to=(175,0)]
                out.write("\n    <property name=\"roleMapStr\" type=\"text\" length=\"65536\" />\n");

            // end
            // begin [file="/_Type_hbm.jsp";from=(175,2);to=(175,5)]
                 } 
            // end
            // HTML // begin [file="/_Type_hbm.jsp";from=(175,7);to=(176,0)]
                out.write("\n");

            // end
            // begin [file="/_Type_hbm.jsp";from=(176,2);to=(176,18)]
                 if (titleML) { 
            // end
            // HTML // begin [file="/_Type_hbm.jsp";from=(176,20);to=(178,0)]
                out.write("\n    <property name=\"titleMLE\" type=\"text\" length=\"1048576\" />\n");

            // end
            // begin [file="/_Type_hbm.jsp";from=(178,2);to=(178,5)]
                 } 
            // end
            // HTML // begin [file="/_Type_hbm.jsp";from=(178,7);to=(179,0)]
                out.write("\n");

            // end
            // begin [file="/_Type_hbm.jsp";from=(179,2);to=(179,21)]
                 if (hasMLField) { 
            // end
            // HTML // begin [file="/_Type_hbm.jsp";from=(179,23);to=(181,0)]
                out.write("\n    <property name=\"mainLanguage\" />\n");

            // end
            // begin [file="/_Type_hbm.jsp";from=(181,2);to=(181,5)]
                 } 
            // end
            // HTML // begin [file="/_Type_hbm.jsp";from=(181,7);to=(184,0)]
                out.write("\n\n\n");

            // end
            // begin [file="/_Type_hbm.jsp";from=(184,0);to=(184,88)]
                /* ----  jalios:foreach ---- */
                com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_0 = new com.jalios.jtaglib.ForeachTag();
                _jspx_th_jalios_foreach_0.setPageContext(pageContext);
                _jspx_th_jalios_foreach_0.setParent(null);
                _jspx_th_jalios_foreach_0.setCollection( fieldEntryList );
                _jspx_th_jalios_foreach_0.setName("itField");
                _jspx_th_jalios_foreach_0.setType("TypeFieldEntry");
                try {
                    int _jspx_eval_jalios_foreach_0 = _jspx_th_jalios_foreach_0.doStartTag();
                    if (_jspx_eval_jalios_foreach_0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                        try {
                            if (_jspx_eval_jalios_foreach_0 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_foreach_0.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_foreach_0.doInitBody();
                          }
                          do {
                              Integer itCounter = null;
                              itCounter = (Integer) pageContext.findAttribute("itCounter");
                              TypeFieldEntry itField = null;
                              itField = (TypeFieldEntry) pageContext.findAttribute("itField");
                          // end
                          // HTML // begin [file="/_Type_hbm.jsp";from=(184,88);to=(185,0)]
                              out.write("\n");

                          // end
                          // begin [file="/_Type_hbm.jsp";from=(185,2);to=(210,0)]
                               
                              String name       = itField.getName();
                              String editor     = itField.getEditor();
                              String type       = itField.getType();
                              boolean isAnyLink = itField.isAnyLink();
                              
                              boolean isLargeText = "textarea".equals(editor) || "wysiwyg".equals(editor);
                              
                              boolean isML = itField.isFieldML();
                              
                              hasMLField = isML || hasMLField;
                              
                              String indexName = truncate(indexPrefix + name.toUpperCase(), limit);
                              
                              String attributes = "";
                              if (isLargeText) { 
                                attributes = " type=\"text\" length=\"65536\"";
                              }
                              else if (isAnyLink) {
                                attributes = " length=\"64\" index=\"" + indexName + "\"";
                              }
                              
                              String propertyName = isAnyLink ? name + "Id" : name;
                              
                              if (!editor.equals("category")) {
                          // end
                          // HTML // begin [file="/_Type_hbm.jsp";from=(210,2);to=(211,0)]
                              out.write("\n");

                          // end
                          // HTML // begin [file="/_Type_hbm.jsp";from=(211,16);to=(212,0)]
                              out.write("\n");

                          // end
                          // begin [file="/_Type_hbm.jsp";from=(212,2);to=(212,35)]
                                 if (itField.isTypeScalar()) { 
                          // end
                          // HTML // begin [file="/_Type_hbm.jsp";from=(212,37);to=(213,20)]
                              out.write("\n    <property name=\"");

                          // end
                          // begin [file="/_Type_hbm.jsp";from=(213,23);to=(213,37)]
                              out.print( propertyName );
                          // end
                          // HTML // begin [file="/_Type_hbm.jsp";from=(213,39);to=(213,40)]
                              out.write("\"");

                          // end
                          // begin [file="/_Type_hbm.jsp";from=(213,43);to=(213,55)]
                              out.print( attributes );
                          // end
                          // HTML // begin [file="/_Type_hbm.jsp";from=(213,57);to=(214,4)]
                              out.write(" />\n    ");

                          // end
                          // begin [file="/_Type_hbm.jsp";from=(214,6);to=(214,39)]
                               if(editor.equals("sqlquery")) { 
                          // end
                          // HTML // begin [file="/_Type_hbm.jsp";from=(214,41);to=(215,20)]
                              out.write("\n    <property name=\"");

                          // end
                          // begin [file="/_Type_hbm.jsp";from=(215,23);to=(215,37)]
                              out.print( propertyName );
                          // end
                          // HTML // begin [file="/_Type_hbm.jsp";from=(215,39);to=(216,20)]
                              out.write("DataSource\" />\n    <property name=\"");

                          // end
                          // begin [file="/_Type_hbm.jsp";from=(216,23);to=(216,37)]
                              out.print( propertyName );
                          // end
                          // HTML // begin [file="/_Type_hbm.jsp";from=(216,39);to=(217,4)]
                              out.write("MaxRows\" />\n    ");

                          // end
                          // begin [file="/_Type_hbm.jsp";from=(217,6);to=(217,9)]
                               } 
                          // end
                          // HTML // begin [file="/_Type_hbm.jsp";from=(217,11);to=(219,0)]
                              out.write("\n    \n");

                          // end
                          // HTML // begin [file="/_Type_hbm.jsp";from=(219,18);to=(220,0)]
                              out.write("\n");

                          // end
                          // begin [file="/_Type_hbm.jsp";from=(220,2);to=(220,14)]
                                 } else { 
                          // end
                          // HTML // begin [file="/_Type_hbm.jsp";from=(220,16);to=(221,0)]
                              out.write("\n");

                          // end
                          // begin [file="/_Type_hbm.jsp";from=(221,2);to=(225,0)]
                              
                              String collection = itField.isTypeList() ? "list" : "set";
                              String collectionTable = truncate(tablePrefix + name.toUpperCase(), limit);
                              String collectionType = isLargeText ? "text" : itField.getCollectionTypeMapping();
                          // end
                          // HTML // begin [file="/_Type_hbm.jsp";from=(225,2);to=(226,5)]
                              out.write("\n    <");

                          // end
                          // begin [file="/_Type_hbm.jsp";from=(226,8);to=(226,20)]
                              out.print( collection );
                          // end
                          // HTML // begin [file="/_Type_hbm.jsp";from=(226,22);to=(226,29)]
                              out.write(" name=\"");

                          // end
                          // begin [file="/_Type_hbm.jsp";from=(226,32);to=(226,46)]
                              out.print( propertyName );
                          // end
                          // HTML // begin [file="/_Type_hbm.jsp";from=(226,48);to=(226,57)]
                              out.write("\" table=\"");

                          // end
                          // begin [file="/_Type_hbm.jsp";from=(226,60);to=(226,77)]
                              out.print( collectionTable );
                          // end
                          // HTML // begin [file="/_Type_hbm.jsp";from=(226,79);to=(229,38)]
                              out.write("\">\n      <cache usage=\"read-write\" />\n      <key>\n        <column name=\"ITEM_ID\" index=\"");

                          // end
                          // begin [file="/_Type_hbm.jsp";from=(229,41);to=(229,76)]
                              out.print( truncate(indexName + "_I", limit) );
                          // end
                          // HTML // begin [file="/_Type_hbm.jsp";from=(229,78);to=(231,0)]
                              out.write("\"/>\n      </key>      \n");

                          // end
                          // begin [file="/_Type_hbm.jsp";from=(231,2);to=(231,35)]
                                   if (itField.isTypeList()) { 
                          // end
                          // HTML // begin [file="/_Type_hbm.jsp";from=(231,37);to=(233,0)]
                              out.write("\n      <list-index column=\"POSITION\" />\n");

                          // end
                          // begin [file="/_Type_hbm.jsp";from=(233,2);to=(233,9)]
                                   } 
                          // end
                          // HTML // begin [file="/_Type_hbm.jsp";from=(233,11);to=(234,21)]
                              out.write("\n      <element type=\"");

                          // end
                          // begin [file="/_Type_hbm.jsp";from=(234,24);to=(234,40)]
                              out.print( collectionType );
                          // end
                          // HTML // begin [file="/_Type_hbm.jsp";from=(234,42);to=(234,43)]
                              out.write("\"");

                          // end
                          // begin [file="/_Type_hbm.jsp";from=(234,46);to=(234,86)]
                              out.print( isLargeText ? " length=\"65536\"" : "" );
                          // end
                          // HTML // begin [file="/_Type_hbm.jsp";from=(234,88);to=(235,28)]
                              out.write(">\n        <column name=\"VALUE\"");

                          // end
                          // begin [file="/_Type_hbm.jsp";from=(235,31);to=(235,94)]
                              out.print( isAnyLink ? " length=\"64\" index=\"" + indexName + "\"" : "" );
                          // end
                          // HTML // begin [file="/_Type_hbm.jsp";from=(235,96);to=(237,6)]
                              out.write("/>\n      </element>      \n    </");

                          // end
                          // begin [file="/_Type_hbm.jsp";from=(237,9);to=(237,21)]
                              out.print( collection );
                          // end
                          // HTML // begin [file="/_Type_hbm.jsp";from=(237,23);to=(238,0)]
                              out.write(">\n");

                          // end
                          // begin [file="/_Type_hbm.jsp";from=(238,2);to=(238,7)]
                                 } 
                          // end
                          // HTML // begin [file="/_Type_hbm.jsp";from=(238,9);to=(240,0)]
                              out.write("\n\n");

                          // end
                          // HTML // begin [file="/_Type_hbm.jsp";from=(240,18);to=(241,0)]
                              out.write("\n");

                          // end
                          // begin [file="/_Type_hbm.jsp";from=(241,2);to=(241,17)]
                                 if (isML) { 
                          // end
                          // HTML // begin [file="/_Type_hbm.jsp";from=(241,19);to=(242,20)]
                              out.write("\n    <property name=\"");

                          // end
                          // begin [file="/_Type_hbm.jsp";from=(242,23);to=(242,37)]
                              out.print( propertyName );
                          // end
                          // HTML // begin [file="/_Type_hbm.jsp";from=(242,39);to=(243,0)]
                              out.write("MLE\" type=\"text\" length=\"1048576\" />\n");

                          // end
                          // begin [file="/_Type_hbm.jsp";from=(243,2);to=(243,7)]
                                 } 
                          // end
                          // HTML // begin [file="/_Type_hbm.jsp";from=(243,9);to=(244,0)]
                              out.write("\n");

                          // end
                          // begin [file="/_Type_hbm.jsp";from=(244,2);to=(244,5)]
                               } 
                          // end
                          // HTML // begin [file="/_Type_hbm.jsp";from=(244,7);to=(245,0)]
                              out.write("\n");

                          // end
                          // begin [file="/_Type_hbm.jsp";from=(245,0);to=(245,17)]
                          } while (_jspx_th_jalios_foreach_0.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
                      } finally {
                          if (_jspx_eval_jalios_foreach_0 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                              out = pageContext.popBody();
                      }
                  }
                  if (_jspx_th_jalios_foreach_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
                      return;
              } finally {
                  _jspx_th_jalios_foreach_0.release();
              }
          // end
          // HTML // begin [file="/_Type_hbm.jsp";from=(245,17);to=(248,0)]
              out.write("\n\n\n");

          // end
          // begin [file="/_Type_hbm.jsp";from=(248,2);to=(248,24)]
               if (addCategories) { 
          // end
          // HTML // begin [file="/_Type_hbm.jsp";from=(248,26);to=(251,32)]
              out.write("\n    \n    <!--  COLLECTIONS FOR CATEGORIES -->\n    <set name=\"catIdSet\" table=\"");

          // end
          // begin [file="/_Type_hbm.jsp";from=(251,35);to=(251,76)]
              out.print( truncate(tablePrefix + "CATSET", limit) );
          // end
          // HTML // begin [file="/_Type_hbm.jsp";from=(251,78);to=(254,38)]
              out.write("\" lazy=\"true\">\n      <cache usage=\"read-write\" />\n      <key>\n        <column name=\"ITEM_ID\" index=\"");

          // end
          // begin [file="/_Type_hbm.jsp";from=(254,41);to=(254,84)]
              out.print( truncate(indexPrefix + "CATSET_I", limit) );
          // end
          // HTML // begin [file="/_Type_hbm.jsp";from=(254,86);to=(257,48)]
              out.write("\"/>\n      </key>\n      <element type=\"string\">\n        <column name=\"VALUE\" length=\"64\" index=\"");

          // end
          // begin [file="/_Type_hbm.jsp";from=(257,51);to=(257,92)]
              out.print( truncate(indexPrefix + "CATSET", limit) );
          // end
          // HTML // begin [file="/_Type_hbm.jsp";from=(257,94);to=(261,35)]
              out.write("\"/>\n      </element>      \n    </set>\n    \n    <set name=\"allCatIdSet\" table=\"");

          // end
          // begin [file="/_Type_hbm.jsp";from=(261,38);to=(261,82)]
              out.print( truncate(tablePrefix + "ALLCATSET", limit) );
          // end
          // HTML // begin [file="/_Type_hbm.jsp";from=(261,84);to=(264,38)]
              out.write("\"  lazy=\"true\">\n      <cache usage=\"read-write\" />\n      <key>\n        <column name=\"ITEM_ID\" index=\"");

          // end
          // begin [file="/_Type_hbm.jsp";from=(264,41);to=(264,87)]
              out.print( truncate(indexPrefix + "ALLCATSET_I", limit) );
          // end
          // HTML // begin [file="/_Type_hbm.jsp";from=(264,89);to=(267,48)]
              out.write("\"/>\n      </key>\n      <element type=\"string\">\n        <column name=\"VALUE\" length=\"64\" index=\"");

          // end
          // begin [file="/_Type_hbm.jsp";from=(267,51);to=(267,95)]
              out.print( truncate(indexPrefix + "ALLCATSET", limit) );
          // end
          // HTML // begin [file="/_Type_hbm.jsp";from=(267,97);to=(270,0)]
              out.write("\"/>\n      </element>      \n    </set>\n");

          // end
          // begin [file="/_Type_hbm.jsp";from=(270,2);to=(270,5)]
               } 
          // end
          // HTML // begin [file="/_Type_hbm.jsp";from=(270,7);to=(272,0)]
              out.write("\n\n");

          // end
          // begin [file="/_Type_hbm.jsp";from=(272,2);to=(272,24)]
               if (addReadRights) { 
          // end
          // HTML // begin [file="/_Type_hbm.jsp";from=(272,26);to=(275,36)]
              out.write("\n    \n    <!--  COLLECTIONS FOR READ-RIGHTS -->\n    <set name=\"authGrpIdSet\" table=\"");

          // end
          // begin [file="/_Type_hbm.jsp";from=(275,39);to=(275,84)]
              out.print( truncate(tablePrefix + "AUTHGRPSET", limit) );
          // end
          // HTML // begin [file="/_Type_hbm.jsp";from=(275,86);to=(278,38)]
              out.write("\" lazy=\"true\">\n      <cache usage=\"read-write\" />\n      <key>\n        <column name=\"ITEM_ID\" index=\"");

          // end
          // begin [file="/_Type_hbm.jsp";from=(278,41);to=(278,88)]
              out.print( truncate(indexPrefix + "AUTHGRPSET_I", limit) );
          // end
          // HTML // begin [file="/_Type_hbm.jsp";from=(278,90);to=(281,48)]
              out.write("\"/>\n      </key>\n      <element type=\"string\">\n        <column name=\"VALUE\" length=\"64\" index=\"");

          // end
          // begin [file="/_Type_hbm.jsp";from=(281,51);to=(281,96)]
              out.print( truncate(indexPrefix + "AUTHGRPSET", limit) );
          // end
          // HTML // begin [file="/_Type_hbm.jsp";from=(281,98);to=(285,36)]
              out.write("\"/>\n      </element>      \n    </set>    \n    \n    <set name=\"authMbrIdSet\" table=\"");

          // end
          // begin [file="/_Type_hbm.jsp";from=(285,39);to=(285,84)]
              out.print( truncate(tablePrefix + "AUTHMBRSET", limit) );
          // end
          // HTML // begin [file="/_Type_hbm.jsp";from=(285,86);to=(288,38)]
              out.write("\" lazy=\"true\">\n      <cache usage=\"read-write\" />\n      <key>\n        <column name=\"ITEM_ID\" index=\"");

          // end
          // begin [file="/_Type_hbm.jsp";from=(288,41);to=(288,88)]
              out.print( truncate(indexPrefix + "AUTHMBRSET_I", limit) );
          // end
          // HTML // begin [file="/_Type_hbm.jsp";from=(288,90);to=(291,48)]
              out.write("\"/>\n      </key>\n      <element type=\"string\">\n        <column name=\"VALUE\" length=\"64\" index=\"");

          // end
          // begin [file="/_Type_hbm.jsp";from=(291,51);to=(291,96)]
              out.print( truncate(indexPrefix + "AUTHMBRSET", limit) );
          // end
          // HTML // begin [file="/_Type_hbm.jsp";from=(291,98);to=(294,0)]
              out.write("\"/>\n      </element>      \n    </set>\n");

          // end
          // begin [file="/_Type_hbm.jsp";from=(294,2);to=(294,5)]
               } 
          // end
          // HTML // begin [file="/_Type_hbm.jsp";from=(294,7);to=(296,0)]
              out.write("\n\n");

          // end
          // begin [file="/_Type_hbm.jsp";from=(296,2);to=(296,26)]
               if (addUpdateRights) { 
          // end
          // HTML // begin [file="/_Type_hbm.jsp";from=(296,28);to=(299,38)]
              out.write("\n    \n    <!--  COLLECTIONS FOR UPDATE-RIGHTS -->\n    <set name=\"updateGrpIdSet\" table=\"");

          // end
          // begin [file="/_Type_hbm.jsp";from=(299,41);to=(299,88)]
              out.print( truncate(tablePrefix + "UPDATEGRPSET", limit) );
          // end
          // HTML // begin [file="/_Type_hbm.jsp";from=(299,90);to=(302,38)]
              out.write("\" lazy=\"true\">\n      <cache usage=\"read-write\" />\n      <key>\n        <column name=\"ITEM_ID\" index=\"");

          // end
          // begin [file="/_Type_hbm.jsp";from=(302,41);to=(302,90)]
              out.print( truncate(indexPrefix + "UPDATEGRPSET_I", limit) );
          // end
          // HTML // begin [file="/_Type_hbm.jsp";from=(302,92);to=(305,48)]
              out.write("\"/>\n      </key>\n      <element type=\"string\">\n        <column name=\"VALUE\" length=\"64\" index=\"");

          // end
          // begin [file="/_Type_hbm.jsp";from=(305,51);to=(305,98)]
              out.print( truncate(indexPrefix + "UPDATEGRPSET", limit) );
          // end
          // HTML // begin [file="/_Type_hbm.jsp";from=(305,100);to=(309,38)]
              out.write("\"/>\n      </element>      \n    </set>    \n    \n    <set name=\"updateMbrIdSet\" table=\"");

          // end
          // begin [file="/_Type_hbm.jsp";from=(309,41);to=(309,88)]
              out.print( truncate(tablePrefix + "UPDATEMBRSET", limit) );
          // end
          // HTML // begin [file="/_Type_hbm.jsp";from=(309,90);to=(312,38)]
              out.write("\" lazy=\"true\">\n      <cache usage=\"read-write\" />\n      <key>\n        <column name=\"ITEM_ID\" index=\"");

          // end
          // begin [file="/_Type_hbm.jsp";from=(312,41);to=(312,90)]
              out.print( truncate(indexPrefix + "UPDATEMBRSET_I", limit) );
          // end
          // HTML // begin [file="/_Type_hbm.jsp";from=(312,92);to=(315,48)]
              out.write("\"/>\n      </key>\n      <element type=\"string\">\n        <column name=\"VALUE\" length=\"64\" index=\"");

          // end
          // begin [file="/_Type_hbm.jsp";from=(315,51);to=(315,98)]
              out.print( truncate(indexPrefix + "UPDATEMBRSET", limit) );
          // end
          // HTML // begin [file="/_Type_hbm.jsp";from=(315,100);to=(318,0)]
              out.write("\"/>\n      </element>      \n    </set>\n");

          // end
          // begin [file="/_Type_hbm.jsp";from=(318,2);to=(318,5)]
               } 
          // end
          // HTML // begin [file="/_Type_hbm.jsp";from=(318,7);to=(320,0)]
              out.write("\n\n");

          // end
          // begin [file="/_Type_hbm.jsp";from=(320,2);to=(320,28)]
               if (addFriendlyURLSet) { 
          // end
          // HTML // begin [file="/_Type_hbm.jsp";from=(320,30);to=(323,40)]
              out.write("\n    \n    <!--  COLLECTIONS FOR FRIENDLYURL -->\n    <set name=\"dbFriendlyURLSet\" table=\"");

          // end
          // begin [file="/_Type_hbm.jsp";from=(323,43);to=(323,85)]
              out.print( truncate(tablePrefix + "FURLSET", limit) );
          // end
          // HTML // begin [file="/_Type_hbm.jsp";from=(323,87);to=(326,38)]
              out.write("\">\n      <cache usage=\"read-write\" />\n      <key>\n        <column name=\"ITEM_ID\" index=\"");

          // end
          // begin [file="/_Type_hbm.jsp";from=(326,41);to=(326,85)]
              out.print( truncate(indexPrefix + "FURLSET_I", limit) );
          // end
          // HTML // begin [file="/_Type_hbm.jsp";from=(326,87);to=(332,0)]
              out.write("\"/>\n      </key>\n      <element type=\"string\">\n        <column name=\"VALUE\"/>\n      </element>      \n    </set>    \n");

          // end
          // begin [file="/_Type_hbm.jsp";from=(332,2);to=(332,5)]
               } 
          // end
          // HTML // begin [file="/_Type_hbm.jsp";from=(332,7);to=(334,0)]
              out.write("\n\n");

          // end
          // begin [file="/_Type_hbm.jsp";from=(334,2);to=(334,32)]
               if (addAttachWorkspaceSet) { 
          // end
          // HTML // begin [file="/_Type_hbm.jsp";from=(334,34);to=(337,37)]
              out.write("\n    \n    <!--  COLLECTIONS FOR attachWSIdSet -->\n    <set name=\"attachWSIdSet\" table=\"");

          // end
          // begin [file="/_Type_hbm.jsp";from=(337,40);to=(337,80)]
              out.print( truncate(tablePrefix + "AWSET", limit) );
          // end
          // HTML // begin [file="/_Type_hbm.jsp";from=(337,82);to=(340,38)]
              out.write("\">\n      <cache usage=\"read-write\" />\n      <key>\n        <column name=\"ITEM_ID\" index=\"");

          // end
          // begin [file="/_Type_hbm.jsp";from=(340,41);to=(340,83)]
              out.print( truncate(indexPrefix + "AWSET_I", limit) );
          // end
          // HTML // begin [file="/_Type_hbm.jsp";from=(340,85);to=(346,0)]
              out.write("\"/>\n      </key>\n      <element type=\"string\">\n        <column name=\"VALUE\"/>\n      </element>      \n    </set>    \n");

          // end
          // begin [file="/_Type_hbm.jsp";from=(346,2);to=(346,5)]
               } 
          // end
          // HTML // begin [file="/_Type_hbm.jsp";from=(346,7);to=(349,0)]
              out.write("\n  </class>\n</hibernate-mapping>\n");

          // end

      } catch (Throwable t) {
          if (out != null && out.getBufferSize() != 0)
              out.clearBuffer();
          if (pageContext != null) pageContext.handlePageException(t);
      } finally {
          if (_jspxFactory != null) _jspxFactory.releasePageContext(pageContext);
      }
  }
}
