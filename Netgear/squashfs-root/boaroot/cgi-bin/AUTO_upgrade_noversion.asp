
<html><head><link rel="stylesheet" href="/style/form.css">
<script language=javascript type=text/javascript src="/funcs.js"></script>
<title></title><meta http-equiv=content-type content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<script language="javascript" type="text/javascript">
function loadvalue()
{
	if(top.hidden_upgrade)
	{
		document.getElementById("few_seconds").style.display = "none";
		document.getElementById("cancel_btn").style.display = "";
	}
	else
	{
		document.getElementById("few_seconds").style.display = "";
		document.getElementById("cancel_btn").style.display = "none";
		setTimeout("goback()", 4000);
	}
}

function goback()
{
	if(top.hidden_upgrade)  //if top.hidden_upgrade exits, top is CheckNewFirmware.asp
		this.location.href = "CheckNewFW_upgrade.asp";
	else
		this.location.href = "tools_update.asp";
}
</script>

<body bgcolor="#ffffff" onload="loadvalue();">
<div class="page_title"><%tcWebApi_multilingual("1","firmware_version_check_str")%></div>

<div id="main" class="main">
	<img src="/liteblue.gif" width="100%" height="12" />
	<div align="center">
		<br /><b><%tcWebApi_multilingual("1","no_new_firmware_str")%></b>
	</div>
	<img src="/liteblue.gif" width="100%" height="12" />
	<div id="few_seconds" align="center">
		<%tcWebApi_multilingual("1","auto_return_st")%>
	</div>
	<div id="cancel_btn" align="center">
		<input type="button" class="cancel_bt" name="cancel" value="Quit" onclick="close_top_window();" />
	</div>
</div>
</body>
</html>
