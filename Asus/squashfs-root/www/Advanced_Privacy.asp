﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html xmlns:v>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta HTTP-EQUIV="Pragma" CONTENT="no-cache">
<meta HTTP-EQUIV="Expires" CONTENT="-1">
<link rel="shortcut icon" href="images/favicon.png">
<link rel="icon" href="images/favicon.png">
<title><#838#> - <#4113#></title>
<link rel="stylesheet" type="text/css" href="index_style.css">
<link rel="stylesheet" type="text/css" href="form_style.css">
<script language="JavaScript" type="text/javascript" src="/state.js"></script>
<script language="JavaScript" type="text/javascript" src="/general.js"></script>
<script language="JavaScript" type="text/javascript" src="/form.js"></script>
<script language="JavaScript" type="text/javascript" src="/help.js"></script>
<script language="JavaScript" type="text/javascript" src="/popup.js"></script>
<script language="JavaScript" type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/httpApi.js"></script>
<style>
.eula_withdraw{
border: 1px solid #A9A9A9;
font-family: Arial, Helvetica, sans-serif;
color: #FFF;
margin: auto 10px 20px 10px;
}
.eula_withdraw_title{
font-weight: bold;
font-size: 14px;
margin: 5px 10px auto 10px;
}
.eula_withdraw_content{
margin-left: 10px;
margin-right: 10px;
}
</style>
<script>
var eula_status = {
"ASUS_EULA": "0",
"TM_EULA": "0"
}
eula_status = httpApi.nvramGet(["ASUS_EULA", "TM_EULA"], true);
var link_internet = httpApi.nvramGet(["link_internet"], true).link_internet;
var services_array = {
"without_alexa_ifttt" : "Account Binding, DDNS",
"without_ifttt" : "Account Binding, DDNS, Google Assistant, Alexa™",
"within_alexa_ifttt" : "For Account Binding, DDNS, Google Assistant, Alexa™, IFTTT™"
}
var services_show = "<#131#>";
function initial(){
var url = "";
show_menu();
url = "https://www.trendmicro.com/en_us/about/legal/privacy-policy-product.html"
$("#tm_eula_url").attr("href",url);
url = "https://esupport.trendmicro.com/en-us/home/pages/technical-support/1120473.aspx";
$("#tm_disclosure_url").attr("href",url);
if(eula_status.ASUS_EULA == "1"){
document.getElementById("asus_eula").style.display = "";
if(!alexa_support && !ifttt_support){
services_show = services_show.replace('%1$@', services_array.without_alexa_ifttt);
document.getElementById("asus_eula_title").innerHTML = services_show;
document.getElementById("alexa_ifttt").style.display = "none";
}
else if(alexa_support && !ifttt_support){
services_show = services_show.replace('%1$@', services_array.without_ifttt);
document.getElementById("asus_eula_title").innerHTML = services_show;
document.getElementById("alexa_ifttt").innerHTML = "<#137#>";
}
else{
services_show = services_show.replace('%1$@', services_array.within_alexa_ifttt);
document.getElementById("asus_eula_title").innerHTML = services_show;
document.getElementById("alexa_ifttt").innerHTML = "<#138#>";
}
}
else
document.getElementById("asus_eula").style.display = "none";
if(eula_status.TM_EULA == "1"){
document.getElementById("tm_eula").style.display = "";
}
else{
document.getElementById("tm_eula").style.display = "none";
}
if(eula_status.ASUS_EULA == "1" || eula_status.TM_EULA == "1")
$("#privacy_desc").css('display', 'none');
else
$("#privacy_desc").css('display', 'block');
setTimeout(update_link_status, 1000);
}
function update_link_status(){
link_internet = httpApi.nvramGet(["link_internet"], true).link_internet;
}
function hide_withdraw_sec(eula_type){
var eula_id = '#' + eula_type + '_eula';
$(eula_id).css("display", "none");
if($("#asus_eula").css("display") == "none" && $("#tm_eula").css("display") == "none")
$("#privacy_desc").css('display', 'block');
}
var max_retry_count = 6;
var retry_count = 0;
function check_unregister_result(){
var asusddns_reg_result = httpApi.nvramGet(["asusddns_reg_result"], true).asusddns_reg_result;
var action_type = asusddns_reg_result.slice(0, asusddns_reg_result.indexOf(','));
var return_status = "";
var timeout = 0;
if(action_type != "unregister" && retry_count < max_retry_count){
setTimeout(check_unregister_result, 500);
retry_count++;
}
else if(action_type == "unregister"){
return_status = asusddns_reg_result.slice(asusddns_reg_result.indexOf(',') + 1);
}
else if(retry_count == max_retry_count){
timeout = 1;
}
if( return_status != "" || timeout ){
$.ajax({
url: "/set_ASUS_EULA.cgi",
data:{
"ASUS_EULA":"0"
},
success: function( response ) {
hide_withdraw_sec('asus');
}
});
}
}
function withdraw_eula(eula_type){
switch(eula_type){
case"asus":
if(confirm("<#150#>")){
if(link_internet != "2"){
alert("<#139#>");
return false;
}
else{
document.getElementById('asus_withdraw_btn').style.display = "none";
document.getElementById('asus_loadingicon').style.display = "";
$.ajax({
url: "/unreg_ASUSDDNS.cgi",
success: function( response ) {
check_unregister_result();
}
});
}
}
break;
case "tm":
if(confirm("<#150#>")){
document.getElementById('tm_withdraw_btn').style.display = "none";
document.getElementById('tm_loadingicon').style.display = "";
$.ajax({
url: "/set_TM_EULA.cgi",
data:{
"TM_EULA":"0"
},
success: function( response ) {
hide_withdraw_sec('tm');
}
});
}
break;
}
}
</script>
</head>
<body onload="initial();" onunLoad="return unload_body();" class="bg">
<div id="TopBanner"></div>
<div id="Loading" class="popup_bg"></div>
<iframe name="hidden_frame" id="hidden_frame" src="" width="0" height="0" frameborder="0"></iframe>
<form method="post" name="form" id="ruleForm" action="/start_apply.htm" target="hidden_frame">
<input type="hidden" name="current_page" value="Advanced_Privacy.asp">
<input type="hidden" name="preferred_lang" id="preferred_lang" value="<% nvram_get("preferred_lang"); %>">
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
<td valign="top" >
<table width="760px" border="0" cellpadding="4" cellspacing="0" class="FormTitle" id="FormTitle">
<tbody>
<tr>
<td bgcolor="#4D595D" valign="top">
<div>&nbsp;</div>
<div id="formfonttitle" class="formfonttitle"><#406#> - <#4114#></div>
<div style="margin:10px 0 10px 5px;" class="splitLine"></div>
<div id="privacy_desc" style="font-size:14px; margin: 20px 10px auto 10px; display:none;"><#115#></div>
<div id="asus_eula" class="eula_withdraw" style="display:none;">
<div class="eula_withdraw_title" id="asus_eula_title"></div>
<div class="eula_withdraw_content">
<div><#132#></div>
<div><#133#></div>
<div style="margin-top:5px;"><#134#>
<ol style="margin-top:0px;">
<li><#135#></li>
<li><#136#></li>
<li id="alexa_ifttt"></li>
</ol>
</div>
</div>
<div style="text-align: center;">
<div style="margin: 0px auto 10px;">
<input class="button_gen" id="asus_withdraw_btn" onclick="withdraw_eula('asus');" type="button" value="<#151#>"/>
<img id="asus_loadingicon" style="display:none;" src="/images/InternetScan.gif">
</div>
</div>
</div>
<div id="tm_eula" class="eula_withdraw" style="display:none;">
<div class="eula_withdraw_title"><#147#></div>
<div class="eula_withdraw_content">
<div><#148#></div>
<div style="margin-top:5px;"><#149#>
<div><#145#></div>
<div><#146#></div>
</div>
</div>
<div style="text-align:center;">
<div style="margin: 0px auto 10px;">
<input class="button_gen" id="tm_withdraw_btn" onclick="withdraw_eula('tm');" type="button" value="<#151#>"/>
<img id="tm_loadingicon" style="display:none;" src="/images/InternetScan.gif">
</div>
</div>
</div>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</table>
</td>
<td width="10" align="center" valign="top">&nbsp;</td>
</tr>
</table>
</form>
<div id="footer"></div>
</body>
</html>

