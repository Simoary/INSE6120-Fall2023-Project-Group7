!function(e){e.su.storeManager.define("oneMeshClientsStore",{type:"store",fields:[{name:"name"},{name:"model"},{name:"deviceType",mapping:"device_type",convert:function(e){return-1<e.indexOf("Range")||-1<e.indexOf("deco")?e.toLowerCase():"router"}},{name:"mac"},{name:"location"},{name:"status"}],proxy:{url:e.su.url("/admin/onemesh_network?form=mesh_sclient_list_all")}})}(jQuery);