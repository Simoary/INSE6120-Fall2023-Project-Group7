!function(d){d.su.moduleManager.define("cloudError",{deps:[],services:[],models:[],stores:[],views:["cloudErrorView"],listeners:{"ev_on_launch":function(e,o,r,n,t,s,u){this.control({".cloud-error-refresh":{"click":function(){"qs"==o.mode?d.su.moduleManager.get("qsCloudAndTether").refreshTpLogin():window.location.reload()}}}),d("#support").attr("href","http://www.tp-link.com/Support/")}}},function(o,e,r,n,t,s){return{mode:"",setMode:function(e){o.mode=e}}})}(jQuery);