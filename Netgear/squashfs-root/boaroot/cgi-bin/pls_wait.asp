<html>
<head>
<meta http-equiv="Pragma" Content="no-cache" />
<meta HTTP-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<meta http-equiv="Expires" Content="0" />
<title></title>
<link rel="stylesheet" href="/style/form.css" />
<script language="javascript" type="text/javascript" src="funcs.js"></script>

<script type="text/javascript">
var pchar = "|"; // progress char
var maxchars = 80; 
var delay_time = 1500; // msecs
var charcount = 0; 

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
		top.location.href="index.asp";
	}
}
</script>
</head>
<body bgcolor="#ffffff" onLoad="updateProgress()">
<form>
<table border="0" cellpadding="0" cellspacing="3" width="100%">
<tr>
	<td align="left"><h1>Updating Settings</h1></td>
	<td nowrap><input type="text" name="progress" class="reboot1bar" size="60"  value=""></td>
</tr>
<tr><td colspan="2"><img src="/liteblue.gif" width=100% height="12"></td></tr>
</table>
</form>
</body>
</html>
