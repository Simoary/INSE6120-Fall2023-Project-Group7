
<html><head><link rel="stylesheet" href="/style/form.css">
<title>NETGEAR Router WNDR3800 </title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<div class="page_title">Updating Settings</div>
<div id="main" class="main">
<script type="text/javascript">
var pchar = "||"; // progress char
var maxchars = 33; 
var delay_time = 1000; // msecs
var charcount = 0; 
var WIZ_type="";

function makeStr(strSize, fillChar)
{
	var temp = "";
	for (i=0; i < strSize ; i ++)
		temp = temp + fillChar;
	return temp;
}

function updateProgress()
{
	var cf = document.forms[0];
	if (charcount < maxchars)
	{
		charcount ++;
		cf.progress.value = makeStr(charcount,pchar);
		setTimeout("updateProgress()",delay_time);
	}
	else
	{ 
		switch(WIZ_type){
			case "pppoe": 
					location.href="WIZ_pppoe.asp"; break;
			case "pptp": 
					location.href="WIZ_pptp.asp"; break;
			case "bpa": 
					location.href="WIZ_bpa.asp"; break;
			case "dhcp": 
					location.href="WIZ_dhcp.asp"; break;
			case "static": 
					location.href="WIZ_static.asp"; break;
			default: 
					location.href="BAS_basic.asp";	
		}
	}
}
</script>
</HEAD>

<BODY bgcolor="#ffffff" onLoad="updateProgress()">
<FORM>
<TABLE border="0" cellpadding="0" cellspacing="3" width="100%">
<TR>
	<!--TD align="left"><H1>Updating Settings</H1></TD-->
	<!--TD></TD-->
 	<TD nowrap align=center><input type="text" name="progress" class="prgbar" value=""></TD>
</TR>
<TR><TD colspan=2><img src="/liteblue.gif" width=100% height=12></TD></TR>
</BODY>
</HTML>
