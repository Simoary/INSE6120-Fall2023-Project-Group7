!function(c){c.su.moduleManager.define("tpLinkCloud",{deps:["main","index"],services:["moduleLoader","ajax","device","moduleManager"],models:["cloudLogin","cloudLoginControl"],stores:[],views:["tpLinkCloudView","tpLinkCloudViewQs"],listeners:{"ev_on_launch":function(e,o,n,i,t,r,a){this.init()}},init:function(e,o,n,i,t,r){}},function(s,u,e,o,d,l){var n=null;s.getEffectiveView();return{init:function(){var o=this,n=o.getEffectiveView();c("#cloud-login").hide(),u[n].cloudErrorLoader.hide(),c(window).off("ev_watingTimeout"),c(window).on("ev_watingTimeout",function(){d.main.clearWaitingEvent(),d.index.hideLoading(),l.moduleLoader.load({module:"tpLinkCloud"},{module:"cloudError"},u[n].cloudErrorLoader,function(){l.moduleManager.get("cloudError").setMode("qs")}),u[n].cloudErrorLoader.show()}),u[n].tpLinkCloudMainPanel.hide(),u[n].tpLinkCloudNoteField.hide(),l.ajax.request({proxy:"userLoginProxy",method:"read",success:function(e){e&&e.password&&(o.encryptKey=e.password)}}),c.su.userInfo.token?l.ajax.request({proxy:"checkInternetProxy",success:function(e){u[n].tpLinkCloudNoteField.hide(),u[n].tpLinkCloudMainPanel.show(),u[n].tpLinkCloudMainPanel.setInstruction(""),o.goTo("devicePages&page=account")},fail:function(){u[n].tpLinkCloudMainPanel.hide(),u[n].tpLinkCloudNoteField.show()}}):l.ajax.request({proxy:"checkInternetProxy",success:function(e){u[n].tpLinkCloudNoteField.hide(),u[n].tpLinkCloudMainPanel.show(),u[n].tpLinkCloudMainPanel.setInstruction(c.su.CHAR.TP_LINK_CLOUD.INSTRUCTION),"qs"===o.getMode()?o.goTo("login&page=spfQsLogin"):o.goTo("login&page=spfBasicLogin")},fail:function(){u[n].tpLinkCloudMainPanel.hide(),u[n].tpLinkCloudNoteField.show()}}),c(window).off("message"),c(window).on("message",o.onReceive)},setMode:function(e){n=e},getMode:function(){return n},setIframeSrc:function(e){if(e){var o=new Date,n=s.cloudOrigin+"/cloud_ui_v2/pages/device/index.html?module="+e+"&t="+o.getTime();c("#cloud-login").hide(),c("#cloud-login").attr("src",n),d.main.setWaitingEvent("ev_watingTimeout")}},tokenRead:function(o,n){l.ajax.request({proxy:"tokenProxyIndex",ajax:{async:!1},method:"read",success:function(e){s.token=e.token,!s.token&&++n<3?s.tokenRead(o,n):s.token?(s.cloudOrigin=e.origin_url,s.setIframeSrc(o)):(c(window).trigger("ev_watingTimeout"),d.index.hideLoading())}})},getToken:function(e){if(s.token)s.setIframeSrc(e);else{s.tokenRead(e,0)}},postToken:function(){var e={};e.deviceToken=s.token,e.eType="ev_token";var o=JSON.stringify(e);window.frames["cloud-login"]&&window.frames["cloud-login"].postMessage(o,s.cloudOrigin)},postUserInfo:function(){var e={};(e=c.su.userInfo).eType="ev_user_info";var o=JSON.stringify(e);window.frames["cloud-login"]&&window.frames["cloud-login"].postMessage(o,s.cloudOrigin)},postLoginStatus:function(){var e={eType:"ev_login_status"},o=JSON.stringify(e);window.frames["cloud-login"]&&window.frames["cloud-login"].postMessage(o,s.cloudOrigin)},getDeviceInfo:function(){l.ajax.request({proxy:"deviceInfoProxyIndex",method:"read",success:function(e){var o={};(o=e).gamingUI=l.device.getConfig().supportGamingUIGX90,o.updateLoginStatus=!0,o.eType="ev_deviceInfo";var n=JSON.stringify(o);window.frames["cloud-login"].postMessage(n,s.cloudOrigin)}})},goTo:function(e){e&&(d.index.showLoading(),s.getToken(e))},doCloudLogin:function(e){var o={"operation":e,"token":c.su.userInfo.token},n=s.getMode();l.ajax.request({proxy:"userLoginProxy",data:o,success:function(e){c.su.userInfo.role=e.role,localStorage.setItem("userInfo",JSON.stringify(c.su.userInfo)),s.postLoginStatus(),"qs"==n?d.main.reload():(d.index.changeTPLinkID(c.su.userInfo.username),s.goTo("devicePages&page=account"))},fail:function(e,o,n){c.su.userInfo={},s.postLoginStatus();var i=e.data.errorcode;if(i&&(i=String(i).replace(/^-/,"E")),i&&-1!=c.su.cloudErrorCode.indexOf(i)){var t=s.getEffectiveView();u[t].cloudErrorPromptContent.setText(c.su.CHAR.ERROR[i]),u[t].cloudErrorPrompt.show()}},error:s.postLoginStatus})},onReceive:function(e){var o=e.originalEvent||e;if(o.origin===s.cloudOrigin||"_self"===o.origin||o.origin==undefined){var n=o.data;"string"==typeof o.data&&(n=c.parseJSON(n));var r=s.getEffectiveView();if(n)switch(n.eType){case"ev_goto":if("login"==n.url||"login"==n.index){if("qs"===s.getMode())u[r].tpLinkCloudInfoPanel.show(),c("#cloud-login").removeClass("qs"),l.moduleManager.get("qsCloudAndTether").showCloudEle();return}n.url&&s.getToken(n.url);break;case"load":var i={};i.locale=l.device.getLocale(),i.force=l.device.getForce(),i.model=l.device.getProductName(),i.eType="ev_init";var t=JSON.stringify(i);window.frames["cloud-login"]&&window.frames["cloud-login"].postMessage(t,s.cloudOrigin),d.main.clearWaitingEvent(),d.index.hideLoading(),c("#cloud-login").show(),c.su.userInfo.token&&s.postUserInfo(),s.postToken(),s.getDeviceInfo();break;case"ev_unbind":l.ajax.request({proxy:"cloudUnbindProxy",method:"write",data:{token:c.su.userInfo.token,role:c.su.userInfo.role},success:function(e){l.ajax.request({proxy:"cloudLogoutProxy",method:"write",success:function(){localStorage&&localStorage.setItem("token",""),location.href="/"}})},fail:function(e,o,n){var i=o;if(i){i=String(i).replace(/^-/,"E");var t=c.su.CHAR.ERROR[i];"E5001"==i&&(t=c.su.CHAR.ERROR[i].replace("%email",e.data.ownerAccount)),u[r].cloudErrorPromptContent.setText(t),u[r].cloudErrorPrompt.show()}}});break;case"ev_mouseWheel":var a=c(".page-content").scrollTop();c(".page-content").scrollTop(a-n.delta);break;case"ev_login":n.validate&&(c.su.userInfo.username=n.email,c.su.userInfo.token=n.token,l.ajax.request({proxy:"cloudBindStatusProxy",method:"read",data:{token:c.su.userInfo.token},success:function(e){e.isbind?s.doCloudLogin("login"):s.doCloudLogin("bind")},fail:s.postLoginStatus,error:s.postLoginStatus}));break;case"ev_logout":case"ev_changePwd":l.ajax.request({proxy:"cloudLogoutProxy",method:"write",success:function(){localStorage&&localStorage.setItem("token",""),location.href="/"}});break;case"ev_qs_switch":u[r].tpLinkCloudInfoPanel.hide(),c("#cloud-login").addClass("qs"),l.moduleManager.get("qsCloudAndTether").hideCloudEle()}}}}})}(jQuery);