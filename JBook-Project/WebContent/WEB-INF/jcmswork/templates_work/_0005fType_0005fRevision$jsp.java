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


public class _0005fType_0005fRevision$jsp extends HttpJspBase {


    static {
    }
    public _0005fType_0005fRevision$jsp( ) {
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

            // begin [file="/_Type_Revision.jsp";from=(5,6);to=(36,0)]
                
                  request.setCharacterEncoding("UTF-8");
                  
                final Channel channel = Channel.getChannel();
                
                // Uncomment this to test template under JCMS without the need to restart
                // session.setAttribute("typeElt", channel.getTypeEntry(generated.DBTestType.class).getXmlElement());
                
                Element typeElt = (Element)session.getAttribute("typeElt");
                String className = typeElt.getAttributeValue("name");
                boolean isDBFileDocument = TypeUtil.isSubTypeOf(typeElt, com.jalios.jcms.DBFileDocument.class);
                
                String revisionSuperclass = com.jalios.jcms.db.DBDataRevision.class.getName();
                if (isDBFileDocument) {
                revisionSuperclass = com.jalios.jcms.DBFileDocumentRevision.class.getName();    
                }
                
                String superclass = typeElt.getAttributeValue("superclass");
                
                TypeFieldEntry[] typeFieldEntries = channel.getAllTypeFieldEntries(TypeProcessor.PACKAGE_NAME + "." + className);
                
                List fieldEntryList = new ArrayList(Arrays.asList(typeFieldEntries));
                for(Iterator it = fieldEntryList.iterator(); it.hasNext();) {
                  TypeFieldEntry itTFE = (TypeFieldEntry)it.next();
                  String editor = itTFE.getEditor();
                  if (Util.isEmpty(editor) || "category".equals(editor)) {
                    it.remove();
                  }
                }
                
                boolean isAbstract = Util.toBoolean(typeElt.getAttributeValue("abstract"),false);
            // end
            // HTML // begin [file="/_Type_Revision.jsp";from=(36,2);to=(47,13)]
                out.write("\npackage generated;\n\nimport java.util.*;\n\nimport com.jalios.jcms.*;\nimport com.jalios.jcms.db.*;\nimport com.jalios.jcms.mashup.*;\nimport com.jalios.util.*;\n\n@SuppressWarnings({\"unchecked\", \"unused\"})\npublic class ");

            // end
            // begin [file="/_Type_Revision.jsp";from=(47,16);to=(47,27)]
                out.print( className );
            // end
            // HTML // begin [file="/_Type_Revision.jsp";from=(47,29);to=(47,46)]
                out.write("Revision extends ");

            // end
            // begin [file="/_Type_Revision.jsp";from=(47,49);to=(47,69)]
                out.print( revisionSuperclass );
            // end
            // HTML // begin [file="/_Type_Revision.jsp";from=(47,71);to=(49,9)]
                out.write(" {\n\n  public ");

            // end
            // begin [file="/_Type_Revision.jsp";from=(49,12);to=(49,23)]
                out.print( className );
            // end
            // HTML // begin [file="/_Type_Revision.jsp";from=(49,25);to=(50,0)]
                out.write("Revision() {\n");

            // end
            // begin [file="/_Type_Revision.jsp";from=(50,2);to=(50,22)]
                 if (!isAbstract) { 
            // end
            // HTML // begin [file="/_Type_Revision.jsp";from=(50,24);to=(51,23)]
                out.write("\n    revisionData = new ");

            // end
            // begin [file="/_Type_Revision.jsp";from=(51,26);to=(51,37)]
                out.print( className );
            // end
            // HTML // begin [file="/_Type_Revision.jsp";from=(51,39);to=(52,0)]
                out.write("();\n");

            // end
            // begin [file="/_Type_Revision.jsp";from=(52,2);to=(52,5)]
                 } 
            // end
            // HTML // begin [file="/_Type_Revision.jsp";from=(52,7);to=(55,9)]
                out.write("\n  }\n  \n  public ");

            // end
            // begin [file="/_Type_Revision.jsp";from=(55,12);to=(55,23)]
                out.print( className );
            // end
            // HTML // begin [file="/_Type_Revision.jsp";from=(55,25);to=(55,34)]
                out.write("Revision(");

            // end
            // begin [file="/_Type_Revision.jsp";from=(55,37);to=(55,48)]
                out.print( className );
            // end
            // HTML // begin [file="/_Type_Revision.jsp";from=(55,50);to=(59,0)]
                out.write(" data, int op) {\n    super(data, op);\n    revisionData = data;\n  }\n");

            // end
            // begin [file="/_Type_Revision.jsp";from=(59,0);to=(59,88)]
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
                          // HTML // begin [file="/_Type_Revision.jsp";from=(59,88);to=(60,0)]
                              out.write("\n");

                          // end
                          // begin [file="/_Type_Revision.jsp";from=(60,2);to=(64,0)]
                               
                              String nameCap    = itField.getNameCap();
                              String type       = itField.getType();
                              String typeShort  = itField.getTypeShort();
                          // end
                          // HTML // begin [file="/_Type_Revision.jsp";from=(64,2);to=(65,0)]
                              out.write("\n");

                          // end
                          // begin [file="/_Type_Revision.jsp";from=(65,2);to=(65,33)]
                               if (itField.isTypeScalar()) { 
                          // end
                          // HTML // begin [file="/_Type_Revision.jsp";from=(65,35);to=(66,9)]
                              out.write("\n  public ");

                          // end
                          // begin [file="/_Type_Revision.jsp";from=(66,12);to=(66,18)]
                              out.print( type );
                          // end
                          // HTML // begin [file="/_Type_Revision.jsp";from=(66,20);to=(66,24)]
                              out.write(" get");

                          // end
                          // begin [file="/_Type_Revision.jsp";from=(66,27);to=(66,36)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/_Type_Revision.jsp";from=(66,38);to=(67,13)]
                              out.write("() {\n    return ((");

                          // end
                          // begin [file="/_Type_Revision.jsp";from=(67,16);to=(67,27)]
                              out.print( className );
                          // end
                          // HTML // begin [file="/_Type_Revision.jsp";from=(67,29);to=(67,47)]
                              out.write(")revisionData).get");

                          // end
                          // begin [file="/_Type_Revision.jsp";from=(67,50);to=(67,59)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/_Type_Revision.jsp";from=(67,61);to=(70,2)]
                              out.write("();\n  }\n\n  ");

                          // end
                          // begin [file="/_Type_Revision.jsp";from=(70,4);to=(70,31)]
                               if ("int".equals(type)) { 
                          // end
                          // HTML // begin [file="/_Type_Revision.jsp";from=(70,33);to=(71,17)]
                              out.write("\n  public void set");

                          // end
                          // begin [file="/_Type_Revision.jsp";from=(71,20);to=(71,29)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/_Type_Revision.jsp";from=(71,31);to=(72,6)]
                              out.write("(Integer v) {\n    ((");

                          // end
                          // begin [file="/_Type_Revision.jsp";from=(72,9);to=(72,20)]
                              out.print( className );
                          // end
                          // HTML // begin [file="/_Type_Revision.jsp";from=(72,22);to=(72,40)]
                              out.write(")revisionData).set");

                          // end
                          // begin [file="/_Type_Revision.jsp";from=(72,43);to=(72,52)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/_Type_Revision.jsp";from=(72,54);to=(74,2)]
                              out.write("(v == null ? 0 : v.intValue());\n  }\n  ");

                          // end
                          // begin [file="/_Type_Revision.jsp";from=(74,4);to=(74,39)]
                               } else if ("long".equals(type)) { 
                          // end
                          // HTML // begin [file="/_Type_Revision.jsp";from=(74,41);to=(75,17)]
                              out.write("\n  public void set");

                          // end
                          // begin [file="/_Type_Revision.jsp";from=(75,20);to=(75,29)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/_Type_Revision.jsp";from=(75,31);to=(76,6)]
                              out.write("(Long v) {\n    ((");

                          // end
                          // begin [file="/_Type_Revision.jsp";from=(76,9);to=(76,20)]
                              out.print( className );
                          // end
                          // HTML // begin [file="/_Type_Revision.jsp";from=(76,22);to=(76,40)]
                              out.write(")revisionData).set");

                          // end
                          // begin [file="/_Type_Revision.jsp";from=(76,43);to=(76,52)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/_Type_Revision.jsp";from=(76,54);to=(78,2)]
                              out.write("(v == null ? 0L : v.longValue());\n  }  \n  ");

                          // end
                          // begin [file="/_Type_Revision.jsp";from=(78,4);to=(78,41)]
                               } else if ("double".equals(type)) { 
                          // end
                          // HTML // begin [file="/_Type_Revision.jsp";from=(78,43);to=(79,17)]
                              out.write("\n  public void set");

                          // end
                          // begin [file="/_Type_Revision.jsp";from=(79,20);to=(79,29)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/_Type_Revision.jsp";from=(79,31);to=(80,6)]
                              out.write("(Double v) {\n    ((");

                          // end
                          // begin [file="/_Type_Revision.jsp";from=(80,9);to=(80,20)]
                              out.print( className );
                          // end
                          // HTML // begin [file="/_Type_Revision.jsp";from=(80,22);to=(80,40)]
                              out.write(")revisionData).set");

                          // end
                          // begin [file="/_Type_Revision.jsp";from=(80,43);to=(80,52)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/_Type_Revision.jsp";from=(80,54);to=(82,2)]
                              out.write("(v == null ? 0.0 : v.doubleValue());\n  }  \n  ");

                          // end
                          // begin [file="/_Type_Revision.jsp";from=(82,4);to=(82,42)]
                               } else if ("boolean".equals(type)) { 
                          // end
                          // HTML // begin [file="/_Type_Revision.jsp";from=(82,44);to=(83,17)]
                              out.write("\n  public void set");

                          // end
                          // begin [file="/_Type_Revision.jsp";from=(83,20);to=(83,29)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/_Type_Revision.jsp";from=(83,31);to=(84,6)]
                              out.write("(Boolean v) {\n    ((");

                          // end
                          // begin [file="/_Type_Revision.jsp";from=(84,9);to=(84,20)]
                              out.print( className );
                          // end
                          // HTML // begin [file="/_Type_Revision.jsp";from=(84,22);to=(84,40)]
                              out.write(")revisionData).set");

                          // end
                          // begin [file="/_Type_Revision.jsp";from=(84,43);to=(84,52)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/_Type_Revision.jsp";from=(84,54);to=(86,2)]
                              out.write("(v == null ? false : v.booleanValue());\n  }  \n  ");

                          // end
                          // begin [file="/_Type_Revision.jsp";from=(86,4);to=(86,14)]
                               } else { 
                          // end
                          // HTML // begin [file="/_Type_Revision.jsp";from=(86,16);to=(87,17)]
                              out.write("\n  public void set");

                          // end
                          // begin [file="/_Type_Revision.jsp";from=(87,20);to=(87,29)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/_Type_Revision.jsp";from=(87,31);to=(87,32)]
                              out.write("(");

                          // end
                          // begin [file="/_Type_Revision.jsp";from=(87,35);to=(87,41)]
                              out.print( type );
                          // end
                          // HTML // begin [file="/_Type_Revision.jsp";from=(87,43);to=(88,6)]
                              out.write(" v) {\n    ((");

                          // end
                          // begin [file="/_Type_Revision.jsp";from=(88,9);to=(88,20)]
                              out.print( className );
                          // end
                          // HTML // begin [file="/_Type_Revision.jsp";from=(88,22);to=(88,40)]
                              out.write(")revisionData).set");

                          // end
                          // begin [file="/_Type_Revision.jsp";from=(88,43);to=(88,52)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/_Type_Revision.jsp";from=(88,54);to=(90,2)]
                              out.write("(v);\n  }\n  ");

                          // end
                          // begin [file="/_Type_Revision.jsp";from=(90,4);to=(90,7)]
                               } 
                          // end
                          // HTML // begin [file="/_Type_Revision.jsp";from=(90,9);to=(91,0)]
                              out.write("\n");

                          // end
                          // begin [file="/_Type_Revision.jsp";from=(91,2);to=(91,32)]
                                 if (itField.isAnyLink()) { 
                          // end
                          // HTML // begin [file="/_Type_Revision.jsp";from=(91,34);to=(92,19)]
                              out.write("\n  public String get");

                          // end
                          // begin [file="/_Type_Revision.jsp";from=(92,22);to=(92,31)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/_Type_Revision.jsp";from=(92,33);to=(93,29)]
                              out.write("Id() { \n    return JcmsUtil.getId(get");

                          // end
                          // begin [file="/_Type_Revision.jsp";from=(93,32);to=(93,41)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/_Type_Revision.jsp";from=(93,43);to=(95,17)]
                              out.write("());\n  }\n  public void set");

                          // end
                          // begin [file="/_Type_Revision.jsp";from=(95,20);to=(95,29)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/_Type_Revision.jsp";from=(95,31);to=(96,6)]
                              out.write("Id(String v) {\n    ((");

                          // end
                          // begin [file="/_Type_Revision.jsp";from=(96,9);to=(96,20)]
                              out.print( className );
                          // end
                          // HTML // begin [file="/_Type_Revision.jsp";from=(96,22);to=(96,40)]
                              out.write(")revisionData).set");

                          // end
                          // begin [file="/_Type_Revision.jsp";from=(96,43);to=(96,52)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/_Type_Revision.jsp";from=(96,54);to=(96,71)]
                              out.write("(channel.getData(");

                          // end
                          // begin [file="/_Type_Revision.jsp";from=(96,74);to=(96,80)]
                              out.print( type );
                          // end
                          // HTML // begin [file="/_Type_Revision.jsp";from=(96,82);to=(98,0)]
                              out.write(".class, v));   \n  }\n");

                          // end
                          // begin [file="/_Type_Revision.jsp";from=(98,2);to=(98,7)]
                                 } 
                          // end
                          // HTML // begin [file="/_Type_Revision.jsp";from=(98,9);to=(99,0)]
                              out.write("  \n");

                          // end
                          // begin [file="/_Type_Revision.jsp";from=(99,2);to=(99,52)]
                               } else if ("java.util.Date".equals(typeShort)) { 
                          // end
                          // HTML // begin [file="/_Type_Revision.jsp";from=(99,54);to=(100,0)]
                              out.write("\n");

                          // end
                          // begin [file="/_Type_Revision.jsp";from=(100,2);to=(102,0)]
                               
                              String collection = itField.isTypeList() ? "List" : "Set";
                          // end
                          // HTML // begin [file="/_Type_Revision.jsp";from=(102,2);to=(104,19)]
                              out.write("\n  @SuppressWarnings(\"unchecked\")\n  public String get");

                          // end
                          // begin [file="/_Type_Revision.jsp";from=(104,22);to=(104,31)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/_Type_Revision.jsp";from=(104,33);to=(105,34)]
                              out.write("Serial() {\n    return encodeDateCollection(((");

                          // end
                          // begin [file="/_Type_Revision.jsp";from=(105,37);to=(105,48)]
                              out.print( className );
                          // end
                          // HTML // begin [file="/_Type_Revision.jsp";from=(105,50);to=(105,68)]
                              out.write(")revisionData).get");

                          // end
                          // begin [file="/_Type_Revision.jsp";from=(105,71);to=(105,80)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/_Type_Revision.jsp";from=(105,82);to=(109,17)]
                              out.write("());\n  }\n  \n  @SuppressWarnings(\"unchecked\")\n  public void set");

                          // end
                          // begin [file="/_Type_Revision.jsp";from=(109,20);to=(109,29)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/_Type_Revision.jsp";from=(109,31);to=(110,6)]
                              out.write("Serial(String v) {\n    ((");

                          // end
                          // begin [file="/_Type_Revision.jsp";from=(110,9);to=(110,20)]
                              out.print( className );
                          // end
                          // HTML // begin [file="/_Type_Revision.jsp";from=(110,22);to=(110,40)]
                              out.write(")revisionData).set");

                          // end
                          // begin [file="/_Type_Revision.jsp";from=(110,43);to=(110,52)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/_Type_Revision.jsp";from=(110,54);to=(110,61)]
                              out.write("(decode");

                          // end
                          // begin [file="/_Type_Revision.jsp";from=(110,64);to=(110,76)]
                              out.print( collection );
                          // end
                          // HTML // begin [file="/_Type_Revision.jsp";from=(110,78);to=(112,0)]
                              out.write("(java.util.Date.class, v));\n  }\n");

                          // end
                          // begin [file="/_Type_Revision.jsp";from=(112,2);to=(112,12)]
                               } else { 
                          // end
                          // HTML // begin [file="/_Type_Revision.jsp";from=(112,14);to=(113,0)]
                              out.write("\n");

                          // end
                          // begin [file="/_Type_Revision.jsp";from=(113,2);to=(119,0)]
                               
                              String collection = itField.isTypeList() ? "List" : "Set";
                              String suffix = "";
                              if (itField.isAnyLink()) {
                                suffix = "Id";
                              }
                          // end
                          // HTML // begin [file="/_Type_Revision.jsp";from=(119,2);to=(121,19)]
                              out.write("\n  @SuppressWarnings(\"unchecked\")\n  public String get");

                          // end
                          // begin [file="/_Type_Revision.jsp";from=(121,22);to=(121,31)]
                              out.print( nameCap );
                          // end
                          // begin [file="/_Type_Revision.jsp";from=(121,36);to=(121,44)]
                              out.print( suffix );
                          // end
                          // HTML // begin [file="/_Type_Revision.jsp";from=(121,46);to=(122,17)]
                              out.write("Serial() {\n    return encode");

                          // end
                          // begin [file="/_Type_Revision.jsp";from=(122,20);to=(122,28)]
                              out.print( suffix );
                          // end
                          // HTML // begin [file="/_Type_Revision.jsp";from=(122,30);to=(122,43)]
                              out.write("Collection(((");

                          // end
                          // begin [file="/_Type_Revision.jsp";from=(122,46);to=(122,57)]
                              out.print( className );
                          // end
                          // HTML // begin [file="/_Type_Revision.jsp";from=(122,59);to=(122,77)]
                              out.write(")revisionData).get");

                          // end
                          // begin [file="/_Type_Revision.jsp";from=(122,80);to=(122,89)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/_Type_Revision.jsp";from=(122,91);to=(126,17)]
                              out.write("());\n  }\n  \n  @SuppressWarnings(\"unchecked\")\n  public void set");

                          // end
                          // begin [file="/_Type_Revision.jsp";from=(126,20);to=(126,29)]
                              out.print( nameCap );
                          // end
                          // begin [file="/_Type_Revision.jsp";from=(126,34);to=(126,42)]
                              out.print( suffix );
                          // end
                          // HTML // begin [file="/_Type_Revision.jsp";from=(126,44);to=(127,6)]
                              out.write("Serial(String v) {\n    ((");

                          // end
                          // begin [file="/_Type_Revision.jsp";from=(127,9);to=(127,20)]
                              out.print( className );
                          // end
                          // HTML // begin [file="/_Type_Revision.jsp";from=(127,22);to=(127,40)]
                              out.write(")revisionData).set");

                          // end
                          // begin [file="/_Type_Revision.jsp";from=(127,43);to=(127,52)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/_Type_Revision.jsp";from=(127,54);to=(127,61)]
                              out.write("(decode");

                          // end
                          // begin [file="/_Type_Revision.jsp";from=(127,64);to=(127,72)]
                              out.print( suffix );
                          // end
                          // begin [file="/_Type_Revision.jsp";from=(127,77);to=(127,89)]
                              out.print( collection );
                          // end
                          // HTML // begin [file="/_Type_Revision.jsp";from=(127,91);to=(127,92)]
                              out.write("(");

                          // end
                          // begin [file="/_Type_Revision.jsp";from=(127,95);to=(127,119)]
                              out.print( itField.getTypeShort() );
                          // end
                          // HTML // begin [file="/_Type_Revision.jsp";from=(127,121);to=(129,0)]
                              out.write(".class, v));\n  }\n");

                          // end
                          // begin [file="/_Type_Revision.jsp";from=(129,2);to=(129,5)]
                               } 
                          // end
                          // HTML // begin [file="/_Type_Revision.jsp";from=(129,7);to=(130,0)]
                              out.write("\n");

                          // end
                          // begin [file="/_Type_Revision.jsp";from=(130,2);to=(130,30)]
                               if (itField.isFieldML()) { 
                          // end
                          // HTML // begin [file="/_Type_Revision.jsp";from=(130,32);to=(131,19)]
                              out.write("\n  public String get");

                          // end
                          // begin [file="/_Type_Revision.jsp";from=(131,22);to=(131,31)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/_Type_Revision.jsp";from=(131,33);to=(132,13)]
                              out.write("MLE() {\n    return ((");

                          // end
                          // begin [file="/_Type_Revision.jsp";from=(132,16);to=(132,27)]
                              out.print( className );
                          // end
                          // HTML // begin [file="/_Type_Revision.jsp";from=(132,29);to=(132,47)]
                              out.write(")revisionData).get");

                          // end
                          // begin [file="/_Type_Revision.jsp";from=(132,50);to=(132,59)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/_Type_Revision.jsp";from=(132,61);to=(134,17)]
                              out.write("MLE();\n  }\n  public void set");

                          // end
                          // begin [file="/_Type_Revision.jsp";from=(134,20);to=(134,29)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/_Type_Revision.jsp";from=(134,31);to=(135,6)]
                              out.write("MLE(String v) {\n    ((");

                          // end
                          // begin [file="/_Type_Revision.jsp";from=(135,9);to=(135,20)]
                              out.print( className );
                          // end
                          // HTML // begin [file="/_Type_Revision.jsp";from=(135,22);to=(135,40)]
                              out.write(")revisionData).set");

                          // end
                          // begin [file="/_Type_Revision.jsp";from=(135,43);to=(135,52)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/_Type_Revision.jsp";from=(135,54);to=(137,0)]
                              out.write("MLE(v);\n  }\n");

                          // end
                          // begin [file="/_Type_Revision.jsp";from=(137,2);to=(137,5)]
                               } 
                          // end
                          // HTML // begin [file="/_Type_Revision.jsp";from=(137,7);to=(138,0)]
                              out.write("\n");

                          // end
                          // begin [file="/_Type_Revision.jsp";from=(138,0);to=(138,17)]
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
          // HTML // begin [file="/_Type_Revision.jsp";from=(138,17);to=(140,0)]
              out.write("\n}\n");

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
