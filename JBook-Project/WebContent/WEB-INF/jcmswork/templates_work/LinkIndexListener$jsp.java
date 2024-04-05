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


public class LinkIndexListener$jsp extends HttpJspBase {


    static {
    }
    public LinkIndexListener$jsp( ) {
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

            // HTML // begin [file="/LinkIndexListener.jsp";from=(0,50);to=(1,0)]
                out.write("\n");

            // end
            // HTML // begin [file="/LinkIndexListener.jsp";from=(1,118);to=(2,0)]
                out.write("\n");

            // end
            // HTML // begin [file="/LinkIndexListener.jsp";from=(2,44);to=(3,0)]
                out.write("\n");

            // end
            // begin [file="/LinkIndexListener.jsp";from=(3,2);to=(31,0)]
                
                  request.setCharacterEncoding("UTF-8");
                  
                List typeList = (List)session.getAttribute("typeList");
                List extendedTypes = (List)session.getAttribute("extendedTypeList");
                // Extract Type that have at least one link or link[] field
                List linkTypeList = new ArrayList();
                Set dblinkSet = new HashSet();
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
                    boolean isLinkEditor = editor != null && editor.startsWith("member") || editor.startsWith("group") || editor.startsWith("link");
                    if (isLinkEditor) {
                      linkTypeList.add(itType);
                      break;
                    }
                  }
                }
            // end
            // HTML // begin [file="/LinkIndexListener.jsp";from=(31,2);to=(52,0)]
                out.write("\n// This file was automatically generated. Please, do not edit.\npackage generated;\n\nimport java.util.Map;\nimport java.util.TreeMap;\nimport java.util.TreeSet;\n\nimport com.jalios.jcms.AbstractLinkIndexListener;\nimport com.jalios.jcms.Data;\nimport com.jalios.jstore.Storable;\n\npublic class LinkIndexListener extends AbstractLinkIndexListener {\n\n  public LinkIndexListener(\n      TreeMap<Data,Map<Class<? extends Data>,Map<String,TreeSet<Data>>>> jstoreIndex,\n      TreeMap<String,Map<Class<? extends Data>,Map<String,TreeSet<Data>>>> jcmsdbIndex) {\n    super(jstoreIndex, jcmsdbIndex);\n  }\n  \n  public void handleCreate(Storable storable, boolean firstTime) {\n");

            // end
            // begin [file="/LinkIndexListener.jsp";from=(52,0);to=(52,87)]
                /* ----  jalios:foreach ---- */
                com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_0 = new com.jalios.jtaglib.ForeachTag();
                _jspx_th_jalios_foreach_0.setPageContext(pageContext);
                _jspx_th_jalios_foreach_0.setParent(null);
                _jspx_th_jalios_foreach_0.setCollection( linkTypeList );
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
                          // HTML // begin [file="/LinkIndexListener.jsp";from=(52,87);to=(53,0)]
                              out.write("\n");

                          // end
                          // begin [file="/LinkIndexListener.jsp";from=(53,2);to=(57,0)]
                               
                              String typeName = itType.getAttributeValue("name"); 
                              List fieldList = new ArrayList();
                              TypeUtil.buildInheritedFieldList(itType, fieldList, true, extendedTypes);
                          // end
                          // HTML // begin [file="/LinkIndexListener.jsp";from=(57,2);to=(58,7)]
                              out.write("\n    // ");

                          // end
                          // begin [file="/LinkIndexListener.jsp";from=(58,10);to=(58,20)]
                              out.print( typeName );
                          // end
                          // HTML // begin [file="/LinkIndexListener.jsp";from=(58,22);to=(59,28)]
                              out.write("\n    if (storable instanceof ");

                          // end
                          // begin [file="/LinkIndexListener.jsp";from=(59,31);to=(59,41)]
                              out.print( typeName );
                          // end
                          // HTML // begin [file="/LinkIndexListener.jsp";from=(59,43);to=(60,6)]
                              out.write(") {\n      ");

                          // end
                          // begin [file="/LinkIndexListener.jsp";from=(60,9);to=(60,19)]
                              out.print( typeName );
                          // end
                          // HTML // begin [file="/LinkIndexListener.jsp";from=(60,21);to=(60,29)]
                              out.write(" obj = (");

                          // end
                          // begin [file="/LinkIndexListener.jsp";from=(60,32);to=(60,42)]
                              out.print( typeName );
                          // end
                          // HTML // begin [file="/LinkIndexListener.jsp";from=(60,44);to=(62,0)]
                              out.write(")storable;\n      \n");

                          // end
                          // begin [file="/LinkIndexListener.jsp";from=(62,0);to=(62,106)]
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
                          // HTML // begin [file="/LinkIndexListener.jsp";from=(62,106);to=(63,0)]
                              out.write("\n");

                          // end
                          // begin [file="/LinkIndexListener.jsp";from=(63,2);to=(80,0)]
                              
                                String fieldType = itField.getAttributeValue("type");
                                String fieldName = itField.getAttributeValue("name");
                                String fieldNameCap = Util.recapitalize(fieldName);
                                String fieldEditor = itField.getAttributeValue("editor");
                                boolean fieldML = Util.toBoolean(itField.getAttributeValue("ml"), false);
                                
                                String fieldTypeShort = fieldType;
                                if (fieldTypeShort.endsWith("[]")) {
                                  fieldTypeShort = fieldTypeShort.substring(0, fieldTypeShort.length() - 2);
                                }
                                
                                String getterParam="";
                                boolean isDBLink = TypeUtil.isDBType(itType.getParentElement(), fieldTypeShort);
                                if (isDBLink) {
                                  getterParam="false";
                                }
                          // end
                          // HTML // begin [file="/LinkIndexListener.jsp";from=(80,2);to=(82,0)]
                              out.write("\n\n");

                          // end
                          // begin [file="/LinkIndexListener.jsp";from=(82,0);to=(82,132)]
                              /* ----  jalios:if ---- */
                              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_0 = new com.jalios.jtaglib.IfTag();
                              _jspx_th_jalios_if_0.setPageContext(pageContext);
                              _jspx_th_jalios_if_0.setParent(_jspx_th_jalios_foreach_1);
                              _jspx_th_jalios_if_0.setPredicate( fieldEditor.startsWith("link") || fieldEditor.startsWith("member") || fieldEditor.startsWith("group") );
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
                          // HTML // begin [file="/LinkIndexListener.jsp";from=(82,132);to=(83,9)]
                              out.write("\n      // ");

                          // end
                          // begin [file="/LinkIndexListener.jsp";from=(83,12);to=(83,23)]
                              out.print( fieldName );
                          // end
                          // HTML // begin [file="/LinkIndexListener.jsp";from=(83,25);to=(84,22)]
                              out.write("\n      add(obj, obj.get");

                          // end
                          // begin [file="/LinkIndexListener.jsp";from=(84,25);to=(84,39)]
                              out.print( fieldNameCap );
                          // end
                          // HTML // begin [file="/LinkIndexListener.jsp";from=(84,41);to=(84,42)]
                              out.write("(");

                          // end
                          // begin [file="/LinkIndexListener.jsp";from=(84,45);to=(84,58)]
                              out.print( getterParam );
                          // end
                          // HTML // begin [file="/LinkIndexListener.jsp";from=(84,60);to=(84,64)]
                              out.write("), \"");

                          // end
                          // begin [file="/LinkIndexListener.jsp";from=(84,67);to=(84,78)]
                              out.print( fieldName );
                          // end
                          // HTML // begin [file="/LinkIndexListener.jsp";from=(84,80);to=(85,0)]
                              out.write("\");\n");

                          // end
                          // begin [file="/LinkIndexListener.jsp";from=(85,0);to=(85,39)]
                              /* ----  jalios:if ---- */
                              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_1 = new com.jalios.jtaglib.IfTag();
                              _jspx_th_jalios_if_1.setPageContext(pageContext);
                              _jspx_th_jalios_if_1.setParent(_jspx_th_jalios_if_0);
                              _jspx_th_jalios_if_1.setPredicate( isDBLink );
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
                          // HTML // begin [file="/LinkIndexListener.jsp";from=(85,39);to=(86,22)]
                              out.write("\n      add(obj, obj.get");

                          // end
                          // begin [file="/LinkIndexListener.jsp";from=(86,25);to=(86,39)]
                              out.print( fieldNameCap );
                          // end
                          // HTML // begin [file="/LinkIndexListener.jsp";from=(86,41);to=(86,50)]
                              out.write("DBID(), \"");

                          // end
                          // begin [file="/LinkIndexListener.jsp";from=(86,53);to=(86,64)]
                              out.print( fieldName );
                          // end
                          // HTML // begin [file="/LinkIndexListener.jsp";from=(86,66);to=(87,0)]
                              out.write("\");\n");

                          // end
                          // begin [file="/LinkIndexListener.jsp";from=(87,0);to=(87,12)]
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
          // HTML // begin [file="/LinkIndexListener.jsp";from=(87,12);to=(88,0)]
              out.write("\n");

          // end
          // begin [file="/LinkIndexListener.jsp";from=(88,0);to=(88,38)]
              /* ----  jalios:if ---- */
              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_2 = new com.jalios.jtaglib.IfTag();
              _jspx_th_jalios_if_2.setPageContext(pageContext);
              _jspx_th_jalios_if_2.setParent(_jspx_th_jalios_if_0);
              _jspx_th_jalios_if_2.setPredicate( fieldML );
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
                          // HTML // begin [file="/LinkIndexListener.jsp";from=(88,38);to=(89,22)]
                              out.write("\n      add(obj, obj.get");

                          // end
                          // begin [file="/LinkIndexListener.jsp";from=(89,25);to=(89,39)]
                              out.print( fieldNameCap );
                          // end
                          // HTML // begin [file="/LinkIndexListener.jsp";from=(89,41);to=(89,48)]
                              out.write("ML(), \"");

                          // end
                          // begin [file="/LinkIndexListener.jsp";from=(89,51);to=(89,62)]
                              out.print( fieldName );
                          // end
                          // HTML // begin [file="/LinkIndexListener.jsp";from=(89,64);to=(90,0)]
                              out.write("\");\n");

                          // end
                          // begin [file="/LinkIndexListener.jsp";from=(90,0);to=(90,12)]
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
          // HTML // begin [file="/LinkIndexListener.jsp";from=(90,12);to=(91,0)]
              out.write("\n");

          // end
          // begin [file="/LinkIndexListener.jsp";from=(91,0);to=(91,12)]
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
// HTML // begin [file="/LinkIndexListener.jsp";from=(91,12);to=(93,0)]
    out.write("\n\n");

// end
// begin [file="/LinkIndexListener.jsp";from=(93,0);to=(93,17)]
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
// HTML // begin [file="/LinkIndexListener.jsp";from=(93,17);to=(95,0)]
    out.write("\n    }\n");

// end
// begin [file="/LinkIndexListener.jsp";from=(95,0);to=(95,17)]
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
// HTML // begin [file="/LinkIndexListener.jsp";from=(95,17);to=(99,0)]
    out.write("\n  }\n  \n  public void handleCommitUpdate(Storable storable, Storable oldStorable, boolean firstTime) {\n");

// end
// begin [file="/LinkIndexListener.jsp";from=(99,0);to=(99,87)]
    /* ----  jalios:foreach ---- */
    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_2 = new com.jalios.jtaglib.ForeachTag();
    _jspx_th_jalios_foreach_2.setPageContext(pageContext);
    _jspx_th_jalios_foreach_2.setParent(null);
    _jspx_th_jalios_foreach_2.setCollection( linkTypeList );
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
                // HTML // begin [file="/LinkIndexListener.jsp";from=(99,87);to=(100,0)]
                    out.write("\n");

                // end
                // begin [file="/LinkIndexListener.jsp";from=(100,2);to=(104,0)]
                     
                    String typeName = itType.getAttributeValue("name"); 
                    List fieldList = new ArrayList();
                    TypeUtil.buildInheritedFieldList(itType, fieldList, true, extendedTypes);
                // end
                // HTML // begin [file="/LinkIndexListener.jsp";from=(104,2);to=(105,7)]
                    out.write("\n    // ");

                // end
                // begin [file="/LinkIndexListener.jsp";from=(105,10);to=(105,20)]
                    out.print( typeName );
                // end
                // HTML // begin [file="/LinkIndexListener.jsp";from=(105,22);to=(106,28)]
                    out.write("    \n    if (storable instanceof ");

                // end
                // begin [file="/LinkIndexListener.jsp";from=(106,31);to=(106,41)]
                    out.print( typeName );
                // end
                // HTML // begin [file="/LinkIndexListener.jsp";from=(106,43);to=(107,6)]
                    out.write(") {\n      ");

                // end
                // begin [file="/LinkIndexListener.jsp";from=(107,9);to=(107,19)]
                    out.print( typeName );
                // end
                // HTML // begin [file="/LinkIndexListener.jsp";from=(107,21);to=(107,29)]
                    out.write(" obj = (");

                // end
                // begin [file="/LinkIndexListener.jsp";from=(107,32);to=(107,42)]
                    out.print( typeName );
                // end
                // HTML // begin [file="/LinkIndexListener.jsp";from=(107,44);to=(108,6)]
                    out.write(")storable;\n      ");

                // end
                // begin [file="/LinkIndexListener.jsp";from=(108,9);to=(108,19)]
                    out.print( typeName );
                // end
                // HTML // begin [file="/LinkIndexListener.jsp";from=(108,21);to=(108,32)]
                    out.write(" oldObj = (");

                // end
                // begin [file="/LinkIndexListener.jsp";from=(108,35);to=(108,45)]
                    out.print( typeName );
                // end
                // HTML // begin [file="/LinkIndexListener.jsp";from=(108,47);to=(110,0)]
                    out.write(")oldStorable;\n      \n");

                // end
                // begin [file="/LinkIndexListener.jsp";from=(110,0);to=(110,106)]
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
                          // HTML // begin [file="/LinkIndexListener.jsp";from=(110,106);to=(111,0)]
                              out.write("\n");

                          // end
                          // begin [file="/LinkIndexListener.jsp";from=(111,2);to=(128,0)]
                              
                                String fieldType    = itField.getAttributeValue("type");
                                String fieldName    = itField.getAttributeValue("name");
                                String fieldNameCap = Util.recapitalize(fieldName);
                                String fieldEditor  = itField.getAttributeValue("editor");
                                boolean fieldML     = Util.toBoolean(itField.getAttributeValue("ml"), false);
                                
                                String fieldTypeShort = fieldType;
                                if (fieldTypeShort.endsWith("[]")) {
                                  fieldTypeShort = fieldTypeShort.substring(0, fieldTypeShort.length() - 2);
                                }
                                
                                String getterParam="";
                                boolean isDBLink =  TypeUtil.isDBType(itType.getParentElement(), fieldTypeShort);
                                if (isDBLink) {
                                  getterParam="false";
                                }
                          // end
                          // HTML // begin [file="/LinkIndexListener.jsp";from=(128,2);to=(130,0)]
                              out.write("\n\n");

                          // end
                          // begin [file="/LinkIndexListener.jsp";from=(130,0);to=(130,132)]
                              /* ----  jalios:if ---- */
                              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_3 = new com.jalios.jtaglib.IfTag();
                              _jspx_th_jalios_if_3.setPageContext(pageContext);
                              _jspx_th_jalios_if_3.setParent(_jspx_th_jalios_foreach_3);
                              _jspx_th_jalios_if_3.setPredicate( fieldEditor.startsWith("link") || fieldEditor.startsWith("member") || fieldEditor.startsWith("group") );
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
                          // HTML // begin [file="/LinkIndexListener.jsp";from=(130,132);to=(131,9)]
                              out.write("\n      // ");

                          // end
                          // begin [file="/LinkIndexListener.jsp";from=(131,12);to=(131,23)]
                              out.print( fieldName );
                          // end
                          // HTML // begin [file="/LinkIndexListener.jsp";from=(131,25);to=(132,17)]
                              out.write("\n      if (obj.get");

                          // end
                          // begin [file="/LinkIndexListener.jsp";from=(132,20);to=(132,34)]
                              out.print( fieldNameCap );
                          // end
                          // HTML // begin [file="/LinkIndexListener.jsp";from=(132,36);to=(132,37)]
                              out.write("(");

                          // end
                          // begin [file="/LinkIndexListener.jsp";from=(132,40);to=(132,53)]
                              out.print( getterParam );
                          // end
                          // HTML // begin [file="/LinkIndexListener.jsp";from=(132,55);to=(132,70)]
                              out.write(") != oldObj.get");

                          // end
                          // begin [file="/LinkIndexListener.jsp";from=(132,73);to=(132,87)]
                              out.print( fieldNameCap );
                          // end
                          // HTML // begin [file="/LinkIndexListener.jsp";from=(132,89);to=(132,90)]
                              out.write("(");

                          // end
                          // begin [file="/LinkIndexListener.jsp";from=(132,93);to=(132,106)]
                              out.print( getterParam );
                          // end
                          // HTML // begin [file="/LinkIndexListener.jsp";from=(132,108);to=(133,30)]
                              out.write(")) {\n        remove(obj, oldObj.get");

                          // end
                          // begin [file="/LinkIndexListener.jsp";from=(133,33);to=(133,47)]
                              out.print( fieldNameCap );
                          // end
                          // HTML // begin [file="/LinkIndexListener.jsp";from=(133,49);to=(133,50)]
                              out.write("(");

                          // end
                          // begin [file="/LinkIndexListener.jsp";from=(133,53);to=(133,66)]
                              out.print( getterParam );
                          // end
                          // HTML // begin [file="/LinkIndexListener.jsp";from=(133,68);to=(133,72)]
                              out.write("), \"");

                          // end
                          // begin [file="/LinkIndexListener.jsp";from=(133,75);to=(133,86)]
                              out.print( fieldName );
                          // end
                          // HTML // begin [file="/LinkIndexListener.jsp";from=(133,88);to=(134,24)]
                              out.write("\");\n        add(obj, obj.get");

                          // end
                          // begin [file="/LinkIndexListener.jsp";from=(134,27);to=(134,41)]
                              out.print( fieldNameCap );
                          // end
                          // HTML // begin [file="/LinkIndexListener.jsp";from=(134,43);to=(134,44)]
                              out.write("(");

                          // end
                          // begin [file="/LinkIndexListener.jsp";from=(134,47);to=(134,60)]
                              out.print( getterParam );
                          // end
                          // HTML // begin [file="/LinkIndexListener.jsp";from=(134,62);to=(134,66)]
                              out.write("), \"");

                          // end
                          // begin [file="/LinkIndexListener.jsp";from=(134,69);to=(134,80)]
                              out.print( fieldName );
                          // end
                          // HTML // begin [file="/LinkIndexListener.jsp";from=(134,82);to=(136,0)]
                              out.write("\");\n      }\n");

                          // end
                          // begin [file="/LinkIndexListener.jsp";from=(136,0);to=(136,39)]
                              /* ----  jalios:if ---- */
                              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_4 = new com.jalios.jtaglib.IfTag();
                              _jspx_th_jalios_if_4.setPageContext(pageContext);
                              _jspx_th_jalios_if_4.setParent(_jspx_th_jalios_if_3);
                              _jspx_th_jalios_if_4.setPredicate( isDBLink );
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
                          // HTML // begin [file="/LinkIndexListener.jsp";from=(136,39);to=(137,17)]
                              out.write("\n      if (obj.get");

                          // end
                          // begin [file="/LinkIndexListener.jsp";from=(137,20);to=(137,34)]
                              out.print( fieldNameCap );
                          // end
                          // HTML // begin [file="/LinkIndexListener.jsp";from=(137,36);to=(137,56)]
                              out.write("DBID() != oldObj.get");

                          // end
                          // begin [file="/LinkIndexListener.jsp";from=(137,59);to=(137,73)]
                              out.print( fieldNameCap );
                          // end
                          // HTML // begin [file="/LinkIndexListener.jsp";from=(137,75);to=(138,30)]
                              out.write("DBID()) {\n        remove(obj, oldObj.get");

                          // end
                          // begin [file="/LinkIndexListener.jsp";from=(138,33);to=(138,47)]
                              out.print( fieldNameCap );
                          // end
                          // HTML // begin [file="/LinkIndexListener.jsp";from=(138,49);to=(138,58)]
                              out.write("DBID(), \"");

                          // end
                          // begin [file="/LinkIndexListener.jsp";from=(138,61);to=(138,72)]
                              out.print( fieldName );
                          // end
                          // HTML // begin [file="/LinkIndexListener.jsp";from=(138,74);to=(139,24)]
                              out.write("\");\n        add(obj, obj.get");

                          // end
                          // begin [file="/LinkIndexListener.jsp";from=(139,27);to=(139,41)]
                              out.print( fieldNameCap );
                          // end
                          // HTML // begin [file="/LinkIndexListener.jsp";from=(139,43);to=(139,52)]
                              out.write("DBID(), \"");

                          // end
                          // begin [file="/LinkIndexListener.jsp";from=(139,55);to=(139,66)]
                              out.print( fieldName );
                          // end
                          // HTML // begin [file="/LinkIndexListener.jsp";from=(139,68);to=(141,0)]
                              out.write("\");\n      }\n");

                          // end
                          // begin [file="/LinkIndexListener.jsp";from=(141,0);to=(141,12)]
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
          // HTML // begin [file="/LinkIndexListener.jsp";from=(141,12);to=(142,0)]
              out.write("\n");

          // end
          // begin [file="/LinkIndexListener.jsp";from=(142,0);to=(142,38)]
              /* ----  jalios:if ---- */
              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_5 = new com.jalios.jtaglib.IfTag();
              _jspx_th_jalios_if_5.setPageContext(pageContext);
              _jspx_th_jalios_if_5.setParent(_jspx_th_jalios_if_3);
              _jspx_th_jalios_if_5.setPredicate( fieldML );
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
                          // HTML // begin [file="/LinkIndexListener.jsp";from=(142,38);to=(143,17)]
                              out.write("\n      if (obj.get");

                          // end
                          // begin [file="/LinkIndexListener.jsp";from=(143,20);to=(143,34)]
                              out.print( fieldNameCap );
                          // end
                          // HTML // begin [file="/LinkIndexListener.jsp";from=(143,36);to=(143,54)]
                              out.write("ML() != oldObj.get");

                          // end
                          // begin [file="/LinkIndexListener.jsp";from=(143,57);to=(143,71)]
                              out.print( fieldNameCap );
                          // end
                          // HTML // begin [file="/LinkIndexListener.jsp";from=(143,73);to=(144,30)]
                              out.write("ML()) {\n        remove(obj, oldObj.get");

                          // end
                          // begin [file="/LinkIndexListener.jsp";from=(144,33);to=(144,47)]
                              out.print( fieldNameCap );
                          // end
                          // HTML // begin [file="/LinkIndexListener.jsp";from=(144,49);to=(144,56)]
                              out.write("ML(), \"");

                          // end
                          // begin [file="/LinkIndexListener.jsp";from=(144,59);to=(144,70)]
                              out.print( fieldName );
                          // end
                          // HTML // begin [file="/LinkIndexListener.jsp";from=(144,72);to=(145,24)]
                              out.write("\");\n        add(obj, obj.get");

                          // end
                          // begin [file="/LinkIndexListener.jsp";from=(145,27);to=(145,41)]
                              out.print( fieldNameCap );
                          // end
                          // HTML // begin [file="/LinkIndexListener.jsp";from=(145,43);to=(145,50)]
                              out.write("ML(), \"");

                          // end
                          // begin [file="/LinkIndexListener.jsp";from=(145,53);to=(145,64)]
                              out.print( fieldName );
                          // end
                          // HTML // begin [file="/LinkIndexListener.jsp";from=(145,66);to=(147,0)]
                              out.write("\");\n      }\n");

                          // end
                          // begin [file="/LinkIndexListener.jsp";from=(147,0);to=(147,12)]
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
          // HTML // begin [file="/LinkIndexListener.jsp";from=(147,12);to=(148,0)]
              out.write("\n");

          // end
          // begin [file="/LinkIndexListener.jsp";from=(148,0);to=(148,12)]
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
// HTML // begin [file="/LinkIndexListener.jsp";from=(148,12);to=(150,0)]
    out.write("\n\n");

// end
// begin [file="/LinkIndexListener.jsp";from=(150,0);to=(150,17)]
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
// HTML // begin [file="/LinkIndexListener.jsp";from=(150,17);to=(152,0)]
    out.write("\n    }\n");

// end
// begin [file="/LinkIndexListener.jsp";from=(152,0);to=(152,17)]
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
// HTML // begin [file="/LinkIndexListener.jsp";from=(152,17);to=(156,0)]
    out.write("\n  }\n  \n  public void handleDelete(Storable storable, boolean firstTime) {\n");

// end
// begin [file="/LinkIndexListener.jsp";from=(156,0);to=(156,87)]
    /* ----  jalios:foreach ---- */
    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_4 = new com.jalios.jtaglib.ForeachTag();
    _jspx_th_jalios_foreach_4.setPageContext(pageContext);
    _jspx_th_jalios_foreach_4.setParent(null);
    _jspx_th_jalios_foreach_4.setCollection( linkTypeList );
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
                // HTML // begin [file="/LinkIndexListener.jsp";from=(156,87);to=(157,0)]
                    out.write("\n");

                // end
                // begin [file="/LinkIndexListener.jsp";from=(157,2);to=(161,0)]
                     
                    String typeName = itType.getAttributeValue("name"); 
                    List fieldList = new ArrayList();
                    TypeUtil.buildInheritedFieldList(itType, fieldList, true, extendedTypes);
                // end
                // HTML // begin [file="/LinkIndexListener.jsp";from=(161,2);to=(162,7)]
                    out.write("\n    // ");

                // end
                // begin [file="/LinkIndexListener.jsp";from=(162,10);to=(162,20)]
                    out.print( typeName );
                // end
                // HTML // begin [file="/LinkIndexListener.jsp";from=(162,22);to=(163,28)]
                    out.write("   \n    if (storable instanceof ");

                // end
                // begin [file="/LinkIndexListener.jsp";from=(163,31);to=(163,41)]
                    out.print( typeName );
                // end
                // HTML // begin [file="/LinkIndexListener.jsp";from=(163,43);to=(164,6)]
                    out.write(") {\n      ");

                // end
                // begin [file="/LinkIndexListener.jsp";from=(164,9);to=(164,19)]
                    out.print( typeName );
                // end
                // HTML // begin [file="/LinkIndexListener.jsp";from=(164,21);to=(164,29)]
                    out.write(" obj = (");

                // end
                // begin [file="/LinkIndexListener.jsp";from=(164,32);to=(164,42)]
                    out.print( typeName );
                // end
                // HTML // begin [file="/LinkIndexListener.jsp";from=(164,44);to=(166,0)]
                    out.write(")storable;\n    \n");

                // end
                // begin [file="/LinkIndexListener.jsp";from=(166,0);to=(166,106)]
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
                          // HTML // begin [file="/LinkIndexListener.jsp";from=(166,106);to=(167,0)]
                              out.write("\n");

                          // end
                          // begin [file="/LinkIndexListener.jsp";from=(167,2);to=(184,0)]
                              
                                String fieldType    = itField.getAttributeValue("type");
                                String fieldName    = itField.getAttributeValue("name");
                                String fieldNameCap = Util.recapitalize(fieldName);
                                String fieldEditor  = itField.getAttributeValue("editor");
                                boolean fieldML     = Util.toBoolean(itField.getAttributeValue("ml"), false);
                                
                                String fieldTypeShort = fieldType;
                                if (fieldTypeShort.endsWith("[]")) {
                                  fieldTypeShort = fieldTypeShort.substring(0, fieldTypeShort.length() - 2);
                                }
                                
                                String getterParam="";
                                boolean isDBLink =  TypeUtil.isDBType(itType.getParentElement(), fieldTypeShort);
                                if (isDBLink) {
                                  getterParam="false";
                                }
                          // end
                          // HTML // begin [file="/LinkIndexListener.jsp";from=(184,2);to=(186,0)]
                              out.write("\n\n");

                          // end
                          // begin [file="/LinkIndexListener.jsp";from=(186,0);to=(186,132)]
                              /* ----  jalios:if ---- */
                              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_6 = new com.jalios.jtaglib.IfTag();
                              _jspx_th_jalios_if_6.setPageContext(pageContext);
                              _jspx_th_jalios_if_6.setParent(_jspx_th_jalios_foreach_5);
                              _jspx_th_jalios_if_6.setPredicate( fieldEditor.startsWith("link") || fieldEditor.startsWith("member") || fieldEditor.startsWith("group") );
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
                          // HTML // begin [file="/LinkIndexListener.jsp";from=(186,132);to=(187,9)]
                              out.write("\n      // ");

                          // end
                          // begin [file="/LinkIndexListener.jsp";from=(187,12);to=(187,23)]
                              out.print( fieldName );
                          // end
                          // HTML // begin [file="/LinkIndexListener.jsp";from=(187,25);to=(188,25)]
                              out.write("\n      remove(obj, obj.get");

                          // end
                          // begin [file="/LinkIndexListener.jsp";from=(188,28);to=(188,42)]
                              out.print( fieldNameCap );
                          // end
                          // HTML // begin [file="/LinkIndexListener.jsp";from=(188,44);to=(188,45)]
                              out.write("(");

                          // end
                          // begin [file="/LinkIndexListener.jsp";from=(188,48);to=(188,61)]
                              out.print( getterParam );
                          // end
                          // HTML // begin [file="/LinkIndexListener.jsp";from=(188,63);to=(188,67)]
                              out.write("), \"");

                          // end
                          // begin [file="/LinkIndexListener.jsp";from=(188,70);to=(188,81)]
                              out.print( fieldName );
                          // end
                          // HTML // begin [file="/LinkIndexListener.jsp";from=(188,83);to=(189,0)]
                              out.write("\");\n");

                          // end
                          // begin [file="/LinkIndexListener.jsp";from=(189,0);to=(189,39)]
                              /* ----  jalios:if ---- */
                              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_7 = new com.jalios.jtaglib.IfTag();
                              _jspx_th_jalios_if_7.setPageContext(pageContext);
                              _jspx_th_jalios_if_7.setParent(_jspx_th_jalios_if_6);
                              _jspx_th_jalios_if_7.setPredicate( isDBLink );
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
                          // HTML // begin [file="/LinkIndexListener.jsp";from=(189,39);to=(190,25)]
                              out.write("\n      remove(obj, obj.get");

                          // end
                          // begin [file="/LinkIndexListener.jsp";from=(190,28);to=(190,42)]
                              out.print( fieldNameCap );
                          // end
                          // HTML // begin [file="/LinkIndexListener.jsp";from=(190,44);to=(190,53)]
                              out.write("DBID(), \"");

                          // end
                          // begin [file="/LinkIndexListener.jsp";from=(190,56);to=(190,67)]
                              out.print( fieldName );
                          // end
                          // HTML // begin [file="/LinkIndexListener.jsp";from=(190,69);to=(191,0)]
                              out.write("\");\n");

                          // end
                          // begin [file="/LinkIndexListener.jsp";from=(191,0);to=(191,12)]
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
          // HTML // begin [file="/LinkIndexListener.jsp";from=(191,12);to=(192,0)]
              out.write("\n");

          // end
          // begin [file="/LinkIndexListener.jsp";from=(192,0);to=(192,38)]
              /* ----  jalios:if ---- */
              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_8 = new com.jalios.jtaglib.IfTag();
              _jspx_th_jalios_if_8.setPageContext(pageContext);
              _jspx_th_jalios_if_8.setParent(_jspx_th_jalios_if_6);
              _jspx_th_jalios_if_8.setPredicate( fieldML );
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
                          // HTML // begin [file="/LinkIndexListener.jsp";from=(192,38);to=(193,25)]
                              out.write("\n      remove(obj, obj.get");

                          // end
                          // begin [file="/LinkIndexListener.jsp";from=(193,28);to=(193,42)]
                              out.print( fieldNameCap );
                          // end
                          // HTML // begin [file="/LinkIndexListener.jsp";from=(193,44);to=(193,51)]
                              out.write("ML(), \"");

                          // end
                          // begin [file="/LinkIndexListener.jsp";from=(193,54);to=(193,65)]
                              out.print( fieldName );
                          // end
                          // HTML // begin [file="/LinkIndexListener.jsp";from=(193,67);to=(194,0)]
                              out.write("\");\n");

                          // end
                          // begin [file="/LinkIndexListener.jsp";from=(194,0);to=(194,12)]
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
          // HTML // begin [file="/LinkIndexListener.jsp";from=(194,12);to=(195,0)]
              out.write("\n");

          // end
          // begin [file="/LinkIndexListener.jsp";from=(195,0);to=(195,12)]
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
// HTML // begin [file="/LinkIndexListener.jsp";from=(195,12);to=(197,0)]
    out.write("\n\n");

// end
// begin [file="/LinkIndexListener.jsp";from=(197,0);to=(197,17)]
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
// HTML // begin [file="/LinkIndexListener.jsp";from=(197,17);to=(199,0)]
    out.write("\n    }    \n");

// end
// begin [file="/LinkIndexListener.jsp";from=(199,0);to=(199,17)]
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
// HTML // begin [file="/LinkIndexListener.jsp";from=(199,17);to=(203,0)]
    out.write("\n  }\n  \n}\n");

// end
// begin [file="/LinkIndexListener.jsp";from=(203,2);to=(203,16)]
     out.flush(); 
// end
// HTML // begin [file="/LinkIndexListener.jsp";from=(203,18);to=(205,0)]
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
