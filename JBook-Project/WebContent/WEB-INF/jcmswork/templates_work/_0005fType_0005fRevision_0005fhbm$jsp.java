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


public class _0005fType_0005fRevision_0005fhbm$jsp extends HttpJspBase {

    // begin [file="/_Type_Revision_hbm.jsp";from=(11,7);to=(18,0)]
        
        static private Map<String,String> truncatedMap = new HashMap<String,String>();
        
        public String truncate(String str, int limit) {
          return Util.truncate(str, limit, truncatedMap);
        }
        
    // end

    static {
    }
    public _0005fType_0005fRevision_0005fhbm$jsp( ) {
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

            // HTML // begin [file="/_Type_Revision_hbm.jsp";from=(0,0);to=(6,0)]
                out.write("<?xml version=\"1.0\"?>\n<!DOCTYPE hibernate-mapping PUBLIC\n        \"-//Hibernate/Hibernate Mapping DTD 3.0//EN\"\n        \"classpath://org/hibernate/hibernate-mapping-3.0.dtd\">\n\n<hibernate-mapping>\n");

            // end
            // begin [file="/_Type_Revision_hbm.jsp";from=(18,4);to=(67,0)]
                
                request.setCharacterEncoding("UTF-8");
                
                truncatedMap.clear();
                  
                final Channel channel = Channel.getChannel();
                
                // Uncomment this to test template under JCMS without the need to restart
                // session.setAttribute("typeElt", channel.getTypeEntry(generated.DBTestType.class).getXmlElement());
                
                Element typeElt = (Element)session.getAttribute("typeElt");
                String className = typeElt.getAttributeValue("name");
                boolean isDBFileDocument = TypeUtil.isSubTypeOf(typeElt, com.jalios.jcms.DBFileDocument.class);
                boolean openRole = Util.toBoolean(typeElt.getAttributeValue("openRole"), false);
                Element titleElt = typeElt.getChild("title");
                boolean titleML = Util.toBoolean(titleElt.getAttributeValue("ml"), false);
                if (!titleML) {
                  titleML = Util.toBoolean(typeElt.getAttributeValue("titleML"), false);
                }
                boolean hasMLField = titleML;
                
                int limit = 30; // Oracle tables are limited to 30 chars
                
                String revisionClassName = className + "Revision";
                
                String tableName = typeElt.getAttributeValue("tableName");
                if (Util.isEmpty(tableName)) {
                  tableName = revisionClassName;
                } else {
                  tableName = tableName + "REVISION";
                }
                tableName = tableName.toUpperCase();
                
                String table = truncate("G_" + tableName, limit); 
                
                String tablePrefix = table + "_"; 
                
                String indexPrefix = "IG_" + tableName + "_";
                
                
                //Get the fields (and the inherited fields)                             
                List fieldEntryList = new ArrayList(Arrays.asList(channel.getAllTypeFieldEntries(TypeProcessor.PACKAGE_NAME + "." + className)));
                for(Iterator it = fieldEntryList.iterator(); it.hasNext();) {
                  TypeFieldEntry itTFE = (TypeFieldEntry)it.next();
                  String editor = itTFE.getEditor();
                  if (Util.isEmpty(editor) || "category".equals(editor)) {
                    it.remove();
                  }
                }
            // end
            // HTML // begin [file="/_Type_Revision_hbm.jsp";from=(67,2);to=(68,25)]
                out.write("\n  <class name=\"generated.");

            // end
            // begin [file="/_Type_Revision_hbm.jsp";from=(68,28);to=(68,47)]
                out.print( revisionClassName );
            // end
            // HTML // begin [file="/_Type_Revision_hbm.jsp";from=(68,49);to=(68,58)]
                out.write("\" table=\"");

            // end
            // begin [file="/_Type_Revision_hbm.jsp";from=(68,61);to=(68,68)]
                out.print( table );
            // end
            // HTML // begin [file="/_Type_Revision_hbm.jsp";from=(68,70);to=(73,52)]
                out.write("\">\n    <cache usage=\"read-write\" />  \n    <id name=\"rowId\" column=\"rowId\">\n      <generator class=\"native\"/>\n    </id>\n    <property name=\"revDate\" not-null=\"true\" index=\"");

            // end
            // begin [file="/_Type_Revision_hbm.jsp";from=(73,55);to=(73,98)]
                out.print( truncate(indexPrefix + "REVDATE", limit)  );
            // end
            // HTML // begin [file="/_Type_Revision_hbm.jsp";from=(73,100);to=(75,73)]
                out.write("\" />\n    <property name=\"revAuthorId\" length=\"32\" />\n    <property name=\"revDataId\" column=\"revDataId\" not-null=\"true\" index=\"");

            // end
            // begin [file="/_Type_Revision_hbm.jsp";from=(75,76);to=(75,121)]
                out.print( truncate(indexPrefix + "REVDATAID", limit)  );
            // end
            // HTML // begin [file="/_Type_Revision_hbm.jsp";from=(75,123);to=(85,68)]
                out.write("\" />\n    <property name=\"revOp\" column=\"revOp\" />\n    <property name=\"revDelegateId\"/>    \n    \n\n    <property name=\"cdate\" />\n    <property name=\"mdate\"  />\n    <property name=\"authorId\" length=\"32\" />\n    \n    <property name=\"pstatus\" />\n    <property name=\"workspaceId\" not-null=\"true\" length=\"32\" index=\"");

            // end
            // begin [file="/_Type_Revision_hbm.jsp";from=(85,71);to=(85,111)]
                out.print( truncate(indexPrefix + "WSID", limit)  );
            // end
            // HTML // begin [file="/_Type_Revision_hbm.jsp";from=(85,113);to=(102,0)]
                out.write("\" />\n    <property name=\"pdate\" />\n    <property name=\"edate\" />\n    <property name=\"adate\" />\n    <property name=\"udate\" />\n    <property name=\"majorVersion\" />\n    <property name=\"minorVersion\" />    \n    <property name=\"tracked\" />     \n    <property name=\"mainInstanceId\" not-null=\"false\" length=\"32\"  />\n    <property name=\"mergeId\" not-null=\"false\" length=\"32\" />\n    <property name=\"mergeDate\" />\n    <property name=\"catIdSetSerial\" type=\"text\" length=\"65536\" />\n    <property name=\"authGrpIdSetSerial\" type=\"text\" length=\"65536\" />\n    <property name=\"authMbrIdSetSerial\" type=\"text\" length=\"65536\" />       \n    <property name=\"updateGrpIdSetSerial\" type=\"text\" length=\"65536\" />\n    <property name=\"updateMbrIdSetSerial\" type=\"text\" length=\"65536\" />       \n   \n");

            // end
            // begin [file="/_Type_Revision_hbm.jsp";from=(102,2);to=(102,27)]
                 if (isDBFileDocument) { 
            // end
            // HTML // begin [file="/_Type_Revision_hbm.jsp";from=(102,29);to=(108,0)]
                out.write("\n    <property name=\"filename\" />\n    <property name=\"originalFilename\" />\n    <property name=\"contentType\"  />\n    <property name=\"remoteUri\"  />\n    <property name=\"uploadDate\" />\n");

            // end
            // begin [file="/_Type_Revision_hbm.jsp";from=(108,2);to=(108,5)]
                 } 
            // end
            // HTML // begin [file="/_Type_Revision_hbm.jsp";from=(108,7);to=(110,0)]
                out.write("    \n   \n");

            // end
            // begin [file="/_Type_Revision_hbm.jsp";from=(110,2);to=(110,19)]
                 if (openRole) { 
            // end
            // HTML // begin [file="/_Type_Revision_hbm.jsp";from=(110,21);to=(112,0)]
                out.write("\n    <property name=\"roleMapStr\" type=\"text\" length=\"65536\" />\n");

            // end
            // begin [file="/_Type_Revision_hbm.jsp";from=(112,2);to=(112,5)]
                 } 
            // end
            // HTML // begin [file="/_Type_Revision_hbm.jsp";from=(112,7);to=(115,0)]
                out.write("    \n    <property name=\"title\" />\n    \n");

            // end
            // begin [file="/_Type_Revision_hbm.jsp";from=(115,2);to=(115,18)]
                 if (titleML) { 
            // end
            // HTML // begin [file="/_Type_Revision_hbm.jsp";from=(115,20);to=(117,0)]
                out.write("\n    <property name=\"titleMLE\" type=\"text\" length=\"1048576\" />\n");

            // end
            // begin [file="/_Type_Revision_hbm.jsp";from=(117,2);to=(117,5)]
                 } 
            // end
            // HTML // begin [file="/_Type_Revision_hbm.jsp";from=(117,7);to=(120,0)]
                out.write("\n\n\n");

            // end
            // begin [file="/_Type_Revision_hbm.jsp";from=(120,0);to=(120,88)]
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
                          // HTML // begin [file="/_Type_Revision_hbm.jsp";from=(120,88);to=(121,0)]
                              out.write("\n");

                          // end
                          // begin [file="/_Type_Revision_hbm.jsp";from=(121,2);to=(144,0)]
                               
                              String name       = itField.getName();
                              String editor     = itField.getEditor();
                              String type       = itField.getType();
                              boolean isAnyLink = itField.isAnyLink();
                              boolean isScalar  = itField.isTypeScalar();
                              boolean isML      = itField.isFieldML();
                              hasMLField = isML || hasMLField;
                              
                              boolean isLargeText = "textarea".equals(editor) || "wysiwyg".equals(editor);
                              
                              String attributes = "";
                              if (isScalar) {
                                if (isAnyLink) {
                                  attributes = " length=\"64\"";
                                }
                                if (isLargeText) { 
                                  attributes = " type=\"text\" length=\"65536\"";
                                }
                              } else {
                                attributes = " type=\"text\" length=\"65536\"";
                              }
                              String propertyName = isAnyLink ? name + "Id" : name;
                          // end
                          // HTML // begin [file="/_Type_Revision_hbm.jsp";from=(144,2);to=(145,0)]
                              out.write("\n");

                          // end
                          // HTML // begin [file="/_Type_Revision_hbm.jsp";from=(145,16);to=(146,0)]
                              out.write("\n");

                          // end
                          // begin [file="/_Type_Revision_hbm.jsp";from=(146,2);to=(146,19)]
                               if (isScalar) { 
                          // end
                          // HTML // begin [file="/_Type_Revision_hbm.jsp";from=(146,21);to=(147,20)]
                              out.write("\n    <property name=\"");

                          // end
                          // begin [file="/_Type_Revision_hbm.jsp";from=(147,23);to=(147,37)]
                              out.print( propertyName );
                          // end
                          // HTML // begin [file="/_Type_Revision_hbm.jsp";from=(147,39);to=(147,40)]
                              out.write("\"");

                          // end
                          // begin [file="/_Type_Revision_hbm.jsp";from=(147,43);to=(147,55)]
                              out.print( attributes );
                          // end
                          // HTML // begin [file="/_Type_Revision_hbm.jsp";from=(147,57);to=(148,0)]
                              out.write("/>\n");

                          // end
                          // HTML // begin [file="/_Type_Revision_hbm.jsp";from=(148,18);to=(149,0)]
                              out.write("\n");

                          // end
                          // begin [file="/_Type_Revision_hbm.jsp";from=(149,2);to=(149,12)]
                               } else { 
                          // end
                          // HTML // begin [file="/_Type_Revision_hbm.jsp";from=(149,14);to=(150,20)]
                              out.write("\n    <property name=\"");

                          // end
                          // begin [file="/_Type_Revision_hbm.jsp";from=(150,23);to=(150,37)]
                              out.print( propertyName );
                          // end
                          // HTML // begin [file="/_Type_Revision_hbm.jsp";from=(150,39);to=(150,46)]
                              out.write("Serial\"");

                          // end
                          // begin [file="/_Type_Revision_hbm.jsp";from=(150,49);to=(150,61)]
                              out.print( attributes );
                          // end
                          // HTML // begin [file="/_Type_Revision_hbm.jsp";from=(150,63);to=(151,0)]
                              out.write("/>\n");

                          // end
                          // begin [file="/_Type_Revision_hbm.jsp";from=(151,2);to=(151,5)]
                               } 
                          // end
                          // HTML // begin [file="/_Type_Revision_hbm.jsp";from=(151,7);to=(152,0)]
                              out.write("\n");

                          // end
                          // begin [file="/_Type_Revision_hbm.jsp";from=(152,2);to=(152,15)]
                               if (isML) { 
                          // end
                          // HTML // begin [file="/_Type_Revision_hbm.jsp";from=(152,17);to=(153,20)]
                              out.write("\n    <property name=\"");

                          // end
                          // begin [file="/_Type_Revision_hbm.jsp";from=(153,23);to=(153,37)]
                              out.print( propertyName );
                          // end
                          // HTML // begin [file="/_Type_Revision_hbm.jsp";from=(153,39);to=(154,0)]
                              out.write("MLE\" type=\"text\" length=\"1048576\" />\n");

                          // end
                          // begin [file="/_Type_Revision_hbm.jsp";from=(154,2);to=(154,5)]
                               } 
                          // end
                          // HTML // begin [file="/_Type_Revision_hbm.jsp";from=(154,7);to=(156,0)]
                              out.write("\n\n");

                          // end
                          // begin [file="/_Type_Revision_hbm.jsp";from=(156,0);to=(156,17)]
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
          // HTML // begin [file="/_Type_Revision_hbm.jsp";from=(156,17);to=(157,0)]
              out.write("\n");

          // end
          // begin [file="/_Type_Revision_hbm.jsp";from=(157,2);to=(157,21)]
               if (hasMLField) { 
          // end
          // HTML // begin [file="/_Type_Revision_hbm.jsp";from=(157,23);to=(159,0)]
              out.write("\n    <property name=\"mainLanguage\" />\n");

          // end
          // begin [file="/_Type_Revision_hbm.jsp";from=(159,2);to=(159,5)]
               } 
          // end
          // HTML // begin [file="/_Type_Revision_hbm.jsp";from=(159,7);to=(162,0)]
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
