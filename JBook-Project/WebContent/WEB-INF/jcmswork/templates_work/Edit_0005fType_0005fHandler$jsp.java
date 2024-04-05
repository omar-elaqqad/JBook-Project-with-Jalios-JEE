import custom.*;
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


public class Edit_0005fType_0005fHandler$jsp extends HttpJspBase {


    static {
    }
    public Edit_0005fType_0005fHandler$jsp( ) {
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
            			"", true, 8192, true);

            application = pageContext.getServletContext();
            config = pageContext.getServletConfig();
            session = pageContext.getSession();
            out = pageContext.getOut();

            // HTML // begin [file="/Edit_Type_Handler.jsp";from=(0,50);to=(1,0)]
                out.write("\n");

            // end
            // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1,127);to=(2,0)]
                out.write("\n");

            // end
            // HTML // begin [file="/Edit_Type_Handler.jsp";from=(2,44);to=(3,0)]
                out.write("\n");

            // end
            // begin [file="/Edit_Type_Handler.jsp";from=(3,2);to=(73,0)]
                
                  request.setCharacterEncoding("UTF-8");
                  
                final Channel channel = Channel.getChannel();
                
                boolean isPublicationType = true;
                Element typeElt = (Element)session.getAttribute("typeElt");
                
                String className = null;
                String formHandler = "EditPublicationHandler";
                String theData = "theContent";
                if (typeElt == null) {
                  typeElt = (Element)session.getAttribute("extensionElt");
                  isPublicationType = false;
                  String extendedType = typeElt.getAttributeValue("type");
                  className = Util.getClassShortName(extendedType) + "Extension";
                  formHandler = "EditTypeExtensionHandler";
                  theData = "theExtension";
                } else {
                  className = typeElt.getAttributeValue("name");
                }
                
                String superclass = Util.getString(typeElt.getAttributeValue("superclass"), Publication.class.getName());
                boolean isFileDocument = TypeUtil.isSubTypeOf(typeElt, com.jalios.jcms.FileDocument.class);
                
                // Forms
                boolean isForm = typeElt.getAttribute("formAuthor") != null;
                boolean formOneSubmit = Util.getString(typeElt.getAttributeValue("formOneSubmit"), "false").equals("true");
                boolean formNotify = Util.getString(typeElt.getAttributeValue("formNotify"), "false").equals("true");
                if (isForm) {
                  formHandler = "EditFormHandler";
                }
                
                
                // FormHandler superclass
                if (superclass.startsWith("generated.") || isFileDocument) {
                  formHandler =  "Edit" + Util.getClassShortName(superclass) + "Handler";
                
                  // FormHandler superclass custom handler
                  Element superElt = TypeUtil.getSuperElt(typeElt);
                  if (superElt != null && Util.notEmpty(superElt.getAttributeValue("customformhandler"))) {
                    formHandler = superElt.getAttributeValue("customformhandler");
                  }
                }
                
                
                formHandler = Util.getString(typeElt.getAttributeValue("formhandler"), formHandler);
                
                
                // Find out declared fields
                List declaredFieldList = new ArrayList();
                List categoryFieldList = new ArrayList();
                List fieldList = Arrays.asList(channel.getTypeFieldEntries(TypeProcessor.PACKAGE_NAME + "." + className));
                Set imageMapSet = new HashSet();
                for(Iterator it = fieldList.iterator(); it.hasNext();) {
                  TypeFieldEntry itField = (TypeFieldEntry)it.next();
                  String type = itField.getType();
                  if ("super".equals(type)) {
                    continue;
                  }
                  String name = itField.getName();
                  String editor = itField.getEditor();
                  if (isPublicationType && editor.equals("category")) {
                    categoryFieldList.add(itField);
                  } else if (editor.equals("sqlresult")) {
                    // EMPTY
                  } else {
                    declaredFieldList.add(itField);
                  }  
                }
            // end
            // HTML // begin [file="/Edit_Type_Handler.jsp";from=(73,2);to=(75,8)]
                out.write("\n// This file has been automatically generated.\npackage ");

            // end
            // begin [file="/Edit_Type_Handler.jsp";from=(75,11);to=(75,39)]
                out.print( TypeProcessor.PACKAGE_NAME );
            // end
            // HTML // begin [file="/Edit_Type_Handler.jsp";from=(75,41);to=(89,17)]
                out.write(";\n   \n   \nimport java.text.*;\nimport java.util.*;\nimport org.apache.oro.text.regex.*;\nimport com.jalios.jcms.*;\nimport com.jalios.jcms.handler.*;\nimport com.jalios.jcms.wysiwyg.WysiwygManager;\nimport com.jalios.util.ObjectIntTreeMap;\nimport com.jalios.util.Util;\nimport custom.*;\n\n@SuppressWarnings({\"unchecked\", \"unused\"})\npublic class Edit");

            // end
            // begin [file="/Edit_Type_Handler.jsp";from=(89,20);to=(89,31)]
                out.print( className );
            // end
            // HTML // begin [file="/Edit_Type_Handler.jsp";from=(89,33);to=(89,49)]
                out.write("Handler extends ");

            // end
            // begin [file="/Edit_Type_Handler.jsp";from=(89,52);to=(89,65)]
                out.print( formHandler );
            // end
            // HTML // begin [file="/Edit_Type_Handler.jsp";from=(89,67);to=(91,0)]
                out.write(" {\n   \n");

            // end
            // begin [file="/Edit_Type_Handler.jsp";from=(91,0);to=(91,48)]
                /* ----  jalios:if ---- */
                com.jalios.jtaglib.IfTag _jspx_th_jalios_if_0 = new com.jalios.jtaglib.IfTag();
                _jspx_th_jalios_if_0.setPageContext(pageContext);
                _jspx_th_jalios_if_0.setParent(null);
                _jspx_th_jalios_if_0.setPredicate( isPublicationType );
                try {
                    int _jspx_eval_jalios_if_0 = _jspx_th_jalios_if_0.doStartTag();
                    if (_jspx_eval_jalios_if_0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                        try {
                            if (_jspx_eval_jalios_if_0 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_if_0.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_if_0.doInitBody();
                          }
                          do {
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(91,48);to=(92,12)]
                              out.write("\n  protected ");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(92,15);to=(92,26)]
                              out.print( className );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(92,28);to=(95,11)]
                              out.write(" theContent;\n  \n  public Class<? extends Publication> getPublicationClass() {\n    return ");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(95,14);to=(95,25)]
                              out.print( className );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(95,27);to=(98,0)]
                              out.write(".class;\n  }\n\n");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(98,0);to=(98,12)]
                          } while (_jspx_th_jalios_if_0.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
                      } finally {
                          if (_jspx_eval_jalios_if_0 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                              out = pageContext.popBody();
                      }
                  }
                  if (_jspx_th_jalios_if_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
                      return;
              } finally {
                  _jspx_th_jalios_if_0.release();
              }
          // end
          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(98,12);to=(100,0)]
              out.write("\n\n");

          // end
          // begin [file="/Edit_Type_Handler.jsp";from=(100,0);to=(100,49)]
              /* ----  jalios:if ---- */
              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_1 = new com.jalios.jtaglib.IfTag();
              _jspx_th_jalios_if_1.setPageContext(pageContext);
              _jspx_th_jalios_if_1.setParent(null);
              _jspx_th_jalios_if_1.setPredicate( !isPublicationType );
              try {
                  int _jspx_eval_jalios_if_1 = _jspx_th_jalios_if_1.doStartTag();
                  if (_jspx_eval_jalios_if_1 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                      try {
                          if (_jspx_eval_jalios_if_1 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_if_1.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_if_1.doInitBody();
                          }
                          do {
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(100,49);to=(101,2)]
                              out.write("\n  ");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(101,5);to=(101,16)]
                              out.print( className );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(101,18);to=(104,11)]
                              out.write(" theExtension;\n\n  public Class getExtensionClass() {\n    return ");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(104,14);to=(104,25)]
                              out.print( className );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(104,27);to=(107,0)]
                              out.write(".class;\n  }\n\n");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(107,0);to=(107,58)]
                              /* ----  jalios:if ---- */
                              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_2 = new com.jalios.jtaglib.IfTag();
                              _jspx_th_jalios_if_2.setPageContext(pageContext);
                              _jspx_th_jalios_if_2.setParent(_jspx_th_jalios_if_1);
                              _jspx_th_jalios_if_2.setPredicate( declaredFieldList.isEmpty() );
                              try {
                              int _jspx_eval_jalios_if_2 = _jspx_th_jalios_if_2.doStartTag();
                              if (_jspx_eval_jalios_if_2 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                              try {
                              if (_jspx_eval_jalios_if_2 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_if_2.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_if_2.doInitBody();
                          }
                          do {
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(107,58);to=(111,0)]
                              out.write("\n  public boolean isEmptyExtension() {\n    return true;\n  }\n");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(111,0);to=(111,12)]
                          } while (_jspx_th_jalios_if_2.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
                      } finally {
                          if (_jspx_eval_jalios_if_2 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                              out = pageContext.popBody();
                      }
                  }
                  if (_jspx_th_jalios_if_2.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
                      return;
              } finally {
                  _jspx_th_jalios_if_2.release();
              }
          // end
          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(111,12);to=(112,0)]
              out.write("\n");

          // end
          // begin [file="/Edit_Type_Handler.jsp";from=(112,0);to=(112,12)]
          } while (_jspx_th_jalios_if_1.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
      } finally {
          if (_jspx_eval_jalios_if_1 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
              out = pageContext.popBody();
      }
  }
  if (_jspx_th_jalios_if_1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
      return;
} finally {
    _jspx_th_jalios_if_1.release();
}
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(112,12);to=(116,21)]
    out.write("\n\n  \n  // ----------------------------------------------------------------------\n  // validateBeforeOp");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(116,24);to=(116,35)]
    out.print( className );
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(116,37);to=(124,22)]
    out.write("  \n  // ----------------------------------------------------------------------\n  \n  public boolean validateBeforeOp() {\n    if (!super.validateBeforeOp()) {\n      return false;\n    }\n    \n    Member fdauthor = ");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(124,25);to=(124,82)]
    out.print( isForm ? "getAvailableAuthor();" : "getLoggedMember();" );
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(124,84);to=(125,4)]
    out.write("\n    ");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(125,6);to=(125,22)]
     if (!isForm) { 
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(125,24);to=(127,4)]
    out.write("\n           fdauthor = (fdauthor == null) ? getAvailableAuthor() : fdauthor;\n    ");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(127,6);to=(127,9)]
     } 
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(127,11);to=(129,0)]
    out.write("\n    \n");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(129,0);to=(129,83)]
    /* ----  jalios:foreach ---- */
    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_0 = new com.jalios.jtaglib.ForeachTag();
    _jspx_th_jalios_foreach_0.setPageContext(pageContext);
    _jspx_th_jalios_foreach_0.setParent(null);
    _jspx_th_jalios_foreach_0.setCollection( fieldList );
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
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(129,83);to=(130,0)]
                    out.write("\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(130,2);to=(137,0)]
                    
                    String  type     = itField.getType();
                    String  name     = itField.getName();
                    String  nameCap  = itField.getNameCap();
                    String  editor   = itField.getEditor();
                    boolean fieldML  = itField.isFieldML();
                    String typeShort = itField.getTypeShort();
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(137,2);to=(138,0)]
                    out.write("\n");

                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(138,33);to=(139,0)]
                    out.write("\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(139,2);to=(139,30)]
                     if (itField.isAnyLink()) { 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(139,32);to=(140,0)]
                    out.write("\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(140,2);to=(140,35)]
                       if (itField.isTypeScalar()) { 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(140,37);to=(141,0)]
                    out.write("\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(141,2);to=(141,24)]
                         if (!fieldML ) { 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(141,26);to=(143,33)]
                    out.write("\n    {\n      Data data = processDataId(\"");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(143,36);to=(143,42)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(143,44);to=(143,49)]
                    out.write("\", __");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(143,52);to=(143,58)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(143,60);to=(143,65)]
                    out.write("Str, ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(143,68);to=(143,79)]
                    out.print( typeShort );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(143,81);to=(145,8)]
                    out.write(".class);\n      if (data != null) { \n        ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(145,11);to=(145,17)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(145,19);to=(145,23)]
                    out.write(" = (");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(145,26);to=(145,32)]
                    out.print( type );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(145,34);to=(147,10)]
                    out.write(")data;\n      } else {\n        is");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(147,13);to=(147,22)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(147,24);to=(147,51)]
                    out.write("Validated = Util.isEmpty(__");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(147,54);to=(147,60)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(147,62);to=(150,0)]
                    out.write("Str);\n      }\n    }\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(150,2);to=(150,16)]
                         } else { 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(150,18);to=(151,4)]
                    out.write("\n    ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(151,7);to=(151,13)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(151,15);to=(151,20)]
                    out.write("ML = ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(151,23);to=(151,29)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(151,31);to=(151,62)]
                    out.write("ML == null ? new HashMap<>() : ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(151,65);to=(151,71)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(151,73);to=(152,4)]
                    out.write("ML;\n    ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(152,7);to=(152,13)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(152,15);to=(152,19)]
                    out.write(" = (");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(152,22);to=(152,28)]
                    out.print( type );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(152,30);to=(152,46)]
                    out.write(")processMLData(\"");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(152,49);to=(152,55)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(152,57);to=(152,60)]
                    out.write("\", ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(152,63);to=(152,69)]
                    out.print( type );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(152,71);to=(152,81)]
                    out.write(".class, __");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(152,84);to=(152,90)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(152,92);to=(152,97)]
                    out.write("Str, ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(152,100);to=(152,106)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(152,108);to=(153,0)]
                    out.write("ML);\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(153,2);to=(153,9)]
                         } 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(153,11);to=(155,0)]
                    out.write("\n\n");

                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(155,35);to=(156,0)]
                    out.write("\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(156,2);to=(157,23)]
                       } else { 
                           if (!fieldML) { 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(157,25);to=(159,11)]
                    out.write("\n    {\n      List<");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(159,14);to=(159,25)]
                    out.print( typeShort );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(159,27);to=(159,52)]
                    out.write("> list = processDataIds(\"");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(159,55);to=(159,61)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(159,63);to=(159,67)]
                    out.write("\",__");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(159,70);to=(159,76)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(159,78);to=(159,82)]
                    out.write("Str,");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(159,85);to=(159,96)]
                    out.print( typeShort );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(159,98);to=(160,11)]
                    out.write(".class);\n      this.");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(160,14);to=(160,20)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(160,22);to=(160,26)]
                    out.write(" = (");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(160,29);to=(160,40)]
                    out.print( typeShort );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(160,42);to=(160,62)]
                    out.write("[])list.toArray(new ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(160,65);to=(160,76)]
                    out.print( typeShort );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(160,78);to=(162,0)]
                    out.write("[0]);\n    }\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(162,2);to=(162,16)]
                         } else { 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(162,18);to=(163,4)]
                    out.write("\n    ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(163,7);to=(163,13)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(163,15);to=(163,20)]
                    out.write("ML = ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(163,23);to=(163,29)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(163,31);to=(163,62)]
                    out.write("ML == null ? new HashMap<>() : ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(163,65);to=(163,71)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(163,73);to=(164,4)]
                    out.write("ML;\n    ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(164,7);to=(164,13)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(164,15);to=(164,19)]
                    out.write(" = (");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(164,22);to=(164,28)]
                    out.print( type );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(164,30);to=(164,51)]
                    out.write(")processMLDataArray(\"");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(164,54);to=(164,60)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(164,62);to=(164,65)]
                    out.write("\", ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(164,68);to=(164,79)]
                    out.print( typeShort );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(164,81);to=(164,91)]
                    out.write(".class, __");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(164,94);to=(164,100)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(164,102);to=(164,107)]
                    out.write("Str, ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(164,110);to=(164,116)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(164,118);to=(165,0)]
                    out.write("ML);\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(165,2);to=(167,5)]
                         } 
                         } 
                       } 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(167,7);to=(168,0)]
                    out.write("\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(168,0);to=(168,17)]
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
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(168,17);to=(170,0)]
    out.write("\n\n");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(170,0);to=(170,83)]
    /* ----  jalios:foreach ---- */
    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_1 = new com.jalios.jtaglib.ForeachTag();
    _jspx_th_jalios_foreach_1.setPageContext(pageContext);
    _jspx_th_jalios_foreach_1.setParent(null);
    _jspx_th_jalios_foreach_1.setCollection( fieldList );
    _jspx_th_jalios_foreach_1.setName("itField");
    _jspx_th_jalios_foreach_1.setType("TypeFieldEntry");
    try {
        int _jspx_eval_jalios_foreach_1 = _jspx_th_jalios_foreach_1.doStartTag();
        if (_jspx_eval_jalios_foreach_1 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_foreach_1 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_foreach_1.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_foreach_1.doInitBody();
                }
                do {
                    Integer itCounter = null;
                    itCounter = (Integer) pageContext.findAttribute("itCounter");
                    TypeFieldEntry itField = null;
                    itField = (TypeFieldEntry) pageContext.findAttribute("itField");
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(170,83);to=(171,0)]
                    out.write("\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(171,2);to=(171,43)]
                     String nameCap  = itField.getNameCap(); 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(171,45);to=(172,0)]
                    out.write("\n");

                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(172,44);to=(173,0)]
                    out.write("\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(173,2);to=(173,28)]
                     if (itField.isLink()) {  
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(173,30);to=(174,50)]
                    out.write("\n    if (!validateUploadedFileDocument(getAvailable");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(174,53);to=(174,62)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(174,64);to=(174,68)]
                    out.write("(), ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(174,71);to=(174,121)]
                    out.print( itField.isFieldML() ? itField.getName()+"ML,":"" );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(174,123);to=(177,0)]
                    out.write("  fdauthor, getAvailableWorkspace())) {\n      return false;\n    }\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(177,2);to=(177,5)]
                     } 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(177,7);to=(178,0)]
                    out.write("\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(178,0);to=(178,17)]
                } while (_jspx_th_jalios_foreach_1.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_foreach_1 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_foreach_1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_foreach_1.release();
    }
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(178,17);to=(180,0)]
    out.write("\n\n");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(180,0);to=(180,83)]
    /* ----  jalios:foreach ---- */
    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_2 = new com.jalios.jtaglib.ForeachTag();
    _jspx_th_jalios_foreach_2.setPageContext(pageContext);
    _jspx_th_jalios_foreach_2.setParent(null);
    _jspx_th_jalios_foreach_2.setCollection( fieldList );
    _jspx_th_jalios_foreach_2.setName("itField");
    _jspx_th_jalios_foreach_2.setType("TypeFieldEntry");
    try {
        int _jspx_eval_jalios_foreach_2 = _jspx_th_jalios_foreach_2.doStartTag();
        if (_jspx_eval_jalios_foreach_2 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_foreach_2 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_foreach_2.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_foreach_2.doInitBody();
                }
                do {
                    Integer itCounter = null;
                    itCounter = (Integer) pageContext.findAttribute("itCounter");
                    TypeFieldEntry itField = null;
                    itField = (TypeFieldEntry) pageContext.findAttribute("itField");
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(180,83);to=(181,0)]
                    out.write("\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(181,2);to=(181,43)]
                     String nameCap  = itField.getNameCap(); 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(181,45);to=(182,0)]
                    out.write("\n");

                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(182,44);to=(183,0)]
                    out.write("\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(183,2);to=(183,28)]
                     if (itField.isLink()) {  
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(183,30);to=(184,48)]
                    out.write("\n    if (!createUploadedFileDocument(getAvailable");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(184,51);to=(184,60)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(184,62);to=(184,66)]
                    out.write("(), ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(184,69);to=(184,118)]
                    out.print( itField.isFieldML() ?itField.getName()+"ML,":"" );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(184,120);to=(187,0)]
                    out.write(" fdauthor, getAvailableWorkspace())) {\n      return false;\n    }\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(187,2);to=(187,5)]
                     } 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(187,7);to=(188,0)]
                    out.write("\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(188,0);to=(188,17)]
                } while (_jspx_th_jalios_foreach_2.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_foreach_2 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_foreach_2.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_foreach_2.release();
    }
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(188,17);to=(195,2)]
    out.write("\n\n    return true;\n  }\n\n  @Override\n  public Object getAvailableField(String field) {\n  ");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(195,4);to=(198,4)]
     for (Iterator it = fieldList.iterator() ; it.hasNext() ; ) {
           TypeFieldEntry itField = (TypeFieldEntry) it.next();
           if (Util.isEmpty(itField.getName())) { continue; }
        
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(198,6);to=(199,9)]
    out.write("\n    if (\"");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(199,12);to=(199,31)]
    out.print( itField.getName() );
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(199,33);to=(200,4)]
    out.write("\".equals(field)) {\n    ");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(200,6);to=(200,34)]
     if (itField.isFieldML()) { 
// end
// begin [file="/Edit_Type_Handler.jsp";from=(200,38);to=(201,4)]
    
        
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(201,6);to=(201,30)]
    out.write("  return getAllAvailable");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(201,33);to=(201,55)]
    out.print( itField.getNameCap() );
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(201,57);to=(201,62)]
    out.write("ML();");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(201,64);to=(202,5)]
     
         
// end
// begin [file="/Edit_Type_Handler.jsp";from=(202,9);to=(202,91)]
     } else if (itField.isTypeCategory() && itField.getEditor().equals("category")) { 
// end
// begin [file="/Edit_Type_Handler.jsp";from=(202,95);to=(203,4)]
    
        
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(203,6);to=(203,18)]
    out.write("  return get");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(203,21);to=(203,43)]
    out.print( itField.getNameCap() );
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(203,45);to=(203,54)]
    out.write("CatSet();");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(203,56);to=(204,4)]
    
        
// end
// begin [file="/Edit_Type_Handler.jsp";from=(204,8);to=(204,18)]
     } else { 
// end
// begin [file="/Edit_Type_Handler.jsp";from=(204,22);to=(205,4)]
    
        
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(205,6);to=(205,27)]
    out.write("  return getAvailable");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(205,30);to=(205,52)]
    out.print( itField.getNameCap() );
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(205,54);to=(205,57)]
    out.write("();");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(205,59);to=(206,4)]
     
        
// end
// begin [file="/Edit_Type_Handler.jsp";from=(206,8);to=(206,11)]
     } 
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(206,13);to=(208,4)]
    out.write("\n    }\n    ");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(208,6);to=(208,53)]
     if (itField.getEditor().equals("sqlquery")) { 
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(208,55);to=(209,9)]
    out.write("\n    if (\"");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(209,12);to=(209,31)]
    out.print( itField.getName() );
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(209,33);to=(210,25)]
    out.write("DataSource\".equals(field)) {\n      return getAvailable");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(210,28);to=(210,50)]
    out.print( itField.getNameCap() );
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(210,52);to=(212,9)]
    out.write("DataSource();\n    }\n    if (\"");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(212,12);to=(212,31)]
    out.print( itField.getName() );
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(212,33);to=(213,25)]
    out.write("MaxRows\".equals(field)) {\n      return getAvailable");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(213,28);to=(213,50)]
    out.print( itField.getNameCap() );
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(213,52);to=(215,4)]
    out.write("MaxRows();\n    }\n    ");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(215,6);to=(215,9)]
     } 
// end
// begin [file="/Edit_Type_Handler.jsp";from=(215,13);to=(216,0)]
    
// end
// begin [file="/Edit_Type_Handler.jsp";from=(216,4);to=(216,7)]
     } 
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(216,9);to=(222,2)]
    out.write("\n    return super.getAvailableField(field);\n  }\n\n  @Override\n  public Object getEnumValues(String field) {\n  ");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(222,4);to=(225,0)]
     for (Iterator it = fieldList.iterator() ; it.hasNext() ; ) {
           TypeFieldEntry itField = (TypeFieldEntry) it.next();
           if (Util.isEmpty(itField.getName())) { continue; }
// end
// begin [file="/Edit_Type_Handler.jsp";from=(225,4);to=(225,215)]
     if (itField.isMbrEnum() || itField.isGrpEnum() || itField.isEnumerate() || itField.isTypeBoolean() || itField.isTypeBooleanArray() || (itField.isTypeCollection() && "Boolean".equals(itField.getTypeShort()))) { 
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(225,217);to=(226,9)]
    out.write("\n    if (\"");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(226,12);to=(226,31)]
    out.print( itField.getName() );
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(226,33);to=(227,13)]
    out.write("\".equals(field)) {\n      return ");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(227,16);to=(227,27)]
    out.print( className );
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(227,29);to=(227,33)]
    out.write(".get");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(227,36);to=(227,58)]
    out.print( itField.getNameCap() );
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(227,60);to=(229,0)]
    out.write("Values();\n    }\n");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(229,2);to=(229,5)]
     } 
// end
// begin [file="/Edit_Type_Handler.jsp";from=(229,9);to=(230,0)]
    
// end
// begin [file="/Edit_Type_Handler.jsp";from=(230,4);to=(230,7)]
     } 
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(230,9);to=(236,2)]
    out.write("\n    return super.getEnumValues(field);\n  }\n\n  @Override\n  public Object getEnumLabels(String field, String userLang) {\n  ");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(236,4);to=(239,0)]
     for (Iterator it = fieldList.iterator() ; it.hasNext() ; ) {
           TypeFieldEntry itField = (TypeFieldEntry) it.next();
           if (Util.isEmpty(itField.getName())) { continue; }
// end
// begin [file="/Edit_Type_Handler.jsp";from=(239,4);to=(239,169)]
     if (itField.isEnumerate() || itField.isTypeBoolean() || itField.isTypeBooleanArray() || (itField.isTypeCollection() && "Boolean".equals(itField.getTypeShort()))) { 
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(239,171);to=(240,9)]
    out.write("\n    if (\"");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(240,12);to=(240,31)]
    out.print( itField.getName() );
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(240,33);to=(241,13)]
    out.write("\".equals(field)) {\n      return ");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(241,16);to=(241,27)]
    out.print( className );
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(241,29);to=(241,33)]
    out.write(".get");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(241,36);to=(241,58)]
    out.print( itField.getNameCap() );
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(241,60);to=(243,0)]
    out.write("Labels(userLang);\n    }\n");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(243,2);to=(243,5)]
     } 
// end
// begin [file="/Edit_Type_Handler.jsp";from=(243,9);to=(244,0)]
    
// end
// begin [file="/Edit_Type_Handler.jsp";from=(244,4);to=(244,7)]
     } 
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(244,9);to=(249,31)]
    out.write("\n    return super.getEnumLabels(field, userLang);\n  }\n\n  // ----------------------------------------------------------------------\n  // validateCommonCreateUpdate");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(249,34);to=(249,45)]
    out.print( className );
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(249,47);to=(251,43)]
    out.write("  \n  // ----------------------------------------------------------------------\n  public boolean validateCommonCreateUpdate");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(251,46);to=(251,57)]
    out.print( className );
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(251,59);to=(252,0)]
    out.write("() {\n");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(252,0);to=(252,83)]
    /* ----  jalios:foreach ---- */
    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_3 = new com.jalios.jtaglib.ForeachTag();
    _jspx_th_jalios_foreach_3.setPageContext(pageContext);
    _jspx_th_jalios_foreach_3.setParent(null);
    _jspx_th_jalios_foreach_3.setCollection( fieldList );
    _jspx_th_jalios_foreach_3.setName("itField");
    _jspx_th_jalios_foreach_3.setType("TypeFieldEntry");
    try {
        int _jspx_eval_jalios_foreach_3 = _jspx_th_jalios_foreach_3.doStartTag();
        if (_jspx_eval_jalios_foreach_3 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_foreach_3 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_foreach_3.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_foreach_3.doInitBody();
                }
                do {
                    Integer itCounter = null;
                    itCounter = (Integer) pageContext.findAttribute("itCounter");
                    TypeFieldEntry itField = null;
                    itField = (TypeFieldEntry) pageContext.findAttribute("itField");
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(252,83);to=(253,0)]
                    out.write("\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(253,2);to=(265,0)]
                    
                      String type        = itField.getType();
                      String name        = itField.getName();
                      String nameCap     = itField.getNameCap();
                      String editor      = itField.getEditor();
                      String classGetter = isPublicationType ? "getPublicationClass()" : "getExtensionClass()";
                      String label       = "channel.getTypeFieldLabel(" + classGetter + ", \"" + name + "\", userLang)";
                      String minValue    = ""; // FIXME itField.get getAttributeValue("minValue");
                      String maxValue    = ""; // FIXME itField.getAttributeValue("maxValue");
                      String root        = itField.getRoot();
                      boolean isScalar   = itField.isTypeScalar();
                      
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(265,2);to=(266,0)]
                    out.write("\n");

                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(266,50);to=(267,0)]
                    out.write("\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(267,0);to=(267,62)]
                    /* ----  jalios:if ---- */
                    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_3 = new com.jalios.jtaglib.IfTag();
                    _jspx_th_jalios_if_3.setPageContext(pageContext);
                    _jspx_th_jalios_if_3.setParent(_jspx_th_jalios_foreach_3);
                    _jspx_th_jalios_if_3.setPredicate( isScalar && itField.isAnyLink() );
                    try {
                        int _jspx_eval_jalios_if_3 = _jspx_th_jalios_if_3.doStartTag();
                        if (_jspx_eval_jalios_if_3 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                            try {
                              if (_jspx_eval_jalios_if_3 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_if_3.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_if_3.doInitBody();
                          }
                          do {
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(267,62);to=(268,11)]
                              out.write("\n    if (!is");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(268,14);to=(268,23)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(268,25);to=(269,48)]
                              out.write("Validated) {\n      setWarningMsg(glp(\"msg.edit.bad-link-id\", ");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(269,51);to=(269,58)]
                              out.print( label );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(269,60);to=(272,0)]
                              out.write("));\n      return false;\n    }\n");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(272,0);to=(272,12)]
                          } while (_jspx_th_jalios_if_3.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
                      } finally {
                          if (_jspx_eval_jalios_if_3 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                              out = pageContext.popBody();
                      }
                  }
                  if (_jspx_th_jalios_if_3.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
                      return;
              } finally {
                  _jspx_th_jalios_if_3.release();
              }
          // end
          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(272,12);to=(274,0)]
              out.write("\n\n");

          // end
          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(274,33);to=(275,0)]
              out.write("\n");

          // end
          // begin [file="/Edit_Type_Handler.jsp";from=(275,0);to=(275,60)]
              /* ----  jalios:if ---- */
              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_4 = new com.jalios.jtaglib.IfTag();
              _jspx_th_jalios_if_4.setPageContext(pageContext);
              _jspx_th_jalios_if_4.setParent(_jspx_th_jalios_foreach_3);
              _jspx_th_jalios_if_4.setPredicate( type.equals("java.util.Date") );
              try {
                  int _jspx_eval_jalios_if_4 = _jspx_th_jalios_if_4.doStartTag();
                  if (_jspx_eval_jalios_if_4 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                      try {
                          if (_jspx_eval_jalios_if_4 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_if_4.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_if_4.doInitBody();
                          }
                          do {
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(275,60);to=(276,11)]
                              out.write("\n    if (!is");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(276,14);to=(276,23)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(276,25);to=(277,51)]
                              out.write("Validated) {\n      setWarningMsg(glp(\"msg.edit.bad-date-value\", ");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(277,54);to=(277,61)]
                              out.print( label );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(277,63);to=(277,90)]
                              out.write(", HttpUtil.encodeForHTML(__");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(277,93);to=(277,99)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(277,101);to=(280,0)]
                              out.write("Str)));\n      return false;\n    }\n");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(280,0);to=(280,12)]
                          } while (_jspx_th_jalios_if_4.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
                      } finally {
                          if (_jspx_eval_jalios_if_4 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                              out = pageContext.popBody();
                      }
                  }
                  if (_jspx_th_jalios_if_4.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
                      return;
              } finally {
                  _jspx_th_jalios_if_4.release();
              }
          // end
          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(280,12);to=(282,0)]
              out.write("\n\n");

          // end
          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(282,35);to=(283,0)]
              out.write("\n");

          // end
          // begin [file="/Edit_Type_Handler.jsp";from=(283,0);to=(283,62)]
              /* ----  jalios:if ---- */
              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_5 = new com.jalios.jtaglib.IfTag();
              _jspx_th_jalios_if_5.setPageContext(pageContext);
              _jspx_th_jalios_if_5.setParent(_jspx_th_jalios_foreach_3);
              _jspx_th_jalios_if_5.setPredicate( type.equals("java.util.Date[]") );
              try {
                  int _jspx_eval_jalios_if_5 = _jspx_th_jalios_if_5.doStartTag();
                  if (_jspx_eval_jalios_if_5 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                      try {
                          if (_jspx_eval_jalios_if_5 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_if_5.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_if_5.doInitBody();
                          }
                          do {
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(283,62);to=(284,11)]
                              out.write("\n    if (!is");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(284,14);to=(284,23)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(284,25);to=(285,51)]
                              out.write("Validated) {\n      setWarningMsg(glp(\"msg.edit.bad-date-value\", ");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(285,54);to=(285,61)]
                              out.print( label );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(285,63);to=(285,100)]
                              out.write(", HttpUtil.encodeForHTML(Util.join(__");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(285,103);to=(285,109)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(285,111);to=(288,0)]
                              out.write("StrArray, \"', '\"))));\n      return false;\n    }\n");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(288,0);to=(288,12)]
                          } while (_jspx_th_jalios_if_5.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
                      } finally {
                          if (_jspx_eval_jalios_if_5 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                              out = pageContext.popBody();
                      }
                  }
                  if (_jspx_th_jalios_if_5.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
                      return;
              } finally {
                  _jspx_th_jalios_if_5.release();
              }
          // end
          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(288,12);to=(290,0)]
              out.write("\n\n");

          // end
          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(290,48);to=(291,0)]
              out.write("\n");

          // end
          // begin [file="/Edit_Type_Handler.jsp";from=(291,0);to=(291,84)]
              /* ----  jalios:if ---- */
              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_6 = new com.jalios.jtaglib.IfTag();
              _jspx_th_jalios_if_6.setPageContext(pageContext);
              _jspx_th_jalios_if_6.setParent(_jspx_th_jalios_foreach_3);
              _jspx_th_jalios_if_6.setPredicate( itField.isTypePrimitive() && !itField.isTypeBoolean() );
              try {
                  int _jspx_eval_jalios_if_6 = _jspx_th_jalios_if_6.doStartTag();
                  if (_jspx_eval_jalios_if_6 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                      try {
                          if (_jspx_eval_jalios_if_6 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_if_6.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_if_6.doInitBody();
                          }
                          do {
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(291,84);to=(292,11)]
                              out.write("\n    if (!is");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(292,14);to=(292,23)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(292,25);to=(293,54)]
                              out.write("Validated) {\n      setWarningMsg(glp(\"msg.edit.bad-number-format\", ");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(293,57);to=(293,64)]
                              out.print( label );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(293,66);to=(296,0)]
                              out.write("));\n      return false;\n    }\n");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(296,0);to=(296,12)]
                          } while (_jspx_th_jalios_if_6.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
                      } finally {
                          if (_jspx_eval_jalios_if_6 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                              out = pageContext.popBody();
                      }
                  }
                  if (_jspx_th_jalios_if_6.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
                      return;
              } finally {
                  _jspx_th_jalios_if_6.release();
              }
          // end
          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(296,12);to=(298,0)]
              out.write("\n\n");

          // end
          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(298,54);to=(299,0)]
              out.write("\n");

          // end
          // begin [file="/Edit_Type_Handler.jsp";from=(299,0);to=(299,90)]
              /* ----  jalios:if ---- */
              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_7 = new com.jalios.jtaglib.IfTag();
              _jspx_th_jalios_if_7.setPageContext(pageContext);
              _jspx_th_jalios_if_7.setParent(_jspx_th_jalios_foreach_3);
              _jspx_th_jalios_if_7.setPredicate( itField.isTypePrimitiveArray()  && !itField.isTypeBoolean() );
              try {
                  int _jspx_eval_jalios_if_7 = _jspx_th_jalios_if_7.doStartTag();
                  if (_jspx_eval_jalios_if_7 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                      try {
                          if (_jspx_eval_jalios_if_7 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_if_7.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_if_7.doInitBody();
                          }
                          do {
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(299,90);to=(300,11)]
                              out.write("\n    if (!is");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(300,14);to=(300,23)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(300,25);to=(301,54)]
                              out.write("Validated) {\n      setWarningMsg(glp(\"msg.edit.bad-number-format\", ");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(301,57);to=(301,64)]
                              out.print( label );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(301,66);to=(304,0)]
                              out.write("));\n      return false;\n    }\n");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(304,0);to=(304,12)]
                          } while (_jspx_th_jalios_if_7.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
                      } finally {
                          if (_jspx_eval_jalios_if_7 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                              out = pageContext.popBody();
                      }
                  }
                  if (_jspx_th_jalios_if_7.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
                      return;
              } finally {
                  _jspx_th_jalios_if_7.release();
              }
          // end
          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(304,12);to=(306,0)]
              out.write("\n\n");

          // end
          // begin [file="/Edit_Type_Handler.jsp";from=(306,0);to=(306,17)]
          } while (_jspx_th_jalios_foreach_3.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
      } finally {
          if (_jspx_eval_jalios_foreach_3 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
              out = pageContext.popBody();
      }
  }
  if (_jspx_th_jalios_foreach_3.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
      return;
} finally {
    _jspx_th_jalios_foreach_3.release();
}
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(306,17);to=(318,35)]
    out.write("\n    return true;\n  }\n  \n  // ----------------------------------------------------------------------\n  // Create\n  // ----------------------------------------------------------------------\n  public boolean validateCreate() throws java.io.IOException {\n    if (!super.validateCreate()) {\n      return false;\n    }\n\n    if (!validateCommonCreateUpdate");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(318,38);to=(318,49)]
    out.print( className );
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(318,51);to=(333,35)]
    out.write("()) {\n      return false;\n    }\n\n    return true;\n  }\n  \n  // ----------------------------------------------------------------------\n  // Update\n  // ----------------------------------------------------------------------\n  public boolean validateUpdate() throws java.io.IOException {\n    if (!super.validateUpdate()) {\n      return false;\n    }\n    \n    if (!validateCommonCreateUpdate");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(333,38);to=(333,49)]
    out.print( className );
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(333,51);to=(347,0)]
    out.write("()) {\n      return false;\n    }\n    \n    return true;\n  }\n \n  // ----------------------------------------------------------------------\n  // Next\n  // ----------------------------------------------------------------------\n  protected boolean validateNext() throws java.io.IOException {\n   if (!super.validateNext()) {\n      return false;\n    }\n");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(347,0);to=(347,91)]
    /* ----  jalios:foreach ---- */
    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_4 = new com.jalios.jtaglib.ForeachTag();
    _jspx_th_jalios_foreach_4.setPageContext(pageContext);
    _jspx_th_jalios_foreach_4.setParent(null);
    _jspx_th_jalios_foreach_4.setCollection( declaredFieldList );
    _jspx_th_jalios_foreach_4.setName("itField");
    _jspx_th_jalios_foreach_4.setType("TypeFieldEntry");
    try {
        int _jspx_eval_jalios_foreach_4 = _jspx_th_jalios_foreach_4.doStartTag();
        if (_jspx_eval_jalios_foreach_4 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_foreach_4 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_foreach_4.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_foreach_4.doInitBody();
                }
                do {
                    Integer itCounter = null;
                    itCounter = (Integer) pageContext.findAttribute("itCounter");
                    TypeFieldEntry itField = null;
                    itField = (TypeFieldEntry) pageContext.findAttribute("itField");
                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(347,93);to=(356,2)]
                    
                      String type     = itField.getType();
                      String editor   = itField.getEditor();
                      String name     = itField.getName();
                      String nameCap  = itField.getNameCap();
                      boolean fieldML = itField.isFieldML();
                      String classGetter = isPublicationType ? "getPublicationClass()" : "getExtensionClass()";
                      String label       = "channel.getTypeFieldLabel(" + classGetter + ", \"" + name + "\", userLang)";
                      boolean isScalar = itField.isTypeScalar();
                      
                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(356,39);to=(357,0)]
                    
                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(357,2);to=(357,53)]
                    /* ----  jalios:if ---- */
                    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_8 = new com.jalios.jtaglib.IfTag();
                    _jspx_th_jalios_if_8.setPageContext(pageContext);
                    _jspx_th_jalios_if_8.setParent(_jspx_th_jalios_foreach_4);
                    _jspx_th_jalios_if_8.setPredicate( editor.equals("date"));
                    try {
                        int _jspx_eval_jalios_if_8 = _jspx_th_jalios_if_8.doStartTag();
                        if (_jspx_eval_jalios_if_8 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                            try {
                              if (_jspx_eval_jalios_if_8 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_if_8.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_if_8.doInitBody();
                          }
                          do {
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(357,53);to=(358,0)]
                              out.write("\n");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(358,2);to=(358,19)]
                               if (isScalar) { 
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(358,21);to=(359,11)]
                              out.write("\n    if (!is");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(359,14);to=(359,23)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(359,25);to=(360,51)]
                              out.write("Validated) {\n      setWarningMsg(glp(\"msg.edit.bad-date-value\", ");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(360,54);to=(360,61)]
                              out.print( label );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(360,63);to=(360,90)]
                              out.write(", HttpUtil.encodeForHTML(__");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(360,93);to=(360,99)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(360,101);to=(363,0)]
                              out.write("Str)));\n      return false;\n    }\n");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(363,2);to=(364,0)]
                              }else{
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(364,37);to=(365,11)]
                              out.write("\n    if (!is");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(365,14);to=(365,23)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(365,25);to=(366,51)]
                              out.write("Validated) {\n      setWarningMsg(glp(\"msg.edit.bad-date-value\", ");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(366,54);to=(366,61)]
                              out.print( label );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(366,63);to=(366,100)]
                              out.write(", HttpUtil.encodeForHTML(Util.join(__");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(366,103);to=(366,109)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(366,111);to=(368,5)]
                              out.write("StrArray, \"', '\"))));\n      return false;\n    }");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(368,7);to=(369,4)]
                              
                                  
                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(369,8);to=(369,9)]
                              }
                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(369,13);to=(370,0)]
                              
                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(368,5);to=(370,14)]
                          } while (_jspx_th_jalios_if_8.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
                      } finally {
                          if (_jspx_eval_jalios_if_8 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                              out = pageContext.popBody();
                      }
                  }
                  if (_jspx_th_jalios_if_8.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
                      return;
              } finally {
                  _jspx_th_jalios_if_8.release();
              }
          // end
          // begin [file="/Edit_Type_Handler.jsp";from=(370,16);to=(371,0)]
              
          // end
          // begin [file="/Edit_Type_Handler.jsp";from=(368,5);to=(371,19)]
          } while (_jspx_th_jalios_foreach_4.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
      } finally {
          if (_jspx_eval_jalios_foreach_4 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
              out = pageContext.popBody();
      }
  }
  if (_jspx_th_jalios_foreach_4.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
      return;
} finally {
    _jspx_th_jalios_foreach_4.release();
}
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(371,19);to=(383,0)]
    out.write("\n\n\treturn true;\n  }\n\n  // ----------------------------------------------------------------------\n  // Previous\n  // ----------------------------------------------------------------------\n  protected boolean validatePrevious() throws java.io.IOException {\n  \tif (!super.validatePrevious()) {\n      return false;\n    }\n");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(383,0);to=(383,91)]
    /* ----  jalios:foreach ---- */
    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_5 = new com.jalios.jtaglib.ForeachTag();
    _jspx_th_jalios_foreach_5.setPageContext(pageContext);
    _jspx_th_jalios_foreach_5.setParent(null);
    _jspx_th_jalios_foreach_5.setCollection( declaredFieldList );
    _jspx_th_jalios_foreach_5.setName("itField");
    _jspx_th_jalios_foreach_5.setType("TypeFieldEntry");
    try {
        int _jspx_eval_jalios_foreach_5 = _jspx_th_jalios_foreach_5.doStartTag();
        if (_jspx_eval_jalios_foreach_5 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_foreach_5 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_foreach_5.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_foreach_5.doInitBody();
                }
                do {
                    Integer itCounter = null;
                    itCounter = (Integer) pageContext.findAttribute("itCounter");
                    TypeFieldEntry itField = null;
                    itField = (TypeFieldEntry) pageContext.findAttribute("itField");
                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(383,93);to=(392,2)]
                    
                      String type     = itField.getType();
                      String editor   = itField.getEditor();
                      String name     = itField.getName();
                      String nameCap  = itField.getNameCap();
                      boolean fieldML = itField.isFieldML();
                      String classGetter = isPublicationType ? "getPublicationClass()" : "getExtensionClass()";
                      String label       = "channel.getTypeFieldLabel(" + classGetter + ", \"" + name + "\", userLang)";
                      boolean isScalar = itField.isTypeScalar();
                      
                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(392,39);to=(393,0)]
                    
                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(393,2);to=(393,53)]
                    /* ----  jalios:if ---- */
                    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_9 = new com.jalios.jtaglib.IfTag();
                    _jspx_th_jalios_if_9.setPageContext(pageContext);
                    _jspx_th_jalios_if_9.setParent(_jspx_th_jalios_foreach_5);
                    _jspx_th_jalios_if_9.setPredicate( editor.equals("date"));
                    try {
                        int _jspx_eval_jalios_if_9 = _jspx_th_jalios_if_9.doStartTag();
                        if (_jspx_eval_jalios_if_9 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                            try {
                              if (_jspx_eval_jalios_if_9 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_if_9.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_if_9.doInitBody();
                          }
                          do {
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(393,53);to=(394,0)]
                              out.write("\n");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(394,2);to=(394,19)]
                               if (isScalar) { 
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(394,21);to=(395,11)]
                              out.write("\n    if (!is");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(395,14);to=(395,23)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(395,25);to=(396,51)]
                              out.write("Validated) {\n      setWarningMsg(glp(\"msg.edit.bad-date-value\", ");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(396,54);to=(396,61)]
                              out.print( label );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(396,63);to=(396,90)]
                              out.write(", HttpUtil.encodeForHTML(__");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(396,93);to=(396,99)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(396,101);to=(399,0)]
                              out.write("Str)));\n      return false;\n    }\n");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(399,2);to=(400,0)]
                              }else{
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(400,37);to=(401,11)]
                              out.write("\n    if (!is");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(401,14);to=(401,23)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(401,25);to=(402,51)]
                              out.write("Validated) {\n      setWarningMsg(glp(\"msg.edit.bad-date-value\", ");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(402,54);to=(402,61)]
                              out.print( label );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(402,63);to=(402,100)]
                              out.write(", HttpUtil.encodeForHTML(Util.join(__");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(402,103);to=(402,109)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(402,111);to=(404,5)]
                              out.write("StrArray, \"', '\"))));\n      return false;\n    }");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(404,7);to=(405,4)]
                              
                                  
                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(405,8);to=(405,9)]
                              }
                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(405,13);to=(406,0)]
                              
                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(404,5);to=(406,14)]
                          } while (_jspx_th_jalios_if_9.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
                      } finally {
                          if (_jspx_eval_jalios_if_9 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                              out = pageContext.popBody();
                      }
                  }
                  if (_jspx_th_jalios_if_9.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
                      return;
              } finally {
                  _jspx_th_jalios_if_9.release();
              }
          // end
          // begin [file="/Edit_Type_Handler.jsp";from=(406,16);to=(407,0)]
              
          // end
          // begin [file="/Edit_Type_Handler.jsp";from=(404,5);to=(407,19)]
          } while (_jspx_th_jalios_foreach_5.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
      } finally {
          if (_jspx_eval_jalios_foreach_5 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
              out = pageContext.popBody();
      }
  }
  if (_jspx_th_jalios_foreach_5.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
      return;
} finally {
    _jspx_th_jalios_foreach_5.release();
}
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(407,19);to=(419,0)]
    out.write("\n\n\treturn true;\n  }\n\n  // ----------------------------------------------------------------------\n  // Finish\n  // ----------------------------------------------------------------------\n  protected boolean validateFinish() throws java.io.IOException {\n  \tif (!super.validateFinish()) {\n      return false;\n    }\n");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(419,0);to=(419,91)]
    /* ----  jalios:foreach ---- */
    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_6 = new com.jalios.jtaglib.ForeachTag();
    _jspx_th_jalios_foreach_6.setPageContext(pageContext);
    _jspx_th_jalios_foreach_6.setParent(null);
    _jspx_th_jalios_foreach_6.setCollection( declaredFieldList );
    _jspx_th_jalios_foreach_6.setName("itField");
    _jspx_th_jalios_foreach_6.setType("TypeFieldEntry");
    try {
        int _jspx_eval_jalios_foreach_6 = _jspx_th_jalios_foreach_6.doStartTag();
        if (_jspx_eval_jalios_foreach_6 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_foreach_6 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_foreach_6.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_foreach_6.doInitBody();
                }
                do {
                    Integer itCounter = null;
                    itCounter = (Integer) pageContext.findAttribute("itCounter");
                    TypeFieldEntry itField = null;
                    itField = (TypeFieldEntry) pageContext.findAttribute("itField");
                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(419,93);to=(428,2)]
                    
                      String type     = itField.getType();
                      String editor   = itField.getEditor();
                      String name     = itField.getName();
                      String nameCap  = itField.getNameCap();
                      boolean fieldML = itField.isFieldML();
                      String classGetter = isPublicationType ? "getPublicationClass()" : "getExtensionClass()";
                      String label       = "channel.getTypeFieldLabel(" + classGetter + ", \"" + name + "\", userLang)";
                      boolean isScalar = itField.isTypeScalar();
                      
                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(428,39);to=(429,0)]
                    
                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(429,2);to=(429,53)]
                    /* ----  jalios:if ---- */
                    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_10 = new com.jalios.jtaglib.IfTag();
                    _jspx_th_jalios_if_10.setPageContext(pageContext);
                    _jspx_th_jalios_if_10.setParent(_jspx_th_jalios_foreach_6);
                    _jspx_th_jalios_if_10.setPredicate( editor.equals("date"));
                    try {
                        int _jspx_eval_jalios_if_10 = _jspx_th_jalios_if_10.doStartTag();
                        if (_jspx_eval_jalios_if_10 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                            try {
                              if (_jspx_eval_jalios_if_10 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_if_10.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_if_10.doInitBody();
                          }
                          do {
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(429,53);to=(430,0)]
                              out.write("\n");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(430,2);to=(430,19)]
                               if (isScalar) { 
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(430,21);to=(431,11)]
                              out.write("\n    if (!is");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(431,14);to=(431,23)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(431,25);to=(432,51)]
                              out.write("Validated) {\n      setWarningMsg(glp(\"msg.edit.bad-date-value\", ");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(432,54);to=(432,61)]
                              out.print( label );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(432,63);to=(432,90)]
                              out.write(", HttpUtil.encodeForHTML(__");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(432,93);to=(432,99)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(432,101);to=(435,0)]
                              out.write("Str)));\n      return false;\n    }\n");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(435,2);to=(436,0)]
                              }else{
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(436,37);to=(437,11)]
                              out.write("\n    if (!is");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(437,14);to=(437,23)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(437,25);to=(438,51)]
                              out.write("Validated) {\n      setWarningMsg(glp(\"msg.edit.bad-date-value\", ");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(438,54);to=(438,61)]
                              out.print( label );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(438,63);to=(438,100)]
                              out.write(", HttpUtil.encodeForHTML(Util.join(__");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(438,103);to=(438,109)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(438,111);to=(440,5)]
                              out.write("StrArray, \"', '\"))));\n      return false;\n    }");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(440,7);to=(441,4)]
                              
                                  
                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(441,8);to=(441,9)]
                              }
                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(441,13);to=(442,0)]
                              
                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(440,5);to=(442,14)]
                          } while (_jspx_th_jalios_if_10.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
                      } finally {
                          if (_jspx_eval_jalios_if_10 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                              out = pageContext.popBody();
                      }
                  }
                  if (_jspx_th_jalios_if_10.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
                      return;
              } finally {
                  _jspx_th_jalios_if_10.release();
              }
          // end
          // begin [file="/Edit_Type_Handler.jsp";from=(442,16);to=(443,0)]
              
          // end
          // begin [file="/Edit_Type_Handler.jsp";from=(440,5);to=(443,19)]
          } while (_jspx_th_jalios_foreach_6.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
      } finally {
          if (_jspx_eval_jalios_foreach_6 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
              out = pageContext.popBody();
      }
  }
  if (_jspx_th_jalios_foreach_6.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
      return;
} finally {
    _jspx_th_jalios_foreach_6.release();
}
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(443,19);to=(452,24)]
    out.write("\n\n\treturn true;\n  }\n\n\n  // ----------------------------------------------------------------------\n  // setFields\n  // ----------------------------------------------------------------------\n  public void setFields(");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(452,27);to=(452,80)]
    out.print( isPublicationType ? "Publication" : "DataExtension" );
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(452,82);to=(454,4)]
    out.write(" data) {\n    super.setFields(data);\n    ");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(454,7);to=(454,18)]
    out.print( className );
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(454,20);to=(454,28)]
    out.write(" obj = (");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(454,31);to=(454,42)]
    out.print( className );
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(454,44);to=(455,0)]
    out.write(")data;\n");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(455,0);to=(455,91)]
    /* ----  jalios:foreach ---- */
    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_7 = new com.jalios.jtaglib.ForeachTag();
    _jspx_th_jalios_foreach_7.setPageContext(pageContext);
    _jspx_th_jalios_foreach_7.setParent(null);
    _jspx_th_jalios_foreach_7.setCollection( declaredFieldList );
    _jspx_th_jalios_foreach_7.setName("itField");
    _jspx_th_jalios_foreach_7.setType("TypeFieldEntry");
    try {
        int _jspx_eval_jalios_foreach_7 = _jspx_th_jalios_foreach_7.doStartTag();
        if (_jspx_eval_jalios_foreach_7 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_foreach_7 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_foreach_7.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_foreach_7.doInitBody();
                }
                do {
                    Integer itCounter = null;
                    itCounter = (Integer) pageContext.findAttribute("itCounter");
                    TypeFieldEntry itField = null;
                    itField = (TypeFieldEntry) pageContext.findAttribute("itField");
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(455,91);to=(456,0)]
                    out.write("\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(456,2);to=(462,0)]
                    
                      String type     = itField.getType();
                      String editor   = itField.getEditor();
                      String name     = itField.getName();
                      String nameCap  = itField.getNameCap();
                      boolean fieldML = itField.isFieldML();
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(462,2);to=(463,0)]
                    out.write("\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(463,2);to=(463,57)]
                     if (type.equals("boolean") && name.startsWith("is")) {
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(463,59);to=(464,11)]
                    out.write("\n    obj.set");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(464,14);to=(464,33)]
                    out.print( name.substring(2) );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(464,35);to=(464,48)]
                    out.write("(getAvailable");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(464,51);to=(464,60)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(464,62);to=(465,0)]
                    out.write("());\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(465,2);to=(465,37)]
                     } else if (itField.isTypeList()) {
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(465,39);to=(466,46)]
                    out.write("\n    if (data == null || !Util.isSameContent(((");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(466,49);to=(466,60)]
                    out.print( className );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(466,62);to=(466,72)]
                    out.write(")data).get");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(466,75);to=(466,84)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(466,86);to=(466,133)]
                    out.write("(), Util.getArrayList(false, true, getAvailable");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(466,136);to=(466,145)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(466,147);to=(467,13)]
                    out.write("()))) {\n      obj.set");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(467,16);to=(467,25)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(467,27);to=(467,71)]
                    out.write("(Util.getArrayList(false, true, getAvailable");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(467,74);to=(467,83)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(467,85);to=(469,0)]
                    out.write("()));\n    }\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(469,2);to=(469,32)]
                       if (itField.isFieldML()) { 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(469,34);to=(470,11)]
                    out.write("\n    obj.set");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(470,14);to=(470,23)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(470,25);to=(470,70)]
                    out.write("ML(mapStringArrayToMapStringList(getAvailable");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(470,73);to=(470,82)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(470,84);to=(471,0)]
                    out.write("ML()));\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(471,2);to=(471,7)]
                       } 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(471,9);to=(472,0)]
                    out.write("\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(472,2);to=(472,36)]
                     } else if (itField.isTypeSet()) {
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(472,38);to=(473,46)]
                    out.write("\n    if (data == null || !Util.isSameContent(((");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(473,49);to=(473,60)]
                    out.print( className );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(473,62);to=(473,72)]
                    out.write(")data).get");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(473,75);to=(473,84)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(473,86);to=(473,118)]
                    out.write("(), Util.getHashSet(getAvailable");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(473,121);to=(473,130)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(473,132);to=(474,13)]
                    out.write("()))) {\n      obj.set");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(474,16);to=(474,25)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(474,27);to=(474,56)]
                    out.write("(Util.getHashSet(getAvailable");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(474,59);to=(474,68)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(474,70);to=(476,0)]
                    out.write("()));\n    }\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(476,2);to=(476,12)]
                     } else { 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(476,14);to=(477,11)]
                    out.write("\n    obj.set");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(477,14);to=(477,23)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(477,25);to=(477,38)]
                    out.write("(getAvailable");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(477,41);to=(477,50)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(477,52);to=(478,0)]
                    out.write("());\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(478,2);to=(478,20)]
                       if (fieldML) { 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(478,22);to=(479,11)]
                    out.write("\n    obj.set");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(479,14);to=(479,23)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(479,25);to=(479,40)]
                    out.write("ML(getAvailable");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(479,43);to=(479,52)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(479,54);to=(480,0)]
                    out.write("ML());\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(480,2);to=(480,7)]
                       } 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(480,9);to=(481,0)]
                    out.write("\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(481,2);to=(481,38)]
                       if (editor.equals("sqlquery")) { 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(481,40);to=(482,11)]
                    out.write("\n    obj.set");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(482,14);to=(482,23)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(482,25);to=(482,48)]
                    out.write("DataSource(getAvailable");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(482,51);to=(482,60)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(482,62);to=(483,11)]
                    out.write("DataSource());\n    obj.set");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(483,14);to=(483,23)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(483,25);to=(483,45)]
                    out.write("MaxRows(getAvailable");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(483,48);to=(483,57)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(483,59);to=(484,0)]
                    out.write("MaxRows());\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(484,2);to=(484,7)]
                       } 
                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(484,11);to=(484,14)]
                     } 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(484,16);to=(485,0)]
                    out.write("\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(485,0);to=(485,17)]
                } while (_jspx_th_jalios_foreach_7.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_foreach_7 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_foreach_7.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_foreach_7.release();
    }
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(485,17);to=(488,0)]
    out.write("\n  }\n  \n");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(488,0);to=(488,48)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_11 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_11.setPageContext(pageContext);
    _jspx_th_jalios_if_11.setParent(null);
    _jspx_th_jalios_if_11.setPredicate( isPublicationType );
    try {
        int _jspx_eval_jalios_if_11 = _jspx_th_jalios_if_11.doStartTag();
        if (_jspx_eval_jalios_if_11 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_if_11 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_if_11.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_if_11.doInitBody();
                }
                do {
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(488,48);to=(490,38)]
                    out.write("\n  public void setId(String  v) {\n    if (channel.getData(v) instanceof ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(490,41);to=(490,52)]
                    out.print( className );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(490,54);to=(492,20)]
                    out.write(") {\n      super.setId(v);\n      theContent = (");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(492,23);to=(492,34)]
                    out.print( className );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(492,36);to=(498,0)]
                    out.write(")publication;\n    } else {\n      super.setId(null);\n      theContent = null;\n    }\n  }\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(498,0);to=(498,12)]
                } while (_jspx_th_jalios_if_11.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_if_11 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_if_11.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_if_11.release();
    }
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(498,12);to=(500,0)]
    out.write("\n\n");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(500,0);to=(500,49)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_12 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_12.setPageContext(pageContext);
    _jspx_th_jalios_if_12.setParent(null);
    _jspx_th_jalios_if_12.setPredicate( !isPublicationType );
    try {
        int _jspx_eval_jalios_if_12 = _jspx_th_jalios_if_12.doStartTag();
        if (_jspx_eval_jalios_if_12 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_if_12 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_if_12.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_if_12.doInitBody();
                }
                do {
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(500,49);to=(502,29)]
                    out.write("\n  public void setExtension(DataExtension extension) {\n    if (extension instanceof ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(502,32);to=(502,43)]
                    out.print( className );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(502,45);to=(504,22)]
                    out.write(") {\n      super.setExtension(extension);\n      theExtension = (");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(504,25);to=(504,36)]
                    out.print( className );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(504,38);to=(507,0)]
                    out.write(")extension;\n    }\n  }\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(507,0);to=(507,12)]
                } while (_jspx_th_jalios_if_12.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_if_12 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_if_12.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_if_12.release();
    }
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(507,12);to=(509,0)]
    out.write("\n\n");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(509,2);to=(512,0)]
     
      Map tabGroupMap  = new HashMap();
      Map nameCapMLMap = new HashMap();
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(512,2);to=(513,0)]
    out.write("  \n");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(513,0);to=(513,91)]
    /* ----  jalios:foreach ---- */
    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_8 = new com.jalios.jtaglib.ForeachTag();
    _jspx_th_jalios_foreach_8.setPageContext(pageContext);
    _jspx_th_jalios_foreach_8.setParent(null);
    _jspx_th_jalios_foreach_8.setCollection( declaredFieldList );
    _jspx_th_jalios_foreach_8.setName("itField");
    _jspx_th_jalios_foreach_8.setType("TypeFieldEntry");
    try {
        int _jspx_eval_jalios_foreach_8 = _jspx_th_jalios_foreach_8.doStartTag();
        if (_jspx_eval_jalios_foreach_8 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_foreach_8 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_foreach_8.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_foreach_8.doInitBody();
                }
                do {
                    Integer itCounter = null;
                    itCounter = (Integer) pageContext.findAttribute("itCounter");
                    TypeFieldEntry itField = null;
                    itField = (TypeFieldEntry) pageContext.findAttribute("itField");
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(513,91);to=(514,0)]
                    out.write("\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(514,2);to=(575,0)]
                    
                      String type    = itField.getType();
                      String name    = itField.getName();
                      String nameCap = itField.getNameCap();
                      String editor  = itField.getEditor();
                      boolean fieldML = itField.isFieldML();
                      
                      String tabGroup = itField.getTabGroup();
                      if (Util.notEmpty(tabGroup)) {
                        Util.updateListMap(tabGroupMap, Util.recapitalize(Util.buildID(tabGroup, "0-9a-zA-Z")), nameCap, false);
                      }
                      
                      nameCapMLMap.put(nameCap , fieldML ? Boolean.TRUE : Boolean.FALSE);
                      
                      boolean isDateOnly = itField.isDateOnly();
                      String root        = itField.getRoot();
                    
                      String typeShort = itField.getTypeShort();
                      boolean isScalar = itField.isTypeScalar();
                      boolean isArray  = itField.isTypeArray();
                      String type_available = type;
                      if (itField.isTypeCollection()) {
                        type_available = itField.getTypeShort() + "[]";
                      }
                        
                      String defaultValue = "";
                      
                      String defaultStr = Util.escapeJavaStringChar(itField.getDefaultValue());
                      if (type.equals("String")) {
                        if (Util.notEmpty(defaultStr)) {
                          defaultValue = "\"" + defaultStr + "\"";
                        } else {
                          defaultValue = "channel.getTypeFieldEntry(" + className + ".class, \"" + name + "\", true).getDefaultTextString()";
                        }
                      }
                      else if (itField.isTypeBoolean()) {
                        if (Util.notEmpty(defaultStr)) {
                          defaultValue = "on".equals(defaultStr) || "true".equals(defaultStr) ? "true" : "false";
                        }
                      }
                      else if (itField.isTypePrimitive()) {
                        defaultValue = Util.notEmpty(defaultStr) ? defaultStr : "0";
                      }
                      else if(Util.notEmpty(defaultStr)) {
                        defaultValue = defaultStr;
                      }
                    
                      boolean escapeHtml = true;
                      if (editor.equals("wysiwyg") || editor.equals("sqlquery")) {
                        escapeHtml = false;
                      }
                      else if (editor.equals("textfield") || editor.equals("textarea")) {
                        escapeHtml = itField.escapeHtml();
                      }
                      
                      boolean trim = !editor.equals("textarea");
                      
                      String dataSource = itField.getDataSource();
                      int maxRows = itField.getMaxRows();
                      
                    
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(575,2);to=(577,0)]
                    out.write("\n   \n");

                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(577,49);to=(578,0)]
                    out.write("\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(578,0);to=(578,15)]
                    /* ----  jalios:select ---- */
                    com.jalios.jtaglib.SelectTag _jspx_th_jalios_select_0 = new com.jalios.jtaglib.SelectTag();
                    _jspx_th_jalios_select_0.setPageContext(pageContext);
                    _jspx_th_jalios_select_0.setParent(_jspx_th_jalios_foreach_8);
                    try {
                        int _jspx_eval_jalios_select_0 = _jspx_th_jalios_select_0.doStartTag();
                        if (_jspx_eval_jalios_select_0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                            try {
                              if (_jspx_eval_jalios_select_0 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_select_0.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_select_0.doInitBody();
                          }
                          do {
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(578,15);to=(581,5)]
                              out.write("\n\n  // ----------------------------------------------------------------------\n  // ");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(581,8);to=(581,14)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(581,16);to=(583,27)]
                              out.write("\n  // ----------------------------------------------------------------------  \n  protected TypeFieldEntry ");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(583,30);to=(583,36)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(583,38);to=(583,70)]
                              out.write("TFE = channel.getTypeFieldEntry(");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(583,73);to=(583,84)]
                              out.print( className );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(583,86);to=(583,95)]
                              out.write(".class, \"");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(583,98);to=(583,104)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(583,106);to=(584,0)]
                              out.write("\", true);\n");

                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(584,35);to=(585,0)]
                              out.write("\n");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(585,0);to=(585,52)]
                              /* ----  jalios:if ---- */
                              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_13 = new com.jalios.jtaglib.IfTag();
                              _jspx_th_jalios_if_13.setPageContext(pageContext);
                              _jspx_th_jalios_if_13.setParent(_jspx_th_jalios_select_0);
                              _jspx_th_jalios_if_13.setPredicate( type.equals("String") );
                              try {
                              int _jspx_eval_jalios_if_13 = _jspx_th_jalios_if_13.doStartTag();
                              if (_jspx_eval_jalios_if_13 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                              try {
                              if (_jspx_eval_jalios_if_13 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_if_13.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_if_13.doInitBody();
                          }
                          do {
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(585,52);to=(586,19)]
                              out.write("\n  protected String ");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(586,22);to=(586,28)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(586,30);to=(586,33)]
                              out.write(" = ");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(586,36);to=(586,50)]
                              out.print( defaultValue );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(586,52);to=(587,0)]
                              out.write(";\n");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(587,0);to=(587,38)]
                              /* ----  jalios:if ---- */
                              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_14 = new com.jalios.jtaglib.IfTag();
                              _jspx_th_jalios_if_14.setPageContext(pageContext);
                              _jspx_th_jalios_if_14.setParent(_jspx_th_jalios_if_13);
                              _jspx_th_jalios_if_14.setPredicate( fieldML );
                              try {
                              int _jspx_eval_jalios_if_14 = _jspx_th_jalios_if_14.doStartTag();
                              if (_jspx_eval_jalios_if_14 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                              try {
                              if (_jspx_eval_jalios_if_14 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_if_14.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_if_14.doInitBody();
                          }
                          do {
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(587,38);to=(588,35)]
                              out.write("\n  protected HashMap<String,String> ");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(588,38);to=(588,44)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(588,46);to=(588,51)]
                              out.write("ML = ");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(588,54);to=(588,60)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(588,62);to=(589,0)]
                              out.write("TFE.getDefaultTextMap();\n");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(589,0);to=(589,12)]
                          } while (_jspx_th_jalios_if_14.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
                      } finally {
                          if (_jspx_eval_jalios_if_14 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                              out = pageContext.popBody();
                      }
                  }
                  if (_jspx_th_jalios_if_14.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
                      return;
              } finally {
                  _jspx_th_jalios_if_14.release();
              }
          // end
          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(589,12);to=(590,0)]
              out.write("\n");

          // end
          // begin [file="/Edit_Type_Handler.jsp";from=(590,0);to=(590,56)]
              /* ----  jalios:if ---- */
              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_15 = new com.jalios.jtaglib.IfTag();
              _jspx_th_jalios_if_15.setPageContext(pageContext);
              _jspx_th_jalios_if_15.setParent(_jspx_th_jalios_if_13);
              _jspx_th_jalios_if_15.setPredicate( editor.equals("sqlquery") );
              try {
                  int _jspx_eval_jalios_if_15 = _jspx_th_jalios_if_15.doStartTag();
                  if (_jspx_eval_jalios_if_15 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                      try {
                          if (_jspx_eval_jalios_if_15 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_if_15.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_if_15.doInitBody();
                          }
                          do {
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(590,56);to=(591,19)]
                              out.write("\n  protected String ");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(591,22);to=(591,28)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(591,30);to=(591,40)]
                              out.write("DataSource");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(591,43);to=(591,103)]
                              out.print( Util.isEmpty(dataSource) ? "" : " = \"" + dataSource + "\"");
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(591,105);to=(592,16)]
                              out.write(";\n  protected int ");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(592,19);to=(592,25)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(592,27);to=(592,37)]
                              out.write("MaxRows = ");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(592,40);to=(592,49)]
                              out.print( maxRows );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(592,51);to=(593,22)]
                              out.write(";\n  protected boolean is");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(593,25);to=(593,34)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(593,36);to=(594,0)]
                              out.write("MaxRowsValidated = true;\n");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(594,0);to=(594,12)]
                          } while (_jspx_th_jalios_if_15.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
                      } finally {
                          if (_jspx_eval_jalios_if_15 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                              out = pageContext.popBody();
                      }
                  }
                  if (_jspx_th_jalios_if_15.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
                      return;
              } finally {
                  _jspx_th_jalios_if_15.release();
              }
          // end
          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(594,12);to=(595,0)]
              out.write("\n");

          // end
          // begin [file="/Edit_Type_Handler.jsp";from=(595,0);to=(595,12)]
          } while (_jspx_th_jalios_if_13.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
      } finally {
          if (_jspx_eval_jalios_if_13 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
              out = pageContext.popBody();
      }
  }
  if (_jspx_th_jalios_if_13.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
      return;
} finally {
    _jspx_th_jalios_if_13.release();
}
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(595,12);to=(597,0)]
    out.write("\n\n");

// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(597,51);to=(598,0)]
    out.write("\n");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(598,0);to=(598,85)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_16 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_16.setPageContext(pageContext);
    _jspx_th_jalios_if_16.setParent(_jspx_th_jalios_select_0);
    _jspx_th_jalios_if_16.setPredicate( type.equals("String[]") || type.equals("List<String>") );
    try {
        int _jspx_eval_jalios_if_16 = _jspx_th_jalios_if_16.doStartTag();
        if (_jspx_eval_jalios_if_16 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_if_16 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_if_16.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_if_16.doInitBody();
                }
                do {
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(598,85);to=(599,21)]
                    out.write("\n  protected String[] ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(599,24);to=(599,30)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(599,32);to=(600,16)]
                    out.write(" = new String[0];\n  protected int ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(600,19);to=(600,25)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(600,27);to=(601,0)]
                    out.write("AddCount = 0;\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(601,0);to=(601,38)]
                    /* ----  jalios:if ---- */
                    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_17 = new com.jalios.jtaglib.IfTag();
                    _jspx_th_jalios_if_17.setPageContext(pageContext);
                    _jspx_th_jalios_if_17.setParent(_jspx_th_jalios_if_16);
                    _jspx_th_jalios_if_17.setPredicate( fieldML );
                    try {
                        int _jspx_eval_jalios_if_17 = _jspx_th_jalios_if_17.doStartTag();
                        if (_jspx_eval_jalios_if_17 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                            try {
                              if (_jspx_eval_jalios_if_17 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_if_17.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_if_17.doInitBody();
                          }
                          do {
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(601,38);to=(602,27)]
                              out.write("\n  HashMap<String,String[]> ");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(602,30);to=(602,36)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(602,38);to=(603,0)]
                              out.write("ML;\n");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(603,0);to=(603,12)]
                          } while (_jspx_th_jalios_if_17.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
                      } finally {
                          if (_jspx_eval_jalios_if_17 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                              out = pageContext.popBody();
                      }
                  }
                  if (_jspx_th_jalios_if_17.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
                      return;
              } finally {
                  _jspx_th_jalios_if_17.release();
              }
          // end
          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(603,12);to=(604,0)]
              out.write("\n");

          // end
          // begin [file="/Edit_Type_Handler.jsp";from=(604,0);to=(604,56)]
              /* ----  jalios:if ---- */
              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_18 = new com.jalios.jtaglib.IfTag();
              _jspx_th_jalios_if_18.setPageContext(pageContext);
              _jspx_th_jalios_if_18.setParent(_jspx_th_jalios_if_16);
              _jspx_th_jalios_if_18.setPredicate( editor.equals("sqlquery") );
              try {
                  int _jspx_eval_jalios_if_18 = _jspx_th_jalios_if_18.doStartTag();
                  if (_jspx_eval_jalios_if_18 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                      try {
                          if (_jspx_eval_jalios_if_18 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_if_18.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_if_18.doInitBody();
                          }
                          do {
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(604,56);to=(605,21)]
                              out.write("\n  protected String[] ");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(605,24);to=(605,30)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(605,32);to=(606,18)]
                              out.write("DataSource;\n  protected int[] ");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(606,21);to=(606,27)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(606,29);to=(607,22)]
                              out.write("MaxRows;\n  protected boolean is");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(607,25);to=(607,34)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(607,36);to=(608,2)]
                              out.write("MaxRowsValidated = true;\n  ");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(608,2);to=(608,14)]
                          } while (_jspx_th_jalios_if_18.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
                      } finally {
                          if (_jspx_eval_jalios_if_18 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                              out = pageContext.popBody();
                      }
                  }
                  if (_jspx_th_jalios_if_18.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
                      return;
              } finally {
                  _jspx_th_jalios_if_18.release();
              }
          // end
          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(608,14);to=(609,0)]
              out.write("\n");

          // end
          // begin [file="/Edit_Type_Handler.jsp";from=(609,0);to=(609,12)]
          } while (_jspx_th_jalios_if_16.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
      } finally {
          if (_jspx_eval_jalios_if_16 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
              out = pageContext.popBody();
      }
  }
  if (_jspx_th_jalios_if_16.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
      return;
} finally {
    _jspx_th_jalios_if_16.release();
}
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(609,12);to=(611,0)]
    out.write("\n\n");

// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(611,42);to=(612,0)]
    out.write("\n");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(612,0);to=(612,50)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_19 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_19.setPageContext(pageContext);
    _jspx_th_jalios_if_19.setParent(_jspx_th_jalios_select_0);
    _jspx_th_jalios_if_19.setPredicate( itField.isAnyLink() );
    try {
        int _jspx_eval_jalios_if_19 = _jspx_th_jalios_if_19.doStartTag();
        if (_jspx_eval_jalios_if_19 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_if_19 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_if_19.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_if_19.doInitBody();
                }
                do {
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(612,50);to=(613,0)]
                    out.write("\n");

                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(613,34);to=(614,0)]
                    out.write("\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(614,2);to=(614,19)]
                     if (isScalar) { 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(614,21);to=(615,22)]
                    out.write("\n  protected boolean is");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(615,25);to=(615,34)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(615,36);to=(616,12)]
                    out.write("Validated = true;\n  protected ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(616,15);to=(616,21)]
                    out.print( type );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(616,23);to=(616,24)]
                    out.write(" ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(616,27);to=(616,33)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(616,35);to=(617,0)]
                    out.write(";\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(617,2);to=(617,20)]
                       if (fieldML) { 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(617,22);to=(618,27)]
                    out.write("\n  protected HashMap<String,");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(618,30);to=(618,36)]
                    out.print( type );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(618,38);to=(618,40)]
                    out.write("> ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(618,43);to=(618,49)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(618,51);to=(619,0)]
                    out.write("ML;\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(619,2);to=(619,7)]
                       } 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(619,9);to=(621,0)]
                    out.write("\n\n");

                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(621,35);to=(622,0)]
                    out.write("\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(622,2);to=(622,12)]
                     } else { 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(622,14);to=(623,12)]
                    out.write("\n  protected ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(623,15);to=(623,31)]
                    out.print( type_available );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(623,33);to=(623,34)]
                    out.write(" ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(623,37);to=(623,43)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(623,45);to=(623,52)]
                    out.write(" = new ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(623,55);to=(623,66)]
                    out.print( typeShort );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(623,68);to=(624,0)]
                    out.write("[0];\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(624,2);to=(624,20)]
                       if (fieldML) { 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(624,22);to=(625,27)]
                    out.write("\n  protected HashMap<String,");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(625,30);to=(625,46)]
                    out.print( type_available );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(625,48);to=(625,50)]
                    out.write("> ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(625,53);to=(625,59)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(625,61);to=(626,0)]
                    out.write("ML;\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(626,2);to=(626,7)]
                       } 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(626,9);to=(627,16)]
                    out.write("\n  protected int ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(627,19);to=(627,25)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(627,27);to=(628,0)]
                    out.write("AddCount = 0;\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(628,2);to=(628,5)]
                     } 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(628,7);to=(629,0)]
                    out.write("\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(629,0);to=(629,12)]
                } while (_jspx_th_jalios_if_19.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_if_19 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_if_19.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_if_19.release();
    }
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(629,12);to=(631,0)]
    out.write("\n\n");

// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(631,58);to=(632,0)]
    out.write("\n");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(632,0);to=(632,78)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_20 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_20.setPageContext(pageContext);
    _jspx_th_jalios_if_20.setParent(_jspx_th_jalios_select_0);
    _jspx_th_jalios_if_20.setPredicate( !isPublicationType && editor.equals("category") );
    try {
        int _jspx_eval_jalios_if_20 = _jspx_th_jalios_if_20.doStartTag();
        if (_jspx_eval_jalios_if_20 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_if_20 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_if_20.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_if_20.doInitBody();
                }
                do {
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(632,78);to=(633,23)]
                    out.write("\n  protected Category[] ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(633,26);to=(633,32)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(633,34);to=(634,16)]
                    out.write(";\n  protected int ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(634,19);to=(634,25)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(634,27);to=(635,0)]
                    out.write("AddCount = 0;  \n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(635,0);to=(635,12)]
                } while (_jspx_th_jalios_if_20.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_if_20 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_if_20.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_if_20.release();
    }
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(635,12);to=(637,0)]
    out.write("\n\n");

// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(637,33);to=(638,0)]
    out.write("\n");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(638,0);to=(638,52)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_21 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_21.setPageContext(pageContext);
    _jspx_th_jalios_if_21.setParent(_jspx_th_jalios_select_0);
    _jspx_th_jalios_if_21.setPredicate( editor.equals("date") );
    try {
        int _jspx_eval_jalios_if_21 = _jspx_th_jalios_if_21.doStartTag();
        if (_jspx_eval_jalios_if_21 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_if_21 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_if_21.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_if_21.doInitBody();
                }
                do {
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(638,52);to=(639,0)]
                    out.write("\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(639,2);to=(639,19)]
                     if (isScalar) { 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(639,21);to=(640,21)]
                    out.write("\n  protected String __");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(640,24);to=(640,30)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(640,32);to=(641,22)]
                    out.write("Str = \"\";\n  protected boolean is");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(641,25);to=(641,34)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(641,36);to=(642,17)]
                    out.write("Validated = true;\n  protected Date ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(642,20);to=(642,26)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(642,28);to=(644,0)]
                    out.write(";\n\n");

                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(644,35);to=(645,0)]
                    out.write("\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(645,2);to=(645,12)]
                     } else { 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(645,14);to=(646,23)]
                    out.write("\n  protected String[] __");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(646,26);to=(646,32)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(646,34);to=(647,22)]
                    out.write("StrArray = new String[0];\n  protected boolean is");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(647,25);to=(647,34)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(647,36);to=(648,19)]
                    out.write("Validated = true;\n  protected Date[] ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(648,22);to=(648,28)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(648,30);to=(649,16)]
                    out.write(" = new Date[0];\n  protected int ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(649,19);to=(649,25)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(649,27);to=(650,0)]
                    out.write("AddCount = 0;\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(650,2);to=(650,5)]
                     } 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(650,7);to=(651,0)]
                    out.write("\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(651,0);to=(651,12)]
                } while (_jspx_th_jalios_if_21.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_if_21 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_if_21.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_if_21.release();
    }
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(651,12);to=(653,0)]
    out.write("\n\n");

// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(653,69);to=(654,0)]
    out.write("\n");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(654,0);to=(654,160)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_22 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_22.setPageContext(pageContext);
    _jspx_th_jalios_if_22.setParent(_jspx_th_jalios_select_0);
    _jspx_th_jalios_if_22.setPredicate( editor.equals("boolean") || editor.equals("int") || editor.equals("long") || editor.equals("double") || editor.equals("duration") );
    try {
        int _jspx_eval_jalios_if_22 = _jspx_th_jalios_if_22.doStartTag();
        if (_jspx_eval_jalios_if_22 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_if_22 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_if_22.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_if_22.doInitBody();
                }
                do {
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(654,160);to=(655,0)]
                    out.write("\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(655,2);to=(655,19)]
                     if (isScalar) { 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(655,21);to=(656,0)]
                    out.write("\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(656,2);to=(656,38)]
                       if (!editor.equals("boolean")) { 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(656,40);to=(657,22)]
                    out.write("\n  protected boolean is");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(657,25);to=(657,34)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(657,36);to=(658,0)]
                    out.write("Validated = true;\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(658,2);to=(658,7)]
                       } 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(658,9);to=(659,12)]
                    out.write("\n  protected ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(659,15);to=(659,21)]
                    out.print( type );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(659,23);to=(659,24)]
                    out.write(" ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(659,27);to=(659,33)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(659,35);to=(659,38)]
                    out.write(" = ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(659,41);to=(659,55)]
                    out.print( defaultValue );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(659,57);to=(661,0)]
                    out.write(";\n\n");

                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(661,79);to=(662,0)]
                    out.write("\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(662,2);to=(662,12)]
                     } else { 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(662,14);to=(663,22)]
                    out.write("\n  protected boolean is");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(663,25);to=(663,34)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(663,36);to=(664,12)]
                    out.write("Validated = true;\n  protected ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(664,15);to=(664,26)]
                    out.print( typeShort );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(664,28);to=(664,31)]
                    out.write("[] ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(664,34);to=(664,40)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(664,42);to=(664,49)]
                    out.write(" = new ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(664,52);to=(664,63)]
                    out.print( typeShort );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(664,65);to=(665,16)]
                    out.write("[0];\n  protected int ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(665,19);to=(665,25)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(665,27);to=(666,0)]
                    out.write("AddCount = 0;\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(666,2);to=(666,5)]
                     } 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(666,7);to=(667,0)]
                    out.write("\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(667,0);to=(667,12)]
                } while (_jspx_th_jalios_if_22.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_if_22 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_if_22.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_if_22.release();
    }
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(667,12);to=(670,0)]
    out.write("\n\n\n");

// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(670,34);to=(671,0)]
    out.write("\n");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(671,0);to=(671,16)]
    /* ----  jalios:default ---- */
    com.jalios.jtaglib.ConditionalTag _jspx_th_jalios_default_0 = new com.jalios.jtaglib.ConditionalTag();
    _jspx_th_jalios_default_0.setPageContext(pageContext);
    _jspx_th_jalios_default_0.setParent(_jspx_th_jalios_select_0);
    try {
        int _jspx_eval_jalios_default_0 = _jspx_th_jalios_default_0.doStartTag();
        if (_jspx_eval_jalios_default_0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_default_0 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_default_0.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_default_0.doInitBody();
                }
                do {
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(671,16);to=(672,12)]
                    out.write("\n  protected ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(672,15);to=(672,31)]
                    out.print( type_available );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(672,33);to=(672,34)]
                    out.write(" ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(672,37);to=(672,43)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(672,45);to=(673,0)]
                    out.write(";\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(673,0);to=(673,38)]
                    /* ----  jalios:if ---- */
                    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_23 = new com.jalios.jtaglib.IfTag();
                    _jspx_th_jalios_if_23.setPageContext(pageContext);
                    _jspx_th_jalios_if_23.setParent(_jspx_th_jalios_default_0);
                    _jspx_th_jalios_if_23.setPredicate( fieldML );
                    try {
                        int _jspx_eval_jalios_if_23 = _jspx_th_jalios_if_23.doStartTag();
                        if (_jspx_eval_jalios_if_23 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                            try {
                              if (_jspx_eval_jalios_if_23 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_if_23.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_if_23.doInitBody();
                          }
                          do {
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(673,38);to=(674,17)]
                              out.write("\n  HashMap<String,");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(674,20);to=(674,36)]
                              out.print( type_available );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(674,38);to=(674,40)]
                              out.write("> ");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(674,43);to=(674,49)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(674,51);to=(675,0)]
                              out.write("ML;\n");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(675,0);to=(675,12)]
                          } while (_jspx_th_jalios_if_23.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
                      } finally {
                          if (_jspx_eval_jalios_if_23 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                              out = pageContext.popBody();
                      }
                  }
                  if (_jspx_th_jalios_if_23.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
                      return;
              } finally {
                  _jspx_th_jalios_if_23.release();
              }
          // end
          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(675,12);to=(676,0)]
              out.write("\n");

          // end
          // begin [file="/Edit_Type_Handler.jsp";from=(676,0);to=(676,17)]
          } while (_jspx_th_jalios_default_0.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
      } finally {
          if (_jspx_eval_jalios_default_0 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
              out = pageContext.popBody();
      }
  }
  if (_jspx_th_jalios_default_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
      return;
} finally {
    _jspx_th_jalios_default_0.release();
}
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(676,17);to=(677,0)]
    out.write("\n");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(677,0);to=(677,16)]
} while (_jspx_th_jalios_select_0.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
} finally {
    if (_jspx_eval_jalios_select_0 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
        out = pageContext.popBody();
}
}
if (_jspx_th_jalios_select_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
    return;
} finally {
    _jspx_th_jalios_select_0.release();
}
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(677,16);to=(679,0)]
    out.write("\n\n");

// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(679,80);to=(680,0)]
    out.write("\n");

// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(680,80);to=(681,0)]
    out.write("\n");

// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(681,80);to=(682,0)]
    out.write("\n");

// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(682,80);to=(684,0)]
    out.write("\n\n");

// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(684,36);to=(686,0)]
    out.write("\n\n");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(686,0);to=(686,15)]
    /* ----  jalios:select ---- */
    com.jalios.jtaglib.SelectTag _jspx_th_jalios_select_1 = new com.jalios.jtaglib.SelectTag();
    _jspx_th_jalios_select_1.setPageContext(pageContext);
    _jspx_th_jalios_select_1.setParent(_jspx_th_jalios_foreach_8);
    try {
        int _jspx_eval_jalios_select_1 = _jspx_th_jalios_select_1.doStartTag();
        if (_jspx_eval_jalios_select_1 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_select_1 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_select_1.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_select_1.doInitBody();
                }
                do {
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(686,15);to=(688,0)]
                    out.write("\n\n");

                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(688,66);to=(689,0)]
                    out.write("\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(689,0);to=(689,82)]
                    /* ----  jalios:if ---- */
                    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_24 = new com.jalios.jtaglib.IfTag();
                    _jspx_th_jalios_if_24.setPageContext(pageContext);
                    _jspx_th_jalios_if_24.setParent(_jspx_th_jalios_select_1);
                    _jspx_th_jalios_if_24.setPredicate( !isScalar && typeShort.equals("String") && !fieldML );
                    try {
                        int _jspx_eval_jalios_if_24 = _jspx_th_jalios_if_24.doStartTag();
                        if (_jspx_eval_jalios_if_24 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                            try {
                              if (_jspx_eval_jalios_if_24 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_if_24.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_if_24.doInitBody();
                          }
                          do {
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(689,82);to=(690,17)]
                              out.write("\n  public void set");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(690,20);to=(690,29)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(690,31);to=(691,4)]
                              out.write("(String[] v) {\n    ");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(691,7);to=(691,13)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(691,15);to=(691,43)]
                              out.write(" = getMonolingualValueArray(");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(691,46);to=(691,52)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(691,54);to=(694,0)]
                              out.write("TFE, v);\n  }\n  \n");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(694,0);to=(694,56)]
                              /* ----  jalios:if ---- */
                              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_25 = new com.jalios.jtaglib.IfTag();
                              _jspx_th_jalios_if_25.setPageContext(pageContext);
                              _jspx_th_jalios_if_25.setParent(_jspx_th_jalios_if_24);
                              _jspx_th_jalios_if_25.setPredicate( editor.equals("sqlquery") );
                              try {
                              int _jspx_eval_jalios_if_25 = _jspx_th_jalios_if_25.doStartTag();
                              if (_jspx_eval_jalios_if_25 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                              try {
                              if (_jspx_eval_jalios_if_25 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_if_25.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_if_25.doInitBody();
                          }
                          do {
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(694,56);to=(695,17)]
                              out.write("\n  public void set");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(695,20);to=(695,29)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(695,31);to=(696,9)]
                              out.write("DataSource(String[]  v)  {\n    this.");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(696,12);to=(696,18)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(696,20);to=(699,17)]
                              out.write("DataSource = v;\n  }\n  \n  public void set");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(699,20);to=(699,29)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(699,31);to=(702,6)]
                              out.write("MaxRows(String[]  v)  {\n    try {\n      v = Util.trimStringArray(v);\n      ");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(702,9);to=(702,15)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(702,17);to=(704,8)]
                              out.write("MaxRows = new int[v.length];\n      for(int i = 0; i < v.length; i++) {\n        ");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(704,11);to=(704,17)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(704,19);to=(707,8)]
                              out.write("MaxRows[i] = Integer.parseInt(v[i].trim());\n      }\n    } catch(NumberFormatException ex) {\n      is");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(707,11);to=(707,20)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(707,22);to=(712,0)]
                              out.write("MaxRowsValidated = false;\n    }\n  }\n\n  \n");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(712,0);to=(712,12)]
                          } while (_jspx_th_jalios_if_25.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
                      } finally {
                          if (_jspx_eval_jalios_if_25 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                              out = pageContext.popBody();
                      }
                  }
                  if (_jspx_th_jalios_if_25.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
                      return;
              } finally {
                  _jspx_th_jalios_if_25.release();
              }
          // end
          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(712,12);to=(713,0)]
              out.write("\n");

          // end
          // begin [file="/Edit_Type_Handler.jsp";from=(713,0);to=(713,12)]
          } while (_jspx_th_jalios_if_24.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
      } finally {
          if (_jspx_eval_jalios_if_24 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
              out = pageContext.popBody();
      }
  }
  if (_jspx_th_jalios_if_24.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
      return;
} finally {
    _jspx_th_jalios_if_24.release();
}
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(713,12);to=(716,0)]
    out.write("\n\n\n");

// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(716,66);to=(717,0)]
    out.write("\n");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(717,0);to=(717,99)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_26 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_26.setPageContext(pageContext);
    _jspx_th_jalios_if_26.setParent(_jspx_th_jalios_select_1);
    _jspx_th_jalios_if_26.setPredicate(  fieldML  && (type.equals("String[]") || type.equals("List<String>")));
    try {
        int _jspx_eval_jalios_if_26 = _jspx_th_jalios_if_26.doStartTag();
        if (_jspx_eval_jalios_if_26 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_if_26 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_if_26.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_if_26.doInitBody();
                }
                do {
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(717,99);to=(718,17)]
                    out.write("\n  public void set");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(718,20);to=(718,29)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(718,31);to=(719,3)]
                    out.write("(String[] v) {  \n   ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(719,6);to=(719,12)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(719,14);to=(719,47)]
                    out.write(" = getMultilingualMainValueArray(");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(719,50);to=(719,56)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(719,58);to=(720,3)]
                    out.write("TFE, v);\n   ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(720,6);to=(720,12)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(720,14);to=(720,45)]
                    out.write("ML = getMultilingualMLMapArray(");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(720,48);to=(720,54)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(720,56);to=(722,0)]
                    out.write("TFE, v);    \n  }\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(722,0);to=(722,12)]
                } while (_jspx_th_jalios_if_26.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_if_26 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_if_26.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_if_26.release();
    }
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(722,12);to=(725,0)]
    out.write("\n\n\n");

// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(725,33);to=(726,0)]
    out.write("\n");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(726,0);to=(726,50)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_27 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_27.setPageContext(pageContext);
    _jspx_th_jalios_if_27.setParent(_jspx_th_jalios_select_1);
    _jspx_th_jalios_if_27.setPredicate( itField.isAnyLink() );
    try {
        int _jspx_eval_jalios_if_27 = _jspx_th_jalios_if_27.doStartTag();
        if (_jspx_eval_jalios_if_27 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_if_27 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_if_27.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_if_27.doInitBody();
                }
                do {
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(726,50);to=(727,0)]
                    out.write("\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(727,2);to=(727,19)]
                     if (isScalar) { 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(727,21);to=(728,0)]
                    out.write("\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(728,2);to=(728,21)]
                       if (!fieldML) { 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(728,23);to=(729,11)]
                    out.write("\n  String __");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(729,14);to=(729,20)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(729,22);to=(730,17)]
                    out.write("Str = null;\n  public void set");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(730,20);to=(730,29)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(730,31);to=(731,6)]
                    out.write("(String v) {\n    __");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(731,9);to=(731,15)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(731,17);to=(733,0)]
                    out.write("Str = v;\n  }\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(733,2);to=(733,14)]
                       } else { 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(733,16);to=(734,13)]
                    out.write("\n  String[] __");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(734,16);to=(734,22)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(734,24);to=(735,17)]
                    out.write("Str = null;\n  public void set");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(735,20);to=(735,29)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(735,31);to=(736,6)]
                    out.write("(String[] v) {\n    __");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(736,9);to=(736,15)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(736,17);to=(738,0)]
                    out.write("Str = v;\n  }\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(738,2);to=(738,18)]
                       } // fieldML 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(738,20);to=(740,0)]
                    out.write("\n\n");

                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(740,35);to=(741,0)]
                    out.write("\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(741,2);to=(741,12)]
                     } else { 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(741,14);to=(743,13)]
                    out.write("\n\n  String[] __");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(743,16);to=(743,22)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(743,24);to=(744,17)]
                    out.write("Str = null;\n  public void set");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(744,20);to=(744,29)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(744,31);to=(745,6)]
                    out.write("(String[]  v) {\n    __");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(745,9);to=(745,15)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(745,17);to=(747,0)]
                    out.write("Str = v;\n  }\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(747,2);to=(747,5)]
                     } 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(747,7);to=(748,0)]
                    out.write("\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(748,0);to=(748,12)]
                } while (_jspx_th_jalios_if_27.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_if_27 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_if_27.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_if_27.release();
    }
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(748,12);to=(750,0)]
    out.write("\n\n");

// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(750,59);to=(751,0)]
    out.write("\n");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(751,0);to=(751,78)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_28 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_28.setPageContext(pageContext);
    _jspx_th_jalios_if_28.setParent(_jspx_th_jalios_select_1);
    _jspx_th_jalios_if_28.setPredicate( !isPublicationType && editor.equals("category") );
    try {
        int _jspx_eval_jalios_if_28 = _jspx_th_jalios_if_28.doStartTag();
        if (_jspx_eval_jalios_if_28 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_if_28 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_if_28.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_if_28.doInitBody();
                }
                do {
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(751,78);to=(752,17)]
                    out.write("\n  public void set");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(752,20);to=(752,29)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(752,31);to=(753,4)]
                    out.write("(String[]  v) {\n    ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(753,7);to=(753,13)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(753,15);to=(757,8)]
                    out.write(" = new Category[v.length ];\n    for(int i = 0; i < v.length  ; i++) {\n      Category _itCat = channel.getCategory(v[i].trim());\n      if (_itCat != null) {\n        ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(757,11);to=(757,17)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(757,19);to=(761,0)]
                    out.write("[i] = _itCat;\n      }\n    }\n  }\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(761,0);to=(761,12)]
                } while (_jspx_th_jalios_if_28.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_if_28 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_if_28.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_if_28.release();
    }
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(761,12);to=(763,0)]
    out.write("\n\n");

// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(763,33);to=(764,0)]
    out.write("\n");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(764,0);to=(764,52)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_29 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_29.setPageContext(pageContext);
    _jspx_th_jalios_if_29.setParent(_jspx_th_jalios_select_1);
    _jspx_th_jalios_if_29.setPredicate( editor.equals("date") );
    try {
        int _jspx_eval_jalios_if_29 = _jspx_th_jalios_if_29.doStartTag();
        if (_jspx_eval_jalios_if_29 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_if_29 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_if_29.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_if_29.doInitBody();
                }
                do {
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(764,52);to=(765,0)]
                    out.write("\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(765,2);to=(765,19)]
                     if (isScalar) { 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(765,21);to=(766,17)]
                    out.write("\n  public void set");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(766,20);to=(766,29)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(766,31);to=(768,56)]
                    out.write("(String v) {\n    try {\n        SimpleDateFormat dateFormatter = channel.getDate");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(768,59);to=(768,85)]
                    out.print( isDateOnly ? "" : "Time" );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(768,87);to=(771,8)]
                    out.write("Format(userLang);\n        dateFormatter =  (SimpleDateFormat) dateFormatter.clone();\n        dateFormatter.setLenient(false);      \n      __");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(771,11);to=(771,17)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(771,19);to=(772,6)]
                    out.write("Str = v.trim();      \n      ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(772,9);to=(772,15)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(772,17);to=(772,42)]
                    out.write(" = dateFormatter.parse(__");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(772,45);to=(772,51)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(772,53);to=(774,8)]
                    out.write("Str);\n    } catch(java.text.ParseException ex) {\n      is");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(774,11);to=(774,20)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(774,22);to=(778,0)]
                    out.write("Validated = false;\n    }\n  }\n\n");

                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(778,35);to=(779,0)]
                    out.write("\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(779,2);to=(779,12)]
                     } else { 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(779,14);to=(780,17)]
                    out.write("\n  public void set");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(780,20);to=(780,29)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(780,31);to=(781,53)]
                    out.write("(String[] v) {\n     SimpleDateFormat dateFormatter = channel.getDate");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(781,56);to=(781,82)]
                    out.print( isDateOnly ? "" : "Time" );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(781,84);to=(785,7)]
                    out.write("Format(userLang);\n     dateFormatter =  (SimpleDateFormat) dateFormatter.clone();\n     dateFormatter.setLenient(false);\n     v = Util.trimStringArray(v);\n     __");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(785,10);to=(785,16)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(785,18);to=(786,5)]
                    out.write("StrArray = v;\n     ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(786,8);to=(786,14)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(786,16);to=(790,8)]
                    out.write(" = new Date[v.length];\n     for(int i = 0; i < v.length; i++) {\n       if (Util.isEmpty(v[i])) { continue; }\n       try { \n       \t");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(790,11);to=(790,17)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(790,19);to=(792,9)]
                    out.write("[i] = dateFormatter.parse(v[i].trim());\n       } catch(java.text.ParseException ex) {\n     \t\tis");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(792,12);to=(792,21)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(792,23);to=(796,0)]
                    out.write("Validated = false;\n   \t   }\n     }\n  }\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(796,2);to=(796,5)]
                     } 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(796,7);to=(797,0)]
                    out.write("\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(797,0);to=(797,12)]
                } while (_jspx_th_jalios_if_29.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_if_29 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_if_29.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_if_29.release();
    }
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(797,12);to=(799,0)]
    out.write("\n\n");

// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(799,32);to=(800,0)]
    out.write("\n");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(800,0);to=(800,51)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_30 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_30.setPageContext(pageContext);
    _jspx_th_jalios_if_30.setParent(_jspx_th_jalios_select_1);
    _jspx_th_jalios_if_30.setPredicate( editor.equals("int") );
    try {
        int _jspx_eval_jalios_if_30 = _jspx_th_jalios_if_30.doStartTag();
        if (_jspx_eval_jalios_if_30 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_if_30 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_if_30.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_if_30.doInitBody();
                }
                do {
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(800,51);to=(801,0)]
                    out.write("\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(801,2);to=(801,19)]
                     if (isScalar) { 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(801,21);to=(802,17)]
                    out.write("\n  public void set");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(802,20);to=(802,29)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(802,31);to=(804,6)]
                    out.write("(String v) {\n    try {\n      ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(804,9);to=(804,15)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(804,17);to=(806,8)]
                    out.write(" = Integer.parseInt(v.trim());\n    } catch(NumberFormatException ex) {\n      is");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(806,11);to=(806,20)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(806,22);to=(809,0)]
                    out.write("Validated = false;\n    }\n  }\n");

                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(809,34);to=(810,0)]
                    out.write("\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(810,2);to=(810,12)]
                     } else { 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(810,14);to=(811,17)]
                    out.write("\n  public void set");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(811,20);to=(811,29)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(811,31);to=(814,6)]
                    out.write("(String[] v) {\n    try {\n      v = Util.trimStringArray(v);\n      ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(814,9);to=(814,15)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(814,17);to=(814,24)]
                    out.write(" = new ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(814,27);to=(814,38)]
                    out.print( typeShort );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(814,40);to=(817,8)]
                    out.write("[v.length];\n      for(int i = 0; i < v.length; i++) {\n        if (Util.isEmpty(v[i])) { continue; }\n        ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(817,11);to=(817,17)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(817,19);to=(820,8)]
                    out.write("[i] = Integer.parseInt(v[i].trim());\n      }\n    } catch(NumberFormatException ex) {\n      is");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(820,11);to=(820,20)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(820,22);to=(823,0)]
                    out.write("Validated = false;\n    }\n  }\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(823,2);to=(823,5)]
                     } 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(823,7);to=(824,0)]
                    out.write("\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(824,0);to=(824,12)]
                } while (_jspx_th_jalios_if_30.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_if_30 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_if_30.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_if_30.release();
    }
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(824,12);to=(827,0)]
    out.write("\n\n\n");

// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(827,33);to=(828,0)]
    out.write("\n");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(828,0);to=(828,81)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_31 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_31.setPageContext(pageContext);
    _jspx_th_jalios_if_31.setParent(_jspx_th_jalios_select_1);
    _jspx_th_jalios_if_31.setPredicate( editor.equals("long") || editor.equals("duration") );
    try {
        int _jspx_eval_jalios_if_31 = _jspx_th_jalios_if_31.doStartTag();
        if (_jspx_eval_jalios_if_31 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_if_31 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_if_31.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_if_31.doInitBody();
                }
                do {
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(828,81);to=(829,0)]
                    out.write("\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(829,2);to=(829,19)]
                     if (isScalar) { 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(829,21);to=(830,17)]
                    out.write("\n  public void set");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(830,20);to=(830,29)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(830,31);to=(832,6)]
                    out.write("(String v) {\n    try {\n      ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(832,9);to=(832,15)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(832,17);to=(834,8)]
                    out.write(" = Long.parseLong(v.trim());\n    } catch(NumberFormatException ex) {\n      is");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(834,11);to=(834,20)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(834,22);to=(837,0)]
                    out.write("Validated = false;\n    }\n  }\n");

                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(837,35);to=(838,0)]
                    out.write("\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(838,2);to=(838,12)]
                     } else { 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(838,14);to=(839,17)]
                    out.write("\n  public void set");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(839,20);to=(839,29)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(839,31);to=(842,6)]
                    out.write("(String[] v) {\n    try {\n      v = Util.trimStringArray(v);\n      ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(842,9);to=(842,15)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(842,17);to=(842,24)]
                    out.write(" = new ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(842,27);to=(842,38)]
                    out.print( typeShort );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(842,40);to=(845,8)]
                    out.write("[v.length];\n      for(int i = 0; i < v.length; i++) {\n        if (Util.isEmpty(v[i])) { continue; }\n        ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(845,11);to=(845,17)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(845,19);to=(848,8)]
                    out.write("[i] = Long.parseLong(v[i].trim());\n      }\n    } catch(NumberFormatException ex) {\n      is");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(848,11);to=(848,20)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(848,22);to=(851,0)]
                    out.write("Validated = false;\n    }\n  }\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(851,2);to=(851,5)]
                     } 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(851,7);to=(852,0)]
                    out.write("  \n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(852,0);to=(852,12)]
                } while (_jspx_th_jalios_if_31.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_if_31 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_if_31.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_if_31.release();
    }
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(852,12);to=(854,0)]
    out.write("\n\n");

// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(854,35);to=(855,0)]
    out.write("\n");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(855,0);to=(855,54)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_32 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_32.setPageContext(pageContext);
    _jspx_th_jalios_if_32.setParent(_jspx_th_jalios_select_1);
    _jspx_th_jalios_if_32.setPredicate( editor.equals("double") );
    try {
        int _jspx_eval_jalios_if_32 = _jspx_th_jalios_if_32.doStartTag();
        if (_jspx_eval_jalios_if_32 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_if_32 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_if_32.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_if_32.doInitBody();
                }
                do {
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(855,54);to=(856,0)]
                    out.write("\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(856,2);to=(856,19)]
                     if (isScalar) { 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(856,21);to=(857,17)]
                    out.write("\n  public void set");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(857,20);to=(857,29)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(857,31);to=(860,6)]
                    out.write("(String v) {\n    Double dbl = Util.parseDouble(v);\n    if (dbl != null) {\n      ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(860,9);to=(860,15)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(860,17);to=(862,8)]
                    out.write(" = dbl;\n    } else {\n      is");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(862,11);to=(862,20)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(862,22);to=(866,0)]
                    out.write("Validated = false;\n    }\n  }\n\n");

                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(866,37);to=(867,0)]
                    out.write("\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(867,2);to=(867,12)]
                     } else { 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(867,14);to=(868,17)]
                    out.write("\n  public void set");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(868,20);to=(868,29)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(868,31);to=(870,4)]
                    out.write("(String[] v) {\n    v = Util.trimStringArray(v);\n    ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(870,7);to=(870,13)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(870,15);to=(870,22)]
                    out.write(" = new ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(870,25);to=(870,36)]
                    out.print( typeShort );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(870,38);to=(875,8)]
                    out.write("[v.length];\n    for (int i = 0; i < v.length; i++) {\n      if (Util.isEmpty(v[i])) { continue; }\n      Double dbl = Util.parseDouble(v[i]);\n      if (dbl != null) {\n        ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(875,11);to=(875,17)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(875,19);to=(877,10)]
                    out.write("[i] = dbl;\n      } else {\n        is");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(877,13);to=(877,22)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(877,24);to=(881,0)]
                    out.write("Validated = false;\n      }\n    }\n  }\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(881,2);to=(881,5)]
                     } 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(881,7);to=(882,0)]
                    out.write("\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(882,0);to=(882,12)]
                } while (_jspx_th_jalios_if_32.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_if_32 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_if_32.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_if_32.release();
    }
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(882,12);to=(884,0)]
    out.write("\n\n");

// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(884,36);to=(885,0)]
    out.write("\n");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(885,0);to=(885,55)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_33 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_33.setPageContext(pageContext);
    _jspx_th_jalios_if_33.setParent(_jspx_th_jalios_select_1);
    _jspx_th_jalios_if_33.setPredicate( editor.equals("boolean") );
    try {
        int _jspx_eval_jalios_if_33 = _jspx_th_jalios_if_33.doStartTag();
        if (_jspx_eval_jalios_if_33 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_if_33 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_if_33.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_if_33.doInitBody();
                }
                do {
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(885,55);to=(886,0)]
                    out.write("\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(886,2);to=(886,19)]
                     if (isScalar) { 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(886,21);to=(887,17)]
                    out.write("\n  public void set");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(887,20);to=(887,29)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(887,31);to=(888,9)]
                    out.write("(boolean  v) {\n    this.");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(888,12);to=(888,18)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(888,20);to=(891,0)]
                    out.write(" = v;\n  }\n\n");

                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(891,38);to=(892,0)]
                    out.write("\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(892,2);to=(892,12)]
                     } else { 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(892,14);to=(893,17)]
                    out.write("\n  public void set");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(893,20);to=(893,29)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(893,31);to=(896,6)]
                    out.write("(String[] v) {\n    try {\n      v = Util.trimStringArray(v);\n      ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(896,9);to=(896,15)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(896,17);to=(896,24)]
                    out.write(" = new ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(896,27);to=(896,38)]
                    out.print( typeShort );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(896,40);to=(899,8)]
                    out.write("[v.length];\n      for(int i = 0; i < v.length; i++) {\n        if (Util.isEmpty(v[i])) { continue; }\n        ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(899,11);to=(899,17)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(899,19);to=(902,8)]
                    out.write("[i] = v[i].trim().equals(\"true\");\n      }\n    } catch(NumberFormatException ex) {\n      is");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(902,11);to=(902,20)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(902,22);to=(905,0)]
                    out.write("Validated = false;\n    }\n  }\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(905,2);to=(905,5)]
                     } 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(905,7);to=(906,0)]
                    out.write("  \n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(906,0);to=(906,12)]
                } while (_jspx_th_jalios_if_33.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_if_33 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_if_33.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_if_33.release();
    }
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(906,12);to=(908,0)]
    out.write("\n\n");

// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(908,35);to=(909,0)]
    out.write("\n");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(909,0);to=(909,52)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_34 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_34.setPageContext(pageContext);
    _jspx_th_jalios_if_34.setParent(_jspx_th_jalios_select_1);
    _jspx_th_jalios_if_34.setPredicate( type.equals("String") );
    try {
        int _jspx_eval_jalios_if_34 = _jspx_th_jalios_if_34.doStartTag();
        if (_jspx_eval_jalios_if_34 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_if_34 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_if_34.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_if_34.doInitBody();
                }
                do {
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(909,52);to=(910,17)]
                    out.write("\n  public void set");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(910,20);to=(910,29)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(910,31);to=(911,0)]
                    out.write("(String[] v) {\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(911,2);to=(911,18)]
                     if (fieldML) { 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(911,20);to=(912,4)]
                    out.write("\n    ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(912,7);to=(912,13)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(912,15);to=(912,43)]
                    out.write(" = getMultilingualMainValue(");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(912,46);to=(912,52)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(912,54);to=(913,4)]
                    out.write("TFE, v);\n    ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(913,7);to=(913,13)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(913,15);to=(913,41)]
                    out.write("ML = getMultilingualMLMap(");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(913,44);to=(913,50)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(913,52);to=(914,0)]
                    out.write("TFE, v);\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(914,2);to=(914,12)]
                     } else { 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(914,14);to=(915,4)]
                    out.write("\n    ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(915,7);to=(915,13)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(915,15);to=(915,38)]
                    out.write(" = getMonolingualValue(");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(915,41);to=(915,47)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(915,49);to=(916,0)]
                    out.write("TFE, v);\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(916,2);to=(916,5)]
                     } 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(916,7);to=(918,0)]
                    out.write("\n  }\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(918,0);to=(918,56)]
                    /* ----  jalios:if ---- */
                    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_35 = new com.jalios.jtaglib.IfTag();
                    _jspx_th_jalios_if_35.setPageContext(pageContext);
                    _jspx_th_jalios_if_35.setParent(_jspx_th_jalios_if_34);
                    _jspx_th_jalios_if_35.setPredicate( editor.equals("sqlquery") );
                    try {
                        int _jspx_eval_jalios_if_35 = _jspx_th_jalios_if_35.doStartTag();
                        if (_jspx_eval_jalios_if_35 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                            try {
                              if (_jspx_eval_jalios_if_35 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_if_35.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_if_35.doInitBody();
                          }
                          do {
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(918,56);to=(919,17)]
                              out.write("\n  public void set");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(919,20);to=(919,29)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(919,31);to=(923,9)]
                              out.write("DataSource(String  v)  {\n    if (Util.isEmpty(v)) {\n      return;\n    }\n    this.");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(923,12);to=(923,18)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(923,20);to=(926,17)]
                              out.write("DataSource = v;\n  }\n  \n  public void set");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(926,20);to=(926,29)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(926,31);to=(928,6)]
                              out.write("MaxRows(String  v)  {\n    try {\n      ");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(928,9);to=(928,15)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(928,17);to=(930,8)]
                              out.write("MaxRows = Integer.parseInt(v.trim());\n    } catch(NumberFormatException ex) {\n      is");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(930,11);to=(930,20)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(930,22);to=(934,0)]
                              out.write("MaxRowsValidated = false;\n    }\n  }\n  \n");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(934,0);to=(934,12)]
                          } while (_jspx_th_jalios_if_35.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
                      } finally {
                          if (_jspx_eval_jalios_if_35 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                              out = pageContext.popBody();
                      }
                  }
                  if (_jspx_th_jalios_if_35.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
                      return;
              } finally {
                  _jspx_th_jalios_if_35.release();
              }
          // end
          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(934,12);to=(935,0)]
              out.write("\n");

          // end
          // begin [file="/Edit_Type_Handler.jsp";from=(935,0);to=(935,12)]
          } while (_jspx_th_jalios_if_34.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
      } finally {
          if (_jspx_eval_jalios_if_34 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
              out = pageContext.popBody();
      }
  }
  if (_jspx_th_jalios_if_34.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
      return;
} finally {
    _jspx_th_jalios_if_34.release();
}
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(935,12);to=(937,0)]
    out.write("\n\n");

// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(937,34);to=(938,0)]
    out.write("\n");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(938,0);to=(938,16)]
    /* ----  jalios:default ---- */
    com.jalios.jtaglib.ConditionalTag _jspx_th_jalios_default_1 = new com.jalios.jtaglib.ConditionalTag();
    _jspx_th_jalios_default_1.setPageContext(pageContext);
    _jspx_th_jalios_default_1.setParent(_jspx_th_jalios_select_1);
    try {
        int _jspx_eval_jalios_default_1 = _jspx_th_jalios_default_1.doStartTag();
        if (_jspx_eval_jalios_default_1 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_default_1 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_default_1.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_default_1.doInitBody();
                }
                do {
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(938,16);to=(939,0)]
                    out.write("\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(939,2);to=(939,154)]
                     System.out.println("** WARNING ** Edit_Type_Handler: cannot generate setter for field '" + name + "' (type '" + type + "', editor '" + editor + "')"); 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(939,156);to=(940,0)]
                    out.write(" \n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(940,0);to=(940,17)]
                } while (_jspx_th_jalios_default_1.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_default_1 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_default_1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_default_1.release();
    }
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(940,17);to=(941,0)]
    out.write("\n");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(941,0);to=(941,16)]
} while (_jspx_th_jalios_select_1.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
} finally {
    if (_jspx_eval_jalios_select_1 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
        out = pageContext.popBody();
}
}
if (_jspx_th_jalios_select_1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
    return;
} finally {
    _jspx_th_jalios_select_1.release();
}
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(941,16);to=(944,0)]
    out.write("\n\n\n");

// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(944,49);to=(946,9)]
    out.write("\n\n  public ");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(946,12);to=(946,28)]
    out.print( type_available );
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(946,30);to=(946,43)]
    out.write(" getAvailable");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(946,46);to=(946,55)]
    out.print( nameCap );
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(946,57);to=(947,8)]
    out.write("() {\n    if (");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(947,11);to=(947,20)]
    out.print( theData );
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(947,22);to=(947,50)]
    out.write(" != null && isFieldMissing(\"");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(947,53);to=(947,59)]
    out.print( name );
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(947,61);to=(948,0)]
    out.write("\")) {\n");

// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(948,35);to=(949,0)]
    out.write("\n");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(949,2);to=(949,30)]
     if (itField.isTypeSet()) { 
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(949,32);to=(950,7)]
    out.write("\n\t  Set<");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(950,10);to=(950,21)]
    out.print( typeShort );
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(950,23);to=(950,39)]
    out.write("> objectValue = ");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(950,42);to=(950,51)]
    out.print( theData );
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(950,53);to=(950,57)]
    out.write(".get");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(950,60);to=(950,69)]
    out.print( nameCap );
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(950,71);to=(951,0)]
    out.write("();\n");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(951,2);to=(951,37)]
     }else if (itField.isTypeList()) { 
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(951,39);to=(952,8)]
    out.write("\n\t  List<");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(952,11);to=(952,22)]
    out.print( typeShort );
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(952,24);to=(952,40)]
    out.write("> objectValue = ");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(952,43);to=(952,52)]
    out.print( theData );
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(952,54);to=(952,58)]
    out.write(".get");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(952,61);to=(952,70)]
    out.print( nameCap );
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(952,72);to=(953,0)]
    out.write("();\n");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(953,2);to=(953,38)]
     }else if (itField.isTypeArray()) { 
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(953,40);to=(954,3)]
    out.write("\n\t  ");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(954,6);to=(954,17)]
    out.print( typeShort );
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(954,19);to=(954,36)]
    out.write("[] objectValue = ");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(954,39);to=(954,48)]
    out.print( theData );
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(954,50);to=(954,54)]
    out.write(".get");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(954,57);to=(954,66)]
    out.print( nameCap );
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(954,68);to=(955,0)]
    out.write("();\n");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(955,2);to=(955,12)]
     } else { 
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(955,14);to=(956,5)]
    out.write("\n     ");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(956,8);to=(956,24)]
    out.print( type_available );
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(956,26);to=(956,41)]
    out.write(" objectValue = ");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(956,44);to=(956,53)]
    out.print( theData );
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(956,55);to=(956,59)]
    out.write(".get");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(956,62);to=(956,71)]
    out.print( nameCap );
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(956,73);to=(957,0)]
    out.write("();\n");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(957,2);to=(957,5)]
     } 
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(957,7);to=(958,0)]
    out.write("\n");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(958,0);to=(958,60)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_36 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_36.setPageContext(pageContext);
    _jspx_th_jalios_if_36.setParent(_jspx_th_jalios_foreach_8);
    _jspx_th_jalios_if_36.setPredicate( type_available.endsWith("[]") );
    try {
        int _jspx_eval_jalios_if_36 = _jspx_th_jalios_if_36.doStartTag();
        if (_jspx_eval_jalios_if_36 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_if_36 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_if_36.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_if_36.doInitBody();
                }
                do {
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(958,60);to=(960,15)]
                    out.write("\n      if (objectValue == null) {\n        return ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(960,18);to=(960,24)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(960,26);to=(962,0)]
                    out.write(";\n      }\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(962,0);to=(962,12)]
                } while (_jspx_th_jalios_if_36.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_if_36 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_if_36.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_if_36.release();
    }
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(962,12);to=(963,0)]
    out.write("\n");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(963,2);to=(963,37)]
     if (itField.isTypeCollection()) { 
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(963,39);to=(964,37)]
    out.write("\n      return objectValue.toArray(new ");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(964,40);to=(964,51)]
    out.print( typeShort );
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(964,53);to=(965,0)]
    out.write("[objectValue.size()]);\n");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(965,2);to=(965,12)]
     } else { 
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(965,14);to=(967,0)]
    out.write("\n      return objectValue;\n");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(967,2);to=(967,5)]
     } 
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(967,7);to=(969,11)]
    out.write("\n    }\n    return ");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(969,14);to=(969,20)]
    out.print( name );
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(969,22);to=(971,0)]
    out.write(";\n  }\n");

// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(971,53);to=(972,0)]
    out.write("\n");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(972,0);to=(972,56)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_37 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_37.setPageContext(pageContext);
    _jspx_th_jalios_if_37.setParent(_jspx_th_jalios_foreach_8);
    _jspx_th_jalios_if_37.setPredicate( editor.equals("sqlquery") );
    try {
        int _jspx_eval_jalios_if_37 = _jspx_th_jalios_if_37.doStartTag();
        if (_jspx_eval_jalios_if_37 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_if_37 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_if_37.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_if_37.doInitBody();
                }
                do {
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(972,56);to=(973,15)]
                    out.write("\n  public String");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(973,18);to=(973,39)]
                    out.print( isArray ? "[]" : "" );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(973,41);to=(973,54)]
                    out.write(" getAvailable");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(973,57);to=(973,66)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(973,68);to=(974,8)]
                    out.write("DataSource() {\n    if (");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(974,11);to=(974,20)]
                    out.print( theData );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(974,22);to=(974,50)]
                    out.write(" != null && isFieldMissing(\"");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(974,53);to=(974,59)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(974,61);to=(975,12)]
                    out.write("DataSource\")) {\n      String");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(975,15);to=(975,36)]
                    out.print( isArray ? "[]" : "" );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(975,38);to=(975,53)]
                    out.write(" objectValue = ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(975,56);to=(975,65)]
                    out.print( theData );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(975,67);to=(975,71)]
                    out.write(".get");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(975,74);to=(975,83)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(975,85);to=(976,0)]
                    out.write("DataSource();\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(976,0);to=(976,38)]
                    /* ----  jalios:if ---- */
                    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_38 = new com.jalios.jtaglib.IfTag();
                    _jspx_th_jalios_if_38.setPageContext(pageContext);
                    _jspx_th_jalios_if_38.setParent(_jspx_th_jalios_if_37);
                    _jspx_th_jalios_if_38.setPredicate( isArray );
                    try {
                        int _jspx_eval_jalios_if_38 = _jspx_th_jalios_if_38.doStartTag();
                        if (_jspx_eval_jalios_if_38 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                            try {
                              if (_jspx_eval_jalios_if_38 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_if_38.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_if_38.doInitBody();
                          }
                          do {
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(976,38);to=(978,15)]
                              out.write("\n      if ( objectValue == null) {\n        return ");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(978,18);to=(978,24)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(978,26);to=(980,0)]
                              out.write("DataSource;\n      }\n");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(980,0);to=(980,12)]
                          } while (_jspx_th_jalios_if_38.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
                      } finally {
                          if (_jspx_eval_jalios_if_38 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                              out = pageContext.popBody();
                      }
                  }
                  if (_jspx_th_jalios_if_38.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
                      return;
              } finally {
                  _jspx_th_jalios_if_38.release();
              }
          // end
          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(980,12);to=(983,11)]
              out.write("\n      return objectValue;\n    }\n    return ");

          // end
          // begin [file="/Edit_Type_Handler.jsp";from=(983,14);to=(983,20)]
              out.print( name );
          // end
          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(983,22);to=(986,12)]
              out.write("DataSource;\n  }\n  \n  public int");

          // end
          // begin [file="/Edit_Type_Handler.jsp";from=(986,15);to=(986,36)]
              out.print( isArray ? "[]" : "" );
          // end
          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(986,38);to=(986,51)]
              out.write(" getAvailable");

          // end
          // begin [file="/Edit_Type_Handler.jsp";from=(986,54);to=(986,63)]
              out.print( nameCap );
          // end
          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(986,65);to=(987,8)]
              out.write("MaxRows() {\n    if (");

          // end
          // begin [file="/Edit_Type_Handler.jsp";from=(987,11);to=(987,20)]
              out.print( theData );
          // end
          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(987,22);to=(987,50)]
              out.write(" != null && isFieldMissing(\"");

          // end
          // begin [file="/Edit_Type_Handler.jsp";from=(987,53);to=(987,59)]
              out.print( name );
          // end
          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(987,61);to=(988,9)]
              out.write("MaxRows\")) {\n      int");

          // end
          // begin [file="/Edit_Type_Handler.jsp";from=(988,12);to=(988,33)]
              out.print( isArray ? "[]" : "" );
          // end
          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(988,35);to=(988,50)]
              out.write(" objectValue = ");

          // end
          // begin [file="/Edit_Type_Handler.jsp";from=(988,53);to=(988,62)]
              out.print( theData );
          // end
          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(988,64);to=(988,68)]
              out.write(".get");

          // end
          // begin [file="/Edit_Type_Handler.jsp";from=(988,71);to=(988,80)]
              out.print( nameCap );
          // end
          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(988,82);to=(989,0)]
              out.write("MaxRows();\n");

          // end
          // begin [file="/Edit_Type_Handler.jsp";from=(989,0);to=(989,38)]
              /* ----  jalios:if ---- */
              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_39 = new com.jalios.jtaglib.IfTag();
              _jspx_th_jalios_if_39.setPageContext(pageContext);
              _jspx_th_jalios_if_39.setParent(_jspx_th_jalios_if_37);
              _jspx_th_jalios_if_39.setPredicate( isArray );
              try {
                  int _jspx_eval_jalios_if_39 = _jspx_th_jalios_if_39.doStartTag();
                  if (_jspx_eval_jalios_if_39 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                      try {
                          if (_jspx_eval_jalios_if_39 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_if_39.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_if_39.doInitBody();
                          }
                          do {
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(989,38);to=(991,15)]
                              out.write("\n      if ( objectValue == null) {\n        return ");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(991,18);to=(991,24)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(991,26);to=(993,0)]
                              out.write("MaxRows;\n      }\n");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(993,0);to=(993,12)]
                          } while (_jspx_th_jalios_if_39.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
                      } finally {
                          if (_jspx_eval_jalios_if_39 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                              out = pageContext.popBody();
                      }
                  }
                  if (_jspx_th_jalios_if_39.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
                      return;
              } finally {
                  _jspx_th_jalios_if_39.release();
              }
          // end
          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(993,12);to=(996,11)]
              out.write("\n      return objectValue;\n    }\n    return ");

          // end
          // begin [file="/Edit_Type_Handler.jsp";from=(996,14);to=(996,20)]
              out.print( name );
          // end
          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(996,22);to=(998,0)]
              out.write("MaxRows;\n  }\n");

          // end
          // begin [file="/Edit_Type_Handler.jsp";from=(998,0);to=(998,12)]
          } while (_jspx_th_jalios_if_37.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
      } finally {
          if (_jspx_eval_jalios_if_37 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
              out = pageContext.popBody();
      }
  }
  if (_jspx_th_jalios_if_37.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
      return;
} finally {
    _jspx_th_jalios_if_37.release();
}
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(998,12);to=(1000,0)]
    out.write("  \n    \n");

// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(1000,46);to=(1001,0)]
    out.write("\n");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(1001,0);to=(1001,38)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_40 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_40.setPageContext(pageContext);
    _jspx_th_jalios_if_40.setParent(_jspx_th_jalios_foreach_8);
    _jspx_th_jalios_if_40.setPredicate( fieldML );
    try {
        int _jspx_eval_jalios_if_40 = _jspx_th_jalios_if_40.doStartTag();
        if (_jspx_eval_jalios_if_40 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_if_40 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_if_40.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_if_40.doInitBody();
                }
                do {
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1001,38);to=(1002,24)]
                    out.write("\n  public HashMap<String,");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1002,27);to=(1002,43)]
                    out.print( type_available );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1002,45);to=(1002,62)]
                    out.write("> getAllAvailable");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1002,65);to=(1002,74)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1002,76);to=(1003,19)]
                    out.write("ML() {\n    HashMap<String,");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1003,22);to=(1003,38)]
                    out.print( type_available );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1003,40);to=(1003,76)]
                    out.write("> map = Util.getHashMap(getAvailable");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1003,79);to=(1003,88)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1003,90);to=(1004,46)]
                    out.write("ML());\n    map.put(channel.getLanguage(),getAvailable");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1004,49);to=(1004,58)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1004,60);to=(1008,24)]
                    out.write("(channel.getLanguage()));\n    return map;\n  }\n  \n  public HashMap<String,");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1008,27);to=(1008,43)]
                    out.print( type_available );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1008,45);to=(1008,59)]
                    out.write("> getAvailable");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1008,62);to=(1008,71)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1008,73);to=(1009,8)]
                    out.write("ML() {\n    if (");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1009,11);to=(1009,20)]
                    out.print( theData );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1009,22);to=(1009,50)]
                    out.write(" != null && isFieldMissing(\"");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1009,53);to=(1009,59)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1009,61);to=(1010,0)]
                    out.write("\")) {\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1010,2);to=(1010,37)]
                     if (itField.isTypeCollection()) { 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1010,39);to=(1011,43)]
                    out.write("\n      return mapStringListToMapStringArray(");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1011,46);to=(1011,55)]
                    out.print( theData );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1011,57);to=(1011,61)]
                    out.write(".get");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1011,64);to=(1011,73)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1011,75);to=(1012,0)]
                    out.write("ML());\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1012,2);to=(1012,12)]
                     } else { 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1012,14);to=(1013,13)]
                    out.write("\n      return ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1013,16);to=(1013,25)]
                    out.print( theData );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1013,27);to=(1013,31)]
                    out.write(".get");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1013,34);to=(1013,43)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1013,45);to=(1014,0)]
                    out.write("ML();\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1014,2);to=(1014,5)]
                     } 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1014,7);to=(1016,11)]
                    out.write("\n    }\n    return ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1016,14);to=(1016,20)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1016,22);to=(1019,0)]
                    out.write("ML;\n  }\n\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1019,2);to=(1019,32)]
                     if (type.equals("String")) { 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1019,34);to=(1021,28)]
                    out.write("\n\n  public String getAvailable");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1021,31);to=(1021,40)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1021,42);to=(1022,8)]
                    out.write("(String lang) {\n    if (");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1022,11);to=(1022,20)]
                    out.print( theData );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1022,22);to=(1024,31)]
                    out.write(" != null) {\n      if (lang.equals(channel.getLanguage())) {\n      \tif (!Util.isSameContent(");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1024,34);to=(1024,40)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1024,42);to=(1024,44)]
                    out.write(", ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1024,47);to=(1024,61)]
                    out.print( defaultValue );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1024,63);to=(1025,17)]
                    out.write(")) {\n          return ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1025,20);to=(1025,26)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1025,28);to=(1028,11)]
                    out.write(";\n      \t}\n      } else {\n      \tif (");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1028,14);to=(1028,20)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1028,22);to=(1028,50)]
                    out.write("ML != null && Util.notEmpty(");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1028,53);to=(1028,59)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1028,61);to=(1029,16)]
                    out.write("ML.get(lang))) {\n      \t  return ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1029,19);to=(1029,25)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1029,27);to=(1032,28)]
                    out.write("ML.get(lang);\n      \t}\n      }\n      return Util.getString(");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1032,31);to=(1032,40)]
                    out.print( theData );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1032,42);to=(1032,46)]
                    out.write(".get");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1032,49);to=(1032,58)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1032,60);to=(1035,13)]
                    out.write("(lang, false), \"\");\n    }\n    if (lang.equals(channel.getLanguage())) {\n      return ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1035,16);to=(1035,22)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1035,24);to=(1037,11)]
                    out.write(";\n    }\n    return ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1037,14);to=(1037,20)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1037,22);to=(1037,55)]
                    out.write("ML == null ? \"\" : Util.getString(");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1037,58);to=(1037,64)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1037,66);to=(1039,0)]
                    out.write("ML.get(lang), \"\");\n  }\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1039,2);to=(1039,72)]
                     } else if (type.equals("String[]") || type.equals("List<String>")) { 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1039,74);to=(1041,9)]
                    out.write("\n\n  public ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1041,12);to=(1041,28)]
                    out.print( type_available );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1041,30);to=(1041,43)]
                    out.write(" getAvailable");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1041,46);to=(1041,55)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1041,57);to=(1042,8)]
                    out.write("(String lang) {\n    if (");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1042,11);to=(1042,20)]
                    out.print( theData );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1042,22);to=(1044,25)]
                    out.write(" != null) {\n      if (lang.equals(channel.getLanguage())) {\n      \tif (Util.notEmpty(");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1044,28);to=(1044,34)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1044,36);to=(1045,17)]
                    out.write(")) {\n          return ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1045,20);to=(1045,26)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1045,28);to=(1048,11)]
                    out.write(";\n      \t}\n      } else {\n      \tif (");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1048,14);to=(1048,20)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1048,22);to=(1048,50)]
                    out.write("ML != null && Util.notEmpty(");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1048,53);to=(1048,59)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1048,61);to=(1049,16)]
                    out.write("ML.get(lang))) {\n      \t  return ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1049,19);to=(1049,25)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1049,27);to=(1052,0)]
                    out.write("ML.get(lang);\n      \t}\n      }\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1052,2);to=(1052,38)]
                     if (type.equals("List<String>")) { 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1052,40);to=(1053,29)]
                    out.write("\n      List<String> strList = ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1053,32);to=(1053,41)]
                    out.print( theData );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1053,43);to=(1053,47)]
                    out.write(".get");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1053,50);to=(1053,59)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1053,61);to=(1055,0)]
                    out.write("(lang, false);\n      return (strList != null) ? strList.toArray(new String[strList.size()]) : new String[0];\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1055,2);to=(1055,12)]
                     } else { 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1055,14);to=(1056,13)]
                    out.write("\n      return ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1056,16);to=(1056,25)]
                    out.print( theData );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1056,27);to=(1056,31)]
                    out.write(".get");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1056,34);to=(1056,43)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1056,45);to=(1057,0)]
                    out.write("(lang, false);\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1057,2);to=(1057,5)]
                     } 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1057,7);to=(1060,13)]
                    out.write("\n    }\n    if (lang.equals(channel.getLanguage())) {\n      return ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1060,16);to=(1060,22)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1060,24);to=(1062,11)]
                    out.write(";\n    }\n    return ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1062,14);to=(1062,20)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1062,22);to=(1062,42)]
                    out.write("ML == null ? null : ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1062,45);to=(1062,51)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1062,53);to=(1064,0)]
                    out.write("ML.get(lang);\n  }\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1064,2);to=(1064,61)]
                     } else if (type.equals("com.jalios.jcms.FileDocument")) { 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1064,63);to=(1066,9)]
                    out.write("\n\n  public ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1066,12);to=(1066,18)]
                    out.print( type );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1066,20);to=(1066,33)]
                    out.write(" getAvailable");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1066,36);to=(1066,45)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1066,47);to=(1067,12)]
                    out.write("(String lang) {\n    return (");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1067,15);to=(1067,21)]
                    out.print( type );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1067,23);to=(1067,41)]
                    out.write(")getAvailableData(");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1067,44);to=(1067,53)]
                    out.print( theData );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1067,55);to=(1067,57)]
                    out.write(", ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1067,60);to=(1067,69)]
                    out.print( theData );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1067,71);to=(1067,89)]
                    out.write(" == null ? null : ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1067,92);to=(1067,101)]
                    out.print( theData );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1067,103);to=(1067,107)]
                    out.write(".get");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1067,110);to=(1067,119)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1067,121);to=(1067,125)]
                    out.write("(), ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1067,128);to=(1067,134)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1067,136);to=(1067,138)]
                    out.write(", ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1067,141);to=(1067,147)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1067,149);to=(1069,0)]
                    out.write("ML, lang);\n  }\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1069,2);to=(1069,63)]
                     } else if (type.equals("com.jalios.jcms.FileDocument[]")) { 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1069,65);to=(1071,9)]
                    out.write("\n\n  public ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1071,12);to=(1071,18)]
                    out.print( type );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1071,20);to=(1071,33)]
                    out.write(" getAvailable");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1071,36);to=(1071,45)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1071,47);to=(1072,12)]
                    out.write("(String lang) {\n    return (");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1072,15);to=(1072,21)]
                    out.print( type );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1072,23);to=(1072,46)]
                    out.write(")getAvailableDataArray(");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1072,49);to=(1072,58)]
                    out.print( theData );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1072,60);to=(1072,62)]
                    out.write(", ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1072,65);to=(1072,74)]
                    out.print( theData );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1072,76);to=(1072,94)]
                    out.write(" == null ? null : ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1072,97);to=(1072,106)]
                    out.print( theData );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1072,108);to=(1072,112)]
                    out.write(".get");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1072,115);to=(1072,124)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1072,126);to=(1072,130)]
                    out.write("(), ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1072,133);to=(1072,139)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1072,141);to=(1072,143)]
                    out.write(", ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1072,146);to=(1072,152)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1072,154);to=(1074,0)]
                    out.write("ML, lang);\n  }\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1074,2);to=(1074,5)]
                     } 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1074,7);to=(1075,0)]
                    out.write("\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1075,0);to=(1075,12)]
                } while (_jspx_th_jalios_if_40.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_if_40 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_if_40.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_if_40.release();
    }
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(1075,12);to=(1077,0)]
    out.write("\n  \n");

// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(1077,19);to=(1078,0)]
    out.write("\n");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(1078,0);to=(1078,38)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_41 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_41.setPageContext(pageContext);
    _jspx_th_jalios_if_41.setParent(_jspx_th_jalios_foreach_8);
    _jspx_th_jalios_if_41.setPredicate( isArray );
    try {
        int _jspx_eval_jalios_if_41 = _jspx_th_jalios_if_41.doStartTag();
        if (_jspx_eval_jalios_if_41 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_if_41 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_if_41.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_if_41.doInitBody();
                }
                do {
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1078,38);to=(1079,0)]
                    out.write("\n");

                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1079,49);to=(1080,17)]
                    out.write("\n  public void set");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1080,20);to=(1080,29)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1080,31);to=(1081,4)]
                    out.write("AddCount(int  v) {\n    ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1081,7);to=(1081,13)]
                    out.print( name );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1081,15);to=(1084,0)]
                    out.write("AddCount = v;\n  }\n  \n");

                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1084,45);to=(1085,16)]
                    out.write("\n  public int get");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1085,19);to=(1085,28)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1085,30);to=(1086,45)]
                    out.write("Count() {\n    int arraySize = Util.getSize(getAvailable");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1086,48);to=(1086,57)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1086,59);to=(1087,0)]
                    out.write("());\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1087,0);to=(1087,65)]
                    /* ----  jalios:if ---- */
                    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_42 = new com.jalios.jtaglib.IfTag();
                    _jspx_th_jalios_if_42.setPageContext(pageContext);
                    _jspx_th_jalios_if_42.setParent(_jspx_th_jalios_if_41);
                    _jspx_th_jalios_if_42.setPredicate( type.equals("String[]") && fieldML );
                    try {
                        int _jspx_eval_jalios_if_42 = _jspx_th_jalios_if_42.doStartTag();
                        if (_jspx_eval_jalios_if_42 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                            try {
                              if (_jspx_eval_jalios_if_42 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_if_42.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_if_42.doInitBody();
                          }
                          do {
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1087,65);to=(1090,37)]
                              out.write("\n    if (channel.isMultilingual()) {\n      for (String lang : channel.getOtherLanguageList()) {\n        String[] array = getAvailable");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(1090,40);to=(1090,49)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1090,51);to=(1096,0)]
                              out.write("(lang);\n        if (array != null && array.length > arraySize) {\n          arraySize = array.length;\n        }\n      }\n    }\n");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(1096,0);to=(1096,12)]
                          } while (_jspx_th_jalios_if_42.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
                      } finally {
                          if (_jspx_eval_jalios_if_42 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                              out = pageContext.popBody();
                      }
                  }
                  if (_jspx_th_jalios_if_42.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
                      return;
              } finally {
                  _jspx_th_jalios_if_42.release();
              }
          // end
          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1096,12);to=(1097,30)]
              out.write("\n    int res = 3 + arraySize + ");

          // end
          // begin [file="/Edit_Type_Handler.jsp";from=(1097,33);to=(1097,39)]
              out.print( name );
          // end
          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1097,41);to=(1100,0)]
              out.write("AddCount;\n    return res;\n  }\n");

          // end
          // begin [file="/Edit_Type_Handler.jsp";from=(1100,0);to=(1100,12)]
          } while (_jspx_th_jalios_if_41.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
      } finally {
          if (_jspx_eval_jalios_if_41 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
              out = pageContext.popBody();
      }
  }
  if (_jspx_th_jalios_if_41.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
      return;
} finally {
    _jspx_th_jalios_if_41.release();
}
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(1100,12);to=(1102,0)]
    out.write("\n\n");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(1102,0);to=(1102,17)]
} while (_jspx_th_jalios_foreach_8.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
} finally {
    if (_jspx_eval_jalios_foreach_8 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
        out = pageContext.popBody();
}
}
if (_jspx_th_jalios_foreach_8.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
    return;
} finally {
    _jspx_th_jalios_foreach_8.release();
}
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(1102,17);to=(1104,0)]
    out.write("\n\n");

// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(1104,48);to=(1105,0)]
    out.write("\n");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(1105,2);to=(1105,32)]
     if(!tabGroupMap.isEmpty()) { 
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(1105,34);to=(1108,4)]
    out.write("\n  public int getTabGroupMaxCount(String tabGroupName) {\n    String tabGroup = Util.buildID(tabGroupName, \"0-9a-zA-Z\");\n    ");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(1108,4);to=(1108,95)]
    /* ----  jalios:foreach ---- */
    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_9 = new com.jalios.jtaglib.ForeachTag();
    _jspx_th_jalios_foreach_9.setPageContext(pageContext);
    _jspx_th_jalios_foreach_9.setParent(null);
    _jspx_th_jalios_foreach_9.setCollection( tabGroupMap.entrySet() );
    _jspx_th_jalios_foreach_9.setName("itEntry");
    _jspx_th_jalios_foreach_9.setType("Map.Entry");
    try {
        int _jspx_eval_jalios_foreach_9 = _jspx_th_jalios_foreach_9.doStartTag();
        if (_jspx_eval_jalios_foreach_9 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_foreach_9 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_foreach_9.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_foreach_9.doInitBody();
                }
                do {
                    Integer itCounter = null;
                    itCounter = (Integer) pageContext.findAttribute("itCounter");
                    Map.Entry itEntry = null;
                    itEntry = (Map.Entry) pageContext.findAttribute("itEntry");
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1108,95);to=(1109,6)]
                    out.write("\n      ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1109,8);to=(1109,54)]
                     String tabGroup = (String) itEntry.getKey(); 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1109,56);to=(1110,10)]
                    out.write("\n      if(\"");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1110,13);to=(1110,37)]
                    out.print( tabGroup.toLowerCase() );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1110,39);to=(1111,27)]
                    out.write("\".equalsIgnoreCase(tabGroup)) {\n        return getAvailable");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1111,30);to=(1111,40)]
                    out.print( tabGroup );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1111,42);to=(1113,4)]
                    out.write("Count();\n      }\n    ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1113,4);to=(1113,21)]
                } while (_jspx_th_jalios_foreach_9.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_foreach_9 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_foreach_9.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_foreach_9.release();
    }
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(1113,21);to=(1117,2)]
    out.write("\n    return super.getTabGroupMaxCount(tabGroupName);    \n  }\n\n  ");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(1117,2);to=(1117,93)]
    /* ----  jalios:foreach ---- */
    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_10 = new com.jalios.jtaglib.ForeachTag();
    _jspx_th_jalios_foreach_10.setPageContext(pageContext);
    _jspx_th_jalios_foreach_10.setParent(null);
    _jspx_th_jalios_foreach_10.setCollection( tabGroupMap.entrySet() );
    _jspx_th_jalios_foreach_10.setName("itEntry");
    _jspx_th_jalios_foreach_10.setType("Map.Entry");
    try {
        int _jspx_eval_jalios_foreach_10 = _jspx_th_jalios_foreach_10.doStartTag();
        if (_jspx_eval_jalios_foreach_10 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_foreach_10 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_foreach_10.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_foreach_10.doInitBody();
                }
                do {
                    Integer itCounter = null;
                    itCounter = (Integer) pageContext.findAttribute("itCounter");
                    Map.Entry itEntry = null;
                    itEntry = (Map.Entry) pageContext.findAttribute("itEntry");
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1117,93);to=(1118,2)]
                    out.write("\n  ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1118,4);to=(1121,2)]
                    
                      String tabGroup = (String) itEntry.getKey();
                      List nameCapList = (List) itEntry.getValue();
                      
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1121,4);to=(1122,25)]
                    out.write("\n  public int getAvailable");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1122,28);to=(1122,38)]
                    out.print( tabGroup );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1122,40);to=(1124,2)]
                    out.write("Count() {\n    int max = 0;\n  ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1124,4);to=(1124,68)]
                     for (Iterator it = nameCapList.iterator() ; it.hasNext() ; ) { 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1124,70);to=(1125,4)]
                    out.write("\n    ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1125,6);to=(1125,44)]
                     String nameCap = (String) it.next(); 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1125,46);to=(1126,4)]
                    out.write("\n    ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1126,6);to=(1126,62)]
                     if (Util.toBoolean(nameCapMLMap.get(nameCap),false)) { 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1126,64);to=(1128,45)]
                    out.write("\n      for (String lang : channel.getLanguageList()) {\n        int count = Util.getSize(getAvailable");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1128,48);to=(1128,57)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1128,59);to=(1131,4)]
                    out.write("(lang));\n        max = count > max ? count : max;\n      }\n    ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1131,6);to=(1131,16)]
                     } else { 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1131,18);to=(1133,45)]
                    out.write("\n      {\n        int count = Util.getSize(getAvailable");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1133,48);to=(1133,57)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1133,59);to=(1136,4)]
                    out.write("());\n        max = count > max ? count : max;\n      }\n    ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1136,6);to=(1136,9)]
                     } 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1136,11);to=(1137,2)]
                    out.write("\n  ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1137,4);to=(1137,18)]
                     } // end for 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1137,20);to=(1140,2)]
                    out.write("\n    return max;\n  }\n  ");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1140,2);to=(1140,19)]
                } while (_jspx_th_jalios_foreach_10.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_foreach_10 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_foreach_10.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_foreach_10.release();
    }
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(1140,19);to=(1141,0)]
    out.write("\n");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(1141,2);to=(1141,5)]
     } 
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(1141,7);to=(1143,0)]
    out.write("\n\n");

// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(1143,69);to=(1144,0)]
    out.write("\n");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(1144,0);to=(1144,49)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_43 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_43.setPageContext(pageContext);
    _jspx_th_jalios_if_43.setParent(null);
    _jspx_th_jalios_if_43.setPredicate( !isPublicationType );
    try {
        int _jspx_eval_jalios_if_43 = _jspx_th_jalios_if_43.doStartTag();
        if (_jspx_eval_jalios_if_43 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_if_43 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_if_43.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_if_43.doInitBody();
                }
                do {
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1144,49);to=(1145,0)]
                    out.write("\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1145,2);to=(1155,0)]
                    
                    for(Iterator it = fieldList.iterator(); it.hasNext();) {
                      TypeFieldEntry itField = (TypeFieldEntry)it.next();
                      String editor = itField.getEditor();
                      if (!editor.equals("category")) {
                        continue;
                      }
                      String name    = itField.getName();
                      String nameCap = itField.getNameCap();
                      String root    = itField.getRoot();
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1155,2);to=(1156,21)]
                    out.write("\n  public Category get");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1156,24);to=(1156,33)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1156,35);to=(1157,32)]
                    out.write("Root() {\n    return channel.getCategory(\"");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1157,35);to=(1157,41)]
                    out.print( root );
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1157,43);to=(1159,0)]
                    out.write("\");\n  }  \n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1159,2);to=(1159,5)]
                     } 
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1159,31);to=(1160,0)]
                    out.write("\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1160,0);to=(1160,12)]
                } while (_jspx_th_jalios_if_43.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_if_43 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_if_43.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_if_43.release();
    }
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(1160,40);to=(1163,0)]
    out.write("\n\n\n");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(1163,0);to=(1163,48)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_44 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_44.setPageContext(pageContext);
    _jspx_th_jalios_if_44.setParent(null);
    _jspx_th_jalios_if_44.setPredicate( isPublicationType );
    try {
        int _jspx_eval_jalios_if_44 = _jspx_th_jalios_if_44.doStartTag();
        if (_jspx_eval_jalios_if_44 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_if_44 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_if_44.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_if_44.doInitBody();
                }
                do {
                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1163,48);to=(1165,0)]
                    out.write("\n\n");

                // end
                // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1165,63);to=(1166,0)]
                    out.write("\n");

                // end
                // begin [file="/Edit_Type_Handler.jsp";from=(1166,0);to=(1166,91)]
                    /* ----  jalios:foreach ---- */
                    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_11 = new com.jalios.jtaglib.ForeachTag();
                    _jspx_th_jalios_foreach_11.setPageContext(pageContext);
                    _jspx_th_jalios_foreach_11.setParent(_jspx_th_jalios_if_44);
                    _jspx_th_jalios_foreach_11.setCollection( categoryFieldList );
                    _jspx_th_jalios_foreach_11.setName("itField");
                    _jspx_th_jalios_foreach_11.setType("TypeFieldEntry");
                    try {
                        int _jspx_eval_jalios_foreach_11 = _jspx_th_jalios_foreach_11.doStartTag();
                        if (_jspx_eval_jalios_foreach_11 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                            try {
                              if (_jspx_eval_jalios_foreach_11 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_foreach_11.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_foreach_11.doInitBody();
                          }
                          do {
                              Integer itCounter = null;
                              itCounter = (Integer) pageContext.findAttribute("itCounter");
                              TypeFieldEntry itField = null;
                              itField = (TypeFieldEntry) pageContext.findAttribute("itField");
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1166,91);to=(1167,0)]
                              out.write("\n");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(1167,2);to=(1174,0)]
                              
                                String name            = itField.getName();
                                String nameCap         = itField.getNameCap();
                                boolean isExclusive    = itField.isExclusive();
                                String root            = itField.getRoot();
                                String chooser         = itField.getChooser();
                                boolean isTreeChooser  = chooser.equals("tree");
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1174,2);to=(1175,2)]
                              out.write("\n  ");

                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1175,126);to=(1176,17)]
                              out.write("\n  public void set");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(1176,20);to=(1176,29)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1176,31);to=(1180,21)]
                              out.write("(String[] v) {\n    updateCids(v);\n  }\n\n  public Category get");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(1180,24);to=(1180,33)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1180,35);to=(1181,32)]
                              out.write("Root() {\n    return channel.getCategory(\"");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(1181,35);to=(1181,41)]
                              out.print( root );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1181,43);to=(1184,26)]
                              out.write("\");\n  }  \n    \n  public Set<Category> get");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(1184,29);to=(1184,38)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1184,40);to=(1185,26)]
                              out.write("CatSet() {\n    Category rootCat = get");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(1185,29);to=(1185,38)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1185,40);to=(1194,0)]
                              out.write("Root();\n    if (rootCat == null) {\n      return Util.emptyTreeSet();\n    }\n    Set<Category> set = new HashSet<>(rootCat.getDescendantSet());\n    set.add(rootCat);\n    return Util.interSet(getCategorySet(null), set);\n  }\n  \n");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(1194,0);to=(1194,17)]
                          } while (_jspx_th_jalios_foreach_11.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
                      } finally {
                          if (_jspx_eval_jalios_foreach_11 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                              out = pageContext.popBody();
                      }
                  }
                  if (_jspx_th_jalios_foreach_11.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
                      return;
              } finally {
                  _jspx_th_jalios_foreach_11.release();
              }
          // end
          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1194,17);to=(1196,0)]
              out.write("\n\n");

          // end
          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1196,52);to=(1197,0)]
              out.write("\n");

          // end
          // begin [file="/Edit_Type_Handler.jsp";from=(1197,0);to=(1197,44)]
              /* ----  jalios:if ---- */
              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_45 = new com.jalios.jtaglib.IfTag();
              _jspx_th_jalios_if_45.setPageContext(pageContext);
              _jspx_th_jalios_if_45.setParent(_jspx_th_jalios_if_44);
              _jspx_th_jalios_if_45.setPredicate( formOneSubmit );
              try {
                  int _jspx_eval_jalios_if_45 = _jspx_th_jalios_if_45.doStartTag();
                  if (_jspx_eval_jalios_if_45 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                      try {
                          if (_jspx_eval_jalios_if_45 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_if_45.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_if_45.doInitBody();
                          }
                          do {
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1197,44);to=(1202,0)]
                              out.write("    \n   \n  public boolean isOneSubmit() {\n    return true;\n  }\n");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(1202,0);to=(1202,12)]
                          } while (_jspx_th_jalios_if_45.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
                      } finally {
                          if (_jspx_eval_jalios_if_45 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                              out = pageContext.popBody();
                      }
                  }
                  if (_jspx_th_jalios_if_45.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
                      return;
              } finally {
                  _jspx_th_jalios_if_45.release();
              }
          // end
          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1202,12);to=(1204,0)]
              out.write("\n \n");

          // end
          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1204,55);to=(1205,0)]
              out.write("\n");

          // end
          // begin [file="/Edit_Type_Handler.jsp";from=(1205,0);to=(1205,41)]
              /* ----  jalios:if ---- */
              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_46 = new com.jalios.jtaglib.IfTag();
              _jspx_th_jalios_if_46.setPageContext(pageContext);
              _jspx_th_jalios_if_46.setParent(_jspx_th_jalios_if_44);
              _jspx_th_jalios_if_46.setPredicate( formNotify );
              try {
                  int _jspx_eval_jalios_if_46 = _jspx_th_jalios_if_46.doStartTag();
                  if (_jspx_eval_jalios_if_46 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                      try {
                          if (_jspx_eval_jalios_if_46 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_if_46.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_if_46.doInitBody();
                          }
                          do {
                          // end
                          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1205,41);to=(1210,0)]
                              out.write("    \n   \n  public boolean isNotifySubmit() {\n    return true;\n  }\n");

                          // end
                          // begin [file="/Edit_Type_Handler.jsp";from=(1210,0);to=(1210,12)]
                          } while (_jspx_th_jalios_if_46.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
                      } finally {
                          if (_jspx_eval_jalios_if_46 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                              out = pageContext.popBody();
                      }
                  }
                  if (_jspx_th_jalios_if_46.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
                      return;
              } finally {
                  _jspx_th_jalios_if_46.release();
              }
          // end
          // HTML // begin [file="/Edit_Type_Handler.jsp";from=(1210,12);to=(1212,0)]
              out.write("\n   \n");

          // end
          // begin [file="/Edit_Type_Handler.jsp";from=(1212,0);to=(1212,12)]
          } while (_jspx_th_jalios_if_44.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
      } finally {
          if (_jspx_eval_jalios_if_44 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
              out = pageContext.popBody();
      }
  }
  if (_jspx_th_jalios_if_44.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
      return;
} finally {
    _jspx_th_jalios_if_44.release();
}
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(1212,12);to=(1212,13)]
    out.write(" ");

// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(1212,40);to=(1214,0)]
    out.write("\n}\n");

// end
// begin [file="/Edit_Type_Handler.jsp";from=(1214,2);to=(1214,16)]
     out.flush(); 
// end
// HTML // begin [file="/Edit_Type_Handler.jsp";from=(1214,18);to=(1215,0)]
    out.write("\n");

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
