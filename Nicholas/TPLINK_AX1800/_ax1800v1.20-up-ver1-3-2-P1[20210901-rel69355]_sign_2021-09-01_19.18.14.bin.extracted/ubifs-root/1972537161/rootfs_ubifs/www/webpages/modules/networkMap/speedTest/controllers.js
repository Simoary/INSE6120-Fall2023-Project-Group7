!function(i){i.su.moduleManager.define("speedTest",{services:["ajax"],models:["statusAll","speedTestControl"],stores:[],views:["speedTestView","speedTestViewDashboard"],listeners:{"ev_on_launch":function(e,s,t,n,d,o,p){this.initSpeedtest(),s.getSpeedTestResult({success:function(e){var t=e.testTime;e.upSpeed,e.downSpeed;t&&0!==parseInt(t,10)?s.setSpeedTestResult(e):(n.speedTestControl.speedTestTime.setText("&nbsp;"),n.speedTestControl.speedTestBtn.setText(i.su.CHAR.NETWORK_MAP.SPEED_TEST),s.setDownloadChartSpeed(0),s.setUploadChartSpeed(0))}})},"ev_before_destroy":function(e,t){t.beforeDestroy()}},init:function(e,t,s,n,d,o){this.control({"#speed-test-btn":{"ev_button_click":function(){e.isSpeedTesting?e.stopSpeedTest():e.startSpeedTest()}},"#speed-test-history-button":{"ev_button_click":function(){e.getSpeedTestHistory(),s.speedTestControl.speedTestHistoryMsg.show()}},"#speed-test-clear-button":{"ev_button_click":function(){s.speedTestControl.speedTestClearMsg.show()}},"#speed-test-clear-msg":{"ev_msg_ok":function(){e.clearSpeedTestHistory()}}}),this.listen({})}},function(o,e,p,t,s,d){var n=null;return{isSpeedTesting:!1,initSpeedtest:function(){this.getEffectiveView();switch(this.getEffectiveView()){case"speedTestView":this.initDownloadChart(),this.initUploadChart()}},initDownloadChart:function(){p.speedTestControl.speedTestDownload.setOption({name:i.su.CHAR.NETWORK_MAP.DOWNLOAD_SPEED_UPPER,convert:[0,5,10,25,50,100,300,1e3,2500]}),this.setDownloadChartSpeed(0)},initUploadChart:function(){p.speedTestControl.speedTestUpload.setOption({name:i.su.CHAR.NETWORK_MAP.UPLOAD_SPEED_UPPER,convert:[0,5,10,25,50,100,300,1e3,2500]}),this.setUploadChartSpeed(0)},setDownloadChartSpeed:function(e){this.getEffectiveView();switch(this.getEffectiveView()){case"speedTestView":p.speedTestControl.speedTestDownload.setOption({value:this.normalizeSpeed(e),name:i.su.CHAR.NETWORK_MAP.DOWNLOAD_SPEED_UPPER,convert:[0,5,10,25,50,100,300,1e3,2500]});break;case"speedTestViewDashboard":p.speedTestControl.speedTestDownload.setField("value",this.normalizeSpeed(e)),p.speedTestControl.speedTestDownload.setField("unit",i.su.CHAR.NETWORK_MAP.DOWNLOAD_SPEED_UPPER)}o.trigger("ev_download_speed_change",e)},setUploadChartSpeed:function(e){this.getEffectiveView();switch(this.getEffectiveView()){case"speedTestView":p.speedTestControl.speedTestUpload.setOption({value:this.normalizeSpeed(e),name:i.su.CHAR.NETWORK_MAP.UPLOAD_SPEED_UPPER,convert:[0,5,10,25,50,100,300,1e3,2500]});break;case"speedTestViewDashboard":p.speedTestControl.speedTestUpload.setField("value",this.normalizeSpeed(e)),p.speedTestControl.speedTestUpload.setField("unit",i.su.CHAR.NETWORK_MAP.UPLOAD_SPEED_UPPER)}o.trigger("ev_upload_speed_change",e)},getSpeedTestResult:function(e){var t,s,n="readSpeedTestProxy";e&&(t=e.success,s=e.fail,n=e.proxy||n),d.ajax.request({proxy:n,preventSuccessEvent:e.preventSuccessEvent,success:function(e){o.isRunning()&&t&&t(e)},fail:function(e){o.isRunning()&&s&&s(e)}})},clearSpeedTestHistory:function(){o.getSpeedTestResult({proxy:"clearSpeedTestHistoryProxy",success:function(e){o.setSpeedTestHistory(e)}})},getSpeedTestHistory:function(){o.getSpeedTestResult({proxy:"getSpeedTestHistoryProxy",success:function(e){o.setSpeedTestHistory(e)}})},setSpeedTestHistory:function(e){if(i.isArray(e)&&0!==e.length){var t="";t+='<div class="content">',t+='<div class="items title">',t+='<div class="time-wrapper">'+i.su.CHAR.NETWORK_MAP.TIME+"</div>",t+='<div class="point-wrapper"></div>',t+='<div class="download-wrapper">'+i.su.CHAR.NETWORK_MAP.DOWNLOAD+"</div>",t+='<div class="upload-wrapper">'+i.su.CHAR.NETWORK_MAP.UPLOAD+"</div>",t+="</div>";for(var s=0,n=e.length;s<n;s++){t+='<div class="items'+(s===e.length-1?" last":"")+'">',t+='<div class="time-wrapper"><span class="time">'+o.transformSpeedTestDate(e[s].testTime)+"</span></div>",t+='<div class="point-wrapper"><span class="point"></span></div>',t+='<span class="conn-line"></span>',t+='<div class="download-wrapper"><span class="download">'+o.transformSpeedUnit(e[s].downSpeed)+" "+i.su.CHAR.NETWORK_MAP.MBPS_2+"</span></div>",t+='<div class="upload-wrapper"><span class="upload">'+o.transformSpeedUnit(e[s].upSpeed)+" "+i.su.CHAR.NETWORK_MAP.MBPS_2+"</span></div>",t+="</div>"}t+="</div>",i("#speed-test-history-detail").html(t),p.speedTestControl.historyContent.show(),p.speedTestControl.noHistoryContent.hide()}else p.speedTestControl.historyContent.hide(),p.speedTestControl.noHistoryContent.show()},setSpeedTestResult:function(e){var t=o.transformSpeedUnit(e.upSpeed),s=o.transformSpeedUnit(e.downSpeed),n=o.transformSpeedTestTime(e.testTime);p.speedTestControl.speedTestBtn.textAnimate(!1),p.speedTestControl.speedTestBtn.setText(i.su.CHAR.NETWORK_MAP.TEST_AGAIN),"idle"===e.status&&(p.speedTestControl.speedTestTime.setText(i.su.CHAR.NETWORK_MAP.SPEED_TEST_TIME_NOTE.replace("%time%",n)),p.speedTestControl.speedTestChartContainer.show(),p.speedTestControl.speedTestingContainer.hide()),o.setDownloadChartSpeed(s),o.setUploadChartSpeed(t);for(var d=1;d<7;d++)i("#speed-test-result-container").removeClass("result-"+d);s<8?i("#speed-test-result-container").addClass("result-6"):8<=s&&s<15?i("#speed-test-result-container").addClass("result-5"):15<=s&&s<30?i("#speed-test-result-container").addClass("result-4"):30<=s&&s<50?i("#speed-test-result-container").addClass("result-3"):50<=s&&s<100?i("#speed-test-result-container").addClass("result-2"):100<=s&&i("#speed-test-result-container").addClass("result-1")},startSpeedTest:function(){o.isSpeedTesting=!0,clearInterval(n),p.speedTestControl.speedTestBtn.setText(i.su.CHAR.NETWORK_MAP.TESTING),p.speedTestControl.speedTestBtn.textAnimate(),p.speedTestControl.speedTestTime.setText("&nbsp;"),p.speedTestControl.speedTestChartContainer.hide(),p.speedTestControl.speedTestingContainer.show(),i("#speed-test-testing-picture").removeClass("download upload fail"),o.getSpeedTestResult({proxy:"startSpeedTestProxy",success:function(e){n=setInterval(function(){o.continueSpeedTest()},2e3)}})},continueSpeedTest:function(){o.getSpeedTestResult({proxy:"readSpeedTestProxy",success:function(e){"idle"===e.status?(o.isSpeedTesting=!1,clearInterval(n),o.setSpeedTestResult(e)):"fail"===e.status?(i("#speed-test-testing-picture").addClass("fail"),p.speedTestControl.speedTestTime.setText(i.su.CHAR.NETWORK_MAP.SPEED_TEST_FAIL),o.isSpeedTesting=!1,clearInterval(n),o.setSpeedTestResult(e)):"down_test"===e.status?(i("#speed-test-testing-picture").addClass("download"),p.speedTestControl.speedTestTime.setText(i.su.CHAR.NETWORK_MAP.DOWNLOAD_SPEED_TEST),o.setDownloadChartSpeed(o.transformSpeedUnit(e.downSpeed)),o.setUploadChartSpeed(o.transformSpeedUnit(e.upSpeed))):"up_test"===e.status?(i("#speed-test-testing-picture").addClass("upload"),p.speedTestControl.speedTestTime.setText(i.su.CHAR.NETWORK_MAP.UPLOAD_SPEED_TEST),o.setDownloadChartSpeed(o.transformSpeedUnit(e.downSpeed)),o.setUploadChartSpeed(o.transformSpeedUnit(e.upSpeed))):(p.speedTestControl.speedTestTime.setText("&nbsp;"),o.setDownloadChartSpeed(0),o.setUploadChartSpeed(0))},fail:function(){i("#speed-test-testing-picture").addClass("fail"),p.speedTestControl.speedTestTime.setText(i.su.CHAR.NETWORK_MAP.SPEED_TEST_FAIL),o.isSpeedTesting=!1,clearInterval(n),n=null,o.setSpeedTestResult({upSpeed:0,downSpeed:0,testTime:0,status:"fail"})},error:function(){i("#speed-test-testing-picture").addClass("fail"),p.speedTestControl.speedTestTime.setText(i.su.CHAR.NETWORK_MAP.SPEED_TEST_FAIL),o.isSpeedTesting=!1,clearInterval(n),n=null,o.setSpeedTestResult({upSpeed:0,downSpeed:0,testTime:0,status:"fail"})}})},stopSpeedTest:function(){o.getSpeedTestResult({proxy:"stopSpeedTestProxy",success:function(e){o.isSpeedTesting=!1,clearInterval(n),n=null,o.setSpeedTestResult(e)}})},normalizeSpeed:function(e){return isNaN(e)||e<0?0:e},separateSpeed:function(e){var t={},s=e;return t.unit=s/1024<1?(t.value=0===s?0:s/1024,i.su.CHAR.NETWORK_MAP.KBPS_2):s/1024/1024<1?(t.value=s/1024,i.su.CHAR.NETWORK_MAP.KBPS_2):(t.value=s/1024/1024,i.su.CHAR.NETWORK_MAP.MBPS_2),t.value=parseFloat(t.value.toFixed(2)),t},transformSpeedUnit:function(e){return(!e||e<0)&&(e=0),1e3<=(e/=1024)?parseInt(e,10):parseFloat(e.toFixed(2))},transformSpeedTestTime:function(e){var t=parseInt((new Date).getTime()/1e3,10)-e;t=0<t?t:0;var s=parseInt(t/86400,10),n=parseInt(t%86400/3600,10),d=parseInt(t%3600/60,10);return 0===parseInt(e,10)?i.su.CHAR.NETWORK_MAP.MINUTE_AGO.replace("%minute%",1):0<s?(1<s?i.su.CHAR.NETWORK_MAP.DAYS_AGO:i.su.CHAR.NETWORK_MAP.DAY_AGO).replace("%day%",s):0<n?(1<n?i.su.CHAR.NETWORK_MAP.HOURS_AGO:i.su.CHAR.NETWORK_MAP.HOUR_AGO).replace("%hour%",n):(1<(d=1<d?d:1)?i.su.CHAR.NETWORK_MAP.MINUTES_AGO:i.su.CHAR.NETWORK_MAP.MINUTE_AGO).replace("%minute%",d)},transformSpeedTestDate:function(e){var t=new Date(1e3*e),s=t.getFullYear(),n=("0"+(t.getMonth()+1)).slice(-2),d=("0"+t.getDate()).slice(-2),o=t.getHours();return s+"-"+n+"-"+d+" "+(o=12<o?o-12:o)+":"+("0"+t.getMinutes()).slice(-2)+" "+(12<t.getHours()?i.su.CHAR.NETWORK_MAP.PM:i.su.CHAR.NETWORK_MAP.AM)},beforeDestroy:function(){clearInterval(null),clearInterval(n),p.speedTestControl.speedTestBtn.textAnimate(!1)}}})}(jQuery);