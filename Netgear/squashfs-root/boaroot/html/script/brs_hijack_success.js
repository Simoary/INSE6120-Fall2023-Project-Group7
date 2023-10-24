function initPage()
{
	if(an_router_flag == "0")
	{
		if(wl_sectype=="OPEN")
			noPreSecurityInit();
		else
			preSecurityInit();
	}
	else
	{
		if(wl_sectype=="OPEN" && wla_sectype=="OPEN")
			noPreSecurityInit();
		else
			preSecurityInit();
	}
}

function preSecurityInit()
{
	//head text
	var head_tag = document.getElementsByTagName("h1");
	var head_text = document.createTextNode(bh_congratulations_str);
	head_tag[0].appendChild(head_text);
	
	//paragrah
	var paragraph = document.getElementsByTagName("p");
	var paragraph_text = document.createTextNode(bh_connect_success_1_str);
	paragraph[0].appendChild(paragraph_text);
	
	//create tootip for network key (password)
	var tooltip = document.getElementById("key_tooltip_1");
	//addTooltip(tooltip);
	
	//2.4GHz
	var networkName_div = document.getElementById("network_name");
	var networkName_text;
	if(an_router_flag == "0")
	 	networkName_text = document.createTextNode(bh_wirless_name_str);
	else if(an_router_flag == "1")
		networkName_text = document.createTextNode("2.4GHz " + bh_wirless_name_str);

	networkName_div.appendChild(networkName_text);

	//5GHz
	networkName_div = document.getElementById("network_name_5G");
	networkName_text = document.createTextNode("5GHz " + bh_wirless_name_str);
	networkName_div.appendChild(networkName_text);

	var div_5G = document.getElementById("div_5G");
	var passwd_5G = document.getElementById("passwd_5G");
	if(an_router_flag == "0")
	{
		div_5G.style.display = "none";
		passwd_5G.style.display = "none";
	}
	else if(an_router_flag == "1")
	{
		div_5G.style.display = "";
		if(wl_sectype == wla_sectype && wl_passphrase == wla_passphrase)
			passwd_5G.style.display = "none";
		else
			passwd_5G.style.display = "";
	}
	
	//create tooltip for Network Key (Password)
	if(wl_tooltip1 == 1 || wla_tooltip1 == 1)
	{
		tooltip =  document.getElementById("key_tooltip_2");
		//addTooltip(tooltip);
	}
	if(wla_tooltip1 == 1)
	{
		tooltip =  document.getElementById("key_tooltip_2");
		//addTooltip(tooltip);
	}
	
	
		
		
	
	
	
	
	//tooltip = document.getElementById("key_tooltip_2");
	//addTooltip(tooltip);

	//initial the buttons text and onclick action
	initBtnsAction();
}

function noPreSecurityInit()
{
	//head text
	var head_tag = document.getElementsByTagName("h1");
	var head_text = document.createTextNode(bh_congratulations_str);
	head_tag[0].appendChild(head_text);

	//paragrah
	var paragraph = document.getElementsByTagName("p");
	var paragraph_text = document.createTextNode(bh_connect_success_1_str);
	paragraph[0].appendChild(paragraph_text);
	var div_5G = document.getElementById("div_5G");
	var passwd_5G = document.getElementById("passwd_5G");
	if(an_router_flag == "0")
	{
		var security_info_div_24 = document.getElementById("info_div_24");
		security_info_div_24.style.display = "none";
		div_5G.style.display = "none";
		passwd_5G.style.display = "none";
	}
	else
	{
		var security_info_div = document.getElementById("info_div");
		security_info_div.style.display = "none";
		div_5G.style.display = "none";
		passwd_5G.style.display = "none";
	}
	//var security_info_div = document.getElementById("info_div");
	//security_info_div.style.display = "none";

	//initial the buttons text and onclick action
	initBtnsAction();
}

function initBtnsAction()
{
	//buttons left
	/*var btns_div1 = document.getElementById("btnsContainer_div1");
	btns_div1.onclick = function()
	{
		return saveSettings();
	}
	
	var btn = btns_div1.getElementsByTagName("div");
	var btn_text = document.createTextNode(bh_save_settings);
	btn[0].appendChild(btn_text);*/
	
	//buttons middle
	var btns_div2 = document.getElementById("btnsContainer_div2");
	btns_div2.onclick = function()
	{
		return printSucessPage();
	}
	
	btn = btns_div2.getElementsByTagName("div");
	btn_text = document.createTextNode(bh_print_this_str);
	btn[0].appendChild(btn_text);
	
	//buttons middle
	var btns_div2 = document.getElementById("btnsContainer_div3");
	btns_div2.onclick = function()
	{
		return toInternet();
	}
	
	btn = btns_div2.getElementsByTagName("div");
	btn_text = document.createTextNode(bh_take_to_internet_str);
	btn[0].appendChild(btn_text);

	//show firmware version
        showFirmVersion("none");
}

function addTooltip(tooltip_name)
{
	tooltip_name.setAttribute("title", bh_rollover_help_text_str);
	tooltip_name.className = "tooltip";
}

function printSucessPage()
{
	if (window.print)
		window.print();
	else
	{
		alert(bh_not_support_print_str);
		return false;
	}

	return true;
}

function saveSettings()
{
	var forms = document.getElementsByTagName("form");
	var cf = forms[0];
	cf.action="/brs_backup.cgi";
	cf.submit_flag.value = "";
	//cf.submit();

	return true;
}

function toInternet()
{
	var forms = document.getElementsByTagName("form");
	var cf = forms[0];
	cf.action="/apply.cgi?/BRS_success.html timestamp=" + ts;

	if(cf.encoding)
		cf.encoding = "application/x-www-form-urlencoded";
	else if(cf.enctype)
		cf.enctype = "application/x-www-form-urlencoded";
	
	cf.submit_flag.value = "hijack_success";

	//fixed bug22873: if have click "take me to Internet" button, then the second time not need submit again
//	if(have_click_take_me_to_internet != "1" )
//		cf.submit();

	var winoptions = "width=960,height=800,menubar=yes,scrollbars=yes,toolbar=yes,status=yes,location=yes,resizable=yes";
	window.open("BRS_netgear_success.html",null,winoptions);

//	this.parent.location.href = "$success_href"

	return true;
}

/*function getWirelessSecurity()
{
	var winoptions = "width=960,height=800,menubar=yes,scrollbars=yes,toolbar=yes,status=yes,location=yes,resizable=yes";
	window.open("BRS_netgear_getSecurity.html",null,winoptions);

	return true;
}*/

function XXXtoInternet()
{
        var winoptions = "width=960,height=800,menubar=yes,scrollbars=yes,toolbar=yes,status=yes,location=yes,resizable=yes"
        window.open("BRS_netgear_success.html",null,winoptions);
}

function click_here()
{
	var cf = document.getElementsByTagName("form")[0];
	
	var winoptions = "width=960,height=800,menubar=yes,scrollbars=yes,toolbar=yes,location=yes,resizable=yes";
	window.open("/cgi-bin/WLG_wireless.asp",null,winoptions);

}

addLoadEvent(initPage);
