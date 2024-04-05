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


public class FileIndexListener$jsp extends HttpJspBase {


    static {
    }
    public FileIndexListener$jsp( ) {
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

            // HTML // begin [file="/FileIndexListener.jsp";from=(0,50);to=(1,0)]
                out.write("\n");

            // end
            // HTML // begin [file="/FileIndexListener.jsp";from=(1,118);to=(2,0)]
                out.write("\n");

            // end
            // HTML // begin [file="/FileIndexListener.jsp";from=(2,44);to=(3,0)]
                out.write("\n");

            // end
            // begin [file="/FileIndexListener.jsp";from=(3,2);to=(30,0)]
                
                  request.setCharacterEncoding("UTF-8");
                  
                List typeList = (List)session.getAttribute("typeList");
                List extendedTypes = (List)session.getAttribute("extendedTypeList");
                
                // Extract Type that have at least one file field
                List fileTypeList = new ArrayList();
                for(Iterator it1 = typeList.iterator(); it1.hasNext();) {
                  Element itType = (Element)it1.next();
                
                  // Skip DBData
                  if (Util.toBoolean(itType.getAttributeValue("database"),false)) {
                    continue;
                  }
                  
                  List fieldList = new ArrayList();
                  TypeUtil.buildInheritedFieldList(itType, fieldList, true, extendedTypes);
                  for(Iterator it2 = fieldList.iterator(); it2.hasNext();) {
                    Element itField = (Element)it2.next();
                    String editor = itField.getAttributeValue("editor");
                    if (editor != null && (editor.equals("image") || editor.equals("media"))) {
                      fileTypeList.add(itType);
                      break;
                    }
                  }
                }
            // end
            // HTML // begin [file="/FileIndexListener.jsp";from=(30,2);to=(57,0)]
                out.write("\n// This file was automatically generated. Please, do not edit.\npackage generated;\n  \nimport java.util.Map;\nimport java.util.HashMap;\nimport java.util.TreeSet;\n  \nimport com.jalios.jcms.AbstractFileIndexListener;\nimport com.jalios.jcms.Data;\nimport com.jalios.jcms.FileDocument;\nimport com.jalios.jstore.Storable;\nimport com.jalios.util.Util;\n  \n@SuppressWarnings({\"unused\"})\npublic class FileIndexListener extends AbstractFileIndexListener {\n  \n  public FileIndexListener(HashMap<String,TreeSet<Data>> index) {\n    super(index);\n  }\n  \n  public void handleCreate(Storable storable, boolean firstTime) {\n    if (storable instanceof FileDocument) {\n      FileDocument obj = (FileDocument)storable;\n      add(obj.getFilename(), obj);\n    }\n    \n");

            // end
            // begin [file="/FileIndexListener.jsp";from=(57,0);to=(57,87)]
                /* ----  jalios:foreach ---- */
                com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_0 = new com.jalios.jtaglib.ForeachTag();
                _jspx_th_jalios_foreach_0.setPageContext(pageContext);
                _jspx_th_jalios_foreach_0.setParent(null);
                _jspx_th_jalios_foreach_0.setCollection( fileTypeList );
                _jspx_th_jalios_foreach_0.setName("itType");
                _jspx_th_jalios_foreach_0.setType("org.jdom.Element");
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
                              org.jdom.Element itType = null;
                              itType = (org.jdom.Element) pageContext.findAttribute("itType");
                          // end
                          // HTML // begin [file="/FileIndexListener.jsp";from=(57,87);to=(58,0)]
                              out.write("\n");

                          // end
                          // begin [file="/FileIndexListener.jsp";from=(58,2);to=(62,0)]
                               
                              String typeName = itType.getAttributeValue("name"); 
                              List fieldList = new ArrayList();
                              TypeUtil.buildInheritedFieldList(itType, fieldList, true, extendedTypes);
                          // end
                          // HTML // begin [file="/FileIndexListener.jsp";from=(62,2);to=(64,28)]
                              out.write("\n    \n    if (storable instanceof ");

                          // end
                          // begin [file="/FileIndexListener.jsp";from=(64,31);to=(64,41)]
                              out.print( typeName );
                          // end
                          // HTML // begin [file="/FileIndexListener.jsp";from=(64,43);to=(65,6)]
                              out.write(") {\n      ");

                          // end
                          // begin [file="/FileIndexListener.jsp";from=(65,9);to=(65,19)]
                              out.print( typeName );
                          // end
                          // HTML // begin [file="/FileIndexListener.jsp";from=(65,21);to=(65,29)]
                              out.write(" obj = (");

                          // end
                          // begin [file="/FileIndexListener.jsp";from=(65,32);to=(65,42)]
                              out.print( typeName );
                          // end
                          // HTML // begin [file="/FileIndexListener.jsp";from=(65,44);to=(68,0)]
                              out.write(")storable;\n      String[] array = null;\n      \n");

                          // end
                          // begin [file="/FileIndexListener.jsp";from=(68,0);to=(68,106)]
                              /* ----  jalios:foreach ---- */
                              com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_1 = new com.jalios.jtaglib.ForeachTag();
                              _jspx_th_jalios_foreach_1.setPageContext(pageContext);
                              _jspx_th_jalios_foreach_1.setParent(_jspx_th_jalios_foreach_0);
                              _jspx_th_jalios_foreach_1.setCollection( fieldList );
                              _jspx_th_jalios_foreach_1.setName("itField");
                              _jspx_th_jalios_foreach_1.setType("org.jdom.Element");
                              _jspx_th_jalios_foreach_1.setCounter("itCounter2");
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
                              Integer itCounter2 = null;
                              itCounter2 = (Integer) pageContext.findAttribute("itCounter2");
                              org.jdom.Element itField = null;
                              itField = (org.jdom.Element) pageContext.findAttribute("itField");
                          // end
                          // HTML // begin [file="/FileIndexListener.jsp";from=(68,106);to=(69,0)]
                              out.write("\n");

                          // end
                          // begin [file="/FileIndexListener.jsp";from=(69,2);to=(74,0)]
                              
                                String fieldType = itField.getAttributeValue("type");
                                String fieldName = itField.getAttributeValue("name");
                                String fieldNameCap = Util.recapitalize(fieldName);
                                String fieldEditor = itField.getAttributeValue("editor");
                          // end
                          // HTML // begin [file="/FileIndexListener.jsp";from=(74,2);to=(76,0)]
                              out.write("\n\n");

                          // end
                          // begin [file="/FileIndexListener.jsp";from=(76,0);to=(76,121)]
                              /* ----  jalios:if ---- */
                              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_0 = new com.jalios.jtaglib.IfTag();
                              _jspx_th_jalios_if_0.setPageContext(pageContext);
                              _jspx_th_jalios_if_0.setParent(_jspx_th_jalios_foreach_1);
                              _jspx_th_jalios_if_0.setPredicate( fieldType.equals("String") && (fieldEditor.equals("image") || fieldEditor.equals("media")) );
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
                          // HTML // begin [file="/FileIndexListener.jsp";from=(76,121);to=(78,17)]
                              out.write("\n      // file/image/media\n      add(obj.get");

                          // end
                          // begin [file="/FileIndexListener.jsp";from=(78,20);to=(78,34)]
                              out.print( fieldNameCap );
                          // end
                          // HTML // begin [file="/FileIndexListener.jsp";from=(78,36);to=(79,0)]
                              out.write("(), obj);\n");

                          // end
                          // begin [file="/FileIndexListener.jsp";from=(79,0);to=(79,12)]
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
          // HTML // begin [file="/FileIndexListener.jsp";from=(79,12);to=(81,0)]
              out.write("\n\n");

          // end
          // begin [file="/FileIndexListener.jsp";from=(81,0);to=(81,123)]
              /* ----  jalios:if ---- */
              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_1 = new com.jalios.jtaglib.IfTag();
              _jspx_th_jalios_if_1.setPageContext(pageContext);
              _jspx_th_jalios_if_1.setParent(_jspx_th_jalios_foreach_1);
              _jspx_th_jalios_if_1.setPredicate( fieldType.equals("String[]") && (fieldEditor.equals("image") || fieldEditor.equals("media")) );
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
                          // HTML // begin [file="/FileIndexListener.jsp";from=(81,123);to=(83,21)]
                              out.write("\n      // file[]/image[]/media[]\n      array = obj.get");

                          // end
                          // begin [file="/FileIndexListener.jsp";from=(83,24);to=(83,38)]
                              out.print( fieldNameCap );
                          // end
                          // HTML // begin [file="/FileIndexListener.jsp";from=(83,40);to=(89,0)]
                              out.write("();\n      if (array != null) {\n\tfor (int i = 0; i < array.length; i++) {\n\t  add(array[i], obj);\n\t}\n      }\n");

                          // end
                          // begin [file="/FileIndexListener.jsp";from=(89,0);to=(89,12)]
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
          // HTML // begin [file="/FileIndexListener.jsp";from=(89,12);to=(91,0)]
              out.write("\n\n");

          // end
          // begin [file="/FileIndexListener.jsp";from=(91,0);to=(91,17)]
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
// HTML // begin [file="/FileIndexListener.jsp";from=(91,17);to=(93,0)]
    out.write("\n    }\n");

// end
// begin [file="/FileIndexListener.jsp";from=(93,0);to=(93,17)]
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
// HTML // begin [file="/FileIndexListener.jsp";from=(93,17);to=(107,0)]
    out.write("\n  }\n  \n  public void handleCommitUpdate(Storable storable, Storable oldStorable, boolean firstTime) {\n    if (storable instanceof FileDocument) {\n      FileDocument obj = (FileDocument)storable;\n      FileDocument oldObj = (FileDocument)oldStorable;\n      \n      if (!Util.isSameContent(obj.getFilename(), oldObj.getFilename())) {\n\tremove(obj, oldObj.getFilename());\n\tadd(obj.getFilename(), obj);\n      }\n    }\n    \n");

// end
// begin [file="/FileIndexListener.jsp";from=(107,0);to=(107,87)]
    /* ----  jalios:foreach ---- */
    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_2 = new com.jalios.jtaglib.ForeachTag();
    _jspx_th_jalios_foreach_2.setPageContext(pageContext);
    _jspx_th_jalios_foreach_2.setParent(null);
    _jspx_th_jalios_foreach_2.setCollection( fileTypeList );
    _jspx_th_jalios_foreach_2.setName("itType");
    _jspx_th_jalios_foreach_2.setType("org.jdom.Element");
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
                    org.jdom.Element itType = null;
                    itType = (org.jdom.Element) pageContext.findAttribute("itType");
                // end
                // HTML // begin [file="/FileIndexListener.jsp";from=(107,87);to=(108,0)]
                    out.write("\n");

                // end
                // begin [file="/FileIndexListener.jsp";from=(108,2);to=(112,0)]
                     
                    String typeName = itType.getAttributeValue("name"); 
                    List fieldList = new ArrayList();
                    TypeUtil.buildInheritedFieldList(itType, fieldList, true, extendedTypes);
                // end
                // HTML // begin [file="/FileIndexListener.jsp";from=(112,2);to=(114,28)]
                    out.write("\n    \n    if (storable instanceof ");

                // end
                // begin [file="/FileIndexListener.jsp";from=(114,31);to=(114,41)]
                    out.print( typeName );
                // end
                // HTML // begin [file="/FileIndexListener.jsp";from=(114,43);to=(115,6)]
                    out.write(") {\n      ");

                // end
                // begin [file="/FileIndexListener.jsp";from=(115,9);to=(115,19)]
                    out.print( typeName );
                // end
                // HTML // begin [file="/FileIndexListener.jsp";from=(115,21);to=(115,29)]
                    out.write(" obj = (");

                // end
                // begin [file="/FileIndexListener.jsp";from=(115,32);to=(115,42)]
                    out.print( typeName );
                // end
                // HTML // begin [file="/FileIndexListener.jsp";from=(115,44);to=(116,6)]
                    out.write(")storable;\n      ");

                // end
                // begin [file="/FileIndexListener.jsp";from=(116,9);to=(116,19)]
                    out.print( typeName );
                // end
                // HTML // begin [file="/FileIndexListener.jsp";from=(116,21);to=(116,32)]
                    out.write(" oldObj = (");

                // end
                // begin [file="/FileIndexListener.jsp";from=(116,35);to=(116,45)]
                    out.print( typeName );
                // end
                // HTML // begin [file="/FileIndexListener.jsp";from=(116,47);to=(119,0)]
                    out.write(")oldStorable;\n      String[] array = null;\n      \n");

                // end
                // begin [file="/FileIndexListener.jsp";from=(119,0);to=(119,106)]
                    /* ----  jalios:foreach ---- */
                    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_3 = new com.jalios.jtaglib.ForeachTag();
                    _jspx_th_jalios_foreach_3.setPageContext(pageContext);
                    _jspx_th_jalios_foreach_3.setParent(_jspx_th_jalios_foreach_2);
                    _jspx_th_jalios_foreach_3.setCollection( fieldList );
                    _jspx_th_jalios_foreach_3.setName("itField");
                    _jspx_th_jalios_foreach_3.setType("org.jdom.Element");
                    _jspx_th_jalios_foreach_3.setCounter("itCounter2");
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
                              Integer itCounter2 = null;
                              itCounter2 = (Integer) pageContext.findAttribute("itCounter2");
                              org.jdom.Element itField = null;
                              itField = (org.jdom.Element) pageContext.findAttribute("itField");
                          // end
                          // HTML // begin [file="/FileIndexListener.jsp";from=(119,106);to=(120,0)]
                              out.write("\n");

                          // end
                          // begin [file="/FileIndexListener.jsp";from=(120,2);to=(125,0)]
                              
                                String fieldType = itField.getAttributeValue("type");
                                String fieldName = itField.getAttributeValue("name");
                                String fieldNameCap = Util.recapitalize(fieldName);
                                String fieldEditor = itField.getAttributeValue("editor");
                          // end
                          // HTML // begin [file="/FileIndexListener.jsp";from=(125,2);to=(127,0)]
                              out.write("\n\n");

                          // end
                          // begin [file="/FileIndexListener.jsp";from=(127,0);to=(127,121)]
                              /* ----  jalios:if ---- */
                              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_2 = new com.jalios.jtaglib.IfTag();
                              _jspx_th_jalios_if_2.setPageContext(pageContext);
                              _jspx_th_jalios_if_2.setParent(_jspx_th_jalios_foreach_3);
                              _jspx_th_jalios_if_2.setPredicate( fieldType.equals("String") && (fieldEditor.equals("image") || fieldEditor.equals("media")) );
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
                          // HTML // begin [file="/FileIndexListener.jsp";from=(127,121);to=(129,37)]
                              out.write("\n      // file/image/media\n      if (!Util.isSameContent(obj.get");

                          // end
                          // begin [file="/FileIndexListener.jsp";from=(129,40);to=(129,54)]
                              out.print( fieldNameCap );
                          // end
                          // HTML // begin [file="/FileIndexListener.jsp";from=(129,56);to=(129,70)]
                              out.write("(), oldObj.get");

                          // end
                          // begin [file="/FileIndexListener.jsp";from=(129,73);to=(129,87)]
                              out.print( fieldNameCap );
                          // end
                          // HTML // begin [file="/FileIndexListener.jsp";from=(129,89);to=(130,23)]
                              out.write("())) {\n\tremove(obj, oldObj.get");

                          // end
                          // begin [file="/FileIndexListener.jsp";from=(130,26);to=(130,40)]
                              out.print( fieldNameCap );
                          // end
                          // HTML // begin [file="/FileIndexListener.jsp";from=(130,42);to=(131,12)]
                              out.write("());\n\tadd(obj.get");

                          // end
                          // begin [file="/FileIndexListener.jsp";from=(131,15);to=(131,29)]
                              out.print( fieldNameCap );
                          // end
                          // HTML // begin [file="/FileIndexListener.jsp";from=(131,31);to=(133,0)]
                              out.write("(), obj);\n      }\n");

                          // end
                          // begin [file="/FileIndexListener.jsp";from=(133,0);to=(133,12)]
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
          // HTML // begin [file="/FileIndexListener.jsp";from=(133,12);to=(135,0)]
              out.write("\n\n");

          // end
          // begin [file="/FileIndexListener.jsp";from=(135,0);to=(135,123)]
              /* ----  jalios:if ---- */
              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_3 = new com.jalios.jtaglib.IfTag();
              _jspx_th_jalios_if_3.setPageContext(pageContext);
              _jspx_th_jalios_if_3.setParent(_jspx_th_jalios_foreach_3);
              _jspx_th_jalios_if_3.setPredicate( fieldType.equals("String[]") && (fieldEditor.equals("image") || fieldEditor.equals("media")) );
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
                          // HTML // begin [file="/FileIndexListener.jsp";from=(135,123);to=(137,24)]
                              out.write("\n      // file[]/image[]/media[]\n      array = oldObj.get");

                          // end
                          // begin [file="/FileIndexListener.jsp";from=(137,27);to=(137,41)]
                              out.print( fieldNameCap );
                          // end
                          // HTML // begin [file="/FileIndexListener.jsp";from=(137,43);to=(143,21)]
                              out.write("();\n      if (array != null) {\n\tfor (int i = 0; i < array.length; i++) {\n\t  remove(obj, array[i]);\n\t}\n      }\n      array = obj.get");

                          // end
                          // begin [file="/FileIndexListener.jsp";from=(143,24);to=(143,38)]
                              out.print( fieldNameCap );
                          // end
                          // HTML // begin [file="/FileIndexListener.jsp";from=(143,40);to=(149,0)]
                              out.write("();\n      if (array != null) {\n\tfor (int i = 0; i < array.length; i++) {\n\t  add(array[i], obj);\n\t}\n      }\n");

                          // end
                          // begin [file="/FileIndexListener.jsp";from=(149,0);to=(149,12)]
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
          // HTML // begin [file="/FileIndexListener.jsp";from=(149,12);to=(151,0)]
              out.write("\n\n");

          // end
          // begin [file="/FileIndexListener.jsp";from=(151,0);to=(151,17)]
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
// HTML // begin [file="/FileIndexListener.jsp";from=(151,17);to=(153,0)]
    out.write("\n    }\n");

// end
// begin [file="/FileIndexListener.jsp";from=(153,0);to=(153,17)]
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
// HTML // begin [file="/FileIndexListener.jsp";from=(153,17);to=(163,0)]
    out.write("\n  }\n  \n  public void handleDelete(Storable storable, boolean firstTime) {\n    if (storable instanceof FileDocument) {\n      FileDocument obj = (FileDocument)storable;\n    \n      remove(obj, obj.getFilename());\n    }    \n    \n");

// end
// begin [file="/FileIndexListener.jsp";from=(163,0);to=(163,87)]
    /* ----  jalios:foreach ---- */
    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_4 = new com.jalios.jtaglib.ForeachTag();
    _jspx_th_jalios_foreach_4.setPageContext(pageContext);
    _jspx_th_jalios_foreach_4.setParent(null);
    _jspx_th_jalios_foreach_4.setCollection( fileTypeList );
    _jspx_th_jalios_foreach_4.setName("itType");
    _jspx_th_jalios_foreach_4.setType("org.jdom.Element");
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
                    org.jdom.Element itType = null;
                    itType = (org.jdom.Element) pageContext.findAttribute("itType");
                // end
                // HTML // begin [file="/FileIndexListener.jsp";from=(163,87);to=(164,0)]
                    out.write("\n");

                // end
                // begin [file="/FileIndexListener.jsp";from=(164,2);to=(168,0)]
                     
                    String typeName = itType.getAttributeValue("name"); 
                    List fieldList = new ArrayList();
                    TypeUtil.buildInheritedFieldList(itType, fieldList, true, extendedTypes);
                // end
                // HTML // begin [file="/FileIndexListener.jsp";from=(168,2);to=(170,28)]
                    out.write("\n    \n    if (storable instanceof ");

                // end
                // begin [file="/FileIndexListener.jsp";from=(170,31);to=(170,41)]
                    out.print( typeName );
                // end
                // HTML // begin [file="/FileIndexListener.jsp";from=(170,43);to=(171,6)]
                    out.write(") {\n      ");

                // end
                // begin [file="/FileIndexListener.jsp";from=(171,9);to=(171,19)]
                    out.print( typeName );
                // end
                // HTML // begin [file="/FileIndexListener.jsp";from=(171,21);to=(171,29)]
                    out.write(" obj = (");

                // end
                // begin [file="/FileIndexListener.jsp";from=(171,32);to=(171,42)]
                    out.print( typeName );
                // end
                // HTML // begin [file="/FileIndexListener.jsp";from=(171,44);to=(174,0)]
                    out.write(")storable;\n      String[] array = null;\n    \n");

                // end
                // begin [file="/FileIndexListener.jsp";from=(174,0);to=(174,106)]
                    /* ----  jalios:foreach ---- */
                    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_5 = new com.jalios.jtaglib.ForeachTag();
                    _jspx_th_jalios_foreach_5.setPageContext(pageContext);
                    _jspx_th_jalios_foreach_5.setParent(_jspx_th_jalios_foreach_4);
                    _jspx_th_jalios_foreach_5.setCollection( fieldList );
                    _jspx_th_jalios_foreach_5.setName("itField");
                    _jspx_th_jalios_foreach_5.setType("org.jdom.Element");
                    _jspx_th_jalios_foreach_5.setCounter("itCounter2");
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
                              Integer itCounter2 = null;
                              itCounter2 = (Integer) pageContext.findAttribute("itCounter2");
                              org.jdom.Element itField = null;
                              itField = (org.jdom.Element) pageContext.findAttribute("itField");
                          // end
                          // HTML // begin [file="/FileIndexListener.jsp";from=(174,106);to=(175,0)]
                              out.write("\n");

                          // end
                          // begin [file="/FileIndexListener.jsp";from=(175,2);to=(180,0)]
                              
                                String fieldType = itField.getAttributeValue("type");
                                String fieldName = itField.getAttributeValue("name");
                                String fieldNameCap = Util.recapitalize(fieldName);
                                String fieldEditor = itField.getAttributeValue("editor");
                          // end
                          // HTML // begin [file="/FileIndexListener.jsp";from=(180,2);to=(182,0)]
                              out.write("\n\n");

                          // end
                          // begin [file="/FileIndexListener.jsp";from=(182,0);to=(182,121)]
                              /* ----  jalios:if ---- */
                              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_4 = new com.jalios.jtaglib.IfTag();
                              _jspx_th_jalios_if_4.setPageContext(pageContext);
                              _jspx_th_jalios_if_4.setParent(_jspx_th_jalios_foreach_5);
                              _jspx_th_jalios_if_4.setPredicate( fieldType.equals("String") && (fieldEditor.equals("image") || fieldEditor.equals("media")) );
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
                          // HTML // begin [file="/FileIndexListener.jsp";from=(182,121);to=(184,25)]
                              out.write("\n      // file/image/media\n      remove(obj, obj.get");

                          // end
                          // begin [file="/FileIndexListener.jsp";from=(184,28);to=(184,42)]
                              out.print( fieldNameCap );
                          // end
                          // HTML // begin [file="/FileIndexListener.jsp";from=(184,44);to=(185,0)]
                              out.write("());\n");

                          // end
                          // begin [file="/FileIndexListener.jsp";from=(185,0);to=(185,12)]
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
          // HTML // begin [file="/FileIndexListener.jsp";from=(185,12);to=(187,0)]
              out.write("\n\n");

          // end
          // begin [file="/FileIndexListener.jsp";from=(187,0);to=(187,123)]
              /* ----  jalios:if ---- */
              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_5 = new com.jalios.jtaglib.IfTag();
              _jspx_th_jalios_if_5.setPageContext(pageContext);
              _jspx_th_jalios_if_5.setParent(_jspx_th_jalios_foreach_5);
              _jspx_th_jalios_if_5.setPredicate( fieldType.equals("String[]") && (fieldEditor.equals("image") || fieldEditor.equals("media")) );
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
                          // HTML // begin [file="/FileIndexListener.jsp";from=(187,123);to=(189,21)]
                              out.write("\n      // file[]/image[]/media[]\n      array = obj.get");

                          // end
                          // begin [file="/FileIndexListener.jsp";from=(189,24);to=(189,38)]
                              out.print( fieldNameCap );
                          // end
                          // HTML // begin [file="/FileIndexListener.jsp";from=(189,40);to=(195,0)]
                              out.write("();\n      if (array != null) {\n        for (int i = 0; i < array.length; i++) {\n          remove(obj, array[i]);\n        }\n      }\n");

                          // end
                          // begin [file="/FileIndexListener.jsp";from=(195,0);to=(195,12)]
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
          // HTML // begin [file="/FileIndexListener.jsp";from=(195,12);to=(197,0)]
              out.write("\n\n");

          // end
          // begin [file="/FileIndexListener.jsp";from=(197,0);to=(197,17)]
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
// HTML // begin [file="/FileIndexListener.jsp";from=(197,17);to=(199,0)]
    out.write("\n    }    \n");

// end
// begin [file="/FileIndexListener.jsp";from=(199,0);to=(199,17)]
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
// HTML // begin [file="/FileIndexListener.jsp";from=(199,17);to=(203,0)]
    out.write("\n  }\n  \n}\n");

// end
// begin [file="/FileIndexListener.jsp";from=(203,2);to=(203,16)]
     out.flush(); 
// end
// HTML // begin [file="/FileIndexListener.jsp";from=(203,18);to=(205,0)]
    out.write("\n\n");

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
