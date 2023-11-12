!function(d){d.su.moduleManager.define("serviceFiltering",{models:["serviceFiltering","serviceFilteringGridEditorModel"],stores:["serviceFilteringGridStore","IPModeStore","serviceTpyeStore","protocolStore"],services:[],views:["serviceFilteringView"],listeners:{ev_on_launch:function(e,i,r,t,o,l,d){t.serviceFiltering.load(),o.serviceFilteringGridStore.load(),t.serviceFiltering.filterList.hide()}},init:function(e,i,t,r,o,l){this.configViews({id:"serviceFilteringView",items:[{id:"grid-serviceFiltering",configs:{minLines:0,popEditor:{addTitle:d.su.CHAR.SERVICE_FILTERING.ADD_SERVICE_FILTER,content:"#grid-serviceFiltering-popEditor",fields:[{name:"serviceType"},{name:"serviceName"},{name:"protocol"},{name:"rangeFrom"},{name:"rangeTo"},{name:"IPMode"},{name:"singleIP"},{name:"ipFrom"},{name:"ipTo"}]},paging:{},columns:[{text:d.su.CHAR.SERVICE_FILTERING.SERVICE_TYPE,dataIndex:"serviceType"},{text:d.su.CHAR.SERVICE_FILTERING.PORT,dataIndex:"port"},{text:d.su.CHAR.SERVICE_FILTERING.IP_ADDRESS,dataIndex:"IP"},{xtype:"actioncolumn",text:d.su.CHAR.SERVICE_FILTERING.MODIFY,renderer:function(e,i){return'<span class="icon"></span>','<span class="text"></span>',"</a>",'<a href="javascript:void(0)" class="grid-content-btn grid-content-btn-delete btn-delete">','<span class="icon"></span>','<span class="text"></span>',"</a>",'<a href="javascript:void(0)" class="grid-content-btn grid-content-btn-edit btn-edit"><span class="icon"></span><span class="text"></span></a><a href="javascript:void(0)" class="grid-content-btn grid-content-btn-delete btn-delete"><span class="icon"></span><span class="text"></span></a>'}}]}}]}),this.control(),this.listen({"models.serviceFiltering.enable":{"ev_value_change":function(e,i,r){"on"==i?t.serviceFiltering.filterList.show():t.serviceFiltering.filterList.hide()}},"models.serviceFilteringGridEditorModel.serviceType":{"ev_value_change":function(e,i,r){switch(t.serviceFilteringGridEditorModel.serviceName.hide(),t.serviceFilteringGridEditorModel.serviceName.disable(),t.serviceFilteringGridEditorModel.protocol.disable(),t.serviceFilteringGridEditorModel.rangeFrom.disable(),t.serviceFilteringGridEditorModel.rangeTo.disable(),i){case"Custom":t.serviceFilteringGridEditorModel.serviceName.show(),t.serviceFilteringGridEditorModel.serviceName.enable(),t.serviceFilteringGridEditorModel.protocol.setValue("TCP_UDP"),t.serviceFilteringGridEditorModel.protocol.enable(),t.serviceFilteringGridEditorModel.rangeFrom.setValue(),t.serviceFilteringGridEditorModel.rangeFrom.enable(),t.serviceFilteringGridEditorModel.rangeTo.setValue(),t.serviceFilteringGridEditorModel.rangeTo.enable();break;case"All":t.serviceFilteringGridEditorModel.protocol.setValue("TCP_UDP"),t.serviceFilteringGridEditorModel.rangeFrom.setValue(1),t.serviceFilteringGridEditorModel.rangeTo.setValue(65535);break;case"Any-TCP":t.serviceFilteringGridEditorModel.protocol.setValue("TCP"),t.serviceFilteringGridEditorModel.rangeFrom.setValue(1),t.serviceFilteringGridEditorModel.rangeTo.setValue(65535);break;case"Any-UDP":t.serviceFilteringGridEditorModel.protocol.setValue("UDP"),t.serviceFilteringGridEditorModel.rangeFrom.setValue(1),t.serviceFilteringGridEditorModel.rangeTo.setValue(65535);break;case"DNS":t.serviceFilteringGridEditorModel.protocol.setValue("TCP_UDP"),t.serviceFilteringGridEditorModel.rangeFrom.setValue(53),t.serviceFilteringGridEditorModel.rangeTo.setValue(53);break;case"FTP":t.serviceFilteringGridEditorModel.protocol.setValue("TCP"),t.serviceFilteringGridEditorModel.rangeFrom.setValue(20),t.serviceFilteringGridEditorModel.rangeTo.setValue(21);break;case"HTTP":t.serviceFilteringGridEditorModel.protocol.setValue("TCP"),t.serviceFilteringGridEditorModel.rangeFrom.setValue(80),t.serviceFilteringGridEditorModel.rangeTo.setValue(80);break;case"HTTPS":t.serviceFilteringGridEditorModel.protocol.setValue("TCP"),t.serviceFilteringGridEditorModel.rangeFrom.setValue(443),t.serviceFilteringGridEditorModel.rangeTo.setValue(443);break;case"NFS":t.serviceFilteringGridEditorModel.protocol.setValue("UDP"),t.serviceFilteringGridEditorModel.rangeFrom.setValue(2049),t.serviceFilteringGridEditorModel.rangeTo.setValue(2049);break;case"SMTP":t.serviceFilteringGridEditorModel.protocol.setValue("TCP"),t.serviceFilteringGridEditorModel.rangeFrom.setValue(25),t.serviceFilteringGridEditorModel.rangeTo.setValue(25);break;case"SNMP":t.serviceFilteringGridEditorModel.protocol.setValue("TCP_UDP"),t.serviceFilteringGridEditorModel.rangeFrom.setValue(161),t.serviceFilteringGridEditorModel.rangeTo.setValue(161);break;case"SNMP-TRAP":t.serviceFilteringGridEditorModel.protocol.setValue("TCP_UDP"),t.serviceFilteringGridEditorModel.rangeFrom.setValue(162),t.serviceFilteringGridEditorModel.rangeTo.setValue(162);break;case"SSH":t.serviceFilteringGridEditorModel.protocol.setValue("TCP_UDP"),t.serviceFilteringGridEditorModel.rangeFrom.setValue(22),t.serviceFilteringGridEditorModel.rangeTo.setValue(22);break;case"VPN-IPSEC":t.serviceFilteringGridEditorModel.protocol.setValue("UDP"),t.serviceFilteringGridEditorModel.rangeFrom.setValue(500),t.serviceFilteringGridEditorModel.rangeTo.setValue(500);break;case"VPN-L2TP":t.serviceFilteringGridEditorModel.protocol.setValue("UDP"),t.serviceFilteringGridEditorModel.rangeFrom.setValue(1701),t.serviceFilteringGridEditorModel.rangeTo.setValue(1701);break;case"VPN-PPTP":t.serviceFilteringGridEditorModel.protocol.setValue("TCP"),t.serviceFilteringGridEditorModel.rangeFrom.setValue(1723),t.serviceFilteringGridEditorModel.rangeTo.setValue(1723);break;case"OpenVPN":t.serviceFilteringGridEditorModel.protocol.setValue("TCP_UDP"),t.serviceFilteringGridEditorModel.rangeFrom.setValue(1194),t.serviceFilteringGridEditorModel.rangeTo.setValue(1194)}}},"models.serviceFilteringGridEditorModel.IPMode":{"ev_value_change":function(e,i,r){t.serviceFilteringGridEditorModel.singleIP.hide(),t.serviceFilteringGridEditorModel.singleIP.disable(),t.serviceFilteringGridEditorModel.ipRange.hide(),t.serviceFilteringGridEditorModel.ipFrom.hide(),t.serviceFilteringGridEditorModel.ipFrom.disable(),t.serviceFilteringGridEditorModel.ipTo.hide(),t.serviceFilteringGridEditorModel.ipTo.disable(),"0"==i?(t.serviceFilteringGridEditorModel.singleIP.show(),t.serviceFilteringGridEditorModel.singleIP.enable()):"1"==i&&(t.serviceFilteringGridEditorModel.ipRange.show(),t.serviceFilteringGridEditorModel.ipFrom.show(),t.serviceFilteringGridEditorModel.ipFrom.enable(),t.serviceFilteringGridEditorModel.ipTo.show(),t.serviceFilteringGridEditorModel.ipTo.enable())}}})}},function(e,i,r,t,o,l){return{}})}(jQuery);