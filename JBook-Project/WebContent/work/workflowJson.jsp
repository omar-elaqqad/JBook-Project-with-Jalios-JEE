<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@ page import="com.fasterxml.jackson.databind.node.ObjectNode" %>
<%@ page import="com.fasterxml.jackson.databind.node.ArrayNode" %>
<%
  // inform doInitPage to set the proper content type
  request.setAttribute("ContentType", "text/html; charset=UTF-8");

%><%@ include file='/jcore/doInitPage.jspf' %><%
%><%
  if (!(isAdmin || checkAccess("admin-ws/") || checkAccess("admin/work/workflow"))) {
    sendForbidden(request, response);
    return;
  }
%>
<%! public static final String PAD_STR = " ";

	public String getStateColor(Workflow wf , WFState state) {
    String stateColor = state.getColor();
    if (Util.notEmpty(stateColor)) {
      return stateColor;
    }
		switch (state.getPstatus()) {
			case -10:	 return "#FFCC00"; 		// Scheduled
			case 0:		 return "#5CB800"; 		// Published
			case 10:	 return "#999999"; 		// Expired
			case 20: 	 return "#555555"; 		// Archived
			case 1884: return "#87a7b2";    // Trash  
			default:	return state.isVisible() ? "#5bc0de" : "#FF8533";
		}
	}
	public String getNodeName() {
		return getNodeName(null, null, true);
	}
	public String getNodeName(Workflow wf, WFState state) {
		return getNodeName(wf,state, true);
	}
	public String getNodeName(Workflow wf, WFState state, boolean noWhitespaces) {

		if (Util.isEmpty(state)) {
			return PAD_STR;
		}

		String name = Util.toString( Util.unaccentuate(state.getLabel(Channel.getChannel().getCurrentUserLang())), "");
		if (noWhitespaces) {
			name = name.replaceAll("\\s+",PAD_STR);
		}

		return name;
	}

	public String getNodeLabel(Workflow wf, WFState state) {

		String label = getNodeName(wf, state, false);

		return label;
	}
	public String getEdgeLabel(WFTransition wfTransition) {
		StringBuffer sb = new StringBuffer();
		for(Iterator it = wfTransition.getRoleSet().iterator(); it.hasNext();) {
			WFRole role = (WFRole)it.next();
			sb.append(role.getName(Channel.getChannel().getCurrentUserLang()));
			sb.append(" ");
		}
		String roles = Util.unaccentuate(sb.toString());
		return roles;
	}

	public String getStateInfo(WFState state) {
	  String info = "";

    List<String> alertListIn = new ArrayList<>();

    if (state.isActionIn(WFAction.TYPE_ALERT_AUTHOR)) {
      alertListIn.add( JcmsUtil.glp(Channel.getChannel().getCurrentUserLang(), "ui.adm.wf-edit.svg.author") );
    }
    if (state.isActionIn(WFAction.TYPE_ALERT_WORKERS)) {
      alertListIn.add( JcmsUtil.glp(Channel.getChannel().getCurrentUserLang(), "ui.adm.wf-edit.svg.worker") );
    }
    if (state.isActionIn(WFAction.TYPE_ALERT_MANAGER)) {
      alertListIn.add( JcmsUtil.glp(Channel.getChannel().getCurrentUserLang(), "ui.adm.wf-edit.svg.manager") );
    }
        
    
    List<String> alertListOut = new ArrayList<>();
    if (state.isActionOut(WFAction.TYPE_ALERT_AUTHOR)) {
      alertListOut.add( JcmsUtil.glp(Channel.getChannel().getCurrentUserLang(), "ui.adm.wf-edit.svg.author") );
    }
    if (state.isActionOut(WFAction.TYPE_ALERT_WORKERS)) {
      alertListOut.add( JcmsUtil.glp(Channel.getChannel().getCurrentUserLang(), "ui.adm.wf-edit.svg.worker") );
    }
    if (state.isActionOut(WFAction.TYPE_ALERT_MANAGER)) {
      alertListOut.add( JcmsUtil.glp(Channel.getChannel().getCurrentUserLang(), "ui.adm.wf-edit.svg.manager") );
    }
    
    
    if (!alertListIn.isEmpty()) {
      info += JcmsUtil.glp(Channel.getChannel().getCurrentUserLang(), "ui.adm.wf-edit.svg.actionIn");
      info += " (" + String.join(", ", alertListIn)+ ")";
      info += "<br>";
    }

    if (!alertListOut.isEmpty()) {
      info += JcmsUtil.glp(Channel.getChannel().getCurrentUserLang(), "ui.adm.wf-edit.svg.actionOut");
      info += " (" + String.join(", ", alertListOut)+ ")";
    }

	  return info;
  }

%><%
%><%
	String wfid = getAlphaNumParameter("id", null);

	if (Util.isEmpty(wfid)) {
		return;
	}

	Workflow wf = WorkflowManager.getInstance().getCopyWorkflow(wfid);

	if (Util.isEmpty(wf)) {
	  return;
  }

	Set<WFState> stateSet = wf.getStateSet();
	List<WFState> stateList = new ArrayList<WFState>(stateSet);


  //Build json using jackson
  ObjectMapper mapper = new ObjectMapper();
  ObjectNode workflowNode = mapper.createObjectNode();
  ArrayNode states = workflowNode.putArray("states");
  ArrayNode transitions = workflowNode.putArray("transitions");

  int transitionNo = 0;

%>

	<jalios:foreach collection='<%= stateSet %>' type='WFState' name='itState' counter='itStateCounter'>

    <%
      ObjectNode stateNode = workflowNode.objectNode();

      stateNode.put("label", getNodeLabel(wf,itState) );
      stateNode.put("name", getNodeName(wf, itState) );
      stateNode.put("pstatus", itState.getPstatus() );
      stateNode.put("stateColor", getStateColor(wf,itState) );
      stateNode.put("sendUser", itState.isActionOut(WFAction.TYPE_ALERT_AUTHOR) );
      stateNode.put("sendWorker", itState.isActionOut(WFAction.TYPE_ALERT_WORKERS) );
      stateNode.put("sendManager", itState.isActionOut(WFAction.TYPE_ALERT_MANAGER) );
      stateNode.put("recUser", itState.isActionIn(WFAction.TYPE_ALERT_AUTHOR));
      stateNode.put("recWorker", itState.isActionIn(WFAction.TYPE_ALERT_WORKERS) );
      stateNode.put("recManager", itState.isActionIn(WFAction.TYPE_ALERT_MANAGER) );
      stateNode.put("info", getStateInfo(itState) );
      stateNode.put("initState", wf.getInitState() == itState);
      stateNode.put("itStateCounter", itStateCounter);

      if (itState.getPstatus() != WorkflowConstants.TRASHED_PSTATUS) {
        states.add(stateNode);
      }

    %>

	</jalios:foreach>


		<jalios:foreach collection='<%= wf.getStateSet() %>' type='WFState' name='itState' counter='itStateCounter'>
    	<%
      boolean isExpress = itState.isExpress();
      int targetPstatus = itState.getTargetPstatus();
      boolean hasBeenDraw = false;
      %>

      <jalios:foreach collection='<%= itState.getTransitionSet() %>' type='WFTransition' name='itTransition' counter='itTransCounter'>

			<%

				int pos1  = stateList.indexOf(itTransition.getSource());
				int pos2  = stateList.indexOf(itTransition.getTarget());
				int wfLevel = pos2 - pos1;

        if (pos1 == pos2) {
          //Skip self cycles
          ++transitionNo;

        }
        else if (isExpress && itTransition.getTarget().getPstatus() == targetPstatus) {
            //Begin Express
            hasBeenDraw = true;

            ObjectNode transitionNode = workflowNode.objectNode();
            transitionNode.put("source", getNodeName(wf, itTransition.getSource()) ) ;
            transitionNode.put("target", getNodeName(wf, itTransition.getTarget()) );
            transitionNode.put("wfGroups", "" + getEdgeLabel(itTransition) + "|Express "+itState.getDuration() +" min");
            transitionNode.put("wfSourcePstatus", itTransition.getSource().getPstatus());
            transitionNode.put("wfTargetPstatus", itTransition.getTarget().getPstatus() );
            transitionNode.put("wfLevel", wfLevel);
            transitionNode.put("transitionNoA", ++transitionNo);

            transitions.add(transitionNode);

          } //End express

          else {

          ObjectNode transitionNode = workflowNode.objectNode();
          transitionNode.put("source", getNodeName(wf, itTransition.getSource()));
          transitionNode.put("target", getNodeName(wf, itTransition.getTarget()));
          transitionNode.put("wfGroups", "" + getEdgeLabel(itTransition) + "");
          transitionNode.put("wfSourcePstatus", itTransition.getSource().getPstatus());
          transitionNode.put("wfTargetPstatus", itTransition.getTarget().getPstatus());
          transitionNode.put("wfLevel", wfLevel);
          transitionNode.put("transitionNoB", ++transitionNo);

          transitions.add(transitionNode);

        }

      %>

			</jalios:foreach>


     <%
      if (!hasBeenDraw && isExpress) {
        int i1 = stateList.indexOf(itState);
        int i2 = stateList.indexOf(wf.getState(itState.getTargetPstatus()));
        WFState nextState = stateList.get(i2);


        ObjectNode transitionNode = workflowNode.objectNode();
        transitionNode.put("source", getNodeName(wf, itState)) ;
        transitionNode.put("target", getNodeName(wf, nextState)) ;
        transitionNode.put("wfGroups", "" + "Express "+itState.getDuration() +" min") ;
        transitionNode.put("wfSourcePstatus", itState.getPstatus()) ;
        transitionNode.put("wfTargetPstatus", targetPstatus) ;
        transitionNode.put("wfLevel", i2 - i1) ;
        transitionNode.put("transitionNoC", transitionNo) ;

        transitions.add(transitionNode);
      }

      %>

    </jalios:foreach>


<%= mapper.writeValueAsString(workflowNode) %>