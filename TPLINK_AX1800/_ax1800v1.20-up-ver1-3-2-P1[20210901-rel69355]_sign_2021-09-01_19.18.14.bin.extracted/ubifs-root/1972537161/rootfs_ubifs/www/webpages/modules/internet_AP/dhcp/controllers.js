!function(p){p.su.moduleManager.define("dhcpAPAdv",{models:["dhcpServer"],services:["moduleLoader","ajax"],stores:["dhcpAPStore"],deps:["utils"],views:["dhcpAPView"],listeners:{"ev_on_launch":function(e,r,t,a,d,s,i){a.dhcpServer.load(),i.moduleLoader.load({module:"dhcpAPAdv"},{module:"addressReservationAdv"},t.dhcpAPView.dhcpAddressResvationLoader),i.moduleLoader.load({module:"dhcpAPAdv"},{module:"dhcpClientListAdv"},t.dhcpAPView.dhcpClientListLoader)}},init:function(e,t,s,r,i,l){this.configViews({}),this.listen({"models.dhcpServer.enable":{"ev_value_change":function(e,r){"auto"==r?(t.dhcpAPView.serverSettings.show(),t.dhcpAPView.serverSettings.disable()):"off"==r?(t.dhcpAPView.serverSettings.hide(),t.dhcpAPView.serverSettings.disable()):(t.dhcpAPView.serverSettings.show(),t.dhcpAPView.serverSettings.enable())}}}),this.control({".index-common-save-btn":{"ev_will_auto_save":function(e,r){if("off"==s.dhcpServer.enable.getValue()&&(l.ajax.request({proxy:"dhcpServerProxy",method:"read",success:function(e){var r=e;r.enable=s.dhcpServer.enable.getValue(),s.dhcpServer.submit({data:r})}}),r.preventDefault()),"on"==s.dhcpServer.enable.getValue()){var t=s.dhcpServer.ipaddrStart.getValue(),a=s.dhcpServer.ipaddrEnd.getValue(),d=s.dhcpServer.gateway.getValue();!i.utils.isSameNet(t,self.lanIp,self.mask)&&s.dhcpServer.ipaddrStart.validate()&&(s.dhcpServer.ipaddrStart.setError(p.su.CHAR.NETWORK_DHCP.LAN_TIP),r.preventDefault()),!i.utils.isSameNet(a,self.lanIp,self.mask)&&s.dhcpServer.ipaddrEnd.validate()&&(s.dhcpServer.ipaddrEnd.setError(p.su.CHAR.NETWORK_DHCP.LAN_TIP),r.preventDefault()),0!==d.length&&!i.utils.isSameNet(d,self.lanIp,self.mask)&&s.dhcpServer.gateway.validate()&&(s.dhcpServer.gateway.setError(p.su.CHAR.NETWORK_DHCP.LAN_TIP),r.preventDefault()),(i.utils.isNetIp(t,self.mask)||i.utils.isBroadCastIp(t,self.mask))&&s.dhcpServer.gateway.validate()&&(s.dhcpServer.ipaddrStart.setError(p.su.CHAR.ERROR["00000059"]),r.preventDefault()),(i.utils.isNetIp(a,self.mask)||i.utils.isBroadCastIp(a,self.mask))&&s.dhcpServer.gateway.validate()&&(s.dhcpServer.ipaddrEnd.setError(p.su.CHAR.ERROR["00000059"]),r.preventDefault()),0!==d.length&&(i.utils.isNetIp(d,self.mask)||i.utils.isBroadCastIp(d,self.mask))&&s.dhcpServer.gateway.validate()&&(s.dhcpServer.gateway.setError(p.su.CHAR.ERROR["00000059"]),r.preventDefault())}}}})}},function(e,r,t,a,d,s){return{}})}(jQuery);