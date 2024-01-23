!function(s){s.su.moduleManager.define("administration",{models:["changePwdModel","pwdRecoveryModel","localMngtModel","localMngtHttpModel","newDeviceModel","remoteMngtModel","autoLogoutModel","lanAdvLanModel","ipv4Status"],stores:["localMngtDeviceStore","remoteMngtDeviceStore","allowDeviceStore","portForwardingConnectedDevicesStore"],services:["ajax","device"],deps:["utils"],views:["administrationView"],listeners:{"ev_on_launch":function(e,d,t,n,o,a,i){d.oldPwdKey=null,d.newPwdKey=null,d.cfmPwdKey=null,d.virtualPortList=[],"ap"===i.device.getCurrentMode()&&(t.administrationView.recoveryPanel.hide(),t.administrationView.remoteMngtCtn.hide()),t.administrationView.changePasswordPanel.show(),t.administrationView.recoveryPanel.show(),n.changePwdModel.load({success:function(){var e=n.changePwdModel.getData();d.oldPwdKey=e.oldPwd,d.newPwdKey=e.newPwd,d.cfmPwdKey=e.cfmPwd}}),n.ipv4Status.load({ajax:{async:!1},success:function(){var e={"dslite":s.su.CHAR.NETWORK_INTERNET.DSLITE_CONFLICT_TIPS,"v6plus":s.su.CHAR.NETWORK_INTERNET.V6PLUS_CONFLICT_TIPS}[n.ipv4Status.conntype.getValue()],t=n.remoteMngtModel.enable;e?(t.disable(),t.setTips(e),d.FEATURE_ENABLE=!1):t.enable()}}),n.localMngtModel.load(),n.localMngtHttpModel.load(),n.pwdRecoveryModel.load({success:function(e){d.recovertPwdKey=e.password}}),n.remoteMngtModel.load(),o.allowDeviceStore.load(),n.lanAdvLanModel.load({success:function(e){e=n.lanAdvLanModel.getData();switch(d.lanIP=e.ipaddr,e.maskType){case 0:d.lanMask="255.255.255.0";break;case 1:d.lanMask="255.255.0.0";break;case 2:d.lanMask="255.0.0.0";break;case 3:d.lanMask=e.customValue}}}),d.getVirtualPort({success:function(e){for(var t=0,n=e.length;t<n;t++){var o=e[t].enable,a=e[t].protocol.toUpperCase(),i=e[t].externalPort;"on"==o&&"UDP"!==a&&d.virtualPortList.push(i)}}})}},init:function(o,a,d,r,e,t){this.configViews({id:"administrationView",items:[{id:"allowed-devices-grid",configs:{minLines:0,tbar:{add:{text:s.su.CHAR.ADMINISTRATION.ADD_DEVICE,index:0}},popEditor:{addTitle:s.su.CHAR.ADMINISTRATION.ADD_DEVICE,content:"#allow-deivce-popEditor",fields:[{name:"description"},{name:"mac"}]},columns:[{xtype:"checkcolumn",width:20},{text:s.su.CHAR.ADMINISTRATION.DESCRIPTION,dataIndex:"description"},{text:s.su.CHAR.ADMINISTRATION.MAC,dataIndex:"mac"},{xtype:"actioncolumn",text:s.su.CHAR.ADMINISTRATION.OPERATION,renderer:function(e,t){var n="";return t.host||(n+='<a href="javascript:void(0)" class="grid-content-btn grid-content-btn-delete btn-delete">',n+='<span class="icon"></span>',n+='<span class="text"></span>',n+="</a>"),n}}]}},{id:"connect-device-list",configs:[{type:"logo",dataIndex:"deviceType"},{type:"deviceName",dataIndex:"name"},{type:"mac",dataIndex:"macAddress"},{type:"ip",dataIndex:"ipAddress"}]}]}),this.listen({"models.pwdRecoveryModel.enableRec":{"ev_value_change":function(e,t,n){"on"===t?a.administrationView.recoveryFieldset.show():a.administrationView.recoveryFieldset.hide()}},"models.pwdRecoveryModel.enableAuth":{"ev_value_change":function(e,t,n){"on"===t?a.administrationView.recoveryAuthFieldset.show():a.administrationView.recoveryAuthFieldset.hide()}},"models.localMngtModel.mode":{"ev_value_change":function(e,t,n){"all"===t?r.allowDeviceStore.hide():r.allowDeviceStore.show()}},"models.remoteMngtModel.enable":{"ev_value_change":function(e,t,n){o.FEATURE_ENABLE&&"on"===t?(a.administrationView.remoteMngtFieldset.show(),d.remoteMngtModel.webAddress.enable(),"all"===d.remoteMngtModel.managers.getValue()?(d.remoteMngtModel.ipaddr.hide(),d.remoteMngtModel.ipaddr.disable()):(d.remoteMngtModel.ipaddr.show(),d.remoteMngtModel.ipaddr.enable())):(a.administrationView.remoteMngtFieldset.hide(),d.remoteMngtModel.webAddress.disable())}},"models.remoteMngtModel.managers":{"ev_value_change":function(e,t){"all"===t?(d.remoteMngtModel.ipaddr.hide(),d.remoteMngtModel.ipaddr.disable()):(d.remoteMngtModel.ipaddr.show(),d.remoteMngtModel.ipaddr.enable())}},"models.changePwdModel":{"ev_will_auto_save":function(e,t){d.changePwdModel.oldPwd.setValue(d.changePwdModel.oldPwdInput.doEncrypt(o.oldPwdKey)),d.changePwdModel.newPwd.setValue(d.changePwdModel.newPwdInput.doEncrypt(o.newPwdKey)),d.changePwdModel.cfmPwd.setValue(d.changePwdModel.cfmPwdInput.doEncrypt(o.cfmPwdKey))},"ev_auto_saved":function(){s.encrypt.encryptManager.cleanStorage(),location.href="/"},"ev_model_submit_complete":function(e,t,n){"update account failed"===n&&d.changePwdModel.oldPwdInput.setError(s.su.CHAR.ERROR.E5002)}},"models.pwdRecoveryModel":{"ev_will_auto_save":function(e,t){d.pwdRecoveryModel.password.setValue(d.pwdRecoveryModel.passwordInput.doEncrypt(o.recovertPwdKey))}}}),this.control({".index-common-save-btn":{"ev_will_auto_save":function(e,t){o.validatePassword()||t.preventDefault(),o.validateRemoteManagement()||t.preventDefault()}},"#allowed-devices-grid":{"ev_grid_tbar_add":function(e,t){d.newDeviceModel.description.setValue(""),d.newDeviceModel.mac.setNormal()},"ev_grid_before_save":function(e,t){for(var n=d.newDeviceModel.mac.getValue(),o=r.allowDeviceStore.getData(),a=0,i=o.length;a<i;a++)if(o[a].mac===n)return d.newDeviceModel.mac.setError(s.su.CHAR.ERROR["00000007"]),t.preventDefault(),!1}},"#connect-device-list":{"ev_item_click":function(e,t){d.newDeviceModel.description.setValue(t.name),d.newDeviceModel.mac.setValue(t.macAddress),a.administrationView.connectDeviceMsg.hide()}},"#connect-device-btn":{"ev_button_click":function(){r.portForwardingConnectedDevicesStore.load(),a.administrationView.connectDeviceMsg.show()}},"#remote-conflict-confirm":{"ev_msg_ok":function(){var e,t=[d.changePwdModel,d.pwdRecoveryModel,d.localMngtModel,d.localMngtHttpModel,d.remoteMngtModel],n=t.length;for(e=0;e<n;e++)if(t[e].isDirty()&&!t[e].validate())return;for(e=0;e<n;e++)t[e].isDirty()&&t[e].submit()}}})}},function(i,d,r,e,l,o){return{FEATURE_ENABLE:!0,getCloudLogin:function(e){var t,n;e&&(t=e.success,n=e.fail),o.ajax.request({proxy:"checkFirstLoginProxy",success:function(e){t&&t(e)},fail:function(e){n&&n(e)}})},getVirtualPort:function(e){var t;e&&(t=e.success),o.ajax.request({proxy:"virtualPortProxy",success:function(e){t&&t(e)}})},conflictPort:function(e,t){e=parseInt(e,10);for(var n=0,o=t.length;n<o;n++)if(0<=t[n].indexOf("-")){var a=t[n].split("-");if(e>=parseInt(a[0],10)&&e<=parseInt(a[1],10))return!0}else if(e==parseInt(t[n],10))return!0;return!1},validatePassword:function(){var e=r.changePwdModel;if(!e.isDirty())return!0;e.oldPwdInput.getValue();var t=e.newPwdInput.getValue(),n=e.cfmPwdInput.getValue();return!!e.validate()&&(t===n||(e.cfmPwdInput.setError(s.su.CHAR.ERROR["00000080"]),!1))},validateRemoteManagement:function(){var e=r.remoteMngtModel;if(!e.isDirty())return!0;if("off"===r.remoteMngtModel.enable.getValue())return!0;var t=e.httpPort.getValue(),n=e.httpsPort.getValue(),o=e.managers.getValue(),a=e.ipaddr.getValue();return!!e.validate()&&("partial"===o&&l.utils.isSameNet(a,i.lanIP,i.lanMask)?(e.ipaddr.setError(s.su.CHAR.ERROR["00000056"]),!1):parseInt(n,10)===parseInt(t,10)?(e.httpPort.setError(s.su.CHAR.ADMINISTRATION.HTTP_PORT_CONFLICT_2),!1):i.conflictPort(t,i.virtualPortList)?(d.administrationView.remoteConflictConfirm.setContent(s.su.CHAR.ADMINISTRATION.HTTP_PORT_CONFLICT_1),d.administrationView.remoteConflictConfirm.show(),!1):!i.conflictPort(n,i.virtualPortList)||(d.administrationView.remoteConflictConfirm.setContent(s.su.CHAR.ADMINISTRATION.HTTPS_PORT_CONFLICT_1),d.administrationView.remoteConflictConfirm.show(),!1))}}})}(jQuery);