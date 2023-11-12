$.su.modelManager.define("serviceFiltering",{type:"model",fields:[{name:"enable",defaultValue:"off"},{name:"filterList"}],proxy:{url:"./data/serviceFiltering.json"}}),$.su.storeManager.define("serviceFilteringGridStore",{type:"store",fields:[{name:"serviceType",defaultValue:"All"},{name:"port"},{name:"protocol",defaultValue:"TCP_UDP"},{name:"IP"}],proxy:{url:"./data/serviceFilteringGrid.json"}}),$.su.storeManager.define("serviceTpyeStore",{type:"store",fields:[{name:"name"},{name:"value"}],data:[{name:$.su.CHAR.SERVICE_FILTERING.ALL,value:"All"},{name:$.su.CHAR.SERVICE_FILTERING.ANY_TCP,value:"Any-TCP"},{name:$.su.CHAR.SERVICE_FILTERING.ANY_UDP,value:"Any-UDP"},{name:$.su.CHAR.SERVICE_FILTERING.DNS,value:"DNS"},{name:$.su.CHAR.SERVICE_FILTERING.FTP,value:"FTP"},{name:$.su.CHAR.SERVICE_FILTERING.HTTP,value:"HTTP"},{name:$.su.CHAR.SERVICE_FILTERING.HTTPS,value:"HTTPS"},{name:$.su.CHAR.SERVICE_FILTERING.NFS,value:"NFS"},{name:$.su.CHAR.SERVICE_FILTERING.SMTP,value:"SMTP"},{name:$.su.CHAR.SERVICE_FILTERING.SNMP,value:"SNMP"},{name:$.su.CHAR.SERVICE_FILTERING.SNMP_TRAP,value:"SNMP-TRAP"},{name:$.su.CHAR.SERVICE_FILTERING.SSH,value:"SSH"},{name:$.su.CHAR.SERVICE_FILTERING.VPN_IPSEC,value:"VPN-IPSEC"},{name:$.su.CHAR.SERVICE_FILTERING.VPN_L2TP,value:"VPN-L2TP"},{name:$.su.CHAR.SERVICE_FILTERING.VPN_PPTP,value:"VPN-PPTP"},{name:$.su.CHAR.SERVICE_FILTERING.OPENVPN,value:"OpenVPN"},{name:$.su.CHAR.SERVICE_FILTERING.CUSTOM,value:"Custom"}]}),$.su.storeManager.define("protocolStore",{type:"store",fields:[{name:"name"},{name:"value"}],data:[{name:$.su.CHAR.SERVICE_FILTERING.TCP,value:"TCP"},{name:$.su.CHAR.SERVICE_FILTERING.UDP,value:"UDP"},{name:$.su.CHAR.SERVICE_FILTERING.TCP_UDP,value:"TCP_UDP"}]}),$.su.modelManager.define("serviceFilteringGridEditorModel",{type:"model",reserveExtraFields:!0,fields:[{name:"serviceType"},{name:"serviceName",allowBlank:!1},{name:"protocol"},{name:"rangeFrom",vtype:{vtype:"number",min:1,max:65535},allowBlank:!1},{name:"rangeTo",vtype:{vtype:"number",min:1,max:65535},allowBlank:!1},{name:"IPMode"},{name:"singleIP",vtype:"ip",allowBlank:!1},{name:"ipRange"},{name:"ipFrom",vtype:"ip",allowBlank:!1},{name:"ipTo",vtype:"ip",allowBlank:!1}],convert:function(e){var a={};if(a.serviceType=e.serviceType,a.serviceName="",a.protocol=e.protocol,e.port){var n=e.port.split("-");a.rangeFrom=n[0],a.rangeTo=n[1]}else a.rangeFrom=1,a.rangeTo=65535;if(e.IP)if(e.IP==$.su.CHAR.SERVICE_FILTERING.ALL)a.IPMode=2;else if(e.IP.match("~")){a.IPMode=1;var I=e.IP.split("~");a.ipFrom=I[0],a.ipTo=I[1]}else a.IPMode=0,a.singleIP=e.IP;else a.IPMode=2;return a},serialize:function(e){var a={};return a.serviceType=e.serviceType,a.protocol=e.protocol,e.rangeFrom&&e.rangeTo?a.port=e.rangeFrom+"-"+e.rangeTo:a.port="1-65535",0==e.IPMode?a.IP=e.singleIP:1==e.IPMode?a.IP=e.ipFrom+"~"+e.ipTo:a.IP=$.su.CHAR.SERVICE_FILTERING.ALL,a}}),$.su.storeManager.define("IPModeStore",{type:"store",fields:[{name:"name"},{name:"value"},{name:"boxlabel"}],data:[{name:"mode0",value:0,boxlabel:$.su.CHAR.SERVICE_FILTERING.SINGLE_IP},{name:"mode1",value:1,boxlabel:$.su.CHAR.SERVICE_FILTERING.IP_RANGE},{name:"mode2",value:2,boxlabel:$.su.CHAR.SERVICE_FILTERING.ALL_IP}]});