!function(r){r.su.moduleManager.define("transitionAp",{services:["device"],stores:[],models:["quickSetupModel"],deps:["quickSetupAp","main"],views:["transitionView"],listeners:{"ev_on_launch":function(e,i,t,n,s,u,r){this.start()}},init:function(e,i,t,n,s,u){this.control(),this.listen()}},function(e,i,t,n,s,u){return{start:function(){s.main.showMask(),i.transitionView.creatingProgressbar.reset(),i.transitionView.creatingProgressbar.animate({percentageStart:0,percentageEnd:100,duration:2e4}),t.quickSetupModel.timeTimezone.setValue(0),t.quickSetupModel.toggleFields(/^wireless/,!0),u.device.getIsTriband()||t.quickSetupModel.toggleFields(function(e){if(/^wireless5g2/.test(e))return!0},!1),t.quickSetupModel.submit({url:r.su.url("/admin/quick_setup?form=ap_setup"),success:function(){i.transitionView.creatingProgressbar.setValue(100),setTimeout(function(){s.main.hideMask(),s.quickSetupAp.goTo("qsSummaryAp")},1e3)},fail:function(){s.main.hideMask(),s.quickSetupAp.goTo("qsWirelessSettingAp")},error:function(){s.main.hideMask(),s.quickSetupAp.goTo("qsWirelessSettingAp")}})}}})}(jQuery);