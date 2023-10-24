﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta HTTP-EQUIV="Pragma" CONTENT="no-cache">
<meta HTTP-EQUIV="Expires" CONTENT="-1">
<link rel="shortcut icon" href="images/favicon.png">
<link rel="icon" href="images/favicon.png">
<title><#2775#> - Netstat</title>
<link rel="stylesheet" type="text/css" href="index_style.css">
<link rel="stylesheet" type="text/css" href="form_style.css">
<link rel="stylesheet" type="text/css" href="device-map/device-map.css">
<script language="JavaScript" type="text/javascript" src="/state.js"></script>
<script language="JavaScript" type="text/javascript" src="/general.js"></script>
<script language="JavaScript" type="text/javascript" src="/popup.js"></script>
<script language="JavaScript" type="text/javascript" src="/help.js"></script>
<script language="JavaScript" type="text/javascript" src="/validator.js"></script>
<script language="JavaScript" type="text/javascript" src="/js/jquery.js"></script>
<script language="JavaScript" type="text/javascript" src="/client_function.js"></script>
<script>
option_netstat = new Array("<#3125#>","<#3129#>","<#3130#>","<#3128#>","<#3131#>","<#3126#>","<#1761#>");
optval_netstat = new Array("-a","-t","-u","-w","-x","-l","-r");
option_netstat_nat = new Array("<#2761#>", "<#2762#>", "<#2763#>");
optval_netstat_nat = new Array("-L","-s","-S");
function onSubmitCtrl(o, s) {
if(validForm()){
document.form.action_mode.value = s;
updateOptions();
}
}
function init(){
show_menu();
showDropdownClientList('setClientIP', 'ip', 'all', 'ClientList_Block_PC', 'pull_arrow', 'online');
if(downsize_4m_support){
for (var i = 0; i < document.form.cmdMethod.options.length; i++) {
if (document.form.cmdMethod.options[i].value == "netstat-nat") {
document.form.cmdMethod.options.remove(i);
break;
}
}
}
}
function updateOptions(){
if(document.form.cmdMethod.value == "netstat-nat" && document.form.NetOption.value == "-s"){
document.form.SystemCmd.value = "netstat-nat " + document.form.NetOption.value + " "
+ document.form.targetip.value + " " + document.form.ExtOption.value +" -n";
}else if(document.form.cmdMethod.value == "netstat-nat"){
document.form.SystemCmd.value = "netstat-nat " + document.form.NetOption.value + " "
+document.form.ExtOption.value +" -n";
}else{
document.form.SystemCmd.value = "netstat " + document.form.NetOption.value;
if (document.form.ResolveName.value != "1")
document.form.SystemCmd.value += " -n";
}
document.form.submit();
document.getElementById("cmdBtn").disabled = true;
document.getElementById("cmdBtn").style.color = "#666";
document.getElementById("loadingIcon").style.display = "";
setTimeout("checkCmdRet();", 500);
}
var _responseLen;
var noChange = 0;
function checkCmdRet(){
$.ajax({
url: '/cmdRet_check.htm',
dataType: 'html',
error: function(xhr){
setTimeout("checkCmdRet();", 1000);
},
success: function(response){
var retArea = document.getElementById("textarea");
var _cmdBtn = document.getElementById("cmdBtn");
if(response.search("XU6J03M6") != -1){
document.getElementById("loadingIcon").style.display = "none";
_cmdBtn.disabled = false;
_cmdBtn.style.color = "#FFF";
retArea.value = response.replace("XU6J03M6", " ");
retArea.scrollTop = retArea.scrollHeight;
return false;
}
if(_responseLen == response.length)
noChange++;
else
noChange = 0;
if(noChange > 10){
document.getElementById("loadingIcon").style.display = "none";
_cmdBtn.disabled = false;
_cmdBtn.style.color = "#FFF";
setTimeout("checkCmdRet();", 1000);
}
else{
_cmdBtn.disabled = true;
_cmdBtn.style.color = "#666";
document.getElementById("loadingIcon").style.display = "";
setTimeout("checkCmdRet();", 1000);
}
retArea.value = response;
retArea.scrollTop = retArea.scrollHeight;
_responseLen = response.length;
}
});
}
function hideCNT(obj){
if(obj.value == "netstat-nat"){
document.getElementById("cmdDesc").innerHTML = "Display NAT connections.";
addNetOption(document.form.NetOption, option_netstat_nat, optval_netstat_nat);
append_value(document.form.NetOption);
document.getElementById('ExtOption_tr').style.display = "";
document.getElementById('resolvename').style.display = "none";
}
else{
document.getElementById("cmdDesc").innerHTML = "<#2783#>";
addNetOption(document.form.NetOption, option_netstat, optval_netstat);
document.getElementById('ExtOption_tr').style.display = "none";
document.getElementById('resolvename').style.display = "";
}
}
function addNetOption(obj, opt, val){
free_options(obj);
for(i=0; i<opt.length; i++){
if(opt[i].length > 0){
obj.options[i] = new Option(opt[i], val[i]);
}
}
}
function append_value(obj){
if(document.form.cmdMethod.value == "netstat-nat"
&& obj.value == "-s"){
document.getElementById('targetip_tr').style.display = "";
document.getElementById('targetip').style.display = "";
}else{
document.getElementById('targetip_tr').style.display = "none";
}
}
function hideClients_Block(evt){
if(typeof(evt) != "undefined"){
if(!evt.srcElement)
evt.srcElement = evt.target; // for Firefox
if(evt.srcElement.id == "pull_arrow" || evt.srcElement.id == "ClientList_Block"){
return;
}
}
document.getElementById("pull_arrow").src = "/images/arrow-down.gif";
document.getElementById('ClientList_Block_PC').style.display='none';
}
function pullLANIPList(obj){
var element = document.getElementById('ClientList_Block_PC');
var isMenuopen = element.offsetWidth > 0 || element.offsetHeight > 0;
if(isMenuopen == 0){
obj.src = "/images/arrow-top.gif"
element.style.display = 'block';
}
else
hideClients_Block();
}
function setClientIP(ipaddr){
document.form.targetip.value = ipaddr;
hideClients_Block();
}
function validForm(){
if(document.form.NetOption.value == "-s" && document.form.targetip.value == ""){
alert("<#316#>");
document.form.targetip.focus();
document.form.targetip.select();
return false;
}else{
return true;
}
}
</script>
</head>
<body onload="init();" class="bg">
<div id="TopBanner"></div>
<div id="Loading" class="popup_bg"></div>
<iframe name="hidden_frame" id="hidden_frame" src="" width="0" height="0" frameborder="0"></iframe>
<form method="POST" name="form" action="/apply.cgi" target="hidden_frame">
<input type="hidden" name="current_page" value="Main_Netstat_Content.asp">
<input type="hidden" name="next_page" value="Main_Netstat_Content.asp">
<input type="hidden" name="group_id" value="">
<input type="hidden" name="modified" value="0">
<input type="hidden" name="action_mode" value="">
<input type="hidden" name="action_script" value="">
<input type="hidden" name="action_wait" value="">
<input type="hidden" name="first_time" value="">
<input type="hidden" name="preferred_lang" id="preferred_lang" value="<% nvram_get("preferred_lang"); %>">
<input type="hidden" name="SystemCmd" onkeydown="onSubmitCtrl(this, ' Refresh ')" value="">
<input type="hidden" name="firmver" value="<% nvram_get("firmver"); %>">
<table class="content" align="center" cellpadding="0" cellspacing="0">
<tr>
<td width="17">&nbsp;</td>
<td valign="top" width="202">
<div id="mainMenu"></div>
<div id="subMenu"></div>
</td>
<td valign="top">
<div id="tabMenu" class="submenuBlock"></div>
<table width="98%" border="0" align="left" cellpadding="0" cellspacing="0">
<tr>
<td align="left" valign="top">
<table width="760px" border="0" cellpadding="5" cellspacing="0" bordercolor="#6b8fa3" class="FormTitle" id="FormTitle">
<tr>
<td bgcolor="#4D595D" colspan="3" valign="top">
<div>&nbsp;</div>
<div class="formfonttitle"><#2775#> - Netstat</div>
<div style="margin:10px 0 10px 5px;" class="splitLine"></div>
<div class="formfontdesc" id="cmdDesc"><#2783#></div>
<table width="100%" border="1" align="center" cellpadding="4" cellspacing="0" bordercolor="#6b8fa3" class="FormTable">
<tr>
<th width="20%"><#2784#></th>
<td>
<select id="cmdMethod" class="input_option" name="cmdMethod" onchange="hideCNT(this);">
<option value="netstat" selected>Netstat</option>
<option value="netstat-nat">Netstat-nat</option>
</select>
</td>
</tr>
<tr>
<th width="20%"><#2787#></th>
<td>
<select id="NetOption" class="input_option" name="NetOption" onChange="append_value(this);">
<option value="-a"><#3125#></option>
<option value="-ta"><#3129#></option>
<option value="-ua"><#3130#></option>
<option value="-w"><#3128#></option>
<option value="-xa"><#3131#></option>
<option value="-l"><#3126#></option>
<option value="-r"><#1761#></option>
</select>
</td>
</tr>
<tr id="targetip_tr" style="display:none;">
<th width="20%"><#2790#> IP</th>
<td>
<input type="text" id="targetip" class="input_15_table" maxlength="15" name="targetip" onKeyPress="return validator.isIPAddr(this,event)" onClick="hideClients_Block();" autocorrect="off" autocapitalize="off">
<img id="pull_arrow" height="14px;" src="/images/arrow-down.gif" style="position:absolute;*margin-left:-3px;*margin-top:1px;" onclick="pullLANIPList(this);" title="<#3063#>">
<div id="ClientList_Block_PC" class="clientlist_dropdown" style="margin-left:2px;"></div>
</td>
</tr>
<tr id="ExtOption_tr" style="display:none;">
<th width="20%"><#2782#></th>
<td>
<select id="ExtOption" class="input_option" name="ExtOption">
<option value="-r state" selected><#2768#></option>
<option value="-r src"><#2766#></option>
<option value="-r dst"><#2764#></option>
<option value="-r src-port"><#2767#></option>
<option value="-r dst-port"><#2765#></option>
</select>
</td>
</tr>
<tr id = "resolvename" style="">
<th width="20%"><#2789#></th>
<td>
<select id="ResolveName" class="input_option" name="ResolveName">
<option value="0"><#186#></option>
<option value="1"><#187#></option>
</select>
</td>
</tr>
</table>
<div class="apply_gen">
<input class="button_gen" id="cmdBtn" onClick="onSubmitCtrl(this, ' Refresh ')" type="button" value="Netstat">
<img id="loadingIcon" style="display:none;" src="/images/InternetScan.gif"></span>
</div>
<div style="margin-top:8px" id="logArea">
<textarea cols="63" rows="27" wrap="off" readonly="readonly" id="textarea" style="width:99%;font-family:Courier New, Courier, mono; font-size:11px;background:#475A5F;color:#FFFFFF;"><% nvram_dump("syscmd.log","syscmd.sh"); %></textarea>
</div>
</td>
</tr>
</table>
</td>
</tr>
</table>
</td>
<td width="10" align="center" valign="top"></td>
</tr>
</table>
</form>
<div id="footer"></div>
</body>
<script type="text/javascript">
<!--[if !IE]>-->
(function($){
var textArea = document.getElementById('textarea');
textArea.scrollTop = textArea.scrollHeight;
})(jQuery);
<!--<![endif]-->
</script>
</html>

