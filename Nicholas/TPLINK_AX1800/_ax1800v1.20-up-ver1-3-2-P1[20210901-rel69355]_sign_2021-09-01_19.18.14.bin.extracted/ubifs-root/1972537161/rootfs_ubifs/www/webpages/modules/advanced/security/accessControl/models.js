$.su.modelManager.define("accessControlEnableM",{type:"model",fields:[{name:"enable"}],proxy:{url:$.su.url("/admin/access_control?form=enable")}}),$.su.modelManager.define("accessControl",{type:"model",fields:[{name:"accessMode",mapping:"access_mode"}],proxy:{url:$.su.url("/admin/access_control?form=mode")}}),$.su.modelManager.define("addAccessControl",{type:"model",fields:[{name:"addDeviceMethod",defaultValue:0},{name:"newMac",vtype:"mac",allowBlank:!1},{name:"name"}]}),$.su.storeManager.define("accessModeStore",{type:"store",fields:[{name:"name"},{name:"value"},{name:"selected"},{name:"boxlabel"},{name:"content"}],data:[{name:"accessMode1",value:"black",selected:!0,boxlabel:$.su.CHAR.ACCESS_CONTROL.BLACKLIST,content:"<span>"+$.su.CHAR.ACCESS_CONTROL.BLACKLIST_INTRODUCTION+"</span>"},{name:"accessMode2",value:"white",boxlabel:$.su.CHAR.ACCESS_CONTROL.WHITELIST,content:"<span>"+$.su.CHAR.ACCESS_CONTROL.WHITELIST_INTRODUCTION+"</span>"}]}),$.su.storeManager.define("addDeviceStore",{type:"store",fields:[{name:"name"},{name:"value"},{name:"boxlabel"},{name:"selected"}],data:[{name:"addDeviceMethod",value:0,selected:!0,boxlabel:$.su.CHAR.ACCESS_CONTROL.SELECT_FROM_DEVICE_LIST},{name:"addDeviceMethod",value:1,boxlabel:$.su.CHAR.ACCESS_CONTROL.ADD_MANUALLY}]}),$.su.storeManager.define("blacklistGridStore",{type:"store",fields:[{name:"deviceType"},{name:"name",mapping:"name"},{name:"mac"},{name:"host"}],proxy:{url:$.su.url("/admin/access_control?form=black_list")}}),$.su.storeManager.define("whitelistGridStore",{type:"store",fields:[{name:"deviceType"},{name:"name",mapping:"name"},{name:"mac"},{name:"host"}],proxy:{url:$.su.url("/admin/access_control?form=white_list")}}),$.su.storeManager.define("blacklistOnlineStore",{type:"store",fields:[{name:"deviceType"},{name:"name"},{name:"mac"},{name:"ipaddr"},{name:"host"},{name:"conn_type",mapping:"conn_type"},{name:"success"}],proxy:{url:$.su.url("/admin/access_control?form=black_devices")}}),$.su.storeManager.define("whitelistOnlineStore",{type:"store",fields:[{name:"deviceType"},{name:"name"},{name:"mac"},{name:"ipaddr"},{name:"host"},{name:"conn_type",mapping:"conn_type"},{name:"success"}],proxy:{url:$.su.url("/admin/access_control?form=white_devices")}});