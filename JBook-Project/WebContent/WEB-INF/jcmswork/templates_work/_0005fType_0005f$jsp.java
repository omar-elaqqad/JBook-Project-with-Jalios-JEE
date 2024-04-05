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


public class _0005fType_0005f$jsp extends HttpJspBase {


    static {
    }
    public _0005fType_0005f$jsp( ) {
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

            // HTML // begin [file="/_Type_.jsp";from=(0,50);to=(1,0)]
                out.write("\n");

            // end
            // HTML // begin [file="/_Type_.jsp";from=(1,41);to=(2,0)]
                out.write("\n");

            // end
            // HTML // begin [file="/_Type_.jsp";from=(2,44);to=(3,0)]
                out.write("\n");

            // end
            // HTML // begin [file="/_Type_.jsp";from=(3,118);to=(4,0)]
                out.write("\n");

            // end
            // begin [file="/_Type_.jsp";from=(4,2);to=(240,0)]
                
                  request.setCharacterEncoding("UTF-8");
                  
                final Channel channel = Channel.getChannel();
                
                Element typeElt = (Element)session.getAttribute("typeElt");
                
                final String className;
                final String superclass;
                final boolean isAbstract;
                final boolean isPublicationType;
                final boolean isAudienced;
                final boolean isSubType;
                final boolean isDBType;
                final boolean isHistorizedDBData;
                final boolean openRoleDBData;
                boolean isCategorizedDBData;
                
                Element parentElt = null;
                if (typeElt == null) { // Data Extension
                  typeElt = (Element)session.getAttribute("extensionElt");
                  String extendedType = typeElt.getAttributeValue("type");
                  className = Util.getClassShortName(extendedType) + "Extension";
                  superclass = Util.getString(typeElt.getAttributeValue("superclass"), session.getAttribute("extensionElt") == null ? com.jalios.jcms.Content.class.getName() : DataExtension.class.getName());
                  isAbstract = false;
                  isPublicationType = false;
                  isAudienced = false;
                  isSubType = false;
                  isDBType = false;
                  isHistorizedDBData = false;
                  isCategorizedDBData = false;
                  openRoleDBData = false;
                } else { // Publication
                  className = typeElt.getAttributeValue("name");
                  superclass = Util.getString(typeElt.getAttributeValue("superclass"), com.jalios.jcms.Content.class.getName());
                  isAbstract = Util.toBoolean(typeElt.getAttributeValue("abstract"),false);
                  isPublicationType = true;
                  isAudienced = Util.toBoolean(typeElt.getAttributeValue("audienced"),false);
                  isSubType = !(com.jalios.jcms.Content.class.getName().equals(superclass) || 
                                com.jalios.jcms.Form.class.getName().equals(superclass) ||
                                com.jalios.jcms.portlet.Portlet.class.getName().equals(superclass));
                  isDBType = Util.toBoolean(typeElt.getAttributeValue("database"),false);
                  isHistorizedDBData = isDBType && Util.toBoolean(typeElt.getAttributeValue("revision"),false);
                  isCategorizedDBData = isDBType && TypeUtil.isSubTypeOf(typeElt, com.jalios.jcms.Content.class);
                  openRoleDBData = Util.toBoolean(typeElt.getAttributeValue("openRole"), false);
                  parentElt = typeElt.getParentElement();
                }
                
                List<TypeFieldEntry> fieldEntryList = Arrays.asList(channel.getTypeFieldEntries(TypeProcessor.PACKAGE_NAME + "." + className));
                List<TypeFieldEntry> allFieldEntryList = Arrays.asList(channel.getAllTypeFieldEntries(TypeProcessor.PACKAGE_NAME + "." + className));
                
                String[] customInterfaces = Util.split(Util.getString(typeElt.getAttributeValue("interfaces"), ""), ", ");
                
                // Find out searchable fields
                Set<String> searchableFieldSet = new TreeSet<>();
                Set<String> searchableFieldMLSet = new TreeSet<>();
                Set<String> searchableArrayFieldSet = new TreeSet<>();
                Set<String> searchableArrayFieldMLSet = new TreeSet<>();
                Set<String> searchableListFieldSet = new TreeSet<>();
                Set<String> searchableListFieldMLSet = new TreeSet<>();
                if (isPublicationType) {
                  Element titleElt = typeElt.getChild("title");
                  Attribute titleSearchable = titleElt.getAttribute("searchable");
                  Attribute titleML = titleElt.getAttribute("ml");
                  if (titleSearchable == null || titleSearchable.getBooleanValue()) {
                    if (titleML != null && titleML.getBooleanValue()) {
                      searchableFieldMLSet.add("title");
                    } else {
                      searchableFieldSet.add("title");
                    }
                  } 
                }
                
                Set<String> wikiFieldSet = new TreeSet<>();
                Set<String> wikiFieldMLSet = new TreeSet<>();
                Set<String> wikiArrayFieldSet = new TreeSet<>();
                Set<String> wikiArrayFieldMLSet = new TreeSet<>();
                Set<String> wikiListFieldSet = new TreeSet<>();
                Set<String> wikiListFieldMLSet = new TreeSet<>();
                
                Set<String> wysiwygFieldSet = new TreeSet<>();
                Set<String> wysiwygFieldMLSet = new TreeSet<>();
                Set<String> wysiwygArrayFieldSet = new TreeSet<>();
                Set<String> wysiwygArrayFieldMLSet = new TreeSet<>();
                Set<String> wysiwygListFieldSet = new TreeSet<>();
                Set<String> wysiwygListFieldMLSet = new TreeSet<>();
                
                Set<String> urlFieldSet = new TreeSet<>();
                Set<String> urlFieldMLSet = new TreeSet<>();
                Set<String> urlArrayFieldSet = new TreeSet<>();
                Set<String> urlArrayFieldMLSet = new TreeSet<>();
                
                
                Set requiredFieldNameSet = new TreeSet();
                List declaredFieldEntryList = new ArrayList();
                List categoryFieldEntryList = new ArrayList();
                List sqlresultFieldEntryList = new ArrayList();
                List<TypeFieldEntry> hybridCollectionList = new ArrayList();
                for(Iterator it = fieldEntryList.iterator(); it.hasNext();) {
                  TypeFieldEntry fieldEntry = (TypeFieldEntry)it.next();
                  if (fieldEntry.isSuper()) {
                    continue;
                  }
                  
                  String name = fieldEntry.getName();
                  String editor = fieldEntry.getEditor();
                  String type = fieldEntry.getType();
                  
                  if (fieldEntry.isRequired()) {
                    requiredFieldNameSet.add(name);
                  }
                  if (isPublicationType && "category".equals(editor)) {
                    categoryFieldEntryList.add(fieldEntry);
                  }
                  else if ("sqlresult".equals(editor)) {
                    sqlresultFieldEntryList.add(fieldEntry);
                  }
                  else {
                    declaredFieldEntryList.add(fieldEntry);
                    
                    if (fieldEntry.isSearchable()) {
                      if (type.equals("String")) {
                        if (fieldEntry.isFieldML()) searchableFieldMLSet.add(name);
                        else searchableFieldSet.add(name);
                      } else if (type.equals("String[]")) {
                        if (fieldEntry.isFieldML()) searchableArrayFieldMLSet.add(name);
                        else searchableArrayFieldSet.add(name);
                      } else if (type.equals("List<String>")) {
                        if (fieldEntry.isFieldML()) searchableListFieldMLSet.add(name);
                        else searchableListFieldSet.add(name);
                      }
                    }
                    if (fieldEntry.isFieldWiki()) {
                      if (type.equals("String")) {
                        if (fieldEntry.isFieldML()) wikiFieldMLSet.add(name);
                        else wikiFieldSet.add(name); 
                      } else if (type.equals("String[]")) {
                        if (fieldEntry.isFieldML()) wikiArrayFieldMLSet.add(name);
                        else wikiArrayFieldSet.add(name); 
                      } else if (type.equals("List<String>")) {
                        if (fieldEntry.isFieldML()) wikiListFieldMLSet.add(name);
                        else wikiListFieldSet.add(name); 
                      }
                    }
                    if (fieldEntry.isWysiwyg()) {
                      if (type.equals("String")) {
                        if (fieldEntry.isFieldML()) wysiwygFieldMLSet.add(name);
                        else wysiwygFieldSet.add(name); 
                      } else if (type.equals("String[]")) {
                        if (fieldEntry.isFieldML()) wysiwygArrayFieldMLSet.add(name);
                        else wysiwygArrayFieldSet.add(name); 
                      } else if (type.equals("List<String>")) {
                        if (fieldEntry.isFieldML()) wysiwygListFieldMLSet.add(name);
                        else wysiwygListFieldSet.add(name); 
                      }
                    }
                    if (fieldEntry.isUrl()) {
                      if (type.equals("String")) {
                        if (fieldEntry.isFieldML()) urlFieldMLSet.add(name);
                        else urlFieldSet.add(name); 
                      } else if (type.equals("String[]")) {
                        if (fieldEntry.isFieldML()) urlArrayFieldMLSet.add(name);
                        else urlArrayFieldSet.add(name); 
                      }
                    }
                  }
                  
                  if (!isDBType) {
                    boolean isLink = editor.startsWith("member") || (editor.startsWith("link") && TypeUtil.isDBType(parentElt, fieldEntry.getTypeShort()));
                    if (fieldEntry.isTypeArray() && isLink) {
                      hybridCollectionList.add(fieldEntry);
                    }
                  }
                  
                }
                
                boolean hasUrlField = Util.notEmpty(urlFieldSet) || 
                                      Util.notEmpty(urlFieldMLSet) ||
                                      Util.notEmpty(urlArrayFieldSet) ||
                                      Util.notEmpty(urlArrayFieldMLSet);
                
                // LinkSet (used to generate getLinkDataSet())
                TreeSet linkSet = new TreeSet();
                for(Iterator it = allFieldEntryList.iterator(); it.hasNext();) {
                  TypeFieldEntry fieldEntry = (TypeFieldEntry) it.next();
                  if (fieldEntry.isSuper()) {
                    continue;
                  }
                
                  String editor   = fieldEntry.getEditor();
                  boolean fiedlML = fieldEntry.isFieldML();
                  if (editor.equals("link")   || editor.equals("member")   || editor.equals("group") || 
                      editor.equals("link[]") || editor.equals("member[]") || editor.equals("group[]")) {
                    linkSet.add("get" + fieldEntry.getNameCap() + "()");
                    if (fiedlML) {
                      linkSet.add("get" + fieldEntry.getNameCap() + "ML" + "()");
                    }
                  }
                  
                  if (isDBType && editor.equals("category")) {
                    isCategorizedDBData = true;
                  }
                }
                
                // TreeNode
                Element treeParentField = XmlUtil.searchChild(typeElt.getChild(TypeConstants.FIELDS_ELT), TypeConstants.FIELD_ELT, "parent", "true");
                String treeParentTypeName = treeParentField == null ? null : treeParentField.getAttributeValue("type");
                String treeParentFieldName = treeParentField != null ? treeParentField.getAttributeValue("name") : null;
                
                Element treeChildType = TypeUtil.getTreeChildType(typeElt);
                String treeChildTypeName = null;
                String treeChildFieldName = "parent"; // arbitrary default value
                if (treeChildType != null) {
                  treeChildTypeName = treeChildType.getAttributeValue("name");
                  Element treeChildField = XmlUtil.searchChild(treeChildType.getChild(TypeConstants.FIELDS_ELT), TypeConstants.FIELD_ELT, "parent", "true");
                  if (treeChildField != null) {
                    treeChildFieldName = treeChildField.getAttributeValue("name");
                  }
                } 
                else if ((treeParentTypeName != null) && !treeParentTypeName.startsWith("generated")) { 
                  treeChildTypeName = treeParentTypeName;
                }
                
                
                
                boolean isTreeNode = treeChildTypeName != null || treeParentField != null;
                
                boolean hasDBDataCollection = false;
                if (isDBType) {
                  for(TypeFieldEntry entry: fieldEntryList) {
                    if (entry.isTypeCollection()) {
                      hasDBDataCollection = true;
                      break;
                    }
                  }
                }
            // end
            // HTML // begin [file="/_Type_.jsp";from=(240,2);to=(243,8)]
                out.write("\n// This file has been automatically generated.\n   \npackage ");

            // end
            // begin [file="/_Type_.jsp";from=(243,11);to=(243,39)]
                out.print( TypeProcessor.PACKAGE_NAME );
            // end
            // HTML // begin [file="/_Type_.jsp";from=(243,41);to=(261,7)]
                out.write(";\n \nimport java.util.*;\n \nimport org.apache.oro.text.regex.Pattern;\nimport org.apache.oro.text.regex.Perl5Compiler;\nimport org.apache.oro.text.regex.Perl5Matcher;\nimport org.hibernate.Hibernate;\n \nimport com.jalios.jcms.*;\nimport com.jalios.jcms.db.*;\nimport com.jalios.jcms.mashup.*;\nimport com.jalios.jcms.wysiwyg.*;\nimport com.jalios.util.*;\nimport com.fasterxml.jackson.annotation.JsonIgnore; \nimport com.fasterxml.jackson.annotation.JsonProperty;\n \n@SuppressWarnings({\"unchecked\", \"unused\"})\npublic ");

            // end
            // begin [file="/_Type_.jsp";from=(261,10);to=(261,40)]
                out.print( isAbstract ? "abstract" : "" );
            // end
            // HTML // begin [file="/_Type_.jsp";from=(261,42);to=(261,49)]
                out.write(" class ");

            // end
            // begin [file="/_Type_.jsp";from=(261,52);to=(261,63)]
                out.print( className );
            // end
            // HTML // begin [file="/_Type_.jsp";from=(261,65);to=(261,74)]
                out.write(" extends ");

            // end
            // begin [file="/_Type_.jsp";from=(261,77);to=(261,89)]
                out.print( superclass );
            // end
            // HTML // begin [file="/_Type_.jsp";from=(261,91);to=(262,0)]
                out.write(" \n");

            // end
            // begin [file="/_Type_.jsp";from=(262,2);to=(262,92)]
                 if (isPublicationType || isTreeNode || Util.notEmpty(customInterfaces) || isAudienced) { 
            // end
            // HTML // begin [file="/_Type_.jsp";from=(262,94);to=(264,0)]
                out.write("\n             implements \n");

            // end
            // begin [file="/_Type_.jsp";from=(264,2);to=(264,29)]
                 boolean addComma = false; 
            // end
            // HTML // begin [file="/_Type_.jsp";from=(264,31);to=(265,0)]
                out.write("\n");

            // end
            // begin [file="/_Type_.jsp";from=(265,0);to=(265,81)]
                /* ----  jalios:foreach ---- */
                com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_0 = new com.jalios.jtaglib.ForeachTag();
                _jspx_th_jalios_foreach_0.setPageContext(pageContext);
                _jspx_th_jalios_foreach_0.setParent(null);
                _jspx_th_jalios_foreach_0.setArray( customInterfaces );
                _jspx_th_jalios_foreach_0.setType("String");
                _jspx_th_jalios_foreach_0.setName("itInterface");
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
                              String itInterface = null;
                              itInterface = (String) pageContext.findAttribute("itInterface");
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(265,81);to=(266,15)]
                              out.write("\n               ");

                          // end
                          // begin [file="/_Type_.jsp";from=(266,18);to=(266,39)]
                              out.print( addComma ? "," : "" );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(266,41);to=(266,42)]
                              out.write(" ");

                          // end
                          // begin [file="/_Type_.jsp";from=(266,45);to=(266,58)]
                              out.print( itInterface );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(266,60);to=(267,0)]
                              out.write("\n");

                          // end
                          // begin [file="/_Type_.jsp";from=(267,2);to=(267,20)]
                               addComma = true; 
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(267,22);to=(268,0)]
                              out.write("\n");

                          // end
                          // begin [file="/_Type_.jsp";from=(268,0);to=(268,17)]
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
          // HTML // begin [file="/_Type_.jsp";from=(268,17);to=(269,0)]
              out.write("\n");

          // end
          // begin [file="/_Type_.jsp";from=(269,0);to=(269,48)]
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
                          // HTML // begin [file="/_Type_.jsp";from=(269,48);to=(270,15)]
                              out.write("\n               ");

                          // end
                          // begin [file="/_Type_.jsp";from=(270,18);to=(270,39)]
                              out.print( addComma ? "," : "" );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(270,41);to=(271,0)]
                              out.write(" com.jalios.jstore.Searchable\n");

                          // end
                          // begin [file="/_Type_.jsp";from=(271,2);to=(271,20)]
                               addComma = true; 
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(271,22);to=(272,0)]
                              out.write("\n");

                          // end
                          // begin [file="/_Type_.jsp";from=(272,0);to=(272,12)]
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
          // HTML // begin [file="/_Type_.jsp";from=(272,12);to=(273,0)]
              out.write("\n");

          // end
          // begin [file="/_Type_.jsp";from=(273,0);to=(273,41)]
              /* ----  jalios:if ---- */
              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_1 = new com.jalios.jtaglib.IfTag();
              _jspx_th_jalios_if_1.setPageContext(pageContext);
              _jspx_th_jalios_if_1.setParent(null);
              _jspx_th_jalios_if_1.setPredicate( isTreeNode );
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
                          // HTML // begin [file="/_Type_.jsp";from=(273,41);to=(274,15)]
                              out.write("\n               ");

                          // end
                          // begin [file="/_Type_.jsp";from=(274,18);to=(274,39)]
                              out.print( addComma ? "," : "" );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(274,41);to=(275,0)]
                              out.write(" TreeNode\n");

                          // end
                          // begin [file="/_Type_.jsp";from=(275,2);to=(275,20)]
                               addComma = true; 
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(275,22);to=(276,0)]
                              out.write("\n");

                          // end
                          // begin [file="/_Type_.jsp";from=(276,0);to=(276,12)]
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
          // HTML // begin [file="/_Type_.jsp";from=(276,12);to=(277,0)]
              out.write("\n");

          // end
          // begin [file="/_Type_.jsp";from=(277,0);to=(277,42)]
              /* ----  jalios:if ---- */
              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_2 = new com.jalios.jtaglib.IfTag();
              _jspx_th_jalios_if_2.setPageContext(pageContext);
              _jspx_th_jalios_if_2.setParent(null);
              _jspx_th_jalios_if_2.setPredicate( isAudienced );
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
                          // HTML // begin [file="/_Type_.jsp";from=(277,42);to=(278,15)]
                              out.write("\n               ");

                          // end
                          // begin [file="/_Type_.jsp";from=(278,18);to=(278,39)]
                              out.print( addComma ? "," : "" );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(278,41);to=(279,0)]
                              out.write(" AudiencedPublication\n");

                          // end
                          // begin [file="/_Type_.jsp";from=(279,2);to=(279,20)]
                               addComma = true; 
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(279,22);to=(280,0)]
                              out.write("\n");

                          // end
                          // begin [file="/_Type_.jsp";from=(280,0);to=(280,12)]
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
          // HTML // begin [file="/_Type_.jsp";from=(280,12);to=(281,0)]
              out.write("\n");

          // end
          // begin [file="/_Type_.jsp";from=(281,0);to=(281,39)]
              /* ----  jalios:if ---- */
              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_3 = new com.jalios.jtaglib.IfTag();
              _jspx_th_jalios_if_3.setPageContext(pageContext);
              _jspx_th_jalios_if_3.setParent(null);
              _jspx_th_jalios_if_3.setPredicate( isDBType );
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
                          // HTML // begin [file="/_Type_.jsp";from=(281,39);to=(282,15)]
                              out.write("\n               ");

                          // end
                          // begin [file="/_Type_.jsp";from=(282,18);to=(282,39)]
                              out.print( addComma ? "," : "" );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(282,41);to=(283,0)]
                              out.write(" DBData\n");

                          // end
                          // begin [file="/_Type_.jsp";from=(283,2);to=(283,20)]
                               addComma = true; 
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(283,22);to=(284,0)]
                              out.write("\n");

                          // end
                          // begin [file="/_Type_.jsp";from=(284,0);to=(284,12)]
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
          // HTML // begin [file="/_Type_.jsp";from=(284,12);to=(285,0)]
              out.write("\n");

          // end
          // begin [file="/_Type_.jsp";from=(285,0);to=(285,49)]
              /* ----  jalios:if ---- */
              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_4 = new com.jalios.jtaglib.IfTag();
              _jspx_th_jalios_if_4.setPageContext(pageContext);
              _jspx_th_jalios_if_4.setParent(null);
              _jspx_th_jalios_if_4.setPredicate( isHistorizedDBData );
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
                          // HTML // begin [file="/_Type_.jsp";from=(285,49);to=(286,15)]
                              out.write("\n               ");

                          // end
                          // begin [file="/_Type_.jsp";from=(286,18);to=(286,39)]
                              out.print( addComma ? "," : "" );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(286,41);to=(287,0)]
                              out.write(" HistorizedDBData\n");

                          // end
                          // begin [file="/_Type_.jsp";from=(287,2);to=(287,20)]
                               addComma = true; 
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(287,22);to=(288,0)]
                              out.write("\n");

                          // end
                          // begin [file="/_Type_.jsp";from=(288,0);to=(288,12)]
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
          // HTML // begin [file="/_Type_.jsp";from=(288,12);to=(289,0)]
              out.write("\n");

          // end
          // begin [file="/_Type_.jsp";from=(289,0);to=(289,50)]
              /* ----  jalios:if ---- */
              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_5 = new com.jalios.jtaglib.IfTag();
              _jspx_th_jalios_if_5.setPageContext(pageContext);
              _jspx_th_jalios_if_5.setParent(null);
              _jspx_th_jalios_if_5.setPredicate( isCategorizedDBData );
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
                          // HTML // begin [file="/_Type_.jsp";from=(289,50);to=(290,15)]
                              out.write("\n               ");

                          // end
                          // begin [file="/_Type_.jsp";from=(290,18);to=(290,39)]
                              out.print( addComma ? "," : "" );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(290,41);to=(291,0)]
                              out.write(" CategorizedDBData\n");

                          // end
                          // begin [file="/_Type_.jsp";from=(291,2);to=(291,20)]
                               addComma = true; 
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(291,22);to=(292,0)]
                              out.write("\n");

                          // end
                          // begin [file="/_Type_.jsp";from=(292,0);to=(292,12)]
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
          // HTML // begin [file="/_Type_.jsp";from=(292,12);to=(293,0)]
              out.write("\n");

          // end
          // begin [file="/_Type_.jsp";from=(293,0);to=(293,45)]
              /* ----  jalios:if ---- */
              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_6 = new com.jalios.jtaglib.IfTag();
              _jspx_th_jalios_if_6.setPageContext(pageContext);
              _jspx_th_jalios_if_6.setParent(null);
              _jspx_th_jalios_if_6.setPredicate( openRoleDBData );
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
                          // HTML // begin [file="/_Type_.jsp";from=(293,45);to=(294,15)]
                              out.write("\n               ");

                          // end
                          // begin [file="/_Type_.jsp";from=(294,18);to=(294,39)]
                              out.print( addComma ? "," : "" );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(294,41);to=(295,0)]
                              out.write(" OpenRoleDBData\n");

                          // end
                          // begin [file="/_Type_.jsp";from=(295,2);to=(295,20)]
                               addComma = true; 
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(295,22);to=(296,0)]
                              out.write("\n");

                          // end
                          // begin [file="/_Type_.jsp";from=(296,0);to=(296,12)]
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
          // HTML // begin [file="/_Type_.jsp";from=(296,12);to=(298,0)]
              out.write("\n\n");

          // end
          // begin [file="/_Type_.jsp";from=(298,2);to=(298,6)]
                } 
          // end
          // HTML // begin [file="/_Type_.jsp";from=(298,8);to=(301,0)]
              out.write("\n{\n  \n");

          // end
          // HTML // begin [file="/_Type_.jsp";from=(301,58);to=(305,9)]
              out.write("\n  // ----------------------------------------------------------------------\n  // CONSTRUCTORS\n  // ----------------------------------------------------------------------  \n  public ");

          // end
          // begin [file="/_Type_.jsp";from=(305,12);to=(305,23)]
              out.print( className );
          // end
          // HTML // begin [file="/_Type_.jsp";from=(305,25);to=(307,0)]
              out.write("() {}\n \n");

          // end
          // begin [file="/_Type_.jsp";from=(307,2);to=(307,76)]
               if (TypeUtil.isSubTypeOf(typeElt, com.jalios.jcms.FileDocument.class)) { 
          // end
          // HTML // begin [file="/_Type_.jsp";from=(307,78);to=(308,9)]
              out.write("\n  public ");

          // end
          // begin [file="/_Type_.jsp";from=(308,12);to=(308,23)]
              out.print( className );
          // end
          // HTML // begin [file="/_Type_.jsp";from=(308,25);to=(311,0)]
              out.write("(FileDocument other) {\n    super(other);\n  }\n");

          // end
          // begin [file="/_Type_.jsp";from=(311,2);to=(311,5)]
               } 
          // end
          // HTML // begin [file="/_Type_.jsp";from=(311,7);to=(313,0)]
              out.write("\n \n");

          // end
          // begin [file="/_Type_.jsp";from=(313,2);to=(313,78)]
               if (TypeUtil.isSubTypeOf(typeElt, com.jalios.jcms.DBFileDocument.class)) { 
          // end
          // HTML // begin [file="/_Type_.jsp";from=(313,80);to=(314,9)]
              out.write("\n  public ");

          // end
          // begin [file="/_Type_.jsp";from=(314,12);to=(314,23)]
              out.print( className );
          // end
          // HTML // begin [file="/_Type_.jsp";from=(314,25);to=(317,0)]
              out.write("(DBFileDocument other) {\n    super(other);\n  }\n");

          // end
          // begin [file="/_Type_.jsp";from=(317,2);to=(317,5)]
               } 
          // end
          // HTML // begin [file="/_Type_.jsp";from=(317,7);to=(318,0)]
              out.write("\n");

          // end
          // begin [file="/_Type_.jsp";from=(318,2);to=(321,0)]
              
              List superEltList = TypeUtil.getSuperEltList(typeElt);
              Collections.reverse(superEltList);
          // end
          // HTML // begin [file="/_Type_.jsp";from=(321,2);to=(322,0)]
              out.write("\n");

          // end
          // begin [file="/_Type_.jsp";from=(322,0);to=(322,82)]
              /* ----  jalios:foreach ---- */
              com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_1 = new com.jalios.jtaglib.ForeachTag();
              _jspx_th_jalios_foreach_1.setPageContext(pageContext);
              _jspx_th_jalios_foreach_1.setParent(null);
              _jspx_th_jalios_foreach_1.setCollection( superEltList );
              _jspx_th_jalios_foreach_1.setType("Element");
              _jspx_th_jalios_foreach_1.setName("itSuperElt");
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
                              Element itSuperElt = null;
                              itSuperElt = (Element) pageContext.findAttribute("itSuperElt");
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(322,82);to=(323,9)]
                              out.write("\n  public ");

                          // end
                          // begin [file="/_Type_.jsp";from=(323,12);to=(323,23)]
                              out.print( className );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(323,25);to=(323,26)]
                              out.write("(");

                          // end
                          // begin [file="/_Type_.jsp";from=(323,29);to=(323,67)]
                              out.print( itSuperElt.getAttributeValue("name") );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(323,69);to=(326,0)]
                              out.write(" other) {\n    super(other);\n  }\n");

                          // end
                          // begin [file="/_Type_.jsp";from=(326,0);to=(326,17)]
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
          // HTML // begin [file="/_Type_.jsp";from=(326,17);to=(331,9)]
              out.write("\n \n  \n  \n  \n  public ");

          // end
          // begin [file="/_Type_.jsp";from=(331,12);to=(331,23)]
              out.print( className );
          // end
          // HTML // begin [file="/_Type_.jsp";from=(331,25);to=(331,26)]
              out.write("(");

          // end
          // begin [file="/_Type_.jsp";from=(331,29);to=(331,40)]
              out.print( className );
          // end
          // HTML // begin [file="/_Type_.jsp";from=(331,42);to=(333,0)]
              out.write(" other) {\n    super(other);\n");

          // end
          // begin [file="/_Type_.jsp";from=(333,0);to=(333,101)]
              /* ----  jalios:foreach ---- */
              com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_2 = new com.jalios.jtaglib.ForeachTag();
              _jspx_th_jalios_foreach_2.setPageContext(pageContext);
              _jspx_th_jalios_foreach_2.setParent(null);
              _jspx_th_jalios_foreach_2.setCollection( declaredFieldEntryList );
              _jspx_th_jalios_foreach_2.setName("itFieldEntry");
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
                              TypeFieldEntry itFieldEntry = null;
                              itFieldEntry = (TypeFieldEntry) pageContext.findAttribute("itFieldEntry");
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(333,101);to=(334,0)]
                              out.write("\n");

                          // end
                          // begin [file="/_Type_.jsp";from=(334,2);to=(334,41)]
                               String name = itFieldEntry.getName(); 
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(334,43);to=(335,4)]
                              out.write("\n    ");

                          // end
                          // begin [file="/_Type_.jsp";from=(335,7);to=(335,13)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(335,15);to=(335,24)]
                              out.write(" = other.");

                          // end
                          // begin [file="/_Type_.jsp";from=(335,27);to=(335,33)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(335,35);to=(336,0)]
                              out.write(";\n");

                          // end
                          // begin [file="/_Type_.jsp";from=(336,0);to=(336,55)]
                              /* ----  jalios:if ---- */
                              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_7 = new com.jalios.jtaglib.IfTag();
                              _jspx_th_jalios_if_7.setPageContext(pageContext);
                              _jspx_th_jalios_if_7.setParent(_jspx_th_jalios_foreach_2);
                              _jspx_th_jalios_if_7.setPredicate( itFieldEntry.isFieldML() );
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
                          // HTML // begin [file="/_Type_.jsp";from=(336,55);to=(337,4)]
                              out.write("\n    ");

                          // end
                          // begin [file="/_Type_.jsp";from=(337,7);to=(337,13)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(337,15);to=(337,26)]
                              out.write("ML = other.");

                          // end
                          // begin [file="/_Type_.jsp";from=(337,29);to=(337,35)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(337,37);to=(338,0)]
                              out.write("ML;\n");

                          // end
                          // begin [file="/_Type_.jsp";from=(338,0);to=(338,12)]
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
          // HTML // begin [file="/_Type_.jsp";from=(338,12);to=(339,0)]
              out.write("\n");

          // end
          // begin [file="/_Type_.jsp";from=(339,0);to=(339,40)]
              /* ----  jalios:if ---- */
              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_8 = new com.jalios.jtaglib.IfTag();
              _jspx_th_jalios_if_8.setPageContext(pageContext);
              _jspx_th_jalios_if_8.setParent(_jspx_th_jalios_foreach_2);
              _jspx_th_jalios_if_8.setPredicate( !isDBType );
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
                          // HTML // begin [file="/_Type_.jsp";from=(339,40);to=(340,0)]
                              out.write("\n");

                          // end
                          // begin [file="/_Type_.jsp";from=(340,2);to=(340,45)]
                               String editor = itFieldEntry.getEditor(); 
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(340,47);to=(341,0)]
                              out.write("\n");

                          // end
                          // begin [file="/_Type_.jsp";from=(341,2);to=(341,51)]
                               String typeShort = itFieldEntry.getTypeShort(); 
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(341,53);to=(342,0)]
                              out.write("\n");

                          // end
                          // begin [file="/_Type_.jsp";from=(342,0);to=(342,131)]
                              /* ----  jalios:if ---- */
                              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_9 = new com.jalios.jtaglib.IfTag();
                              _jspx_th_jalios_if_9.setPageContext(pageContext);
                              _jspx_th_jalios_if_9.setParent(_jspx_th_jalios_if_8);
                              _jspx_th_jalios_if_9.setPredicate( editor.startsWith("member") || (editor.startsWith("link") && TypeUtil.isDBType(parentElt, typeShort)));
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
                          // HTML // begin [file="/_Type_.jsp";from=(342,131);to=(343,4)]
                              out.write("\n    ");

                          // end
                          // begin [file="/_Type_.jsp";from=(343,7);to=(343,13)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(343,15);to=(343,28)]
                              out.write("DBID = other.");

                          // end
                          // begin [file="/_Type_.jsp";from=(343,31);to=(343,37)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(343,39);to=(344,0)]
                              out.write("DBID;\n");

                          // end
                          // begin [file="/_Type_.jsp";from=(344,0);to=(344,12)]
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
          // HTML // begin [file="/_Type_.jsp";from=(344,12);to=(345,0)]
              out.write("\n");

          // end
          // begin [file="/_Type_.jsp";from=(345,0);to=(345,12)]
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
// HTML // begin [file="/_Type_.jsp";from=(345,12);to=(346,0)]
    out.write("\n");

// end
// begin [file="/_Type_.jsp";from=(346,0);to=(346,17)]
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
// HTML // begin [file="/_Type_.jsp";from=(346,17);to=(349,0)]
    out.write("\n  }\n  \n");

// end
// HTML // begin [file="/_Type_.jsp";from=(349,62);to=(356,0)]
    out.write("\n  // ----------------------------------------------------------------------\n  // Import / Export\n  // ----------------------------------------------------------------------\n  public void importXml(org.jdom.Element elt, ImportOptions options) {\n    super.importXml(elt, options);\n    \n");

// end
// begin [file="/_Type_.jsp";from=(356,0);to=(356,101)]
    /* ----  jalios:foreach ---- */
    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_3 = new com.jalios.jtaglib.ForeachTag();
    _jspx_th_jalios_foreach_3.setPageContext(pageContext);
    _jspx_th_jalios_foreach_3.setParent(null);
    _jspx_th_jalios_foreach_3.setCollection( declaredFieldEntryList );
    _jspx_th_jalios_foreach_3.setName("itFieldEntry");
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
                    TypeFieldEntry itFieldEntry = null;
                    itFieldEntry = (TypeFieldEntry) pageContext.findAttribute("itFieldEntry");
                // end
                // HTML // begin [file="/_Type_.jsp";from=(356,101);to=(357,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(357,2);to=(370,0)]
                     
                    String name    = itFieldEntry.getName(); 
                    String nameCap = itFieldEntry.getNameCap();
                    String typeShort = itFieldEntry.getTypeShort();
                    boolean isTypeMV = itFieldEntry.isTypeMV();
                    
                    String mvType  = "Array";
                    if (itFieldEntry.isTypeList()) {
                      mvType = "List";
                    } 
                    else if (itFieldEntry.isTypeSet()) {
                      mvType = "Set";
                    }
                // end
                // HTML // begin [file="/_Type_.jsp";from=(370,2);to=(371,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(371,2);to=(371,99)]
                     if (itFieldEntry.isTypeString() && !itFieldEntry.isWysiwyg() && !itFieldEntry.isFieldWiki())  { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(371,101);to=(372,7)]
                    out.write("\n    set");

                // end
                // begin [file="/_Type_.jsp";from=(372,10);to=(372,19)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(372,21);to=(372,54)]
                    out.write("(ImportUtil.parseFieldText(elt, \"");

                // end
                // begin [file="/_Type_.jsp";from=(372,57);to=(372,63)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(372,65);to=(373,0)]
                    out.write("\"));\n");

                // end
                // begin [file="/_Type_.jsp";from=(373,2);to=(373,37)]
                       if (itFieldEntry.isFieldML()) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(373,39);to=(374,7)]
                    out.write("\n    set");

                // end
                // begin [file="/_Type_.jsp";from=(374,10);to=(374,19)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(374,21);to=(374,58)]
                    out.write("ML(ImportUtil.parseFieldTextML(elt, \"");

                // end
                // begin [file="/_Type_.jsp";from=(374,61);to=(374,67)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(374,69);to=(375,0)]
                    out.write("ML\"));\n");

                // end
                // begin [file="/_Type_.jsp";from=(375,2);to=(375,6)]
                       }
                // end
                // HTML // begin [file="/_Type_.jsp";from=(375,8);to=(376,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(376,2);to=(376,116)]
                     } else if (isTypeMV && "String".equals(typeShort) && !itFieldEntry.isWysiwyg() && !itFieldEntry.isFieldWiki()) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(376,118);to=(377,7)]
                    out.write("\n    set");

                // end
                // begin [file="/_Type_.jsp";from=(377,10);to=(377,19)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(377,21);to=(377,47)]
                    out.write("(ImportUtil.parseFieldText");

                // end
                // begin [file="/_Type_.jsp";from=(377,50);to=(377,58)]
                    out.print( mvType );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(377,60);to=(377,67)]
                    out.write("(elt, \"");

                // end
                // begin [file="/_Type_.jsp";from=(377,70);to=(377,76)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(377,78);to=(378,0)]
                    out.write("\"));\n");

                // end
                // begin [file="/_Type_.jsp";from=(378,2);to=(378,37)]
                       if (itFieldEntry.isFieldML()) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(378,39);to=(379,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(379,2);to=(379,40)]
                         if (itFieldEntry.isTypeList()) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(379,42);to=(380,7)]
                    out.write("\n    set");

                // end
                // begin [file="/_Type_.jsp";from=(380,10);to=(380,19)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(380,21);to=(380,62)]
                    out.write("ML(ImportUtil.parseFieldTextListML(elt, \"");

                // end
                // begin [file="/_Type_.jsp";from=(380,65);to=(380,71)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(380,73);to=(381,0)]
                    out.write("ML\"));\n");

                // end
                // begin [file="/_Type_.jsp";from=(381,2);to=(381,16)]
                         } else { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(381,18);to=(382,7)]
                    out.write("\n    set");

                // end
                // begin [file="/_Type_.jsp";from=(382,10);to=(382,19)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(382,21);to=(382,63)]
                    out.write("ML(ImportUtil.parseFieldTextArrayML(elt, \"");

                // end
                // begin [file="/_Type_.jsp";from=(382,66);to=(382,72)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(382,74);to=(383,0)]
                    out.write("ML\"));\n");

                // end
                // begin [file="/_Type_.jsp";from=(383,2);to=(383,9)]
                         } 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(383,11);to=(384,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(384,2);to=(384,7)]
                       } 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(384,9);to=(385,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(385,2);to=(385,43)]
                     } else if (itFieldEntry.isTypeDate()) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(385,45);to=(386,7)]
                    out.write("\n    set");

                // end
                // begin [file="/_Type_.jsp";from=(386,10);to=(386,19)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(386,21);to=(386,54)]
                    out.write("(ImportUtil.parseFieldDate(elt, \"");

                // end
                // begin [file="/_Type_.jsp";from=(386,57);to=(386,63)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(386,65);to=(387,0)]
                    out.write("\"));\n");

                // end
                // begin [file="/_Type_.jsp";from=(387,2);to=(387,64)]
                     } else if (isTypeMV && "java.util.Date".equals(typeShort)) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(387,66);to=(388,7)]
                    out.write("\n    set");

                // end
                // begin [file="/_Type_.jsp";from=(388,10);to=(388,19)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(388,21);to=(388,47)]
                    out.write("(ImportUtil.parseFieldDate");

                // end
                // begin [file="/_Type_.jsp";from=(388,50);to=(388,58)]
                    out.print( mvType );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(388,60);to=(388,67)]
                    out.write("(elt, \"");

                // end
                // begin [file="/_Type_.jsp";from=(388,70);to=(388,76)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(388,78);to=(389,0)]
                    out.write("\"));\n");

                // end
                // begin [file="/_Type_.jsp";from=(389,2);to=(389,43)]
                     } else if (itFieldEntry.isTypeLong()) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(389,45);to=(390,7)]
                    out.write("\n    set");

                // end
                // begin [file="/_Type_.jsp";from=(390,10);to=(390,19)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(390,21);to=(390,54)]
                    out.write("(ImportUtil.parseFieldLong(elt, \"");

                // end
                // begin [file="/_Type_.jsp";from=(390,57);to=(390,63)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(390,65);to=(391,0)]
                    out.write("\"));\n");

                // end
                // begin [file="/_Type_.jsp";from=(391,2);to=(391,91)]
                     } else if (isTypeMV &&  (itFieldEntry.isTypeLongArray() || "Long".equals(typeShort))) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(391,93);to=(392,7)]
                    out.write("\n    set");

                // end
                // begin [file="/_Type_.jsp";from=(392,10);to=(392,19)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(392,21);to=(392,47)]
                    out.write("(ImportUtil.parseFieldLong");

                // end
                // begin [file="/_Type_.jsp";from=(392,50);to=(392,58)]
                    out.print( mvType );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(392,60);to=(392,67)]
                    out.write("(elt, \"");

                // end
                // begin [file="/_Type_.jsp";from=(392,70);to=(392,76)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(392,78);to=(393,0)]
                    out.write("\"));\n");

                // end
                // begin [file="/_Type_.jsp";from=(393,2);to=(393,42)]
                     } else if (itFieldEntry.isTypeInt()) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(393,44);to=(394,7)]
                    out.write("\n    set");

                // end
                // begin [file="/_Type_.jsp";from=(394,10);to=(394,19)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(394,21);to=(394,53)]
                    out.write("(ImportUtil.parseFieldInt(elt, \"");

                // end
                // begin [file="/_Type_.jsp";from=(394,56);to=(394,62)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(394,64);to=(395,0)]
                    out.write("\"));\n");

                // end
                // begin [file="/_Type_.jsp";from=(395,2);to=(395,93)]
                     } else if (isTypeMV &&  (itFieldEntry.isTypeIntArray() || "Integer".equals(typeShort))) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(395,95);to=(396,7)]
                    out.write("\n    set");

                // end
                // begin [file="/_Type_.jsp";from=(396,10);to=(396,19)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(396,21);to=(396,46)]
                    out.write("(ImportUtil.parseFieldInt");

                // end
                // begin [file="/_Type_.jsp";from=(396,49);to=(396,57)]
                    out.print( mvType );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(396,59);to=(396,66)]
                    out.write("(elt, \"");

                // end
                // begin [file="/_Type_.jsp";from=(396,69);to=(396,75)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(396,77);to=(397,0)]
                    out.write("\"));\n");

                // end
                // begin [file="/_Type_.jsp";from=(397,2);to=(397,45)]
                     } else if (itFieldEntry.isTypeDouble()) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(397,47);to=(398,7)]
                    out.write("\n    set");

                // end
                // begin [file="/_Type_.jsp";from=(398,10);to=(398,19)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(398,21);to=(398,56)]
                    out.write("(ImportUtil.parseFieldDouble(elt, \"");

                // end
                // begin [file="/_Type_.jsp";from=(398,59);to=(398,65)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(398,67);to=(399,0)]
                    out.write("\"));\n");

                // end
                // begin [file="/_Type_.jsp";from=(399,2);to=(399,94)]
                     } else if (isTypeMV && (itFieldEntry.isTypeDoubleArray() || "Double".equals(typeShort))) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(399,96);to=(400,7)]
                    out.write("\n    set");

                // end
                // begin [file="/_Type_.jsp";from=(400,10);to=(400,19)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(400,21);to=(400,49)]
                    out.write("(ImportUtil.parseFieldDouble");

                // end
                // begin [file="/_Type_.jsp";from=(400,52);to=(400,60)]
                    out.print( mvType );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(400,62);to=(400,69)]
                    out.write("(elt, \"");

                // end
                // begin [file="/_Type_.jsp";from=(400,72);to=(400,78)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(400,80);to=(401,0)]
                    out.write("\"));\n");

                // end
                // begin [file="/_Type_.jsp";from=(401,2);to=(401,46)]
                     } else if (itFieldEntry.isTypeBoolean()) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(401,48);to=(402,7)]
                    out.write("\n    set");

                // end
                // begin [file="/_Type_.jsp";from=(402,10);to=(402,19)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(402,21);to=(402,57)]
                    out.write("(ImportUtil.parseFieldBoolean(elt, \"");

                // end
                // begin [file="/_Type_.jsp";from=(402,60);to=(402,66)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(402,68);to=(403,0)]
                    out.write("\"));\n");

                // end
                // begin [file="/_Type_.jsp";from=(403,2);to=(403,96)]
                     } else if (isTypeMV && (itFieldEntry.isTypeBooleanArray() || "Boolean".equals(typeShort))) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(403,98);to=(404,7)]
                    out.write("\n    set");

                // end
                // begin [file="/_Type_.jsp";from=(404,10);to=(404,19)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(404,21);to=(404,50)]
                    out.write("(ImportUtil.parseFieldBoolean");

                // end
                // begin [file="/_Type_.jsp";from=(404,53);to=(404,61)]
                    out.print( mvType );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(404,63);to=(404,70)]
                    out.write("(elt, \"");

                // end
                // begin [file="/_Type_.jsp";from=(404,73);to=(404,79)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(404,81);to=(405,0)]
                    out.write("\"));\n");

                // end
                // begin [file="/_Type_.jsp";from=(405,2);to=(405,5)]
                     } 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(405,7);to=(406,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(406,0);to=(406,17)]
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
// HTML // begin [file="/_Type_.jsp";from=(406,17);to=(413,0)]
    out.write("\n  }\n  \n  protected void importXmlFieldsWithReferences(org.jdom.Element elt, ImportOptions options) {\n    super.importXmlFieldsWithReferences(elt, options);\n      \n    if (options.isSelfImport()) {\n");

// end
// begin [file="/_Type_.jsp";from=(413,0);to=(413,101)]
    /* ----  jalios:foreach ---- */
    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_4 = new com.jalios.jtaglib.ForeachTag();
    _jspx_th_jalios_foreach_4.setPageContext(pageContext);
    _jspx_th_jalios_foreach_4.setParent(null);
    _jspx_th_jalios_foreach_4.setCollection( declaredFieldEntryList );
    _jspx_th_jalios_foreach_4.setName("itFieldEntry");
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
                    TypeFieldEntry itFieldEntry = null;
                    itFieldEntry = (TypeFieldEntry) pageContext.findAttribute("itFieldEntry");
                // end
                // HTML // begin [file="/_Type_.jsp";from=(413,101);to=(414,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(414,2);to=(431,0)]
                     
                    String name    = itFieldEntry.getName(); 
                    String nameCap = itFieldEntry.getNameCap();
                    String type    = itFieldEntry.getType();
                    
                    boolean isFieldML      = itFieldEntry.isFieldML();
                    boolean isMV           = itFieldEntry.isTypeMV();
                    boolean isWiki         = itFieldEntry.isFieldWiki();
                    boolean isWysiwyg      = itFieldEntry.isWysiwyg();
                    
                    String mvType  = "Array";
                    if (itFieldEntry.isTypeList()) {
                      mvType = "List";
                    } 
                    else if (itFieldEntry.isTypeSet()) {
                      mvType = "Set";
                    }
                // end
                // HTML // begin [file="/_Type_.jsp";from=(431,2);to=(432,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(432,2);to=(432,30)]
                     if (isWiki || isWysiwyg) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(432,32);to=(433,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(433,2);to=(433,17)]
                       if (isMV) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(433,19);to=(434,9)]
                    out.write("\n      set");

                // end
                // begin [file="/_Type_.jsp";from=(434,12);to=(434,21)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(434,23);to=(434,49)]
                    out.write("(ImportUtil.parseFieldText");

                // end
                // begin [file="/_Type_.jsp";from=(434,52);to=(434,60)]
                    out.print( mvType );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(434,62);to=(434,69)]
                    out.write("(elt, \"");

                // end
                // begin [file="/_Type_.jsp";from=(434,72);to=(434,78)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(434,80);to=(435,0)]
                    out.write("\"));\n");

                // end
                // begin [file="/_Type_.jsp";from=(435,2);to=(435,24)]
                         if (isFieldML) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(435,26);to=(436,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(436,2);to=(436,42)]
                           if (itFieldEntry.isTypeList()) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(436,44);to=(437,9)]
                    out.write("\n      set");

                // end
                // begin [file="/_Type_.jsp";from=(437,12);to=(437,21)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(437,23);to=(437,64)]
                    out.write("ML(ImportUtil.parseFieldTextListML(elt, \"");

                // end
                // begin [file="/_Type_.jsp";from=(437,67);to=(437,73)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(437,75);to=(438,0)]
                    out.write("ML\"));\n");

                // end
                // begin [file="/_Type_.jsp";from=(438,2);to=(438,18)]
                           } else { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(438,20);to=(439,9)]
                    out.write("\n      set");

                // end
                // begin [file="/_Type_.jsp";from=(439,12);to=(439,21)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(439,23);to=(439,65)]
                    out.write("ML(ImportUtil.parseFieldTextArrayML(elt, \"");

                // end
                // begin [file="/_Type_.jsp";from=(439,68);to=(439,74)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(439,76);to=(440,0)]
                    out.write("ML\"));\n");

                // end
                // begin [file="/_Type_.jsp";from=(440,2);to=(440,11)]
                           } 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(440,13);to=(441,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(441,2);to=(441,9)]
                         } 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(441,11);to=(442,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(442,2);to=(442,14)]
                       } else { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(442,16);to=(443,9)]
                    out.write("\n      set");

                // end
                // begin [file="/_Type_.jsp";from=(443,12);to=(443,21)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(443,23);to=(443,56)]
                    out.write("(ImportUtil.parseFieldText(elt, \"");

                // end
                // begin [file="/_Type_.jsp";from=(443,59);to=(443,65)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(443,67);to=(444,0)]
                    out.write("\"));\n");

                // end
                // begin [file="/_Type_.jsp";from=(444,2);to=(444,24)]
                         if (isFieldML) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(444,26);to=(445,9)]
                    out.write("\n      set");

                // end
                // begin [file="/_Type_.jsp";from=(445,12);to=(445,21)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(445,23);to=(445,60)]
                    out.write("ML(ImportUtil.parseFieldTextML(elt, \"");

                // end
                // begin [file="/_Type_.jsp";from=(445,63);to=(445,69)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(445,71);to=(446,0)]
                    out.write("ML\"));\n");

                // end
                // begin [file="/_Type_.jsp";from=(446,2);to=(446,9)]
                         } 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(446,11);to=(447,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(447,2);to=(447,7)]
                       } 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(447,9);to=(448,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(448,2);to=(450,78)]
                     } else if ((itFieldEntry.isTypePublication() || itFieldEntry.isTypePublicationMV() || 
                                  itFieldEntry.getType().contains("com.jalios.jcms.") || itFieldEntry.getType().contains("generated."))&&
                                  !itFieldEntry.getType().equals("com.jalios.jcms.Category[]")) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(450,80);to=(451,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(451,2);to=(451,17)]
                       if (isMV) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(451,19);to=(452,9)]
                    out.write("\n      set");

                // end
                // begin [file="/_Type_.jsp";from=(452,12);to=(452,21)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(452,23);to=(452,53)]
                    out.write("(ImportUtil.parseSelfFieldData");

                // end
                // begin [file="/_Type_.jsp";from=(452,56);to=(452,64)]
                    out.print( mvType );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(452,66);to=(452,73)]
                    out.write("(elt, \"");

                // end
                // begin [file="/_Type_.jsp";from=(452,76);to=(452,82)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(452,84);to=(452,87)]
                    out.write("\", ");

                // end
                // begin [file="/_Type_.jsp";from=(452,90);to=(452,119)]
                    out.print( itFieldEntry.getTypeShort() );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(452,121);to=(453,0)]
                    out.write(".class));\n");

                // end
                // begin [file="/_Type_.jsp";from=(453,2);to=(453,24)]
                         if (isFieldML) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(453,26);to=(454,9)]
                    out.write("\n      set");

                // end
                // begin [file="/_Type_.jsp";from=(454,12);to=(454,21)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(454,23);to=(454,55)]
                    out.write("ML(ImportUtil.parseSelfFieldData");

                // end
                // begin [file="/_Type_.jsp";from=(454,58);to=(454,66)]
                    out.print( mvType );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(454,68);to=(454,77)]
                    out.write("ML(elt, \"");

                // end
                // begin [file="/_Type_.jsp";from=(454,80);to=(454,86)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(454,88);to=(454,93)]
                    out.write("ML\", ");

                // end
                // begin [file="/_Type_.jsp";from=(454,96);to=(454,125)]
                    out.print( itFieldEntry.getTypeShort() );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(454,127);to=(455,0)]
                    out.write(".class));\n");

                // end
                // begin [file="/_Type_.jsp";from=(455,2);to=(455,9)]
                         } 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(455,11);to=(456,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(456,2);to=(456,14)]
                       } else { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(456,16);to=(457,9)]
                    out.write("\n      set");

                // end
                // begin [file="/_Type_.jsp";from=(457,12);to=(457,21)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(457,23);to=(457,60)]
                    out.write("(ImportUtil.parseSelfFieldData(elt, \"");

                // end
                // begin [file="/_Type_.jsp";from=(457,63);to=(457,69)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(457,71);to=(457,74)]
                    out.write("\", ");

                // end
                // begin [file="/_Type_.jsp";from=(457,77);to=(457,106)]
                    out.print( itFieldEntry.getTypeShort() );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(457,108);to=(458,0)]
                    out.write(".class));\n");

                // end
                // begin [file="/_Type_.jsp";from=(458,2);to=(458,24)]
                         if (isFieldML) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(458,26);to=(459,9)]
                    out.write("\n      set");

                // end
                // begin [file="/_Type_.jsp";from=(459,12);to=(459,21)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(459,23);to=(459,64)]
                    out.write("ML(ImportUtil.parseSelfFieldDataML(elt, \"");

                // end
                // begin [file="/_Type_.jsp";from=(459,67);to=(459,73)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(459,75);to=(459,80)]
                    out.write("ML\", ");

                // end
                // begin [file="/_Type_.jsp";from=(459,83);to=(459,112)]
                    out.print( itFieldEntry.getTypeShort() );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(459,114);to=(460,0)]
                    out.write(".class));\n");

                // end
                // begin [file="/_Type_.jsp";from=(460,2);to=(460,9)]
                         } 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(460,11);to=(461,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(461,2);to=(461,7)]
                       } 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(461,9);to=(462,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(462,2);to=(462,5)]
                     } 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(462,7);to=(463,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(463,0);to=(463,17)]
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
// HTML // begin [file="/_Type_.jsp";from=(463,17);to=(467,0)]
    out.write("\n\n    } else {\n    \n");

// end
// begin [file="/_Type_.jsp";from=(467,0);to=(467,101)]
    /* ----  jalios:foreach ---- */
    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_5 = new com.jalios.jtaglib.ForeachTag();
    _jspx_th_jalios_foreach_5.setPageContext(pageContext);
    _jspx_th_jalios_foreach_5.setParent(null);
    _jspx_th_jalios_foreach_5.setCollection( declaredFieldEntryList );
    _jspx_th_jalios_foreach_5.setName("itFieldEntry");
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
                    TypeFieldEntry itFieldEntry = null;
                    itFieldEntry = (TypeFieldEntry) pageContext.findAttribute("itFieldEntry");
                // end
                // HTML // begin [file="/_Type_.jsp";from=(467,101);to=(468,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(468,2);to=(485,0)]
                     
                    String name    = itFieldEntry.getName(); 
                    String nameCap = itFieldEntry.getNameCap();
                    String type    = itFieldEntry.getType();
                    
                    boolean isFieldML      = itFieldEntry.isFieldML();
                    boolean isMV           = itFieldEntry.isTypeMV();
                    boolean isWiki         = itFieldEntry.isFieldWiki();
                    boolean isWysiwyg      = itFieldEntry.isWysiwyg();
                    
                    String mvType  = "Array";
                    if (itFieldEntry.isTypeList()) {
                      mvType = "List";
                    } 
                    else if (itFieldEntry.isTypeSet()) {
                      mvType = "Set";
                    }
                // end
                // HTML // begin [file="/_Type_.jsp";from=(485,2);to=(486,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(486,2);to=(486,17)]
                     if (isWiki) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(486,19);to=(487,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(487,2);to=(487,17)]
                       if (isMV) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(487,19);to=(488,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(488,2);to=(488,24)]
                         if (isFieldML) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(488,26);to=(489,7)]
                    out.write("\n    set");

                // end
                // begin [file="/_Type_.jsp";from=(489,10);to=(489,19)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(489,21);to=(489,63)]
                    out.write("ML(ImportUtil.parseFieldWikiArrayML(elt, \"");

                // end
                // begin [file="/_Type_.jsp";from=(489,66);to=(489,72)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(489,74);to=(490,0)]
                    out.write("ML\"));\n");

                // end
                // begin [file="/_Type_.jsp";from=(490,2);to=(490,9)]
                         } 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(490,11);to=(491,7)]
                    out.write("\n    set");

                // end
                // begin [file="/_Type_.jsp";from=(491,10);to=(491,19)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(491,21);to=(491,47)]
                    out.write("(ImportUtil.parseFieldWiki");

                // end
                // begin [file="/_Type_.jsp";from=(491,50);to=(491,58)]
                    out.print( mvType );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(491,60);to=(491,67)]
                    out.write("(elt, \"");

                // end
                // begin [file="/_Type_.jsp";from=(491,70);to=(491,76)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(491,78);to=(492,0)]
                    out.write("\"));\n");

                // end
                // begin [file="/_Type_.jsp";from=(492,2);to=(492,14)]
                       } else { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(492,16);to=(493,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(493,2);to=(493,26)]
                           if (isFieldML) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(493,28);to=(494,7)]
                    out.write("\n    set");

                // end
                // begin [file="/_Type_.jsp";from=(494,10);to=(494,19)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(494,21);to=(494,58)]
                    out.write("ML(ImportUtil.parseFieldWikiML(elt, \"");

                // end
                // begin [file="/_Type_.jsp";from=(494,61);to=(494,67)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(494,69);to=(495,0)]
                    out.write("ML\"));\n");

                // end
                // begin [file="/_Type_.jsp";from=(495,2);to=(495,9)]
                         } 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(495,11);to=(496,7)]
                    out.write("\n    set");

                // end
                // begin [file="/_Type_.jsp";from=(496,10);to=(496,19)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(496,21);to=(496,54)]
                    out.write("(ImportUtil.parseFieldWiki(elt, \"");

                // end
                // begin [file="/_Type_.jsp";from=(496,57);to=(496,63)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(496,65);to=(497,0)]
                    out.write("\"));\n");

                // end
                // begin [file="/_Type_.jsp";from=(497,2);to=(497,7)]
                       } 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(497,9);to=(499,0)]
                    out.write("\n\n");

                // end
                // begin [file="/_Type_.jsp";from=(499,2);to=(499,27)]
                     } else if (isWysiwyg) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(499,29);to=(500,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(500,2);to=(500,17)]
                       if (isMV) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(500,19);to=(501,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(501,2);to=(501,24)]
                         if (isFieldML) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(501,26);to=(502,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(502,2);to=(502,25)]
                           if (isDBType) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(502,27);to=(503,7)]
                    out.write("\n    set");

                // end
                // begin [file="/_Type_.jsp";from=(503,10);to=(503,19)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(503,21);to=(503,65)]
                    out.write("ML(ImportUtil.parseFieldWysiwygListML(elt, \"");

                // end
                // begin [file="/_Type_.jsp";from=(503,68);to=(503,74)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(503,76);to=(504,0)]
                    out.write("ML\"));\n");

                // end
                // begin [file="/_Type_.jsp";from=(504,2);to=(504,18)]
                           } else { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(504,20);to=(505,7)]
                    out.write("\n    set");

                // end
                // begin [file="/_Type_.jsp";from=(505,10);to=(505,19)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(505,21);to=(505,66)]
                    out.write("ML(ImportUtil.parseFieldWysiwygArrayML(elt, \"");

                // end
                // begin [file="/_Type_.jsp";from=(505,69);to=(505,75)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(505,77);to=(506,0)]
                    out.write("ML\"));\n");

                // end
                // begin [file="/_Type_.jsp";from=(506,2);to=(506,11)]
                           } 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(506,13);to=(507,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(507,2);to=(507,9)]
                         } 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(507,11);to=(508,7)]
                    out.write("\n    set");

                // end
                // begin [file="/_Type_.jsp";from=(508,10);to=(508,19)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(508,21);to=(508,50)]
                    out.write("(ImportUtil.parseFieldWysiwyg");

                // end
                // begin [file="/_Type_.jsp";from=(508,53);to=(508,61)]
                    out.print( mvType );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(508,63);to=(508,70)]
                    out.write("(elt, \"");

                // end
                // begin [file="/_Type_.jsp";from=(508,73);to=(508,79)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(508,81);to=(509,0)]
                    out.write("\"));\n");

                // end
                // begin [file="/_Type_.jsp";from=(509,2);to=(509,13)]
                       } else {
                // end
                // HTML // begin [file="/_Type_.jsp";from=(509,15);to=(510,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(510,2);to=(510,24)]
                         if (isFieldML) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(510,26);to=(511,7)]
                    out.write("\n    set");

                // end
                // begin [file="/_Type_.jsp";from=(511,10);to=(511,19)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(511,21);to=(511,61)]
                    out.write("ML(ImportUtil.parseFieldWysiwygML(elt, \"");

                // end
                // begin [file="/_Type_.jsp";from=(511,64);to=(511,70)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(511,72);to=(512,0)]
                    out.write("ML\"));\n");

                // end
                // begin [file="/_Type_.jsp";from=(512,2);to=(512,9)]
                         } 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(512,11);to=(513,7)]
                    out.write("\n    set");

                // end
                // begin [file="/_Type_.jsp";from=(513,10);to=(513,19)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(513,21);to=(513,57)]
                    out.write("(ImportUtil.parseFieldWysiwyg(elt, \"");

                // end
                // begin [file="/_Type_.jsp";from=(513,60);to=(513,66)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(513,68);to=(514,0)]
                    out.write("\"));\n");

                // end
                // begin [file="/_Type_.jsp";from=(514,2);to=(514,7)]
                       } 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(514,9);to=(516,0)]
                    out.write("\n\n");

                // end
                // begin [file="/_Type_.jsp";from=(516,2);to=(516,52)]
                     } else if (itFieldEntry.isTypePublicationMV()) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(516,54);to=(517,7)]
                    out.write("\n    set");

                // end
                // begin [file="/_Type_.jsp";from=(517,10);to=(517,19)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(517,21);to=(517,23)]
                    out.write("((");

                // end
                // begin [file="/_Type_.jsp";from=(517,26);to=(517,32)]
                    out.print( type );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(517,34);to=(517,60)]
                    out.write(")ImportUtil.parseFieldData");

                // end
                // begin [file="/_Type_.jsp";from=(517,63);to=(517,71)]
                    out.print( mvType );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(517,73);to=(517,80)]
                    out.write("(elt, \"");

                // end
                // begin [file="/_Type_.jsp";from=(517,83);to=(517,89)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(517,91);to=(517,94)]
                    out.write("\", ");

                // end
                // begin [file="/_Type_.jsp";from=(517,97);to=(517,126)]
                    out.print( itFieldEntry.getTypeShort() );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(517,128);to=(518,0)]
                    out.write(".class));\n");

                // end
                // begin [file="/_Type_.jsp";from=(518,2);to=(518,50)]
                     } else if (itFieldEntry.isTypePublication()) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(518,52);to=(519,7)]
                    out.write("\n    set");

                // end
                // begin [file="/_Type_.jsp";from=(519,10);to=(519,19)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(519,21);to=(519,23)]
                    out.write("((");

                // end
                // begin [file="/_Type_.jsp";from=(519,26);to=(519,32)]
                    out.print( type );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(519,34);to=(519,67)]
                    out.write(")ImportUtil.parseFieldData(elt, \"");

                // end
                // begin [file="/_Type_.jsp";from=(519,70);to=(519,76)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(519,78);to=(520,0)]
                    out.write("\"));\n");

                // end
                // begin [file="/_Type_.jsp";from=(520,2);to=(520,5)]
                     } 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(520,7);to=(521,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(521,0);to=(521,17)]
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
// HTML // begin [file="/_Type_.jsp";from=(521,17);to=(527,0)]
    out.write("\n    }\n  }\n  \n  public void exportXmlField(StringBuffer sb, int indentLevel) {\n    super.exportXmlField(sb, indentLevel);\n");

// end
// begin [file="/_Type_.jsp";from=(527,0);to=(527,101)]
    /* ----  jalios:foreach ---- */
    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_6 = new com.jalios.jtaglib.ForeachTag();
    _jspx_th_jalios_foreach_6.setPageContext(pageContext);
    _jspx_th_jalios_foreach_6.setParent(null);
    _jspx_th_jalios_foreach_6.setCollection( declaredFieldEntryList );
    _jspx_th_jalios_foreach_6.setName("itFieldEntry");
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
                    TypeFieldEntry itFieldEntry = null;
                    itFieldEntry = (TypeFieldEntry) pageContext.findAttribute("itFieldEntry");
                // end
                // HTML // begin [file="/_Type_.jsp";from=(527,101);to=(528,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(528,2);to=(533,0)]
                     
                    String name    = itFieldEntry.getName(); 
                    String nameCap = itFieldEntry.getNameCap();
                    boolean isFileField = itFieldEntry.isTypeDocument() || itFieldEntry.isTypeDocumentMV();
                    boolean addFieldML = itFieldEntry.isFieldML() && (itFieldEntry.isTypeString() || itFieldEntry.isTypeStringArray() || (itFieldEntry.isTypeCollection() && "String".equals(itFieldEntry.getTypeShort())) || isFileField);
                // end
                // HTML // begin [file="/_Type_.jsp";from=(533,2);to=(534,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(534,2);to=(547,42)]
                     if (itFieldEntry.isTypeString()      || 
                           itFieldEntry.isTypeStringArray() ||
                           itFieldEntry.isAnyLink()         ||
                           itFieldEntry.isTypeDate()        || 
                           itFieldEntry.isTypeDateArray()   ||
                           itFieldEntry.isTypeInt()         ||
                           itFieldEntry.isTypeIntArray()    ||
                           itFieldEntry.isTypeLong()        ||
                           itFieldEntry.isTypeLongArray()   ||
                           itFieldEntry.isTypeDouble()      ||
                           itFieldEntry.isTypeDoubleArray() ||
                           itFieldEntry.isTypeBoolean()     ||
                           itFieldEntry.isTypeBooleanArray()||
                           itFieldEntry.isTypeCollection()) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(547,44);to=(548,51)]
                    out.write("\n    sb.append(ExportUtil.exportField(indentLevel, \"");

                // end
                // begin [file="/_Type_.jsp";from=(548,54);to=(548,60)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(548,62);to=(548,68)]
                    out.write("\", get");

                // end
                // begin [file="/_Type_.jsp";from=(548,71);to=(548,80)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(548,82);to=(548,84)]
                    out.write("()");

                // end
                // begin [file="/_Type_.jsp";from=(548,87);to=(548,129)]
                    out.print( addFieldML ? ", \"" + name + "ML\"" : "" );
                // end
                // begin [file="/_Type_.jsp";from=(548,133);to=(548,205)]
                     if (itFieldEntry.isTypeString() || itFieldEntry.isTypeStringArray()) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(548,207);to=(548,209)]
                    out.write(", ");

                // end
                // begin [file="/_Type_.jsp";from=(548,212);to=(548,239)]
                    out.print( itFieldEntry.isAbstract() );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(548,241);to=(548,243)]
                    out.write(", ");

                // end
                // begin [file="/_Type_.jsp";from=(548,246);to=(548,273)]
                    out.print( itFieldEntry.escapeHtml() );
                // end
                // begin [file="/_Type_.jsp";from=(548,277);to=(548,280)]
                     } 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(548,282);to=(549,0)]
                    out.write("));\n");

                // end
                // begin [file="/_Type_.jsp";from=(549,2);to=(549,5)]
                     } 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(549,7);to=(550,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(550,2);to=(550,21)]
                     if (addFieldML) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(550,23);to=(551,51)]
                    out.write("\n    sb.append(ExportUtil.exportField(indentLevel, \"");

                // end
                // begin [file="/_Type_.jsp";from=(551,54);to=(551,60)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(551,62);to=(551,70)]
                    out.write("ML\", get");

                // end
                // begin [file="/_Type_.jsp";from=(551,73);to=(551,82)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(551,84);to=(551,90)]
                    out.write("ML(), ");

                // end
                // begin [file="/_Type_.jsp";from=(551,93);to=(551,120)]
                    out.print( itFieldEntry.escapeHtml() );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(551,122);to=(552,0)]
                    out.write("));\n");

                // end
                // begin [file="/_Type_.jsp";from=(552,2);to=(552,4)]
                     }
                // end
                // HTML // begin [file="/_Type_.jsp";from=(552,6);to=(553,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(553,0);to=(553,17)]
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
// HTML // begin [file="/_Type_.jsp";from=(553,17);to=(557,0)]
    out.write("\n  }\n\n\n");

// end
// begin [file="/_Type_.jsp";from=(557,2);to=(557,28)]
     if (isPublicationType) { 
// end
// HTML // begin [file="/_Type_.jsp";from=(557,30);to=(560,0)]
    out.write("  \n  public Set<FileDocument> getDocumentLinkSet() {\n    Set<FileDocument> docSet = super.getDocumentLinkSet();\n");

// end
// begin [file="/_Type_.jsp";from=(560,0);to=(560,101)]
    /* ----  jalios:foreach ---- */
    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_7 = new com.jalios.jtaglib.ForeachTag();
    _jspx_th_jalios_foreach_7.setPageContext(pageContext);
    _jspx_th_jalios_foreach_7.setParent(null);
    _jspx_th_jalios_foreach_7.setCollection( declaredFieldEntryList );
    _jspx_th_jalios_foreach_7.setName("itFieldEntry");
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
                    TypeFieldEntry itFieldEntry = null;
                    itFieldEntry = (TypeFieldEntry) pageContext.findAttribute("itFieldEntry");
                // end
                // HTML // begin [file="/_Type_.jsp";from=(560,101);to=(561,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(561,2);to=(566,0)]
                     
                    String name        = itFieldEntry.getName();
                    String editor      = itFieldEntry.getEditor();
                    boolean isFilepath = "image".equals(editor) || "media".equals(editor);
                    boolean isML       = itFieldEntry.isFieldML();
                // end
                // HTML // begin [file="/_Type_.jsp";from=(566,2);to=(567,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(567,2);to=(567,21)]
                     if (isFilepath) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(567,23);to=(568,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(568,2);to=(568,18)]
                       if (isML)  { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(568,20);to=(569,37)]
                    out.write("\n    JcmsUtil.addFileDocument(docSet, ");

                // end
                // begin [file="/_Type_.jsp";from=(569,40);to=(569,46)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(569,48);to=(569,50)]
                    out.write(", ");

                // end
                // begin [file="/_Type_.jsp";from=(569,53);to=(569,59)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(569,61);to=(570,0)]
                    out.write("ML);\n");

                // end
                // begin [file="/_Type_.jsp";from=(570,2);to=(570,14)]
                       } else { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(570,16);to=(571,37)]
                    out.write("\n    JcmsUtil.addFileDocument(docSet, ");

                // end
                // begin [file="/_Type_.jsp";from=(571,40);to=(571,46)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(571,48);to=(572,0)]
                    out.write(");\n");

                // end
                // begin [file="/_Type_.jsp";from=(572,2);to=(572,7)]
                       } 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(572,9);to=(573,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(573,2);to=(573,5)]
                     } 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(573,7);to=(574,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(574,0);to=(574,17)]
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
// HTML // begin [file="/_Type_.jsp";from=(574,17);to=(577,0)]
    out.write("\n    return docSet;\n  }\n");

// end
// begin [file="/_Type_.jsp";from=(577,2);to=(577,5)]
     } 
// end
// HTML // begin [file="/_Type_.jsp";from=(577,7);to=(579,0)]
    out.write("\n  \n");

// end
// HTML // begin [file="/_Type_.jsp";from=(579,58);to=(584,42)]
    out.write("\n  // ----------------------------------------------------------------------\n  // TYPE AND FIELD INFOS (static methods)\n  // ----------------------------------------------------------------------  \n  /**\n   * Returns the TypeEntry bound to <code>");

// end
// begin [file="/_Type_.jsp";from=(584,45);to=(584,56)]
    out.print( className );
// end
// HTML // begin [file="/_Type_.jsp";from=(584,58);to=(589,32)]
    out.write("</code>. <br>\n   * @see com.jalios.jcms.Channel#getTypeEntry(Class)\n   * @since jcms-5.5\n   */\n  public static TypeEntry getTypeEntry() {\n    return channel.getTypeEntry(");

// end
// begin [file="/_Type_.jsp";from=(589,35);to=(589,46)]
    out.print( className );
// end
// HTML // begin [file="/_Type_.jsp";from=(589,48);to=(592,67)]
    out.write(".class);\n  }\n  /**\n   * Return an array of <code>TypeFieldEntry</code> bound to <code>");

// end
// begin [file="/_Type_.jsp";from=(592,70);to=(592,81)]
    out.print( className );
// end
// HTML // begin [file="/_Type_.jsp";from=(592,83);to=(593,103)]
    out.write("</code>. <br>\n   * This array <strong>does not</strong> contain inherited TypeFieldEntry from super classes of <code>");

// end
// begin [file="/_Type_.jsp";from=(593,106);to=(593,117)]
    out.print( className );
// end
// HTML // begin [file="/_Type_.jsp";from=(593,119);to=(594,88)]
    out.write("</code>. <br/>\n   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>");

// end
// begin [file="/_Type_.jsp";from=(594,91);to=(594,102)]
    out.print( className );
// end
// HTML // begin [file="/_Type_.jsp";from=(594,104);to=(599,39)]
    out.write("</code> or an empty array (never return null)\n   * @see com.jalios.jcms.Channel#getTypeFieldEntries(Class)\n   * @since jcms-5.5\n   */\n  public static TypeFieldEntry[] getTypeFieldEntries() {\n    return channel.getTypeFieldEntries(");

// end
// begin [file="/_Type_.jsp";from=(599,42);to=(599,53)]
    out.print( className );
// end
// HTML // begin [file="/_Type_.jsp";from=(599,55);to=(602,67)]
    out.write(".class);\n  }\n  /**\n   * Return an array of <code>TypeFieldEntry</code> bound to <code>");

// end
// begin [file="/_Type_.jsp";from=(602,70);to=(602,81)]
    out.print( className );
// end
// HTML // begin [file="/_Type_.jsp";from=(602,83);to=(603,99)]
    out.write("</code>. <br>\n   * This array <strong>does</strong> contain inherited TypeFieldEntry from super classes of <code>");

// end
// begin [file="/_Type_.jsp";from=(603,102);to=(603,113)]
    out.print( className );
// end
// HTML // begin [file="/_Type_.jsp";from=(603,115);to=(604,88)]
    out.write("</code>. <br>\n   * @return an array of <code>TypeFieldEntry</code> containing all Field used by <code>");

// end
// begin [file="/_Type_.jsp";from=(604,91);to=(604,102)]
    out.print( className );
// end
// HTML // begin [file="/_Type_.jsp";from=(604,104);to=(609,42)]
    out.write("</code> or an empty array (never return null)\n   * @see com.jalios.jcms.Channel#getAllTypeFieldEntries(Class)\n   * @since jcms-5.5\n   */\n  public static TypeFieldEntry[] getAllTypeFieldEntries() {\n    return channel.getAllTypeFieldEntries(");

// end
// begin [file="/_Type_.jsp";from=(609,45);to=(609,56)]
    out.print( className );
// end
// HTML // begin [file="/_Type_.jsp";from=(609,58);to=(613,0)]
    out.write(".class);\n  }\n\n\n");

// end
// HTML // begin [file="/_Type_.jsp";from=(613,62);to=(617,0)]
    out.write("\n  // ----------------------------------------------------------------------\n  // FIELDs VALUE\n  // ----------------------------------------------------------------------  \n");

// end
// begin [file="/_Type_.jsp";from=(617,2);to=(637,0)]
    
      List intFieldEntryList = new ArrayList();
      List longFieldEntryList = new ArrayList();
      List doubleFieldEntryList = new ArrayList();
      List booleanFieldEntryList = new ArrayList();
      List objectFieldEntryList = new ArrayList();
    	for(Iterator it = declaredFieldEntryList.iterator(); it.hasNext();) {
    	  TypeFieldEntry fieldEntry = (TypeFieldEntry) it.next();
        if (fieldEntry.isTypeInt()) {
          intFieldEntryList.add(fieldEntry);
        } else if (fieldEntry.isTypeLong()) {
          longFieldEntryList.add(fieldEntry);
        } else if (fieldEntry.isTypeDouble()) {
          doubleFieldEntryList.add(fieldEntry);
        } else if (fieldEntry.isTypeBoolean()) {
          booleanFieldEntryList.add(fieldEntry);
        } else {
          objectFieldEntryList.add(fieldEntry);
        }
      }
// end
// HTML // begin [file="/_Type_.jsp";from=(637,2);to=(639,83)]
    out.write("\n  /**\n   * Gets the value of the given <code>int</code> field name for the current <code>");

// end
// begin [file="/_Type_.jsp";from=(639,86);to=(639,97)]
    out.print( className );
// end
// HTML // begin [file="/_Type_.jsp";from=(639,99);to=(645,0)]
    out.write("</code>.\n   * @param fieldName the field name from which to retrieve the field value.\n   * @return the <code>int</code> field value\n   * @throws NoSuchFieldException if the field was not found.\n   */\n  public int getIntFieldValue(String fieldName) throws NoSuchFieldException {\n");

// end
// begin [file="/_Type_.jsp";from=(645,0);to=(645,99)]
    /* ----  jalios:foreach ---- */
    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_8 = new com.jalios.jtaglib.ForeachTag();
    _jspx_th_jalios_foreach_8.setPageContext(pageContext);
    _jspx_th_jalios_foreach_8.setParent(null);
    _jspx_th_jalios_foreach_8.setCollection( intFieldEntryList );
    _jspx_th_jalios_foreach_8.setName("itIntFieldEntry");
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
                    TypeFieldEntry itIntFieldEntry = null;
                    itIntFieldEntry = (TypeFieldEntry) pageContext.findAttribute("itIntFieldEntry");
                // end
                // HTML // begin [file="/_Type_.jsp";from=(645,99);to=(646,9)]
                    out.write("\n    if (\"");

                // end
                // begin [file="/_Type_.jsp";from=(646,12);to=(646,39)]
                    out.print( itIntFieldEntry.getName() );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(646,41);to=(646,74)]
                    out.write("\".equals(fieldName)) { return get");

                // end
                // begin [file="/_Type_.jsp";from=(646,77);to=(646,107)]
                    out.print( itIntFieldEntry.getNameCap() );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(646,109);to=(647,0)]
                    out.write("(); }\n");

                // end
                // begin [file="/_Type_.jsp";from=(647,0);to=(647,17)]
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
// HTML // begin [file="/_Type_.jsp";from=(647,17);to=(652,83)]
    out.write("\n    return super.getIntFieldValue(fieldName);\n  }\n  \n  /**\n   * Sets the value of the given <code>int</code> field name for the current <code>");

// end
// begin [file="/_Type_.jsp";from=(652,86);to=(652,97)]
    out.print( className );
// end
// HTML // begin [file="/_Type_.jsp";from=(652,99);to=(659,0)]
    out.write("</code>.\n   * @param fieldName the field name from which to retrieve the field value.\n   * @param value the <code>int</code> field value\n   * @throws NoSuchFieldException if the field was not found.\n   * @since jcms-6.3.0 \n   */\n  public void setIntFieldValue(String fieldName, int value) throws NoSuchFieldException {\n");

// end
// begin [file="/_Type_.jsp";from=(659,0);to=(659,99)]
    /* ----  jalios:foreach ---- */
    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_9 = new com.jalios.jtaglib.ForeachTag();
    _jspx_th_jalios_foreach_9.setPageContext(pageContext);
    _jspx_th_jalios_foreach_9.setParent(null);
    _jspx_th_jalios_foreach_9.setCollection( intFieldEntryList );
    _jspx_th_jalios_foreach_9.setName("itIntFieldEntry");
    _jspx_th_jalios_foreach_9.setType("TypeFieldEntry");
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
                    TypeFieldEntry itIntFieldEntry = null;
                    itIntFieldEntry = (TypeFieldEntry) pageContext.findAttribute("itIntFieldEntry");
                // end
                // HTML // begin [file="/_Type_.jsp";from=(659,99);to=(660,9)]
                    out.write("\n    if (\"");

                // end
                // begin [file="/_Type_.jsp";from=(660,12);to=(660,39)]
                    out.print( itIntFieldEntry.getName() );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(660,41);to=(660,67)]
                    out.write("\".equals(fieldName)) { set");

                // end
                // begin [file="/_Type_.jsp";from=(660,70);to=(660,100)]
                    out.print( itIntFieldEntry.getNameCap() );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(660,102);to=(661,0)]
                    out.write("(value); return; }\n");

                // end
                // begin [file="/_Type_.jsp";from=(661,0);to=(661,17)]
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
// HTML // begin [file="/_Type_.jsp";from=(661,17);to=(666,84)]
    out.write("\n    super.setIntFieldValue(fieldName, value);\n  }\n  \n  /**\n   * Gets the value of the given <code>long</code> field name for the current <code>");

// end
// begin [file="/_Type_.jsp";from=(666,87);to=(666,98)]
    out.print( className );
// end
// HTML // begin [file="/_Type_.jsp";from=(666,100);to=(672,0)]
    out.write("</code>.\n   * @param fieldName the field name from which to retrieve the field value.\n   * @return the <code>long</code> field value\n   * @throws NoSuchFieldException if the field was not found.\n   */\n  public long getLongFieldValue(String fieldName) throws NoSuchFieldException {\n");

// end
// begin [file="/_Type_.jsp";from=(672,0);to=(672,101)]
    /* ----  jalios:foreach ---- */
    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_10 = new com.jalios.jtaglib.ForeachTag();
    _jspx_th_jalios_foreach_10.setPageContext(pageContext);
    _jspx_th_jalios_foreach_10.setParent(null);
    _jspx_th_jalios_foreach_10.setCollection( longFieldEntryList );
    _jspx_th_jalios_foreach_10.setName("itLongFieldEntry");
    _jspx_th_jalios_foreach_10.setType("TypeFieldEntry");
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
                    TypeFieldEntry itLongFieldEntry = null;
                    itLongFieldEntry = (TypeFieldEntry) pageContext.findAttribute("itLongFieldEntry");
                // end
                // HTML // begin [file="/_Type_.jsp";from=(672,101);to=(673,9)]
                    out.write("\n    if (\"");

                // end
                // begin [file="/_Type_.jsp";from=(673,12);to=(673,40)]
                    out.print( itLongFieldEntry.getName() );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(673,42);to=(673,75)]
                    out.write("\".equals(fieldName)) { return get");

                // end
                // begin [file="/_Type_.jsp";from=(673,78);to=(673,109)]
                    out.print( itLongFieldEntry.getNameCap() );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(673,111);to=(674,0)]
                    out.write("(); }\n");

                // end
                // begin [file="/_Type_.jsp";from=(674,0);to=(674,17)]
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
// HTML // begin [file="/_Type_.jsp";from=(674,17);to=(679,84)]
    out.write("\n    return super.getLongFieldValue(fieldName);\n  }\n  \n  /**\n   * Sets the value of the given <code>long</code> field name for the current <code>");

// end
// begin [file="/_Type_.jsp";from=(679,87);to=(679,98)]
    out.print( className );
// end
// HTML // begin [file="/_Type_.jsp";from=(679,100);to=(686,0)]
    out.write("</code>.\n   * @param fieldName the field name from which to retrieve the field value.\n   * @param value the <code>long</code> field value\n   * @throws NoSuchFieldException if the field was not found.\n   * @since jcms-6.3.0 \n   */\n  public void setLongFieldValue(String fieldName, long value) throws NoSuchFieldException {\n");

// end
// begin [file="/_Type_.jsp";from=(686,0);to=(686,101)]
    /* ----  jalios:foreach ---- */
    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_11 = new com.jalios.jtaglib.ForeachTag();
    _jspx_th_jalios_foreach_11.setPageContext(pageContext);
    _jspx_th_jalios_foreach_11.setParent(null);
    _jspx_th_jalios_foreach_11.setCollection( longFieldEntryList );
    _jspx_th_jalios_foreach_11.setName("itLongFieldEntry");
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
                    TypeFieldEntry itLongFieldEntry = null;
                    itLongFieldEntry = (TypeFieldEntry) pageContext.findAttribute("itLongFieldEntry");
                // end
                // HTML // begin [file="/_Type_.jsp";from=(686,101);to=(687,9)]
                    out.write("\n    if (\"");

                // end
                // begin [file="/_Type_.jsp";from=(687,12);to=(687,40)]
                    out.print( itLongFieldEntry.getName() );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(687,42);to=(687,68)]
                    out.write("\".equals(fieldName)) { set");

                // end
                // begin [file="/_Type_.jsp";from=(687,71);to=(687,102)]
                    out.print( itLongFieldEntry.getNameCap() );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(687,104);to=(688,0)]
                    out.write("(value); return; }\n");

                // end
                // begin [file="/_Type_.jsp";from=(688,0);to=(688,17)]
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
// HTML // begin [file="/_Type_.jsp";from=(688,17);to=(693,86)]
    out.write("\n    super.setLongFieldValue(fieldName, value);\n  }\n  \n  /**\n   * Gets the value of the given <code>double</code> field name for the current <code>");

// end
// begin [file="/_Type_.jsp";from=(693,89);to=(693,100)]
    out.print( className );
// end
// HTML // begin [file="/_Type_.jsp";from=(693,102);to=(699,0)]
    out.write("</code>.\n   * @param fieldName the field name from which to retrieve the field value.\n   * @return the <code>double</code> field value\n   * @throws NoSuchFieldException if the field was not found.\n   */\n  public double getDoubleFieldValue(String fieldName) throws NoSuchFieldException {\n");

// end
// begin [file="/_Type_.jsp";from=(699,0);to=(699,105)]
    /* ----  jalios:foreach ---- */
    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_12 = new com.jalios.jtaglib.ForeachTag();
    _jspx_th_jalios_foreach_12.setPageContext(pageContext);
    _jspx_th_jalios_foreach_12.setParent(null);
    _jspx_th_jalios_foreach_12.setCollection( doubleFieldEntryList );
    _jspx_th_jalios_foreach_12.setName("itDoubleFieldEntry");
    _jspx_th_jalios_foreach_12.setType("TypeFieldEntry");
    try {
        int _jspx_eval_jalios_foreach_12 = _jspx_th_jalios_foreach_12.doStartTag();
        if (_jspx_eval_jalios_foreach_12 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_foreach_12 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_foreach_12.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_foreach_12.doInitBody();
                }
                do {
                    Integer itCounter = null;
                    itCounter = (Integer) pageContext.findAttribute("itCounter");
                    TypeFieldEntry itDoubleFieldEntry = null;
                    itDoubleFieldEntry = (TypeFieldEntry) pageContext.findAttribute("itDoubleFieldEntry");
                // end
                // HTML // begin [file="/_Type_.jsp";from=(699,105);to=(700,9)]
                    out.write("\n    if (\"");

                // end
                // begin [file="/_Type_.jsp";from=(700,12);to=(700,42)]
                    out.print( itDoubleFieldEntry.getName() );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(700,44);to=(700,77)]
                    out.write("\".equals(fieldName)) { return get");

                // end
                // begin [file="/_Type_.jsp";from=(700,80);to=(700,113)]
                    out.print( itDoubleFieldEntry.getNameCap() );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(700,115);to=(701,0)]
                    out.write("(); }\n");

                // end
                // begin [file="/_Type_.jsp";from=(701,0);to=(701,17)]
                } while (_jspx_th_jalios_foreach_12.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_foreach_12 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_foreach_12.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_foreach_12.release();
    }
// end
// HTML // begin [file="/_Type_.jsp";from=(701,17);to=(706,86)]
    out.write("\n    return super.getDoubleFieldValue(fieldName);\n  }\n  \n  /**\n   * Sets the value of the given <code>double</code> field name for the current <code>");

// end
// begin [file="/_Type_.jsp";from=(706,89);to=(706,100)]
    out.print( className );
// end
// HTML // begin [file="/_Type_.jsp";from=(706,102);to=(713,0)]
    out.write("</code>.\n   * @param fieldName the field name from which to retrieve the field value.\n   * @param value the <code>double</code> field value\n   * @throws NoSuchFieldException if the field was not found.\n   * @since jcms-6.3.0 \n   */\n  public void setDoubleFieldValue(String fieldName, double value) throws NoSuchFieldException {\n");

// end
// begin [file="/_Type_.jsp";from=(713,0);to=(713,105)]
    /* ----  jalios:foreach ---- */
    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_13 = new com.jalios.jtaglib.ForeachTag();
    _jspx_th_jalios_foreach_13.setPageContext(pageContext);
    _jspx_th_jalios_foreach_13.setParent(null);
    _jspx_th_jalios_foreach_13.setCollection( doubleFieldEntryList );
    _jspx_th_jalios_foreach_13.setName("itDoubleFieldEntry");
    _jspx_th_jalios_foreach_13.setType("TypeFieldEntry");
    try {
        int _jspx_eval_jalios_foreach_13 = _jspx_th_jalios_foreach_13.doStartTag();
        if (_jspx_eval_jalios_foreach_13 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_foreach_13 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_foreach_13.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_foreach_13.doInitBody();
                }
                do {
                    Integer itCounter = null;
                    itCounter = (Integer) pageContext.findAttribute("itCounter");
                    TypeFieldEntry itDoubleFieldEntry = null;
                    itDoubleFieldEntry = (TypeFieldEntry) pageContext.findAttribute("itDoubleFieldEntry");
                // end
                // HTML // begin [file="/_Type_.jsp";from=(713,105);to=(714,9)]
                    out.write("\n    if (\"");

                // end
                // begin [file="/_Type_.jsp";from=(714,12);to=(714,42)]
                    out.print( itDoubleFieldEntry.getName() );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(714,44);to=(714,70)]
                    out.write("\".equals(fieldName)) { set");

                // end
                // begin [file="/_Type_.jsp";from=(714,73);to=(714,106)]
                    out.print( itDoubleFieldEntry.getNameCap() );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(714,108);to=(715,0)]
                    out.write("(value); return; }\n");

                // end
                // begin [file="/_Type_.jsp";from=(715,0);to=(715,17)]
                } while (_jspx_th_jalios_foreach_13.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_foreach_13 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_foreach_13.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_foreach_13.release();
    }
// end
// HTML // begin [file="/_Type_.jsp";from=(715,17);to=(720,87)]
    out.write("\n     super.setDoubleFieldValue(fieldName, value);\n  }\n  \n  /**\n   * Gets the value of the given <code>boolean</code> field name for the current <code>");

// end
// begin [file="/_Type_.jsp";from=(720,90);to=(720,101)]
    out.print( className );
// end
// HTML // begin [file="/_Type_.jsp";from=(720,103);to=(726,0)]
    out.write("</code>.\n   * @param fieldName the field name from which to retrieve the field value.\n   * @return the <code>boolean</code> field value\n   * @throws NoSuchFieldException if the field was not found.\n   */\n  public boolean getBooleanFieldValue(String fieldName) throws NoSuchFieldException {\n");

// end
// begin [file="/_Type_.jsp";from=(726,0);to=(726,107)]
    /* ----  jalios:foreach ---- */
    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_14 = new com.jalios.jtaglib.ForeachTag();
    _jspx_th_jalios_foreach_14.setPageContext(pageContext);
    _jspx_th_jalios_foreach_14.setParent(null);
    _jspx_th_jalios_foreach_14.setCollection( booleanFieldEntryList );
    _jspx_th_jalios_foreach_14.setName("itBooleanFieldEntry");
    _jspx_th_jalios_foreach_14.setType("TypeFieldEntry");
    try {
        int _jspx_eval_jalios_foreach_14 = _jspx_th_jalios_foreach_14.doStartTag();
        if (_jspx_eval_jalios_foreach_14 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_foreach_14 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_foreach_14.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_foreach_14.doInitBody();
                }
                do {
                    Integer itCounter = null;
                    itCounter = (Integer) pageContext.findAttribute("itCounter");
                    TypeFieldEntry itBooleanFieldEntry = null;
                    itBooleanFieldEntry = (TypeFieldEntry) pageContext.findAttribute("itBooleanFieldEntry");
                // end
                // HTML // begin [file="/_Type_.jsp";from=(726,107);to=(727,9)]
                    out.write("\n    if (\"");

                // end
                // begin [file="/_Type_.jsp";from=(727,12);to=(727,43)]
                    out.print( itBooleanFieldEntry.getName() );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(727,45);to=(727,78)]
                    out.write("\".equals(fieldName)) { return get");

                // end
                // begin [file="/_Type_.jsp";from=(727,81);to=(727,115)]
                    out.print( itBooleanFieldEntry.getNameCap() );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(727,117);to=(728,0)]
                    out.write("(); }\n");

                // end
                // begin [file="/_Type_.jsp";from=(728,0);to=(728,17)]
                } while (_jspx_th_jalios_foreach_14.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_foreach_14 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_foreach_14.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_foreach_14.release();
    }
// end
// HTML // begin [file="/_Type_.jsp";from=(728,17);to=(733,87)]
    out.write("\n    return super.getBooleanFieldValue(fieldName);\n  }\n  \n  /**\n   * Sets the value of the given <code>boolean</code> field name for the current <code>");

// end
// begin [file="/_Type_.jsp";from=(733,90);to=(733,101)]
    out.print( className );
// end
// HTML // begin [file="/_Type_.jsp";from=(733,103);to=(740,0)]
    out.write("</code>.\n   * @param fieldName the field name from which to retrieve the field value.\n   * @param value the <code>boolean</code> field value\n   * @throws NoSuchFieldException if the field was not found.\n   * @since jcms-6.3.0 \n   */\n  public void setBooleanFieldValue(String fieldName, boolean value) throws NoSuchFieldException {\n");

// end
// begin [file="/_Type_.jsp";from=(740,0);to=(740,107)]
    /* ----  jalios:foreach ---- */
    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_15 = new com.jalios.jtaglib.ForeachTag();
    _jspx_th_jalios_foreach_15.setPageContext(pageContext);
    _jspx_th_jalios_foreach_15.setParent(null);
    _jspx_th_jalios_foreach_15.setCollection( booleanFieldEntryList );
    _jspx_th_jalios_foreach_15.setName("itBooleanFieldEntry");
    _jspx_th_jalios_foreach_15.setType("TypeFieldEntry");
    try {
        int _jspx_eval_jalios_foreach_15 = _jspx_th_jalios_foreach_15.doStartTag();
        if (_jspx_eval_jalios_foreach_15 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_foreach_15 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_foreach_15.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_foreach_15.doInitBody();
                }
                do {
                    Integer itCounter = null;
                    itCounter = (Integer) pageContext.findAttribute("itCounter");
                    TypeFieldEntry itBooleanFieldEntry = null;
                    itBooleanFieldEntry = (TypeFieldEntry) pageContext.findAttribute("itBooleanFieldEntry");
                // end
                // HTML // begin [file="/_Type_.jsp";from=(740,107);to=(741,9)]
                    out.write("\n    if (\"");

                // end
                // begin [file="/_Type_.jsp";from=(741,12);to=(741,43)]
                    out.print( itBooleanFieldEntry.getName() );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(741,45);to=(741,71)]
                    out.write("\".equals(fieldName)) { set");

                // end
                // begin [file="/_Type_.jsp";from=(741,74);to=(741,108)]
                    out.print( itBooleanFieldEntry.getNameCap() );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(741,110);to=(742,0)]
                    out.write("(value); return; }\n");

                // end
                // begin [file="/_Type_.jsp";from=(742,0);to=(742,17)]
                } while (_jspx_th_jalios_foreach_15.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_foreach_15 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_foreach_15.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_foreach_15.release();
    }
// end
// HTML // begin [file="/_Type_.jsp";from=(742,17);to=(754,0)]
    out.write("\n    super.setBooleanFieldValue(fieldName, value);\n  }\n  \n  /**\n   * Gets the value of the given <code>Category</code> field name for the current <code>Data</code>.\n   * @param fieldName the field name from which to retrieve the field value.\n   * @param mbr the member used to check rigth access to categories.\n   * @return a <code>TreeSet</code> of <code>Category</code>\n   * @throws NoSuchFieldException if the field was not found in the given <code>Data</code>.\n   */\n  public TreeSet<Category> getCategoryFieldValue(String fieldName, Member mbr) throws NoSuchFieldException {\n");

// end
// begin [file="/_Type_.jsp";from=(754,0);to=(754,104)]
    /* ----  jalios:foreach ---- */
    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_16 = new com.jalios.jtaglib.ForeachTag();
    _jspx_th_jalios_foreach_16.setPageContext(pageContext);
    _jspx_th_jalios_foreach_16.setParent(null);
    _jspx_th_jalios_foreach_16.setCollection( categoryFieldEntryList );
    _jspx_th_jalios_foreach_16.setName("itCatFieldEntry");
    _jspx_th_jalios_foreach_16.setType("TypeFieldEntry");
    try {
        int _jspx_eval_jalios_foreach_16 = _jspx_th_jalios_foreach_16.doStartTag();
        if (_jspx_eval_jalios_foreach_16 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_foreach_16 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_foreach_16.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_foreach_16.doInitBody();
                }
                do {
                    Integer itCounter = null;
                    itCounter = (Integer) pageContext.findAttribute("itCounter");
                    TypeFieldEntry itCatFieldEntry = null;
                    itCatFieldEntry = (TypeFieldEntry) pageContext.findAttribute("itCatFieldEntry");
                // end
                // HTML // begin [file="/_Type_.jsp";from=(754,104);to=(755,9)]
                    out.write("\n    if (\"");

                // end
                // begin [file="/_Type_.jsp";from=(755,12);to=(755,39)]
                    out.print( itCatFieldEntry.getName() );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(755,41);to=(755,74)]
                    out.write("\".equals(fieldName)) { return get");

                // end
                // begin [file="/_Type_.jsp";from=(755,77);to=(755,107)]
                    out.print( itCatFieldEntry.getNameCap() );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(755,109);to=(756,0)]
                    out.write("(mbr); }\n");

                // end
                // begin [file="/_Type_.jsp";from=(756,0);to=(756,17)]
                } while (_jspx_th_jalios_foreach_16.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_foreach_16 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_foreach_16.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_foreach_16.release();
    }
// end
// HTML // begin [file="/_Type_.jsp";from=(756,17);to=(761,79)]
    out.write("\n    return super.getCategoryFieldValue(fieldName, mbr);\n  }\n\n  /**\n   * Gets the <code>Object</code> value of the given field name for this <code>");

// end
// begin [file="/_Type_.jsp";from=(761,82);to=(761,93)]
    out.print( className );
// end
// HTML // begin [file="/_Type_.jsp";from=(761,95);to=(772,0)]
    out.write("</code>. <br>\n   * Do not retrieve <code>Category</code> fields, see {@link #getCategoryFieldValue(String, Member)}.\n   * @param fieldName the field name from which to retrieve the field value.\n   * @param lang the language (ISO-639 code) in which to retrieve the field value\n   *        (used only for multilingual fields).\n   * @param useDefault whether to use the publication main language if the field value \n   *        is not available in the requested language (used only for multilingual fields).\n   * @return the <code>Object</code> field value\n   * @throws NoSuchFieldException if the field was not found in the given <code>Publication</code>.\n   */\n  public Object getFieldValue(String fieldName, String lang, boolean useDefault) throws NoSuchFieldException {\n");

// end
// begin [file="/_Type_.jsp";from=(772,0);to=(772,102)]
    /* ----  jalios:foreach ---- */
    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_17 = new com.jalios.jtaglib.ForeachTag();
    _jspx_th_jalios_foreach_17.setPageContext(pageContext);
    _jspx_th_jalios_foreach_17.setParent(null);
    _jspx_th_jalios_foreach_17.setCollection( objectFieldEntryList );
    _jspx_th_jalios_foreach_17.setName("itObjFieldEntry");
    _jspx_th_jalios_foreach_17.setType("TypeFieldEntry");
    try {
        int _jspx_eval_jalios_foreach_17 = _jspx_th_jalios_foreach_17.doStartTag();
        if (_jspx_eval_jalios_foreach_17 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_foreach_17 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_foreach_17.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_foreach_17.doInitBody();
                }
                do {
                    Integer itCounter = null;
                    itCounter = (Integer) pageContext.findAttribute("itCounter");
                    TypeFieldEntry itObjFieldEntry = null;
                    itObjFieldEntry = (TypeFieldEntry) pageContext.findAttribute("itObjFieldEntry");
                // end
                // HTML // begin [file="/_Type_.jsp";from=(772,102);to=(773,9)]
                    out.write("\n    if (\"");

                // end
                // begin [file="/_Type_.jsp";from=(773,12);to=(773,39)]
                    out.print( itObjFieldEntry.getName() );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(773,41);to=(773,74)]
                    out.write("\".equals(fieldName)) { return get");

                // end
                // begin [file="/_Type_.jsp";from=(773,77);to=(773,107)]
                    out.print( itObjFieldEntry.getNameCap() );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(773,109);to=(773,110)]
                    out.write("(");

                // end
                // begin [file="/_Type_.jsp";from=(773,113);to=(773,167)]
                    out.print( itObjFieldEntry.isFieldML() ? "lang, useDefault": "" );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(773,169);to=(774,0)]
                    out.write("); }\n");

                // end
                // begin [file="/_Type_.jsp";from=(774,0);to=(774,17)]
                } while (_jspx_th_jalios_foreach_17.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_foreach_17 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_foreach_17.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_foreach_17.release();
    }
// end
// HTML // begin [file="/_Type_.jsp";from=(774,17);to=(779,79)]
    out.write("\n    return super.getFieldValue(fieldName, lang, useDefault);\n  }\n  \n  /**\n   * Sets the <code>Object</code> value of the given field name for this <code>");

// end
// begin [file="/_Type_.jsp";from=(779,82);to=(779,93)]
    out.print( className );
// end
// HTML // begin [file="/_Type_.jsp";from=(779,95);to=(790,0)]
    out.write("</code>. <br>\n   * Do not set <code>Category</code> fields, see {@link #setCategoryFieldValue(String, TreeSet)}.\n   * @param fieldName the field name from which to retrieve the field value.\n   * @param value the <code>Object</code> field value\n   * @param lang the language (ISO-639 code) in which to retrieve the field value\n   *        (used only for multilingual fields).\n   * \n   * @throws NoSuchFieldException if the field was not found in the given <code>Publication</code>.\n   * @since jcms-6.3.0 \n   */\n  public void setFieldValue(String fieldName, Object value, String lang) throws NoSuchFieldException {\n");

// end
// begin [file="/_Type_.jsp";from=(790,0);to=(790,102)]
    /* ----  jalios:foreach ---- */
    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_18 = new com.jalios.jtaglib.ForeachTag();
    _jspx_th_jalios_foreach_18.setPageContext(pageContext);
    _jspx_th_jalios_foreach_18.setParent(null);
    _jspx_th_jalios_foreach_18.setCollection( objectFieldEntryList );
    _jspx_th_jalios_foreach_18.setName("itObjFieldEntry");
    _jspx_th_jalios_foreach_18.setType("TypeFieldEntry");
    try {
        int _jspx_eval_jalios_foreach_18 = _jspx_th_jalios_foreach_18.doStartTag();
        if (_jspx_eval_jalios_foreach_18 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_foreach_18 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_foreach_18.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_foreach_18.doInitBody();
                }
                do {
                    Integer itCounter = null;
                    itCounter = (Integer) pageContext.findAttribute("itCounter");
                    TypeFieldEntry itObjFieldEntry = null;
                    itObjFieldEntry = (TypeFieldEntry) pageContext.findAttribute("itObjFieldEntry");
                // end
                // begin [file="/_Type_.jsp";from=(790,104);to=(791,47)]
                     
                        String ctype  = itObjFieldEntry.getType(); 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(791,49);to=(792,9)]
                    out.write("\n    if (\"");

                // end
                // begin [file="/_Type_.jsp";from=(792,12);to=(792,39)]
                    out.print( itObjFieldEntry.getName() );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(792,41);to=(792,67)]
                    out.write("\".equals(fieldName)) { set");

                // end
                // begin [file="/_Type_.jsp";from=(792,70);to=(792,100)]
                    out.print( itObjFieldEntry.getNameCap() );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(792,102);to=(792,103)]
                    out.write("(");

                // end
                // begin [file="/_Type_.jsp";from=(792,106);to=(792,149)]
                    out.print( itObjFieldEntry.isFieldML() ? "lang,": "" );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(792,151);to=(792,152)]
                    out.write("(");

                // end
                // begin [file="/_Type_.jsp";from=(792,155);to=(792,162)]
                    out.print( ctype );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(792,164);to=(793,0)]
                    out.write(")value); return; }\n");

                // end
                // begin [file="/_Type_.jsp";from=(793,0);to=(793,17)]
                } while (_jspx_th_jalios_foreach_18.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_foreach_18 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_foreach_18.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_foreach_18.release();
    }
// end
// HTML // begin [file="/_Type_.jsp";from=(793,17);to=(797,0)]
    out.write("\n    super.setFieldValue(fieldName, value, lang);\n  }\n  \n");

// end
// HTML // begin [file="/_Type_.jsp";from=(797,86);to=(798,0)]
    out.write("\n");

// end
// begin [file="/_Type_.jsp";from=(798,0);to=(798,101)]
    /* ----  jalios:foreach ---- */
    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_19 = new com.jalios.jtaglib.ForeachTag();
    _jspx_th_jalios_foreach_19.setPageContext(pageContext);
    _jspx_th_jalios_foreach_19.setParent(null);
    _jspx_th_jalios_foreach_19.setCollection( declaredFieldEntryList );
    _jspx_th_jalios_foreach_19.setName("itFieldEntry");
    _jspx_th_jalios_foreach_19.setType("TypeFieldEntry");
    try {
        int _jspx_eval_jalios_foreach_19 = _jspx_th_jalios_foreach_19.doStartTag();
        if (_jspx_eval_jalios_foreach_19 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_foreach_19 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_foreach_19.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_foreach_19.doInitBody();
                }
                do {
                    Integer itCounter = null;
                    itCounter = (Integer) pageContext.findAttribute("itCounter");
                    TypeFieldEntry itFieldEntry = null;
                    itFieldEntry = (TypeFieldEntry) pageContext.findAttribute("itFieldEntry");
                // end
                // HTML // begin [file="/_Type_.jsp";from=(798,101);to=(799,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(799,2);to=(852,0)]
                    
                      Element xmlField = itFieldEntry.getXmlElement();
                      String name = itFieldEntry.getName();
                      String nameCap = itFieldEntry.getNameCap();
                      String editor = itFieldEntry.getEditor();
                      String type = itFieldEntry.getType();
                      String typeShort = itFieldEntry.getTypeShort();
                      String defaultValue = "";
                      String defaultStr = Util.escapeJavaStringChar(xmlField.getAttributeValue("default"));
                      
                      if (type.equals("String")) {
                        defaultValue = "channel.getTypeFieldEntry(" + className + ".class, \"" + name + "\", true).getDefaultTextString()";
                      }
                      else if (type.equals("int") || type.equals("double") || type.equals("long")) {
                        defaultValue = Util.notEmpty(defaultStr) ? defaultStr : "0";
                      }
                      else if (type.equals("boolean")) {
                        defaultValue = "on".equals(defaultStr) || "true".equals(defaultStr) ? "true" : "false";
                      }
                      else if (isDBType && itFieldEntry.isTypeList()) {
                        defaultValue = "new Array" + type + "()";
                      }
                      else if (isDBType && itFieldEntry.isTypeSet()) {
                        defaultValue = "new Hash" + type + "()";
                      }
                      
                      boolean fieldML = itFieldEntry.isFieldML();
                      
                      boolean isArray = itFieldEntry.isTypeArray();
                      
                      String dataSource = itFieldEntry.getDataSource();
                      int maxRows       = itFieldEntry.getMaxRows();
                      String dbrTable   = itFieldEntry.getDbrTable();
                      String dbrKeyCol  = itFieldEntry.getDbrKeyCol();
                      String dbrLabelCol= itFieldEntry.getDbrLabelCol();
                      String dbrOrderBy = itFieldEntry.getDbrOrderBy();
                      
                      boolean isLinkFromDBType = isDBType && itFieldEntry.isAnyLink();
                      
                      boolean isDBLink = false;
                      boolean isDBLinkList = false;
                      if (!isDBType) {
                        boolean isLink = editor.startsWith("member") || (editor.startsWith("link") && TypeUtil.isDBType(parentElt, typeShort));
                        isDBLink = !isArray && isLink;
                        isDBLinkList = isArray && isLink;
                      }
                      
                      boolean isTransientLink = false;
                      if (isDBType) {
                        isTransientLink = editor.startsWith("member") || editor.startsWith("group") || editor.startsWith("link");
                      }
                      
                      boolean isLargeText = "textarea".equals(itFieldEntry.getEditor()) || "wysiwyg".equals(itFieldEntry.getEditor());
                // end
                // HTML // begin [file="/_Type_.jsp";from=(852,2);to=(853,0)]
                    out.write("\n");

                // end
                // HTML // begin [file="/_Type_.jsp";from=(853,15);to=(855,5)]
                    out.write("\n  // ----------------------------------------------------------------------\n  // ");

                // end
                // begin [file="/_Type_.jsp";from=(855,8);to=(855,14)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(855,16);to=(858,0)]
                    out.write("\n  // ----------------------------------------------------------------------  \n  \n");

                // end
                // begin [file="/_Type_.jsp";from=(858,2);to=(858,26)]
                     if (isTransientLink) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(858,28);to=(860,0)]
                    out.write("\n  @JsonProperty\n");

                // end
                // begin [file="/_Type_.jsp";from=(860,2);to=(860,5)]
                     } 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(860,7);to=(861,12)]
                    out.write("\n  protected ");

                // end
                // begin [file="/_Type_.jsp";from=(861,14);to=(861,38)]
                     if (isTransientLink) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(861,40);to=(861,49)]
                    out.write("transient");

                // end
                // begin [file="/_Type_.jsp";from=(861,51);to=(861,54)]
                     } 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(861,56);to=(861,57)]
                    out.write(" ");

                // end
                // begin [file="/_Type_.jsp";from=(861,60);to=(861,66)]
                    out.print( type );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(861,68);to=(861,69)]
                    out.write(" ");

                // end
                // begin [file="/_Type_.jsp";from=(861,72);to=(861,78)]
                    out.print( name );
                // end
                // begin [file="/_Type_.jsp";from=(861,83);to=(861,139)]
                    out.print( Util.isEmpty(defaultValue) ? "" : " = " + defaultValue );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(861,141);to=(862,0)]
                    out.write(";\n");

                // end
                // begin [file="/_Type_.jsp";from=(862,2);to=(862,58)]
                     if (isLinkFromDBType && itFieldEntry.isTypeScalar()) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(862,60);to=(863,29)]
                    out.write("\n  protected transient String ");

                // end
                // begin [file="/_Type_.jsp";from=(863,32);to=(863,38)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(863,40);to=(864,0)]
                    out.write("Id;\n");

                // end
                // begin [file="/_Type_.jsp";from=(864,2);to=(864,5)]
                     } 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(864,7);to=(865,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(865,2);to=(866,66)]
                     if (isLinkFromDBType && itFieldEntry.isTypeCollection()) { 
                      String collection = itFieldEntry.isTypeList() ? "List" : "Set"; 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(866,68);to=(867,24)]
                    out.write("\n  private transient Data");

                // end
                // begin [file="/_Type_.jsp";from=(867,27);to=(867,39)]
                    out.print( collection );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(867,41);to=(867,48)]
                    out.write("Helper<");

                // end
                // begin [file="/_Type_.jsp";from=(867,51);to=(867,62)]
                    out.print( typeShort );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(867,64);to=(867,66)]
                    out.write("> ");

                // end
                // begin [file="/_Type_.jsp";from=(867,69);to=(867,75)]
                    out.print( name );
                // end
                // begin [file="/_Type_.jsp";from=(867,80);to=(867,92)]
                    out.print( collection );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(867,94);to=(867,107)]
                    out.write("Helper = Data");

                // end
                // begin [file="/_Type_.jsp";from=(867,110);to=(867,122)]
                    out.print( collection );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(867,124);to=(867,143)]
                    out.write("Helper.build(this, ");

                // end
                // begin [file="/_Type_.jsp";from=(867,146);to=(867,157)]
                    out.print( typeShort );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(867,159);to=(867,176)]
                    out.write(".class, this::set");

                // end
                // begin [file="/_Type_.jsp";from=(867,179);to=(867,188)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(867,190);to=(868,0)]
                    out.write(");\n");

                // end
                // begin [file="/_Type_.jsp";from=(868,2);to=(868,5)]
                     } 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(868,7);to=(870,0)]
                    out.write("\n  \n");

                // end
                // HTML // begin [file="/_Type_.jsp";from=(870,16);to=(871,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(871,2);to=(871,58)]
                     if (type.equals("boolean") && name.startsWith("is")) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(871,60);to=(872,9)]
                    out.write("\n  public ");

                // end
                // begin [file="/_Type_.jsp";from=(872,12);to=(872,18)]
                    out.print( type );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(872,20);to=(872,21)]
                    out.write(" ");

                // end
                // begin [file="/_Type_.jsp";from=(872,24);to=(872,30)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(872,32);to=(872,44)]
                    out.write("() { return ");

                // end
                // begin [file="/_Type_.jsp";from=(872,47);to=(872,53)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(872,55);to=(873,0)]
                    out.write("; }\n");

                // end
                // begin [file="/_Type_.jsp";from=(873,2);to=(873,26)]
                     } else if (isDBLink) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(873,28);to=(874,9)]
                    out.write("\n  public ");

                // end
                // begin [file="/_Type_.jsp";from=(874,12);to=(874,18)]
                    out.print( type );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(874,20);to=(874,24)]
                    out.write(" get");

                // end
                // begin [file="/_Type_.jsp";from=(874,27);to=(874,36)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(874,38);to=(875,14)]
                    out.write("() { \n    return get");

                // end
                // begin [file="/_Type_.jsp";from=(875,17);to=(875,26)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(875,28);to=(877,9)]
                    out.write("(true);\n  }\n  public ");

                // end
                // begin [file="/_Type_.jsp";from=(877,12);to=(877,18)]
                    out.print( type );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(877,20);to=(877,24)]
                    out.write(" get");

                // end
                // begin [file="/_Type_.jsp";from=(877,27);to=(877,36)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(877,38);to=(878,7)]
                    out.write("(boolean queryDB) { \n   if (");

                // end
                // begin [file="/_Type_.jsp";from=(878,10);to=(878,16)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(878,18);to=(879,13)]
                    out.write(" != null) {\n      return ");

                // end
                // begin [file="/_Type_.jsp";from=(879,16);to=(879,22)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(879,24);to=(881,33)]
                    out.write(";\n    }\n    if (queryDB && Util.notEmpty(");

                // end
                // begin [file="/_Type_.jsp";from=(881,36);to=(881,42)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(881,44);to=(882,29)]
                    out.write("DBID)) {\n      return channel.getData(");

                // end
                // begin [file="/_Type_.jsp";from=(882,32);to=(882,38)]
                    out.print( type );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(882,40);to=(882,48)]
                    out.write(".class, ");

                // end
                // begin [file="/_Type_.jsp";from=(882,51);to=(882,57)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(882,59);to=(886,19)]
                    out.write("DBID);\n    }\n    return null;\n  }\n  protected String ");

                // end
                // begin [file="/_Type_.jsp";from=(886,22);to=(886,28)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(886,30);to=(887,19)]
                    out.write("DBID;\n  public String get");

                // end
                // begin [file="/_Type_.jsp";from=(887,22);to=(887,31)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(887,33);to=(887,49)]
                    out.write("DBID() { return ");

                // end
                // begin [file="/_Type_.jsp";from=(887,52);to=(887,58)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(887,60);to=(888,0)]
                    out.write("DBID; }\n");

                // end
                // begin [file="/_Type_.jsp";from=(888,2);to=(888,30)]
                     } else if (isDBLinkList) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(888,32);to=(889,9)]
                    out.write("\n  public ");

                // end
                // begin [file="/_Type_.jsp";from=(889,12);to=(889,18)]
                    out.print( type );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(889,20);to=(889,24)]
                    out.write(" get");

                // end
                // begin [file="/_Type_.jsp";from=(889,27);to=(889,36)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(889,38);to=(890,14)]
                    out.write("() {\n    return get");

                // end
                // begin [file="/_Type_.jsp";from=(890,17);to=(890,26)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(890,28);to=(892,9)]
                    out.write("(true);\n  }\n  public ");

                // end
                // begin [file="/_Type_.jsp";from=(892,12);to=(892,18)]
                    out.print( type );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(892,20);to=(892,24)]
                    out.write(" get");

                // end
                // begin [file="/_Type_.jsp";from=(892,27);to=(892,36)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(892,38);to=(893,33)]
                    out.write("(boolean queryDB) { \n    if (!queryDB || Util.isEmpty(");

                // end
                // begin [file="/_Type_.jsp";from=(893,36);to=(893,42)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(893,44);to=(894,13)]
                    out.write("DBID)) {\n      return ");

                // end
                // begin [file="/_Type_.jsp";from=(894,16);to=(894,22)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(894,24);to=(896,27)]
                    out.write(";\n    }\n    return mergeHybridLink(");

                // end
                // begin [file="/_Type_.jsp";from=(896,30);to=(896,41)]
                    out.print( typeShort );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(896,43);to=(896,51)]
                    out.write(".class, ");

                // end
                // begin [file="/_Type_.jsp";from=(896,54);to=(896,60)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(896,62);to=(896,64)]
                    out.write(", ");

                // end
                // begin [file="/_Type_.jsp";from=(896,67);to=(896,73)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(896,75);to=(898,21)]
                    out.write("DBID);\n  }\n  protected String[] ");

                // end
                // begin [file="/_Type_.jsp";from=(898,24);to=(898,29)]
                    out.print( name);
                // end
                // HTML // begin [file="/_Type_.jsp";from=(898,31);to=(899,21)]
                    out.write("DBID;\n  public String[] get");

                // end
                // begin [file="/_Type_.jsp";from=(899,24);to=(899,33)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(899,35);to=(900,11)]
                    out.write("DBID() {\n    return ");

                // end
                // begin [file="/_Type_.jsp";from=(900,14);to=(900,19)]
                    out.print( name);
                // end
                // HTML // begin [file="/_Type_.jsp";from=(900,21);to=(902,0)]
                    out.write("DBID;\n  }\n");

                // end
                // begin [file="/_Type_.jsp";from=(902,2);to=(902,69)]
                     } else if (isLinkFromDBType && itFieldEntry.isTypeCollection()) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(902,71);to=(903,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(903,2);to=(903,69)]
                       String collection = itFieldEntry.isTypeList() ? "List" : "Set"; 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(903,71);to=(904,9)]
                    out.write("\n  public ");

                // end
                // begin [file="/_Type_.jsp";from=(904,12);to=(904,18)]
                    out.print( type );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(904,20);to=(904,24)]
                    out.write(" get");

                // end
                // begin [file="/_Type_.jsp";from=(904,27);to=(904,36)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(904,38);to=(905,14)]
                    out.write("() {\n    return get");

                // end
                // begin [file="/_Type_.jsp";from=(905,17);to=(905,26)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(905,28);to=(907,9)]
                    out.write("(false);\n  }\n  public ");

                // end
                // begin [file="/_Type_.jsp";from=(907,12);to=(907,18)]
                    out.print( type );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(907,20);to=(907,24)]
                    out.write(" get");

                // end
                // begin [file="/_Type_.jsp";from=(907,27);to=(907,36)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(907,38);to=(909,6)]
                    out.write("(boolean modifiable) {\n    if (isDBData()) {\n      ");

                // end
                // begin [file="/_Type_.jsp";from=(909,9);to=(909,15)]
                    out.print( name );
                // end
                // begin [file="/_Type_.jsp";from=(909,20);to=(909,32)]
                    out.print( collection );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(909,34);to=(911,8)]
                    out.write("Helper.refreshDataCollectionIfNeeded();\n    }\n    if (");

                // end
                // begin [file="/_Type_.jsp";from=(911,11);to=(911,17)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(911,19);to=(912,37)]
                    out.write(" != null && !modifiable) {\n      return Collections.unmodifiable");

                // end
                // begin [file="/_Type_.jsp";from=(912,40);to=(912,52)]
                    out.print( collection );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(912,54);to=(912,55)]
                    out.write("(");

                // end
                // begin [file="/_Type_.jsp";from=(912,58);to=(912,64)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(912,66);to=(914,11)]
                    out.write(");\n    }\n    return ");

                // end
                // begin [file="/_Type_.jsp";from=(914,14);to=(914,20)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(914,22);to=(916,0)]
                    out.write("; \n  }\n");

                // end
                // begin [file="/_Type_.jsp";from=(916,2);to=(916,12)]
                     } else { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(916,14);to=(917,9)]
                    out.write("\n  public ");

                // end
                // begin [file="/_Type_.jsp";from=(917,12);to=(917,18)]
                    out.print( type );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(917,20);to=(917,24)]
                    out.write(" get");

                // end
                // begin [file="/_Type_.jsp";from=(917,27);to=(917,36)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(917,38);to=(917,50)]
                    out.write("() { return ");

                // end
                // begin [file="/_Type_.jsp";from=(917,53);to=(917,59)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(917,61);to=(918,0)]
                    out.write("; }\n");

                // end
                // begin [file="/_Type_.jsp";from=(918,2);to=(918,38)]
                       if (editor.equals("category")) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(918,40);to=(919,20)]
                    out.write("  \n  public TreeSet get");

                // end
                // begin [file="/_Type_.jsp";from=(919,23);to=(919,32)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(919,34);to=(920,51)]
                    out.write("(Member member) {\n    return (TreeSet) Category.getReadableCatSet(get");

                // end
                // begin [file="/_Type_.jsp";from=(920,54);to=(920,63)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(920,65);to=(922,0)]
                    out.write("(), member);\n  }\n");

                // end
                // begin [file="/_Type_.jsp";from=(922,2);to=(922,7)]
                       } 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(922,9);to=(923,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(923,2);to=(923,5)]
                     } 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(923,7);to=(924,0)]
                    out.write("\n");

                // end
                // HTML // begin [file="/_Type_.jsp";from=(924,16);to=(925,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(925,2);to=(925,58)]
                     if (type.equals("boolean") && name.startsWith("is")) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(925,60);to=(926,17)]
                    out.write("\n  public void set");

                // end
                // begin [file="/_Type_.jsp";from=(926,20);to=(926,58)]
                    out.print( Util.recapitalize(name.substring(2)) );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(926,60);to=(926,61)]
                    out.write("(");

                // end
                // begin [file="/_Type_.jsp";from=(926,64);to=(926,70)]
                    out.print( type );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(926,72);to=(926,78)]
                    out.write(" v) { ");

                // end
                // begin [file="/_Type_.jsp";from=(926,81);to=(926,87)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(926,89);to=(927,0)]
                    out.write(" = v; }\n");

                // end
                // begin [file="/_Type_.jsp";from=(927,2);to=(927,26)]
                     } else if (isDBLink) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(927,28);to=(928,17)]
                    out.write("\n  public void set");

                // end
                // begin [file="/_Type_.jsp";from=(928,20);to=(928,29)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(928,31);to=(928,32)]
                    out.write("(");

                // end
                // begin [file="/_Type_.jsp";from=(928,35);to=(928,41)]
                    out.print( type );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(928,43);to=(930,6)]
                    out.write(" v) {\n    if (v == null) {\n      ");

                // end
                // begin [file="/_Type_.jsp";from=(930,9);to=(930,15)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(930,17);to=(931,6)]
                    out.write(" = null;\n      ");

                // end
                // begin [file="/_Type_.jsp";from=(931,9);to=(931,15)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(931,17);to=(936,9)]
                    out.write("DBID =null;\n      return;\n    }  \n  \n    if (v instanceof DBData) {\n      set");

                // end
                // begin [file="/_Type_.jsp";from=(936,12);to=(936,21)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(936,23);to=(938,6)]
                    out.write("DBID(v.getId());\n    } else {\n      ");

                // end
                // begin [file="/_Type_.jsp";from=(938,9);to=(938,15)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(938,17);to=(941,17)]
                    out.write(" = v;\n    }\n  }\n  public void set");

                // end
                // begin [file="/_Type_.jsp";from=(941,20);to=(941,29)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(941,31);to=(942,4)]
                    out.write("DBID(String v) { \n    ");

                // end
                // begin [file="/_Type_.jsp";from=(942,7);to=(942,13)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(942,15);to=(943,22)]
                    out.write("DBID = v;\n    if (Util.notEmpty(");

                // end
                // begin [file="/_Type_.jsp";from=(943,25);to=(943,31)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(943,33);to=(944,6)]
                    out.write("DBID)) { \n      ");

                // end
                // begin [file="/_Type_.jsp";from=(944,9);to=(944,15)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(944,17);to=(947,0)]
                    out.write(" = null;\n    };    \n  }  \n");

                // end
                // begin [file="/_Type_.jsp";from=(947,2);to=(947,30)]
                     } else if (isDBLinkList) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(947,32);to=(948,17)]
                    out.write("\n  public void set");

                // end
                // begin [file="/_Type_.jsp";from=(948,20);to=(948,29)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(948,31);to=(948,32)]
                    out.write("(");

                // end
                // begin [file="/_Type_.jsp";from=(948,35);to=(948,41)]
                    out.print( type );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(948,43);to=(949,4)]
                    out.write(" v) { \n    ");

                // end
                // begin [file="/_Type_.jsp";from=(949,7);to=(949,13)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(949,15);to=(952,17)]
                    out.write(" = v == null ? null : v.clone(); \n  }\n  \n  public void set");

                // end
                // begin [file="/_Type_.jsp";from=(952,20);to=(952,29)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(952,31);to=(953,4)]
                    out.write("DBID(String[] v) { \n    ");

                // end
                // begin [file="/_Type_.jsp";from=(953,7);to=(953,13)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(953,15);to=(955,0)]
                    out.write("DBID = v; \n  }\n");

                // end
                // begin [file="/_Type_.jsp";from=(955,2);to=(955,69)]
                     } else if (isLinkFromDBType && itFieldEntry.isTypeCollection()) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(955,71);to=(956,17)]
                    out.write("\n  public void set");

                // end
                // begin [file="/_Type_.jsp";from=(956,20);to=(956,29)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(956,31);to=(956,32)]
                    out.write("(");

                // end
                // begin [file="/_Type_.jsp";from=(956,35);to=(956,41)]
                    out.print( type );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(956,43);to=(957,4)]
                    out.write(" v) { \n    ");

                // end
                // begin [file="/_Type_.jsp";from=(957,7);to=(957,13)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(957,15);to=(960,0)]
                    out.write(" = v; \n\n    if (isDBData()) {\n");

                // end
                // begin [file="/_Type_.jsp";from=(960,2);to=(960,67)]
                     String collection = itFieldEntry.isTypeList() ? "List" : "Set"; 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(960,69);to=(961,6)]
                    out.write("\n      ");

                // end
                // begin [file="/_Type_.jsp";from=(961,9);to=(961,15)]
                    out.print( name );
                // end
                // begin [file="/_Type_.jsp";from=(961,20);to=(961,32)]
                    out.print( collection );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(961,34);to=(961,49)]
                    out.write("Helper.updateId");

                // end
                // begin [file="/_Type_.jsp";from=(961,52);to=(961,64)]
                    out.print( collection );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(961,66);to=(965,0)]
                    out.write("(v);\n    }\n  }\n\n");

                // end
                // begin [file="/_Type_.jsp";from=(965,2);to=(965,65)]
                     } else if (isLinkFromDBType && itFieldEntry.isTypeScalar()) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(965,67);to=(966,17)]
                    out.write("\n  public void set");

                // end
                // begin [file="/_Type_.jsp";from=(966,20);to=(966,29)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(966,31);to=(966,32)]
                    out.write("(");

                // end
                // begin [file="/_Type_.jsp";from=(966,35);to=(966,41)]
                    out.print( type );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(966,43);to=(967,4)]
                    out.write(" v) { \n    ");

                // end
                // begin [file="/_Type_.jsp";from=(967,7);to=(967,13)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(967,15);to=(968,4)]
                    out.write("Id = null;\n    ");

                // end
                // begin [file="/_Type_.jsp";from=(968,7);to=(968,13)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(968,15);to=(970,0)]
                    out.write(" = v;\n  }\n");

                // end
                // begin [file="/_Type_.jsp";from=(970,2);to=(970,12)]
                     } else { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(970,14);to=(971,2)]
                    out.write("\n  ");

                // end
                // begin [file="/_Type_.jsp";from=(971,4);to=(971,43)]
                     if (isDBType && "int".equals(type)) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(971,45);to=(972,17)]
                    out.write("\n  public void set");

                // end
                // begin [file="/_Type_.jsp";from=(972,20);to=(972,29)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(972,31);to=(973,4)]
                    out.write("(Integer v) {\n    ");

                // end
                // begin [file="/_Type_.jsp";from=(973,7);to=(973,13)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(973,15);to=(973,30)]
                    out.write(" = v == null ? ");

                // end
                // begin [file="/_Type_.jsp";from=(973,33);to=(973,47)]
                    out.print( defaultValue );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(973,49);to=(975,2)]
                    out.write(" : v.intValue();\n  }\n  ");

                // end
                // begin [file="/_Type_.jsp";from=(975,4);to=(975,51)]
                     } else if (isDBType && "long".equals(type)) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(975,53);to=(976,17)]
                    out.write("\n  public void set");

                // end
                // begin [file="/_Type_.jsp";from=(976,20);to=(976,29)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(976,31);to=(977,4)]
                    out.write("(Long v) {\n    ");

                // end
                // begin [file="/_Type_.jsp";from=(977,7);to=(977,13)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(977,15);to=(977,30)]
                    out.write(" = v == null ? ");

                // end
                // begin [file="/_Type_.jsp";from=(977,33);to=(977,47)]
                    out.print( defaultValue );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(977,49);to=(979,2)]
                    out.write(" : v.longValue();\n  }  \n  ");

                // end
                // begin [file="/_Type_.jsp";from=(979,4);to=(979,53)]
                     } else if (isDBType && "double".equals(type)) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(979,55);to=(980,17)]
                    out.write("\n  public void set");

                // end
                // begin [file="/_Type_.jsp";from=(980,20);to=(980,29)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(980,31);to=(981,4)]
                    out.write("(Double v) {\n    ");

                // end
                // begin [file="/_Type_.jsp";from=(981,7);to=(981,13)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(981,15);to=(981,30)]
                    out.write(" = v == null ? ");

                // end
                // begin [file="/_Type_.jsp";from=(981,33);to=(981,47)]
                    out.print( defaultValue );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(981,49);to=(983,2)]
                    out.write(" : v.doubleValue();\n  }  \n  ");

                // end
                // begin [file="/_Type_.jsp";from=(983,4);to=(983,54)]
                     } else if (isDBType && "boolean".equals(type)) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(983,56);to=(984,17)]
                    out.write("\n  public void set");

                // end
                // begin [file="/_Type_.jsp";from=(984,20);to=(984,29)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(984,31);to=(985,4)]
                    out.write("(Boolean v) {\n    ");

                // end
                // begin [file="/_Type_.jsp";from=(985,7);to=(985,13)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(985,15);to=(985,30)]
                    out.write(" = v == null ? ");

                // end
                // begin [file="/_Type_.jsp";from=(985,33);to=(985,47)]
                    out.print( defaultValue );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(985,49);to=(987,2)]
                    out.write(" : v.booleanValue();\n  }  \n  ");

                // end
                // begin [file="/_Type_.jsp";from=(987,4);to=(987,63)]
                     } else if (isDBType && itFieldEntry.isTypeCollection()) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(987,65);to=(988,17)]
                    out.write("\n  public void set");

                // end
                // begin [file="/_Type_.jsp";from=(988,20);to=(988,29)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(988,31);to=(988,32)]
                    out.write("(");

                // end
                // begin [file="/_Type_.jsp";from=(988,35);to=(988,41)]
                    out.print( type );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(988,43);to=(989,4)]
                    out.write(" v) { \n    ");

                // end
                // begin [file="/_Type_.jsp";from=(989,7);to=(989,13)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(989,15);to=(989,49)]
                    out.write(" = HibernateUtil.updateCollection(");

                // end
                // begin [file="/_Type_.jsp";from=(989,52);to=(989,58)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(989,60);to=(989,65)]
                    out.write(", v, ");

                // end
                // begin [file="/_Type_.jsp";from=(989,68);to=(989,81)]
                    out.print( isLargeText );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(989,83);to=(991,2)]
                    out.write(");\n  }\n  ");

                // end
                // begin [file="/_Type_.jsp";from=(991,4);to=(991,14)]
                     } else { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(991,16);to=(992,17)]
                    out.write("\n  public void set");

                // end
                // begin [file="/_Type_.jsp";from=(992,20);to=(992,29)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(992,31);to=(992,32)]
                    out.write("(");

                // end
                // begin [file="/_Type_.jsp";from=(992,35);to=(992,41)]
                    out.print( type );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(992,43);to=(992,49)]
                    out.write(" v) { ");

                // end
                // begin [file="/_Type_.jsp";from=(992,52);to=(992,58)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(992,60);to=(993,2)]
                    out.write(" = v; }\n  ");

                // end
                // begin [file="/_Type_.jsp";from=(993,4);to=(993,7)]
                     } 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(993,9);to=(994,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(994,2);to=(994,5)]
                     } 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(994,7);to=(996,0)]
                    out.write("\n  \n");

                // end
                // HTML // begin [file="/_Type_.jsp";from=(996,36);to=(997,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(997,2);to=(997,27)]
                     if (isLinkFromDBType) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(997,29);to=(998,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(998,2);to=(998,40)]
                       if (itFieldEntry.isTypeScalar()) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(998,42);to=(999,19)]
                    out.write("\n  public String get");

                // end
                // begin [file="/_Type_.jsp";from=(999,22);to=(999,31)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(999,33);to=(1000,8)]
                    out.write("Id() { \n    if (");

                // end
                // begin [file="/_Type_.jsp";from=(1000,11);to=(1000,17)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1000,19);to=(1001,13)]
                    out.write(" == null) {\n      return ");

                // end
                // begin [file="/_Type_.jsp";from=(1001,16);to=(1001,22)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1001,24);to=(1003,11)]
                    out.write("Id;\n    }\n    return ");

                // end
                // begin [file="/_Type_.jsp";from=(1003,14);to=(1003,20)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1003,22);to=(1005,17)]
                    out.write(".getId(); \n  }\n  public void set");

                // end
                // begin [file="/_Type_.jsp";from=(1005,20);to=(1005,29)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1005,31);to=(1006,4)]
                    out.write("Id(String v) {\n    ");

                // end
                // begin [file="/_Type_.jsp";from=(1006,7);to=(1006,13)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1006,15);to=(1007,4)]
                    out.write("Id = v;\n    ");

                // end
                // begin [file="/_Type_.jsp";from=(1007,7);to=(1007,13)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1007,15);to=(1007,34)]
                    out.write(" = channel.getData(");

                // end
                // begin [file="/_Type_.jsp";from=(1007,37);to=(1007,43)]
                    out.print( type );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1007,45);to=(1009,0)]
                    out.write(".class, v);   \n  }\n");

                // end
                // begin [file="/_Type_.jsp";from=(1009,2);to=(1009,14)]
                       } else { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1009,16);to=(1010,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(1010,2);to=(1010,71)]
                         String collection = itFieldEntry.isTypeList() ? "List" : "Set"; 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1010,73);to=(1012,9)]
                    out.write("\n  @JsonIgnore\n  public ");

                // end
                // begin [file="/_Type_.jsp";from=(1012,12);to=(1012,24)]
                    out.print( collection );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1012,26);to=(1012,38)]
                    out.write("<String> get");

                // end
                // begin [file="/_Type_.jsp";from=(1012,41);to=(1012,50)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1012,52);to=(1014,13)]
                    out.write("Id() {\n    if (isDBData()) { \n      return ");

                // end
                // begin [file="/_Type_.jsp";from=(1014,16);to=(1014,22)]
                    out.print( name );
                // end
                // begin [file="/_Type_.jsp";from=(1014,27);to=(1014,39)]
                    out.print( collection );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1014,41);to=(1014,53)]
                    out.write("Helper.getId");

                // end
                // begin [file="/_Type_.jsp";from=(1014,56);to=(1014,68)]
                    out.print( collection );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1014,70);to=(1018,17)]
                    out.write("();\n    }\n    return null;\n  }\n  public void set");

                // end
                // begin [file="/_Type_.jsp";from=(1018,20);to=(1018,29)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1018,31);to=(1018,34)]
                    out.write("Id(");

                // end
                // begin [file="/_Type_.jsp";from=(1018,37);to=(1018,49)]
                    out.print( collection );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1018,51);to=(1020,6)]
                    out.write("<String> v) { \n    if (isDBData()) { \n      ");

                // end
                // begin [file="/_Type_.jsp";from=(1020,9);to=(1020,15)]
                    out.print( name );
                // end
                // begin [file="/_Type_.jsp";from=(1020,20);to=(1020,32)]
                    out.print( collection );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1020,34);to=(1020,46)]
                    out.write("Helper.setId");

                // end
                // begin [file="/_Type_.jsp";from=(1020,49);to=(1020,61)]
                    out.print( collection );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1020,63);to=(1023,0)]
                    out.write("(v);\n    }\n  }\n");

                // end
                // begin [file="/_Type_.jsp";from=(1023,2);to=(1023,7)]
                       } 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1023,9);to=(1024,0)]
                    out.write("  \n");

                // end
                // begin [file="/_Type_.jsp";from=(1024,2);to=(1024,5)]
                     } 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1024,7);to=(1027,0)]
                    out.write("\n  \n\n");

                // end
                // HTML // begin [file="/_Type_.jsp";from=(1027,36);to=(1028,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(1028,2);to=(1028,89)]
                     if (typeShort.equals("String") || typeShort.equals("com.jalios.jcms.FileDocument")) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1028,91);to=(1029,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(1029,2);to=(1029,20)]
                       if (fieldML) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1029,22);to=(1030,2)]
                    out.write("\n  ");

                // end
                // begin [file="/_Type_.jsp";from=(1030,4);to=(1039,2)]
                    
                       String defaultValueML = "null";
                       if (type.equals("String")) {
                         defaultValueML = "channel.getTypeFieldEntry(" + className + ".class, \"" + name + "\", true).getDefaultTextMap()";
                       } else if (type.equals("String[]")) {
                         defaultValueML = "channel.getTypeFieldEntry(" + className + ".class, \"" + name + "\", true).getDefaultTextMapArray()";
                       } else if (type.equals("List<String>")) {
                         defaultValueML = "channel.getTypeFieldEntry(" + className + ".class, \"" + name + "\", true).getDefaultTextMapList()";
                       }
                      
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1039,4);to=(1040,27)]
                    out.write("\n  protected HashMap<String,");

                // end
                // begin [file="/_Type_.jsp";from=(1040,30);to=(1040,36)]
                    out.print( type );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1040,38);to=(1040,40)]
                    out.write("> ");

                // end
                // begin [file="/_Type_.jsp";from=(1040,43);to=(1040,49)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1040,51);to=(1040,56)]
                    out.write("ML = ");

                // end
                // begin [file="/_Type_.jsp";from=(1040,59);to=(1040,75)]
                    out.print( defaultValueML );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1040,77);to=(1041,9)]
                    out.write(";\n  public ");

                // end
                // begin [file="/_Type_.jsp";from=(1041,12);to=(1041,18)]
                    out.print( type );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1041,20);to=(1041,24)]
                    out.write(" get");

                // end
                // begin [file="/_Type_.jsp";from=(1041,27);to=(1041,36)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1041,38);to=(1041,62)]
                    out.write("(String lang) { return (");

                // end
                // begin [file="/_Type_.jsp";from=(1041,65);to=(1041,71)]
                    out.print( type );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1041,73);to=(1041,107)]
                    out.write(")channel.getLangValue(lang, true, ");

                // end
                // begin [file="/_Type_.jsp";from=(1041,110);to=(1041,116)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1041,118);to=(1041,120)]
                    out.write(", ");

                // end
                // begin [file="/_Type_.jsp";from=(1041,123);to=(1041,129)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1041,131);to=(1042,9)]
                    out.write("ML, getMainLanguage()); }\n  public ");

                // end
                // begin [file="/_Type_.jsp";from=(1042,12);to=(1042,18)]
                    out.print( type );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1042,20);to=(1042,24)]
                    out.write(" get");

                // end
                // begin [file="/_Type_.jsp";from=(1042,27);to=(1042,36)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1042,38);to=(1042,82)]
                    out.write("(String lang, boolean useDefault) { return (");

                // end
                // begin [file="/_Type_.jsp";from=(1042,85);to=(1042,91)]
                    out.print( type );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1042,93);to=(1042,133)]
                    out.write(")channel.getLangValue(lang, useDefault, ");

                // end
                // begin [file="/_Type_.jsp";from=(1042,136);to=(1042,142)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1042,144);to=(1042,146)]
                    out.write(", ");

                // end
                // begin [file="/_Type_.jsp";from=(1042,149);to=(1042,155)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1042,157);to=(1043,24)]
                    out.write("ML, getMainLanguage()); }\n  public HashMap<String,");

                // end
                // begin [file="/_Type_.jsp";from=(1043,27);to=(1043,33)]
                    out.print( type );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1043,35);to=(1043,40)]
                    out.write("> get");

                // end
                // begin [file="/_Type_.jsp";from=(1043,43);to=(1043,52)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1043,54);to=(1043,68)]
                    out.write("ML() { return ");

                // end
                // begin [file="/_Type_.jsp";from=(1043,71);to=(1043,77)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1043,79);to=(1044,17)]
                    out.write("ML; }\n  public void set");

                // end
                // begin [file="/_Type_.jsp";from=(1044,20);to=(1044,29)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1044,31);to=(1044,49)]
                    out.write("ML(HashMap<String,");

                // end
                // begin [file="/_Type_.jsp";from=(1044,52);to=(1044,58)]
                    out.print( type );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1044,60);to=(1044,67)]
                    out.write("> v) { ");

                // end
                // begin [file="/_Type_.jsp";from=(1044,70);to=(1044,76)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1044,78);to=(1046,19)]
                    out.write("ML = v; }\n  \n  public String get");

                // end
                // begin [file="/_Type_.jsp";from=(1046,22);to=(1046,31)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1046,33);to=(1047,33)]
                    out.write("MLE() { \n    return JcmsUtil.encodeMLE(get");

                // end
                // begin [file="/_Type_.jsp";from=(1047,36);to=(1047,45)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1047,47);to=(1050,17)]
                    out.write("ML());\n  }\n  \n  public void set");

                // end
                // begin [file="/_Type_.jsp";from=(1050,20);to=(1050,29)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1050,31);to=(1051,7)]
                    out.write("MLE(String v) {\n    set");

                // end
                // begin [file="/_Type_.jsp";from=(1051,10);to=(1051,19)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1051,21);to=(1054,17)]
                    out.write("ML(JcmsUtil.decodeMLE(v));\n  }\n  \n  public void set");

                // end
                // begin [file="/_Type_.jsp";from=(1054,20);to=(1054,29)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1054,31);to=(1054,45)]
                    out.write("(String lang, ");

                // end
                // begin [file="/_Type_.jsp";from=(1054,48);to=(1054,54)]
                    out.print( type );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1054,56);to=(1056,6)]
                    out.write(" value) {\n    if (channel.getLanguage().equals(lang)) {\n      ");

                // end
                // begin [file="/_Type_.jsp";from=(1056,9);to=(1056,15)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1056,17);to=(1059,8)]
                    out.write(" = value;\n      return;\n    }\n    if (");

                // end
                // begin [file="/_Type_.jsp";from=(1059,11);to=(1059,17)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1059,19);to=(1060,6)]
                    out.write("ML == null) {\n      ");

                // end
                // begin [file="/_Type_.jsp";from=(1060,9);to=(1060,15)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1060,17);to=(1062,6)]
                    out.write("ML = new HashMap<>();\n    } else if (this != channel.getData(id)) {\n      ");

                // end
                // begin [file="/_Type_.jsp";from=(1062,9);to=(1062,15)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1062,17);to=(1062,36)]
                    out.write("ML = new HashMap<>(");

                // end
                // begin [file="/_Type_.jsp";from=(1062,39);to=(1062,45)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1062,47);to=(1064,4)]
                    out.write("ML);\n    }\n    ");

                // end
                // begin [file="/_Type_.jsp";from=(1064,7);to=(1064,13)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1064,15);to=(1066,0)]
                    out.write("ML.put(lang, value);\n  }\n");

                // end
                // begin [file="/_Type_.jsp";from=(1066,2);to=(1066,14)]
                       } else { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1066,16);to=(1067,9)]
                    out.write("\n  public ");

                // end
                // begin [file="/_Type_.jsp";from=(1067,12);to=(1067,18)]
                    out.print( type );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1067,20);to=(1067,24)]
                    out.write(" get");

                // end
                // begin [file="/_Type_.jsp";from=(1067,27);to=(1067,36)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1067,38);to=(1067,61)]
                    out.write("(String lang) { return ");

                // end
                // begin [file="/_Type_.jsp";from=(1067,64);to=(1067,70)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1067,72);to=(1068,9)]
                    out.write("; }\n  public ");

                // end
                // begin [file="/_Type_.jsp";from=(1068,12);to=(1068,18)]
                    out.print( type );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1068,20);to=(1068,24)]
                    out.write(" get");

                // end
                // begin [file="/_Type_.jsp";from=(1068,27);to=(1068,36)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1068,38);to=(1068,81)]
                    out.write("(String lang, boolean useDefault) { return ");

                // end
                // begin [file="/_Type_.jsp";from=(1068,84);to=(1068,90)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1068,92);to=(1069,0)]
                    out.write("; }\n");

                // end
                // begin [file="/_Type_.jsp";from=(1069,2);to=(1069,7)]
                       } 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1069,9);to=(1070,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(1070,2);to=(1070,5)]
                     } 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1070,7);to=(1072,0)]
                    out.write("\n\n");

                // end
                // HTML // begin [file="/_Type_.jsp";from=(1072,53);to=(1073,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(1073,2);to=(1073,36)]
                     if (editor.equals("sqlquery")) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1073,38);to=(1075,18)]
                    out.write("\n  \n  protected String");

                // end
                // begin [file="/_Type_.jsp";from=(1075,21);to=(1075,42)]
                    out.print( isArray ? "[]" : "" );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1075,44);to=(1075,45)]
                    out.write(" ");

                // end
                // begin [file="/_Type_.jsp";from=(1075,48);to=(1075,54)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1075,56);to=(1075,66)]
                    out.write("DataSource");

                // end
                // begin [file="/_Type_.jsp";from=(1075,69);to=(1075,189)]
                    out.print( Util.isEmpty(dataSource) ? "" : " = " + (isArray ? "new String[]{\"" : "\"" ) + dataSource + (isArray ? "\"}" : "\"" ) );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1075,191);to=(1076,15)]
                    out.write(";\n  public String");

                // end
                // begin [file="/_Type_.jsp";from=(1076,18);to=(1076,39)]
                    out.print( isArray ? "[]" : "" );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1076,41);to=(1076,45)]
                    out.write(" get");

                // end
                // begin [file="/_Type_.jsp";from=(1076,48);to=(1076,57)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1076,59);to=(1076,81)]
                    out.write("DataSource() { return ");

                // end
                // begin [file="/_Type_.jsp";from=(1076,84);to=(1076,90)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1076,92);to=(1077,17)]
                    out.write("DataSource; }\n  public void set");

                // end
                // begin [file="/_Type_.jsp";from=(1077,20);to=(1077,29)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1077,31);to=(1077,48)]
                    out.write("DataSource(String");

                // end
                // begin [file="/_Type_.jsp";from=(1077,51);to=(1077,72)]
                    out.print( isArray ? "[]" : "" );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1077,74);to=(1077,80)]
                    out.write(" v) { ");

                // end
                // begin [file="/_Type_.jsp";from=(1077,83);to=(1077,89)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1077,91);to=(1079,15)]
                    out.write("DataSource = v; }\n  \n  protected int");

                // end
                // begin [file="/_Type_.jsp";from=(1079,18);to=(1079,39)]
                    out.print( isArray ? "[]" : "" );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1079,41);to=(1079,42)]
                    out.write(" ");

                // end
                // begin [file="/_Type_.jsp";from=(1079,45);to=(1079,51)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1079,53);to=(1080,12)]
                    out.write("MaxRows;\n  public int");

                // end
                // begin [file="/_Type_.jsp";from=(1080,15);to=(1080,36)]
                    out.print( isArray ? "[]" : "" );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1080,38);to=(1080,42)]
                    out.write(" get");

                // end
                // begin [file="/_Type_.jsp";from=(1080,45);to=(1080,54)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1080,56);to=(1080,75)]
                    out.write("MaxRows() { return ");

                // end
                // begin [file="/_Type_.jsp";from=(1080,78);to=(1080,84)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1080,86);to=(1081,17)]
                    out.write("MaxRows; }\n  public void set");

                // end
                // begin [file="/_Type_.jsp";from=(1081,20);to=(1081,29)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1081,31);to=(1081,42)]
                    out.write("MaxRows(int");

                // end
                // begin [file="/_Type_.jsp";from=(1081,45);to=(1081,66)]
                    out.print( isArray ? "[]" : "" );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1081,68);to=(1081,74)]
                    out.write(" v) { ");

                // end
                // begin [file="/_Type_.jsp";from=(1081,77);to=(1081,83)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1081,85);to=(1083,24)]
                    out.write("MaxRows = v; }\n  \n   public SQLQueryResult");

                // end
                // begin [file="/_Type_.jsp";from=(1083,27);to=(1083,48)]
                    out.print( isArray ? "[]" : "" );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1083,50);to=(1083,54)]
                    out.write(" get");

                // end
                // begin [file="/_Type_.jsp";from=(1083,57);to=(1083,66)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1083,68);to=(1084,1)]
                    out.write("SQR() {\n ");

                // end
                // begin [file="/_Type_.jsp";from=(1084,3);to=(1084,19)]
                     if (isArray) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1084,21);to=(1085,8)]
                    out.write("\n    if (");

                // end
                // begin [file="/_Type_.jsp";from=(1085,11);to=(1085,17)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1085,19);to=(1088,51)]
                    out.write(" == null) {\n      return null;\n    }\n    SQLQueryResult[] sqrArray = new SQLQueryResult[");

                // end
                // begin [file="/_Type_.jsp";from=(1088,54);to=(1088,60)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1088,62);to=(1089,24)]
                    out.write(".length];\n    for(int i = 0 ; i < ");

                // end
                // begin [file="/_Type_.jsp";from=(1089,27);to=(1089,33)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1089,35);to=(1090,39)]
                    out.write(".length; i++) {\n      sqrArray[i] = new SQLQueryResult(");

                // end
                // begin [file="/_Type_.jsp";from=(1090,42);to=(1090,48)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1090,50);to=(1090,65)]
                    out.write("DataSource[i], ");

                // end
                // begin [file="/_Type_.jsp";from=(1090,68);to=(1090,74)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1090,76);to=(1090,81)]
                    out.write("[i], ");

                // end
                // begin [file="/_Type_.jsp";from=(1090,84);to=(1090,90)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1090,92);to=(1093,0)]
                    out.write("MaxRows[i]);\n    }\n    return sqrArray; \n");

                // end
                // begin [file="/_Type_.jsp";from=(1093,2);to=(1093,12)]
                     } else { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1093,14);to=(1094,30)]
                    out.write("\n    return new SQLQueryResult(");

                // end
                // begin [file="/_Type_.jsp";from=(1094,33);to=(1094,39)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1094,41);to=(1094,53)]
                    out.write("DataSource, ");

                // end
                // begin [file="/_Type_.jsp";from=(1094,56);to=(1094,62)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1094,64);to=(1094,66)]
                    out.write(", ");

                // end
                // begin [file="/_Type_.jsp";from=(1094,69);to=(1094,75)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1094,77);to=(1095,0)]
                    out.write("MaxRows);\n");

                // end
                // begin [file="/_Type_.jsp";from=(1095,2);to=(1095,5)]
                     } 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1095,7);to=(1097,0)]
                    out.write("\n  }\n");

                // end
                // begin [file="/_Type_.jsp";from=(1097,2);to=(1097,5)]
                     } 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1097,7);to=(1099,0)]
                    out.write("\n\n");

                // end
                // HTML // begin [file="/_Type_.jsp";from=(1099,43);to=(1100,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(1100,2);to=(1100,33)]
                     if (type.equals("boolean")) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1100,35);to=(1101,19)]
                    out.write("\n  public String get");

                // end
                // begin [file="/_Type_.jsp";from=(1101,22);to=(1101,31)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1101,33);to=(1102,69)]
                    out.write("Label(String lang) {\n    TypeFieldEntry tfe = channel.getTypeFieldEntry(this.getClass(), \"");

                // end
                // begin [file="/_Type_.jsp";from=(1102,72);to=(1102,78)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1102,80);to=(1103,11)]
                    out.write("\", true);\n    return ");

                // end
                // begin [file="/_Type_.jsp";from=(1103,14);to=(1103,20)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1103,22);to=(1105,0)]
                    out.write(" ? tfe.getOnLabel(lang) : tfe.getOffLabel(lang); \n  }\n");

                // end
                // begin [file="/_Type_.jsp";from=(1105,2);to=(1105,5)]
                     } 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1105,7);to=(1107,0)]
                    out.write("\n\n");

                // end
                // HTML // begin [file="/_Type_.jsp";from=(1107,45);to=(1108,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(1108,2);to=(1108,35)]
                     if (type.equals("boolean[]")) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1108,37);to=(1109,19)]
                    out.write("\n  public String get");

                // end
                // begin [file="/_Type_.jsp";from=(1109,22);to=(1109,31)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1109,33);to=(1110,8)]
                    out.write("Label(int i, String lang) {\n    if (");

                // end
                // begin [file="/_Type_.jsp";from=(1110,11);to=(1110,17)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1110,19);to=(1110,36)]
                    out.write(" == null || i >= ");

                // end
                // begin [file="/_Type_.jsp";from=(1110,39);to=(1110,45)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1110,47);to=(1114,69)]
                    out.write(".length) {\n      return \"\";\n    }\n  \n    TypeFieldEntry tfe = channel.getTypeFieldEntry(this.getClass(), \"");

                // end
                // begin [file="/_Type_.jsp";from=(1114,72);to=(1114,78)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1114,80);to=(1115,11)]
                    out.write("\", true);\n    return ");

                // end
                // begin [file="/_Type_.jsp";from=(1115,14);to=(1115,20)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1115,22);to=(1117,0)]
                    out.write("[i] ? tfe.getOnLabel(lang) : tfe.getOffLabel(lang); \n  }\n");

                // end
                // begin [file="/_Type_.jsp";from=(1117,2);to=(1117,5)]
                     } 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1117,7);to=(1119,0)]
                    out.write("\n\n");

                // end
                // HTML // begin [file="/_Type_.jsp";from=(1119,45);to=(1120,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(1120,2);to=(1120,39)]
                     if (type.equals("List<Boolean>")) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1120,41);to=(1121,19)]
                    out.write("\n  public String get");

                // end
                // begin [file="/_Type_.jsp";from=(1121,22);to=(1121,31)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1121,33);to=(1122,8)]
                    out.write("Label(int i, String lang) {\n    if (");

                // end
                // begin [file="/_Type_.jsp";from=(1122,11);to=(1122,17)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1122,19);to=(1122,36)]
                    out.write(" == null || i >= ");

                // end
                // begin [file="/_Type_.jsp";from=(1122,39);to=(1122,45)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1122,47);to=(1126,69)]
                    out.write(".size()) {\n      return \"\";\n    }\n  \n    TypeFieldEntry tfe = channel.getTypeFieldEntry(this.getClass(), \"");

                // end
                // begin [file="/_Type_.jsp";from=(1126,72);to=(1126,78)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1126,80);to=(1127,11)]
                    out.write("\", true);\n    return ");

                // end
                // begin [file="/_Type_.jsp";from=(1127,14);to=(1127,20)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1127,22);to=(1129,0)]
                    out.write(".get(i) ? tfe.getOnLabel(lang) : tfe.getOffLabel(lang); \n  }\n");

                // end
                // begin [file="/_Type_.jsp";from=(1129,2);to=(1129,5)]
                     } 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1129,7);to=(1131,0)]
                    out.write("\n\n");

                // end
                // HTML // begin [file="/_Type_.jsp";from=(1131,40);to=(1132,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(1132,2);to=(1132,36)]
                     if (editor.equals("dbrecord")) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1132,38);to=(1133,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(1133,2);to=(1133,20)]
                       if (isArray) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1133,22);to=(1134,21)]
                    out.write("\n  public String[] get");

                // end
                // begin [file="/_Type_.jsp";from=(1134,24);to=(1134,33)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1134,35);to=(1135,21)]
                    out.write("Label() { \n    if (Util.isEmpty(");

                // end
                // begin [file="/_Type_.jsp";from=(1135,24);to=(1135,30)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1135,32);to=(1138,33)]
                    out.write(")) {\n      return null;\n    }\n    String[] labels = new String[");

                // end
                // begin [file="/_Type_.jsp";from=(1138,36);to=(1138,42)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1138,44);to=(1141,19)]
                    out.write(".length];\n    for(int i = 0; i < labels.length; i++) {\n      String label = \"\";\n      String key = ");

                // end
                // begin [file="/_Type_.jsp";from=(1141,22);to=(1141,28)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1141,30);to=(1144,45)]
                    out.write("[i];\n      if (Util.notEmpty(key)) { \n        try {\n          Object obj = DBUtil.getFirstValue(\"");

                // end
                // begin [file="/_Type_.jsp";from=(1144,48);to=(1144,60)]
                    out.print( dataSource );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1144,62);to=(1144,66)]
                    out.write("\", \"");

                // end
                // begin [file="/_Type_.jsp";from=(1144,69);to=(1144,82)]
                    out.print( dbrLabelCol );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1144,84);to=(1144,88)]
                    out.write("\", \"");

                // end
                // begin [file="/_Type_.jsp";from=(1144,91);to=(1144,101)]
                    out.print( dbrTable );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1144,103);to=(1144,107)]
                    out.write("\", \"");

                // end
                // begin [file="/_Type_.jsp";from=(1144,110);to=(1144,122)]
                    out.print( dbrOrderBy );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1144,124);to=(1144,141)]
                    out.write("\", new String[]{\"");

                // end
                // begin [file="/_Type_.jsp";from=(1144,144);to=(1144,155)]
                    out.print( dbrKeyCol );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1144,157);to=(1155,21)]
                    out.write("\"}, new String[]{key}, true);\n          label =  obj != null ? obj.toString() : JcmsUtil.glp(channel.getLanguage(), \"ui.sql.lbl.unkn-rec\"); \n        }\n        catch(java.sql.SQLException ex) {\n          label =  JcmsUtil.glp(channel.getLanguage(), \"ui.sql.lbl.error\");\n        }\n      }\n      labels[i] = label;\n    }\n    return labels;\n  }\n  public String[] get");

                // end
                // begin [file="/_Type_.jsp";from=(1155,24);to=(1155,33)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1155,35);to=(1156,21)]
                    out.write("DisplayParams() { \n    if (Util.isEmpty(");

                // end
                // begin [file="/_Type_.jsp";from=(1156,24);to=(1156,30)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1156,32);to=(1159,33)]
                    out.write(")) {\n      return null;\n    }\n    String[] params = new String[");

                // end
                // begin [file="/_Type_.jsp";from=(1159,36);to=(1159,42)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1159,44);to=(1162,47)]
                    out.write(".length];\n    for(int i = 0; i < params.length; i++) {\n      params[i] = \n        \"dataSource=\" + ServletUtil.encodeURL(\"");

                // end
                // begin [file="/_Type_.jsp";from=(1162,50);to=(1162,62)]
                    out.print( dataSource );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1162,64);to=(1163,48)]
                    out.write("\") + \n        \"&amp;table=\"  + ServletUtil.encodeURL(\"");

                // end
                // begin [file="/_Type_.jsp";from=(1163,51);to=(1163,61)]
                    out.print( dbrTable );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1163,63);to=(1164,48)]
                    out.write("\") +\n        \"&amp;keyCol=\" + ServletUtil.encodeURL(\"");

                // end
                // begin [file="/_Type_.jsp";from=(1164,51);to=(1164,62)]
                    out.print( dbrKeyCol );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1164,64);to=(1165,47)]
                    out.write("\") +\n        \"&amp;keyVal=\" + ServletUtil.encodeURL(");

                // end
                // begin [file="/_Type_.jsp";from=(1165,50);to=(1165,56)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1165,58);to=(1169,0)]
                    out.write("[i]);\n    }\n    return params;\n  }  \n");

                // end
                // begin [file="/_Type_.jsp";from=(1169,2);to=(1169,14)]
                       } else { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1169,16);to=(1170,19)]
                    out.write("\n  public String get");

                // end
                // begin [file="/_Type_.jsp";from=(1170,22);to=(1170,31)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1170,33);to=(1172,21)]
                    out.write("Label() { \n\n    if (Util.isEmpty(");

                // end
                // begin [file="/_Type_.jsp";from=(1172,24);to=(1172,30)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1172,32);to=(1177,41)]
                    out.write(")) {\n      return \"\";\n    }\n      \n    try {\n      Object obj = DBUtil.getFirstValue(\"");

                // end
                // begin [file="/_Type_.jsp";from=(1177,44);to=(1177,56)]
                    out.print( dataSource );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1177,58);to=(1177,62)]
                    out.write("\", \"");

                // end
                // begin [file="/_Type_.jsp";from=(1177,65);to=(1177,78)]
                    out.print( dbrLabelCol );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1177,80);to=(1177,84)]
                    out.write("\", \"");

                // end
                // begin [file="/_Type_.jsp";from=(1177,87);to=(1177,97)]
                    out.print( dbrTable );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1177,99);to=(1177,103)]
                    out.write("\", \"");

                // end
                // begin [file="/_Type_.jsp";from=(1177,106);to=(1177,118)]
                    out.print( dbrOrderBy );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1177,120);to=(1177,136)]
                    out.write("\",new String[]{\"");

                // end
                // begin [file="/_Type_.jsp";from=(1177,139);to=(1177,150)]
                    out.print( dbrKeyCol );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1177,152);to=(1177,169)]
                    out.write("\"}, new String[]{");

                // end
                // begin [file="/_Type_.jsp";from=(1177,172);to=(1177,178)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1177,180);to=(1185,19)]
                    out.write("}, true);\n      return obj != null ? obj.toString() : JcmsUtil.glp(channel.getLanguage(), \"ui.sql.lbl.unkn-rec\"); \n    }\n    catch(java.sql.SQLException ex) {\n      return JcmsUtil.glp(channel.getLanguage(), \"ui.sql.lbl.error\");\n    }\n  }\n  \n  public String get");

                // end
                // begin [file="/_Type_.jsp";from=(1185,22);to=(1185,31)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1185,33);to=(1187,43)]
                    out.write("DisplayParams() { \n    return \n    \"dataSource=\" + ServletUtil.encodeURL(\"");

                // end
                // begin [file="/_Type_.jsp";from=(1187,46);to=(1187,58)]
                    out.print( dataSource );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1187,60);to=(1188,43)]
                    out.write("\") + \n    \"&amp;table=\" + ServletUtil.encodeURL(\"");

                // end
                // begin [file="/_Type_.jsp";from=(1188,46);to=(1188,56)]
                    out.print( dbrTable );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1188,58);to=(1189,44)]
                    out.write("\") +\n    \"&amp;keyCol=\" + ServletUtil.encodeURL(\"");

                // end
                // begin [file="/_Type_.jsp";from=(1189,47);to=(1189,58)]
                    out.print( dbrKeyCol );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1189,60);to=(1190,43)]
                    out.write("\") +\n    \"&amp;keyVal=\" + ServletUtil.encodeURL(");

                // end
                // begin [file="/_Type_.jsp";from=(1190,46);to=(1190,52)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1190,54);to=(1192,0)]
                    out.write(");\n  }\n");

                // end
                // begin [file="/_Type_.jsp";from=(1192,2);to=(1192,7)]
                       } 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1192,9);to=(1193,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(1193,2);to=(1193,5)]
                     } 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1193,7);to=(1195,0)]
                    out.write("\n\n");

                // end
                // HTML // begin [file="/_Type_.jsp";from=(1195,33);to=(1196,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(1196,0);to=(1196,55)]
                    /* ----  jalios:if ---- */
                    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_10 = new com.jalios.jtaglib.IfTag();
                    _jspx_th_jalios_if_10.setPageContext(pageContext);
                    _jspx_th_jalios_if_10.setParent(_jspx_th_jalios_foreach_19);
                    _jspx_th_jalios_if_10.setPredicate( itFieldEntry.isMbrEnum() );
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
                          // HTML // begin [file="/_Type_.jsp";from=(1196,55);to=(1197,23)]
                              out.write("\n  public static Set get");

                          // end
                          // begin [file="/_Type_.jsp";from=(1197,26);to=(1197,35)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1197,37);to=(1198,2)]
                              out.write("Values() {\n  ");

                          // end
                          // begin [file="/_Type_.jsp";from=(1198,4);to=(1198,49)]
                               if (Util.isEmpty(itFieldEntry.getGids())) { 
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1198,51);to=(1199,16)]
                              out.write("\n    Set<Member> ");

                          // end
                          // begin [file="/_Type_.jsp";from=(1199,19);to=(1199,25)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1199,27);to=(1200,8)]
                              out.write("MemberSet = new TreeSet<>(Member.getNameComparator());\n        ");

                          // end
                          // begin [file="/_Type_.jsp";from=(1200,11);to=(1200,17)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1200,19);to=(1201,2)]
                              out.write("MemberSet.addAll(channel.getDataSet(Member.class));\n  ");

                          // end
                          // begin [file="/_Type_.jsp";from=(1201,4);to=(1201,14)]
                               } else { 
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1201,16);to=(1202,16)]
                              out.write("\n    Set<Member> ");

                          // end
                          // begin [file="/_Type_.jsp";from=(1202,19);to=(1202,25)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1202,27);to=(1202,86)]
                              out.write("MemberSet = JcmsUtil.getMemberSetFromGroups(new String[]{ \"");

                          // end
                          // begin [file="/_Type_.jsp";from=(1202,89);to=(1202,132)]
                              out.print( Util.join(itFieldEntry.getGids(),"\",\"") );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1202,134);to=(1203,2)]
                              out.write("\" });\n  ");

                          // end
                          // begin [file="/_Type_.jsp";from=(1203,4);to=(1203,7)]
                               } 
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1203,9);to=(1204,11)]
                              out.write("\n    return ");

                          // end
                          // begin [file="/_Type_.jsp";from=(1204,14);to=(1204,20)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1204,22);to=(1206,0)]
                              out.write("MemberSet;\n  }\n");

                          // end
                          // begin [file="/_Type_.jsp";from=(1206,0);to=(1206,12)]
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
          // HTML // begin [file="/_Type_.jsp";from=(1206,12);to=(1207,0)]
              out.write("\n");

          // end
          // begin [file="/_Type_.jsp";from=(1207,0);to=(1207,55)]
              /* ----  jalios:if ---- */
              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_11 = new com.jalios.jtaglib.IfTag();
              _jspx_th_jalios_if_11.setPageContext(pageContext);
              _jspx_th_jalios_if_11.setParent(_jspx_th_jalios_foreach_19);
              _jspx_th_jalios_if_11.setPredicate( itFieldEntry.isGrpEnum() );
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
                          // HTML // begin [file="/_Type_.jsp";from=(1207,55);to=(1208,23)]
                              out.write("\n  public static Set get");

                          // end
                          // begin [file="/_Type_.jsp";from=(1208,26);to=(1208,35)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1208,37);to=(1209,8)]
                              out.write("Values() {\n    Set ");

                          // end
                          // begin [file="/_Type_.jsp";from=(1209,11);to=(1209,17)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1209,19);to=(1210,8)]
                              out.write("GroupSet = new TreeSet(Group.getNameComparator());\n        ");

                          // end
                          // begin [file="/_Type_.jsp";from=(1210,11);to=(1210,17)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1210,19);to=(1211,11)]
                              out.write("GroupSet.addAll(channel.getDataSet(Group.class));\n    return ");

                          // end
                          // begin [file="/_Type_.jsp";from=(1211,14);to=(1211,20)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1211,22);to=(1213,0)]
                              out.write("GroupSet;\n  }\n");

                          // end
                          // begin [file="/_Type_.jsp";from=(1213,0);to=(1213,12)]
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
          // HTML // begin [file="/_Type_.jsp";from=(1213,12);to=(1214,0)]
              out.write("\n");

          // end
          // begin [file="/_Type_.jsp";from=(1214,0);to=(1214,55)]
              /* ----  jalios:if ---- */
              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_12 = new com.jalios.jtaglib.IfTag();
              _jspx_th_jalios_if_12.setPageContext(pageContext);
              _jspx_th_jalios_if_12.setParent(_jspx_th_jalios_foreach_19);
              _jspx_th_jalios_if_12.setPredicate( editor.equals("boolean") );
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
                          // HTML // begin [file="/_Type_.jsp";from=(1214,55);to=(1216,28)]
                              out.write("\n\n  public static String[] get");

                          // end
                          // begin [file="/_Type_.jsp";from=(1216,31);to=(1216,40)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1216,42);to=(1220,28)]
                              out.write("Values() {\n    return new String[]{ \"true\" , \"false\" };\n  }\n  \n  public static String[] get");

                          // end
                          // begin [file="/_Type_.jsp";from=(1220,31);to=(1220,40)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1220,42);to=(1221,51)]
                              out.write("Labels(String userLang) {\n    TypeFieldEntry tfe = channel.getTypeFieldEntry(");

                          // end
                          // begin [file="/_Type_.jsp";from=(1221,54);to=(1221,65)]
                              out.print( className );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1221,67);to=(1221,76)]
                              out.write(".class, \"");

                          // end
                          // begin [file="/_Type_.jsp";from=(1221,79);to=(1221,85)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1221,87);to=(1227,0)]
                              out.write("\", true);\n    String onLabel = (String) tfe.getOnLabel(userLang);\n    String offLabel = (String) tfe.getOffLabel(userLang);\n    \n    return new String[]{ onLabel, offLabel };\n  }\n");

                          // end
                          // begin [file="/_Type_.jsp";from=(1227,0);to=(1227,12)]
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
          // HTML // begin [file="/_Type_.jsp";from=(1227,12);to=(1228,0)]
              out.write("\n");

          // end
          // begin [file="/_Type_.jsp";from=(1228,0);to=(1228,57)]
              /* ----  jalios:if ---- */
              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_13 = new com.jalios.jtaglib.IfTag();
              _jspx_th_jalios_if_13.setPageContext(pageContext);
              _jspx_th_jalios_if_13.setParent(_jspx_th_jalios_foreach_19);
              _jspx_th_jalios_if_13.setPredicate( editor.equals("enumerate") );
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
                          // HTML // begin [file="/_Type_.jsp";from=(1228,57);to=(1229,26)]
                              out.write("\n  private static String[] ");

                          // end
                          // begin [file="/_Type_.jsp";from=(1229,29);to=(1229,35)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1229,37);to=(1230,26)]
                              out.write("Values;  \n  private static String[] ");

                          // end
                          // begin [file="/_Type_.jsp";from=(1230,29);to=(1230,35)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1230,37);to=(1231,39)]
                              out.write("Labels;\n  private static Map<String, String[]> ");

                          // end
                          // begin [file="/_Type_.jsp";from=(1231,42);to=(1231,48)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1231,50);to=(1233,28)]
                              out.write("LabelsMap;\n  \n  public static String[] get");

                          // end
                          // begin [file="/_Type_.jsp";from=(1233,31);to=(1233,40)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1233,42);to=(1234,7)]
                              out.write("Values() {\n    if(");

                          // end
                          // begin [file="/_Type_.jsp";from=(1234,10);to=(1234,16)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1234,18);to=(1235,9)]
                              out.write("Values == null) {\n      set");

                          // end
                          // begin [file="/_Type_.jsp";from=(1235,12);to=(1235,21)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1235,23);to=(1235,56)]
                              out.write("Values(channel.getTypeFieldEntry(");

                          // end
                          // begin [file="/_Type_.jsp";from=(1235,59);to=(1235,70)]
                              out.print( className );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1235,72);to=(1235,81)]
                              out.write(".class, \"");

                          // end
                          // begin [file="/_Type_.jsp";from=(1235,84);to=(1235,90)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1235,92);to=(1237,11)]
                              out.write("\", true).getEnumerateValues());\n    }\n    return ");

                          // end
                          // begin [file="/_Type_.jsp";from=(1237,14);to=(1237,20)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1237,22);to=(1239,24)]
                              out.write("Values;\n  }\n  public static void set");

                          // end
                          // begin [file="/_Type_.jsp";from=(1239,27);to=(1239,36)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1239,38);to=(1240,4)]
                              out.write("Values(String[] values) {\n    ");

                          // end
                          // begin [file="/_Type_.jsp";from=(1240,7);to=(1240,13)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1240,15);to=(1243,28)]
                              out.write("Values = values;\n  }\n\n  public static String[] get");

                          // end
                          // begin [file="/_Type_.jsp";from=(1243,31);to=(1243,40)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1243,42);to=(1244,7)]
                              out.write("Labels() {\n    if(");

                          // end
                          // begin [file="/_Type_.jsp";from=(1244,10);to=(1244,16)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1244,18);to=(1245,9)]
                              out.write("Labels == null) {\n      set");

                          // end
                          // begin [file="/_Type_.jsp";from=(1245,12);to=(1245,21)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1245,23);to=(1245,56)]
                              out.write("Labels(channel.getTypeFieldEntry(");

                          // end
                          // begin [file="/_Type_.jsp";from=(1245,59);to=(1245,70)]
                              out.print( className );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1245,72);to=(1245,81)]
                              out.write(".class, \"");

                          // end
                          // begin [file="/_Type_.jsp";from=(1245,84);to=(1245,90)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1245,92);to=(1247,11)]
                              out.write("\", true).getEnumerateLabels());\n    }\n    return ");

                          // end
                          // begin [file="/_Type_.jsp";from=(1247,14);to=(1247,20)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1247,22);to=(1249,24)]
                              out.write("Labels;\n  }\n  public static void set");

                          // end
                          // begin [file="/_Type_.jsp";from=(1249,27);to=(1249,36)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1249,38);to=(1250,4)]
                              out.write("Labels(String[] labels) {\n    ");

                          // end
                          // begin [file="/_Type_.jsp";from=(1250,7);to=(1250,13)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1250,15);to=(1253,41)]
                              out.write("Labels = labels;\n  }\n\n  public static Map<String, String[]> get");

                          // end
                          // begin [file="/_Type_.jsp";from=(1253,44);to=(1253,53)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1253,55);to=(1254,7)]
                              out.write("LabelsMap() {\n    if(");

                          // end
                          // begin [file="/_Type_.jsp";from=(1254,10);to=(1254,16)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1254,18);to=(1255,9)]
                              out.write("LabelsMap == null) {\n      set");

                          // end
                          // begin [file="/_Type_.jsp";from=(1255,12);to=(1255,21)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1255,23);to=(1255,59)]
                              out.write("LabelsMap(channel.getTypeFieldEntry(");

                          // end
                          // begin [file="/_Type_.jsp";from=(1255,62);to=(1255,73)]
                              out.print( className );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1255,75);to=(1255,84)]
                              out.write(".class, \"");

                          // end
                          // begin [file="/_Type_.jsp";from=(1255,87);to=(1255,93)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1255,95);to=(1257,11)]
                              out.write("\", true).getEnumerateLabelsMap());\n    }\n    return ");

                          // end
                          // begin [file="/_Type_.jsp";from=(1257,14);to=(1257,20)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1257,22);to=(1259,24)]
                              out.write("LabelsMap;\n  }\n  public static void set");

                          // end
                          // begin [file="/_Type_.jsp";from=(1259,27);to=(1259,36)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1259,38);to=(1260,4)]
                              out.write("LabelsMap(Map<String, String[]> LabelsMap) {\n    ");

                          // end
                          // begin [file="/_Type_.jsp";from=(1260,7);to=(1260,13)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1260,15);to=(1263,28)]
                              out.write("LabelsMap = LabelsMap;\n  }\n\n  public static String[] get");

                          // end
                          // begin [file="/_Type_.jsp";from=(1263,31);to=(1263,40)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1263,42);to=(1264,26)]
                              out.write("Labels(String userLang) {\n    Map<String, String[]> ");

                          // end
                          // begin [file="/_Type_.jsp";from=(1264,29);to=(1264,35)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1264,37);to=(1264,51)]
                              out.write("LabelMap = get");

                          // end
                          // begin [file="/_Type_.jsp";from=(1264,54);to=(1264,63)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1264,65);to=(1265,32)]
                              out.write("LabelsMap();\n    String[] labels = (String[])");

                          // end
                          // begin [file="/_Type_.jsp";from=(1265,35);to=(1265,41)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1265,43);to=(1267,25)]
                              out.write("LabelMap.get(userLang);\n    if (labels == null) {\n      labels = (String[])");

                          // end
                          // begin [file="/_Type_.jsp";from=(1267,28);to=(1267,34)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1267,36);to=(1271,26)]
                              out.write("LabelMap.get(channel.getLanguage());\n    }\n    return labels;\n  }\n  public static String get");

                          // end
                          // begin [file="/_Type_.jsp";from=(1271,29);to=(1271,38)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1271,40);to=(1272,25)]
                              out.write("Label(String value, String userLang) {\n    String[] labels = get");

                          // end
                          // begin [file="/_Type_.jsp";from=(1272,28);to=(1272,37)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1272,39);to=(1277,0)]
                              out.write("Labels(userLang);\n\n    int i = 0;\n    if (false) {\n    }\n");

                          // end
                          // begin [file="/_Type_.jsp";from=(1277,0);to=(1277,107)]
                              /* ----  jalios:foreach ---- */
                              com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_20 = new com.jalios.jtaglib.ForeachTag();
                              _jspx_th_jalios_foreach_20.setPageContext(pageContext);
                              _jspx_th_jalios_foreach_20.setParent(_jspx_th_jalios_if_13);
                              _jspx_th_jalios_foreach_20.setArray( itFieldEntry.getEnumerateValues() );
                              _jspx_th_jalios_foreach_20.setName("itValue");
                              _jspx_th_jalios_foreach_20.setType("String");
                              _jspx_th_jalios_foreach_20.setCounter("c2");
                              try {
                              int _jspx_eval_jalios_foreach_20 = _jspx_th_jalios_foreach_20.doStartTag();
                              if (_jspx_eval_jalios_foreach_20 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                              try {
                              if (_jspx_eval_jalios_foreach_20 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_foreach_20.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_foreach_20.doInitBody();
                          }
                          do {
                              Integer c2 = null;
                              c2 = (Integer) pageContext.findAttribute("c2");
                              String itValue = null;
                              itValue = (String) pageContext.findAttribute("itValue");
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1277,107);to=(1278,27)]
                              out.write("\n    else if (value.equals(\"");

                          // end
                          // begin [file="/_Type_.jsp";from=(1278,30);to=(1278,66)]
                              out.print( Util.escapeJavaStringChar(itValue) );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1278,68);to=(1279,10)]
                              out.write("\")) {\n      i = ");

                          // end
                          // begin [file="/_Type_.jsp";from=(1279,13);to=(1279,32)]
                              out.print( c2.intValue() - 1 );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1279,34);to=(1281,0)]
                              out.write(";\n    }\n");

                          // end
                          // begin [file="/_Type_.jsp";from=(1281,0);to=(1281,17)]
                          } while (_jspx_th_jalios_foreach_20.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
                      } finally {
                          if (_jspx_eval_jalios_foreach_20 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                              out = pageContext.popBody();
                      }
                  }
                  if (_jspx_th_jalios_foreach_20.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
                      return;
              } finally {
                  _jspx_th_jalios_foreach_20.release();
              }
          // end
          // HTML // begin [file="/_Type_.jsp";from=(1281,17);to=(1289,14)]
              out.write("\n    else {\n      return \"???\";\n    }\n\n    if (i < labels.length) {\n      return labels[i];\n    }\n    return get");

          // end
          // begin [file="/_Type_.jsp";from=(1289,17);to=(1289,26)]
              out.print( nameCap );
          // end
          // HTML // begin [file="/_Type_.jsp";from=(1289,28);to=(1292,26)]
              out.write("Label(value, channel.getLanguage());\n  }\n  \n  public static String get");

          // end
          // begin [file="/_Type_.jsp";from=(1292,29);to=(1292,38)]
              out.print( nameCap );
          // end
          // HTML // begin [file="/_Type_.jsp";from=(1292,40);to=(1293,13)]
              out.write("Label(String value) {    \n    String[] ");

          // end
          // begin [file="/_Type_.jsp";from=(1293,16);to=(1293,22)]
              out.print( name );
          // end
          // HTML // begin [file="/_Type_.jsp";from=(1293,24);to=(1293,36)]
              out.write("Labels = get");

          // end
          // begin [file="/_Type_.jsp";from=(1293,39);to=(1293,48)]
              out.print( nameCap );
          // end
          // HTML // begin [file="/_Type_.jsp";from=(1293,50);to=(1296,0)]
              out.write("Labels();\n    if (false) {\n    }\n");

          // end
          // begin [file="/_Type_.jsp";from=(1296,0);to=(1296,107)]
              /* ----  jalios:foreach ---- */
              com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_21 = new com.jalios.jtaglib.ForeachTag();
              _jspx_th_jalios_foreach_21.setPageContext(pageContext);
              _jspx_th_jalios_foreach_21.setParent(_jspx_th_jalios_if_13);
              _jspx_th_jalios_foreach_21.setArray( itFieldEntry.getEnumerateValues() );
              _jspx_th_jalios_foreach_21.setName("itValue");
              _jspx_th_jalios_foreach_21.setType("String");
              _jspx_th_jalios_foreach_21.setCounter("c2");
              try {
                  int _jspx_eval_jalios_foreach_21 = _jspx_th_jalios_foreach_21.doStartTag();
                  if (_jspx_eval_jalios_foreach_21 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                      try {
                          if (_jspx_eval_jalios_foreach_21 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                              out = pageContext.pushBody();
                              _jspx_th_jalios_foreach_21.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                              _jspx_th_jalios_foreach_21.doInitBody();
                          }
                          do {
                              Integer c2 = null;
                              c2 = (Integer) pageContext.findAttribute("c2");
                              String itValue = null;
                              itValue = (String) pageContext.findAttribute("itValue");
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1296,107);to=(1297,27)]
                              out.write("\n    else if (value.equals(\"");

                          // end
                          // begin [file="/_Type_.jsp";from=(1297,30);to=(1297,66)]
                              out.print( Util.escapeJavaStringChar(itValue) );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1297,68);to=(1298,13)]
                              out.write("\")) {\n      return ");

                          // end
                          // begin [file="/_Type_.jsp";from=(1298,16);to=(1298,22)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1298,24);to=(1298,31)]
                              out.write("Labels[");

                          // end
                          // begin [file="/_Type_.jsp";from=(1298,34);to=(1298,53)]
                              out.print( c2.intValue() - 1 );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1298,55);to=(1300,0)]
                              out.write("];\n    }\n");

                          // end
                          // begin [file="/_Type_.jsp";from=(1300,0);to=(1300,17)]
                          } while (_jspx_th_jalios_foreach_21.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
                      } finally {
                          if (_jspx_eval_jalios_foreach_21 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                              out = pageContext.popBody();
                      }
                  }
                  if (_jspx_th_jalios_foreach_21.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
                      return;
              } finally {
                  _jspx_th_jalios_foreach_21.release();
              }
          // end
          // HTML // begin [file="/_Type_.jsp";from=(1300,17);to=(1303,0)]
              out.write("\n    return \"???\";\n  }\n");

          // end
          // begin [file="/_Type_.jsp";from=(1303,0);to=(1303,12)]
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
// HTML // begin [file="/_Type_.jsp";from=(1303,12);to=(1304,0)]
    out.write("\n");

// end
// HTML // begin [file="/_Type_.jsp";from=(1304,31);to=(1307,0)]
    out.write("\n\n\n");

// end
// HTML // begin [file="/_Type_.jsp";from=(1307,29);to=(1308,0)]
    out.write("\n");

// end
// begin [file="/_Type_.jsp";from=(1308,0);to=(1308,15)]
    /* ----  jalios:select ---- */
    com.jalios.jtaglib.SelectTag _jspx_th_jalios_select_0 = new com.jalios.jtaglib.SelectTag();
    _jspx_th_jalios_select_0.setPageContext(pageContext);
    _jspx_th_jalios_select_0.setParent(_jspx_th_jalios_foreach_19);
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
                // HTML // begin [file="/_Type_.jsp";from=(1308,15);to=(1309,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(1309,0);to=(1309,49)]
                    /* ----  jalios:if ---- */
                    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_14 = new com.jalios.jtaglib.IfTag();
                    _jspx_th_jalios_if_14.setPageContext(pageContext);
                    _jspx_th_jalios_if_14.setParent(_jspx_th_jalios_select_0);
                    _jspx_th_jalios_if_14.setPredicate( type.equals("int") );
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
                          // HTML // begin [file="/_Type_.jsp";from=(1309,49);to=(1310,37)]
                              out.write("\n  public static IntegerFormReport get");

                          // end
                          // begin [file="/_Type_.jsp";from=(1310,40);to=(1310,49)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1310,51);to=(1310,68)]
                              out.write("Report(SortedSet<");

                          // end
                          // begin [file="/_Type_.jsp";from=(1310,71);to=(1310,82)]
                              out.print( className );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1310,84);to=(1314,9)]
                              out.write("> set) {\n    long sum = 0;\n    int min = Integer.MAX_VALUE;\n    int max = Integer.MIN_VALUE;\n    for (");

                          // end
                          // begin [file="/_Type_.jsp";from=(1314,12);to=(1314,23)]
                              out.print( className );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1314,25);to=(1318,25)]
                              out.write(" obj : set) {\n      if (obj == null) {\n        continue;\n      }\n      int value = obj.get");

                          // end
                          // begin [file="/_Type_.jsp";from=(1318,28);to=(1318,37)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1318,39);to=(1325,0)]
                              out.write("();\n      sum += value;\n      min = Math.min(value, min);\n      max = Math.max(value, max);\n    }\n    return new IntegerFormReport(set.size(), sum, min, max);\n  }  \n");

                          // end
                          // begin [file="/_Type_.jsp";from=(1325,0);to=(1325,12)]
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
          // HTML // begin [file="/_Type_.jsp";from=(1325,12);to=(1327,0)]
              out.write("\n\n");

          // end
          // begin [file="/_Type_.jsp";from=(1327,0);to=(1327,110)]
              /* ----  jalios:if ---- */
              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_15 = new com.jalios.jtaglib.IfTag();
              _jspx_th_jalios_if_15.setPageContext(pageContext);
              _jspx_th_jalios_if_15.setParent(_jspx_th_jalios_select_0);
              _jspx_th_jalios_if_15.setPredicate( (editor.equals("enumerate") && type.equals("String")) || type.equals("boolean") );
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
                          // HTML // begin [file="/_Type_.jsp";from=(1327,110);to=(1328,39)]
                              out.write("\n  public static EnumerateFormReport get");

                          // end
                          // begin [file="/_Type_.jsp";from=(1328,42);to=(1328,51)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1328,53);to=(1328,70)]
                              out.write("Report(SortedSet<");

                          // end
                          // begin [file="/_Type_.jsp";from=(1328,73);to=(1328,84)]
                              out.print( className );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1328,86);to=(1331,9)]
                              out.write("> set) {\n    long sum = 0;\n    ObjectIntTreeMap map = new ObjectIntTreeMap();\n    for (");

                          // end
                          // begin [file="/_Type_.jsp";from=(1331,12);to=(1331,23)]
                              out.print( className );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1331,25);to=(1335,6)]
                              out.write(" obj : set) {\n      if (obj == null) {\n        continue;\n      }\n      ");

                          // end
                          // begin [file="/_Type_.jsp";from=(1335,8);to=(1335,64)]
                               if (type.equals("boolean") && name.startsWith("is")) { 
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1335,66);to=(1336,23)]
                              out.write("\n      map.inc(\"\" + obj.");

                          // end
                          // begin [file="/_Type_.jsp";from=(1336,26);to=(1336,32)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1336,34);to=(1337,6)]
                              out.write("());\n      ");

                          // end
                          // begin [file="/_Type_.jsp";from=(1337,8);to=(1337,17)]
                               } else {
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1337,19);to=(1338,26)]
                              out.write("\n      map.inc(\"\" + obj.get");

                          // end
                          // begin [file="/_Type_.jsp";from=(1338,29);to=(1338,38)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1338,40);to=(1339,6)]
                              out.write("());\n      ");

                          // end
                          // begin [file="/_Type_.jsp";from=(1339,8);to=(1339,11)]
                               } 
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1339,13);to=(1344,0)]
                              out.write("\n      sum++;\n    }\n    return new EnumerateFormReport(map, sum);\n  }    \n");

                          // end
                          // begin [file="/_Type_.jsp";from=(1344,0);to=(1344,12)]
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
          // HTML // begin [file="/_Type_.jsp";from=(1344,12);to=(1346,0)]
              out.write("\n\n");

          // end
          // begin [file="/_Type_.jsp";from=(1346,0);to=(1346,84)]
              /* ----  jalios:if ---- */
              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_16 = new com.jalios.jtaglib.IfTag();
              _jspx_th_jalios_if_16.setPageContext(pageContext);
              _jspx_th_jalios_if_16.setParent(_jspx_th_jalios_select_0);
              _jspx_th_jalios_if_16.setPredicate( editor.equals("enumerate") && type.equals("String[]") );
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
                          // HTML // begin [file="/_Type_.jsp";from=(1346,84);to=(1347,39)]
                              out.write("\n  public static EnumerateFormReport get");

                          // end
                          // begin [file="/_Type_.jsp";from=(1347,42);to=(1347,51)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1347,53);to=(1347,70)]
                              out.write("Report(SortedSet<");

                          // end
                          // begin [file="/_Type_.jsp";from=(1347,73);to=(1347,84)]
                              out.print( className );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1347,86);to=(1350,9)]
                              out.write("> set) {\n    long sum = 0;\n    ObjectIntTreeMap map = new ObjectIntTreeMap();\n    for (");

                          // end
                          // begin [file="/_Type_.jsp";from=(1350,12);to=(1350,23)]
                              out.print( className );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1350,25);to=(1351,32)]
                              out.write(" obj : set) {\n      if (obj == null || obj.get");

                          // end
                          // begin [file="/_Type_.jsp";from=(1351,35);to=(1351,44)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1351,46);to=(1354,32)]
                              out.write("() == null) {\n        continue;\n      }\n      for(int i = 0; i < obj.get");

                          // end
                          // begin [file="/_Type_.jsp";from=(1354,35);to=(1354,44)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1354,46);to=(1355,19)]
                              out.write("().length; i++) {\n        if (obj.get");

                          // end
                          // begin [file="/_Type_.jsp";from=(1355,22);to=(1355,31)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1355,33);to=(1356,25)]
                              out.write("()[i] != null) {\n          map.inc(obj.get");

                          // end
                          // begin [file="/_Type_.jsp";from=(1356,28);to=(1356,37)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1356,39);to=(1363,0)]
                              out.write("()[i]);\n        }\n      }\n      sum++;\n    }\n    return new EnumerateFormReport(map, sum);\n  }    \n");

                          // end
                          // begin [file="/_Type_.jsp";from=(1363,0);to=(1363,12)]
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
          // HTML // begin [file="/_Type_.jsp";from=(1363,12);to=(1365,0)]
              out.write("\n\n");

          // end
          // begin [file="/_Type_.jsp";from=(1365,0);to=(1365,121)]
              /* ----  jalios:if ---- */
              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_17 = new com.jalios.jtaglib.IfTag();
              _jspx_th_jalios_if_17.setPageContext(pageContext);
              _jspx_th_jalios_if_17.setParent(_jspx_th_jalios_select_0);
              _jspx_th_jalios_if_17.setPredicate( editor.equals("enumerate") && (type.equals("List<String>") || type.equals("Set<String>") ) );
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
                          // HTML // begin [file="/_Type_.jsp";from=(1365,121);to=(1366,39)]
                              out.write("\n  public static EnumerateFormReport get");

                          // end
                          // begin [file="/_Type_.jsp";from=(1366,42);to=(1366,51)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1366,53);to=(1366,70)]
                              out.write("Report(SortedSet<");

                          // end
                          // begin [file="/_Type_.jsp";from=(1366,73);to=(1366,84)]
                              out.print( className );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1366,86);to=(1369,9)]
                              out.write("> set) {\n    long sum = 0;\n    ObjectIntTreeMap map = new ObjectIntTreeMap();\n    for (");

                          // end
                          // begin [file="/_Type_.jsp";from=(1369,12);to=(1369,23)]
                              out.print( className );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1369,25);to=(1370,32)]
                              out.write(" obj : set) {\n      if (obj == null || obj.get");

                          // end
                          // begin [file="/_Type_.jsp";from=(1370,35);to=(1370,44)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1370,46);to=(1373,28)]
                              out.write("() == null) {\n        continue;\n      }\n      for (String v: obj.get");

                          // end
                          // begin [file="/_Type_.jsp";from=(1373,31);to=(1373,40)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1373,42);to=(1382,0)]
                              out.write("()) {\n        if (v != null) {\n          map.inc(v);\n        }\n      }\n      sum++;\n    }\n    return new EnumerateFormReport(map, sum);\n  }    \n");

                          // end
                          // begin [file="/_Type_.jsp";from=(1382,0);to=(1382,12)]
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
          // HTML // begin [file="/_Type_.jsp";from=(1382,12);to=(1383,0)]
              out.write("\n");

          // end
          // begin [file="/_Type_.jsp";from=(1383,0);to=(1383,16)]
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
// HTML // begin [file="/_Type_.jsp";from=(1383,16);to=(1384,0)]
    out.write("\n");

// end
// HTML // begin [file="/_Type_.jsp";from=(1384,27);to=(1386,0)]
    out.write("\n\n");

// end
// begin [file="/_Type_.jsp";from=(1386,0);to=(1386,17)]
} while (_jspx_th_jalios_foreach_19.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
} finally {
    if (_jspx_eval_jalios_foreach_19 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
        out = pageContext.popBody();
}
}
if (_jspx_th_jalios_foreach_19.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
    return;
} finally {
    _jspx_th_jalios_foreach_19.release();
}
// end
// HTML // begin [file="/_Type_.jsp";from=(1386,17);to=(1389,0)]
    out.write("\n\n\n");

// end
// HTML // begin [file="/_Type_.jsp";from=(1389,55);to=(1390,0)]
    out.write("\n");

// end
// begin [file="/_Type_.jsp";from=(1390,0);to=(1390,102)]
    /* ----  jalios:foreach ---- */
    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_22 = new com.jalios.jtaglib.ForeachTag();
    _jspx_th_jalios_foreach_22.setPageContext(pageContext);
    _jspx_th_jalios_foreach_22.setParent(null);
    _jspx_th_jalios_foreach_22.setCollection( sqlresultFieldEntryList );
    _jspx_th_jalios_foreach_22.setName("itFieldEntry");
    _jspx_th_jalios_foreach_22.setType("TypeFieldEntry");
    try {
        int _jspx_eval_jalios_foreach_22 = _jspx_th_jalios_foreach_22.doStartTag();
        if (_jspx_eval_jalios_foreach_22 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_foreach_22 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_foreach_22.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_foreach_22.doInitBody();
                }
                do {
                    Integer itCounter = null;
                    itCounter = (Integer) pageContext.findAttribute("itCounter");
                    TypeFieldEntry itFieldEntry = null;
                    itFieldEntry = (TypeFieldEntry) pageContext.findAttribute("itFieldEntry");
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1390,102);to=(1391,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(1391,2);to=(1418,0)]
                    
                      Element xmlField  = itFieldEntry.getXmlElement();
                      String name       = itFieldEntry.getName();
                      String nameCap    = itFieldEntry.getNameCap();
                      String dataSource = itFieldEntry.getDataSource();
                      String query      = Util.escapeJavaStringChar(xmlField.getAttributeValue("query"));
                      int maxRows       = itFieldEntry.getMaxRows();
                      
                      // Compute paramList
                      String params = xmlField.getAttributeValue("params");
                      String[] fieldNames = Util.split(params, ", ");
                      List paramList = new ArrayList();
                      for(int i = 0; i < fieldNames.length; i++) {
                        String itFieldName = fieldNames[i];
                        Element itParamField = XmlUtil.searchChild(typeElt.getChild(TypeConstants.FIELDS_ELT), TypeConstants.FIELD_ELT, "name", itFieldName);
                        if (itParamField == null) {
                          continue;
                        }
                        String itFieldType = itParamField.getAttributeValue("type");
                        if ("int".equals(itFieldType)) {
                          paramList.add("new Integer(" + itFieldName + ")");
                        } else if ("double".equals(itFieldType)) {
                          paramList.add("new Integer(" + itFieldName + ")");
                        } else {
                          paramList.add(itFieldName);
                        }
                      } 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1418,2);to=(1421,5)]
                    out.write("\n   \n  // ----------------------------------------------------------------------\n  // ");

                // end
                // begin [file="/_Type_.jsp";from=(1421,8);to=(1421,14)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1421,16);to=(1423,19)]
                    out.write("\n  // ----------------------------------------------------------------------  \n  public String get");

                // end
                // begin [file="/_Type_.jsp";from=(1423,22);to=(1423,31)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1423,33);to=(1424,12)]
                    out.write("DataSource() {\n    return \"");

                // end
                // begin [file="/_Type_.jsp";from=(1424,15);to=(1424,27)]
                    out.print( dataSource );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1424,29);to=(1427,19)]
                    out.write("\";\n  }\n  \n  public String get");

                // end
                // begin [file="/_Type_.jsp";from=(1427,22);to=(1427,31)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1427,33);to=(1428,12)]
                    out.write("SQLQuery() {\n    return \"");

                // end
                // begin [file="/_Type_.jsp";from=(1428,15);to=(1428,22)]
                    out.print( query );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1428,24);to=(1431,21)]
                    out.write("\";\n  }\n  \n  public Object[] get");

                // end
                // begin [file="/_Type_.jsp";from=(1431,24);to=(1431,33)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1431,35);to=(1432,25)]
                    out.write("SQLParams() {\n    return new Object[] {");

                // end
                // begin [file="/_Type_.jsp";from=(1432,28);to=(1432,56)]
                    out.print( Util.join(paramList, ", ") );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1432,58);to=(1435,16)]
                    out.write("};\n  }\n  \n  public int get");

                // end
                // begin [file="/_Type_.jsp";from=(1435,19);to=(1435,28)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1435,30);to=(1436,11)]
                    out.write("MaxRows() {\n    return ");

                // end
                // begin [file="/_Type_.jsp";from=(1436,14);to=(1436,23)]
                    out.print( maxRows );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1436,25);to=(1439,27)]
                    out.write(";\n  }\n    \n  public SQLQueryResult get");

                // end
                // begin [file="/_Type_.jsp";from=(1439,30);to=(1439,39)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1439,41);to=(1440,33)]
                    out.write("() {\n    return new SQLQueryResult(get");

                // end
                // begin [file="/_Type_.jsp";from=(1440,36);to=(1440,45)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1440,47);to=(1440,64)]
                    out.write("DataSource(), get");

                // end
                // begin [file="/_Type_.jsp";from=(1440,67);to=(1440,76)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1440,78);to=(1440,93)]
                    out.write("SQLQuery(), get");

                // end
                // begin [file="/_Type_.jsp";from=(1440,96);to=(1440,105)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1440,107);to=(1440,123)]
                    out.write("SQLParams(), get");

                // end
                // begin [file="/_Type_.jsp";from=(1440,126);to=(1440,135)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1440,137);to=(1442,0)]
                    out.write("MaxRows());\n  }\n");

                // end
                // begin [file="/_Type_.jsp";from=(1442,0);to=(1442,17)]
                } while (_jspx_th_jalios_foreach_22.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_foreach_22 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_foreach_22.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_foreach_22.release();
    }
// end
// HTML // begin [file="/_Type_.jsp";from=(1442,17);to=(1444,0)]
    out.write("\n\n");

// end
// HTML // begin [file="/_Type_.jsp";from=(1444,57);to=(1445,0)]
    out.write("\n");

// end
// begin [file="/_Type_.jsp";from=(1445,2);to=(1461,0)]
    
    if (isPublicationType) {
    // Search the first abstract field 
    TypeFieldEntry abstractFieldEntry = null;
    for(Iterator it = allFieldEntryList.iterator(); it.hasNext();) {
      TypeFieldEntry fieldEntry = (TypeFieldEntry) it.next();
      if (fieldEntry.isAbstract()) {
        abstractFieldEntry = fieldEntry;
        break;
      }
    }
    if (abstractFieldEntry != null) { 
      String  absName = abstractFieldEntry.getName();
      String  absType = abstractFieldEntry.getType();
      String  absNameCap = abstractFieldEntry.getNameCap();
      boolean isStringArray = absType.equals("String[]");
// end
// HTML // begin [file="/_Type_.jsp";from=(1461,2);to=(1467,55)]
    out.write("\n   \n  // ----------------------------------------------------------------------\n  // abstract\n  // ----------------------------------------------------------------------  \n  @Override\n  public void setAbstract(String lang, String value) { ");

// end
// begin [file="/_Type_.jsp";from=(1467,57);to=(1467,80)]
     if (!isStringArray) { 
// end
// HTML // begin [file="/_Type_.jsp";from=(1467,82);to=(1467,85)]
    out.write("set");

// end
// begin [file="/_Type_.jsp";from=(1467,88);to=(1467,100)]
    out.print( absNameCap );
// end
// HTML // begin [file="/_Type_.jsp";from=(1467,102);to=(1467,103)]
    out.write("(");

// end
// begin [file="/_Type_.jsp";from=(1467,106);to=(1467,153)]
    out.print( abstractFieldEntry.isFieldML() ? "lang, ": "" );
// end
// HTML // begin [file="/_Type_.jsp";from=(1467,155);to=(1467,162)]
    out.write("value);");

// end
// begin [file="/_Type_.jsp";from=(1467,164);to=(1467,167)]
     } 
// end
// HTML // begin [file="/_Type_.jsp";from=(1467,169);to=(1469,39)]
    out.write(" }\n  @Override\n  public String getAbstract() { return ");

// end
// begin [file="/_Type_.jsp";from=(1469,41);to=(1469,63)]
     if (isStringArray) { 
// end
// HTML // begin [file="/_Type_.jsp";from=(1469,65);to=(1469,79)]
    out.write("Util.getFirst(");

// end
// begin [file="/_Type_.jsp";from=(1469,82);to=(1469,91)]
    out.print( absName );
// end
// HTML // begin [file="/_Type_.jsp";from=(1469,93);to=(1469,95)]
    out.write(");");

// end
// begin [file="/_Type_.jsp";from=(1469,97);to=(1469,107)]
     } else { 
// end
// begin [file="/_Type_.jsp";from=(1469,112);to=(1469,155)]
    out.print( absType.equals("String") ? "" : "\"\" + " );
// end
// begin [file="/_Type_.jsp";from=(1469,160);to=(1469,169)]
    out.print( absName );
// end
// HTML // begin [file="/_Type_.jsp";from=(1469,171);to=(1469,172)]
    out.write(";");

// end
// begin [file="/_Type_.jsp";from=(1469,174);to=(1469,177)]
     } 
// end
// HTML // begin [file="/_Type_.jsp";from=(1469,179);to=(1471,70)]
    out.write(" }\n  @Override\n  public String getAbstract(String lang, boolean useDefault) { return ");

// end
// begin [file="/_Type_.jsp";from=(1471,72);to=(1471,94)]
     if (isStringArray) { 
// end
// HTML // begin [file="/_Type_.jsp";from=(1471,96);to=(1471,113)]
    out.write("Util.getFirst(get");

// end
// begin [file="/_Type_.jsp";from=(1471,116);to=(1471,128)]
    out.print( absNameCap );
// end
// HTML // begin [file="/_Type_.jsp";from=(1471,130);to=(1471,150)]
    out.write("(lang, useDefault));");

// end
// begin [file="/_Type_.jsp";from=(1471,152);to=(1471,162)]
     } else { 
// end
// begin [file="/_Type_.jsp";from=(1471,167);to=(1471,210)]
    out.print( absType.equals("String") ? "" : "\"\" + " );
// end
// HTML // begin [file="/_Type_.jsp";from=(1471,212);to=(1471,215)]
    out.write("get");

// end
// begin [file="/_Type_.jsp";from=(1471,218);to=(1471,230)]
    out.print( absNameCap );
// end
// HTML // begin [file="/_Type_.jsp";from=(1471,232);to=(1471,251)]
    out.write("(lang, useDefault);");

// end
// begin [file="/_Type_.jsp";from=(1471,253);to=(1471,256)]
     } 
// end
// HTML // begin [file="/_Type_.jsp";from=(1471,258);to=(1472,0)]
    out.write(" }\n");

// end
// begin [file="/_Type_.jsp";from=(1472,2);to=(1472,69)]
     if (abstractFieldEntry.isFieldML() && absType.equals("String")) { 
// end
// HTML // begin [file="/_Type_.jsp";from=(1472,71);to=(1474,60)]
    out.write("\n  @Override\n  public HashMap<String,String> getAbstractML() { return get");

// end
// begin [file="/_Type_.jsp";from=(1474,63);to=(1474,75)]
    out.print( absNameCap );
// end
// HTML // begin [file="/_Type_.jsp";from=(1474,77);to=(1475,0)]
    out.write("ML(); }\n");

// end
// begin [file="/_Type_.jsp";from=(1475,2);to=(1475,5)]
     } 
// end
// HTML // begin [file="/_Type_.jsp";from=(1475,7);to=(1476,0)]
    out.write("\n");

// end
// begin [file="/_Type_.jsp";from=(1476,2);to=(1477,2)]
     } 
    } 
// end
// HTML // begin [file="/_Type_.jsp";from=(1477,4);to=(1479,0)]
    out.write("\n\n");

// end
// HTML // begin [file="/_Type_.jsp";from=(1479,58);to=(1480,0)]
    out.write("\n");

// end
// begin [file="/_Type_.jsp";from=(1480,2);to=(1496,0)]
    
    // Search the first image field 
    TypeFieldEntry dataImageFieldEntry = null;
    for(Iterator it = allFieldEntryList.iterator(); it.hasNext();) {
      TypeFieldEntry fieldEntry = (TypeFieldEntry) it.next();
      if (fieldEntry.isDataImage()) {
        dataImageFieldEntry = fieldEntry;
        break;
      }
    }
    if (dataImageFieldEntry != null) { 
      String  absName = dataImageFieldEntry.getName();
      String  absType = dataImageFieldEntry.getType();
      String  absNameCap = dataImageFieldEntry.getNameCap();
      boolean isFileDoc = "com.jalios.jcms.FileDocument".equals(dataImageFieldEntry.getType());
      boolean isMedia = "media".equals(dataImageFieldEntry.getEditor());
// end
// HTML // begin [file="/_Type_.jsp";from=(1496,2);to=(1503,0)]
    out.write("\n   \n  // ----------------------------------------------------------------------\n  // Data image\n  // ----------------------------------------------------------------------  \n  @Override\n  public String getDataImage() {\n");

// end
// begin [file="/_Type_.jsp";from=(1503,2);to=(1503,20)]
     if (isFileDoc) { 
// end
// HTML // begin [file="/_Type_.jsp";from=(1503,22);to=(1504,45)]
    out.write("\n    FileDocument fileDoc = (FileDocument) get");

// end
// begin [file="/_Type_.jsp";from=(1504,48);to=(1504,60)]
    out.print( absNameCap );
// end
// HTML // begin [file="/_Type_.jsp";from=(1504,62);to=(1509,0)]
    out.write("();\n    String _img = fileDoc != null ? fileDoc.getDataImage() : \"\";\n    if (Util.notEmpty(_img)) {\n      return _img;\n    }\n");

// end
// begin [file="/_Type_.jsp";from=(1509,2);to=(1509,25)]
     } else if (isMedia) { 
// end
// HTML // begin [file="/_Type_.jsp";from=(1509,27);to=(1510,26)]
    out.write("\n    String mediaPath = get");

// end
// begin [file="/_Type_.jsp";from=(1510,29);to=(1510,41)]
    out.print( absNameCap );
// end
// HTML // begin [file="/_Type_.jsp";from=(1510,43);to=(1516,0)]
    out.write("();\n    FileDocument fileDoc = FileDocument.getFileDocumentFromFilename(mediaPath);\n    String _img = fileDoc != null ? fileDoc.getDataImage() : \"\";\n    if (Util.notEmpty(_img)) {\n      return _img;\n    }\n");

// end
// begin [file="/_Type_.jsp";from=(1516,2);to=(1516,12)]
     } else { 
// end
// HTML // begin [file="/_Type_.jsp";from=(1516,14);to=(1517,18)]
    out.write("\n    String _img = ");

// end
// begin [file="/_Type_.jsp";from=(1517,21);to=(1517,30)]
    out.print( absName );
// end
// HTML // begin [file="/_Type_.jsp";from=(1517,32);to=(1521,0)]
    out.write(";\n    if (Util.notEmpty(_img)) {\n      return _img;\n    }\n");

// end
// begin [file="/_Type_.jsp";from=(1521,2);to=(1521,5)]
     } 
// end
// HTML // begin [file="/_Type_.jsp";from=(1521,7);to=(1527,0)]
    out.write("  \n    return super.getDataImage();\n  }\n  \n  @Override\n  public String getDataImage(String lang, boolean useDefault) {\n");

// end
// begin [file="/_Type_.jsp";from=(1527,2);to=(1527,20)]
     if (isFileDoc) { 
// end
// HTML // begin [file="/_Type_.jsp";from=(1527,22);to=(1528,45)]
    out.write("\n    FileDocument fileDoc = (FileDocument) get");

// end
// begin [file="/_Type_.jsp";from=(1528,48);to=(1528,60)]
    out.print( absNameCap );
// end
// HTML // begin [file="/_Type_.jsp";from=(1528,62);to=(1533,0)]
    out.write("(lang, useDefault);\n    String _img = fileDoc != null ? fileDoc.getDataImage(lang, useDefault) : \"\";\n    if (Util.notEmpty(_img)) {\n      return _img;\n    }  \n");

// end
// begin [file="/_Type_.jsp";from=(1533,2);to=(1533,25)]
     } else if (isMedia) { 
// end
// HTML // begin [file="/_Type_.jsp";from=(1533,27);to=(1534,26)]
    out.write("\n    String mediaPath = get");

// end
// begin [file="/_Type_.jsp";from=(1534,29);to=(1534,41)]
    out.print( absNameCap );
// end
// HTML // begin [file="/_Type_.jsp";from=(1534,43);to=(1540,0)]
    out.write("(lang, useDefault);\n    FileDocument fileDoc = FileDocument.getFileDocumentFromFilename(mediaPath);\n    String _img = fileDoc != null ? fileDoc.getDataImage(lang, useDefault) : \"\";\n    if (Util.notEmpty(_img)) {\n      return _img;\n    }  \n");

// end
// begin [file="/_Type_.jsp";from=(1540,2);to=(1540,12)]
     } else { 
// end
// HTML // begin [file="/_Type_.jsp";from=(1540,14);to=(1541,21)]
    out.write("\n    String _img = get");

// end
// begin [file="/_Type_.jsp";from=(1541,24);to=(1541,36)]
    out.print( absNameCap );
// end
// HTML // begin [file="/_Type_.jsp";from=(1541,38);to=(1545,0)]
    out.write("(lang, useDefault);\n    if (Util.notEmpty(_img)) {\n      return _img;\n    }  \n");

// end
// begin [file="/_Type_.jsp";from=(1545,2);to=(1545,5)]
     } 
// end
// HTML // begin [file="/_Type_.jsp";from=(1545,7);to=(1549,0)]
    out.write("  \n    return super.getDataImage(lang, useDefault);\n  }\n  \n");

// end
// begin [file="/_Type_.jsp";from=(1549,2);to=(1549,5)]
     } 
// end
// HTML // begin [file="/_Type_.jsp";from=(1549,7);to=(1551,0)]
    out.write("\n\n");

// end
// HTML // begin [file="/_Type_.jsp";from=(1551,61);to=(1552,0)]
    out.write("\n");

// end
// begin [file="/_Type_.jsp";from=(1552,2);to=(1552,28)]
     if (isPublicationType) { 
// end
// HTML // begin [file="/_Type_.jsp";from=(1552,30);to=(1555,0)]
    out.write("\n  @Override\n  public String[] getSearchStrings() {\n");

// end
// begin [file="/_Type_.jsp";from=(1555,0);to=(1555,48)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_18 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_18.setPageContext(pageContext);
    _jspx_th_jalios_if_18.setParent(null);
    _jspx_th_jalios_if_18.setPredicate( isPublicationType );
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
                // HTML // begin [file="/_Type_.jsp";from=(1555,48);to=(1557,0)]
                    out.write("\n    StringBuffer sb = new StringBuffer(super.getSearchStrings()[0]);\n");

                // end
                // begin [file="/_Type_.jsp";from=(1557,0);to=(1557,12)]
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
// HTML // begin [file="/_Type_.jsp";from=(1557,12);to=(1558,0)]
    out.write("\n");

// end
// begin [file="/_Type_.jsp";from=(1558,0);to=(1558,49)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_19 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_19.setPageContext(pageContext);
    _jspx_th_jalios_if_19.setParent(null);
    _jspx_th_jalios_if_19.setPredicate( !isPublicationType );
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
                // HTML // begin [file="/_Type_.jsp";from=(1558,49);to=(1560,0)]
                    out.write("\n    StringBuffer sb = new StringBuffer();\n");

                // end
                // begin [file="/_Type_.jsp";from=(1560,0);to=(1560,12)]
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
// HTML // begin [file="/_Type_.jsp";from=(1560,12);to=(1561,29)]
    out.write("\n    sb.ensureCapacity(500 * (");

// end
// begin [file="/_Type_.jsp";from=(1561,32);to=(1561,59)]
    out.print( searchableFieldSet.size() );
// end
// HTML // begin [file="/_Type_.jsp";from=(1561,61);to=(1561,64)]
    out.write(" + ");

// end
// begin [file="/_Type_.jsp";from=(1561,67);to=(1561,96)]
    out.print( searchableFieldMLSet.size() );
// end
// HTML // begin [file="/_Type_.jsp";from=(1561,98);to=(1561,101)]
    out.write(" + ");

// end
// begin [file="/_Type_.jsp";from=(1561,104);to=(1561,136)]
    out.print( searchableArrayFieldSet.size() );
// end
// HTML // begin [file="/_Type_.jsp";from=(1561,138);to=(1561,141)]
    out.write(" + ");

// end
// begin [file="/_Type_.jsp";from=(1561,144);to=(1561,178)]
    out.print( searchableArrayFieldMLSet.size() );
// end
// HTML // begin [file="/_Type_.jsp";from=(1561,180);to=(1561,183)]
    out.write(" + ");

// end
// begin [file="/_Type_.jsp";from=(1561,186);to=(1561,217)]
    out.print( searchableListFieldSet.size() );
// end
// HTML // begin [file="/_Type_.jsp";from=(1561,219);to=(1561,222)]
    out.write(" + ");

// end
// begin [file="/_Type_.jsp";from=(1561,225);to=(1561,258)]
    out.print( searchableListFieldMLSet.size() );
// end
// HTML // begin [file="/_Type_.jsp";from=(1561,260);to=(1563,0)]
    out.write(") );\n\n");

// end
// begin [file="/_Type_.jsp";from=(1563,0);to=(1563,83)]
    /* ----  jalios:foreach ---- */
    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_23 = new com.jalios.jtaglib.ForeachTag();
    _jspx_th_jalios_foreach_23.setPageContext(pageContext);
    _jspx_th_jalios_foreach_23.setParent(null);
    _jspx_th_jalios_foreach_23.setCollection( searchableFieldSet );
    _jspx_th_jalios_foreach_23.setName("itName");
    _jspx_th_jalios_foreach_23.setType("String");
    try {
        int _jspx_eval_jalios_foreach_23 = _jspx_th_jalios_foreach_23.doStartTag();
        if (_jspx_eval_jalios_foreach_23 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_foreach_23 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_foreach_23.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_foreach_23.doInitBody();
                }
                do {
                    Integer itCounter = null;
                    itCounter = (Integer) pageContext.findAttribute("itCounter");
                    String itName = null;
                    itName = (String) pageContext.findAttribute("itName");
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1563,83);to=(1564,8)]
                    out.write("\n    if (");

                // end
                // begin [file="/_Type_.jsp";from=(1564,11);to=(1564,19)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1564,21);to=(1565,16)]
                    out.write(" != null) {\n      sb.append(");

                // end
                // begin [file="/_Type_.jsp";from=(1565,19);to=(1565,27)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1565,29);to=(1567,0)]
                    out.write("); sb.append(' ');\n    }\n");

                // end
                // begin [file="/_Type_.jsp";from=(1567,0);to=(1567,17)]
                } while (_jspx_th_jalios_foreach_23.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_foreach_23 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_foreach_23.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_foreach_23.release();
    }
// end
// HTML // begin [file="/_Type_.jsp";from=(1567,17);to=(1569,0)]
    out.write("\n\n");

// end
// begin [file="/_Type_.jsp";from=(1569,0);to=(1569,85)]
    /* ----  jalios:foreach ---- */
    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_24 = new com.jalios.jtaglib.ForeachTag();
    _jspx_th_jalios_foreach_24.setPageContext(pageContext);
    _jspx_th_jalios_foreach_24.setParent(null);
    _jspx_th_jalios_foreach_24.setCollection( searchableFieldMLSet );
    _jspx_th_jalios_foreach_24.setName("itName");
    _jspx_th_jalios_foreach_24.setType("String");
    try {
        int _jspx_eval_jalios_foreach_24 = _jspx_th_jalios_foreach_24.doStartTag();
        if (_jspx_eval_jalios_foreach_24 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_foreach_24 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_foreach_24.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_foreach_24.doInitBody();
                }
                do {
                    Integer itCounter = null;
                    itCounter = (Integer) pageContext.findAttribute("itCounter");
                    String itName = null;
                    itName = (String) pageContext.findAttribute("itName");
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1569,85);to=(1570,8)]
                    out.write("\n    if (");

                // end
                // begin [file="/_Type_.jsp";from=(1570,11);to=(1570,19)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1570,21);to=(1571,16)]
                    out.write(" != null) {\n      sb.append(");

                // end
                // begin [file="/_Type_.jsp";from=(1571,19);to=(1571,27)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1571,29);to=(1573,8)]
                    out.write("); sb.append(' '); \n    }\n    if (");

                // end
                // begin [file="/_Type_.jsp";from=(1573,11);to=(1573,19)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1573,21);to=(1574,24)]
                    out.write("ML != null) {\n      for (String str : ");

                // end
                // begin [file="/_Type_.jsp";from=(1574,27);to=(1574,35)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1574,37);to=(1580,0)]
                    out.write("ML.values()) {\n        if (str != null) {\n          sb.append(str); sb.append(' ');\n        }\n      }\n    }\n");

                // end
                // begin [file="/_Type_.jsp";from=(1580,0);to=(1580,17)]
                } while (_jspx_th_jalios_foreach_24.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_foreach_24 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_foreach_24.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_foreach_24.release();
    }
// end
// HTML // begin [file="/_Type_.jsp";from=(1580,17);to=(1582,0)]
    out.write("\n\n");

// end
// begin [file="/_Type_.jsp";from=(1582,0);to=(1582,88)]
    /* ----  jalios:foreach ---- */
    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_25 = new com.jalios.jtaglib.ForeachTag();
    _jspx_th_jalios_foreach_25.setPageContext(pageContext);
    _jspx_th_jalios_foreach_25.setParent(null);
    _jspx_th_jalios_foreach_25.setCollection( searchableArrayFieldSet );
    _jspx_th_jalios_foreach_25.setName("itName");
    _jspx_th_jalios_foreach_25.setType("String");
    try {
        int _jspx_eval_jalios_foreach_25 = _jspx_th_jalios_foreach_25.doStartTag();
        if (_jspx_eval_jalios_foreach_25 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_foreach_25 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_foreach_25.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_foreach_25.doInitBody();
                }
                do {
                    Integer itCounter = null;
                    itCounter = (Integer) pageContext.findAttribute("itCounter");
                    String itName = null;
                    itName = (String) pageContext.findAttribute("itName");
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1582,88);to=(1583,18)]
                    out.write("\n    for (int i=0; ");

                // end
                // begin [file="/_Type_.jsp";from=(1583,21);to=(1583,29)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1583,31);to=(1583,47)]
                    out.write(" != null && i < ");

                // end
                // begin [file="/_Type_.jsp";from=(1583,50);to=(1583,58)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1583,60);to=(1584,10)]
                    out.write(".length; i++) {\n      if (");

                // end
                // begin [file="/_Type_.jsp";from=(1584,13);to=(1584,21)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1584,23);to=(1585,18)]
                    out.write("[i] != null) {\n        sb.append(");

                // end
                // begin [file="/_Type_.jsp";from=(1585,21);to=(1585,29)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1585,31);to=(1588,0)]
                    out.write("[i]); sb.append(' ');\n      }\n    }\n");

                // end
                // begin [file="/_Type_.jsp";from=(1588,0);to=(1588,17)]
                } while (_jspx_th_jalios_foreach_25.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_foreach_25 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_foreach_25.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_foreach_25.release();
    }
// end
// HTML // begin [file="/_Type_.jsp";from=(1588,17);to=(1590,0)]
    out.write("\n\n");

// end
// begin [file="/_Type_.jsp";from=(1590,0);to=(1590,90)]
    /* ----  jalios:foreach ---- */
    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_26 = new com.jalios.jtaglib.ForeachTag();
    _jspx_th_jalios_foreach_26.setPageContext(pageContext);
    _jspx_th_jalios_foreach_26.setParent(null);
    _jspx_th_jalios_foreach_26.setCollection( searchableArrayFieldMLSet );
    _jspx_th_jalios_foreach_26.setName("itName");
    _jspx_th_jalios_foreach_26.setType("String");
    try {
        int _jspx_eval_jalios_foreach_26 = _jspx_th_jalios_foreach_26.doStartTag();
        if (_jspx_eval_jalios_foreach_26 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_foreach_26 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_foreach_26.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_foreach_26.doInitBody();
                }
                do {
                    Integer itCounter = null;
                    itCounter = (Integer) pageContext.findAttribute("itCounter");
                    String itName = null;
                    itName = (String) pageContext.findAttribute("itName");
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1590,90);to=(1591,17)]
                    out.write("\n    for(int i=0; ");

                // end
                // begin [file="/_Type_.jsp";from=(1591,20);to=(1591,28)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1591,30);to=(1591,46)]
                    out.write(" != null && i < ");

                // end
                // begin [file="/_Type_.jsp";from=(1591,49);to=(1591,57)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1591,59);to=(1592,10)]
                    out.write(".length; i++) {\n      if (");

                // end
                // begin [file="/_Type_.jsp";from=(1592,13);to=(1592,21)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1592,23);to=(1593,18)]
                    out.write("[i] != null) {\n        sb.append(");

                // end
                // begin [file="/_Type_.jsp";from=(1593,21);to=(1593,29)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1593,31);to=(1596,8)]
                    out.write("[i]); sb.append(' ');\n      }\n    }\n    if (");

                // end
                // begin [file="/_Type_.jsp";from=(1596,11);to=(1596,19)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1596,21);to=(1597,31)]
                    out.write("ML != null) {\n      for (String[] strArray : ");

                // end
                // begin [file="/_Type_.jsp";from=(1597,34);to=(1597,42)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1597,44);to=(1605,0)]
                    out.write("ML.values()) {\n        for(int i=0; strArray != null && i < strArray.length; i++) {\n          if (strArray[i] != null) {\n           sb.append( strArray[i]); sb.append(' ');\n          }\n        }\n      }\n    }\n");

                // end
                // begin [file="/_Type_.jsp";from=(1605,0);to=(1605,17)]
                } while (_jspx_th_jalios_foreach_26.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_foreach_26 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_foreach_26.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_foreach_26.release();
    }
// end
// HTML // begin [file="/_Type_.jsp";from=(1605,17);to=(1607,0)]
    out.write("\n\n");

// end
// begin [file="/_Type_.jsp";from=(1607,0);to=(1607,87)]
    /* ----  jalios:foreach ---- */
    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_27 = new com.jalios.jtaglib.ForeachTag();
    _jspx_th_jalios_foreach_27.setPageContext(pageContext);
    _jspx_th_jalios_foreach_27.setParent(null);
    _jspx_th_jalios_foreach_27.setCollection( searchableListFieldSet );
    _jspx_th_jalios_foreach_27.setName("itName");
    _jspx_th_jalios_foreach_27.setType("String");
    try {
        int _jspx_eval_jalios_foreach_27 = _jspx_th_jalios_foreach_27.doStartTag();
        if (_jspx_eval_jalios_foreach_27 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_foreach_27 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_foreach_27.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_foreach_27.doInitBody();
                }
                do {
                    Integer itCounter = null;
                    itCounter = (Integer) pageContext.findAttribute("itCounter");
                    String itName = null;
                    itName = (String) pageContext.findAttribute("itName");
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1607,87);to=(1608,8)]
                    out.write("\n    if (");

                // end
                // begin [file="/_Type_.jsp";from=(1608,11);to=(1608,19)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1608,21);to=(1609,24)]
                    out.write(" != null) {\n      for (String str : ");

                // end
                // begin [file="/_Type_.jsp";from=(1609,27);to=(1609,35)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1609,37);to=(1615,0)]
                    out.write(") {\n        if (str != null) {\n          sb.append(str); sb.append(' ');\n        }\n      }\n    }\n");

                // end
                // begin [file="/_Type_.jsp";from=(1615,0);to=(1615,17)]
                } while (_jspx_th_jalios_foreach_27.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_foreach_27 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_foreach_27.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_foreach_27.release();
    }
// end
// HTML // begin [file="/_Type_.jsp";from=(1615,17);to=(1617,0)]
    out.write("\n\n");

// end
// begin [file="/_Type_.jsp";from=(1617,0);to=(1617,89)]
    /* ----  jalios:foreach ---- */
    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_28 = new com.jalios.jtaglib.ForeachTag();
    _jspx_th_jalios_foreach_28.setPageContext(pageContext);
    _jspx_th_jalios_foreach_28.setParent(null);
    _jspx_th_jalios_foreach_28.setCollection( searchableListFieldMLSet );
    _jspx_th_jalios_foreach_28.setName("itName");
    _jspx_th_jalios_foreach_28.setType("String");
    try {
        int _jspx_eval_jalios_foreach_28 = _jspx_th_jalios_foreach_28.doStartTag();
        if (_jspx_eval_jalios_foreach_28 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_foreach_28 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_foreach_28.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_foreach_28.doInitBody();
                }
                do {
                    Integer itCounter = null;
                    itCounter = (Integer) pageContext.findAttribute("itCounter");
                    String itName = null;
                    itName = (String) pageContext.findAttribute("itName");
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1617,89);to=(1618,8)]
                    out.write("\n    if (");

                // end
                // begin [file="/_Type_.jsp";from=(1618,11);to=(1618,19)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1618,21);to=(1619,24)]
                    out.write(" != null) {\n      for (String str : ");

                // end
                // begin [file="/_Type_.jsp";from=(1619,27);to=(1619,35)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1619,37);to=(1625,8)]
                    out.write(") {\n        if (str != null) {\n          sb.append(str); sb.append(' ');\n        }\n      }\n    }\n    if (");

                // end
                // begin [file="/_Type_.jsp";from=(1625,11);to=(1625,19)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1625,21);to=(1626,34)]
                    out.write("ML != null) {\n      for (List<String> strList : ");

                // end
                // begin [file="/_Type_.jsp";from=(1626,37);to=(1626,45)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1626,47);to=(1636,0)]
                    out.write("ML.values()) {\n        if (strList != null) {\n          for (String str : strList) {\n            if (str != null) {\n              sb.append(str); sb.append(' ');\n            }\n          }\n        }\n      }\n    }\n");

                // end
                // begin [file="/_Type_.jsp";from=(1636,0);to=(1636,17)]
                } while (_jspx_th_jalios_foreach_28.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_foreach_28 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_foreach_28.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_foreach_28.release();
    }
// end
// HTML // begin [file="/_Type_.jsp";from=(1636,17);to=(1639,0)]
    out.write("\n    return new String[] {sb.toString()};\n  }\n");

// end
// begin [file="/_Type_.jsp";from=(1639,2);to=(1639,5)]
     } 
// end
// HTML // begin [file="/_Type_.jsp";from=(1639,7);to=(1641,0)]
    out.write("\n  \n");

// end
// HTML // begin [file="/_Type_.jsp";from=(1641,55);to=(1642,0)]
    out.write("\n");

// end
// begin [file="/_Type_.jsp";from=(1642,2);to=(1642,28)]
     if (isPublicationType) { 
// end
// HTML // begin [file="/_Type_.jsp";from=(1642,30);to=(1645,0)]
    out.write("\n  @Override\n  public String getAllWikiText() {\n");

// end
// begin [file="/_Type_.jsp";from=(1645,0);to=(1645,48)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_20 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_20.setPageContext(pageContext);
    _jspx_th_jalios_if_20.setParent(null);
    _jspx_th_jalios_if_20.setPredicate( isPublicationType );
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
                // HTML // begin [file="/_Type_.jsp";from=(1645,48);to=(1647,0)]
                    out.write("\n    StringBuffer sb = new StringBuffer(super.getAllWikiText());\n");

                // end
                // begin [file="/_Type_.jsp";from=(1647,0);to=(1647,12)]
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
// HTML // begin [file="/_Type_.jsp";from=(1647,12);to=(1648,0)]
    out.write("\n");

// end
// begin [file="/_Type_.jsp";from=(1648,0);to=(1648,49)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_21 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_21.setPageContext(pageContext);
    _jspx_th_jalios_if_21.setParent(null);
    _jspx_th_jalios_if_21.setPredicate( !isPublicationType );
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
                // HTML // begin [file="/_Type_.jsp";from=(1648,49);to=(1650,0)]
                    out.write("\n    StringBuffer sb = new StringBuffer();\n");

                // end
                // begin [file="/_Type_.jsp";from=(1650,0);to=(1650,12)]
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
// HTML // begin [file="/_Type_.jsp";from=(1650,12);to=(1651,29)]
    out.write("\n    sb.ensureCapacity(500 * (");

// end
// begin [file="/_Type_.jsp";from=(1651,32);to=(1651,53)]
    out.print( wikiFieldSet.size() );
// end
// HTML // begin [file="/_Type_.jsp";from=(1651,55);to=(1651,58)]
    out.write(" + ");

// end
// begin [file="/_Type_.jsp";from=(1651,61);to=(1651,84)]
    out.print( wikiFieldMLSet.size() );
// end
// HTML // begin [file="/_Type_.jsp";from=(1651,86);to=(1651,89)]
    out.write(" + ");

// end
// begin [file="/_Type_.jsp";from=(1651,92);to=(1651,118)]
    out.print( wikiArrayFieldSet.size() );
// end
// HTML // begin [file="/_Type_.jsp";from=(1651,120);to=(1651,123)]
    out.write(" + ");

// end
// begin [file="/_Type_.jsp";from=(1651,126);to=(1651,154)]
    out.print( wikiArrayFieldMLSet.size() );
// end
// HTML // begin [file="/_Type_.jsp";from=(1651,156);to=(1651,159)]
    out.write(" + ");

// end
// begin [file="/_Type_.jsp";from=(1651,162);to=(1651,187)]
    out.print( wikiListFieldSet.size() );
// end
// HTML // begin [file="/_Type_.jsp";from=(1651,189);to=(1651,192)]
    out.write(" + ");

// end
// begin [file="/_Type_.jsp";from=(1651,195);to=(1651,222)]
    out.print( wikiListFieldMLSet.size() );
// end
// HTML // begin [file="/_Type_.jsp";from=(1651,224);to=(1653,0)]
    out.write(") );\n\n");

// end
// begin [file="/_Type_.jsp";from=(1653,0);to=(1653,77)]
    /* ----  jalios:foreach ---- */
    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_29 = new com.jalios.jtaglib.ForeachTag();
    _jspx_th_jalios_foreach_29.setPageContext(pageContext);
    _jspx_th_jalios_foreach_29.setParent(null);
    _jspx_th_jalios_foreach_29.setCollection( wikiFieldSet );
    _jspx_th_jalios_foreach_29.setName("itName");
    _jspx_th_jalios_foreach_29.setType("String");
    try {
        int _jspx_eval_jalios_foreach_29 = _jspx_th_jalios_foreach_29.doStartTag();
        if (_jspx_eval_jalios_foreach_29 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_foreach_29 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_foreach_29.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_foreach_29.doInitBody();
                }
                do {
                    Integer itCounter = null;
                    itCounter = (Integer) pageContext.findAttribute("itCounter");
                    String itName = null;
                    itName = (String) pageContext.findAttribute("itName");
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1653,77);to=(1654,8)]
                    out.write("\n    if (");

                // end
                // begin [file="/_Type_.jsp";from=(1654,11);to=(1654,19)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1654,21);to=(1654,59)]
                    out.write(" != null && !JHTMLUtils.isJHTML(null, ");

                // end
                // begin [file="/_Type_.jsp";from=(1654,62);to=(1654,70)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1654,72);to=(1655,16)]
                    out.write(")) {\n      sb.append(");

                // end
                // begin [file="/_Type_.jsp";from=(1655,19);to=(1655,27)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1655,29);to=(1657,0)]
                    out.write("); sb.append(' ');\n    }\n");

                // end
                // begin [file="/_Type_.jsp";from=(1657,0);to=(1657,17)]
                } while (_jspx_th_jalios_foreach_29.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_foreach_29 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_foreach_29.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_foreach_29.release();
    }
// end
// HTML // begin [file="/_Type_.jsp";from=(1657,17);to=(1659,0)]
    out.write("\n\n");

// end
// begin [file="/_Type_.jsp";from=(1659,0);to=(1659,79)]
    /* ----  jalios:foreach ---- */
    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_30 = new com.jalios.jtaglib.ForeachTag();
    _jspx_th_jalios_foreach_30.setPageContext(pageContext);
    _jspx_th_jalios_foreach_30.setParent(null);
    _jspx_th_jalios_foreach_30.setCollection( wikiFieldMLSet );
    _jspx_th_jalios_foreach_30.setName("itName");
    _jspx_th_jalios_foreach_30.setType("String");
    try {
        int _jspx_eval_jalios_foreach_30 = _jspx_th_jalios_foreach_30.doStartTag();
        if (_jspx_eval_jalios_foreach_30 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_foreach_30 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_foreach_30.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_foreach_30.doInitBody();
                }
                do {
                    Integer itCounter = null;
                    itCounter = (Integer) pageContext.findAttribute("itCounter");
                    String itName = null;
                    itName = (String) pageContext.findAttribute("itName");
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1659,79);to=(1660,8)]
                    out.write("\n    if (");

                // end
                // begin [file="/_Type_.jsp";from=(1660,11);to=(1660,19)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1660,21);to=(1660,59)]
                    out.write(" != null && !JHTMLUtils.isJHTML(null, ");

                // end
                // begin [file="/_Type_.jsp";from=(1660,62);to=(1660,70)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1660,72);to=(1661,16)]
                    out.write(")) {\n      sb.append(");

                // end
                // begin [file="/_Type_.jsp";from=(1661,19);to=(1661,27)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1661,29);to=(1663,8)]
                    out.write("); sb.append(' '); \n    }\n    if (");

                // end
                // begin [file="/_Type_.jsp";from=(1663,11);to=(1663,19)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1663,21);to=(1664,24)]
                    out.write("ML != null) {\n      for (String str : ");

                // end
                // begin [file="/_Type_.jsp";from=(1664,27);to=(1664,35)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1664,37);to=(1670,0)]
                    out.write("ML.values()) {\n        if (str != null && !JHTMLUtils.isJHTML(null, str)) {\n          sb.append(str); sb.append(' ');\n        }\n      }\n    }\n");

                // end
                // begin [file="/_Type_.jsp";from=(1670,0);to=(1670,17)]
                } while (_jspx_th_jalios_foreach_30.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_foreach_30 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_foreach_30.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_foreach_30.release();
    }
// end
// HTML // begin [file="/_Type_.jsp";from=(1670,17);to=(1672,0)]
    out.write("\n\n");

// end
// begin [file="/_Type_.jsp";from=(1672,0);to=(1672,82)]
    /* ----  jalios:foreach ---- */
    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_31 = new com.jalios.jtaglib.ForeachTag();
    _jspx_th_jalios_foreach_31.setPageContext(pageContext);
    _jspx_th_jalios_foreach_31.setParent(null);
    _jspx_th_jalios_foreach_31.setCollection( wikiArrayFieldSet );
    _jspx_th_jalios_foreach_31.setName("itName");
    _jspx_th_jalios_foreach_31.setType("String");
    try {
        int _jspx_eval_jalios_foreach_31 = _jspx_th_jalios_foreach_31.doStartTag();
        if (_jspx_eval_jalios_foreach_31 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_foreach_31 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_foreach_31.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_foreach_31.doInitBody();
                }
                do {
                    Integer itCounter = null;
                    itCounter = (Integer) pageContext.findAttribute("itCounter");
                    String itName = null;
                    itName = (String) pageContext.findAttribute("itName");
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1672,82);to=(1673,17)]
                    out.write("\n    for(int i=0; ");

                // end
                // begin [file="/_Type_.jsp";from=(1673,20);to=(1673,28)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1673,30);to=(1673,46)]
                    out.write(" != null && i < ");

                // end
                // begin [file="/_Type_.jsp";from=(1673,49);to=(1673,57)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1673,59);to=(1674,10)]
                    out.write(".length; i++) {\n      if (");

                // end
                // begin [file="/_Type_.jsp";from=(1674,13);to=(1674,21)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1674,23);to=(1674,64)]
                    out.write("[i] != null && !JHTMLUtils.isJHTML(null, ");

                // end
                // begin [file="/_Type_.jsp";from=(1674,67);to=(1674,75)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1674,77);to=(1675,18)]
                    out.write("[i])) {\n        sb.append(");

                // end
                // begin [file="/_Type_.jsp";from=(1675,21);to=(1675,29)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1675,31);to=(1678,0)]
                    out.write("[i]); sb.append(' ');\n      }\n    }\n");

                // end
                // begin [file="/_Type_.jsp";from=(1678,0);to=(1678,17)]
                } while (_jspx_th_jalios_foreach_31.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_foreach_31 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_foreach_31.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_foreach_31.release();
    }
// end
// HTML // begin [file="/_Type_.jsp";from=(1678,17);to=(1680,0)]
    out.write("\n\n");

// end
// begin [file="/_Type_.jsp";from=(1680,0);to=(1680,84)]
    /* ----  jalios:foreach ---- */
    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_32 = new com.jalios.jtaglib.ForeachTag();
    _jspx_th_jalios_foreach_32.setPageContext(pageContext);
    _jspx_th_jalios_foreach_32.setParent(null);
    _jspx_th_jalios_foreach_32.setCollection( wikiArrayFieldMLSet );
    _jspx_th_jalios_foreach_32.setName("itName");
    _jspx_th_jalios_foreach_32.setType("String");
    try {
        int _jspx_eval_jalios_foreach_32 = _jspx_th_jalios_foreach_32.doStartTag();
        if (_jspx_eval_jalios_foreach_32 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_foreach_32 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_foreach_32.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_foreach_32.doInitBody();
                }
                do {
                    Integer itCounter = null;
                    itCounter = (Integer) pageContext.findAttribute("itCounter");
                    String itName = null;
                    itName = (String) pageContext.findAttribute("itName");
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1680,84);to=(1681,17)]
                    out.write("\n    for(int i=0; ");

                // end
                // begin [file="/_Type_.jsp";from=(1681,20);to=(1681,28)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1681,30);to=(1681,46)]
                    out.write(" != null && i < ");

                // end
                // begin [file="/_Type_.jsp";from=(1681,49);to=(1681,57)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1681,59);to=(1682,10)]
                    out.write(".length; i++) {\n      if (");

                // end
                // begin [file="/_Type_.jsp";from=(1682,13);to=(1682,21)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1682,23);to=(1682,64)]
                    out.write("[i] != null && !JHTMLUtils.isJHTML(null, ");

                // end
                // begin [file="/_Type_.jsp";from=(1682,67);to=(1682,75)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1682,77);to=(1683,18)]
                    out.write("[i])) {\n        sb.append(");

                // end
                // begin [file="/_Type_.jsp";from=(1683,21);to=(1683,29)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1683,31);to=(1686,8)]
                    out.write("[i]); sb.append(' ');\n      }\n    }\n    if (");

                // end
                // begin [file="/_Type_.jsp";from=(1686,11);to=(1686,19)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1686,21);to=(1687,31)]
                    out.write("ML != null) {\n      for (String[] strArray : ");

                // end
                // begin [file="/_Type_.jsp";from=(1687,34);to=(1687,42)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1687,44);to=(1695,0)]
                    out.write("ML.values()) {\n        for(int i=0; strArray != null && i < strArray.length; i++) {\n          if (strArray[i] != null && !JHTMLUtils.isJHTML(null, strArray[i])) {\n           sb.append( strArray[i]); sb.append(' ');\n          }\n        }\n      }\n    }\n");

                // end
                // begin [file="/_Type_.jsp";from=(1695,0);to=(1695,17)]
                } while (_jspx_th_jalios_foreach_32.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_foreach_32 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_foreach_32.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_foreach_32.release();
    }
// end
// HTML // begin [file="/_Type_.jsp";from=(1695,17);to=(1697,0)]
    out.write("\n\n");

// end
// begin [file="/_Type_.jsp";from=(1697,0);to=(1697,81)]
    /* ----  jalios:foreach ---- */
    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_33 = new com.jalios.jtaglib.ForeachTag();
    _jspx_th_jalios_foreach_33.setPageContext(pageContext);
    _jspx_th_jalios_foreach_33.setParent(null);
    _jspx_th_jalios_foreach_33.setCollection( wikiListFieldSet );
    _jspx_th_jalios_foreach_33.setName("itName");
    _jspx_th_jalios_foreach_33.setType("String");
    try {
        int _jspx_eval_jalios_foreach_33 = _jspx_th_jalios_foreach_33.doStartTag();
        if (_jspx_eval_jalios_foreach_33 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_foreach_33 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_foreach_33.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_foreach_33.doInitBody();
                }
                do {
                    Integer itCounter = null;
                    itCounter = (Integer) pageContext.findAttribute("itCounter");
                    String itName = null;
                    itName = (String) pageContext.findAttribute("itName");
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1697,81);to=(1698,8)]
                    out.write("\n    if (");

                // end
                // begin [file="/_Type_.jsp";from=(1698,11);to=(1698,19)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1698,21);to=(1699,24)]
                    out.write(" != null) {\n      for (String str : ");

                // end
                // begin [file="/_Type_.jsp";from=(1699,27);to=(1699,35)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1699,37);to=(1705,0)]
                    out.write(") {\n        if (str != null && !JHTMLUtils.isJHTML(null, str)) {\n          sb.append(str); sb.append(' ');\n        }\n      }\n    }\n");

                // end
                // begin [file="/_Type_.jsp";from=(1705,0);to=(1705,17)]
                } while (_jspx_th_jalios_foreach_33.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_foreach_33 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_foreach_33.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_foreach_33.release();
    }
// end
// HTML // begin [file="/_Type_.jsp";from=(1705,17);to=(1707,0)]
    out.write("\n\n");

// end
// begin [file="/_Type_.jsp";from=(1707,0);to=(1707,83)]
    /* ----  jalios:foreach ---- */
    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_34 = new com.jalios.jtaglib.ForeachTag();
    _jspx_th_jalios_foreach_34.setPageContext(pageContext);
    _jspx_th_jalios_foreach_34.setParent(null);
    _jspx_th_jalios_foreach_34.setCollection( wikiListFieldMLSet );
    _jspx_th_jalios_foreach_34.setName("itName");
    _jspx_th_jalios_foreach_34.setType("String");
    try {
        int _jspx_eval_jalios_foreach_34 = _jspx_th_jalios_foreach_34.doStartTag();
        if (_jspx_eval_jalios_foreach_34 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_foreach_34 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_foreach_34.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_foreach_34.doInitBody();
                }
                do {
                    Integer itCounter = null;
                    itCounter = (Integer) pageContext.findAttribute("itCounter");
                    String itName = null;
                    itName = (String) pageContext.findAttribute("itName");
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1707,83);to=(1708,8)]
                    out.write("\n    if (");

                // end
                // begin [file="/_Type_.jsp";from=(1708,11);to=(1708,19)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1708,21);to=(1709,24)]
                    out.write(" != null) {\n      for (String str : ");

                // end
                // begin [file="/_Type_.jsp";from=(1709,27);to=(1709,35)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1709,37);to=(1715,8)]
                    out.write(") {\n        if (str != null && !JHTMLUtils.isJHTML(null, str)) {\n          sb.append(str); sb.append(' ');\n        }\n      }\n    }\n    if (");

                // end
                // begin [file="/_Type_.jsp";from=(1715,11);to=(1715,19)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1715,21);to=(1716,34)]
                    out.write("ML != null) {\n      for (List<String> strList : ");

                // end
                // begin [file="/_Type_.jsp";from=(1716,37);to=(1716,45)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1716,47);to=(1726,0)]
                    out.write("ML.values()) {\n        if (strList != null) {\n          for (String str : strList) {\n            if (str != null && !JHTMLUtils.isJHTML(null, str)) {\n              sb.append(str); sb.append(' ');\n            }\n          }\n        }\n      }\n    }\n");

                // end
                // begin [file="/_Type_.jsp";from=(1726,0);to=(1726,17)]
                } while (_jspx_th_jalios_foreach_34.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_foreach_34 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_foreach_34.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_foreach_34.release();
    }
// end
// HTML // begin [file="/_Type_.jsp";from=(1726,17);to=(1729,0)]
    out.write("\n    return sb.toString();\n  }\n");

// end
// begin [file="/_Type_.jsp";from=(1729,2);to=(1729,5)]
     } 
// end
// HTML // begin [file="/_Type_.jsp";from=(1729,7);to=(1731,0)]
    out.write("\n  \n");

// end
// HTML // begin [file="/_Type_.jsp";from=(1731,58);to=(1732,0)]
    out.write("\n");

// end
// begin [file="/_Type_.jsp";from=(1732,2);to=(1732,28)]
     if (isPublicationType) { 
// end
// HTML // begin [file="/_Type_.jsp";from=(1732,30);to=(1735,0)]
    out.write("\n  @Override\n  public String getAllWysiwygText() {\n");

// end
// begin [file="/_Type_.jsp";from=(1735,0);to=(1735,48)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_22 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_22.setPageContext(pageContext);
    _jspx_th_jalios_if_22.setParent(null);
    _jspx_th_jalios_if_22.setPredicate( isPublicationType );
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
                // HTML // begin [file="/_Type_.jsp";from=(1735,48);to=(1737,0)]
                    out.write("\n    StringBuffer sb = new StringBuffer(super.getAllWysiwygText());\n");

                // end
                // begin [file="/_Type_.jsp";from=(1737,0);to=(1737,12)]
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
// HTML // begin [file="/_Type_.jsp";from=(1737,12);to=(1738,0)]
    out.write("\n");

// end
// begin [file="/_Type_.jsp";from=(1738,0);to=(1738,49)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_23 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_23.setPageContext(pageContext);
    _jspx_th_jalios_if_23.setParent(null);
    _jspx_th_jalios_if_23.setPredicate( !isPublicationType );
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
                // HTML // begin [file="/_Type_.jsp";from=(1738,49);to=(1740,0)]
                    out.write("\n    StringBuffer sb = new StringBuffer();\n");

                // end
                // begin [file="/_Type_.jsp";from=(1740,0);to=(1740,12)]
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
// HTML // begin [file="/_Type_.jsp";from=(1740,12);to=(1741,29)]
    out.write("\n    sb.ensureCapacity(500 * (");

// end
// begin [file="/_Type_.jsp";from=(1741,32);to=(1741,56)]
    out.print( wysiwygFieldSet.size() );
// end
// HTML // begin [file="/_Type_.jsp";from=(1741,58);to=(1741,61)]
    out.write(" + ");

// end
// begin [file="/_Type_.jsp";from=(1741,64);to=(1741,90)]
    out.print( wysiwygFieldMLSet.size() );
// end
// HTML // begin [file="/_Type_.jsp";from=(1741,92);to=(1741,95)]
    out.write(" + ");

// end
// begin [file="/_Type_.jsp";from=(1741,98);to=(1741,127)]
    out.print( wysiwygArrayFieldSet.size() );
// end
// HTML // begin [file="/_Type_.jsp";from=(1741,129);to=(1741,132)]
    out.write(" + ");

// end
// begin [file="/_Type_.jsp";from=(1741,135);to=(1741,166)]
    out.print( wysiwygArrayFieldMLSet.size() );
// end
// HTML // begin [file="/_Type_.jsp";from=(1741,168);to=(1741,171)]
    out.write(" + ");

// end
// begin [file="/_Type_.jsp";from=(1741,174);to=(1741,202)]
    out.print( wysiwygListFieldSet.size() );
// end
// HTML // begin [file="/_Type_.jsp";from=(1741,204);to=(1741,207)]
    out.write(" + ");

// end
// begin [file="/_Type_.jsp";from=(1741,210);to=(1741,240)]
    out.print( wysiwygListFieldMLSet.size() );
// end
// HTML // begin [file="/_Type_.jsp";from=(1741,242);to=(1744,0)]
    out.write(") );\n\n    // Wiki fields containing JHTML\n");

// end
// begin [file="/_Type_.jsp";from=(1744,0);to=(1744,77)]
    /* ----  jalios:foreach ---- */
    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_35 = new com.jalios.jtaglib.ForeachTag();
    _jspx_th_jalios_foreach_35.setPageContext(pageContext);
    _jspx_th_jalios_foreach_35.setParent(null);
    _jspx_th_jalios_foreach_35.setCollection( wikiFieldSet );
    _jspx_th_jalios_foreach_35.setName("itName");
    _jspx_th_jalios_foreach_35.setType("String");
    try {
        int _jspx_eval_jalios_foreach_35 = _jspx_th_jalios_foreach_35.doStartTag();
        if (_jspx_eval_jalios_foreach_35 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_foreach_35 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_foreach_35.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_foreach_35.doInitBody();
                }
                do {
                    Integer itCounter = null;
                    itCounter = (Integer) pageContext.findAttribute("itCounter");
                    String itName = null;
                    itName = (String) pageContext.findAttribute("itName");
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1744,77);to=(1745,8)]
                    out.write("\n    if (");

                // end
                // begin [file="/_Type_.jsp";from=(1745,11);to=(1745,19)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1745,21);to=(1745,58)]
                    out.write(" != null && JHTMLUtils.isJHTML(null, ");

                // end
                // begin [file="/_Type_.jsp";from=(1745,61);to=(1745,69)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1745,71);to=(1746,16)]
                    out.write(")) {\n      sb.append(");

                // end
                // begin [file="/_Type_.jsp";from=(1746,19);to=(1746,27)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1746,29);to=(1748,0)]
                    out.write("); sb.append(' ');\n    }\n");

                // end
                // begin [file="/_Type_.jsp";from=(1748,0);to=(1748,17)]
                } while (_jspx_th_jalios_foreach_35.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_foreach_35 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_foreach_35.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_foreach_35.release();
    }
// end
// HTML // begin [file="/_Type_.jsp";from=(1748,17);to=(1750,0)]
    out.write("\n\n");

// end
// begin [file="/_Type_.jsp";from=(1750,0);to=(1750,79)]
    /* ----  jalios:foreach ---- */
    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_36 = new com.jalios.jtaglib.ForeachTag();
    _jspx_th_jalios_foreach_36.setPageContext(pageContext);
    _jspx_th_jalios_foreach_36.setParent(null);
    _jspx_th_jalios_foreach_36.setCollection( wikiFieldMLSet );
    _jspx_th_jalios_foreach_36.setName("itName");
    _jspx_th_jalios_foreach_36.setType("String");
    try {
        int _jspx_eval_jalios_foreach_36 = _jspx_th_jalios_foreach_36.doStartTag();
        if (_jspx_eval_jalios_foreach_36 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_foreach_36 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_foreach_36.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_foreach_36.doInitBody();
                }
                do {
                    Integer itCounter = null;
                    itCounter = (Integer) pageContext.findAttribute("itCounter");
                    String itName = null;
                    itName = (String) pageContext.findAttribute("itName");
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1750,79);to=(1751,8)]
                    out.write("\n    if (");

                // end
                // begin [file="/_Type_.jsp";from=(1751,11);to=(1751,19)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1751,21);to=(1751,58)]
                    out.write(" != null && JHTMLUtils.isJHTML(null, ");

                // end
                // begin [file="/_Type_.jsp";from=(1751,61);to=(1751,69)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1751,71);to=(1752,16)]
                    out.write(")) {\n      sb.append(");

                // end
                // begin [file="/_Type_.jsp";from=(1752,19);to=(1752,27)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1752,29);to=(1754,8)]
                    out.write("); sb.append(' '); \n    }\n    if (");

                // end
                // begin [file="/_Type_.jsp";from=(1754,11);to=(1754,19)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1754,21);to=(1755,24)]
                    out.write("ML != null) {\n      for (String str : ");

                // end
                // begin [file="/_Type_.jsp";from=(1755,27);to=(1755,35)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1755,37);to=(1761,0)]
                    out.write("ML.values()) {\n        if (str != null && JHTMLUtils.isJHTML(null, str)) {\n          sb.append(str); sb.append(' ');\n        }\n      }\n    }\n");

                // end
                // begin [file="/_Type_.jsp";from=(1761,0);to=(1761,17)]
                } while (_jspx_th_jalios_foreach_36.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_foreach_36 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_foreach_36.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_foreach_36.release();
    }
// end
// HTML // begin [file="/_Type_.jsp";from=(1761,17);to=(1763,0)]
    out.write("\n\n");

// end
// begin [file="/_Type_.jsp";from=(1763,0);to=(1763,82)]
    /* ----  jalios:foreach ---- */
    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_37 = new com.jalios.jtaglib.ForeachTag();
    _jspx_th_jalios_foreach_37.setPageContext(pageContext);
    _jspx_th_jalios_foreach_37.setParent(null);
    _jspx_th_jalios_foreach_37.setCollection( wikiArrayFieldSet );
    _jspx_th_jalios_foreach_37.setName("itName");
    _jspx_th_jalios_foreach_37.setType("String");
    try {
        int _jspx_eval_jalios_foreach_37 = _jspx_th_jalios_foreach_37.doStartTag();
        if (_jspx_eval_jalios_foreach_37 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_foreach_37 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_foreach_37.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_foreach_37.doInitBody();
                }
                do {
                    Integer itCounter = null;
                    itCounter = (Integer) pageContext.findAttribute("itCounter");
                    String itName = null;
                    itName = (String) pageContext.findAttribute("itName");
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1763,82);to=(1764,17)]
                    out.write("\n    for(int i=0; ");

                // end
                // begin [file="/_Type_.jsp";from=(1764,20);to=(1764,28)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1764,30);to=(1764,46)]
                    out.write(" != null && i < ");

                // end
                // begin [file="/_Type_.jsp";from=(1764,49);to=(1764,57)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1764,59);to=(1765,10)]
                    out.write(".length; i++) {\n      if (");

                // end
                // begin [file="/_Type_.jsp";from=(1765,13);to=(1765,21)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1765,23);to=(1765,63)]
                    out.write("[i] != null && JHTMLUtils.isJHTML(null, ");

                // end
                // begin [file="/_Type_.jsp";from=(1765,66);to=(1765,74)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1765,76);to=(1766,18)]
                    out.write("[i])) {\n        sb.append(");

                // end
                // begin [file="/_Type_.jsp";from=(1766,21);to=(1766,29)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1766,31);to=(1769,0)]
                    out.write("[i]); sb.append(' ');\n      }\n    }\n");

                // end
                // begin [file="/_Type_.jsp";from=(1769,0);to=(1769,17)]
                } while (_jspx_th_jalios_foreach_37.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_foreach_37 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_foreach_37.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_foreach_37.release();
    }
// end
// HTML // begin [file="/_Type_.jsp";from=(1769,17);to=(1771,0)]
    out.write("\n\n");

// end
// begin [file="/_Type_.jsp";from=(1771,0);to=(1771,84)]
    /* ----  jalios:foreach ---- */
    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_38 = new com.jalios.jtaglib.ForeachTag();
    _jspx_th_jalios_foreach_38.setPageContext(pageContext);
    _jspx_th_jalios_foreach_38.setParent(null);
    _jspx_th_jalios_foreach_38.setCollection( wikiArrayFieldMLSet );
    _jspx_th_jalios_foreach_38.setName("itName");
    _jspx_th_jalios_foreach_38.setType("String");
    try {
        int _jspx_eval_jalios_foreach_38 = _jspx_th_jalios_foreach_38.doStartTag();
        if (_jspx_eval_jalios_foreach_38 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_foreach_38 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_foreach_38.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_foreach_38.doInitBody();
                }
                do {
                    Integer itCounter = null;
                    itCounter = (Integer) pageContext.findAttribute("itCounter");
                    String itName = null;
                    itName = (String) pageContext.findAttribute("itName");
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1771,84);to=(1772,17)]
                    out.write("\n    for(int i=0; ");

                // end
                // begin [file="/_Type_.jsp";from=(1772,20);to=(1772,28)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1772,30);to=(1772,46)]
                    out.write(" != null && i < ");

                // end
                // begin [file="/_Type_.jsp";from=(1772,49);to=(1772,57)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1772,59);to=(1773,10)]
                    out.write(".length; i++) {\n      if (");

                // end
                // begin [file="/_Type_.jsp";from=(1773,13);to=(1773,21)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1773,23);to=(1773,63)]
                    out.write("[i] != null && JHTMLUtils.isJHTML(null, ");

                // end
                // begin [file="/_Type_.jsp";from=(1773,66);to=(1773,74)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1773,76);to=(1774,18)]
                    out.write("[i])) {\n        sb.append(");

                // end
                // begin [file="/_Type_.jsp";from=(1774,21);to=(1774,29)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1774,31);to=(1777,8)]
                    out.write("[i]); sb.append(' ');\n      }\n    }\n    if (");

                // end
                // begin [file="/_Type_.jsp";from=(1777,11);to=(1777,19)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1777,21);to=(1778,31)]
                    out.write("ML != null) {\n      for (String[] strArray : ");

                // end
                // begin [file="/_Type_.jsp";from=(1778,34);to=(1778,42)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1778,44);to=(1786,0)]
                    out.write("ML.values()) {\n        for(int i=0; strArray != null && i < strArray.length; i++) {\n          if (strArray[i] != null && JHTMLUtils.isJHTML(null, strArray[i])) {\n           sb.append( strArray[i]); sb.append(' ');\n          }\n        }\n      }\n    }\n");

                // end
                // begin [file="/_Type_.jsp";from=(1786,0);to=(1786,17)]
                } while (_jspx_th_jalios_foreach_38.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_foreach_38 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_foreach_38.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_foreach_38.release();
    }
// end
// HTML // begin [file="/_Type_.jsp";from=(1786,17);to=(1788,0)]
    out.write("\n\n");

// end
// begin [file="/_Type_.jsp";from=(1788,0);to=(1788,81)]
    /* ----  jalios:foreach ---- */
    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_39 = new com.jalios.jtaglib.ForeachTag();
    _jspx_th_jalios_foreach_39.setPageContext(pageContext);
    _jspx_th_jalios_foreach_39.setParent(null);
    _jspx_th_jalios_foreach_39.setCollection( wikiListFieldSet );
    _jspx_th_jalios_foreach_39.setName("itName");
    _jspx_th_jalios_foreach_39.setType("String");
    try {
        int _jspx_eval_jalios_foreach_39 = _jspx_th_jalios_foreach_39.doStartTag();
        if (_jspx_eval_jalios_foreach_39 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_foreach_39 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_foreach_39.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_foreach_39.doInitBody();
                }
                do {
                    Integer itCounter = null;
                    itCounter = (Integer) pageContext.findAttribute("itCounter");
                    String itName = null;
                    itName = (String) pageContext.findAttribute("itName");
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1788,81);to=(1789,8)]
                    out.write("\n    if (");

                // end
                // begin [file="/_Type_.jsp";from=(1789,11);to=(1789,19)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1789,21);to=(1790,24)]
                    out.write(" != null) {\n      for (String str : ");

                // end
                // begin [file="/_Type_.jsp";from=(1790,27);to=(1790,35)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1790,37);to=(1796,0)]
                    out.write(") {\n        if (str != null && JHTMLUtils.isJHTML(null, str)) {\n          sb.append(str); sb.append(' ');\n        }\n      }\n    }\n");

                // end
                // begin [file="/_Type_.jsp";from=(1796,0);to=(1796,17)]
                } while (_jspx_th_jalios_foreach_39.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_foreach_39 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_foreach_39.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_foreach_39.release();
    }
// end
// HTML // begin [file="/_Type_.jsp";from=(1796,17);to=(1798,0)]
    out.write("\n\n");

// end
// begin [file="/_Type_.jsp";from=(1798,0);to=(1798,83)]
    /* ----  jalios:foreach ---- */
    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_40 = new com.jalios.jtaglib.ForeachTag();
    _jspx_th_jalios_foreach_40.setPageContext(pageContext);
    _jspx_th_jalios_foreach_40.setParent(null);
    _jspx_th_jalios_foreach_40.setCollection( wikiListFieldMLSet );
    _jspx_th_jalios_foreach_40.setName("itName");
    _jspx_th_jalios_foreach_40.setType("String");
    try {
        int _jspx_eval_jalios_foreach_40 = _jspx_th_jalios_foreach_40.doStartTag();
        if (_jspx_eval_jalios_foreach_40 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_foreach_40 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_foreach_40.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_foreach_40.doInitBody();
                }
                do {
                    Integer itCounter = null;
                    itCounter = (Integer) pageContext.findAttribute("itCounter");
                    String itName = null;
                    itName = (String) pageContext.findAttribute("itName");
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1798,83);to=(1799,8)]
                    out.write("\n    if (");

                // end
                // begin [file="/_Type_.jsp";from=(1799,11);to=(1799,19)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1799,21);to=(1800,24)]
                    out.write(" != null) {\n      for (String str : ");

                // end
                // begin [file="/_Type_.jsp";from=(1800,27);to=(1800,35)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1800,37);to=(1806,8)]
                    out.write(") {\n        if (str != null && JHTMLUtils.isJHTML(null, str)) {\n          sb.append(str); sb.append(' ');\n        }\n      }\n    }\n    if (");

                // end
                // begin [file="/_Type_.jsp";from=(1806,11);to=(1806,19)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1806,21);to=(1807,34)]
                    out.write("ML != null) {\n      for (List<String> strList : ");

                // end
                // begin [file="/_Type_.jsp";from=(1807,37);to=(1807,45)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1807,47);to=(1817,0)]
                    out.write("ML.values()) {\n        if (strList != null) {\n          for (String str : strList) {\n            if (str != null && JHTMLUtils.isJHTML(null, str)) {\n              sb.append(str); sb.append(' ');\n            }\n          }\n        }\n      }\n    }\n");

                // end
                // begin [file="/_Type_.jsp";from=(1817,0);to=(1817,17)]
                } while (_jspx_th_jalios_foreach_40.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_foreach_40 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_foreach_40.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_foreach_40.release();
    }
// end
// HTML // begin [file="/_Type_.jsp";from=(1817,17);to=(1820,0)]
    out.write("\n\n   // Wysiwyg fields\n");

// end
// begin [file="/_Type_.jsp";from=(1820,0);to=(1820,80)]
    /* ----  jalios:foreach ---- */
    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_41 = new com.jalios.jtaglib.ForeachTag();
    _jspx_th_jalios_foreach_41.setPageContext(pageContext);
    _jspx_th_jalios_foreach_41.setParent(null);
    _jspx_th_jalios_foreach_41.setCollection( wysiwygFieldSet );
    _jspx_th_jalios_foreach_41.setName("itName");
    _jspx_th_jalios_foreach_41.setType("String");
    try {
        int _jspx_eval_jalios_foreach_41 = _jspx_th_jalios_foreach_41.doStartTag();
        if (_jspx_eval_jalios_foreach_41 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_foreach_41 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_foreach_41.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_foreach_41.doInitBody();
                }
                do {
                    Integer itCounter = null;
                    itCounter = (Integer) pageContext.findAttribute("itCounter");
                    String itName = null;
                    itName = (String) pageContext.findAttribute("itName");
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1820,80);to=(1821,8)]
                    out.write("\n    if (");

                // end
                // begin [file="/_Type_.jsp";from=(1821,11);to=(1821,19)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1821,21);to=(1822,16)]
                    out.write(" != null) {\n      sb.append(");

                // end
                // begin [file="/_Type_.jsp";from=(1822,19);to=(1822,27)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1822,29);to=(1824,0)]
                    out.write("); sb.append(' ');\n    }\n");

                // end
                // begin [file="/_Type_.jsp";from=(1824,0);to=(1824,17)]
                } while (_jspx_th_jalios_foreach_41.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_foreach_41 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_foreach_41.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_foreach_41.release();
    }
// end
// HTML // begin [file="/_Type_.jsp";from=(1824,17);to=(1826,0)]
    out.write("\n\n");

// end
// begin [file="/_Type_.jsp";from=(1826,0);to=(1826,82)]
    /* ----  jalios:foreach ---- */
    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_42 = new com.jalios.jtaglib.ForeachTag();
    _jspx_th_jalios_foreach_42.setPageContext(pageContext);
    _jspx_th_jalios_foreach_42.setParent(null);
    _jspx_th_jalios_foreach_42.setCollection( wysiwygFieldMLSet );
    _jspx_th_jalios_foreach_42.setName("itName");
    _jspx_th_jalios_foreach_42.setType("String");
    try {
        int _jspx_eval_jalios_foreach_42 = _jspx_th_jalios_foreach_42.doStartTag();
        if (_jspx_eval_jalios_foreach_42 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_foreach_42 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_foreach_42.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_foreach_42.doInitBody();
                }
                do {
                    Integer itCounter = null;
                    itCounter = (Integer) pageContext.findAttribute("itCounter");
                    String itName = null;
                    itName = (String) pageContext.findAttribute("itName");
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1826,82);to=(1827,8)]
                    out.write("\n    if (");

                // end
                // begin [file="/_Type_.jsp";from=(1827,11);to=(1827,19)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1827,21);to=(1828,16)]
                    out.write(" != null) {\n      sb.append(");

                // end
                // begin [file="/_Type_.jsp";from=(1828,19);to=(1828,27)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1828,29);to=(1830,8)]
                    out.write("); sb.append(' '); \n    }\n    if (");

                // end
                // begin [file="/_Type_.jsp";from=(1830,11);to=(1830,19)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1830,21);to=(1831,24)]
                    out.write("ML != null) {\n      for (String str : ");

                // end
                // begin [file="/_Type_.jsp";from=(1831,27);to=(1831,35)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1831,37);to=(1837,0)]
                    out.write("ML.values()) {\n        if (str != null) {\n          sb.append(str); sb.append(' ');\n        }\n      }\n    }\n");

                // end
                // begin [file="/_Type_.jsp";from=(1837,0);to=(1837,17)]
                } while (_jspx_th_jalios_foreach_42.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_foreach_42 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_foreach_42.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_foreach_42.release();
    }
// end
// HTML // begin [file="/_Type_.jsp";from=(1837,17);to=(1839,0)]
    out.write("\n\n");

// end
// begin [file="/_Type_.jsp";from=(1839,0);to=(1839,85)]
    /* ----  jalios:foreach ---- */
    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_43 = new com.jalios.jtaglib.ForeachTag();
    _jspx_th_jalios_foreach_43.setPageContext(pageContext);
    _jspx_th_jalios_foreach_43.setParent(null);
    _jspx_th_jalios_foreach_43.setCollection( wysiwygArrayFieldSet );
    _jspx_th_jalios_foreach_43.setName("itName");
    _jspx_th_jalios_foreach_43.setType("String");
    try {
        int _jspx_eval_jalios_foreach_43 = _jspx_th_jalios_foreach_43.doStartTag();
        if (_jspx_eval_jalios_foreach_43 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_foreach_43 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_foreach_43.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_foreach_43.doInitBody();
                }
                do {
                    Integer itCounter = null;
                    itCounter = (Integer) pageContext.findAttribute("itCounter");
                    String itName = null;
                    itName = (String) pageContext.findAttribute("itName");
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1839,85);to=(1840,17)]
                    out.write("\n    for(int i=0; ");

                // end
                // begin [file="/_Type_.jsp";from=(1840,20);to=(1840,28)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1840,30);to=(1840,46)]
                    out.write(" != null && i < ");

                // end
                // begin [file="/_Type_.jsp";from=(1840,49);to=(1840,57)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1840,59);to=(1841,10)]
                    out.write(".length; i++) {\n      if (");

                // end
                // begin [file="/_Type_.jsp";from=(1841,13);to=(1841,21)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1841,23);to=(1842,18)]
                    out.write("[i] != null) {\n        sb.append(");

                // end
                // begin [file="/_Type_.jsp";from=(1842,21);to=(1842,29)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1842,31);to=(1845,0)]
                    out.write("[i]); sb.append(' ');\n      }\n    }\n");

                // end
                // begin [file="/_Type_.jsp";from=(1845,0);to=(1845,17)]
                } while (_jspx_th_jalios_foreach_43.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_foreach_43 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_foreach_43.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_foreach_43.release();
    }
// end
// HTML // begin [file="/_Type_.jsp";from=(1845,17);to=(1847,0)]
    out.write("\n\n");

// end
// begin [file="/_Type_.jsp";from=(1847,0);to=(1847,87)]
    /* ----  jalios:foreach ---- */
    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_44 = new com.jalios.jtaglib.ForeachTag();
    _jspx_th_jalios_foreach_44.setPageContext(pageContext);
    _jspx_th_jalios_foreach_44.setParent(null);
    _jspx_th_jalios_foreach_44.setCollection( wysiwygArrayFieldMLSet );
    _jspx_th_jalios_foreach_44.setName("itName");
    _jspx_th_jalios_foreach_44.setType("String");
    try {
        int _jspx_eval_jalios_foreach_44 = _jspx_th_jalios_foreach_44.doStartTag();
        if (_jspx_eval_jalios_foreach_44 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_foreach_44 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_foreach_44.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_foreach_44.doInitBody();
                }
                do {
                    Integer itCounter = null;
                    itCounter = (Integer) pageContext.findAttribute("itCounter");
                    String itName = null;
                    itName = (String) pageContext.findAttribute("itName");
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1847,87);to=(1848,17)]
                    out.write("\n    for(int i=0; ");

                // end
                // begin [file="/_Type_.jsp";from=(1848,20);to=(1848,28)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1848,30);to=(1848,46)]
                    out.write(" != null && i < ");

                // end
                // begin [file="/_Type_.jsp";from=(1848,49);to=(1848,57)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1848,59);to=(1849,10)]
                    out.write(".length; i++) {\n      if (");

                // end
                // begin [file="/_Type_.jsp";from=(1849,13);to=(1849,21)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1849,23);to=(1850,18)]
                    out.write("[i] != null) {\n        sb.append(");

                // end
                // begin [file="/_Type_.jsp";from=(1850,21);to=(1850,29)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1850,31);to=(1853,8)]
                    out.write("[i]); sb.append(' ');\n      }\n    }\n    if (");

                // end
                // begin [file="/_Type_.jsp";from=(1853,11);to=(1853,19)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1853,21);to=(1854,30)]
                    out.write("ML != null) {\n      for(String[] strArray : ");

                // end
                // begin [file="/_Type_.jsp";from=(1854,33);to=(1854,41)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1854,43);to=(1862,0)]
                    out.write("ML.values()) {\n        for(int i=0; strArray != null && i < strArray.length; i++) {\n          if (strArray[i] != null) {\n           sb.append( strArray[i]); sb.append(' ');\n          }\n        }\n      }\n    }\n");

                // end
                // begin [file="/_Type_.jsp";from=(1862,0);to=(1862,17)]
                } while (_jspx_th_jalios_foreach_44.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_foreach_44 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_foreach_44.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_foreach_44.release();
    }
// end
// HTML // begin [file="/_Type_.jsp";from=(1862,17);to=(1864,0)]
    out.write("\n\n");

// end
// begin [file="/_Type_.jsp";from=(1864,0);to=(1864,84)]
    /* ----  jalios:foreach ---- */
    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_45 = new com.jalios.jtaglib.ForeachTag();
    _jspx_th_jalios_foreach_45.setPageContext(pageContext);
    _jspx_th_jalios_foreach_45.setParent(null);
    _jspx_th_jalios_foreach_45.setCollection( wysiwygListFieldSet );
    _jspx_th_jalios_foreach_45.setName("itName");
    _jspx_th_jalios_foreach_45.setType("String");
    try {
        int _jspx_eval_jalios_foreach_45 = _jspx_th_jalios_foreach_45.doStartTag();
        if (_jspx_eval_jalios_foreach_45 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_foreach_45 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_foreach_45.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_foreach_45.doInitBody();
                }
                do {
                    Integer itCounter = null;
                    itCounter = (Integer) pageContext.findAttribute("itCounter");
                    String itName = null;
                    itName = (String) pageContext.findAttribute("itName");
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1864,84);to=(1865,8)]
                    out.write("\n    if (");

                // end
                // begin [file="/_Type_.jsp";from=(1865,11);to=(1865,19)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1865,21);to=(1866,24)]
                    out.write(" != null) {\n      for (String str : ");

                // end
                // begin [file="/_Type_.jsp";from=(1866,27);to=(1866,35)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1866,37);to=(1872,0)]
                    out.write(") {\n        if (str != null) {\n          sb.append(str); sb.append(' ');\n        }\n      }\n    }\n");

                // end
                // begin [file="/_Type_.jsp";from=(1872,0);to=(1872,17)]
                } while (_jspx_th_jalios_foreach_45.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_foreach_45 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_foreach_45.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_foreach_45.release();
    }
// end
// HTML // begin [file="/_Type_.jsp";from=(1872,17);to=(1874,0)]
    out.write("\n\n");

// end
// begin [file="/_Type_.jsp";from=(1874,0);to=(1874,86)]
    /* ----  jalios:foreach ---- */
    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_46 = new com.jalios.jtaglib.ForeachTag();
    _jspx_th_jalios_foreach_46.setPageContext(pageContext);
    _jspx_th_jalios_foreach_46.setParent(null);
    _jspx_th_jalios_foreach_46.setCollection( wysiwygListFieldMLSet );
    _jspx_th_jalios_foreach_46.setName("itName");
    _jspx_th_jalios_foreach_46.setType("String");
    try {
        int _jspx_eval_jalios_foreach_46 = _jspx_th_jalios_foreach_46.doStartTag();
        if (_jspx_eval_jalios_foreach_46 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_foreach_46 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_foreach_46.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_foreach_46.doInitBody();
                }
                do {
                    Integer itCounter = null;
                    itCounter = (Integer) pageContext.findAttribute("itCounter");
                    String itName = null;
                    itName = (String) pageContext.findAttribute("itName");
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1874,86);to=(1875,8)]
                    out.write("\n    if (");

                // end
                // begin [file="/_Type_.jsp";from=(1875,11);to=(1875,19)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1875,21);to=(1876,24)]
                    out.write(" != null) {\n      for (String str : ");

                // end
                // begin [file="/_Type_.jsp";from=(1876,27);to=(1876,35)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1876,37);to=(1882,8)]
                    out.write(") {\n        if (str != null) {\n          sb.append(str); sb.append(' ');\n        }\n      }\n    }\n    if (");

                // end
                // begin [file="/_Type_.jsp";from=(1882,11);to=(1882,19)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1882,21);to=(1883,34)]
                    out.write("ML != null) {\n      for (List<String> strList : ");

                // end
                // begin [file="/_Type_.jsp";from=(1883,37);to=(1883,45)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1883,47);to=(1893,0)]
                    out.write("ML.values()) {\n        if (strList != null) {\n          for (String str : strList) {\n            if (str != null) {\n              sb.append(str); sb.append(' ');\n            }\n          }\n        }\n      }\n    }\n");

                // end
                // begin [file="/_Type_.jsp";from=(1893,0);to=(1893,17)]
                } while (_jspx_th_jalios_foreach_46.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_foreach_46 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_foreach_46.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_foreach_46.release();
    }
// end
// HTML // begin [file="/_Type_.jsp";from=(1893,17);to=(1896,0)]
    out.write("\n    return sb.toString();\n  }\n");

// end
// begin [file="/_Type_.jsp";from=(1896,2);to=(1896,5)]
     } 
// end
// HTML // begin [file="/_Type_.jsp";from=(1896,7);to=(1898,0)]
    out.write("\n  \n");

// end
// HTML // begin [file="/_Type_.jsp";from=(1898,65);to=(1899,0)]
    out.write("\n");

// end
// begin [file="/_Type_.jsp";from=(1899,0);to=(1899,101)]
    /* ----  jalios:foreach ---- */
    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_47 = new com.jalios.jtaglib.ForeachTag();
    _jspx_th_jalios_foreach_47.setPageContext(pageContext);
    _jspx_th_jalios_foreach_47.setParent(null);
    _jspx_th_jalios_foreach_47.setCollection( categoryFieldEntryList );
    _jspx_th_jalios_foreach_47.setName("itFieldEntry");
    _jspx_th_jalios_foreach_47.setType("TypeFieldEntry");
    try {
        int _jspx_eval_jalios_foreach_47 = _jspx_th_jalios_foreach_47.doStartTag();
        if (_jspx_eval_jalios_foreach_47 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_foreach_47 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_foreach_47.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_foreach_47.doInitBody();
                }
                do {
                    Integer itCounter = null;
                    itCounter = (Integer) pageContext.findAttribute("itCounter");
                    TypeFieldEntry itFieldEntry = null;
                    itFieldEntry = (TypeFieldEntry) pageContext.findAttribute("itFieldEntry");
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1899,101);to=(1900,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(1900,2);to=(1905,0)]
                    
                      String name = itFieldEntry.getName();
                      String root = itFieldEntry.getRoot();
                      String nameCap = itFieldEntry.getNameCap();
                      boolean isDisplayRoot = itFieldEntry.isDisplayRoot();
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1905,2);to=(1906,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(1906,0);to=(1906,48)]
                    /* ----  jalios:if ---- */
                    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_24 = new com.jalios.jtaglib.IfTag();
                    _jspx_th_jalios_if_24.setPageContext(pageContext);
                    _jspx_th_jalios_if_24.setParent(_jspx_th_jalios_foreach_47);
                    _jspx_th_jalios_if_24.setPredicate( isPublicationType );
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
                          // HTML // begin [file="/_Type_.jsp";from=(1906,48);to=(1907,30)]
                              out.write("\n  public TreeSet<Category> get");

                          // end
                          // begin [file="/_Type_.jsp";from=(1907,33);to=(1907,42)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1907,44);to=(1908,57)]
                              out.write("(Member member) {\n    return getDescendantCategorySet(channel.getCategory(\"");

                          // end
                          // begin [file="/_Type_.jsp";from=(1908,60);to=(1908,66)]
                              out.print( root );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1908,68);to=(1908,72)]
                              out.write("\"), ");

                          // end
                          // begin [file="/_Type_.jsp";from=(1908,75);to=(1908,90)]
                              out.print( isDisplayRoot );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1908,92);to=(1910,26)]
                              out.write(", member);\n  }\n  public Category getFirst");

                          // end
                          // begin [file="/_Type_.jsp";from=(1910,29);to=(1910,38)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1910,40);to=(1911,59)]
                              out.write("(Member member) {\n    return getFirstDescendantCategory(channel.getCategory(\"");

                          // end
                          // begin [file="/_Type_.jsp";from=(1911,62);to=(1911,68)]
                              out.print( root );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1911,70);to=(1911,74)]
                              out.write("\"), ");

                          // end
                          // begin [file="/_Type_.jsp";from=(1911,77);to=(1911,92)]
                              out.print( isDisplayRoot );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1911,94);to=(1913,0)]
                              out.write(", member);\n  }\n");

                          // end
                          // begin [file="/_Type_.jsp";from=(1913,0);to=(1913,12)]
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
          // HTML // begin [file="/_Type_.jsp";from=(1913,12);to=(1914,0)]
              out.write("\n");

          // end
          // begin [file="/_Type_.jsp";from=(1914,0);to=(1914,49)]
              /* ----  jalios:if ---- */
              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_25 = new com.jalios.jtaglib.IfTag();
              _jspx_th_jalios_if_25.setPageContext(pageContext);
              _jspx_th_jalios_if_25.setParent(_jspx_th_jalios_foreach_47);
              _jspx_th_jalios_if_25.setPredicate( !isPublicationType );
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
                          // HTML // begin [file="/_Type_.jsp";from=(1914,49);to=(1915,30)]
                              out.write("\n  public TreeSet<Category> get");

                          // end
                          // begin [file="/_Type_.jsp";from=(1915,33);to=(1915,42)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1915,44);to=(1917,87)]
                              out.write("(Member member) {\n    if (extendedData != null && extendedData instanceof Publication) {\n      return ((Publication)extendedData).getDescendantCategorySet(channel.getCategory(\"");

                          // end
                          // begin [file="/_Type_.jsp";from=(1917,90);to=(1917,96)]
                              out.print( root );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1917,98);to=(1917,102)]
                              out.write("\"), ");

                          // end
                          // begin [file="/_Type_.jsp";from=(1917,105);to=(1917,120)]
                              out.print( isDisplayRoot );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1917,122);to=(1921,26)]
                              out.write(", member);\n    }\n    return null;\n  }\n  public Category getFirst");

                          // end
                          // begin [file="/_Type_.jsp";from=(1921,29);to=(1921,38)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1921,40);to=(1923,89)]
                              out.write("(Member member) {\n    if (extendedData != null && extendedData instanceof Publication) {\n      return ((Publication)extendedData).getFirstDescendantCategory(channel.getCategory(\"");

                          // end
                          // begin [file="/_Type_.jsp";from=(1923,92);to=(1923,98)]
                              out.print( root );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1923,100);to=(1923,104)]
                              out.write("\"), ");

                          // end
                          // begin [file="/_Type_.jsp";from=(1923,107);to=(1923,122)]
                              out.print( isDisplayRoot );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1923,124);to=(1927,0)]
                              out.write(", member);\n    }\n    return null;\n  }\n");

                          // end
                          // begin [file="/_Type_.jsp";from=(1927,0);to=(1927,12)]
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
          // HTML // begin [file="/_Type_.jsp";from=(1927,12);to=(1929,0)]
              out.write("\n\n");

          // end
          // begin [file="/_Type_.jsp";from=(1929,0);to=(1929,17)]
          } while (_jspx_th_jalios_foreach_47.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
      } finally {
          if (_jspx_eval_jalios_foreach_47 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
              out = pageContext.popBody();
      }
  }
  if (_jspx_th_jalios_foreach_47.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
      return;
} finally {
    _jspx_th_jalios_foreach_47.release();
}
// end
// HTML // begin [file="/_Type_.jsp";from=(1929,17);to=(1931,0)]
    out.write("\n\n");

// end
// HTML // begin [file="/_Type_.jsp";from=(1931,64);to=(1932,0)]
    out.write("\n");

// end
// begin [file="/_Type_.jsp";from=(1932,2);to=(1932,28)]
     if (isPublicationType) { 
// end
// HTML // begin [file="/_Type_.jsp";from=(1932,30);to=(1939,0)]
    out.write("\n  @Override\n  public <T extends Data> TreeSet<T> getLinkDataSet(Class<T> clazz) {\n    if (clazz == null) {\n      return Util.emptyTreeSet();\n    }\n    TreeSet<T> set = new TreeSet<>();\n");

// end
// begin [file="/_Type_.jsp";from=(1939,0);to=(1939,79)]
    /* ----  jalios:foreach ---- */
    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_48 = new com.jalios.jtaglib.ForeachTag();
    _jspx_th_jalios_foreach_48.setPageContext(pageContext);
    _jspx_th_jalios_foreach_48.setParent(null);
    _jspx_th_jalios_foreach_48.setCollection( linkSet );
    _jspx_th_jalios_foreach_48.setType("String");
    _jspx_th_jalios_foreach_48.setName("itFieldGetter");
    try {
        int _jspx_eval_jalios_foreach_48 = _jspx_th_jalios_foreach_48.doStartTag();
        if (_jspx_eval_jalios_foreach_48 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_foreach_48 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_foreach_48.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_foreach_48.doInitBody();
                }
                do {
                    Integer itCounter = null;
                    itCounter = (Integer) pageContext.findAttribute("itCounter");
                    String itFieldGetter = null;
                    itFieldGetter = (String) pageContext.findAttribute("itFieldGetter");
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1939,79);to=(1940,33)]
                    out.write("\n    JcmsUtil.addData(set, clazz, ");

                // end
                // begin [file="/_Type_.jsp";from=(1940,36);to=(1940,51)]
                    out.print( itFieldGetter );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1940,53);to=(1941,0)]
                    out.write(");\n");

                // end
                // begin [file="/_Type_.jsp";from=(1941,0);to=(1941,17)]
                } while (_jspx_th_jalios_foreach_48.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_foreach_48 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_foreach_48.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_foreach_48.release();
    }
// end
// HTML // begin [file="/_Type_.jsp";from=(1941,17);to=(1944,0)]
    out.write("\n    return set;\n  }\n");

// end
// begin [file="/_Type_.jsp";from=(1944,2);to=(1944,5)]
     } 
// end
// HTML // begin [file="/_Type_.jsp";from=(1944,7);to=(1946,0)]
    out.write("\n\n");

// end
// HTML // begin [file="/_Type_.jsp";from=(1946,75);to=(1947,0)]
    out.write("\n");

// end
// begin [file="/_Type_.jsp";from=(1947,0);to=(1947,41)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_26 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_26.setPageContext(pageContext);
    _jspx_th_jalios_if_26.setParent(null);
    _jspx_th_jalios_if_26.setPredicate( isTreeNode );
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
                // HTML // begin [file="/_Type_.jsp";from=(1947,41);to=(1955,0)]
                    out.write("\n  \n  // ----------------------------------------------------------------------\n  // TreeNode implementation\n  // ----------------------------------------------------------------------\n\n  @Override\n  public Collection<? extends TreeNode> getTreeChildren() {\n");

                // end
                // begin [file="/_Type_.jsp";from=(1955,2);to=(1955,36)]
                     if (treeChildTypeName != null) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1955,38);to=(1956,33)]
                    out.write("\n    return getLinkIndexedDataSet(");

                // end
                // begin [file="/_Type_.jsp";from=(1956,36);to=(1956,55)]
                    out.print( treeChildTypeName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1956,57);to=(1956,66)]
                    out.write(".class, \"");

                // end
                // begin [file="/_Type_.jsp";from=(1956,69);to=(1956,89)]
                    out.print( treeChildFieldName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1956,91);to=(1957,0)]
                    out.write("\");\n");

                // end
                // begin [file="/_Type_.jsp";from=(1957,2);to=(1957,12)]
                     } else { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1957,14);to=(1959,0)]
                    out.write("\n    return Util.emptyTreeSet();\n");

                // end
                // begin [file="/_Type_.jsp";from=(1959,2);to=(1959,5)]
                     } 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1959,7);to=(1963,0)]
                    out.write("\n  }\n  \n  public TreeNode getTreeParent() {\n");

                // end
                // begin [file="/_Type_.jsp";from=(1963,2);to=(1963,34)]
                     if (treeParentField != null) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1963,36);to=(1964,14)]
                    out.write("\n    return get");

                // end
                // begin [file="/_Type_.jsp";from=(1964,17);to=(1964,57)]
                    out.print( Util.recapitalize(treeParentFieldName) );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1964,59);to=(1965,0)]
                    out.write("();\n");

                // end
                // begin [file="/_Type_.jsp";from=(1965,2);to=(1965,12)]
                     } else { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1965,14);to=(1967,0)]
                    out.write("\n    return null;\n");

                // end
                // begin [file="/_Type_.jsp";from=(1967,2);to=(1967,5)]
                     } 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1967,7);to=(1970,0)]
                    out.write("\n  }\n\n");

                // end
                // begin [file="/_Type_.jsp";from=(1970,0);to=(1970,12)]
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
// HTML // begin [file="/_Type_.jsp";from=(1970,12);to=(1972,0)]
    out.write("\n\n");

// end
// HTML // begin [file="/_Type_.jsp";from=(1972,66);to=(1976,0)]
    out.write("\n  // ----------------------------------------------------------------------\n  // DataController\n  // ----------------------------------------------------------------------  \n");

// end
// begin [file="/_Type_.jsp";from=(1976,0);to=(1976,93)]
    /* ----  jalios:foreach ---- */
    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_49 = new com.jalios.jtaglib.ForeachTag();
    _jspx_th_jalios_foreach_49.setPageContext(pageContext);
    _jspx_th_jalios_foreach_49.setParent(null);
    _jspx_th_jalios_foreach_49.setCollection( fieldEntryList );
    _jspx_th_jalios_foreach_49.setName("itFieldEntry");
    _jspx_th_jalios_foreach_49.setType("TypeFieldEntry");
    try {
        int _jspx_eval_jalios_foreach_49 = _jspx_th_jalios_foreach_49.doStartTag();
        if (_jspx_eval_jalios_foreach_49 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_foreach_49 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_foreach_49.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_foreach_49.doInitBody();
                }
                do {
                    Integer itCounter = null;
                    itCounter = (Integer) pageContext.findAttribute("itCounter");
                    TypeFieldEntry itFieldEntry = null;
                    itFieldEntry = (TypeFieldEntry) pageContext.findAttribute("itFieldEntry");
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1976,93);to=(1977,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(1977,2);to=(1989,0)]
                    
                      Element xmlField = itFieldEntry.getXmlElement();
                      String type = itFieldEntry.getType();
                      String name = itFieldEntry.getName();
                      String nameCap = itFieldEntry.getNameCap();
                      String label = "channel.getTypeFieldLabel(this, \"" + name + "\")";
                      String pattern = Util.escapeJavaStringChar(xmlField.getAttributeValue("pattern"));
                      String editor = itFieldEntry.getEditor();
                      boolean escapeHtml = itFieldEntry.escapeHtml();
                      boolean checkHtml = Util.getString(xmlField.getAttributeValue("checkHtml"), "true").equals("true");
                      checkHtml = checkHtml && (editor.equals("wysiwyg") || (!escapeHtml && (editor.equals("textfield") || editor.equals("textarea"))));
                      boolean isFieldML = itFieldEntry.isFieldML();
                // end
                // HTML // begin [file="/_Type_.jsp";from=(1989,2);to=(1990,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(1990,0);to=(1990,53)]
                    /* ----  jalios:if ---- */
                    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_27 = new com.jalios.jtaglib.IfTag();
                    _jspx_th_jalios_if_27.setPageContext(pageContext);
                    _jspx_th_jalios_if_27.setParent(_jspx_th_jalios_foreach_49);
                    _jspx_th_jalios_if_27.setPredicate( Util.notEmpty(pattern) );
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
                          // HTML // begin [file="/_Type_.jsp";from=(1990,53);to=(1991,18)]
                              out.write("\n  static Pattern _");

                          // end
                          // begin [file="/_Type_.jsp";from=(1991,21);to=(1991,27)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1991,29);to=(1994,7)]
                              out.write("Pattern;\n  static {\n    try {\n      _");

                          // end
                          // begin [file="/_Type_.jsp";from=(1994,10);to=(1994,16)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1994,18);to=(1994,59)]
                              out.write("Pattern = (new Perl5Compiler()).compile(\"");

                          // end
                          // begin [file="/_Type_.jsp";from=(1994,62);to=(1994,71)]
                              out.print( pattern );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(1994,73);to=(2001,29)]
                              out.write("\", Perl5Compiler.CASE_INSENSITIVE_MASK);\n    }\n    catch(org.apache.oro.text.regex.MalformedPatternException ex) {\n      // Empty\n    }\n  }\n  \n  public boolean checkPattern");

                          // end
                          // begin [file="/_Type_.jsp";from=(2001,32);to=(2001,41)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(2001,43);to=(2002,0)]
                              out.write("() {\n");

                          // end
                          // begin [file="/_Type_.jsp";from=(2002,0);to=(2002,58)]
                              /* ----  jalios:if ---- */
                              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_28 = new com.jalios.jtaglib.IfTag();
                              _jspx_th_jalios_if_28.setPageContext(pageContext);
                              _jspx_th_jalios_if_28.setParent(_jspx_th_jalios_if_27);
                              _jspx_th_jalios_if_28.setPredicate( itFieldEntry.isTypeScalar() );
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
                          // HTML // begin [file="/_Type_.jsp";from=(2002,58);to=(2003,22)]
                              out.write("\n    if (Util.notEmpty(");

                          // end
                          // begin [file="/_Type_.jsp";from=(2003,25);to=(2003,31)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(2003,33);to=(2003,68)]
                              out.write(") && !(new Perl5Matcher()).matches(");

                          // end
                          // begin [file="/_Type_.jsp";from=(2003,71);to=(2003,77)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(2003,79);to=(2003,82)]
                              out.write(", _");

                          // end
                          // begin [file="/_Type_.jsp";from=(2003,85);to=(2003,91)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(2003,93);to=(2006,0)]
                              out.write("Pattern)) {\n      return false; \n    }\n");

                          // end
                          // begin [file="/_Type_.jsp";from=(2006,0);to=(2006,40)]
                              /* ----  jalios:if ---- */
                              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_29 = new com.jalios.jtaglib.IfTag();
                              _jspx_th_jalios_if_29.setPageContext(pageContext);
                              _jspx_th_jalios_if_29.setParent(_jspx_th_jalios_if_28);
                              _jspx_th_jalios_if_29.setPredicate( isFieldML );
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
                          // HTML // begin [file="/_Type_.jsp";from=(2006,40);to=(2007,22)]
                              out.write("\n    if (Util.notEmpty(");

                          // end
                          // begin [file="/_Type_.jsp";from=(2007,25);to=(2007,31)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(2007,33);to=(2008,45)]
                              out.write("ML)) {\n      for (String str : ((Map<String,String>)");

                          // end
                          // begin [file="/_Type_.jsp";from=(2008,48);to=(2008,54)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(2008,56);to=(2009,70)]
                              out.write("ML).values()) {\n        if (Util.notEmpty(str) && !(new Perl5Matcher()).matches(str, _");

                          // end
                          // begin [file="/_Type_.jsp";from=(2009,73);to=(2009,79)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(2009,81);to=(2014,0)]
                              out.write("Pattern)) {\n          return false; \n        }\n      }\n    }\n");

                          // end
                          // begin [file="/_Type_.jsp";from=(2014,0);to=(2014,12)]
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
          // HTML // begin [file="/_Type_.jsp";from=(2014,12);to=(2015,0)]
              out.write("\n");

          // end
          // begin [file="/_Type_.jsp";from=(2015,0);to=(2015,12)]
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
// HTML // begin [file="/_Type_.jsp";from=(2015,12);to=(2016,0)]
    out.write("\n");

// end
// begin [file="/_Type_.jsp";from=(2016,0);to=(2016,59)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_30 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_30.setPageContext(pageContext);
    _jspx_th_jalios_if_30.setParent(_jspx_th_jalios_if_27);
    _jspx_th_jalios_if_30.setPredicate( !itFieldEntry.isTypeScalar() );
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
                // HTML // begin [file="/_Type_.jsp";from=(2016,59);to=(2017,22)]
                    out.write("\n    if (Util.notEmpty(");

                // end
                // begin [file="/_Type_.jsp";from=(2017,25);to=(2017,31)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(2017,33);to=(2018,23)]
                    out.write(")) {\n      for (String str: ");

                // end
                // begin [file="/_Type_.jsp";from=(2018,26);to=(2018,32)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(2018,34);to=(2019,70)]
                    out.write(") {\n        if (Util.notEmpty(str) && !(new Perl5Matcher()).matches(str, _");

                // end
                // begin [file="/_Type_.jsp";from=(2019,73);to=(2019,79)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(2019,81);to=(2024,0)]
                    out.write("Pattern)) {\n          return false;\n        }\n      }\n    }\n");

                // end
                // begin [file="/_Type_.jsp";from=(2024,0);to=(2024,40)]
                    /* ----  jalios:if ---- */
                    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_31 = new com.jalios.jtaglib.IfTag();
                    _jspx_th_jalios_if_31.setPageContext(pageContext);
                    _jspx_th_jalios_if_31.setParent(_jspx_th_jalios_if_30);
                    _jspx_th_jalios_if_31.setPredicate( isFieldML );
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
                          // HTML // begin [file="/_Type_.jsp";from=(2024,40);to=(2025,22)]
                              out.write("\n    if (Util.notEmpty(");

                          // end
                          // begin [file="/_Type_.jsp";from=(2025,25);to=(2025,31)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(2025,33);to=(2026,52)]
                              out.write("ML)) {\n      for (String[] values : ((Map<String,String[]>)");

                          // end
                          // begin [file="/_Type_.jsp";from=(2026,55);to=(2026,61)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(2026,63);to=(2029,74)]
                              out.write("ML).values()) {\n        if (Util.notEmpty(values)) {\n          for (String str : values) {\n            if (Util.notEmpty(str) && !(new Perl5Matcher()).matches(str, _");

                          // end
                          // begin [file="/_Type_.jsp";from=(2029,77);to=(2029,83)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(2029,85);to=(2036,0)]
                              out.write("Pattern)) {\n              return false;\n            }\n          }\n        }\n      }\n    }\n");

                          // end
                          // begin [file="/_Type_.jsp";from=(2036,0);to=(2036,12)]
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
          // HTML // begin [file="/_Type_.jsp";from=(2036,12);to=(2037,0)]
              out.write("\n");

          // end
          // begin [file="/_Type_.jsp";from=(2037,0);to=(2037,12)]
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
// HTML // begin [file="/_Type_.jsp";from=(2037,12);to=(2041,0)]
    out.write("\n    return true;\n  }\n  \n");

// end
// begin [file="/_Type_.jsp";from=(2041,0);to=(2041,12)]
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
// HTML // begin [file="/_Type_.jsp";from=(2041,12);to=(2043,0)]
    out.write("\n\n");

// end
// begin [file="/_Type_.jsp";from=(2043,0);to=(2043,40)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_32 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_32.setPageContext(pageContext);
    _jspx_th_jalios_if_32.setParent(_jspx_th_jalios_foreach_49);
    _jspx_th_jalios_if_32.setPredicate( checkHtml );
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
                // HTML // begin [file="/_Type_.jsp";from=(2043,40);to=(2044,35)]
                    out.write("\n  public ControllerStatus checkHtml");

                // end
                // begin [file="/_Type_.jsp";from=(2044,38);to=(2044,47)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(2044,49);to=(2045,49)]
                    out.write("() {\n    ControllerStatus status = JcmsUtil.checkHtml(");

                // end
                // begin [file="/_Type_.jsp";from=(2045,52);to=(2045,58)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(2045,60);to=(2045,62)]
                    out.write(", ");

                // end
                // begin [file="/_Type_.jsp";from=(2045,65);to=(2045,72)]
                    out.print( label );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(2045,74);to=(2049,0)]
                    out.write(");\n    if (status.hasFailed()) {\n      return status;\n    }\n");

                // end
                // begin [file="/_Type_.jsp";from=(2049,2);to=(2049,20)]
                     if (isFieldML) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(2049,22);to=(2050,32)]
                    out.write("\n    status = JcmsUtil.checkHtml(");

                // end
                // begin [file="/_Type_.jsp";from=(2050,35);to=(2050,41)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(2050,43);to=(2050,47)]
                    out.write("ML, ");

                // end
                // begin [file="/_Type_.jsp";from=(2050,50);to=(2050,57)]
                    out.print( label );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(2050,59);to=(2054,0)]
                    out.write(");\n    if (status.hasFailed()) {\n      return status;\n    }\n");

                // end
                // begin [file="/_Type_.jsp";from=(2054,2);to=(2054,5)]
                     } 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(2054,7);to=(2058,0)]
                    out.write("\n    return ControllerStatus.OK;\n  }\n  \n");

                // end
                // begin [file="/_Type_.jsp";from=(2058,0);to=(2058,12)]
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
// HTML // begin [file="/_Type_.jsp";from=(2058,12);to=(2059,0)]
    out.write("\n");

// end
// begin [file="/_Type_.jsp";from=(2059,0);to=(2059,17)]
} while (_jspx_th_jalios_foreach_49.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
} finally {
    if (_jspx_eval_jalios_foreach_49 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
        out = pageContext.popBody();
}
}
if (_jspx_th_jalios_foreach_49.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
    return;
} finally {
    _jspx_th_jalios_foreach_49.release();
}
// end
// HTML // begin [file="/_Type_.jsp";from=(2059,17);to=(2068,0)]
    out.write("\n\n  public ControllerStatus checkIntegrity() {\n    \n    ControllerStatus status = super.checkIntegrity();\n    if (status.hasFailed()) {\n      return status;\n    }\n    \n");

// end
// begin [file="/_Type_.jsp";from=(2068,0);to=(2068,93)]
    /* ----  jalios:foreach ---- */
    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_50 = new com.jalios.jtaglib.ForeachTag();
    _jspx_th_jalios_foreach_50.setPageContext(pageContext);
    _jspx_th_jalios_foreach_50.setParent(null);
    _jspx_th_jalios_foreach_50.setCollection( fieldEntryList );
    _jspx_th_jalios_foreach_50.setName("itFieldEntry");
    _jspx_th_jalios_foreach_50.setType("TypeFieldEntry");
    try {
        int _jspx_eval_jalios_foreach_50 = _jspx_th_jalios_foreach_50.doStartTag();
        if (_jspx_eval_jalios_foreach_50 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_foreach_50 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_foreach_50.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_foreach_50.doInitBody();
                }
                do {
                    Integer itCounter = null;
                    itCounter = (Integer) pageContext.findAttribute("itCounter");
                    TypeFieldEntry itFieldEntry = null;
                    itFieldEntry = (TypeFieldEntry) pageContext.findAttribute("itFieldEntry");
                // end
                // HTML // begin [file="/_Type_.jsp";from=(2068,93);to=(2069,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(2069,2);to=(2088,0)]
                    
                      Element xmlField = itFieldEntry.getXmlElement();
                      String type = itFieldEntry.getType();
                      String name = itFieldEntry.getName();
                      String nameCap = itFieldEntry.getNameCap();
                      String label = "channel.getTypeFieldLabel(this, \"" + name + "\")";
                      String editor = itFieldEntry.getEditor();
                      String pattern = Util.escapeJavaStringChar(xmlField.getAttributeValue("pattern"));
                      String minValue = xmlField.getAttributeValue("minValue");
                      String maxValue = xmlField.getAttributeValue("maxValue");
                      String root = itFieldEntry.getRoot();
                      boolean displayRoot = Util.getString(xmlField.getAttributeValue("displayRoot"), "false").equals("true");
                      boolean escapeHtml = itFieldEntry.escapeHtml();
                      boolean checkHtml = Util.getString(xmlField.getAttributeValue("checkHtml"), "true").equals("true");
                      checkHtml = checkHtml && (editor.equals("wysiwyg") || (!escapeHtml && (editor.equals("textfield") || editor.equals("textarea"))));
                      boolean isFieldML = itFieldEntry.isFieldML();
                      boolean isWikiOrWysiwyg = itFieldEntry.isFieldWiki() || itFieldEntry.isWysiwyg();
                      String isEmptyMethodName = isWikiOrWysiwyg ? "JHTMLUtils.isEmpty": "Util.isEmpty";
                      boolean isEmptyMethodNeedRecursionParam = !isWikiOrWysiwyg;
                // end
                // HTML // begin [file="/_Type_.jsp";from=(2088,2);to=(2089,0)]
                    out.write("\n");

                // end
                // HTML // begin [file="/_Type_.jsp";from=(2089,35);to=(2090,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(2090,0);to=(2090,91)]
                    /* ----  jalios:if ---- */
                    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_33 = new com.jalios.jtaglib.IfTag();
                    _jspx_th_jalios_if_33.setPageContext(pageContext);
                    _jspx_th_jalios_if_33.setParent(_jspx_th_jalios_foreach_50);
                    _jspx_th_jalios_if_33.setPredicate( type.equals("String") && requiredFieldNameSet.contains(name) );
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
                          // HTML // begin [file="/_Type_.jsp";from=(2090,91);to=(2091,8)]
                              out.write("\n    if (");

                          // end
                          // begin [file="/_Type_.jsp";from=(2091,11);to=(2091,30)]
                              out.print( isEmptyMethodName );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(2091,32);to=(2091,33)]
                              out.write("(");

                          // end
                          // begin [file="/_Type_.jsp";from=(2091,35);to=(2091,53)]
                               if (isFieldML) { 
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(2091,55);to=(2091,78)]
                              out.write("getFieldInMainLanguage(");

                          // end
                          // begin [file="/_Type_.jsp";from=(2091,81);to=(2091,87)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(2091,89);to=(2091,91)]
                              out.write(", ");

                          // end
                          // begin [file="/_Type_.jsp";from=(2091,94);to=(2091,100)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(2091,102);to=(2091,105)]
                              out.write("ML)");

                          // end
                          // begin [file="/_Type_.jsp";from=(2091,107);to=(2091,117)]
                               } else { 
                          // end
                          // begin [file="/_Type_.jsp";from=(2091,122);to=(2091,128)]
                              out.print( name );
                          // end
                          // begin [file="/_Type_.jsp";from=(2091,132);to=(2091,135)]
                               } 
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(2091,137);to=(2093,42)]
                              out.write(")) {\n      status = new ControllerStatus();\n      status.setProp(\"msg.edit.empty-field");

                          // end
                          // begin [file="/_Type_.jsp";from=(2093,45);to=(2093,68)]
                              out.print( isFieldML ? "ml" : "" );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(2093,70);to=(2093,73)]
                              out.write("\", ");

                          // end
                          // begin [file="/_Type_.jsp";from=(2093,76);to=(2093,83)]
                              out.print( label );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(2093,85);to=(2093,87)]
                              out.write(", ");

                          // end
                          // begin [file="/_Type_.jsp";from=(2093,90);to=(2093,162)]
                              out.print( isFieldML ? "new LangProperty(\"lang.\" + getMainLanguage())" : "null" );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(2093,164);to=(2096,0)]
                              out.write(");\n      return status;\n    }\n");

                          // end
                          // begin [file="/_Type_.jsp";from=(2096,0);to=(2096,12)]
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
          // HTML // begin [file="/_Type_.jsp";from=(2096,12);to=(2098,0)]
              out.write("\n\n");

          // end
          // HTML // begin [file="/_Type_.jsp";from=(2098,37);to=(2099,0)]
              out.write("\n");

          // end
          // begin [file="/_Type_.jsp";from=(2099,0);to=(2099,156)]
              /* ----  jalios:if ---- */
              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_34 = new com.jalios.jtaglib.IfTag();
              _jspx_th_jalios_if_34.setPageContext(pageContext);
              _jspx_th_jalios_if_34.setParent(_jspx_th_jalios_foreach_50);
              _jspx_th_jalios_if_34.setPredicate( (type.equals("String[]") || type.equals("List<String>") || type.equals("Set<String>")) && requiredFieldNameSet.contains(name) );
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
                          // HTML // begin [file="/_Type_.jsp";from=(2099,156);to=(2100,8)]
                              out.write("\n    if (");

                          // end
                          // begin [file="/_Type_.jsp";from=(2100,11);to=(2100,30)]
                              out.print( isEmptyMethodName );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(2100,32);to=(2100,34)]
                              out.write("((");

                          // end
                          // begin [file="/_Type_.jsp";from=(2100,37);to=(2100,43)]
                              out.print( type );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(2100,45);to=(2100,47)]
                              out.write(") ");

                          // end
                          // begin [file="/_Type_.jsp";from=(2100,49);to=(2100,67)]
                               if (isFieldML) { 
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(2100,69);to=(2100,92)]
                              out.write("getFieldInMainLanguage(");

                          // end
                          // begin [file="/_Type_.jsp";from=(2100,95);to=(2100,101)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(2100,103);to=(2100,105)]
                              out.write(", ");

                          // end
                          // begin [file="/_Type_.jsp";from=(2100,108);to=(2100,114)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(2100,116);to=(2100,119)]
                              out.write("ML)");

                          // end
                          // begin [file="/_Type_.jsp";from=(2100,121);to=(2100,131)]
                               } else { 
                          // end
                          // begin [file="/_Type_.jsp";from=(2100,136);to=(2100,142)]
                              out.print( name );
                          // end
                          // begin [file="/_Type_.jsp";from=(2100,146);to=(2100,149)]
                               } 
                          // end
                          // begin [file="/_Type_.jsp";from=(2100,153);to=(2100,193)]
                               if (isEmptyMethodNeedRecursionParam) { 
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(2100,195);to=(2100,201)]
                              out.write(", true");

                          // end
                          // begin [file="/_Type_.jsp";from=(2100,203);to=(2100,205)]
                               }
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(2100,207);to=(2102,42)]
                              out.write(")) {\n      status = new ControllerStatus();\n      status.setProp(\"msg.edit.empty-field");

                          // end
                          // begin [file="/_Type_.jsp";from=(2102,45);to=(2102,68)]
                              out.print( isFieldML ? "ml" : "" );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(2102,70);to=(2102,73)]
                              out.write("\", ");

                          // end
                          // begin [file="/_Type_.jsp";from=(2102,76);to=(2102,83)]
                              out.print( label );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(2102,85);to=(2102,87)]
                              out.write(", ");

                          // end
                          // begin [file="/_Type_.jsp";from=(2102,90);to=(2102,162)]
                              out.print( isFieldML ? "new LangProperty(\"lang.\" + getMainLanguage())" : "null" );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(2102,164);to=(2105,0)]
                              out.write(");\n      return status;\n    }\n");

                          // end
                          // begin [file="/_Type_.jsp";from=(2105,0);to=(2105,12)]
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
          // HTML // begin [file="/_Type_.jsp";from=(2105,12);to=(2107,0)]
              out.write("\n\n");

          // end
          // HTML // begin [file="/_Type_.jsp";from=(2107,32);to=(2108,0)]
              out.write("\n");

          // end
          // begin [file="/_Type_.jsp";from=(2108,2);to=(2108,33)]
               if ("email".equals(editor)) { 
          // end
          // HTML // begin [file="/_Type_.jsp";from=(2108,35);to=(2109,27)]
              out.write("\n    if (!Util.isValidEmail(");

          // end
          // begin [file="/_Type_.jsp";from=(2109,30);to=(2109,36)]
              out.print( name );
          // end
          // HTML // begin [file="/_Type_.jsp";from=(2109,38);to=(2111,43)]
              out.write(")) {\n      status = new ControllerStatus();\n      status.setProp(\"msg.edit.bad-email\", ");

          // end
          // begin [file="/_Type_.jsp";from=(2111,46);to=(2111,53)]
              out.print( label );
          // end
          // HTML // begin [file="/_Type_.jsp";from=(2111,55);to=(2114,0)]
              out.write(");\n      return status;\n    }\n");

          // end
          // begin [file="/_Type_.jsp";from=(2114,2);to=(2114,22)]
                 if (isFieldML) { 
          // end
          // HTML // begin [file="/_Type_.jsp";from=(2114,24);to=(2115,27)]
              out.write("\n    if (!Util.isValidEmail(");

          // end
          // begin [file="/_Type_.jsp";from=(2115,30);to=(2115,36)]
              out.print( name );
          // end
          // HTML // begin [file="/_Type_.jsp";from=(2115,38);to=(2117,43)]
              out.write("ML)) {\n      status = new ControllerStatus();\n      status.setProp(\"msg.edit.bad-email\", ");

          // end
          // begin [file="/_Type_.jsp";from=(2117,46);to=(2117,53)]
              out.print( label );
          // end
          // HTML // begin [file="/_Type_.jsp";from=(2117,55);to=(2120,0)]
              out.write(");\n      return status;\n    }\n");

          // end
          // begin [file="/_Type_.jsp";from=(2120,2);to=(2120,7)]
                 } 
          // end
          // HTML // begin [file="/_Type_.jsp";from=(2120,9);to=(2121,0)]
              out.write("\n");

          // end
          // HTML // begin [file="/_Type_.jsp";from=(2121,30);to=(2122,0)]
              out.write("\n");

          // end
          // begin [file="/_Type_.jsp";from=(2122,2);to=(2122,38)]
               } else if ("url".equals(editor)) { 
          // end
          // HTML // begin [file="/_Type_.jsp";from=(2122,40);to=(2123,25)]
              out.write("\n    if (!Util.isValidUrl(");

          // end
          // begin [file="/_Type_.jsp";from=(2123,28);to=(2123,34)]
              out.print( name );
          // end
          // HTML // begin [file="/_Type_.jsp";from=(2123,36);to=(2125,41)]
              out.write(")) {\n      status = new ControllerStatus();\n      status.setProp(\"msg.edit.bad-url\", ");

          // end
          // begin [file="/_Type_.jsp";from=(2125,44);to=(2125,51)]
              out.print( label );
          // end
          // HTML // begin [file="/_Type_.jsp";from=(2125,53);to=(2128,0)]
              out.write(");\n      return status;\n    }\n");

          // end
          // begin [file="/_Type_.jsp";from=(2128,2);to=(2128,22)]
                 if (isFieldML) { 
          // end
          // HTML // begin [file="/_Type_.jsp";from=(2128,24);to=(2129,25)]
              out.write("\n    if (!Util.isValidUrl(");

          // end
          // begin [file="/_Type_.jsp";from=(2129,28);to=(2129,34)]
              out.print( name );
          // end
          // HTML // begin [file="/_Type_.jsp";from=(2129,36);to=(2131,41)]
              out.write("ML)) {\n      status = new ControllerStatus();\n      status.setProp(\"msg.edit.bad-url\", ");

          // end
          // begin [file="/_Type_.jsp";from=(2131,44);to=(2131,51)]
              out.print( label );
          // end
          // HTML // begin [file="/_Type_.jsp";from=(2131,53);to=(2134,0)]
              out.write(");\n      return status;\n    }\n");

          // end
          // begin [file="/_Type_.jsp";from=(2134,2);to=(2134,7)]
                 } 
          // end
          // HTML // begin [file="/_Type_.jsp";from=(2134,9);to=(2135,0)]
              out.write("\n");

          // end
          // HTML // begin [file="/_Type_.jsp";from=(2135,56);to=(2136,0)]
              out.write("\n");

          // end
          // begin [file="/_Type_.jsp";from=(2136,2);to=(2136,88)]
               } else if (itFieldEntry.getTypeShort().equals("String") && Util.notEmpty(pattern)) { 
          // end
          // HTML // begin [file="/_Type_.jsp";from=(2136,90);to=(2137,21)]
              out.write("\n    if (!checkPattern");

          // end
          // begin [file="/_Type_.jsp";from=(2137,24);to=(2137,33)]
              out.print( nameCap );
          // end
          // HTML // begin [file="/_Type_.jsp";from=(2137,35);to=(2139,50)]
              out.write("()) {\n      status = new ControllerStatus();\n      status.setProp(\"msg.edit.bad-field-format\", ");

          // end
          // begin [file="/_Type_.jsp";from=(2139,53);to=(2139,60)]
              out.print( label );
          // end
          // HTML // begin [file="/_Type_.jsp";from=(2139,62);to=(2139,65)]
              out.write(", \"");

          // end
          // begin [file="/_Type_.jsp";from=(2139,68);to=(2139,77)]
              out.print( pattern );
          // end
          // HTML // begin [file="/_Type_.jsp";from=(2139,79);to=(2142,0)]
              out.write("\");\n      return status;\n    }\n");

          // end
          // begin [file="/_Type_.jsp";from=(2142,2);to=(2142,5)]
               } 
          // end
          // HTML // begin [file="/_Type_.jsp";from=(2142,7);to=(2145,0)]
              out.write("\n\n\n");

          // end
          // HTML // begin [file="/_Type_.jsp";from=(2145,72);to=(2146,0)]
              out.write("\n");

          // end
          // begin [file="/_Type_.jsp";from=(2146,0);to=(2146,40)]
              /* ----  jalios:if ---- */
              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_35 = new com.jalios.jtaglib.IfTag();
              _jspx_th_jalios_if_35.setPageContext(pageContext);
              _jspx_th_jalios_if_35.setParent(_jspx_th_jalios_foreach_50);
              _jspx_th_jalios_if_35.setPredicate( checkHtml );
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
                          // HTML // begin [file="/_Type_.jsp";from=(2146,40);to=(2147,22)]
                              out.write("\n    status = checkHtml");

                          // end
                          // begin [file="/_Type_.jsp";from=(2147,25);to=(2147,34)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(2147,36);to=(2151,0)]
                              out.write("();\n    if (status.hasFailed()) {\n      return status;\n    }\n");

                          // end
                          // begin [file="/_Type_.jsp";from=(2151,0);to=(2151,12)]
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
          // HTML // begin [file="/_Type_.jsp";from=(2151,12);to=(2153,0)]
              out.write("\n\n");

          // end
          // HTML // begin [file="/_Type_.jsp";from=(2153,57);to=(2154,0)]
              out.write("\n");

          // end
          // begin [file="/_Type_.jsp";from=(2154,0);to=(2154,117)]
              /* ----  jalios:if ---- */
              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_36 = new com.jalios.jtaglib.IfTag();
              _jspx_th_jalios_if_36.setPageContext(pageContext);
              _jspx_th_jalios_if_36.setParent(_jspx_th_jalios_foreach_50);
              _jspx_th_jalios_if_36.setPredicate( itFieldEntry.isTypeScalar() && (itFieldEntry.isAnyLink() || itFieldEntry.isTypeDate()) );
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
                          // HTML // begin [file="/_Type_.jsp";from=(2154,117);to=(2155,0)]
                              out.write("\n");

                          // end
                          // begin [file="/_Type_.jsp";from=(2155,0);to=(2155,66)]
                              /* ----  jalios:if ---- */
                              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_37 = new com.jalios.jtaglib.IfTag();
                              _jspx_th_jalios_if_37.setPageContext(pageContext);
                              _jspx_th_jalios_if_37.setParent(_jspx_th_jalios_if_36);
                              _jspx_th_jalios_if_37.setPredicate( requiredFieldNameSet.contains(name) );
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
                          // HTML // begin [file="/_Type_.jsp";from=(2155,66);to=(2156,0)]
                              out.write("\n");

                          // end
                          // begin [file="/_Type_.jsp";from=(2156,2);to=(2156,54)]
                               if (type.equals("com.jalios.jcms.FileDocument")) { 
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(2156,56);to=(2157,21)]
                              out.write("\n    if (Util.isEmpty(");

                          // end
                          // begin [file="/_Type_.jsp";from=(2157,23);to=(2157,41)]
                               if (isFieldML) { 
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(2157,43);to=(2157,66)]
                              out.write("getFieldInMainLanguage(");

                          // end
                          // begin [file="/_Type_.jsp";from=(2157,69);to=(2157,75)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(2157,77);to=(2157,79)]
                              out.write(", ");

                          // end
                          // begin [file="/_Type_.jsp";from=(2157,82);to=(2157,88)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(2157,90);to=(2157,93)]
                              out.write("ML)");

                          // end
                          // begin [file="/_Type_.jsp";from=(2157,95);to=(2157,105)]
                               } else { 
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(2157,107);to=(2157,110)]
                              out.write("get");

                          // end
                          // begin [file="/_Type_.jsp";from=(2157,113);to=(2157,122)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(2157,124);to=(2157,126)]
                              out.write("()");

                          // end
                          // begin [file="/_Type_.jsp";from=(2157,128);to=(2157,131)]
                               } 
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(2157,133);to=(2158,0)]
                              out.write(")) {\n");

                          // end
                          // begin [file="/_Type_.jsp";from=(2158,2);to=(2158,12)]
                               } else { 
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(2158,14);to=(2159,11)]
                              out.write("\n    if (get");

                          // end
                          // begin [file="/_Type_.jsp";from=(2159,14);to=(2159,23)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(2159,25);to=(2160,0)]
                              out.write("() == null) {\n");

                          // end
                          // begin [file="/_Type_.jsp";from=(2160,2);to=(2160,5)]
                               } 
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(2160,7);to=(2162,45)]
                              out.write("\n      status = new ControllerStatus();\n      status.setProp(\"msg.edit.empty-field\", ");

                          // end
                          // begin [file="/_Type_.jsp";from=(2162,48);to=(2162,55)]
                              out.print( label );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(2162,57);to=(2165,0)]
                              out.write(");\n      return status;\n    }\n");

                          // end
                          // begin [file="/_Type_.jsp";from=(2165,0);to=(2165,12)]
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
          // HTML // begin [file="/_Type_.jsp";from=(2165,12);to=(2166,0)]
              out.write("\n");

          // end
          // begin [file="/_Type_.jsp";from=(2166,0);to=(2166,12)]
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
// HTML // begin [file="/_Type_.jsp";from=(2166,12);to=(2168,0)]
    out.write("\n\n");

// end
// HTML // begin [file="/_Type_.jsp";from=(2168,65);to=(2169,0)]
    out.write("\n");

// end
// begin [file="/_Type_.jsp";from=(2169,0);to=(2169,147)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_38 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_38.setPageContext(pageContext);
    _jspx_th_jalios_if_38.setParent(_jspx_th_jalios_foreach_50);
    _jspx_th_jalios_if_38.setPredicate( itFieldEntry.isTypeMV() && (itFieldEntry.isAnyLink() || itFieldEntry.isTypeDate() || itFieldEntry.isTypeDateArray()) );
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
                // HTML // begin [file="/_Type_.jsp";from=(2169,147);to=(2170,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(2170,0);to=(2170,66)]
                    /* ----  jalios:if ---- */
                    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_39 = new com.jalios.jtaglib.IfTag();
                    _jspx_th_jalios_if_39.setPageContext(pageContext);
                    _jspx_th_jalios_if_39.setParent(_jspx_th_jalios_if_38);
                    _jspx_th_jalios_if_39.setPredicate( requiredFieldNameSet.contains(name) );
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
                          // HTML // begin [file="/_Type_.jsp";from=(2170,66);to=(2171,0)]
                              out.write("\n");

                          // end
                          // begin [file="/_Type_.jsp";from=(2171,2);to=(2171,56)]
                               if (type.equals("com.jalios.jcms.FileDocument[]")) { 
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(2171,58);to=(2172,21)]
                              out.write("\n    if (Util.isEmpty(");

                          // end
                          // begin [file="/_Type_.jsp";from=(2172,23);to=(2172,41)]
                               if (isFieldML) { 
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(2172,43);to=(2172,66)]
                              out.write("getFieldInMainLanguage(");

                          // end
                          // begin [file="/_Type_.jsp";from=(2172,69);to=(2172,75)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(2172,77);to=(2172,79)]
                              out.write(", ");

                          // end
                          // begin [file="/_Type_.jsp";from=(2172,82);to=(2172,88)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(2172,90);to=(2172,93)]
                              out.write("ML)");

                          // end
                          // begin [file="/_Type_.jsp";from=(2172,95);to=(2172,105)]
                               } else { 
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(2172,107);to=(2172,110)]
                              out.write("get");

                          // end
                          // begin [file="/_Type_.jsp";from=(2172,113);to=(2172,122)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(2172,124);to=(2172,126)]
                              out.write("()");

                          // end
                          // begin [file="/_Type_.jsp";from=(2172,128);to=(2172,131)]
                               } 
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(2172,133);to=(2174,45)]
                              out.write(")) {\n      status = new ControllerStatus();\n      status.setProp(\"msg.edit.empty-field\", ");

                          // end
                          // begin [file="/_Type_.jsp";from=(2174,48);to=(2174,55)]
                              out.print( label );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(2174,57);to=(2177,0)]
                              out.write(");\n      return status;\n    }\n");

                          // end
                          // begin [file="/_Type_.jsp";from=(2177,2);to=(2177,12)]
                               } else { 
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(2177,14);to=(2178,48)]
                              out.write("\n    status = JcmsUtil.checkFieldRequired(this, \"");

                          // end
                          // begin [file="/_Type_.jsp";from=(2178,51);to=(2178,57)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(2178,59);to=(2178,65)]
                              out.write("\", get");

                          // end
                          // begin [file="/_Type_.jsp";from=(2178,68);to=(2178,77)]
                              out.print( nameCap );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(2178,79);to=(2183,0)]
                              out.write("());\n    if (status.hasFailed()) {\n      return status;\n    }\n\n");

                          // end
                          // begin [file="/_Type_.jsp";from=(2183,2);to=(2183,5)]
                               } 
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(2183,7);to=(2184,0)]
                              out.write("\n");

                          // end
                          // begin [file="/_Type_.jsp";from=(2184,0);to=(2184,12)]
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
          // HTML // begin [file="/_Type_.jsp";from=(2184,12);to=(2185,0)]
              out.write("\n");

          // end
          // begin [file="/_Type_.jsp";from=(2185,0);to=(2185,12)]
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
// HTML // begin [file="/_Type_.jsp";from=(2185,12);to=(2187,0)]
    out.write("\n\n");

// end
// HTML // begin [file="/_Type_.jsp";from=(2187,48);to=(2188,0)]
    out.write("\n");

// end
// begin [file="/_Type_.jsp";from=(2188,0);to=(2188,97)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_40 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_40.setPageContext(pageContext);
    _jspx_th_jalios_if_40.setParent(_jspx_th_jalios_foreach_50);
    _jspx_th_jalios_if_40.setPredicate( type.equals("int") || type.equals("long") || type.equals("double") );
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
                // HTML // begin [file="/_Type_.jsp";from=(2188,97);to=(2189,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(2189,0);to=(2189,54)]
                    /* ----  jalios:if ---- */
                    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_41 = new com.jalios.jtaglib.IfTag();
                    _jspx_th_jalios_if_41.setPageContext(pageContext);
                    _jspx_th_jalios_if_41.setParent(_jspx_th_jalios_if_40);
                    _jspx_th_jalios_if_41.setPredicate( Util.notEmpty(minValue) );
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
                          // HTML // begin [file="/_Type_.jsp";from=(2189,54);to=(2190,8)]
                              out.write("\n    if (");

                          // end
                          // begin [file="/_Type_.jsp";from=(2190,11);to=(2190,17)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(2190,19);to=(2190,22)]
                              out.write(" < ");

                          // end
                          // begin [file="/_Type_.jsp";from=(2190,25);to=(2190,35)]
                              out.print( minValue );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(2190,37);to=(2192,47)]
                              out.write(" ) {\n      status = new ControllerStatus();\n      status.setProp(\"msg.edit.lesser-number\", ");

                          // end
                          // begin [file="/_Type_.jsp";from=(2192,50);to=(2192,57)]
                              out.print( label );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(2192,59);to=(2192,62)]
                              out.write(", \"");

                          // end
                          // begin [file="/_Type_.jsp";from=(2192,65);to=(2192,75)]
                              out.print( minValue );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(2192,77);to=(2195,0)]
                              out.write("\");\n      return status;      \n    }\n");

                          // end
                          // begin [file="/_Type_.jsp";from=(2195,0);to=(2195,12)]
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
          // HTML // begin [file="/_Type_.jsp";from=(2195,12);to=(2196,0)]
              out.write("\n");

          // end
          // begin [file="/_Type_.jsp";from=(2196,0);to=(2196,54)]
              /* ----  jalios:if ---- */
              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_42 = new com.jalios.jtaglib.IfTag();
              _jspx_th_jalios_if_42.setPageContext(pageContext);
              _jspx_th_jalios_if_42.setParent(_jspx_th_jalios_if_40);
              _jspx_th_jalios_if_42.setPredicate( Util.notEmpty(maxValue) );
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
                          // HTML // begin [file="/_Type_.jsp";from=(2196,54);to=(2197,8)]
                              out.write("\n    if (");

                          // end
                          // begin [file="/_Type_.jsp";from=(2197,11);to=(2197,17)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(2197,19);to=(2197,22)]
                              out.write(" > ");

                          // end
                          // begin [file="/_Type_.jsp";from=(2197,25);to=(2197,35)]
                              out.print( maxValue );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(2197,37);to=(2199,48)]
                              out.write(" ) {\n      status = new ControllerStatus();\n      status.setProp(\"msg.edit.greater-number\", ");

                          // end
                          // begin [file="/_Type_.jsp";from=(2199,51);to=(2199,58)]
                              out.print( label );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(2199,60);to=(2199,63)]
                              out.write(", \"");

                          // end
                          // begin [file="/_Type_.jsp";from=(2199,66);to=(2199,76)]
                              out.print( maxValue );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(2199,78);to=(2202,0)]
                              out.write("\");\n      return status;      \n    }\n");

                          // end
                          // begin [file="/_Type_.jsp";from=(2202,0);to=(2202,12)]
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
          // HTML // begin [file="/_Type_.jsp";from=(2202,12);to=(2203,0)]
              out.write("\n");

          // end
          // begin [file="/_Type_.jsp";from=(2203,0);to=(2203,12)]
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
// HTML // begin [file="/_Type_.jsp";from=(2203,12);to=(2205,0)]
    out.write("\n\n");

// end
// HTML // begin [file="/_Type_.jsp";from=(2205,54);to=(2206,0)]
    out.write("\n");

// end
// begin [file="/_Type_.jsp";from=(2206,0);to=(2206,103)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_43 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_43.setPageContext(pageContext);
    _jspx_th_jalios_if_43.setParent(_jspx_th_jalios_foreach_50);
    _jspx_th_jalios_if_43.setPredicate( type.equals("int[]") || type.equals("long[]") || type.equals("double[]") );
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
                // HTML // begin [file="/_Type_.jsp";from=(2206,103);to=(2207,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(2207,0);to=(2207,54)]
                    /* ----  jalios:if ---- */
                    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_44 = new com.jalios.jtaglib.IfTag();
                    _jspx_th_jalios_if_44.setPageContext(pageContext);
                    _jspx_th_jalios_if_44.setParent(_jspx_th_jalios_if_43);
                    _jspx_th_jalios_if_44.setPredicate( Util.notEmpty(minValue) );
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
                          // HTML // begin [file="/_Type_.jsp";from=(2207,54);to=(2208,8)]
                              out.write("\n    if (");

                          // end
                          // begin [file="/_Type_.jsp";from=(2208,11);to=(2208,17)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(2208,19);to=(2209,25)]
                              out.write(" != null) {\n      for(int i = 0; i < ");

                          // end
                          // begin [file="/_Type_.jsp";from=(2209,28);to=(2209,34)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(2209,36);to=(2210,12)]
                              out.write(".length; i++) {\n        if (");

                          // end
                          // begin [file="/_Type_.jsp";from=(2210,15);to=(2210,21)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(2210,23);to=(2210,29)]
                              out.write("[i] < ");

                          // end
                          // begin [file="/_Type_.jsp";from=(2210,32);to=(2210,42)]
                              out.print( minValue );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(2210,44);to=(2212,51)]
                              out.write(" ) {\n          status = new ControllerStatus();\n          status.setProp(\"msg.edit.lesser-number\", ");

                          // end
                          // begin [file="/_Type_.jsp";from=(2212,54);to=(2212,61)]
                              out.print( label );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(2212,63);to=(2212,66)]
                              out.write(", \"");

                          // end
                          // begin [file="/_Type_.jsp";from=(2212,69);to=(2212,79)]
                              out.print( minValue );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(2212,81);to=(2217,0)]
                              out.write("\");\n          return status;      \n        }\n      } \n    }\n");

                          // end
                          // begin [file="/_Type_.jsp";from=(2217,0);to=(2217,12)]
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
          // HTML // begin [file="/_Type_.jsp";from=(2217,12);to=(2218,0)]
              out.write("\n");

          // end
          // begin [file="/_Type_.jsp";from=(2218,0);to=(2218,54)]
              /* ----  jalios:if ---- */
              com.jalios.jtaglib.IfTag _jspx_th_jalios_if_45 = new com.jalios.jtaglib.IfTag();
              _jspx_th_jalios_if_45.setPageContext(pageContext);
              _jspx_th_jalios_if_45.setParent(_jspx_th_jalios_if_43);
              _jspx_th_jalios_if_45.setPredicate( Util.notEmpty(maxValue) );
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
                          // HTML // begin [file="/_Type_.jsp";from=(2218,54);to=(2219,8)]
                              out.write("\n    if (");

                          // end
                          // begin [file="/_Type_.jsp";from=(2219,11);to=(2219,17)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(2219,19);to=(2220,25)]
                              out.write(" != null) {\n      for(int i = 0; i < ");

                          // end
                          // begin [file="/_Type_.jsp";from=(2220,28);to=(2220,34)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(2220,36);to=(2221,12)]
                              out.write(".length; i++) {\n        if (");

                          // end
                          // begin [file="/_Type_.jsp";from=(2221,15);to=(2221,21)]
                              out.print( name );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(2221,23);to=(2221,29)]
                              out.write("[i] > ");

                          // end
                          // begin [file="/_Type_.jsp";from=(2221,32);to=(2221,42)]
                              out.print( maxValue );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(2221,44);to=(2223,52)]
                              out.write(" ) {\n          status = new ControllerStatus();\n          status.setProp(\"msg.edit.greater-number\", ");

                          // end
                          // begin [file="/_Type_.jsp";from=(2223,55);to=(2223,62)]
                              out.print( label );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(2223,64);to=(2223,67)]
                              out.write(", \"");

                          // end
                          // begin [file="/_Type_.jsp";from=(2223,70);to=(2223,80)]
                              out.print( maxValue );
                          // end
                          // HTML // begin [file="/_Type_.jsp";from=(2223,82);to=(2228,0)]
                              out.write("\");\n          return status;      \n        }\n      } \n    }\n");

                          // end
                          // begin [file="/_Type_.jsp";from=(2228,0);to=(2228,12)]
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
          // HTML // begin [file="/_Type_.jsp";from=(2228,12);to=(2229,0)]
              out.write("\n");

          // end
          // begin [file="/_Type_.jsp";from=(2229,0);to=(2229,12)]
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
// HTML // begin [file="/_Type_.jsp";from=(2229,12);to=(2231,0)]
    out.write("\n\n");

// end
// HTML // begin [file="/_Type_.jsp";from=(2231,37);to=(2232,0)]
    out.write("\n");

// end
// begin [file="/_Type_.jsp";from=(2232,0);to=(2232,95)]
    /* ----  jalios:if ---- */
    com.jalios.jtaglib.IfTag _jspx_th_jalios_if_46 = new com.jalios.jtaglib.IfTag();
    _jspx_th_jalios_if_46.setPageContext(pageContext);
    _jspx_th_jalios_if_46.setParent(_jspx_th_jalios_foreach_50);
    _jspx_th_jalios_if_46.setPredicate( editor.equals("category") && requiredFieldNameSet.contains(name) );
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
                // HTML // begin [file="/_Type_.jsp";from=(2232,95);to=(2234,51)]
                    out.write("\n    {\n      Category fieldRootCat = channel.getCategory(\"");

                // end
                // begin [file="/_Type_.jsp";from=(2234,54);to=(2234,60)]
                    out.print( root );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(2234,62);to=(2236,0)]
                    out.write("\");\n      fieldRootCat = fieldRootCat != null ? fieldRootCat : channel.getRootCategory();\n");

                // end
                // begin [file="/_Type_.jsp";from=(2236,2);to=(2236,22)]
                     if (displayRoot) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(2236,24);to=(2239,0)]
                    out.write("\n      Set catSet = new TreeSet(fieldRootCat.getDescendantSet());\n      catSet.add(fieldRootCat);\n");

                // end
                // begin [file="/_Type_.jsp";from=(2239,2);to=(2239,12)]
                     } else { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(2239,14);to=(2241,0)]
                    out.write("\n      Set catSet = fieldRootCat.getDescendantSet();\n");

                // end
                // begin [file="/_Type_.jsp";from=(2241,2);to=(2241,5)]
                     } 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(2241,7);to=(2242,24)]
                    out.write("\n      if (Util.interSet(");

                // end
                // begin [file="/_Type_.jsp";from=(2242,27);to=(2242,74)]
                    out.print( isPublicationType ? "getCategorySet()" : name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(2242,76);to=(2244,47)]
                    out.write(", catSet).isEmpty()) {\n        status = new ControllerStatus();\n        status.setProp(\"msg.edit.empty-field\", ");

                // end
                // begin [file="/_Type_.jsp";from=(2244,50);to=(2244,57)]
                    out.print( label );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(2244,59);to=(2248,0)]
                    out.write(");\n        return status;\n      }\n    }\n");

                // end
                // begin [file="/_Type_.jsp";from=(2248,0);to=(2248,12)]
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
// HTML // begin [file="/_Type_.jsp";from=(2248,12);to=(2250,0)]
    out.write("\n\n");

// end
// begin [file="/_Type_.jsp";from=(2250,0);to=(2250,17)]
} while (_jspx_th_jalios_foreach_50.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
} finally {
    if (_jspx_eval_jalios_foreach_50 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
        out = pageContext.popBody();
}
}
if (_jspx_th_jalios_foreach_50.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
    return;
} finally {
    _jspx_th_jalios_foreach_50.release();
}
// end
// HTML // begin [file="/_Type_.jsp";from=(2250,17);to=(2254,0)]
    out.write("\n    return ControllerStatus.OK;\n  }\n  \n");

// end
// HTML // begin [file="/_Type_.jsp";from=(2254,69);to=(2255,0)]
    out.write("\n");

// end
// begin [file="/_Type_.jsp";from=(2255,2);to=(2255,43)]
     if (isPublicationType && hasUrlField) { 
// end
// HTML // begin [file="/_Type_.jsp";from=(2255,45);to=(2258,0)]
    out.write("\n  public Set<String> getExternalLinkSet() {\n    Set<String> set = super.getExternalLinkSet();\n");

// end
// begin [file="/_Type_.jsp";from=(2258,0);to=(2258,76)]
    /* ----  jalios:foreach ---- */
    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_51 = new com.jalios.jtaglib.ForeachTag();
    _jspx_th_jalios_foreach_51.setPageContext(pageContext);
    _jspx_th_jalios_foreach_51.setParent(null);
    _jspx_th_jalios_foreach_51.setCollection( urlFieldSet );
    _jspx_th_jalios_foreach_51.setName("itName");
    _jspx_th_jalios_foreach_51.setType("String");
    try {
        int _jspx_eval_jalios_foreach_51 = _jspx_th_jalios_foreach_51.doStartTag();
        if (_jspx_eval_jalios_foreach_51 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_foreach_51 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_foreach_51.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_foreach_51.doInitBody();
                }
                do {
                    Integer itCounter = null;
                    itCounter = (Integer) pageContext.findAttribute("itCounter");
                    String itName = null;
                    itName = (String) pageContext.findAttribute("itName");
                // end
                // HTML // begin [file="/_Type_.jsp";from=(2258,76);to=(2259,22)]
                    out.write("   \n    if (Util.notEmpty(");

                // end
                // begin [file="/_Type_.jsp";from=(2259,25);to=(2259,33)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(2259,35);to=(2260,14)]
                    out.write(")) {\n      set.add(");

                // end
                // begin [file="/_Type_.jsp";from=(2260,17);to=(2260,25)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(2260,27);to=(2262,0)]
                    out.write(");\n    }\n");

                // end
                // begin [file="/_Type_.jsp";from=(2262,0);to=(2262,17)]
                } while (_jspx_th_jalios_foreach_51.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_foreach_51 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_foreach_51.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_foreach_51.release();
    }
// end
// HTML // begin [file="/_Type_.jsp";from=(2262,17);to=(2263,0)]
    out.write("\n");

// end
// begin [file="/_Type_.jsp";from=(2263,0);to=(2263,81)]
    /* ----  jalios:foreach ---- */
    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_52 = new com.jalios.jtaglib.ForeachTag();
    _jspx_th_jalios_foreach_52.setPageContext(pageContext);
    _jspx_th_jalios_foreach_52.setParent(null);
    _jspx_th_jalios_foreach_52.setCollection( urlArrayFieldSet );
    _jspx_th_jalios_foreach_52.setName("itName");
    _jspx_th_jalios_foreach_52.setType("String");
    try {
        int _jspx_eval_jalios_foreach_52 = _jspx_th_jalios_foreach_52.doStartTag();
        if (_jspx_eval_jalios_foreach_52 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_foreach_52 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_foreach_52.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_foreach_52.doInitBody();
                }
                do {
                    Integer itCounter = null;
                    itCounter = (Integer) pageContext.findAttribute("itCounter");
                    String itName = null;
                    itName = (String) pageContext.findAttribute("itName");
                // end
                // HTML // begin [file="/_Type_.jsp";from=(2263,81);to=(2264,22)]
                    out.write("   \n    if (Util.notEmpty(");

                // end
                // begin [file="/_Type_.jsp";from=(2264,25);to=(2264,33)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(2264,35);to=(2265,44)]
                    out.write(")) {\n      set.addAll(Util.stringArrayToCleanSet(");

                // end
                // begin [file="/_Type_.jsp";from=(2265,47);to=(2265,55)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(2265,57);to=(2267,0)]
                    out.write("));\n    }\n");

                // end
                // begin [file="/_Type_.jsp";from=(2267,0);to=(2267,17)]
                } while (_jspx_th_jalios_foreach_52.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_foreach_52 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_foreach_52.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_foreach_52.release();
    }
// end
// HTML // begin [file="/_Type_.jsp";from=(2267,17);to=(2268,0)]
    out.write("\n");

// end
// begin [file="/_Type_.jsp";from=(2268,0);to=(2268,78)]
    /* ----  jalios:foreach ---- */
    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_53 = new com.jalios.jtaglib.ForeachTag();
    _jspx_th_jalios_foreach_53.setPageContext(pageContext);
    _jspx_th_jalios_foreach_53.setParent(null);
    _jspx_th_jalios_foreach_53.setCollection( urlFieldMLSet );
    _jspx_th_jalios_foreach_53.setName("itName");
    _jspx_th_jalios_foreach_53.setType("String");
    try {
        int _jspx_eval_jalios_foreach_53 = _jspx_th_jalios_foreach_53.doStartTag();
        if (_jspx_eval_jalios_foreach_53 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_foreach_53 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_foreach_53.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_foreach_53.doInitBody();
                }
                do {
                    Integer itCounter = null;
                    itCounter = (Integer) pageContext.findAttribute("itCounter");
                    String itName = null;
                    itName = (String) pageContext.findAttribute("itName");
                // end
                // HTML // begin [file="/_Type_.jsp";from=(2268,78);to=(2269,22)]
                    out.write("   \n    if (Util.notEmpty(");

                // end
                // begin [file="/_Type_.jsp";from=(2269,25);to=(2269,33)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(2269,35);to=(2270,14)]
                    out.write(")) {\n      set.add(");

                // end
                // begin [file="/_Type_.jsp";from=(2270,17);to=(2270,25)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(2270,27);to=(2272,8)]
                    out.write(");\n    }\n    if (");

                // end
                // begin [file="/_Type_.jsp";from=(2272,11);to=(2272,19)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(2272,21);to=(2273,43)]
                    out.write("ML != null) {\n      set.addAll(Util.collectionToCleanSet(");

                // end
                // begin [file="/_Type_.jsp";from=(2273,46);to=(2273,54)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(2273,56);to=(2275,0)]
                    out.write("ML.values()));\n    }\n");

                // end
                // begin [file="/_Type_.jsp";from=(2275,0);to=(2275,17)]
                } while (_jspx_th_jalios_foreach_53.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_foreach_53 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_foreach_53.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_foreach_53.release();
    }
// end
// HTML // begin [file="/_Type_.jsp";from=(2275,17);to=(2276,0)]
    out.write("\n");

// end
// begin [file="/_Type_.jsp";from=(2276,0);to=(2276,83)]
    /* ----  jalios:foreach ---- */
    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_54 = new com.jalios.jtaglib.ForeachTag();
    _jspx_th_jalios_foreach_54.setPageContext(pageContext);
    _jspx_th_jalios_foreach_54.setParent(null);
    _jspx_th_jalios_foreach_54.setCollection( urlArrayFieldMLSet );
    _jspx_th_jalios_foreach_54.setName("itName");
    _jspx_th_jalios_foreach_54.setType("String");
    try {
        int _jspx_eval_jalios_foreach_54 = _jspx_th_jalios_foreach_54.doStartTag();
        if (_jspx_eval_jalios_foreach_54 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_foreach_54 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_foreach_54.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_foreach_54.doInitBody();
                }
                do {
                    Integer itCounter = null;
                    itCounter = (Integer) pageContext.findAttribute("itCounter");
                    String itName = null;
                    itName = (String) pageContext.findAttribute("itName");
                // end
                // HTML // begin [file="/_Type_.jsp";from=(2276,83);to=(2277,8)]
                    out.write("   \n    if (");

                // end
                // begin [file="/_Type_.jsp";from=(2277,11);to=(2277,19)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(2277,21);to=(2278,44)]
                    out.write(" != null) {\n      set.addAll(Util.stringArrayToCleanSet(");

                // end
                // begin [file="/_Type_.jsp";from=(2278,47);to=(2278,55)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(2278,57);to=(2280,8)]
                    out.write("));\n    }\n    if (");

                // end
                // begin [file="/_Type_.jsp";from=(2280,11);to=(2280,19)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(2280,21);to=(2281,30)]
                    out.write("ML != null) {\n      for (String[] itValue : ");

                // end
                // begin [file="/_Type_.jsp";from=(2281,33);to=(2281,41)]
                    out.print( itName );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(2281,43);to=(2287,0)]
                    out.write("ML.values()) {\n        if (itValue != null) {\n          set.addAll(Util.stringArrayToCleanSet(itValue)); \n        }\n      }\n    }\n");

                // end
                // begin [file="/_Type_.jsp";from=(2287,0);to=(2287,17)]
                } while (_jspx_th_jalios_foreach_54.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_foreach_54 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_foreach_54.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_foreach_54.release();
    }
// end
// HTML // begin [file="/_Type_.jsp";from=(2287,17);to=(2299,0)]
    out.write("\n\n    String prefixUrl = channel.getUrl();\n    for (Iterator<String> it = set.iterator(); it.hasNext();) {\n      String url = it.next();\n      if (url.startsWith(prefixUrl)) {\n        it.remove();\n      }\n    }\n    \n    return set;\n  }\n");

// end
// begin [file="/_Type_.jsp";from=(2299,2);to=(2299,5)]
     } 
// end
// HTML // begin [file="/_Type_.jsp";from=(2299,7);to=(2302,0)]
    out.write("\n\n\n");

// end
// HTML // begin [file="/_Type_.jsp";from=(2302,78);to=(2303,0)]
    out.write("\n");

// end
// begin [file="/_Type_.jsp";from=(2303,2);to=(2303,30)]
     if (hasDBDataCollection) { 
// end
// HTML // begin [file="/_Type_.jsp";from=(2303,32);to=(2311,0)]
    out.write("\n\n  // ----------------------------------------------------------------------\n  // initializeDBDataCollections\n  // ----------------------------------------------------------------------  \n  @Override\n  public void initializeDBDataCollections() { \n    super.initializeDBDataCollections();\n");

// end
// begin [file="/_Type_.jsp";from=(2311,2);to=(2321,66)]
       for(TypeFieldEntry entry: fieldEntryList) {
           if (!entry.isTypeCollection()) {
             continue;
           }
           String name = entry.getName();
           if (entry.isAnyLink()) {
             name += "Id";
           }
           boolean isLinkFromDBType = isDBType && entry.isAnyLink();
           if (isLinkFromDBType && entry.isTypeCollection()) { 
             String collection = entry.isTypeList() ? "List" : "Set"; 
// end
// HTML // begin [file="/_Type_.jsp";from=(2321,68);to=(2322,8)]
    out.write("\n    if (");

// end
// begin [file="/_Type_.jsp";from=(2322,11);to=(2322,28)]
    out.print( entry.getName() );
// end
// begin [file="/_Type_.jsp";from=(2322,33);to=(2322,45)]
    out.print( collection );
// end
// HTML // begin [file="/_Type_.jsp";from=(2322,47);to=(2322,65)]
    out.write("Helper != null) { ");

// end
// begin [file="/_Type_.jsp";from=(2322,68);to=(2322,85)]
    out.print( entry.getName() );
// end
// begin [file="/_Type_.jsp";from=(2322,90);to=(2322,102)]
    out.print( collection );
// end
// HTML // begin [file="/_Type_.jsp";from=(2322,104);to=(2323,0)]
    out.write("Helper.initializeHibernateCollection(); }  \n");

// end
// begin [file="/_Type_.jsp";from=(2323,2);to=(2323,16)]
         } else { 
// end
// HTML // begin [file="/_Type_.jsp";from=(2323,18);to=(2324,25)]
    out.write("\n    Hibernate.initialize(");

// end
// begin [file="/_Type_.jsp";from=(2324,28);to=(2324,34)]
    out.print( name );
// end
// HTML // begin [file="/_Type_.jsp";from=(2324,36);to=(2325,0)]
    out.write(");\n");

// end
// begin [file="/_Type_.jsp";from=(2325,2);to=(2325,9)]
         } 
// end
// HTML // begin [file="/_Type_.jsp";from=(2325,11);to=(2326,0)]
    out.write("\n");

// end
// begin [file="/_Type_.jsp";from=(2326,2);to=(2326,7)]
       } 
// end
// HTML // begin [file="/_Type_.jsp";from=(2326,9);to=(2336,0)]
    out.write("\n  }\n  \n\n  // ----------------------------------------------------------------------\n  // cloneDBDataCollections\n  // ----------------------------------------------------------------------  \n  @Override\n  public void cloneDBDataCollections() { \n    super.cloneDBDataCollections();\n");

// end
// begin [file="/_Type_.jsp";from=(2336,2);to=(2347,66)]
       for(TypeFieldEntry entry: fieldEntryList) {
           if (!entry.isTypeCollection()) {
             continue;
           }
           String name = entry.getName();
           if (entry.isAnyLink()) {
             name += "Id";
           }
           
           boolean isLinkFromDBType = isDBType && entry.isAnyLink();
           if (isLinkFromDBType && entry.isTypeCollection()) { 
             String collection = entry.isTypeList() ? "List" : "Set"; 
// end
// HTML // begin [file="/_Type_.jsp";from=(2347,68);to=(2348,8)]
    out.write("\n    if (");

// end
// begin [file="/_Type_.jsp";from=(2348,11);to=(2348,28)]
    out.print( entry.getName() );
// end
// begin [file="/_Type_.jsp";from=(2348,33);to=(2348,45)]
    out.print( collection );
// end
// HTML // begin [file="/_Type_.jsp";from=(2348,47);to=(2348,65)]
    out.write("Helper != null) { ");

// end
// begin [file="/_Type_.jsp";from=(2348,68);to=(2348,85)]
    out.print( entry.getName() );
// end
// begin [file="/_Type_.jsp";from=(2348,90);to=(2348,102)]
    out.print( collection );
// end
// HTML // begin [file="/_Type_.jsp";from=(2348,104);to=(2348,113)]
    out.write("Helper = ");

// end
// begin [file="/_Type_.jsp";from=(2348,116);to=(2348,133)]
    out.print( entry.getName() );
// end
// begin [file="/_Type_.jsp";from=(2348,138);to=(2348,150)]
    out.print( collection );
// end
// HTML // begin [file="/_Type_.jsp";from=(2348,152);to=(2348,173)]
    out.write("Helper.copy(this::set");

// end
// begin [file="/_Type_.jsp";from=(2348,176);to=(2348,196)]
    out.print( entry.getNameCap() );
// end
// HTML // begin [file="/_Type_.jsp";from=(2348,198);to=(2349,0)]
    out.write("); }  \n");

// end
// begin [file="/_Type_.jsp";from=(2349,2);to=(2351,0)]
         } else { 
           String collType = entry.isTypeList() ? "ArrayList" : "HashSet";
// end
// HTML // begin [file="/_Type_.jsp";from=(2351,2);to=(2352,8)]
    out.write("\n    if (");

// end
// begin [file="/_Type_.jsp";from=(2352,11);to=(2352,17)]
    out.print( name );
// end
// HTML // begin [file="/_Type_.jsp";from=(2352,19);to=(2352,31)]
    out.write(" != null) { ");

// end
// begin [file="/_Type_.jsp";from=(2352,34);to=(2352,40)]
    out.print( name );
// end
// HTML // begin [file="/_Type_.jsp";from=(2352,42);to=(2352,49)]
    out.write(" = new ");

// end
// begin [file="/_Type_.jsp";from=(2352,52);to=(2352,62)]
    out.print( collType );
// end
// HTML // begin [file="/_Type_.jsp";from=(2352,64);to=(2352,67)]
    out.write("<>(");

// end
// begin [file="/_Type_.jsp";from=(2352,70);to=(2352,76)]
    out.print( name );
// end
// HTML // begin [file="/_Type_.jsp";from=(2352,78);to=(2353,0)]
    out.write("); }\n");

// end
// begin [file="/_Type_.jsp";from=(2353,2);to=(2353,9)]
         } 
// end
// HTML // begin [file="/_Type_.jsp";from=(2353,11);to=(2354,0)]
    out.write("\n");

// end
// begin [file="/_Type_.jsp";from=(2354,2);to=(2354,7)]
       } 
// end
// HTML // begin [file="/_Type_.jsp";from=(2354,9);to=(2356,0)]
    out.write("  \n  }\n");

// end
// begin [file="/_Type_.jsp";from=(2356,2);to=(2356,5)]
     } 
// end
// HTML // begin [file="/_Type_.jsp";from=(2356,7);to=(2358,0)]
    out.write("\n\n");

// end
// begin [file="/_Type_.jsp";from=(2358,2);to=(2358,42)]
     if (!hybridCollectionList.isEmpty()) { 
// end
// HTML // begin [file="/_Type_.jsp";from=(2358,44);to=(2365,4)]
    out.write("\n  // ----------------------------------------------------------------------\n  // splitHybridCollections\n  // ----------------------------------------------------------------------\n  @Override\n  protected void splitHybridCollections(Data previousData) {\n    super.splitHybridCollections(previousData);\n    ");

// end
// begin [file="/_Type_.jsp";from=(2365,7);to=(2365,18)]
    out.print( className );
// end
// HTML // begin [file="/_Type_.jsp";from=(2365,20);to=(2365,33)]
    out.write(" previous = (");

// end
// begin [file="/_Type_.jsp";from=(2365,36);to=(2365,47)]
    out.print( className );
// end
// HTML // begin [file="/_Type_.jsp";from=(2365,49);to=(2367,0)]
    out.write(")previousData;\n\n");

// end
// begin [file="/_Type_.jsp";from=(2367,2);to=(2370,0)]
       for(TypeFieldEntry entry: hybridCollectionList) {
           String name = entry.getName();
           String nameCap = entry.getNameCap();       
// end
// HTML // begin [file="/_Type_.jsp";from=(2370,2);to=(2371,37)]
    out.write("  \n    if (previous == null || previous.");

// end
// begin [file="/_Type_.jsp";from=(2371,40);to=(2371,46)]
    out.print( name );
// end
// HTML // begin [file="/_Type_.jsp";from=(2371,48);to=(2371,52)]
    out.write(" != ");

// end
// begin [file="/_Type_.jsp";from=(2371,55);to=(2371,61)]
    out.print( name );
// end
// HTML // begin [file="/_Type_.jsp";from=(2371,63);to=(2372,6)]
    out.write(") {\n      ");

// end
// begin [file="/_Type_.jsp";from=(2372,9);to=(2372,15)]
    out.print( name );
// end
// HTML // begin [file="/_Type_.jsp";from=(2372,17);to=(2372,41)]
    out.write("DBID = computeDBIDArray(");

// end
// begin [file="/_Type_.jsp";from=(2372,44);to=(2372,50)]
    out.print( name );
// end
// HTML // begin [file="/_Type_.jsp";from=(2372,52);to=(2374,0)]
    out.write(");\n    }\n");

// end
// begin [file="/_Type_.jsp";from=(2374,2);to=(2374,7)]
       } 
// end
// HTML // begin [file="/_Type_.jsp";from=(2374,9);to=(2384,0)]
    out.write("\n  }\n  \n  // ----------------------------------------------------------------------\n  // cleanHybridCollections\n  // ----------------------------------------------------------------------\n  @Override\n  protected void cleanHybridCollections() {\n    super.cleanHybridCollections();\n\n");

// end
// begin [file="/_Type_.jsp";from=(2384,2);to=(2386,0)]
       for(TypeFieldEntry entry: hybridCollectionList) {
           String name = entry.getName();
// end
// HTML // begin [file="/_Type_.jsp";from=(2386,2);to=(2387,26)]
    out.write("\n    cleanHybridCollection(");

// end
// begin [file="/_Type_.jsp";from=(2387,29);to=(2387,35)]
    out.print( name );
// end
// HTML // begin [file="/_Type_.jsp";from=(2387,37);to=(2388,0)]
    out.write(");\n");

// end
// begin [file="/_Type_.jsp";from=(2388,2);to=(2388,7)]
       } 
// end
// HTML // begin [file="/_Type_.jsp";from=(2388,9);to=(2390,0)]
    out.write("\n  }\n");

// end
// begin [file="/_Type_.jsp";from=(2390,2);to=(2390,5)]
     } 
// end
// HTML // begin [file="/_Type_.jsp";from=(2390,7);to=(2392,0)]
    out.write("\n  \n");

// end
// HTML // begin [file="/_Type_.jsp";from=(2392,59);to=(2393,0)]
    out.write("\n");

// end
// begin [file="/_Type_.jsp";from=(2393,2);to=(2393,28)]
     if (isPublicationType) { 
// end
// HTML // begin [file="/_Type_.jsp";from=(2393,30);to=(2400,0)]
    out.write("\n\n  // ----------------------------------------------------------------------\n  // WorkCopy\n  // ----------------------------------------------------------------------  \n  protected void prepareMergeCopy(Publication mergeCopy) {\n    super.prepareMergeCopy(mergeCopy);  \n");

// end
// begin [file="/_Type_.jsp";from=(2400,0);to=(2400,86)]
    /* ----  jalios:foreach ---- */
    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_55 = new com.jalios.jtaglib.ForeachTag();
    _jspx_th_jalios_foreach_55.setPageContext(pageContext);
    _jspx_th_jalios_foreach_55.setParent(null);
    _jspx_th_jalios_foreach_55.setCollection( fieldEntryList );
    _jspx_th_jalios_foreach_55.setName("entry");
    _jspx_th_jalios_foreach_55.setType("TypeFieldEntry");
    try {
        int _jspx_eval_jalios_foreach_55 = _jspx_th_jalios_foreach_55.doStartTag();
        if (_jspx_eval_jalios_foreach_55 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_foreach_55 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_foreach_55.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_foreach_55.doInitBody();
                }
                do {
                    Integer itCounter = null;
                    itCounter = (Integer) pageContext.findAttribute("itCounter");
                    TypeFieldEntry entry = null;
                    entry = (TypeFieldEntry) pageContext.findAttribute("entry");
                // end
                // HTML // begin [file="/_Type_.jsp";from=(2400,86);to=(2401,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(2401,2);to=(2401,86)]
                     if (!"category".equals(entry.getEditor()) && !("super".equals(entry.getType()))) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(2401,88);to=(2402,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(2402,2);to=(2402,40)]
                     String nameCap = entry.getNameCap(); 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(2402,42);to=(2403,6)]
                    out.write("\n    ((");

                // end
                // begin [file="/_Type_.jsp";from=(2403,9);to=(2403,20)]
                    out.print( className );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(2403,22);to=(2403,37)]
                    out.write(")mergeCopy).set");

                // end
                // begin [file="/_Type_.jsp";from=(2403,40);to=(2403,49)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(2403,51);to=(2403,55)]
                    out.write("(get");

                // end
                // begin [file="/_Type_.jsp";from=(2403,58);to=(2403,67)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(2403,69);to=(2404,0)]
                    out.write("());\n");

                // end
                // begin [file="/_Type_.jsp";from=(2404,2);to=(2404,28)]
                     if (entry.isFieldML()) { 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(2404,30);to=(2405,6)]
                    out.write("\n    ((");

                // end
                // begin [file="/_Type_.jsp";from=(2405,9);to=(2405,20)]
                    out.print( className );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(2405,22);to=(2405,37)]
                    out.write(")mergeCopy).set");

                // end
                // begin [file="/_Type_.jsp";from=(2405,40);to=(2405,49)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(2405,51);to=(2405,81)]
                    out.write("ML(JcmsUtil.getMergedMLMap(get");

                // end
                // begin [file="/_Type_.jsp";from=(2405,84);to=(2405,93)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(2405,95);to=(2405,103)]
                    out.write("ML(), ((");

                // end
                // begin [file="/_Type_.jsp";from=(2405,106);to=(2405,117)]
                    out.print( className );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(2405,119);to=(2405,134)]
                    out.write(")mergeCopy).get");

                // end
                // begin [file="/_Type_.jsp";from=(2405,137);to=(2405,146)]
                    out.print( nameCap );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(2405,148);to=(2406,0)]
                    out.write("ML()));\n");

                // end
                // begin [file="/_Type_.jsp";from=(2406,2);to=(2406,5)]
                     } 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(2406,7);to=(2407,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(2407,2);to=(2407,5)]
                     } 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(2407,7);to=(2408,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(2408,0);to=(2408,17)]
                } while (_jspx_th_jalios_foreach_55.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_foreach_55 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_foreach_55.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_foreach_55.release();
    }
// end
// HTML // begin [file="/_Type_.jsp";from=(2408,17);to=(2410,0)]
    out.write("\n  }\n");

// end
// begin [file="/_Type_.jsp";from=(2410,2);to=(2410,5)]
     } 
// end
// HTML // begin [file="/_Type_.jsp";from=(2410,7);to=(2412,0)]
    out.write("\n\n");

// end
// HTML // begin [file="/_Type_.jsp";from=(2412,84);to=(2413,0)]
    out.write("\n");

// end
// begin [file="/_Type_.jsp";from=(2413,2);to=(2413,19)]
     if (isDBType) { 
// end
// HTML // begin [file="/_Type_.jsp";from=(2413,21);to=(2416,0)]
    out.write("\n  @Override \n  public void performCreate(Member mbr, Map context) {\n");

// end
// begin [file="/_Type_.jsp";from=(2416,0);to=(2416,94)]
    /* ----  jalios:foreach ---- */
    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_56 = new com.jalios.jtaglib.ForeachTag();
    _jspx_th_jalios_foreach_56.setPageContext(pageContext);
    _jspx_th_jalios_foreach_56.setParent(null);
    _jspx_th_jalios_foreach_56.setCollection( objectFieldEntryList );
    _jspx_th_jalios_foreach_56.setName("itField");
    _jspx_th_jalios_foreach_56.setType("TypeFieldEntry");
    try {
        int _jspx_eval_jalios_foreach_56 = _jspx_th_jalios_foreach_56.doStartTag();
        if (_jspx_eval_jalios_foreach_56 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_foreach_56 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_foreach_56.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_foreach_56.doInitBody();
                }
                do {
                    Integer itCounter = null;
                    itCounter = (Integer) pageContext.findAttribute("itCounter");
                    TypeFieldEntry itField = null;
                    itField = (TypeFieldEntry) pageContext.findAttribute("itField");
                // end
                // HTML // begin [file="/_Type_.jsp";from=(2416,94);to=(2417,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(2417,2);to=(2420,0)]
                    
                      if (itField.isTextfield()) {
                        String name = itField.getName();
                // end
                // HTML // begin [file="/_Type_.jsp";from=(2420,2);to=(2421,4)]
                    out.write("\n    ");

                // end
                // begin [file="/_Type_.jsp";from=(2421,7);to=(2421,13)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(2421,15);to=(2421,39)]
                    out.write(" = Util.truncateVarchar(");

                // end
                // begin [file="/_Type_.jsp";from=(2421,42);to=(2421,48)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(2421,50);to=(2422,0)]
                    out.write(");\n");

                // end
                // begin [file="/_Type_.jsp";from=(2422,2);to=(2422,5)]
                     } 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(2422,7);to=(2423,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(2423,0);to=(2423,17)]
                } while (_jspx_th_jalios_foreach_56.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_foreach_56 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_foreach_56.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_foreach_56.release();
    }
// end
// HTML // begin [file="/_Type_.jsp";from=(2423,17);to=(2429,0)]
    out.write("\n    super.performCreate(mbr, context);\n  }\n  \n  @Override \n  public void performUpdate(Member mbr, Map context) {\n");

// end
// begin [file="/_Type_.jsp";from=(2429,0);to=(2429,94)]
    /* ----  jalios:foreach ---- */
    com.jalios.jtaglib.ForeachTag _jspx_th_jalios_foreach_57 = new com.jalios.jtaglib.ForeachTag();
    _jspx_th_jalios_foreach_57.setPageContext(pageContext);
    _jspx_th_jalios_foreach_57.setParent(null);
    _jspx_th_jalios_foreach_57.setCollection( objectFieldEntryList );
    _jspx_th_jalios_foreach_57.setName("itField");
    _jspx_th_jalios_foreach_57.setType("TypeFieldEntry");
    try {
        int _jspx_eval_jalios_foreach_57 = _jspx_th_jalios_foreach_57.doStartTag();
        if (_jspx_eval_jalios_foreach_57 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            try {
                if (_jspx_eval_jalios_foreach_57 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = pageContext.pushBody();
                    _jspx_th_jalios_foreach_57.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
                    _jspx_th_jalios_foreach_57.doInitBody();
                }
                do {
                    Integer itCounter = null;
                    itCounter = (Integer) pageContext.findAttribute("itCounter");
                    TypeFieldEntry itField = null;
                    itField = (TypeFieldEntry) pageContext.findAttribute("itField");
                // end
                // HTML // begin [file="/_Type_.jsp";from=(2429,94);to=(2430,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(2430,2);to=(2433,0)]
                    
                      if (itField.isTextfield()) {
                        String name = itField.getName();
                // end
                // HTML // begin [file="/_Type_.jsp";from=(2433,2);to=(2434,4)]
                    out.write("\n    ");

                // end
                // begin [file="/_Type_.jsp";from=(2434,7);to=(2434,13)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(2434,15);to=(2434,39)]
                    out.write(" = Util.truncateVarchar(");

                // end
                // begin [file="/_Type_.jsp";from=(2434,42);to=(2434,48)]
                    out.print( name );
                // end
                // HTML // begin [file="/_Type_.jsp";from=(2434,50);to=(2435,0)]
                    out.write(");\n");

                // end
                // begin [file="/_Type_.jsp";from=(2435,2);to=(2435,5)]
                     } 
                // end
                // HTML // begin [file="/_Type_.jsp";from=(2435,7);to=(2436,0)]
                    out.write("\n");

                // end
                // begin [file="/_Type_.jsp";from=(2436,0);to=(2436,17)]
                } while (_jspx_th_jalios_foreach_57.doAfterBody() == javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN);
            } finally {
                if (_jspx_eval_jalios_foreach_57 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
                    out = pageContext.popBody();
            }
        }
        if (_jspx_th_jalios_foreach_57.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE)
            return;
    } finally {
        _jspx_th_jalios_foreach_57.release();
    }
// end
// HTML // begin [file="/_Type_.jsp";from=(2436,17);to=(2439,0)]
    out.write("\n    super.performUpdate(mbr, context);\n  }\n");

// end
// begin [file="/_Type_.jsp";from=(2439,2);to=(2439,5)]
     } 
// end
// HTML // begin [file="/_Type_.jsp";from=(2439,7);to=(2442,0)]
    out.write("\n\n}\n");

// end
// begin [file="/_Type_.jsp";from=(2442,2);to=(2442,16)]
     out.flush(); 
// end
// HTML // begin [file="/_Type_.jsp";from=(2442,18);to=(2445,0)]
    out.write("\n\n\n");

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
