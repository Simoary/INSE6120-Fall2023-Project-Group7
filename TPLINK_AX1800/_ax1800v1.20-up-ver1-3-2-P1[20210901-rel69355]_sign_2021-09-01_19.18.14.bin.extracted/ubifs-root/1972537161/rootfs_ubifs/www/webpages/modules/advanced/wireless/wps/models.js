!function(a){a.su.modelManager.define("wps",{type:"model",fields:[{name:"wps"}],proxy:{url:a.su.url("/admin/wireless?form=syspara_wps")}}),a.su.modelManager.define("routerPIN",{type:"model",fields:[{name:"wpsLabel",mapping:"wps_label"}],proxy:{url:a.su.url("/admin/wireless?form=wps_pin")}}),a.su.modelManager.define("wpsPIN",{type:"model",fields:[{name:"wpsPin",mapping:"wps_pin"}],proxy:"wpsPinProxy"}),a.su.storeManager.define("wpsPINStore",{type:"store",fields:[{name:"name"},{name:"value"},{name:"boxlabel"}],data:[{name:a.su.CHAR.WPS.CLIENT_PIN,value:"client",boxlabel:a.su.CHAR.WPS.CLIENT_PIN},{name:a.su.CHAR.WPS.ROUTER_PIN,value:"router",boxlabel:a.su.CHAR.WPS.ROUTER_PIN}]}),a.su.define("wpsPinProxy",{extend:"IPFProxy",url:a.su.url("/admin/wireless?form=wps_pin"),api:{generate:{writeFilter:function(e){return a.extend({operation:"write",option:"generate"},e)},readFilter:function(e){return{wpsLabel:e.data.wps_label,wpsPin:e.data.wps_pin,result:e.data.result,mac:e.data.mac}}},getDefault:{writeFilter:function(e){return a.extend({operation:"write",option:"default"},e)},readFilter:function(e){return{wpsLabel:e.data.wps_label,wpsPin:e.data.wps_pin,result:e.data.result,mac:e.data.mac}}}}}),a.su.define("wpsReadProxy",{extend:"IPFProxy",url:a.su.url("/admin/wireless?form=wps_connect"),writeFilter:function(e){return{operation:"read"}},readFilter:function(e){return{wpsTimeout:e.data.wps_timeout,disabled:e.data.disabled,available:e.data.available}}}),a.su.define("wpsButtonStartProxy",{extend:"IPFProxy",url:a.su.url("/admin/wireless?form=wps_connect"),writeFilter:function(e){return{option:"connect"}}}),a.su.define("wpsButtonConnectProxy",{extend:"IPFProxy",url:a.su.url("/admin/wireless?form=wps_connect"),writeFilter:function(e){return{option:"pbc"}},readFilter:function(e){return{mac:e.data.mac,wpsStatus:e.data.wps_status}}}),a.su.define("wpsPinStartProxy",{extend:"IPFProxy",url:a.su.url("/admin/wireless?form=wps_connect"),writeFilter:function(e){return{option:"connect",wps_pin:e.wpsPin}},readFilter:function(e){return{wpsTimeout:e.data.wps_timeout,disabled:e.data.disabled,available:e.data.available,wpsStatus:e.data.wps_status}},failFilter:function(e){return{wpsStatus:e.data.wps_status}}}),a.su.define("wpsPinCancelProxy",{extend:"IPFProxy",url:a.su.url("/admin/wireless?form=wps_connect"),writeFilter:function(e){return{option:"cancel"}}}),a.su.define("wpsPinConnectProxy",{extend:"IPFProxy",url:a.su.url("/admin/wireless?form=wps_connect"),writeFilter:function(e){return{option:"pin"}},readFilter:function(e){return{mac:e.data.mac,wpsStatus:e.data.wps_status}}}),a.su.define("wpsWireless2gProxy",{extend:"IPFProxy",url:a.su.url("/admin/wireless?form=wireless_2g"),readFilter:function(e){return{enable:e.data.enable,hidden:e.data.hidden,encryption:e.data.encryption,pskCipher:e.data.psk_cipher,disabled:e.data.disabled,disabledAll:e.data.disabled_all,extinfo:{wdsGuestCompatible:e.data.extinfo&&e.data.extinfo.wds_guest_compatible}}}}),a.su.define("wpsWireless5gProxy",{extend:"IPFProxy",url:a.su.url("/admin/wireless?form=wireless_5g"),readFilter:function(e){return{enable:e.data.enable,hidden:e.data.hidden,encryption:e.data.encryption,pskCipher:e.data.psk_cipher,disabled:e.data.disabled,disabledAll:e.data.disabled_all,extinfo:{wdsGuestCompatible:e.data.extinfo&&e.data.extinfo.wds_guest_compatible}}}}),a.su.define("wpsWireless5g2Proxy",{extend:"IPFProxy",url:a.su.url("/admin/wireless?form=wireless_5g_2"),readFilter:function(e){return{enable:e.data.enable,hidden:e.data.hidden,encryption:e.data.encryption,pskCipher:e.data.psk_cipher,disabled:e.data.disabled,disabledAll:e.data.disabled_all,extinfo:{wdsGuestCompatible:e.data.extinfo&&e.data.extinfo.wds_guest_compatible}}}}),a.su.define("wpsPinProxyAsync",{extend:"IPFProxy",url:a.su.url("/admin/wireless?form=wps_pin"),readFilter:function(e){return{lock2g:e.data.lock_2g,lock5g:e.data.lock_5g,lock5g2:e.data.lock_5g_2,wpsLabel:e.data.wps_label}},writeFilter:function(e){return{operation:"read"}}})}(jQuery);