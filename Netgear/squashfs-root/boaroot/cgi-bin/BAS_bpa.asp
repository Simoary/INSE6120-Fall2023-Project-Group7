
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<script language=javascript type=text/javascript src="/bas_bpa.js"></script>
<title>NETGEAR Router WNDR3800 </title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body onLoad="loadvalue();" bgcolor=#ffffff>
<form method="POST" action="/cgi-bin/BAS_update.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>" target=formframe>
<input type=hidden name=submit_flag value="bpa">


<script>
var old_wan_type="dhcp";
var run_test="no";


var wan_factory_mac="c4:3d:c7:98:18:f6";
var wan_remote_mac="00:21:E0:29:91:42";
var bpa_get_this_mac="";
var gui_region="English";
var netgear_region=top.netgear_region;
//add a new checkox 'Enable automatic Internet connection reset at'
var bas_auto_conn_flag="0";
var bas_conn_time_num="0";
if ( bas_conn_time_num == "" ) // to fix bug 23294
	bas_conn_time_num="0";
var auto_conn_flag=parent.parent.auto_conn_flag;
var autoconn_flag=(auto_conn_flag == 1 && ((gui_region == "German" &&  (netgear_region == "" || netgear_region.toUpperCase() == "WW")) || netgear_region.toUpperCase() == "GR")) ? 1 : 0;
//It just shows 10 items at a time when use the scroll bar to select the item in this drop-down list. 
 if(autoconn_flag == 1)
 {
 	var sSpan ; 
 	var sDiv ; 
 	var sUl ; 
 	var sLi ; 
 	var slt; 
 	var optLen ;
 	var tmp;  
 	var zQuery=function(ele,tagName,className){ //core object 
     if ( window == this ) return new zQuery(ele,tagName,className); 
     if(!arr){var arr=new Array;} 
     if(ele){ 
         if(ele.constructor!=zQuery){ 
             var elem=typeof(ele)=="object"?ele:document.getElementById(ele); 
             if(!tagName){ 
                 arr.push(elem); 
             }else{ 
                 var tags=elem.all&&!window.opera?tagName=="*"?elem.all:elem.all.tags(tagName):elem.getElementsByTagName(tagName); 
                 if(!className){ 
                     for(var i=0, l=tags.length; i<l; i++){ 
                         arr.push(tags[i]); 
                     } 
                 }else{ 
                     var reClassName=RegExp("(^|\\s+)"+className+"(|\\s+)"); 
                     for(var i=0, l=tags.length; i<l; i++){ 
                         if(reClassName.test(tags[i].className)){ 
                             arr.push(tags[i]); 
                         } 
                     } 
                 } 
             } 
         }else{ 
             for(var i=0, l=ele.length; i<l; i++){ 
                 arr=arr.concat(Array.prototype.slice.call(zQuery(ele[i],tagName,className))); 
             } 
         } 
     } 
     return this.setArray(arr);  
 } 
 zQuery.prototype.setArray = function( arr ) { 
     this.length = 0; 
     Array.prototype.push.apply( this, arr );  
     return this; 
 } 
 zQuery.fn=zQuery.prototype; 
 //var =zQuery; 
 
 //obtain the absolute position of select 
 function Offset(obj){ 
     var t = obj.offsetTop; 
     var l = obj.offsetLeft; 
     var w = obj.offsetWidth; 
     var h = obj.offsetHeight-2; 
     //var h=obj.style.height; 
     while(obj=obj.offsetParent) 
     { 
         t+=obj.offsetTop; 
         l+=obj.offsetLeft; 
     } 
     return { 
         top : t, 
         left : l, 
         width : w, 
         height : h 
     } 
 }
 
 //simulation select 
 function instSelect(obj){ 
     var offSet=Offset(obj); 
     obj.style.display="none"; 
     sDiv=document.createElement("div"); 
     sDiv.id="div"+obj.name; 
     sDiv.className="divSlt"; 
     sDiv.style.width=offSet.width+"px"; 
     //sDiv.style.height=offSet.height+"px"; 
     sDiv.style.left=offSet.left+"px"; 
     sDiv.style.top=offSet.top+"px";   
     document.body.appendChild(sDiv); 
     sSpan=document.createElement("span"); 
     var spanId=obj.options[obj.selectedIndex].value; 
     var spanText=obj.options[obj.selectedIndex].text; 
     sSpan.id=spanId; 
     sSpan.style.lineHeight=offSet.height+"px"; 
     sTxt=document.createTextNode(spanText); 
     sSpan.appendChild(sTxt); 
     sDiv.appendChild(sSpan);   
     sSpan.onclick=function(){  
         if(zQuery("div"+obj.name,"ul").length==0){ 
             sUl=document.createElement("ul"); 
             sDiv.appendChild(sUl); 
             optLen=obj.options.length; 
             tmp=document.createDocumentFragment(); 
             for(var j=0;j<optLen;j++){ 
                 var sltVal=obj.options[j].value; 
                 var sltTxt=obj.options[j].text; 
                 sLi=document.createElement("li"); 
                 sLi.id=sltVal; 
                 sLi.appendChild(document.createTextNode(sltTxt)); 
                 sLi.onmouseover=function(){ 
                     this.style.background="#cccccc"; 
                     this.style.color="white"; 
                 } 
                 sLi.onmouseout=function(){ 
                     this.style.background="white"; 
                     this.style.color="black"; 
                 } 
                 sLi.onclick=function(){ 
                     sSpan.innerHTML=this.innerHTML; 
                     obj.value=this.id;  
                		  sUl.style.display="none"; 
                 } 
                 tmp.appendChild(sLi); 
             } 
             sUl.appendChild(tmp); 
             if(optLen>3){ 
                 sUl.style.overflowY="scroll"; 
                 sUl.style.height="200px"; 
             } 
         } 
         else{ 
             if(zQuery("div"+obj.name,"ul")[0].style.display=="none") zQuery("div"+obj.name,"ul")[0].style.display="block"; 
             else zQuery("div"+obj.name,"ul")[0].style.display="none"; 
         } 
     }
     sSpan.onclick();   
     sLi.onclick();
 	 sSpan.innerHTML=document.forms[0].auto_conn_time.options[eval(bas_conn_time_num)].innerHTML;
     }
 function getEvent(){ 
      //compatible with ie and ff 
      if(document.all)    return window.event; 
      func=getEvent.caller; 
      while(func!=null){ 
          var arg0=func.arguments[0]; 
          if(arg0){ 
              if((arg0.constructor==Event || arg0.constructor ==MouseEvent) 
                 || (typeof(arg0)=="object" && arg0.preventDefault && arg0.stopPropagation)){     
                 return arg0; 
               } 
          } 
           func=func.caller; 
         } 
         return null; 
 }
 //obtion the number of select, and execut the function
 function initSelect(){ 
     slt=zQuery(document,"select"); 
     var sltLen=slt.length; 
     for(var i=0;i<sltLen;i++){  
      	if(slt[i].name == "auto_conn_time")
         instSelect(slt[i]); 
     } 
 } 
 
 document.onclick=function(){ 
     var evt=getEvent(); 
     var element=evt.srcElement || evt.target; 
     var s=zQuery(document,"select"); 
     if((element.parentNode.parentNode==null||element.parentNode.parentNode.className!="divSlt")&&element.nodeName!="SPAN"){ 
         for (var i=2; i<s.length; i++) { 
             if(!zQuery("div" + s[i].name,"ul")[0]) continue; 
             zQuery("div" + s[i].name,"ul")[0].style.display="none"; 
         } 
     } 
 }
 }
 
var wanproto_type="bigpond";
var wan_mtu_now='1500';
if (bpa_get_this_mac == "")
	bpa_get_this_mac="C4:3D:C7:98:18:F6";

function loadvalue()
{
	var form=document.forms[0];

	if(autoconn_flag == 1)
 		initSelect();
 	if(bas_auto_conn_flag == "1")
 		form.auto_conn_24hr.checked = true;
 	else
 		form.auto_conn_24hr.checked = false;
 	form.auto_conn_time.options[eval(bas_conn_time_num)].selected =true;
 	if(autoconn_flag == 1)
 		document.getElementById("auto_conn_play").style.display="";
 	else
 		document.getElementById("auto_conn_play").style.display="none";

	if( form.bpa_passwd.value == "" )
	{
		if( get_browser() == "Firefox" )
		{
			form.bpa_passwd.type = "text";
		}
		else
		{
			form.bpa_passwd.outerHTML='<input type="text" name="bpa_passwd" size="16" maxlength="50" onFocus="this.select();" onKeyPress="return getkey(\'ssid\', event)" value="">'; 
		}
	}
	else if( get_browser() == "IE" )
	{
		form.bpa_passwd.outerHTML='<input type="password" name="bpa_passwd" size="16" maxlength="50" style="width: 131px" onFocus="change_bpa_password(this);" onKeyPress="return getkey(\'ssid\', event)" value="">';
	}
	
	form.bpa_dod.value="1";
	show_idleout(form,form.bpa_dod.value);

	var bpa_get_dns_assign='0';
	if(bpa_get_dns_assign == '0')
		form.DNSAssign[0].checked = true;
	else
		form.DNSAssign[1].checked = true;
	setDNS(form);	
	var bpa_get_dns1="";
	if(bpa_get_dns1!="")
	{
		var dns1_array=bpa_get_dns1.split('.');
		form.DAddr1.value=dns1_array[0];
		form.DAddr2.value=dns1_array[1];
		form.DAddr3.value=dns1_array[2];
		form.DAddr4.value=dns1_array[3];
	}
	var bpa_get_dns2="";
	if(bpa_get_dns2!="")
	{
		var dns2_array=bpa_get_dns2.split('.');
		form.PDAddr1.value=dns2_array[0];
		form.PDAddr2.value=dns2_array[1];
		form.PDAddr3.value=dns2_array[2];
		form.PDAddr4.value=dns2_array[3];
	}
	var bpa_get_mac_assign='0';
	if(bpa_get_mac_assign == '0')
	{
		form.MACAssign[0].checked = true;
		setMAC(form,wan_factory_mac);
	}
	else if(bpa_get_mac_assign == '1')
	{
		form.MACAssign[1].checked = true;
		setMAC(form,wan_remote_mac);
	}
	else
	{
		form.MACAssign[2].checked = true;
		setMAC(form,bpa_get_this_mac);
	}
	goTestApply();	
}
function show_idleout(form,time)
{
	if( time == 1 )
	{
		if(autoconn_flag == 1)
		{
			sSpan.style.background="url(selects_disabled.gif) no-repeat right center";  
        	sSpan.onclick="";
			form.bpa_idletime.disabled = false;
			form.auto_conn_24hr.disabled = true;
		}
		else
		{
			form.bpa_idletime.disabled = false;
			form.auto_conn_24hr.disabled = true;
			form.auto_conn_time.disabled = true;
		}
	}
	else
	{
		if(autoconn_flag == 1)
		{
			sSpan.style.background="url(selects.gif) no-repeat right center"; 
			sSpan.onclick=function(){  
		    if(zQuery("div"+slt[2].name,"ul").length==0){ 
				for(var j=0;j<optLen;j++){ 
					var sltVal=slt[2].options[j].value; 
					var sltTxt=slt[2].options[j].text;  
					 alert(sltVal);
					//sLi=document.createElement("li"); 
					sLi.id=sltVal; 
					sLi.appendChild(document.createTextNode(sltTxt)); 

					sLi.onmouseover=function(){ 
						this.style.background="#cccccc"; 
						this.style.color="white"; 
					} 
					sLi.onmouseout=function(){ 
						this.style.background="white"; 
						this.style.color="black"; 
					} 
					sLi.onclick=function(){ 
						sSpan.innerHTML=this.innerHTML; 
						slt[2].value=this.id;  
						sUl.style.display="none"; 
					} 
					tmp.appendChild(sLi); 
				} 
			   // sUl.appendChild(tmp); 
				if(optLen>3){ 
					sUl.style.overflowY="scroll"; 
					sUl.style.height="200px"; 
				} 
			} 
			else{ 
				if(zQuery("div"+slt[2].name,"ul")[0].style.display=="none") zQuery("div"+slt[2].name,"ul")[0].style.display="block"; 
				else zQuery("div"+slt[2].name,"ul")[0].style.display="none"; 
			} 
		}
 		form.bpa_idletime.disabled = true;
 		form.auto_conn_24hr.disabled = false;
		}
		else
		{
			form.bpa_idletime.disabled = true;
			form.auto_conn_24hr.disabled = false;
			form.auto_conn_time.disabled = false;
		}
	}		
}
</script>
<input type="hidden" name="change_wan_type">
<input type="hidden" name="run_test" value="">
<input type="hidden" name="bpa_dnsaddr1">
<input type="hidden" name="bpa_dnsaddr2">
<input type="hidden" name="hidden_bpa_idle_time">
<input type="hidden" name="hid_mtu_value">
<input type="hidden" name="hidden_conn_time_num">
<input type="hidden" name="hidden_auto_conn_flag">
<TABLE cellspacing=5 cellPadding=0 width=100% border=0>
<TR>
	<TD nowrap>
	<A tabindex=-1 href="javascript:loadhelp('_BAS_bpa','isp')"><B>Internet Service Provider</B></A>
	</TD>
	<TD nowrap align=right>
	<select name="login_type" onChange="change_serv(document.forms[0])">
		<option value="PPTP">PPTP</option>
<script>
        //if( (gui_region == "Russian" && parent.parent.l2tp_flag == 1 && (netgear_region == "" || netgear_region.toUpperCase() == "WW")) || netgear_region.toUpperCase() == "RU")
	if(parent.parent.l2tp_flag == 1)
                document.write('<option value="L2TP">L2TP</option>');
</script>
		<option value="Telstra Bigpond" selected>Telstra Bigpond</option>
		<option value="Other">PPPoE</option>
<script>
        if( ((parent.jp_multiPPPoE == 1 || gui_region == "Japanese") && (netgear_region == "" || netgear_region.toUpperCase() == "WW")) || netgear_region.toUpperCase() == "JP")
                document.write('<option value=\"multiPPPoE\">Multiple PPPoE</OPTION>');</script>
</script>

	</select>
	</TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR>
	<TD nowrap>
	<A tabindex=-1 href="javascript:loadhelp('_BAS_bpa','login')"><B>Login</B></A>
	</TD>
	<TD nowrap align=right>
	<input type="text" name="bpa_username" maxLength="60" size="16" onKeyPress="return getkey('ssid', event)" value="">
	</TD>
</TR>
<TR>
	<TD nowrap>
	<A tabindex=-1 href="javascript:loadhelp('_BAS_bpa','password')"><B>Password</B></A>
	</TD>
	<TD nowrap align=right>
	<input type="password" name="bpa_passwd" size="16" maxlength="50" onFocus="change_bpa_password(this);" onKeyPress="return getkey('ssid', event)" value="">
	</TD>
</TR>
<TR>
	<TD>
	<A tabindex=-1 href="javascript:loadhelp('_BAS_bpa','serv_name')"><B>Authentication Server</B></A>
	</TD>
	<TD nowrap align=right>
	<input type="text" name="bpa_server" maxLength="128" size="16" onKeyPress="return getkey('ssid', event)" value="login-server">
	</TD>
</TR>  
<TR> 
	<TD><A tabindex=-1 href="javascript:loadhelp('_BAS_bpa','conn_mode')"><B>Connection Mode</B></A></TD> 
	<TD align=right> 
	<select name="bpa_dod" onchange="show_idleout(document.forms[0],this.value)">
		<option value="0">Always On</option>
		<option value="1">Dial on Demand</option>
		<option value="2">Manually Connect</option>
	</select>
	</TD>
</TR>
<TR>
	<TD>
	<A tabindex=-1 href="javascript:loadhelp('_BAS_bpa','idletime')"><b>Idle Timeout</b> (In Minutes)</A>
	</TD>
	<TD nowrap align=right>
	<input type="text" name="bpa_idletime" maxLength="5" size="16" value="5" onKeyPress="return getkey('num', event)">
	</TD>
</TR>
<TR id=auto_conn_play>
	<TD nowrap><input type="checkbox" name="auto_conn_24hr" value="">Enable automatic Internet connection reset at 
	<select class="divselect" name="auto_conn_time">
		<option value="1" selected>00:00</option>
		<option value="2" selected>00:30</option>
		<option value="3" selected>01:00</option>
		<option value="4" selected>01:30</option>
		<option value="5" selected>02:00</option>
		<option value="6" selected>02:30</option>
		<option value="7" selected>03:00</option>
		<option value="8" selected>03:30</option>
		<option value="9" selected>04:00</option>
		<option value="10" selected>04:30</option>
		<option value="11" selected>05:00</option>
		<option value="12" selected>05:30</option>
		<option value="13" selected>06:00</option>
		<option value="14" selected>06:30</option>
		<option value="15" selected>07:00</option>
		<option value="16" selected>07:30</option>
		<option value="17" selected>08:00</option>
		<option value="18" selected>08:30</option>
		<option value="19" selected>09:00</option>
		<option value="20" selected>09:30</option>
		<option value="21" selected>10:00</option>
		<option value="22" selected>10:30</option>
		<option value="23" selected>11:00</option>
		<option value="24" selected>11:30</option>
		<option value="25" selected>12:00</option>
		<option value="26" selected>12:30</option>
		<option value="27" selected>13:00</option>
		<option value="28" selected>13:30</option>
		<option value="29" selected>14:00</option>
		<option value="30" selected>14:30</option>
		<option value="31" selected>15:00</option>
		<option value="32" selected>15:30</option>
		<option value="33" selected>16:00</option>
		<option value="34" selected>16:30</option>
		<option value="35" selected>17:00</option>
		<option value="36" selected>17:30</option>
		<option value="37" selected>18:00</option>
		<option value="38" selected>18:30</option>
		<option value="39" selected>19:00</option>
		<option value="40" selected>19:30</option>
		<option value="41" selected>20:00</option>
		<option value="42" selected>20:30</option>
		<option value="43" selected>21:00</option>
		<option value="44" selected>21:30</option>
		<option value="45" selected>22:00</option>
		<option value="46" selected>22:30</option>
		<option value="47" selected>23:00</option>
		<option value="48" selected>23:30</option>
	</TD>
	<TD></TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR>
	<TD nowrap colspan=2>
	<A tabindex=-1 href="javascript:loadhelp('_BAS_bpa','DNSaddress')"><B>Domain Name Server (DNS) Address</B></A>
	</TD>
</TR>
<TR>
	<TD nowrap colspan=2>
	<input type="radio" name="DNSAssign" value="0" onClick="setDNS(document.forms[0])">Get Automatically from ISP
	</TD>
</TR>
<TR>
	<TD nowrap colspan=2>
	<input type="radio" name="DNSAssign" value="1" onClick="setDNS(document.forms[0])">Use These DNS Servers
	</TD>
</TR>
<TR>
	<TD nowrap><img src=/spacer.gif width=20 height=12 border=0>Primary DNS</TD>
	<TD nowrap align=right>
	<input type="text" name="DAddr1"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);" >.
	<input type="text" name="DAddr2"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" name="DAddr3"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" name="DAddr4"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">
	</TD>
</TR>
<TR>
	<TD nowrap><img src=/spacer.gif width=20 height=12 border=0>Secondary DNS</TD>
	<TD nowrap align=right>
	<input type="text" name="PDAddr1"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);" >.
	<input type="text" name="PDAddr2"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" name="PDAddr3"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">.
	<input type="text" name="PDAddr4"  size="3" autocomplete="off" maxlength="3" onFocus="this.select();" onkeydown="keydown(event,this);" onKeyPress="return getkey('num',event);" onkeyup="keyup(event,this);">
	</TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR>
	<TD nowrap>
	<A tabindex=-1 href="javascript:loadhelp('_BAS_bpa','localaddress')"><B>Router MAC Address</B></A>
	</TD>
</TR>
<TR>
	<TD nowrap colspan=2>
	<input type="radio" name="MACAssign" value="0" onClick="setMAC(document.forms[0],wan_factory_mac)">Use Default Address
	</TD>
</TR>
<TR>
	<TD nowrap colspan=2>
	<input type="radio" name="MACAssign" value="1" onClick="setMAC(document.forms[0],wan_remote_mac)">Use Computer MAC Address
	</TD>
</TR>
<TR>
	<TD nowrap>
	<input type="radio" name="MACAssign" value="2" onClick="setMAC(document.forms[0],bpa_get_this_mac)">Use This MAC Address
	</TD>
	<TD nowrap align=right>
	<input type="text" value="" name="Spoofmac" maxlength="17" size="20" onKeyPress="return getkey('mac',event)">
	</TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
<TR>
	<TD nowrap colspan=2 align=center>
	<input type="submit" name="Apply" value='Apply' onClick="return check_bpa(document.forms[0],0)">&nbsp;&nbsp;
	<input type='button' name='Cancel' value='Cancel' onClick='location.href="BAS_bpa.asp";'>&nbsp;&nbsp;
	<input type="submit" name="Test" value="Test" onClick="return check_bpa(document.forms[0],1)">
	</TD>
</TR>
</TABLE>
</FORM>
</BODY>
</HTML>
