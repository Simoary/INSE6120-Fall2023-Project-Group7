$.su.storeManager.define("portTriggeringStore",{type:"store",autoReload:!0,fields:[{name:"name",allowBlank:!1,vtype:"string_visible_allow_blank"},{name:"triggerPort",mapping:"trigger_port",allowBlank:!1,valueType:"string",validator:function(e){return new RegExp("^([0-9]*)$").test(e)?!((e=parseInt(e,10))<1||65535<e)||$.su.CHAR.VTYPETEXT.NUMBER_MIN_MAX.replace("%min",1).replace("%max",65535):$.su.CHAR.VTYPETEXT.INVALIDTEXT}},{name:"triggerProtocol",mapping:"trigger_protocol",defaultValue:"ALL"},{name:"externalPort",mapping:"external_port",allowBlank:!1,valueType:"string",validator:function(e){var r,t,o,a=e;if(!new RegExp("^(((([0-9]+)|(([0-9])+-([0-9])+)),){0,4}(([0-9]+)|(([0-9])+-([0-9])+)))$").test(a))return $.su.CHAR.VTYPETEXT.INVALIDTEXT;r=a.split(",");for(var n=0;n<r.length;n++){for(var l=n+1;l<r.length;l++)if(r[n]==r[l])return $.su.CHAR.VTYPETEXT.INVALIDTEXT;t=r[n].split("-");for(var p=0;p<t.length;p++)if(o=t[p],parseInt(o,10)<1||65535<parseInt(o,10))return $.su.CHAR.VTYPETEXT.INVALIDTEXT}return!0}},{name:"externalProtocol",mapping:"external_protocol",defaultValue:"ALL"},{name:"enable",defaultValue:"on"}],proxy:{url:$.su.url("/admin/nat?form=pt")}}),$.su.storeManager.define("natWanInterfaceStore",{type:"store",fields:[{name:"name"},{name:"value"},{name:"boxLabel"},{name:"selected"}],proxy:{url:"./data/natWanInterfaceStore.json"}}),$.su.storeManager.define("portTriggeringCommonServicesStore",{type:"store",fields:[{name:"name"},{name:"triggerPort",mapping:"trigger_port"},{name:"triggerProtocol",mapping:"trigger_protocol"},{name:"externalPort",mapping:"external_port"},{name:"externalProtocol",mapping:"external_protocol"}],data:[{name:$.su.CHAR.PORT_TRIGGERING.BATTLE_NET,trigger_port:"6112",trigger_protocol:"ALL",external_port:"6112",external_protocol:"ALL"},{name:$.su.CHAR.PORT_TRIGGERING.DILPAD,trigger_port:"7115",trigger_protocol:"ALL",external_port:"51200-51201,51210",external_protocol:"ALL"},{name:$.su.CHAR.PORT_TRIGGERING.ICU_II,trigger_port:"2019",trigger_protocol:"ALL",external_port:"2000-2038,2050-2051,2069,2085,3010-3030",external_protocol:"ALL"},{name:$.su.CHAR.PORT_TRIGGERING.MSN_GAMING_ZONE,trigger_port:"47624",trigger_protocol:"ALL",external_port:"2300-2400,28800-29000",external_protocol:"ALL"},{name:$.su.CHAR.PORT_TRIGGERING.PC_TO_PHONE,trigger_port:"12053",trigger_protocol:"ALL",external_port:"12120,12122,24150-24220",external_protocol:"ALL"},{name:$.su.CHAR.PORT_TRIGGERING.QUICK_TIME_4,trigger_port:"554",trigger_protocol:"ALL",external_port:"6970-6999",external_protocol:"ALL"},{name:$.su.CHAR.PORT_TRIGGERING.AOE_II_CLIENT,trigger_port:"47624",trigger_protocol:"ALL",external_port:"2300-2400,28800-29000",external_protocol:"ALL"},{name:$.su.CHAR.PORT_TRIGGERING.SUDDEN_STRIKE,trigger_port:"47624",trigger_protocol:"ALL",external_port:"2300-2400",external_protocol:"ALL"},{name:$.su.CHAR.PORT_TRIGGERING.BALDURS_GATE_II,trigger_port:"47624",trigger_protocol:"ALL",external_port:"2300-2400",external_protocol:"ALL"}]}),$.su.storeManager.define("natProtocolStore",{type:"store",fields:[{name:"name"},{name:"value"},{name:"boxLabel"},{name:"selected"}],data:[{name:$.su.CHAR.PORT_TRIGGERING.ALL,value:"ALL",boxLabel:$.su.CHAR.PORT_TRIGGERING.ALL},{name:$.su.CHAR.PORT_TRIGGERING.TCP,value:"TCP",boxLabel:$.su.CHAR.PORT_TRIGGERING.TCP},{name:$.su.CHAR.PORT_TRIGGERING.UDP,value:"UDP",boxLabel:$.su.CHAR.PORT_TRIGGERING.UDP}]});