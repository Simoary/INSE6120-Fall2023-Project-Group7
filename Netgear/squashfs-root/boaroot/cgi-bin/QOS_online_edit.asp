
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<script language=javascript type=text/javascript src="/qos.js"></script>
<title>NETGEAR Router WNDR3800 </title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body onLoad="loadvalue();" bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/QOS_rule.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>" target=formframe>
<input type=hidden name=submit_flag value="edit_qos_online">

<div class="page_title">QoS - Priority Rules</div>
<div class="fix_button">
<TABLE cellspacing=5 cellPadding=0 width=100% border=0>
<TR>
        <TD nowrap align=center>
		<input class="cancel_bt" type='button' name='Cancel' id="cancel" value='Cancel' onClick='qosRule();'>&nbsp;&nbsp;
        <input class="apply_bt" type="submit" name="Apply" id="apply" value="Apply" onClick="return check_qos_online(document.forms[0],'edit');">
    </TD>
</TR>
</TABLE>

</div>
<div id="main" class="main_top_button"> 
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tr><td colSpan="2"><h1></h1></td></tr>



<script>
var qosArray1="MSN_messenger 0 MSN_messenger 1 TCP 443 443 ---- ----";
var qosArray2="Yahoo_Messenger 0 Yahoo_messenger 1 TCP 5050,5100,11999 5050,5100,11999 ---- ----";
var qosArray3="IP_Phone 0 IP_Phone 0 TCP 6670 6670 ---- ----";
var qosArray4="Vonage_IP_Phone 0 Vonage_IP_Phone 0 UDP 53,69,5060 53,69,5061 ---- ----";
var qosArray5="NetMeeting 0 Netmeeting 1 TCP 1720 1720 ---- ----";
var qosArray6="AIM 0 AIM 1 TCP 5190 5190 ---- ----";
var qosArray7="Google_Talk 0 Google_Talk 0 TCP 443 443 ---- ----";
var qosArray8="Netgear_EVA 0 Netgear_EVA 0 UDP 49152 49155 ---- ----";
var qosArray9="Counter-Strike 1 Counter-Strike 1 UDP 27015 27019 ---- ----";
var qosArray10="Age-of-Empires 1 Age-of-Empires 1 TCP\/UDP 47624 47624 ---- ----";
var qosArray11="Everquest 1 Everquest 1 TCP 7000 7000 ---- ----";
var qosArray12="Quake-2 1 Quake-2 1 TCP\/UDP 27960 27960 ---- ----";
var qosArray13="Quake-3 1 Quake-3 1 TCP\/UDP 27960 27960 ---- ----";
var qosArray14="Unreal-Tourment 1 Unreal-Tourment 1 TCP\/UDP 7777,27960 7783,27960 ---- ----";
var qosArray15="Warcraft 1 Warcraft 1 TCP 6112 6112 ---- ----";
var qos_array_num=15;

str_div="";
var serv_array=[["UDP","27015","27019","Counter-Strike","1"],["TCP/UDP","23978","23978","Age-of-Empires","1"],["TCP","1024,7000","6000,7000","Everquest","1"],["TCP/UDP","27960","27960","Quake-2","1"],["TCP/UDP","27960","27960","Quake-3","1"],["TCP/UDP","7777,27960","7783,27960","Unreal-Tourment","1"],["TCP","6112","6112","Warcraft","1"]];
var select_editnum="";
function getObj(name)
{
    if (document.getElementById)
    {
        return document.getElementById(name);
    }
    else if (document.all)
    {
        return document.all[name];
    }
    else if (document.layers)
    {
        return document.layers[name];
    }
}
function loadvalue()
{
	var cf=document.forms[0];
	str_div=getObj("hidden_app_port").innerHTML;
	getObj("hidden_app_port").innerHTML='';	
	var edit_str=eval('qosArray'+select_editnum);
	var each_info=edit_str.split(' ');
	cf.hidden_qos_policy_name.value=each_info[0];
	cf.name.value=change_name_online(each_info[0])
	cf.apps.value=each_info[2];
	cf.priority.value=each_info[3];
	if (cf.apps.selectedIndex == 7)
	{
		getObj("real_app_port").innerHTML=str_div;
		cf.protocol.value=each_info[4];
		cf.port_start.value=each_info[5];
		cf.port_end.value=each_info[6];
	}
	else
		getObj("real_app_port").innerHTML='';
}
</script>
<input type="hidden" name="hidden_port_type">
<input type="hidden" name="hidden_portstart">
<input type="hidden" name="hidden_portend">
<input type="hidden" name="hidden_qos_policy_name">
<input type="hidden" name="hidden_priority_category" value=1>
	<TR><TD nowrap colspan=2><b>Priority</b> </TD></TR>
	<TR>
		<TD nowrap>QoS Policy for</TD>
		<TD nowrap><INPUT type="text" name="name" id="name" maxLength="60" size="20" onKeyPress="return getkey('ssid', event)" value=""></TD>
	</TR>
	<TR>
		<TD nowrap>Priority Category</TD>
		<TD nowrap> 
			<SELECT name="category" id="category" onChange="change_priority()" disabled>
				<OPTION value="0">Applications</OPTION>
				<OPTION value="1" selected>Online Gaming</OPTION>
				<OPTION value="2" >Ethernet LAN Port</OPTION>
				<OPTION value="3" >MAC Address</OPTION>
			</SELECT>
		</TD>
	</TR>	
	<TR>
		<TD nowrap>Online Gaming</TD>
		<TD nowrap> 
			<SELECT name="apps" id="apps" onChange="change_serv_online()">
				<OPTION value="Counter-Strike">Counter Strike</OPTION>
				<OPTION value="Age-of-Empires" >Age of Empires</OPTION>
				<OPTION value="Everquest" >Everquest</OPTION>
				<OPTION value="Quake-2" >Quake 2</OPTION>
				<OPTION value="Quake-3" >Quake 3</OPTION>
				<OPTION value="Unreal-Tourment" >Unreal Tournament</OPTION>
				<OPTION value="Warcraft" >Warcraft</OPTION>
				<OPTION value="Add" >Add a new game</OPTION>			
			</SELECT>
		</TD>
	</TR>
	<TR>
		<TD nowrap>Priority</TD>
		<TD nowrap>
			<SELECT name="priority" id="priority">
				<OPTION value="0" >Highest</OPTION>
				<OPTION value="1" selected>High</OPTION>			
				<OPTION value="2" >Normal</OPTION>
				<OPTION value="3" >Low</OPTION>
			</SELECT>
		</TD>
	</TR>
	</table>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
	<div id="real_app_port"></div>
	<div id="hidden_app_port" style="VISIBILITY:hidden;POSITION:absolute;">
	<TABLE cellspacing=5 cellPadding=0 width=100% border=0>
	<TR>
		<TD nowrap colspan=2><b>Specified Port Range</b></TD>
	</TR>
	<TR>
		<TD nowrap>Connection Type</TD>
		<TD nowrap> 
			<select name="protocol" id="protocol" size="1">
				<option value="TCP/UDP">TCP/UDP</option>
				<option value="TCP">TCP</option>
				<option value="UDP">UDP</option>
			</SELECT>
		</TD>
	</TR>	
	<TR>
		<TD nowrap>Starting Port</TD>
		<TD nowrap>
			<input type="text" name="port_start" id="port_start" size="6" maxlength="5" onKeyPress="return getkey('num', event)">(1~65535)
		</TD>
	</TR>
	<TR>
		<TD nowrap>Ending Port</TD>
		<TD nowrap> 
			<input type="text" name="port_end" id="port_end" size="6" maxlength="5" onKeyPress="return getkey('num', event)">(1~65535)
		</TD>
	</TR> 
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>	
	</TABLE>
</div>
</div>
<%tcWebApi_multilingual("2","_qos_help.asp")%>
</FORM>
</BODY>
</HTML>
