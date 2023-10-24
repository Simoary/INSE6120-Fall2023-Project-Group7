<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>

<head>
<title>NETGEAR Router WNDR3800 </title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" type="text/css" href="/style/hijack_style.css" />
<link rel="stylesheet" type="text/css" href="/style/hijack_03A_D_bigpond.css" />
<script language="javascript" type="text/javascript" src="script/brs_hijack.js"></script>
<script language="javascript" type="text/javascript" src="script/brs_hijack_03A_D_bigpond.js"></script>
<script language="javascript" type="text/javascript" src="script/funcs.js"></script>
<script language="javascript" type="text/javascript" src="language/English.js"></script>
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
</head>

<body>
<form method="post" action="/cgi-bin/BRS_04_applySettings.asp?id=<%tcWebApi_get("Timezone_Entry","GUITimestamp","s")%>">
<input type="hidden" name="submit_flag" value="hijack_bpa" />


<div class="wizard_content_div">

	<div class="wizard_words_div">
		
			<h1><!--bpa_connection--></h1>
			<p><script>document.write(bh_enter_ip_setting)</script></p>
			
			<div id="mainContent_div">
				
				<div id="loginName" class="input_left_div" align="right">
					<!--pppoe_login_name-->
				</div>
				<div class="input_img_div">
					<img src="/image/ca_text_pic.gif" />
					<input type="text" align="right" id="inputName" maxlength="60" name="bpa_username" class="input_text" />
				</div>
				
				<div id="passwd" class="input_left_div" align="right">
					<!--ddns_passwd-->
				</div>
				<div class="input_img_div">
					<img src="/image/ca_text_pic.gif" />
					<input type="password" align="right" id="inputPasswd" maxlength="16" name="bpa_passwd" class="input_text" />
				</div>
				
				<div id="idleTimeout" class="input_left_div" align="right">
					<!--basic_pppoe_idle-->
				</div>
				<div class="input_img_div">
					<img src="/image/ca_text_pic.gif" />
					<input type="text" align="right" id="inputIdle" maxlength="5" name="idle_timeout" class="input_text" />
				</div>
				
				<div id="serverIP" class="input_left_div" align="right">
					<!--basic_pptp_servip-->
				</div>
				<div class="input_img_div">
					<img src="/image/ca_text_pic.gif" />
					<input type="text" align="right" id="inputServerIP" name="bpa_server" maxLength="128" class="input_text" />
				</div>
				
				<div style="clear:both"></div>
			</div>
		
	</div>
	
	<div id="allBtns_div" class="wizard_buttons_div" align="right">
		<div id="btnsContainer_div" class="buttons_img_div" >
			<img src="/image/ca-little-purple-button.gif" />
			<div id="btn_text_div" class="buttons_words_div" align="center">
				<!--next_mark-->
			</div>
		</div>	
	</div>
	

</div>

</form>
</body>

</html>
