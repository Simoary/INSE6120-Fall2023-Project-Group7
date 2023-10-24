/*
As long as users set the read access of a shared folder to 'Admin', 
the write access of the shared folder is changed to 'Admin' automatically.
Similarly, when users set the write access to 'All - no password', 
the read access of the shared folder is changed to 'All - no password' automatically.
*/
function set_read(form, read)
{
	if(read == "1")
		form.writeAccess.value = "1";
}

function set_write(form, write)
{
	if(write == "0")
		form.readAccess.value = "0";
}

function clickadvanced()
{
	var form=document.forms[0];
	if(form.deviceName.value == show_deviceName)
		form.device_name_change_flag.value = 0;
	else
		form.device_name_change_flag.value = 1;
	var space_flag=0;
	var dev_name=form.deviceName.value;

	if( form.enable_samba.checked == true)
		form.enable_samba_value.value = 'Yes';
	else
		form.enable_samba_value.value = 'No';
		
	if( form.enable_http.checked == true)
		form.enable_http_value.value = '0';
	else
		form.enable_http_value.value = '1';
	if( form.enable_wan_http.checked == true )
		form.enable_wan_http_value.value = '0';
	else
		form.enable_wan_http_value.value = '1';

	if(dev_name == ""){
		alert(alert_network_device_not_be_blank_str);
		return false;
	}
	for(i=0;i<dev_name.length;i++){
		if(dev_name.charCodeAt(i)!=32)
			space_flag++;
		if(isValidDevName(dev_name.charCodeAt(i))==false)
		{
			alert(alert_invalid_device_name_str);
			return false;   
		}
/*		if(isValidChar_space(dev_name.charCodeAt(i))==false)
		{
			alert(Invalid device name.);
			return false;	
		}	
*/
	}
	if( dev_name.checkShareName()){
		alert(alert_invalid_character_str+alert_network_device_name_str);
		return false;
	}
	if(space_flag == 0){
		alert(alert_network_device_not_be_blank_str);
		return false;
	}

	if(form.workGroup.value == ""){
		alert(alert_workgroup_not_be_null_str);
		return false;
	}
/*	for(i=0;i<form.workGroup.value.length;i++){
		if(isValidChar_space(form.workGroup.value.charCodeAt(i))==false)
		{
			alert("Workgroup"+"can not input with 2 bytes characters !");
			return false;
		}
	}
*/

	if(form.ftp_via_port.value == "")
	{
		alert("FTP port cannot be blank!");
		return false;
	}

	for(var i = 0; i < forwarding_data.length; i++)
	{
		if(forwarding_data[i][1] == "FTP")
		{
			if(!check_port_range(20, 21, form.ftp_via_port.value))
			{
				alert(alert_the_specified_ports_str);
				return false;
			}
		}
	}


	for(i = 0; i < triggering_data.length; i++)
	{
		if(triggering_data[i][3] == "21")
		{
			if(!check_port_range(20, 21, form.ftp_via_port.value))
			{
				alert(alert_the_specified_ports_str);
				return false;
			}
		}
	}
	if( form.workGroup.value.checkShareName()){
		alert(alert_invalid_character_str+alert_workgroup_str);
		return false;
	}
 
	var portvalue = parseInt(form.HTTP_via_port.value,10);
	if( isNaN(portvalue) || portvalue < 80 || (portvalue > 80 && portvalue < 1024) || portvalue > 65534)
	{
		alert(alert_http_via_port_str);
		return false;
	}
	form.HTTP_via_port.value=portvalue;
   if(is_ftp == 1)
   {	
        if( form.enable_ftp.checked == true )
                form.enable_ftp_value.value = 'Yes';
        else
                form.enable_ftp_value.value = 'No';

        if( form.enable_wan_ftp.checked == true )
                form.enable_wan_ftp_value.value = 'Yes';
        else
                form.enable_wan_ftp_value.value = 'No';

	portvalue = parseInt(form.ftp_via_port.value,10);
	if( isNaN(portvalue) || portvalue < 21 || (portvalue > 21 && (portvalue < 1024)) || portvalue > 65534)
	{
		alert(alert_ftp_via_port_str);
		return false;
	}
	form.ftp_via_port.value=portvalue;
   }
	
	if(check_all_port() == false)
	{
		alert(alert_the_specified_ports_str);
		return false;
	}
        form.HTTP_via_port.value=port_range_interception(form.HTTP_via_port.value);
        form.ftp_via_port.value=port_range_interception(form.ftp_via_port.value);
	if(shared_folder_num != 0 && nopassword_num == 0)
		alert(alert_notice_to_share_your_files_str);
	return true;
}
function refreshpage()
{
	location.reload();
}
function close_window()
{
	window.close();
}
function closeBrowserwindow()
{
	window.open('', '_self', '');
	window.parent.close();
}
function check_input()
{
	form=document.forms[0];
			
}
function pageRefresh()
{
        document.forms[0].submit();
        close_window();
        opener.parent.formframe.location.reload();
}

//check if the access port in in the range of port forwarding.
function usb_check_port_range(name, length, port_using)
{
	var i, str, each_info, sertype, startport, endport, serflag;
	for(i=1; i<=length; i++)
	{
		switch(name)
		{
			case "forwardingArray":
				str = eval(name + i);
				each_info=str.split(' ');
				sertype=each_info[1];
				startport=each_info[2];
				endport=each_info[3];
				break;
			case "triggeringArray":
				str = eval(name + i);
				each_info=str.split(' ');
				sertype=each_info[5];
				startport=each_info[6];
				endport=each_info[7];
				break;
			case "upnpArray":
				str = eval(name + i);
				each_info=str.split(';');
				sertype=each_info[1];
				startport=each_info[3];
				endport=each_info[3];
				break;
			default:
				break;
		}
		
		if(sertype != "UDP")
		{
			if(parseInt(startport)<=parseInt(port_using) && parseInt(endport)>=parseInt(port_using))
				return false;
		}
	}

	return true;
}
function check_single_port(port)
{
	//check with remote
        if(endis_remote=="1" && (parseInt(port)==parseInt(remote_port)))
		return false;
}
//if the Access Method is enabled, check if the port is being taken up by forwarding list, triggering list, upnp list and remote, which use protocal of TCP. 
function check_all_port()
{
	var ret=true;	

	if(form.enable_http.checked == true)
	{
		if(usb_check_port_range("forwardingArray", forward_array_num, 80) == false)
			ret = false;

		if(usb_check_port_range("triggeringArray", trigger_array_num, 80) == false)
			ret = false;

		if(usb_check_port_range("upnpArray", upnp_array_num, 80) == false)
			ret = false;
		
		if(check_single_port(80) == false)
			ret = false;
	}
	if(form.enable_wan_http.checked == true)
	{
		if(usb_check_port_range("forwardingArray", forward_array_num, form.HTTP_via_port.value) == false)
			ret = false;
	
		if(usb_check_port_range("triggeringArray", trigger_array_num, form.HTTP_via_port.value) == false)
			ret = false;

		if(usb_check_port_range("upnpArray", upnp_array_num, form.HTTP_via_port.value) == false)
			ret = false;

		if(check_single_port(form.HTTP_via_port.value) == false)
			ret = false;
	}

	if(is_ftp == 1)
	{
		if(form.enable_ftp.checked == true)
		{
			if(usb_check_port_range("forwardingArray", forward_array_num, 21) == false)
				ret = false;
			
			if(usb_check_port_range("triggeringArray", trigger_array_num, 21) == false)
				ret = false;

			if(usb_check_port_range("upnpArray", upnp_array_num, 21) == false)
				ret = false;

			if(check_single_port(21) == false)
				ret = false;
		}
		if(form.enable_wan_ftp.checked == true)
		{
			if(usb_check_port_range("forwardingArray", forward_array_num, form.ftp_via_port.value) == false)
				ret = false;

			if(usb_check_port_range("triggeringArray", trigger_array_num, form.ftp_via_port.value) == false)
				ret = false;

			if(usb_check_port_range("upnpArray", upnp_array_num, form.ftp_via_port.value) == false)
				ret = false;

			if(check_single_port(form.ftp_via_port.value) == false)
				ret = false;
		}
	}

	return ret;
}

function formatFloat(num, pos)
{
  var size = Math.pow(10, pos);
  return Math.round(num * size) / size;
}
