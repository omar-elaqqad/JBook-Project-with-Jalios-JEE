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


public class do_0005fType_0005fDiff$jsp extends HttpJspBase {


    static {
    }
    public do_0005fType_0005fDiff$jsp( ) {
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

            // HTML // begin [file="/do_Type_Diff.jsp";from=(0,50);to=(1,0)]
                out.write("\n");

            // end
            // HTML // begin [file="/do_Type_Diff.jsp";from=(1,118);to=(2,0)]
                out.write("\n");

            // end
            // HTML // begin [file="/do_Type_Diff.jsp";from=(2,44);to=(3,0)]
                out.write("\n");

            // end
            // begin [file="/do_Type_Diff.jsp";from=(3,2);to=(40,0)]
                
                  request.setCharacterEncoding("UTF-8");
                
                Element typeElt = (Element)session.getAttribute("typeElt");
                String className = "generated." + typeElt.getAttributeValue("name");
                Attribute categorizableAtt = typeElt.getAttribute("categorizable");
                boolean categorizable = categorizableAtt != null && categorizableAtt.getBooleanValue();
                
                String superclass = Util.getString(typeElt.getAttributeValue("superclass"), "");
                boolean isFileDocument = TypeUtil.isSubTypeOf(typeElt, com.jalios.jcms.FileDocument.class);
                
                // Get the fields (and the inherited fields)                             
                ArrayList tmpList = new ArrayList();
                tmpList.addAll(typeElt.getChild(TypeUtil.FIELDS_ELT).getChildren());
                
                // Clean the list: remove non editable fields (eg. sqlresult) and add imageMap fields
                List fieldList = new ArrayList();
                Map imageMapMap = new HashMap();
                for(Iterator it = tmpList.iterator(); it.hasNext();) {
                  Element itField = (Element)it.next();
                  if ("sqlresult".equals(itField.getAttributeValue("editor"))) {
                    continue;
                  }
                  fieldList.add(itField);
                  if (Util.getString(itField.getAttributeValue("imageMap"), "false").equals("true")) {
                    Element imageMapElt = (Element)itField.clone();
                    imageMapElt.setAttribute("name", itField.getAttributeValue("name") + "Map");
                    imageMapElt.setAttribute("editor", "textarea");
                    imageMapElt.setAttribute("html", "true");
                    imageMapElt.setAttribute("wiki", "false");
                    imageMapElt.setAttribute("imageMap", "true");
                    fieldList.add(imageMapElt);
                    imageMapMap.put(imageMapElt, itField);
                  }
                }
                boolean isDBType = Util.toBoolean(typeElt.getAttributeValue("database"),false);
                String foreachAttribute = isDBType ? "collection" : "array";
            // end
            // HTML // begin [file="/do_Type_Diff.jsp";from=(40,2);to=(44,12)]
                out.write("\n[[%@ page contentType=\"text/html; charset=UTF-8\" %]]\n[[%-- This file was automatically generated. Please, do not edit. --%]]\n[[%--\n  @Summary: ");

            // end
            // begin [file="/do_Type_Diff.jsp";from=(44,15);to=(44,26)]
                out.print( className );
            // end
            // HTML // begin [file="/do_Type_Diff.jsp";from=(44,28);to=(54,0)]
                out.write(" diff page\n  @Category: Generated\n  @Author: JCMS Type Processor\n  @Customizable: True\n  @Requestable: True\n--%]]\n[[%@ include file='/jcore/doInitPage.jspf' %]]\n\n[[% \n{ \n");

            // end
            // begin [file="/do_Type_Diff.jsp";from=(54,3);to=(54,14)]
                out.print( className );
            // end
            // HTML // begin [file="/do_Type_Diff.jsp";from=(54,16);to=(54,27)]
                out.write(" newObj = (");

            // end
            // begin [file="/do_Type_Diff.jsp";from=(54,30);to=(54,41)]
                out.print( className );
            // end
            // HTML // begin [file="/do_Type_Diff.jsp";from=(54,43);to=(55,0)]
                out.write(")request.getAttribute(\"newPub\"); \n");

            // end
            // begin [file="/do_Type_Diff.jsp";from=(55,3);to=(55,14)]
                out.print( className );
            // end
            // HTML // begin [file="/do_Type_Diff.jsp";from=(55,16);to=(55,27)]
                out.write(" oldObj = (");

            // end
            // begin [file="/do_Type_Diff.jsp";from=(55,30);to=(55,41)]
                out.print( className );
            // end
            // HTML // begin [file="/do_Type_Diff.jsp";from=(55,43);to=(58,43)]
                out.write(")request.getAttribute(\"oldPub\"); \nString[] vids = (String[])request.getAttribute(\"vids\"); \nint fieldCount = 1; \nTypeEntry typeEntry = channel.getTypeEntry(");

            // end
            // begin [file="/do_Type_Diff.jsp";from=(58,46);to=(58,56)]
                out.print( className);
            // end
            // HTML // begin [file="/do_Type_Diff.jsp";from=(58,58);to=(69,0)]
                out.write(".class);\nboolean isSuperTypeIncluded = Boolean.TRUE.equals((Boolean)request.getAttribute(\"isSuperTypeIncluded\")); \n{\n  Integer superFieldCount = (Integer)request.getAttribute(\"fieldCount\");\n  if (superFieldCount != null) { \n    fieldCount = superFieldCount.intValue();\n  }\n}\nString fieldDomId = \"\";\n%]]\n\n");

            // end
            // begin [file="/do_Type_Diff.jsp";from=(69,2);to=(69,26)]
                 if (!isFileDocument) { 
            // end
            // HTML // begin [file="/do_Type_Diff.jsp";from=(69,28);to=(113,0)]
                out.write("\n[[% if (!isSuperTypeIncluded) { %]]\n  [[%-- ** title *****************  --%]]\n  [[jalios:foreach collection='[[%= channel.getLanguageList() %]]' name='itLang' type='String']]\n  [[jalios:if predicate='[[%= !Util.isSameContent(newObj.getTitle(itLang, false), oldObj.getTitle(itLang, false)) %]]']]\n  <tr class=\"vTop\">\n    <td class=\"text-right\">[[%= fieldCount++ %]].</td>\n    <td>\n      [[%= typeEntry.getTitleLabel(userLang) %]]\n      [[jalios:if predicate='[[%= channel.isMultilingual() %]]']][[jalios:lang lang='[[%= itLang %]]'/]][[/jalios:if]]\n    </td>\n    [[% \n      fieldDomId = \"titleDiffDomId_\" + itLang ; \n      request.setAttribute(\"fieldDomId\", fieldDomId);\n      request.setAttribute(\"step\", \"action\");\n    %]]\n    <td class=\"text-left\" colspan=\"2\" id=\"[[%= fieldDomId %]]\">\n\t\t[[jsp:include page=\"/work/doVersionToggleMergeFields.jsp\" /]]\n    [[%\n    String newTitle = newObj.getTitle(itLang, false) == null ? \"\" : Util.toWordLine(newObj.getTitle(itLang, false));\n    String oldTitle = oldObj.getTitle(itLang, false) == null ? \"\" : Util.toWordLine(oldObj.getTitle(itLang, false));\n    request.setAttribute(\"newField\", newTitle);\n    request.setAttribute(\"oldField\", oldTitle);\n    request.setAttribute(\"step\", \"show_fields\");\n    %]]\n    [[jsp:include page=\"/work/doVersionToggleMergeFields.jsp\" /]]\n        <div class=\"merge_fields\" >\n    [[%\n    BufferedReader newReader = new BufferedReader(new StringReader(newTitle));\n    BufferedReader oldReader = new BufferedReader(new StringReader(oldTitle));\n    Diff diff = new Diff(); \n    diff.diffBuffer(oldReader , newReader);\n    newReader.close();\n    oldReader.close();\n    oldReader  = new BufferedReader(new StringReader(oldTitle));\n    %]]\n    [[%= diff.iterateHunkBuffer(oldReader, \"<span class='diff-remove'>\" , \"</span>\" , \"<span class='diff-add'>\" , \"</span>\", \"\" , \"\", false,true,false) %]]\n    [[% oldReader.close(); %]]\n        </div>\n    </td>\n  </tr>\n  [[/jalios:if]]\n  [[/jalios:foreach]]\n[[% } %]]\n");

            // end
            // begin [file="/do_Type_Diff.jsp";from=(113,2);to=(113,54)]
                 } else if (!superclass.startsWith("generated.")) { 
            // end
            // HTML // begin [file="/do_Type_Diff.jsp";from=(113,56);to=(115,0)]
                out.write("\n[[jsp:include page=\"/types/FileDocument/doFileDocumentDiff.jsp\"/]]\n");

            // end
            // begin [file="/do_Type_Diff.jsp";from=(115,2);to=(115,5)]
                 } 
            // end
            // HTML // begin [file="/do_Type_Diff.jsp";from=(115,7);to=(117,0)]
                out.write(" \n\n");

            // end
            // begin [file="/do_Type_Diff.jsp";from=(117,0);to=(117,85)]
                /* ----  jalios:foreach ---- */
                com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_0 = new com.jalios.jtaglib.ForeachTag();
                _jspx_th_jalios_foreach_0.setPageContext(pageContext);
                _jspx_th_jalios_foreach_0.setParent(null);
                _jspx_th_jalios_foreach_0.setCollection( fieldList );
                _jspx_th_jalios_foreach_0.setName("itField");
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
                              org.jdom.Element itField = null;
                              itField = (org.jdom.Element) pageContext.findAttribute("itField");
                          // end
                          // HTML // begin [file="/do_Type_Diff.jsp";from=(117,85);to=(118,0)]
                              out.write("\n");

                          // end
                          // begin [file="/do_Type_Diff.jsp";from=(118,2);to=(121,0)]
                              
                              if ("super".equals(itField.getAttributeValue("type"))) {
                                String superClassShortName = Util.getClassShortName(superclass);
                          // end
                          // HTML // begin [file="/do_Type_Diff.jsp";from=(121,2);to=(128,27)]
                              out.write("\n[[%\n  ServletUtil.backupAttribute(pageContext, \"fieldCount\");\n  ServletUtil.backupAttribute(pageContext, \"isSuperTypeIncluded\");\n  request.setAttribute(\"fieldCount\", new Integer(fieldCount));\n  request.setAttribute(\"isSuperTypeIncluded\", Boolean.TRUE);\n%]]\n[[jsp:include page=\"/types/");

                          // end
                          // begin [file="/do_Type_Diff.jsp";from=(128,30);to=(128,51)]
                              out.print( superClassShortName );
                          // end
                          // HTML // begin [file="/do_Type_Diff.jsp";from=(128,53);to=(128,56)]
                              out.write("/do");

                          // end
                          // begin [file="/do_Type_Diff.jsp";from=(128,59);to=(128,80)]
                              out.print( superClassShortName );
                          // end
                          // HTML // begin [file="/do_Type_Diff.jsp";from=(128,82);to=(139,0)]
                              out.write("Diff.jsp\"/]]\n[[%\n  {\n    Integer superFieldCount = (Integer)request.getAttribute(\"fieldCount\");\n    if (superFieldCount != null) {\n      fieldCount = superFieldCount.intValue();\n    }\n  }\n  ServletUtil.restoreAttribute(pageContext, \"fieldCount\");\n  ServletUtil.restoreAttribute(pageContext, \"isSuperTypeIncluded\");\n%]]\n");

                          // end
                          // begin [file="/do_Type_Diff.jsp";from=(139,2);to=(178,0)]
                              
                              } else {
                                String name = itField.getAttributeValue("name");
                                String nameCap = Util.recapitalize(name);
                                String label = "[[%= channel.getTypeFieldLabel(" + className + ".class, \"" + name + "\", userLang) %]]";
                                if (imageMapMap.containsKey(itField)) {
                                  String imageName = ((Element)imageMapMap.get(itField)).getAttributeValue("name");
                                  label = "[[%= channel.getTypeFieldLabel(" + className + ".class, \"" + imageName + "\", userLang) %]] - [[%= glp(\"ui.adm.type-edit.lbl.image-map\") %]]";
                                }
                                String type = itField.getAttributeValue("type");
                                String editor = itField.getAttributeValue("editor");
                                if (editor == null) { editor = ""; }
                                Attribute ml = itField.getAttribute("ml");
                                boolean fieldML = ml != null && ml.getBooleanValue();
                              
                                String rootCatId = itField.getAttributeValue("root");
                              
                                String arrayType = "";
                                boolean isTypeArray = type.endsWith("[]");
                                boolean isTypeList  = type.startsWith("List<");
                                boolean isTypeSet   = type.startsWith("Set<");
                                
                                if (isTypeArray) {
                                 arrayType = type.substring(0, type.length() - 2);
                                }
                                boolean isTypeScalar = !isTypeArray && !isTypeList && !isTypeSet;
                                boolean isAnyLink = editor.startsWith("link") || editor.startsWith("group") || editor.startsWith("member");
                                long durationResolution = Util.toLong(itField.getAttributeValue("resolution"), JaliosConstants.MILLIS_IN_ONE_SECOND);
                                
                                String typeShort = type;
                                if (isTypeArray) {
                                  typeShort = type.substring(0, type.length() - 2);
                                } 
                                else if (isTypeList) {
                                  typeShort = type.substring("List<".length(), type.length() - 1);
                                }
                                else if (isTypeSet) {
                                  typeShort = type.substring("Set<".length(), type.length() - 1);
                                }
                          // end
                          // HTML // begin [file="/do_Type_Diff.jsp";from=(178,2);to=(179,11)]
                              out.write("\n  [[%-- ** ");

                          // end
                          // begin [file="/do_Type_Diff.jsp";from=(179,14);to=(179,20)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/do_Type_Diff.jsp";from=(179,22);to=(181,0)]
                              out.write(" ***************** --%]]\n\n");

                          // end
                          // begin [file="/do_Type_Diff.jsp";from=(181,0);to=(181,15)]
                              /* ----  jalios:select ---- */
                              com.jalios.jtaglib.SelectTag _jspx_th_jalios_select_0 = new com.jalios.jtaglib.SelectTag();
                              _jspx_th_jalios_select_0.setPageContext(pageContext);
                              _jspx_th_jalios_select_0.setParent(_jspx_th_jalios_foreach_0);
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
                          // HTML // begin [file="/do_Type_Diff.jsp";from=(181,15);to=(183,0)]
                              out.write("\n\n");

                          // end
                          // HTML // begin [file="/do_Type_Diff.jsp";from=(183,62);to=(184,0)]
                              out.write("\n");

                          // end
                          // begin [file="/do_Type_Diff.jsp";from=(184,0);to=(184,54)]
                              /* ----  jalios:if ---- */
                              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_0 = new com.jalios.jtaglib.IfTag();
                              _jspx_th_jalios_if_0.setPageContext(pageContext);
                              _jspx_th_jalios_if_0.setParent(_jspx_th_jalios_select_0);
                              _jspx_th_jalios_if_0.setPredicate( type.equals("String[]") );
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
                          // HTML // begin [file="/do_Type_Diff.jsp";from=(184,54);to=(185,0)]
                              out.write("\n");

                          // end
                          // begin [file="/do_Type_Diff.jsp";from=(185,0);to=(185,38)]
                              /* ----  jalios:if ---- */
                              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_1 = new com.jalios.jtaglib.IfTag();
                              _jspx_th_jalios_if_1.setPageContext(pageContext);
                              _jspx_th_jalios_if_1.setParent(_jspx_th_jalios_if_0);
                              _jspx_th_jalios_if_1.setPredicate( fieldML );
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
                          // HTML // begin [file="/do_Type_Diff.jsp";from=(185,38);to=(187,0)]
                              out.write("\n  [[jalios:foreach collection='[[%= channel.getLanguageList() %]]' name='itLang' type='String']]\n");

                          // end
                          // begin [file="/do_Type_Diff.jsp";from=(187,0);to=(187,12)]
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
          // HTML // begin [file="/do_Type_Diff.jsp";from=(187,12);to=(188,60)]
              out.write("\n  [[jalios:if predicate='[[%= !Util.isSameContent(newObj.get");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(188,63);to=(188,72)]
              out.print( nameCap );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(188,74);to=(188,75)]
              out.write("(");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(188,78);to=(188,110)]
              out.print( fieldML ? "itLang, false" : "" );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(188,112);to=(188,125)]
              out.write("), oldObj.get");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(188,128);to=(188,137)]
              out.print( nameCap );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(188,139);to=(188,140)]
              out.write("(");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(188,143);to=(188,175)]
              out.print( fieldML ? "itLang, false" : "" );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(188,177);to=(191,0)]
              out.write(")) %]]']]\n  <tr class=\"vTop\">\n    <td class=\"text-right\">[[%= fieldCount++ %]].</td>\n");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(191,0);to=(191,15)]
              /* ----  jalios:select ---- */
              com.jalios.jtaglib.SelectTag _jspx_th_jalios_select_1 = new com.jalios.jtaglib.SelectTag();
              _jspx_th_jalios_select_1.setPageContext(pageContext);
              _jspx_th_jalios_select_1.setParent(_jspx_th_jalios_if_0);
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
                          // HTML // begin [file="/do_Type_Diff.jsp";from=(191,15);to=(192,0)]
                              out.write("\n");

                          // end
                          // HTML // begin [file="/do_Type_Diff.jsp";from=(192,74);to=(193,0)]
                              out.write("\n");

                          // end
                          // begin [file="/do_Type_Diff.jsp";from=(193,0);to=(193,86)]
                              /* ----  jalios:if ---- */
                              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_2 = new com.jalios.jtaglib.IfTag();
                              _jspx_th_jalios_if_2.setPageContext(pageContext);
                              _jspx_th_jalios_if_2.setParent(_jspx_th_jalios_select_1);
                              _jspx_th_jalios_if_2.setPredicate( editor.equals("textarea") || editor.equals("textfield") );
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
                          // HTML // begin [file="/do_Type_Diff.jsp";from=(193,86);to=(195,6)]
                              out.write("\n    <td nowrap=\"nowrap\">\n      ");

                          // end
                          // begin [file="/do_Type_Diff.jsp";from=(195,9);to=(195,16)]
                              out.print( label );
                          // end
                          // HTML // begin [file="/do_Type_Diff.jsp";from=(195,18);to=(196,6)]
                              out.write("\n      ");

                          // end
                          // begin [file="/do_Type_Diff.jsp";from=(196,6);to=(196,44)]
                              /* ----  jalios:if ---- */
                              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_3 = new com.jalios.jtaglib.IfTag();
                              _jspx_th_jalios_if_3.setPageContext(pageContext);
                              _jspx_th_jalios_if_3.setParent(_jspx_th_jalios_if_2);
                              _jspx_th_jalios_if_3.setPredicate( fieldML );
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
                          // HTML // begin [file="/do_Type_Diff.jsp";from=(196,44);to=(198,6)]
                              out.write("\n        [[jalios:if predicate='[[%= channel.isMultilingual() %]]']][[jalios:lang lang='[[%= itLang %]]'/]][[/jalios:if]]\n      ");

                          // end
                          // begin [file="/do_Type_Diff.jsp";from=(198,6);to=(198,18)]
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
          // HTML // begin [file="/do_Type_Diff.jsp";from=(198,18);to=(202,36)]
              out.write("\n    </td>\n    <td class=\"text-left\" colspan=\"2\">\n      <table>\n    [[% String[] array0 = newObj.get");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(202,39);to=(202,48)]
              out.print( nameCap );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(202,50);to=(202,51)]
              out.write("(");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(202,54);to=(202,86)]
              out.print( fieldML ? "itLang, false" : "" );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(202,88);to=(202,126)]
              out.write(") == null ? new String[0] : newObj.get");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(202,129);to=(202,138)]
              out.print( nameCap );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(202,140);to=(202,141)]
              out.write("(");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(202,144);to=(202,176)]
              out.print( fieldML ? "itLang, false" : "" );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(202,178);to=(203,36)]
              out.write("); %]]\n    [[% String[] array1 = oldObj.get");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(203,39);to=(203,48)]
              out.print( nameCap );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(203,50);to=(203,51)]
              out.write("(");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(203,54);to=(203,86)]
              out.print( fieldML ? "itLang, false" : "" );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(203,88);to=(203,126)]
              out.write(") == null ? new String[0] : oldObj.get");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(203,129);to=(203,138)]
              out.print( nameCap );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(203,140);to=(203,141)]
              out.write("(");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(203,144);to=(203,176)]
              out.print( fieldML ? "itLang, false" : "" );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(203,178);to=(235,0)]
              out.write("); %]]\n    [[% int maxLength  = Math.max(array0.length, array1.length); %]]\n    [[% for(int i = 0; i < maxLength; i++) { %]]\n    [[%   String newItem = (i < array0.length && array0[i] != null ? Util.toWordLine(array0[i]) : \"\"); %]]\n    [[%   String oldItem = (i < array1.length && array1[i] != null ? Util.toWordLine(array1[i]) : \"\"); %]]\n    [[%   if (newItem.equals(oldItem)) { %]]\n        <tr>\n          <td class=\"vTop text-right fit\">[[%= i + 1 %]].</td>\n          <td><em>[[%= glp(\"ui.work.ver.diff.item\") %]]</em></td>\n        </tr>\n    \n    [[%   } else { %]]\n    [[%\n    BufferedReader newReader = new BufferedReader(new StringReader(newItem));\n    BufferedReader oldReader = new BufferedReader(new StringReader(oldItem));\n    Diff diff = new Diff(); \n    diff.diffBuffer(oldReader , newReader);\n    newReader.close();\n    oldReader.close();\n    oldReader  = new BufferedReader(new StringReader(oldItem));\n    %]]\n        <tr>\n          <td class=\"vTop text-right\">[[%= i + 1 %]].</td>\n          <td width='100%'>\n          [[%= diff.iterateHunkBuffer(oldReader, \"<span class='diff-remove'>\" , \"</span>\" , \"<span class='diff-add'>\" , \"</span>\", \"\" , \"\", false,true,false) %]]\n          </td>\n        </tr>\n    [[% oldReader.close(); %]]\n    [[%  } %]]\n    [[% } // for %]]\n      </table>\n    </td>\n");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(235,0);to=(235,12)]
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
// HTML // begin [file="/do_Type_Diff.jsp";from=(235,12);to=(236,0)]
    out.write("\n");

// end
// HTML // begin [file="/do_Type_Diff.jsp";from=(236,59);to=(237,0)]
    out.write("\n");

// end
// begin [file="/do_Type_Diff.jsp";from=(237,0);to=(237,55)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_4 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_4.setPageContext(pageContext);
    _jspx_th_jalios_if_4.setParent(_jspx_th_jalios_select_1);
    _jspx_th_jalios_if_4.setPredicate( editor.equals("wysiwyg") );
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
                // HTML // begin [file="/do_Type_Diff.jsp";from=(237,55);to=(238,0)]
                    out.write("\n");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(238,2);to=(238,63)]
                     String nameML = name + (fieldML ? "_[[%= itLang %]]" : ""); 
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(238,65);to=(240,6)]
                    out.write("\n    <td nowrap=\"nowrap\">\n      ");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(240,9);to=(240,16)]
                    out.print( label );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(240,18);to=(241,6)]
                    out.write("\n      ");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(241,6);to=(241,44)]
                    /* ----  jalios:if ---- */
                    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_5 = new com.jalios.jtaglib.IfTag();
                    _jspx_th_jalios_if_5.setPageContext(pageContext);
                    _jspx_th_jalios_if_5.setParent(_jspx_th_jalios_if_4);
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
                          // HTML // begin [file="/do_Type_Diff.jsp";from=(241,44);to=(243,6)]
                              out.write("\n        [[jalios:if predicate='[[%= channel.isMultilingual() %]]']][[jalios:lang lang='[[%= itLang %]]'/]][[/jalios:if]]\n      ");

                          // end
                          // begin [file="/do_Type_Diff.jsp";from=(243,6);to=(243,18)]
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
          // HTML // begin [file="/do_Type_Diff.jsp";from=(243,18);to=(247,36)]
              out.write("\n    </td>\n    <td class=\"text-left\" colspan=\"2\">\n      <table>\n    [[% String[] array0 = newObj.get");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(247,39);to=(247,48)]
              out.print( nameCap );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(247,50);to=(247,51)]
              out.write("(");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(247,54);to=(247,86)]
              out.print( fieldML ? "itLang, false" : "" );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(247,88);to=(247,126)]
              out.write(") == null ? new String[0] : newObj.get");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(247,129);to=(247,138)]
              out.print( nameCap );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(247,140);to=(247,141)]
              out.write("(");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(247,144);to=(247,176)]
              out.print( fieldML ? "itLang, false" : "" );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(247,178);to=(248,36)]
              out.write("); %]]\n    [[% String[] array1 = oldObj.get");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(248,39);to=(248,48)]
              out.print( nameCap );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(248,50);to=(248,51)]
              out.write("(");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(248,54);to=(248,86)]
              out.print( fieldML ? "itLang, false" : "" );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(248,88);to=(248,126)]
              out.write(") == null ? new String[0] : oldObj.get");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(248,129);to=(248,138)]
              out.print( nameCap );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(248,140);to=(248,141)]
              out.write("(");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(248,144);to=(248,176)]
              out.print( fieldML ? "itLang, false" : "" );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(248,178);to=(263,4)]
              out.write("); %]]\n    [[% int maxLength  = Math.max(array0.length, array1.length); %]]\n    [[% for(int i = 0; i < maxLength; i++) { %]]\n    [[%   String newItem = (i < array0.length && array0[i] != null ? Util.toWordLine(array0[i]) : \"\"); %]]\n    [[%   String oldItem = (i < array1.length && array1[i] != null ? Util.toWordLine(array1[i]) : \"\"); %]]\n    [[%   if (newItem.equals(oldItem)) { %]]\n        <tr>\n          <td class=\"vTop text-right fit\">[[%= i + 1 %]].</td>\n          <td><em>[[%= glp(\"ui.work.ver.diff.item\") %]]</em></td>\n        </tr>\n    \n    [[%   } else { %]]\n        <tr>\n          <td class=\"vTop text-right\">[[%= i + 1 %]].</td>\n          <td width='100%'>\n    ");

          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(263,59);to=(264,19)]
              out.write("\n    <div id='intro_");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(264,22);to=(264,30)]
              out.print( nameML );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(264,32);to=(265,83)]
              out.write("_[[%= i %]]'>\n    [[%= glp(\"ui.work.ver.diff.ww.item\") %]]. <a href='#' onclick=\"$('textHtmlView_");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(265,86);to=(265,94)]
              out.print( nameML );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(265,96);to=(265,127)]
              out.write("_[[%= i %]]').show(); $('intro_");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(265,130);to=(265,138)]
              out.print( nameML );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(265,140);to=(268,4)]
              out.write("_[[%= i %]]').hide(); return false;\">[[%= glp(\"ui.work.ver.diff.ww.detail\") %]]</a>.\n    </div>\n    \n    ");

          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(268,23);to=(269,26)]
              out.write("\n    <div id='textHtmlView_");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(269,29);to=(269,37)]
              out.print( nameML );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(269,39);to=(270,24)]
              out.write("_[[%= i %]]' style='display:none;'>\n      <div id='textView_");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(270,27);to=(270,35)]
              out.print( nameML );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(270,37);to=(273,39)]
              out.write("_[[%= i %]]'>\n        <div>\n    [[%= glp(\"ui.work.ver.diff.ww.text\") %]]\n    - <a href='#' onclick=\"$('htmlView_");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(273,42);to=(273,50)]
              out.print( nameML );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(273,52);to=(273,86)]
              out.write("_[[%= i %]]').show(); $('textView_");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(273,89);to=(273,97)]
              out.print( nameML );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(273,99);to=(274,36)]
              out.write("_[[%= i %]]').hide(); return false;\">[[%= glp(\"ui.work.ver.diff.ww.html\") %]]</a>\n    - <a href='#' onclick=\"$('intro_");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(274,39);to=(274,47)]
              out.print( nameML );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(274,49);to=(274,87)]
              out.write("_[[%= i %]]').show(); $('textHtmlView_");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(274,90);to=(274,98)]
              out.print( nameML );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(274,100);to=(277,4)]
              out.write("_[[%= i %]]').hide(); return false;\">[[%= glp(\"ui.work.ver.diff.ww.hide\") %]]</a>\n        </div>\n        <div>\n    ");

          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(277,59);to=(295,4)]
              out.write("\n    [[%\n    {\n    String textNewItem = XmlUtil.extractText(newItem);\n    String textOldItem = XmlUtil.extractText(oldItem);\n    BufferedReader newReader = new BufferedReader(new StringReader(textNewItem));\n    BufferedReader oldReader = new BufferedReader(new StringReader(textOldItem));\n    Diff diff = new Diff(); \n    diff.diffBuffer(oldReader , newReader);\n    newReader.close();\n    oldReader.close();\n    oldReader  = new BufferedReader(new StringReader(textOldItem));\n    %]]\n    [[%= diff.iterateHunkBuffer(oldReader, \"<span class='diff-remove'>\" , \"</span>\" , \"<span class='diff-add'>\" , \"</span>\", \"\" , \"\", false,true,true) %]]\n    [[% \n    oldReader.close(); \n    }\n    %]]\n    ");

          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(295,59);to=(299,6)]
              out.write("\n        </div>\n      </div>\n    \n      ");

          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(299,25);to=(300,24)]
              out.write("\n      <div id='htmlView_");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(300,27);to=(300,35)]
              out.print( nameML );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(300,37);to=(302,37)]
              out.write("_[[%= i %]]' style='display:none;'>\n        <div>\n    <a href='#' onclick=\"$('textView_");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(302,40);to=(302,48)]
              out.print( nameML );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(302,50);to=(302,84)]
              out.write("_[[%= i %]]').show(); $('htmlView_");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(302,87);to=(302,95)]
              out.print( nameML );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(302,97);to=(304,36)]
              out.write("_[[%= i %]]').hide(); return false;\">[[%= glp(\"ui.work.ver.diff.ww.text\") %]]</a>\n    - [[%= glp(\"ui.work.ver.diff.ww.html\") %]]\n    - <a href='#' onclick=\"$('intro_");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(304,39);to=(304,47)]
              out.print( nameML );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(304,49);to=(304,87)]
              out.write("_[[%= i %]]').show(); $('textHtmlView_");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(304,90);to=(304,98)]
              out.print( nameML );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(304,100);to=(307,4)]
              out.write("_[[%= i %]]').hide(); return false;\">[[%= glp(\"ui.work.ver.diff.ww.hide\") %]]</a>\n        </div>\n        <div>\n    ");

          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(307,59);to=(323,4)]
              out.write("\n    [[%\n    {\n    BufferedReader newReader = new BufferedReader(new StringReader(newItem));\n    BufferedReader oldReader = new BufferedReader(new StringReader(oldItem));\n    Diff diff = new Diff(); \n    diff.diffBuffer(oldReader , newReader);\n    newReader.close();\n    oldReader.close();\n    oldReader  = new BufferedReader(new StringReader(oldItem));\n    %]]\n    [[%= diff.iterateHunkBuffer(oldReader, \"<span class='diff-remove'>\" , \"</span>\" , \"<span class='diff-add'>\" , \"</span>\", \"\" , \"\", false,true,true) %]]\n    [[% \n    oldReader.close(); \n    }\n    %]]\n    ");

          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(323,59);to=(327,4)]
              out.write("\n        </div>\n      </div>\n    </div>\n    ");

          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(327,59);to=(334,0)]
              out.write("\n          </td>\n        </tr>\n    [[%  } %]]\n    [[% } // for %]]\n      </table>\n    </td>\n");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(334,0);to=(334,12)]
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
// HTML // begin [file="/do_Type_Diff.jsp";from=(334,12);to=(335,0)]
    out.write("\n");

// end
// HTML // begin [file="/do_Type_Diff.jsp";from=(335,62);to=(336,0)]
    out.write("\n");

// end
// begin [file="/do_Type_Diff.jsp";from=(336,0);to=(336,56)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_6 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_6.setPageContext(pageContext);
    _jspx_th_jalios_if_6.setParent(_jspx_th_jalios_select_1);
    _jspx_th_jalios_if_6.setPredicate( editor.equals("password") );
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
                // HTML // begin [file="/do_Type_Diff.jsp";from=(336,56);to=(337,24)]
                    out.write("\n    <td nowrap=\"nowrap\">");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(337,27);to=(337,34)]
                    out.print( label );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(337,36);to=(339,0)]
                    out.write("</td>\n    <td colspan=\"2\"><em>[[%= glp(\"ui.work.ver.diff.pwd-l\") %]]</em></td>\n");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(339,0);to=(339,12)]
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
// HTML // begin [file="/do_Type_Diff.jsp";from=(339,12);to=(341,0)]
    out.write("\n\n");

// end
// HTML // begin [file="/do_Type_Diff.jsp";from=(341,63);to=(342,0)]
    out.write("\n");

// end
// begin [file="/do_Type_Diff.jsp";from=(342,0);to=(342,16)]
    /* ----  jalios:default ---- */
    com.jalios.jtaglib.ConditionalTag _jspx_th_jalios_default_0 = new com.jalios.jtaglib.ConditionalTag();
    _jspx_th_jalios_default_0.setPageContext(pageContext);
    _jspx_th_jalios_default_0.setParent(_jspx_th_jalios_select_1);
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
                // HTML // begin [file="/do_Type_Diff.jsp";from=(342,16);to=(344,6)]
                    out.write("\n    <td nowrap=\"nowrap\">\n      ");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(344,9);to=(344,16)]
                    out.print( label );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(344,18);to=(345,6)]
                    out.write("\n      ");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(345,6);to=(345,44)]
                    /* ----  jalios:if ---- */
                    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_7 = new com.jalios.jtaglib.IfTag();
                    _jspx_th_jalios_if_7.setPageContext(pageContext);
                    _jspx_th_jalios_if_7.setParent(_jspx_th_jalios_default_0);
                    _jspx_th_jalios_if_7.setPredicate( fieldML );
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
                          // HTML // begin [file="/do_Type_Diff.jsp";from=(345,44);to=(347,6)]
                              out.write("\n        [[jalios:if predicate='[[%= channel.isMultilingual() %]]']][[jalios:lang lang='[[%= itLang %]]'/]][[/jalios:if]]\n      ");

                          // end
                          // begin [file="/do_Type_Diff.jsp";from=(347,6);to=(347,18)]
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
          // HTML // begin [file="/do_Type_Diff.jsp";from=(347,18);to=(350,38)]
              out.write("\n    </td>\n    <td>\n      [[% if (Util.notEmpty(newObj.get");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(350,41);to=(350,50)]
              out.print( nameCap );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(350,52);to=(350,53)]
              out.write("(");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(350,56);to=(350,88)]
              out.print( fieldML ? "itLang, false" : "" );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(350,90);to=(352,53)]
              out.write("))) { %]]\n      <ol>\n        [[jalios:foreach name=\"itData\" type=\"String\" ");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(352,56);to=(352,74)]
              out.print( foreachAttribute );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(352,76);to=(352,93)]
              out.write("=\"[[%= newObj.get");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(352,96);to=(352,105)]
              out.print( nameCap );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(352,107);to=(352,108)]
              out.write("(");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(352,111);to=(352,143)]
              out.print( fieldML ? "itLang, false" : "" );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(352,145);to=(359,38)]
              out.write(") %]]\" counter='c2']]\n        <li>[[%= itData %]]</li>\n        [[/jalios:foreach]]\n      </ol>\n      [[% } else { %]] - [[% } %]]\n    </td>\n    <td>\n      [[% if (Util.notEmpty(oldObj.get");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(359,41);to=(359,50)]
              out.print( nameCap );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(359,52);to=(359,53)]
              out.write("(");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(359,56);to=(359,88)]
              out.print( fieldML ? "itLang, false" : "" );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(359,90);to=(361,53)]
              out.write("))) { %]]\n      <ol>\n        [[jalios:foreach name=\"itData\" type=\"String\" ");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(361,56);to=(361,74)]
              out.print( foreachAttribute );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(361,76);to=(361,93)]
              out.write("=\"[[%= oldObj.get");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(361,96);to=(361,105)]
              out.print( nameCap );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(361,107);to=(361,108)]
              out.write("(");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(361,111);to=(361,143)]
              out.print( fieldML ? "itLang, false" : "" );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(361,145);to=(367,0)]
              out.write(") %]]\" counter='c2']]\n        <li>[[%= itData %]]</li>\n        [[/jalios:foreach]]\n      </ol>\n      [[% } else { %]] - [[% } %]]\n    </td>\n");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(367,0);to=(367,17)]
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
// HTML // begin [file="/do_Type_Diff.jsp";from=(367,17);to=(369,0)]
    out.write("\n\n");

// end
// begin [file="/do_Type_Diff.jsp";from=(369,0);to=(369,16)]
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
// HTML // begin [file="/do_Type_Diff.jsp";from=(369,16);to=(372,0)]
    out.write("\n  </tr>\n  [[/jalios:if]]\n");

// end
// begin [file="/do_Type_Diff.jsp";from=(372,0);to=(372,38)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_8 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_8.setPageContext(pageContext);
    _jspx_th_jalios_if_8.setParent(_jspx_th_jalios_if_0);
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
                // HTML // begin [file="/do_Type_Diff.jsp";from=(372,38);to=(374,0)]
                    out.write("\n  [[/jalios:foreach]]\n");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(374,0);to=(374,12)]
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
// HTML // begin [file="/do_Type_Diff.jsp";from=(374,12);to=(375,0)]
    out.write("\n");

// end
// begin [file="/do_Type_Diff.jsp";from=(375,0);to=(375,12)]
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
// HTML // begin [file="/do_Type_Diff.jsp";from=(375,12);to=(377,0)]
    out.write("\n\n");

// end
// HTML // begin [file="/do_Type_Diff.jsp";from=(377,62);to=(378,0)]
    out.write("\n");

// end
// begin [file="/do_Type_Diff.jsp";from=(378,0);to=(378,52)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_9 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_9.setPageContext(pageContext);
    _jspx_th_jalios_if_9.setParent(_jspx_th_jalios_select_0);
    _jspx_th_jalios_if_9.setPredicate( type.equals("String") );
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
                // HTML // begin [file="/do_Type_Diff.jsp";from=(378,52);to=(379,0)]
                    out.write("\n");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(379,0);to=(379,38)]
                    /* ----  jalios:if ---- */
                    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_10 = new com.jalios.jtaglib.IfTag();
                    _jspx_th_jalios_if_10.setPageContext(pageContext);
                    _jspx_th_jalios_if_10.setParent(_jspx_th_jalios_if_9);
                    _jspx_th_jalios_if_10.setPredicate( fieldML );
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
                          // HTML // begin [file="/do_Type_Diff.jsp";from=(379,38);to=(381,0)]
                              out.write("\n  [[jalios:foreach collection='[[%= channel.getLanguageList() %]]' name='itLang' type='String']]\n");

                          // end
                          // begin [file="/do_Type_Diff.jsp";from=(381,0);to=(381,12)]
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
          // HTML // begin [file="/do_Type_Diff.jsp";from=(381,12);to=(382,60)]
              out.write("\n  [[jalios:if predicate='[[%= !Util.isSameContent(newObj.get");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(382,63);to=(382,72)]
              out.print( nameCap );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(382,74);to=(382,75)]
              out.write("(");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(382,78);to=(382,110)]
              out.print( fieldML ? "itLang, false" : "" );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(382,112);to=(382,125)]
              out.write("), oldObj.get");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(382,128);to=(382,137)]
              out.print( nameCap );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(382,139);to=(382,140)]
              out.write("(");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(382,143);to=(382,175)]
              out.print( fieldML ? "itLang, false" : "" );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(382,177);to=(385,0)]
              out.write(")) %]]']]\n  <tr class=\"vTop\">\n    <td class=\"text-right\">[[%= fieldCount++ %]].</td>\n");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(385,0);to=(385,15)]
              /* ----  jalios:select ---- */
              com.jalios.jtaglib.SelectTag _jspx_th_jalios_select_2 = new com.jalios.jtaglib.SelectTag();
              _jspx_th_jalios_select_2.setPageContext(pageContext);
              _jspx_th_jalios_select_2.setParent(_jspx_th_jalios_if_9);
              try {
                  int _jspx_eval_jalios_select_2 = _jspx_th_jalios_select_2.doStartTag();
                  if (_jspx_eval_jalios_select_2 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                      try {
                          if (_jspx_eval_jalios_select_2 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_select_2.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_select_2.doInitBody();
                          }
                          do {
                          // end
                          // HTML // begin [file="/do_Type_Diff.jsp";from=(385,15);to=(386,0)]
                              out.write("\n");

                          // end
                          // HTML // begin [file="/do_Type_Diff.jsp";from=(386,63);to=(387,0)]
                              out.write("\n");

                          // end
                          // begin [file="/do_Type_Diff.jsp";from=(387,0);to=(387,86)]
                              /* ----  jalios:if ---- */
                              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_11 = new com.jalios.jtaglib.IfTag();
                              _jspx_th_jalios_if_11.setPageContext(pageContext);
                              _jspx_th_jalios_if_11.setParent(_jspx_th_jalios_select_2);
                              _jspx_th_jalios_if_11.setPredicate( editor.equals("textarea") || editor.equals("textfield") );
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
                          // HTML // begin [file="/do_Type_Diff.jsp";from=(387,86);to=(388,22)]
                              out.write("\n    [[% fieldDomId = \"");

                          // end
                          // begin [file="/do_Type_Diff.jsp";from=(388,25);to=(388,31)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/do_Type_Diff.jsp";from=(388,33);to=(390,6)]
                              out.write("DiffDomId\"; %]]\n    <td nowrap=\"nowrap\">\n      ");

                          // end
                          // begin [file="/do_Type_Diff.jsp";from=(390,9);to=(390,16)]
                              out.print( label );
                          // end
                          // HTML // begin [file="/do_Type_Diff.jsp";from=(390,18);to=(391,0)]
                              out.write("\n");

                          // end
                          // begin [file="/do_Type_Diff.jsp";from=(391,0);to=(391,38)]
                              /* ----  jalios:if ---- */
                              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_12 = new com.jalios.jtaglib.IfTag();
                              _jspx_th_jalios_if_12.setPageContext(pageContext);
                              _jspx_th_jalios_if_12.setParent(_jspx_th_jalios_if_11);
                              _jspx_th_jalios_if_12.setPredicate( fieldML );
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
                          // HTML // begin [file="/do_Type_Diff.jsp";from=(391,38);to=(394,0)]
                              out.write("\n      [[jalios:if predicate='[[%= channel.isMultilingual() %]]']][[jalios:lang lang='[[%= itLang %]]'/]][[/jalios:if]]\n      [[% fieldDomId += \"_\" + itLang; %]]\n");

                          // end
                          // begin [file="/do_Type_Diff.jsp";from=(394,0);to=(394,12)]
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
          // HTML // begin [file="/do_Type_Diff.jsp";from=(394,12);to=(404,14)]
              out.write("\n    </td>\n    [[% \n      request.setAttribute(\"fieldDomId\", fieldDomId);\n      request.setAttribute(\"step\", \"action\");\n    %]]\n    <td class=\"text-left\" colspan=\"2\" id=\"[[%= fieldDomId %]]\">\n    [[jsp:include page=\"/work/doVersionToggleMergeFields.jsp\" /]]\n    [[%\n    {\n    String new");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(404,17);to=(404,26)]
              out.print( nameCap );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(404,28);to=(404,41)]
              out.write(" = newObj.get");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(404,44);to=(404,53)]
              out.print( nameCap );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(404,55);to=(404,56)]
              out.write("(");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(404,59);to=(404,91)]
              out.print( fieldML ? "itLang, false" : "" );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(404,93);to=(404,136)]
              out.write(") == null ? \"\" : Util.toWordLine(newObj.get");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(404,139);to=(404,148)]
              out.print( nameCap );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(404,150);to=(404,151)]
              out.write("(");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(404,154);to=(404,186)]
              out.print( fieldML ? "itLang, false" : "" );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(404,188);to=(405,14)]
              out.write("));\n    String old");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(405,17);to=(405,26)]
              out.print( nameCap );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(405,28);to=(405,41)]
              out.write(" = oldObj.get");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(405,44);to=(405,53)]
              out.print( nameCap );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(405,55);to=(405,56)]
              out.write("(");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(405,59);to=(405,91)]
              out.print( fieldML ? "itLang, false" : "" );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(405,93);to=(405,136)]
              out.write(") == null ? \"\" : Util.toWordLine(oldObj.get");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(405,139);to=(405,148)]
              out.print( nameCap );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(405,150);to=(405,151)]
              out.write("(");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(405,154);to=(405,186)]
              out.print( fieldML ? "itLang, false" : "" );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(405,188);to=(406,40)]
              out.write("));\n    request.setAttribute(\"newField\", new");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(406,43);to=(406,52)]
              out.print( nameCap );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(406,54);to=(407,40)]
              out.write(");\n    request.setAttribute(\"oldField\", old");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(407,43);to=(407,52)]
              out.print( nameCap );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(407,54);to=(413,70)]
              out.write(");\n    request.setAttribute(\"step\", \"show_fields\");\n    %]]\n    [[jsp:include page=\"/work/doVersionToggleMergeFields.jsp\" /]]\n        <div class=\"merge_fields\" >\n    [[%\n    BufferedReader newReader = new BufferedReader(new StringReader(new");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(413,73);to=(413,82)]
              out.print( nameCap );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(413,84);to=(414,70)]
              out.write("));\n    BufferedReader oldReader = new BufferedReader(new StringReader(old");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(414,73);to=(414,82)]
              out.print( nameCap );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(414,84);to=(419,56)]
              out.write("));\n    Diff diff = new Diff(); \n    diff.diffBuffer(oldReader , newReader);\n    newReader.close();\n    oldReader.close();\n    oldReader  = new BufferedReader(new StringReader(old");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(419,59);to=(419,68)]
              out.print( nameCap );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(419,70);to=(428,0)]
              out.write("));\n    %]]\n     [[%= diff.iterateHunkBuffer(oldReader, \"<span class='diff-remove'>\" , \"</span>\" , \"<span class='diff-add'>\" , \"</span>\", \"\" , \"\", false,true,false) %]]\n    [[% \n    oldReader.close(); \n    }\n    %]]\n        </div>\n    </td>\n");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(428,0);to=(428,12)]
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
// HTML // begin [file="/do_Type_Diff.jsp";from=(428,12);to=(429,0)]
    out.write("\n");

// end
// HTML // begin [file="/do_Type_Diff.jsp";from=(429,50);to=(430,0)]
    out.write("\n");

// end
// begin [file="/do_Type_Diff.jsp";from=(430,0);to=(430,55)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_13 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_13.setPageContext(pageContext);
    _jspx_th_jalios_if_13.setParent(_jspx_th_jalios_select_2);
    _jspx_th_jalios_if_13.setPredicate( editor.equals("wysiwyg") );
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
                // HTML // begin [file="/do_Type_Diff.jsp";from=(430,55);to=(431,0)]
                    out.write("\n");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(431,2);to=(431,63)]
                     String nameML = name + (fieldML ? "_[[%= itLang %]]" : ""); 
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(431,65);to=(432,22)]
                    out.write("\n    [[% fieldDomId = \"");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(432,25);to=(432,31)]
                    out.print( name );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(432,33);to=(434,6)]
                    out.write("DiffDomId\"; %]]\n    <td nowrap=\"nowrap\">\n      ");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(434,9);to=(434,16)]
                    out.print( label );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(434,18);to=(435,0)]
                    out.write("\n");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(435,0);to=(435,38)]
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
                          // HTML // begin [file="/do_Type_Diff.jsp";from=(435,38);to=(438,0)]
                              out.write("\n      [[jalios:if predicate='[[%= channel.isMultilingual() %]]']][[jalios:lang lang='[[%= itLang %]]'/]][[/jalios:if]]\n      [[% fieldDomId += \"_\" + itLang; %]]\n");

                          // end
                          // begin [file="/do_Type_Diff.jsp";from=(438,0);to=(438,12)]
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
          // HTML // begin [file="/do_Type_Diff.jsp";from=(438,12);to=(445,4)]
              out.write("\n    </td>\n    [[% \n      request.setAttribute(\"fieldDomId\", fieldDomId);\n      request.setAttribute(\"step\", \"action\");\n    %]]\n    <td class=\"text-left\" colspan=\"2\" id=\"[[%= fieldDomId %]]\">\n    ");

          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(445,59);to=(446,19)]
              out.write("\n    <div id='intro_");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(446,22);to=(446,30)]
              out.print( nameML );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(446,32);to=(447,85)]
              out.write("'>\n    [[%= glp(\"ui.work.ver.diff.ww.change\") %]]. <a href='#' onclick=\"$('textHtmlView_");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(447,88);to=(447,96)]
              out.print( nameML );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(447,98);to=(447,118)]
              out.write("').show(); $('intro_");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(447,121);to=(447,129)]
              out.print( nameML );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(447,131);to=(449,26)]
              out.write("').hide(); return false;\">[[%= glp(\"ui.work.ver.diff.ww.detail\") %]].</a>\n    </div>\n    <div id='textHtmlView_");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(449,29);to=(449,37)]
              out.print( nameML );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(449,39);to=(451,24)]
              out.write("' style=\"display: none;\">\n    [[jsp:include page=\"/work/doVersionToggleMergeFields.jsp\" /]]\n      <div id='textView_");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(451,27);to=(451,35)]
              out.print( nameML );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(451,37);to=(454,39)]
              out.write("'>\n        <p>\n    [[%= glp(\"ui.work.ver.diff.ww.text\") %>\n    - <a href='#' onclick=\"$('htmlView_");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(454,42);to=(454,50)]
              out.print( nameML );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(454,52);to=(454,75)]
              out.write("').show(); $('textView_");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(454,78);to=(454,86)]
              out.print( nameML );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(454,88);to=(455,36)]
              out.write("').hide(); return false;\">[[%= glp(\"ui.work.ver.diff.ww.html\") %]]</a>\n    - <a href='#' onclick=\"$('intro_");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(455,39);to=(455,47)]
              out.print( nameML );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(455,49);to=(455,76)]
              out.write("').show(); $('textHtmlView_");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(455,79);to=(455,87)]
              out.print( nameML );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(455,89);to=(457,4)]
              out.write("').hide(); return false;\">[[%= glp(\"ui.work.ver.diff.ww.hide\") %]]</a>\n        </p>\n    ");

          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(457,59);to=(460,14)]
              out.write("\n    [[%\n    {\n    String new");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(460,17);to=(460,26)]
              out.print( nameCap );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(460,28);to=(460,41)]
              out.write(" = newObj.get");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(460,44);to=(460,53)]
              out.print( nameCap );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(460,55);to=(460,56)]
              out.write("(");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(460,59);to=(460,91)]
              out.print( fieldML ? "itLang, false" : "" );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(460,93);to=(460,156)]
              out.write(") == null ? \"\" : Util.toWordLine(XmlUtil.extractText(newObj.get");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(460,159);to=(460,168)]
              out.print( nameCap );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(460,170);to=(460,171)]
              out.write("(");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(460,174);to=(460,206)]
              out.print( fieldML ? "itLang, false" : "" );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(460,208);to=(461,14)]
              out.write(")));\n    String old");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(461,17);to=(461,26)]
              out.print( nameCap );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(461,28);to=(461,41)]
              out.write(" = oldObj.get");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(461,44);to=(461,53)]
              out.print( nameCap );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(461,55);to=(461,56)]
              out.write("(");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(461,59);to=(461,91)]
              out.print( fieldML ? "itLang, false" : "" );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(461,93);to=(461,156)]
              out.write(") == null ? \"\" : Util.toWordLine(XmlUtil.extractText(oldObj.get");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(461,159);to=(461,168)]
              out.print( nameCap );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(461,170);to=(461,171)]
              out.write("(");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(461,174);to=(461,206)]
              out.print( fieldML ? "itLang, false" : "" );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(461,208);to=(462,40)]
              out.write(")));\n    request.setAttribute(\"newField\", new");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(462,43);to=(462,52)]
              out.print( nameCap );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(462,54);to=(463,40)]
              out.write(");\n    request.setAttribute(\"oldField\", old");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(463,43);to=(463,52)]
              out.print( nameCap );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(463,54);to=(469,70)]
              out.write(");\n    request.setAttribute(\"step\", \"show_fields\");\n    %]]\n    [[jsp:include page=\"/work/doVersionToggleMergeFields.jsp\" /]]\n        <div class=\"merge_fields\" >\n    [[%\n    BufferedReader newReader = new BufferedReader(new StringReader(new");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(469,73);to=(469,82)]
              out.print( nameCap );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(469,84);to=(470,70)]
              out.write("));\n    BufferedReader oldReader = new BufferedReader(new StringReader(old");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(470,73);to=(470,82)]
              out.print( nameCap );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(470,84);to=(475,56)]
              out.write("));\n    Diff diff = new Diff(); \n    diff.diffBuffer(oldReader , newReader);\n    newReader.close();\n    oldReader.close();\n    oldReader  = new BufferedReader(new StringReader(old");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(475,59);to=(475,68)]
              out.print( nameCap );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(475,70);to=(482,4)]
              out.write("));\n    %]]\n    [[%= diff.iterateHunkBuffer(oldReader, \"<span class='diff-remove'>\" , \"</span>\" , \"<span class='diff-add'>\" , \"</span>\", \"\" , \"\", false,true,true) %]]\n    [[% \n    oldReader.close(); \n    }\n    %]]\n    ");

          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(482,59);to=(486,24)]
              out.write("\n        </div>\n      </div>\n    \n      <div id='htmlView_");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(486,27);to=(486,35)]
              out.print( nameML );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(486,37);to=(488,37)]
              out.write("' style='display: none;'>\n        <p>\n    <a href='#' onclick=\"$('textView_");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(488,40);to=(488,48)]
              out.print( nameML );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(488,50);to=(488,73)]
              out.write("').show(); $('htmlView_");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(488,76);to=(488,84)]
              out.print( nameML );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(488,86);to=(490,36)]
              out.write("').hide(); return false;\">[[%= glp(\"ui.work.ver.diff.ww.text\") %]]</a>\n    - [[%= glp(\"ui.work.ver.diff.ww.html\") %]]\n    - <a href='#' onclick=\"$('intro_");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(490,39);to=(490,47)]
              out.print( nameML );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(490,49);to=(490,76)]
              out.write("').show(); $('textHtmlView_");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(490,79);to=(490,87)]
              out.print( nameML );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(490,89);to=(492,4)]
              out.write("').hide(); return false;\">[[%= glp(\"ui.work.ver.diff.ww.hide\") %]]</a>\n        </p>\n    ");

          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(492,59);to=(495,14)]
              out.write("\n    [[%\n    {\n    String new");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(495,17);to=(495,26)]
              out.print( nameCap );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(495,28);to=(495,41)]
              out.write(" = newObj.get");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(495,44);to=(495,53)]
              out.print( nameCap );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(495,55);to=(495,56)]
              out.write("(");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(495,59);to=(495,91)]
              out.print( fieldML ? "itLang, false" : "" );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(495,93);to=(495,136)]
              out.write(") == null ? \"\" : Util.toWordLine(newObj.get");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(495,139);to=(495,148)]
              out.print( nameCap );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(495,150);to=(495,151)]
              out.write("(");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(495,154);to=(495,186)]
              out.print( fieldML ? "itLang, false" : "" );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(495,188);to=(496,14)]
              out.write("));\n    String old");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(496,17);to=(496,26)]
              out.print( nameCap );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(496,28);to=(496,41)]
              out.write(" = oldObj.get");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(496,44);to=(496,53)]
              out.print( nameCap );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(496,55);to=(496,56)]
              out.write("(");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(496,59);to=(496,91)]
              out.print( fieldML ? "itLang, false" : "" );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(496,93);to=(496,136)]
              out.write(") == null ? \"\" : Util.toWordLine(oldObj.get");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(496,139);to=(496,148)]
              out.print( nameCap );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(496,150);to=(496,151)]
              out.write("(");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(496,154);to=(496,186)]
              out.print( fieldML ? "itLang, false" : "" );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(496,188);to=(497,40)]
              out.write("));\n    request.setAttribute(\"newField\", new");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(497,43);to=(497,52)]
              out.print( nameCap );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(497,54);to=(498,40)]
              out.write(");\n    request.setAttribute(\"oldField\", old");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(498,43);to=(498,52)]
              out.print( nameCap );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(498,54);to=(504,70)]
              out.write(");\n    request.setAttribute(\"step\", \"show_fields\");\n    %]]\n    [[jsp:include page=\"/work/doVersionToggleMergeFields.jsp\" /]]\n            <div class=\"merge_fields\" >\n    [[%\n    BufferedReader newReader = new BufferedReader(new StringReader(new");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(504,73);to=(504,82)]
              out.print( nameCap );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(504,84);to=(505,70)]
              out.write("));\n    BufferedReader oldReader = new BufferedReader(new StringReader(old");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(505,73);to=(505,82)]
              out.print( nameCap );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(505,84);to=(510,56)]
              out.write("));\n    Diff diff = new Diff(); \n    diff.diffBuffer(oldReader , newReader);\n    newReader.close();\n    oldReader.close();\n    oldReader  = new BufferedReader(new StringReader(old");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(510,59);to=(510,68)]
              out.print( nameCap );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(510,70);to=(517,4)]
              out.write("));\n    %]]\n    [[%= diff.iterateHunkBuffer(oldReader, \"<span class='diff-remove'>\" , \"</span>\" , \"<span class='diff-add'>\" , \"</span>\", \"\" , \"\", false,true,true) %]]\n    [[% \n    oldReader.close(); \n    }\n    %]]\n    ");

          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(517,59);to=(521,4)]
              out.write("\n        </div>\n      </div>\n    </div>\n    ");

          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(521,59);to=(523,0)]
              out.write("\n    </td>\n");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(523,0);to=(523,12)]
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
// HTML // begin [file="/do_Type_Diff.jsp";from=(523,12);to=(524,0)]
    out.write("\n");

// end
// HTML // begin [file="/do_Type_Diff.jsp";from=(524,61);to=(525,0)]
    out.write("\n");

// end
// begin [file="/do_Type_Diff.jsp";from=(525,0);to=(525,56)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_15 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_15.setPageContext(pageContext);
    _jspx_th_jalios_if_15.setParent(_jspx_th_jalios_select_2);
    _jspx_th_jalios_if_15.setPredicate( editor.equals("password") );
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
                // HTML // begin [file="/do_Type_Diff.jsp";from=(525,56);to=(526,24)]
                    out.write("\n    <td nowrap=\"nowrap\">");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(526,27);to=(526,34)]
                    out.print( label );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(526,36);to=(528,0)]
                    out.write("</td>\n    <td colspan=\"2\"><em>[[%= glp(\"ui.work.ver.diff.pwd\") %]]</em></td>\n");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(528,0);to=(528,12)]
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
// HTML // begin [file="/do_Type_Diff.jsp";from=(528,12);to=(530,0)]
    out.write("\n\n");

// end
// HTML // begin [file="/do_Type_Diff.jsp";from=(530,58);to=(531,0)]
    out.write("\n");

// end
// begin [file="/do_Type_Diff.jsp";from=(531,0);to=(531,16)]
    /* ----  jalios:default ---- */
    com.jalios.jtaglib.ConditionalTag _jspx_th_jalios_default_1 = new com.jalios.jtaglib.ConditionalTag();
    _jspx_th_jalios_default_1.setPageContext(pageContext);
    _jspx_th_jalios_default_1.setParent(_jspx_th_jalios_select_2);
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
                // HTML // begin [file="/do_Type_Diff.jsp";from=(531,16);to=(533,6)]
                    out.write("\n    <td nowrap=\"nowrap\">\n      ");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(533,9);to=(533,16)]
                    out.print( label );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(533,18);to=(534,0)]
                    out.write("\n");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(534,0);to=(534,38)]
                    /* ----  jalios:if ---- */
                    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_16 = new com.jalios.jtaglib.IfTag();
                    _jspx_th_jalios_if_16.setPageContext(pageContext);
                    _jspx_th_jalios_if_16.setParent(_jspx_th_jalios_default_1);
                    _jspx_th_jalios_if_16.setPredicate( fieldML );
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
                          // HTML // begin [file="/do_Type_Diff.jsp";from=(534,38);to=(536,0)]
                              out.write("\n      [[jalios:if predicate='[[%= channel.isMultilingual() %]]']][[jalios:lang lang='[[%= itLang %]]'/]][[/jalios:if]]\n");

                          // end
                          // begin [file="/do_Type_Diff.jsp";from=(536,0);to=(536,12)]
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
          // HTML // begin [file="/do_Type_Diff.jsp";from=(536,12);to=(538,38)]
              out.write("\n    </td>\n    <td>[[%= Util.getString(newObj.get");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(538,41);to=(538,50)]
              out.print( nameCap );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(538,52);to=(538,53)]
              out.write("(");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(538,56);to=(538,88)]
              out.print( fieldML ? "itLang, false" : "" );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(538,90);to=(539,38)]
              out.write("), \"\") %]]</td>\n    <td>[[%= Util.getString(oldObj.get");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(539,41);to=(539,50)]
              out.print( nameCap );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(539,52);to=(539,53)]
              out.write("(");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(539,56);to=(539,88)]
              out.print( fieldML ? "itLang, false" : "" );
          // end
          // HTML // begin [file="/do_Type_Diff.jsp";from=(539,90);to=(540,0)]
              out.write("), \"\") %]]</td>\n");

          // end
          // begin [file="/do_Type_Diff.jsp";from=(540,0);to=(540,17)]
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
// HTML // begin [file="/do_Type_Diff.jsp";from=(540,17);to=(542,0)]
    out.write("\n\n");

// end
// begin [file="/do_Type_Diff.jsp";from=(542,0);to=(542,16)]
} while (_jspx_th_jalios_select_2.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
} finally {
    if (_jspx_eval_jalios_select_2 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
        out = pageContext.popBody();
}
}
if (_jspx_th_jalios_select_2.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
    return;
} finally {
    _jspx_th_jalios_select_2.release();
}
// end
// HTML // begin [file="/do_Type_Diff.jsp";from=(542,16);to=(545,0)]
    out.write("\n  </tr>\n  [[/jalios:if]]\n");

// end
// begin [file="/do_Type_Diff.jsp";from=(545,0);to=(545,38)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_17 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_17.setPageContext(pageContext);
    _jspx_th_jalios_if_17.setParent(_jspx_th_jalios_if_9);
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
                // HTML // begin [file="/do_Type_Diff.jsp";from=(545,38);to=(547,0)]
                    out.write("\n  [[/jalios:foreach]]\n");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(547,0);to=(547,12)]
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
// HTML // begin [file="/do_Type_Diff.jsp";from=(547,12);to=(548,0)]
    out.write("\n");

// end
// begin [file="/do_Type_Diff.jsp";from=(548,0);to=(548,12)]
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
// HTML // begin [file="/do_Type_Diff.jsp";from=(548,12);to=(550,0)]
    out.write("\n\n");

// end
// HTML // begin [file="/do_Type_Diff.jsp";from=(550,60);to=(551,0)]
    out.write("\n");

// end
// begin [file="/do_Type_Diff.jsp";from=(551,0);to=(551,60)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_18 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_18.setPageContext(pageContext);
    _jspx_th_jalios_if_18.setParent(_jspx_th_jalios_select_0);
    _jspx_th_jalios_if_18.setPredicate( type.equals("java.util.Date") );
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
                // HTML // begin [file="/do_Type_Diff.jsp";from=(551,60);to=(552,40)]
                    out.write("\n  [[jalios:if predicate='[[%= newObj.get");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(552,43);to=(552,52)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(552,54);to=(552,70)]
                    out.write("() != oldObj.get");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(552,73);to=(552,82)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(552,84);to=(555,24)]
                    out.write("() %]]']]\n  <tr class=\"vTop\">\n    <td class=\"text-right\">[[%= fieldCount++ %]].</td>\n    <td nowrap=\"nowrap\">");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(555,27);to=(555,34)]
                    out.print( label );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(555,36);to=(556,43)]
                    out.write("</td>\n    <td>[[jalios:date date='[[%= newObj.get");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(556,46);to=(556,55)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(556,57);to=(556,104)]
                    out.write("() %]]' /]] [[jalios:time date='[[%= newObj.get");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(556,107);to=(556,116)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(556,118);to=(557,43)]
                    out.write("() %]]' /]]</td>\n    <td>[[jalios:date date='[[%= oldObj.get");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(557,46);to=(557,55)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(557,57);to=(557,104)]
                    out.write("() %]]' /]] [[jalios:time date='[[%= oldObj.get");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(557,107);to=(557,116)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(557,118);to=(560,0)]
                    out.write("() %]]' /]]</td>\n  </tr>\n  [[/jalios:if]]\n");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(560,0);to=(560,12)]
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
// HTML // begin [file="/do_Type_Diff.jsp";from=(560,12);to=(563,0)]
    out.write("\n\n\n");

// end
// HTML // begin [file="/do_Type_Diff.jsp";from=(563,80);to=(564,0)]
    out.write("\n");

// end
// begin [file="/do_Type_Diff.jsp";from=(564,0);to=(564,56)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_19 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_19.setPageContext(pageContext);
    _jspx_th_jalios_if_19.setParent(_jspx_th_jalios_select_0);
    _jspx_th_jalios_if_19.setPredicate( isTypeScalar && isAnyLink );
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
                // HTML // begin [file="/do_Type_Diff.jsp";from=(564,56);to=(565,40)]
                    out.write("\n  [[jalios:if predicate='[[%= newObj.get");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(565,43);to=(565,52)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(565,54);to=(565,70)]
                    out.write("() != oldObj.get");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(565,73);to=(565,82)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(565,84);to=(568,24)]
                    out.write("() %]]']]\n  <tr class=\"vTop\">\n    <td class=\"text-right\">[[%= fieldCount++ %]].</td>\n    <td nowrap=\"nowrap\">");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(568,27);to=(568,34)]
                    out.print( label );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(568,36);to=(570,35)]
                    out.write("</td>\n    <td>\n      [[% Data newLink = newObj.get");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(570,38);to=(570,47)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(570,49);to=(577,35)]
                    out.write("(); %]]\n      [[% if (newLink != null) { %]] \n      [[%   if (newLink instanceof FileDocument) { %]]\n      <a href=\"work/displayWork.jsp?id=[[%= newLink.getId() %]]&amp;details=true\">[[jalios:fileicon doc='[[%= ((FileDocument)newLink) %]]' /]]</a>\n      [[%   } %]][[jalios:link data='[[%= newLink %]]'/]][[% } %]]\n    </td>\n    <td>\n      [[% Data oldLink = oldObj.get");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(577,38);to=(577,47)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(577,49);to=(584,0)]
                    out.write("(); %]]\n      [[% if (oldLink != null) { %]] \n      [[%   if (oldLink instanceof FileDocument) { %]]\n      <a href=\"work/displayWork.jsp?id=[[%= oldLink.getId() %]]&amp;details=true\">[[jalios:fileicon doc='[[%= ((FileDocument)oldLink) %]]' /]]</a>\n      [[%   } %]][[jalios:link data='[[%= oldLink %]]'/]][[% } %]]\n    </td>  </tr>\n  [[/jalios:if]]\n");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(584,0);to=(584,12)]
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
// HTML // begin [file="/do_Type_Diff.jsp";from=(584,12);to=(586,0)]
    out.write("\n\n");

// end
// HTML // begin [file="/do_Type_Diff.jsp";from=(586,68);to=(587,0)]
    out.write("\n");

// end
// begin [file="/do_Type_Diff.jsp";from=(587,0);to=(587,96)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_20 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_20.setPageContext(pageContext);
    _jspx_th_jalios_if_20.setParent(_jspx_th_jalios_select_0);
    _jspx_th_jalios_if_20.setPredicate( isTypeScalar && (editor.equals("int") || editor.equals("double")) );
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
                // HTML // begin [file="/do_Type_Diff.jsp";from=(587,96);to=(588,40)]
                    out.write("\n  [[jalios:if predicate='[[%= newObj.get");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(588,43);to=(588,52)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(588,54);to=(588,70)]
                    out.write("() != oldObj.get");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(588,73);to=(588,82)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(588,84);to=(591,24)]
                    out.write("() %]]']]\n  <tr class=\"vTop\">\n    <td class=\"text-right\">[[%= fieldCount++ %]].</td>\n    <td nowrap=\"nowrap\">");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(591,27);to=(591,34)]
                    out.print( label );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(591,36);to=(592,23)]
                    out.write("</td>\n    <td>[[%= newObj.get");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(592,26);to=(592,35)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(592,37);to=(593,23)]
                    out.write("()  %]]</td>\n    <td>[[%= oldObj.get");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(593,26);to=(593,35)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(593,37);to=(596,0)]
                    out.write("()  %]]</td>\n  </tr>\n  [[/jalios:if]]\n");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(596,0);to=(596,12)]
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
// HTML // begin [file="/do_Type_Diff.jsp";from=(596,12);to=(598,0)]
    out.write("\n\n");

// end
// HTML // begin [file="/do_Type_Diff.jsp";from=(598,64);to=(599,0)]
    out.write("\n");

// end
// begin [file="/do_Type_Diff.jsp";from=(599,0);to=(599,72)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_21 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_21.setPageContext(pageContext);
    _jspx_th_jalios_if_21.setParent(_jspx_th_jalios_select_0);
    _jspx_th_jalios_if_21.setPredicate( isTypeScalar && editor.equals("duration") );
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
                // HTML // begin [file="/do_Type_Diff.jsp";from=(599,72);to=(600,40)]
                    out.write("\n  [[jalios:if predicate='[[%= newObj.get");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(600,43);to=(600,52)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(600,54);to=(600,70)]
                    out.write("() != oldObj.get");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(600,73);to=(600,82)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(600,84);to=(603,24)]
                    out.write("() %]]']]\n  <tr class=\"vTop\" >\n    <td class=\"text-right\">[[%= fieldCount++ %]].</td>\n    <td nowrap=\"nowrap\">");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(603,27);to=(603,34)]
                    out.print( label );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(603,36);to=(604,47)]
                    out.write("</td>\n    <td>[[jalios:duration time='[[%= newObj.get");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(604,50);to=(604,59)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(604,61);to=(604,66)]
                    out.write("() * ");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(604,69);to=(604,89)]
                    out.print( durationResolution );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(604,91);to=(605,47)]
                    out.write(" %]]'/]]</td>\n    <td>[[jalios:duration time='[[%= oldObj.get");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(605,50);to=(605,59)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(605,61);to=(605,66)]
                    out.write("() * ");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(605,69);to=(605,89)]
                    out.print( durationResolution );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(605,91);to=(608,0)]
                    out.write(" %]]'/]]</td>\n  </tr>\n  [[/jalios:if]]\n");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(608,0);to=(608,12)]
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
// HTML // begin [file="/do_Type_Diff.jsp";from=(608,12);to=(610,0)]
    out.write("\n\n");

// end
// HTML // begin [file="/do_Type_Diff.jsp";from=(610,63);to=(611,0)]
    out.write("\n");

// end
// begin [file="/do_Type_Diff.jsp";from=(611,0);to=(611,72)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_22 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_22.setPageContext(pageContext);
    _jspx_th_jalios_if_22.setParent(_jspx_th_jalios_select_0);
    _jspx_th_jalios_if_22.setPredicate( isTypeScalar && editor.equals("boolean")  );
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
                // HTML // begin [file="/do_Type_Diff.jsp";from=(611,72);to=(612,40)]
                    out.write("\n  [[jalios:if predicate='[[%= newObj.get");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(612,43);to=(612,52)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(612,54);to=(612,70)]
                    out.write("() != oldObj.get");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(612,73);to=(612,82)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(612,84);to=(615,24)]
                    out.write("() %]]']]\n  <tr class=\"vTop\">\n    <td class=\"text-right\">[[%= fieldCount++ %]].</td>\n    <td nowrap=\"nowrap\">");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(615,27);to=(615,34)]
                    out.print( label );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(615,36);to=(616,23)]
                    out.write("</td>\n    <td>[[%= newObj.get");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(616,26);to=(616,35)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(616,37);to=(617,23)]
                    out.write("Label(userLang) %]]</td>\n    <td>[[%= oldObj.get");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(617,26);to=(617,35)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(617,37);to=(620,0)]
                    out.write("Label(userLang) %]]</td>\n  </tr>\n  [[/jalios:if]]\n");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(620,0);to=(620,12)]
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
// HTML // begin [file="/do_Type_Diff.jsp";from=(620,12);to=(622,0)]
    out.write("\n\n");

// end
// HTML // begin [file="/do_Type_Diff.jsp";from=(622,84);to=(623,0)]
    out.write("\n");

// end
// begin [file="/do_Type_Diff.jsp";from=(623,0);to=(623,57)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_23 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_23.setPageContext(pageContext);
    _jspx_th_jalios_if_23.setParent(_jspx_th_jalios_select_0);
    _jspx_th_jalios_if_23.setPredicate( !isTypeScalar && isAnyLink );
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
                // HTML // begin [file="/do_Type_Diff.jsp";from=(623,57);to=(624,60)]
                    out.write("\n  [[jalios:if predicate='[[%= !Util.isSameContent(newObj.get");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(624,63);to=(624,72)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(624,74);to=(624,88)]
                    out.write("(), oldObj.get");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(624,91);to=(624,100)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(624,102);to=(627,24)]
                    out.write("()) %]]']]\n  <tr class=\"vTop\">\n    <td class=\"text-right\">[[%= fieldCount++ %]].</td>\n    <td nowrap=\"nowrap\">");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(627,27);to=(627,34)]
                    out.print( label );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(627,36);to=(629,38)]
                    out.write("</td>\n    <td>\n      [[% if (Util.notEmpty(newObj.get");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(629,41);to=(629,50)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(629,52);to=(631,51)]
                    out.write("())) { %]]\n      <ol>\n        [[jalios:foreach name=\"itData\" type=\"Data\" ");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(631,54);to=(631,72)]
                    out.print( foreachAttribute );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(631,74);to=(631,91)]
                    out.write("=\"[[%= newObj.get");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(631,94);to=(631,103)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(631,105);to=(643,38)]
                    out.write("() %]]\"]]\n        <li>\n        [[% if (itData != null) { %]] \n        [[%   if (itData instanceof FileDocument) { %]]\n        <a href=\"work/displayWork.jsp?id=[[%= itData.getId() %]]&amp;details=true\">[[jalios:fileicon doc='[[%= ((FileDocument)itData) %]]' /]]</a>\n        [[%   } %]][[jalios:link data='[[%= itData %]]'/]][[% } else { %]] - [[% } %]]\n        </li>\n        [[/jalios:foreach]]\n      </ol>\n      [[% } %]]\n    </td>\n    <td>\n      [[% if (Util.notEmpty(oldObj.get");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(643,41);to=(643,50)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(643,52);to=(645,51)]
                    out.write("())) { %]]\n      <ol>\n        [[jalios:foreach name=\"itData\" type=\"Data\" ");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(645,54);to=(645,72)]
                    out.print( foreachAttribute );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(645,74);to=(645,91)]
                    out.write("=\"[[%= oldObj.get");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(645,94);to=(645,103)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(645,105);to=(658,0)]
                    out.write("() %]]\"]]\n        <li>\n        [[% if (itData != null) { %]] \n        [[%   if (itData instanceof FileDocument) { %]]\n        <a href=\"work/displayWork.jsp?id=[[%= itData.getId() %]]&amp;details=true\">[[jalios:fileicon doc='[[%= ((FileDocument)itData) %]]' /]]</a>\n        [[%   } %]][[jalios:link data='[[%= itData %]]'/]][[% } else { %]] - [[% } %]]\n        </li>\n        [[/jalios:foreach]]\n      </ol>\n      [[% } %]]\n    </td>\n  </tr>\n  [[/jalios:if]]\n");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(658,0);to=(658,12)]
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
// HTML // begin [file="/do_Type_Diff.jsp";from=(658,12);to=(660,0)]
    out.write("\n\n");

// end
// HTML // begin [file="/do_Type_Diff.jsp";from=(660,67);to=(661,0)]
    out.write("\n");

// end
// begin [file="/do_Type_Diff.jsp";from=(661,0);to=(661,87)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_24 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_24.setPageContext(pageContext);
    _jspx_th_jalios_if_24.setParent(_jspx_th_jalios_select_0);
    _jspx_th_jalios_if_24.setPredicate( type.equals("boolean[]") || type.equals("List<Boolean>") );
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
                // HTML // begin [file="/do_Type_Diff.jsp";from=(661,87);to=(662,60)]
                    out.write("\n  [[jalios:if predicate='[[%= !Util.isSameContent(newObj.get");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(662,63);to=(662,72)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(662,74);to=(662,88)]
                    out.write("(), oldObj.get");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(662,91);to=(662,100)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(662,102);to=(665,24)]
                    out.write("()) %]]']]\n  <tr class=\"vTop\">\n    <td class=\"text-right\">[[%= fieldCount++ %]].</td>\n    <td nowrap=\"nowrap\">");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(665,27);to=(665,34)]
                    out.print( label );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(665,36);to=(669,10)]
                    out.write("</td>\n    <td>\n       [[% \n        { \n          ");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(669,13);to=(669,19)]
                    out.print( type );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(669,21);to=(669,52)]
                    out.write(" arrayOrCollection = newObj.get");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(669,55);to=(669,64)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(669,66);to=(674,23)]
                    out.write("(); \n          if (Util.notEmpty(arrayOrCollection)) {\n       %]]\n      <ol>\n       [[%\n            int _len = ");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(674,25);to=(674,45)]
                     if (isTypeArray) { 
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(674,47);to=(674,71)]
                    out.write("arrayOrCollection.length");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(674,73);to=(674,83)]
                     } else { 
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(674,85);to=(674,109)]
                    out.write("arrayOrCollection.size()");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(674,111);to=(674,114)]
                     } 
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(674,116);to=(677,32)]
                    out.write(";\n            for(int i = 0; i < _len; i++) { \n        %]]\n             <li>[[%= newObj.get");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(677,35);to=(677,44)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(677,46);to=(690,10)]
                    out.write("Label(i, userLang) %]]</li>\n        [[%\n            }\n       %]]\n      </ol>\n       [[%\n          }\n        }\n       %]]\n    </td>\n    <td>\n        [[% \n        { \n          ");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(690,13);to=(690,19)]
                    out.print( type );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(690,21);to=(690,52)]
                    out.write(" arrayOrCollection = oldObj.get");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(690,55);to=(690,64)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(690,66);to=(696,23)]
                    out.write("(); \n          if (Util.notEmpty(arrayOrCollection)) {\n        %]]\n      <ol>\n       [[%\n\n            int _len = ");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(696,25);to=(696,45)]
                     if (isTypeArray) { 
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(696,47);to=(696,71)]
                    out.write("arrayOrCollection.length");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(696,73);to=(696,83)]
                     } else { 
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(696,85);to=(696,109)]
                    out.write("arrayOrCollection.size()");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(696,111);to=(696,114)]
                     } 
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(696,116);to=(699,32)]
                    out.write(";\n            for(int i = 0; i < _len; i++) { \n        %]]\n             <li>[[%= oldObj.get");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(699,35);to=(699,44)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(699,46);to=(712,0)]
                    out.write("Label(i, userLang) %]]</li>\n        [[%\n            }\n        %]]\n      </ol>\n       [[%\n          }\n        }\n        %]]\n   </td>\n  </tr>\n  [[/jalios:if]]\n  </tr>\n");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(712,0);to=(712,12)]
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
// HTML // begin [file="/do_Type_Diff.jsp";from=(712,12);to=(714,0)]
    out.write("\n\n");

// end
// HTML // begin [file="/do_Type_Diff.jsp";from=(714,74);to=(715,0)]
    out.write("\n");

// end
// begin [file="/do_Type_Diff.jsp";from=(715,0);to=(715,97)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_25 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_25.setPageContext(pageContext);
    _jspx_th_jalios_if_25.setParent(_jspx_th_jalios_select_0);
    _jspx_th_jalios_if_25.setPredicate( !isTypeScalar && (editor.equals("int") || editor.equals("double")) );
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
                // HTML // begin [file="/do_Type_Diff.jsp";from=(715,97);to=(716,60)]
                    out.write("\n  [[jalios:if predicate='[[%= !Util.isSameContent(newObj.get");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(716,63);to=(716,72)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(716,74);to=(716,88)]
                    out.write("(), oldObj.get");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(716,91);to=(716,100)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(716,102);to=(719,24)]
                    out.write("()) %]]']]\n  <tr class=\"vTop\">\n    <td class=\"text-right\">[[%= fieldCount++ %]].</td>\n    <td nowrap=\"nowrap\">");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(719,27);to=(719,34)]
                    out.print( label );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(719,36);to=(723,10)]
                    out.write("</td>\n    <td>\n        [[% \n        { \n          ");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(723,13);to=(723,19)]
                    out.print( type );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(723,21);to=(723,52)]
                    out.write(" arrayOrCollection = newObj.get");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(723,55);to=(723,64)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(723,66);to=(728,16)]
                    out.write("(); \n          if (Util.notEmpty(arrayOrCollection)) {\n        %]]\n      <ol>\n       [[%\n            for(");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(728,19);to=(728,30)]
                    out.print( typeShort );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(728,32);to=(743,10)]
                    out.write(" item: arrayOrCollection) { \n        %]]\n             <li>[[%= item %]]</li>\n        [[%\n            }\n       %]]\n      </ol>\n       [[%\n          }\n        }\n        %]]\n    </td>\n    <td>\n        [[% \n        { \n          ");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(743,13);to=(743,19)]
                    out.print( type );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(743,21);to=(743,52)]
                    out.write(" arrayOrCollection = oldObj.get");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(743,55);to=(743,64)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(743,66);to=(748,16)]
                    out.write("(); \n          if (Util.notEmpty(arrayOrCollection)) {\n        %]]\n      <ol>\n       [[%\n            for(");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(748,19);to=(748,30)]
                    out.print( typeShort );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(748,32);to=(762,0)]
                    out.write(" item: arrayOrCollection) { \n        %]]\n             <li>[[%= item %]]</li>\n        [[%\n            }\n       %]]\n      </ol>\n       [[%\n          }\n        }\n        %]]\n   </td>\n  </tr>\n  [[/jalios:if]]\n");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(762,0);to=(762,12)]
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
// HTML // begin [file="/do_Type_Diff.jsp";from=(762,12);to=(765,0)]
    out.write("\n\n\n");

// end
// HTML // begin [file="/do_Type_Diff.jsp";from=(765,68);to=(766,0)]
    out.write("\n");

// end
// begin [file="/do_Type_Diff.jsp";from=(766,0);to=(766,73)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_26 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_26.setPageContext(pageContext);
    _jspx_th_jalios_if_26.setParent(_jspx_th_jalios_select_0);
    _jspx_th_jalios_if_26.setPredicate( !isTypeScalar && editor.equals("duration") );
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
                // HTML // begin [file="/do_Type_Diff.jsp";from=(766,73);to=(767,60)]
                    out.write("\n  [[jalios:if predicate='[[%= !Util.isSameContent(newObj.get");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(767,63);to=(767,72)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(767,74);to=(767,88)]
                    out.write("(), oldObj.get");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(767,91);to=(767,100)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(767,102);to=(770,24)]
                    out.write("()) %]]']]\n  <tr class=\"vTop\">\n    <td class=\"text-right\">[[%= fieldCount++ %]].</td>\n    <td nowrap=\"nowrap\">");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(770,27);to=(770,34)]
                    out.print( label );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(770,36);to=(774,10)]
                    out.write("</td>\n    <td>\n        [[% \n        { \n          ");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(774,13);to=(774,19)]
                    out.print( type );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(774,21);to=(774,52)]
                    out.write(" arrayOrCollection = newObj.get");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(774,55);to=(774,64)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(774,66);to=(779,16)]
                    out.write("(); \n          if (Util.notEmpty(arrayOrCollection)) {\n        %]]\n      <ol>\n       [[%\n            for(");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(779,19);to=(779,30)]
                    out.print( typeShort );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(779,32);to=(781,53)]
                    out.write(" item: arrayOrCollection) { \n        %]]\n             <li>[[jalios:duration time='[[%= item * ");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(781,56);to=(781,76)]
                    out.print( durationResolution );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(781,78);to=(794,10)]
                    out.write(" %]]'/]]</li>\n        [[%\n            }\n       %]]\n      </ol>\n       [[%\n          }\n        }\n        %]]\n    </td>\n    <td>\n        [[% \n        { \n          ");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(794,13);to=(794,19)]
                    out.print( type );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(794,21);to=(794,52)]
                    out.write(" arrayOrCollection = oldObj.get");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(794,55);to=(794,64)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(794,66);to=(799,16)]
                    out.write("(); \n          if (Util.notEmpty(arrayOrCollection)) {\n        %]]\n      <ol>\n       [[%\n            for(");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(799,19);to=(799,30)]
                    out.print( typeShort );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(799,32);to=(801,53)]
                    out.write(" item: arrayOrCollection) { \n        %]]\n             <li>[[jalios:duration time='[[%= item * ");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(801,56);to=(801,76)]
                    out.print( durationResolution );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(801,78);to=(813,0)]
                    out.write(" %]]'/]]</li>\n        [[%\n            }\n       %]]\n      </ol>\n       [[%\n          }\n        }\n        %]]\n   </td>\n  </tr>\n  [[/jalios:if]]\n");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(813,0);to=(813,12)]
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
// HTML // begin [file="/do_Type_Diff.jsp";from=(813,12);to=(815,0)]
    out.write("\n\n");

// end
// HTML // begin [file="/do_Type_Diff.jsp";from=(815,64);to=(816,0)]
    out.write("\n");

// end
// begin [file="/do_Type_Diff.jsp";from=(816,0);to=(816,69)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_27 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_27.setPageContext(pageContext);
    _jspx_th_jalios_if_27.setParent(_jspx_th_jalios_select_0);
    _jspx_th_jalios_if_27.setPredicate( !isTypeScalar && editor.equals("date") );
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
                // HTML // begin [file="/do_Type_Diff.jsp";from=(816,69);to=(817,60)]
                    out.write("\n  [[jalios:if predicate='[[%= !Util.isSameContent(newObj.get");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(817,63);to=(817,72)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(817,74);to=(817,88)]
                    out.write("(), oldObj.get");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(817,91);to=(817,100)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(817,102);to=(820,24)]
                    out.write("()) %]]']]\n  <tr class=\"vTop\">\n    <td class=\"text-right\">[[%= fieldCount++ %]].</td>\n    <td nowrap=\"nowrap\">");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(820,27);to=(820,34)]
                    out.print( label );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(820,36);to=(824,10)]
                    out.write("</td>\n    <td>\n        [[% \n        { \n          ");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(824,13);to=(824,19)]
                    out.print( type );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(824,21);to=(824,52)]
                    out.write(" arrayOrCollection = newObj.get");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(824,55);to=(824,64)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(824,66);to=(829,16)]
                    out.write("(); \n          if (Util.notEmpty(arrayOrCollection)) {\n        %]]\n      <ol>\n       [[%\n            for(");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(829,19);to=(829,30)]
                    out.print( typeShort );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(829,32);to=(844,10)]
                    out.write(" item: arrayOrCollection) { \n        %]]\n             <li>[[jalios:date date='[[%= item %]]' /]] [[jalios:time date='[[%= item %]]' /]]</li>\n        [[%\n            }\n       %]]\n      </ol>\n       [[%\n          }\n        }\n        %]]\n    </td>\n    <td>\n        [[% \n        { \n          ");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(844,13);to=(844,19)]
                    out.print( type );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(844,21);to=(844,52)]
                    out.write(" arrayOrCollection = oldObj.get");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(844,55);to=(844,64)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(844,66);to=(849,16)]
                    out.write("(); \n          if (Util.notEmpty(arrayOrCollection)) {\n        %]]\n      <ol>\n       [[%\n            for(");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(849,19);to=(849,30)]
                    out.print( typeShort );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(849,32);to=(863,0)]
                    out.write(" item: arrayOrCollection) { \n        %]]\n             <li>[[jalios:date date='[[%= item %]]' /]] [[jalios:time date='[[%= item %]]' /]]</li>\n        [[%\n            }\n       %]]\n      </ol>\n       [[%\n          }\n        }\n        %]]\n   </td>\n  [[/jalios:if]]\n  </tr>\n");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(863,0);to=(863,12)]
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
// HTML // begin [file="/do_Type_Diff.jsp";from=(863,12);to=(864,0)]
    out.write("\n");

// end
// HTML // begin [file="/do_Type_Diff.jsp";from=(864,64);to=(865,0)]
    out.write("\n");

// end
// begin [file="/do_Type_Diff.jsp";from=(865,0);to=(865,56)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_28 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_28.setPageContext(pageContext);
    _jspx_th_jalios_if_28.setParent(_jspx_th_jalios_select_0);
    _jspx_th_jalios_if_28.setPredicate( editor.equals("category") );
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
                // HTML // begin [file="/do_Type_Diff.jsp";from=(865,56);to=(866,60)]
                    out.write("\n  [[jalios:if predicate='[[%= !Util.isSameContent(newObj.get");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(866,63);to=(866,72)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(866,74);to=(866,100)]
                    out.write("(loggedMember), oldObj.get");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(866,103);to=(866,112)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(866,114);to=(869,24)]
                    out.write("(loggedMember)) %]]']]\n  <tr class=\"vTop\">\n    <td class=\"text-right\">[[%= fieldCount++ %]].</td>\n    <td nowrap=\"nowrap\">");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(869,27);to=(869,34)]
                    out.print( label );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(869,36);to=(871,38)]
                    out.write("</td>\n    <td>\n      [[% if (Util.notEmpty(newObj.get");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(871,41);to=(871,50)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(871,52);to=(873,52)]
                    out.write("(loggedMember))) { %]]\n      <ol>\n        [[jalios:foreach collection=\"[[%= newObj.get");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(873,55);to=(873,64)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(873,66);to=(874,93)]
                    out.write("(loggedMember) %]]\" type=\"Category\" name=\"itCategory\" ]]\n        <li>[[%= itCategory == null ? \"\" : itCategory.getAncestorString(channel.getCategory(\"");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(874,96);to=(874,107)]
                    out.print( rootCatId );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(874,109);to=(880,38)]
                    out.write("\"), \" > \", true) %]]</li>\n        [[/jalios:foreach]]\n      </ol>\n      [[% } %]]\n    </td>\n    <td>\n      [[% if (Util.notEmpty(oldObj.get");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(880,41);to=(880,50)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(880,52);to=(882,52)]
                    out.write("(loggedMember))) { %]]\n      <ol>\n        [[jalios:foreach collection=\"[[%= oldObj.get");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(882,55);to=(882,64)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(882,66);to=(883,93)]
                    out.write("(loggedMember) %]]\" type=\"Category\" name=\"itCategory\" ]]\n        <li>[[%= itCategory == null ? \"\" : itCategory.getAncestorString(channel.getCategory(\"");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(883,96);to=(883,107)]
                    out.print( rootCatId );
                // end
                // HTML // begin [file="/do_Type_Diff.jsp";from=(883,109);to=(890,0)]
                    out.write("\"), \" > \", true) %]]</li>\n        [[/jalios:foreach]]\n      </ol>\n      [[% } %]]\n    </td>\n  </tr>\n  [[/jalios:if]]\n");

                // end
                // begin [file="/do_Type_Diff.jsp";from=(890,0);to=(890,12)]
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
// HTML // begin [file="/do_Type_Diff.jsp";from=(890,12);to=(891,0)]
    out.write("\n");

// end
// begin [file="/do_Type_Diff.jsp";from=(891,0);to=(891,16)]
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
// HTML // begin [file="/do_Type_Diff.jsp";from=(891,16);to=(892,0)]
    out.write("\n");

// end
// begin [file="/do_Type_Diff.jsp";from=(892,2);to=(892,5)]
     } 
// end
// HTML // begin [file="/do_Type_Diff.jsp";from=(892,7);to=(893,0)]
    out.write("\n");

// end
// begin [file="/do_Type_Diff.jsp";from=(893,0);to=(893,17)]
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
// HTML // begin [file="/do_Type_Diff.jsp";from=(893,17);to=(895,0)]
    out.write("\n\n");

// end
// HTML // begin [file="/do_Type_Diff.jsp";from=(895,71);to=(896,0)]
    out.write("\n");

// end
// begin [file="/do_Type_Diff.jsp";from=(896,2);to=(896,26)]
     if (!isFileDocument) { 
// end
// HTML // begin [file="/do_Type_Diff.jsp";from=(896,28);to=(913,0)]
    out.write("\n[[% if (!isSuperTypeIncluded) { \n  ServletUtil.backupAttribute(pageContext, \"fieldCount\");\n  request.setAttribute(\"fieldCount\", new Integer(fieldCount));\n%]]  \n[[jsp:include page=\"/work/doCommonPubDiff.jsp\"/]]\n[[% \n  {\n    Integer superFieldCount = (Integer)request.getAttribute(\"fieldCount\");\n    if (superFieldCount != null) {\n      fieldCount = superFieldCount.intValue();\n    }\n  }\n  ServletUtil.restoreAttribute(pageContext, \"fieldCount\");\n } else {\n     request.setAttribute(\"fieldCount\", new Integer(fieldCount));\n } %]]\n");

// end
// begin [file="/do_Type_Diff.jsp";from=(913,2);to=(913,5)]
     } 
// end
// HTML // begin [file="/do_Type_Diff.jsp";from=(913,7);to=(915,0)]
    out.write("\n[[% } %]]\n");

// end
// begin [file="/do_Type_Diff.jsp";from=(915,2);to=(915,16)]
     out.flush(); 
// end
// HTML // begin [file="/do_Type_Diff.jsp";from=(915,18);to=(916,0)]
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
