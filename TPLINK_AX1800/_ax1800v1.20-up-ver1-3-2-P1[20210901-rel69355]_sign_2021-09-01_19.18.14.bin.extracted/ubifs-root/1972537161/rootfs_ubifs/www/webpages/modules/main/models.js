$.su.define("firmwareProxy",{extend:"IPFProxy",url:$.su.url("/admin/firmware?form=upgrade"),preventFailEvent:!0,preventErrorEvent:!0,readFilter:function(e){return{isDefault:e.data&&e.data.is_default,upgraded:e.data&&e.data.upgraded,rebootTime:e.data&&e.data.totaltime}}}),$.su.define("checkUpgradeNumberProxy",{extend:"IPFProxy",url:$.su.url("/admin/cloud_account?form=check_upgrade"),preventSuccessEvent:!0,preventFailEvent:!0,preventErrorEvent:!0,readFilter:function(e){return{updateNumber:e.data.update_number}},writeFilter:function(e){return $.extend({operation:"read"},e)}}),$.su.define("checkInternetProxy",{extend:"IPFProxy",url:$.su.url("/admin/cloud_account?form=check_internet"),preventSuccessEvent:!0,preventFailEvent:!0,preventErrorEvent:!0,writeFilter:function(e){return $.extend({operation:"read"},e)}}),$.su.define("checkRouterProxy",{extend:"IPFProxy",url:$.su.url("/admin/quick_setup?form=check_router"),preventFailEvent:!0,writeFilter:function(e){return $.extend({operation:"read"},e)}}),$.su.define("autoUpgradeReadProxy",{extend:"IPFProxy",preventFailEvent:!0,preventSuccessEvent:!0,preventErrorEvent:!0,url:$.su.url("/admin/cloud_account?form=auto_update_remind")}),$.su.define("upgradeReadProxy",{extend:"IPFProxy",preventFailEvent:!0,preventSuccessEvent:!0,preventErrorEvent:!0,url:$.su.url("/admin/cloud_account?form=remind")}),$.su.define("cloudBindStatusProxy",{extend:"IPFProxy",preventFailEvent:!0,preventSuccessEvent:!0,preventErrorEvent:!0,url:$.su.url("/admin/cloud_account?form=cloud_bind_status")});