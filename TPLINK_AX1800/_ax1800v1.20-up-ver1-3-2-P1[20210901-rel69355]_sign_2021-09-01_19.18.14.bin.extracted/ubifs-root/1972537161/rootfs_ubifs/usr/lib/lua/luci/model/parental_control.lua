LuaQ               &¨     H@    À@"@  H@ " A   b   ÈÀ ¢ Á   â  HA " A  b  ÈÁ ¢ Á  â  HB " A  b ÂÃ¢ ÀÄâ  ÄHC " H Ã È D H Ä È 
E ÅÅ  H Æ È FÄ H Æ È G H Ç F Ä  ÄÅÅÅ   H Æ F Ä HÆ F Ä  ÄÅÅÅ   H Æ F Ä  Ä  ÄÅÅÅ    Ä  Ä  ÄÅÅÅ  H Æ È  HÇ  ÈG  HÈ FÄ  Ä  ÄÅÀJâ ÂE
 á    ÂÅ
 áE    !    aÆ    ¡   áF !   
 
    aÇ   ¡    áG    !   aÈ ¡ áH      !    	 I
 aÉ   
 
  II
 a	      I	I
 aI       	II
 a       	I	I
 aÉ   II
 a	      I	I
 aI   	      II
 a   	   
  
      I	I
 aÉ   	    II
 a	        I	I
 aI   II
 a   	       I	I
 aÉ   	      II
 a	   I	I
 aI   II
 a   I	I
 aÉ   II
 a	   I	I
 aI       	II
 a            I	 I
 aÉ   	     
  
       I I
 a		       I	¡I
 aI	   	   I¡I
 a	   	   I	¢I
 aÉ	     I¢I
 a	
   I	£I
 aI
     I£I
 a
     I	¤I
 aÉ
        I¤I
 a	      I	¥I
 aI   	  I¥I
 a I	¦I
 aÉ I¦I
 a	   I	§I
 aI     I§I
 a   	   I	¨I
 aÉ   	   I¨I
 a	              I	©#  S      module    luci.model.parental_control    package    seeall    require    ubus    nixio    string 	   luci.sys 
   luci.util    luci.model.uci    luci.tools.debug 
   luci.json    luci.model.tm_clientmgmt    luci.model.nat 	   NAT_INST    cursor    /tmp/tmp-device-config    /proc/pctl/ $   /etc/init.d/parental_control reload    parental_control_v2    /etc/init.d/qos restart & %   /etc/init.d/parental_control restart 1   /etc/init.d/parental_control stop no_stop_device    tyke    categories_list    adult_content 	   gambling    sex_education    prefilter_list    online_communications    social_network    pay_to_surf    media 	   download    games    website_list 	   pre_teen    teen    adult    all 
   Parentctl    class    _print_tbl    old_to_new_params_convert 	   __init__    commit    read_settings    write_settings    get_default_filter    get_default_limit    get_owner_list    insert_owner    update_owner    remove_owner    block_owner    get_insights    get_insight_history    add_clients    filter_website    get_default_website    get_client_list    tmp_read_settings    tmp_write_settings    tmp_get_owner_list    tmp_insert_owner    tmp_remove_owner    tmp_get_time_limit    tmp_set_time_limit    tmp_get_filter    tmp_set_filter    tmp_edit_owner    tmp_get_client_list    tmp_add_client_list    tmp_del_client_list    tmp_get_insights    tmp_get_history    tmp_clear_history    tmp_block_website    tmp_get_default_filter    tmp_get_website    tmp_set_website    tmp_set_clientV2 5       x          A      b @À A     b    Á@Û  AB  b ×A¢A   À ¢ @@  À ¢A ^   û#        type    table    pairs    print     =  	   tostring    _print_tbl                               [       @Û  A  H  ¢ [      @Û  Á  H  ¢ [      AÛ  A ¢  A ¢   #  #        gsub    -        :    match    %w+    upper                                
    @   È@  " @      AÀ     d  c   #        get_profile 
   max_owner    4 	   tonumber                                
    @   È@  " @      AÀ     d  c   #        get_profile    max_dev    8 	   tonumber                                
    @   È@  " @      AÀ     d  c   #        get_profile    max_key    32 	   tonumber                                A   @@À   Û   À b@ #        os    execute    echo f > /proc/pctl/                        °        
   @  À           
   @  È@  !  
   
  "@
      J  b   £  #        foreach    owner        ¤   ¨       [      Ê   Ö Ñ À@  Á@   @ â ÀÀ#     	   	   tonumber 	   owner_id                                 ²   ¼           @
 [  A  ¢    Ö  À @ÈÀ   HÁ  Ý À@@ É ã Ü@þÉ   ã  #        get    website 	    	                       ¾   ê    \      Å     ÇY    B  [ " M@  ÀÀ £  
   A[ Â "B[ ÛB     [ "  @@  À@   BBÛ Â¢Ê  ÀÂÂ H â  J   Û bDÄVQÂÄ Þ  üÀ Y  @ ["     HÂ  Â  CDH Ã"A @CÄ Á ÀÅâ b  @  Âû [ ##     	       type    string    spend_online    website_list    _    find    ^(%d+);(%d+); 	   tonumber    sub 	      gfind    ([^,;]+),(%d+);    website    block 	      os    date    %x 	Q    time                     ì      &      Ç Y      [ " M@@  £    [ "ÀG Ê  ÀÂÀ H â  ÄJ   Û bDV QÂ Þ  ü  @ú£  #  	      type    table    ipairs    gfind    ([^,;]+),(%d+);    website    access_timestamp    block 	                         #    5      E     AA  @ÀÁ  È bYA     Û £AÁ ¢  ÁÁ¢A   BÛ B ¢  Û   Û  ¢  @   Û £ Ê  ÀÁÂ H â Å  Ä CDÀÞA   þÛ   ã#     	       io    open #   /tmp/tm-shn/list_pc_filter_apps.db    r    read    *all    close    find    ^Version: (%d+)
 	   tonumber    gfind    %d+,%d+,%d+,([^,
]+)
    name 	                       %  0    
   H   @    c  @  Û   ¢ À@@ÁÁ  ÀÁB PÀâQÀ   @ýc  #     	       pairs 	      math    pow 	                       2  >    	   E   @    c     È@    HA  Ý À@ Á ÀAÁÂ@ â  Ö ÑAÀDÜ@ýc  #     	    	   	   	      math    floor                     @  N   #   H   @  @Ê     × Á  ¢   Æ AHA â
  AB[ " BÁ  A ÁB"A ÀÊ  À ÃA J    È Áâ@ c  #     	       io    open    r    read    *line 
   h_minutes    h_timestamp    num    match    (%d+) (%d+) (%d+)    close    print    open  	   failed.
                     P  ù          J   F À Ê  A  a     
  b@A     b   Á@
 HB  ÁÛ¢A   AA
 ¢A^  ü#        foreach    owner    ipairs    section 	   owner_id    commit        S  ñ     E      Ç  E    ÈA      D  È    B CÀÿAýÁ@ DA A    D@AA A  ÁA A  ÀB A   AB A  @  Ê  ÖÑÀA#   ÀA ¢   ÀÁA ¢ Á  ÀB ¢   ÀAB ¢ A ÁB @A  ÁCÁ ÎÄ¢Á ÂA  A   Ñ @  Á   ÁCÁÁ ÎÄ¢Á ÂA  A   @   À À	  È     È    Â@À  @ CÃÄ@À À@ CÃÄüAû  È    Á@À  @ ÅÂÄ@À À@ BÀÂÄü  È     È    B@À  @ CÃÄþÁü  È    A@À  @ BÀÂÄþAE @A  ÁCÁ ÎÄ¢Á ÂA  A   Ñ @  Á   ÁCÁA ÎÄ¢Á ÂA  A   @   À @  È    Á@À À@ ÅÂÄ@À  @ BÀÂÄ@À À@ ÅÂÄ@À  @ ÅÂÄù   È    Á@@ À ÅÂÄÅÂÄý ÀÀ¢ D ÀAÆ¢ D ÀÁÆ¢ D ÀÄ¢ D ÀÅ¢ D ÀÅ¢ D ÀAÀ¢ DD ÈD HD ÈD ÈD HD ÈD@A  Ê  ÖÑÀA#  !   	   	   	   	   owner_id    website_type    1    workday_begin    workday_end    weekend_begin    weekend_end 	   tonumber    workday_bedtime    integer    decimal    math    modf 	<         à?	   	    	      weekend_bedtime 	   	   mon_time 	   tue_time 	   	   wed_time 	   	   thu_time 	   fri_time 	   sat_time 	   sun_time                                     û        E   C   E   C  J  F À Ê A  a  
   
  b@#        foreach    owner                [      Ê   Ö Ñ À@  Á@   @ â ÀÀ#     	   	   tonumber 	   owner_id                                 
        J   F À Ê  bY@      È@  £   @Ê ¢@ c  #        commit    Parentctl commit failed. 
   fork_exec                             EÀ     @@
 H    ¢D    AÊ  À Á
 AAH " HÁ  â A H ¢ D   ÀB
 H ¢ D c  #        enable    get 	   settings 	   host_mac    gsub    exec    getfirm MAC    -        
    max_client    get_profile    max_dev                       &          @
 HA    ÀÀ ¢@    À@
 ¢@À  A   @AÊ ¢@ À   @AÊ  ¢@ A ¤  £   #        set 	   settings    enable    commit    on 
   fork_exec    read_settings                     (  5   	   E      Ê   ¢ Å  ÄA @Ä Â@Ä AÄ BADÀ  üc  #        pairs    filter_level    categories_list    prefilter_list    website_list 	                       7  ?      E      ¢ D   ¢ D  ¢ D c  #        profile_len    devices_len    category_len                     A        J   F À Ê  A  b Y@    H     Ê   ÆÀÀJ  á    
 
  
   â@£  #        get_profile    support_pctl_v2_optimize    no    foreach    owner        F        E    @ D  @ D@ D À@  A@ DÁ  DÀÁ    B @B B@ DÀÂ  D ÃC @       D D @       D C @       DD  AÀ DÁ@E D @DÀÁ@E @     D ÀE  AÀ DAF D@DÀAF @     D    B   ÀÀF ¢ D  À G ¢ D   À@G ¢ D  ÀG ¢ D   ÀÀG ¢ D  À H ¢ D   À@H ¢ D  À À ¢ D À	ÀH  A@DAI D J DDÀAI @    @
 D J @    
 DÀJ  A@DAK D L DDÀAK @    @
 D L @    
 D LÀ À ¢ D  Ê  Ö ÑÀÌ@#  4   	   owner_id    key    name    blocked    1    internet_blocked     yes    website_type    2    white    black    black_website_list    website    white_website_list    website_white    website_list    workday_limit    enable_workday_time_limit    workday_daily_time    workday_time    120    weekend_limit    enable_weekend_time_limit    weekend_daily_time    weekend_time 	   sun_time 	   mon_time 	   tue_time 	   wed_time 	   thu_time 	   fri_time 	   sat_time    online_total    workday_bedtime    enable_workday_bed_time    workday_bed_time_begin    workday_begin    workday_bed_time_end    workday_end    1320    420    weekend_bedtime    enable_weekend_bed_time    weekend_bed_time_begin    weekend_begin    weekend_bed_time_end    weekend_end    client_list    get_client_list_by 	                                     *  	 Ð       @
 HA  ¢ @      ÀÀÀ  Á AA @Á@ÁÁ b YA  À Û¢ M@B A  ÁB£  ¢  C É  B ãÊÙA  ÀÅ  Ã Å  ÃÊ  ÆÃJÂ á  
  
 âAÊ â   H BDB  ÀÀ@BB  À BÄ@ QÃ ü  ÀBDÂÀÂÄÂÆE [ âÂÙB   [ c@CÅB@ÅÄ@ Æ  BÆF @ÃÆ Ç@ BÇ  Æ@ÇY  À   BÈ  ÀÖ À @ÈY  À   B@ÃÈÄ@ F  BF@ÉB@ÃÉÄ@ F  BF@ÊBF JÃÊb BJËb BJCËb BJËb BJÃËb BJÌb BJCÌb BÀ@ÌÄ@ Æ  BÆ@CÍB@ÃÍB@ÎÄ@ Æ  BÆ@ÃÎB@CÏBJ  FÏÊÄ @DD b YC   ÈÃ £P ¢ [ Y  @ CP¢C P ¤ £  #  C      get_profile    support_pctl_v2_optimize    no    key    new    luci    json    decode    type    table 
   errorcode    invalid new params 	       owner num exceeds max num limit    foreach    owner 	    	   owner_id    client_list    add_clients    name    internet_blocked    blocked    1    0    yes    website_type    white    2    black_website_list    website    white_website_list    website_white    website_list    enable_workday_time_limit    workday_limit    workday_time    workday_daily_time    enable_weekend_time_limit    weekend_limit    weekend_time    weekend_daily_time 	   sun_time 	   mon_time 	   tue_time 	   wed_time 	   thu_time 	   fri_time 	   sat_time    enable_workday_bed_time    workday_bedtime    workday_begin    workday_bed_time_begin    workday_end    workday_bed_time_end    enable_weekend_bed_time    weekend_bedtime    weekend_begin    weekend_bed_time_begin    weekend_end    weekend_bed_time_end    section    uci section failed    commit    sync_hnat_status    get_owner_list        ­  ±      [      Ê   Ö Ñ À@  Á@   @ â ÀÀ#     	   	   tonumber 	   owner_id                                 ,     À       @
 HA  ¢ @      ÀÀÀ  Á AA @Á@ÁÁ b YA  À Û¢ M@B A  ÁB£   ÀÃÁÀAÃÁÀÃÙ   ÆÁC [âA D ÀAÄÄ@ ÁÄ  ÅÊ  ÆAÅJ CÈ âAÀÁÅÙ  À    Á
  BE ÀCC "B Æ  @V @ Ê  ÆAÅJ CÈ âAÀÁÆÙ  À    ÁÀÇÙ   ÊÀAÇ ÃâA Å   ÃÄ ÇÄG "ÂB    Û£ÀÁÇ È@ Å  ÈÀÉÁÀAÉ È@ E  HÀÊÁ D Ê  BÊâ ÁÊ  Êâ ÁÊ  ÂÊâ ÁÊ  Ëâ ÁÊ  BËâ ÁÊ  Ëâ ÁÊ  ÂËâ ÁÀÀÌ È@ Å  ÈÀÁÌÁÀAÍÁÀÍ È@ Å  ÈÀAÎÁÀÁÎÁÊ  ÆÏJ B ÀC â ÙA   H #ÂO " Û Ù   P $ #  #  A      get_profile    support_pctl_v2_optimize    no    key    new    luci    json    decode    type    table 
   errorcode    invalid new params 	   owner_id    name    internet_blocked    block_owner    yes    website_type    white    2    1    delete    website    black_website_list 	       website_white    white_website_list    website_list    client_list    remove_client_list_for    add_clients    enable_workday_time_limit    workday_limit    0    workday_time    workday_daily_time    enable_weekend_time_limit    weekend_limit    weekend_time    weekend_daily_time 	   sun_time 	   mon_time 	   tue_time 	   wed_time 	   thu_time 	   fri_time 	   sat_time    enable_workday_bed_time    workday_bedtime    workday_begin    workday_bed_time_begin    workday_end    workday_bed_time_end    enable_weekend_bed_time    weekend_bedtime    weekend_begin    weekend_bed_time_begin    weekend_end    weekend_bed_time_end    section    owner    uci section failed    commit    get_owner_list                       ¸       À Ê   À@À â@ Ê  ÆÀJ  â@ Ê  â@ ÆÀ@ â Ù   À
 A"A A  EÁ  DÁAÀ DÂ DA# #  	      key    remove_client_list_for    delete    commit    sync_hnat_status 	      success    index                     »  Î   
       @
 @AÀ   ¢ÀÀÀ MÀ Å    AÀ Ä  ÁÀ  A@ Ä@A  ÄA
  ÁA È  BÀ["A AB $ #  É  ã  #  
   	   get_bool 	   owner_id    blocked    internet_blocked    1    0    section    owner    commit                     Ð  9   æ       @
 HA  ¢ @      Å   Ä@  A @AÁ Û ÁÈ bY   /Á È Â -  Å    FCÂÈ bCÛÄ ¢D Â Ã Ã CDÛ ¢ÇÀÁ@ ÀÃD  ÀEM@Å  [" Û   ÈÃ D  F@Ä  F  M F DÂ "J@DÆ È Å b J@DÄ È bÀÄ H Ä   ÅA
F
Äþ@G ÀÁ Ä  HHD " G 	MH@ ÀHÀÊ  ÆÉ	J E	 Û ¢ È	 â[	ÀÉÊ  ÆÉ	J E	 Û ¢ È
 â	ÂÅ Ê  ÆÉ	J E	 Û ¢ È
 â[	ÀÉÊ  ÆÉ	J E	 Û ¢ ÈÅ
 â	 ÂÅ  ÂÄ AD Ä D  FEÂÈ bCÛ
F ¢ BÆ  ÂE  E Û F ¢ ÅAÄù  DM[¡  "DM@G  @  ÄM["DýÂAÒAÎ¢A @ NÈÁ 
 [  ×¢A Á È Â   BOÅ  ÂAþÄ ã  #  ?      get_profile    support_pctl_v2_optimize    no 	   owner_id    io    open    r 	   	      read    *line 
   h_minutes    h_timestamp    num    match    (%d+) (%d+) (%d+)    spend_online    split      	   	    	   tonumber 	ÿÿÿÿ   0    gsub    ^%s*(.-)%s*$    %1 	      yes 	   per_hour    os    date    %a    Sun    Sat    get 	   tostring    weekend_limit    1    weekend_time    time_limit    workday_limit    workday_time    _    url 
   d_minutes    d_count    d_timestamp !   (%d+) ([^,;]+) (%d+) (%d+) (%d+)    website    block    table    sort 	
      remove    website_list    close    print    open  	   failed.
 	    	   insights        #  #          À@@ ¢ Á    AÀ â K  @    £  #     	   tonumber    spend_online                                 ;  j   x       @
 HA  ¢ @      Å   Ä@  A @AÁ Û ÁÈ bY   Á È Â   ÆBÂH â
 C[Ã "C B Ã C  D@Ã  D  M D CÂ "J@CÄ È Ä b J@Å ÈC bÀÃ H Ã   ÄADÃþÀE@  Ã AC Ã C  FDÂÈ bC	ÛÅ ¢ BE  ÂÄ  Ä  Û Å ¢  ÄA		ùAëÁÈ¢A ÀIÈA	 
 [ 	 ×¢A Ä ã  #  (      get_profile    support_pctl_v2_optimize    no 	   owner_id    io    open    r 	   	      read    *line 
   h_minutes    h_timestamp    num    match    (%d+) (%d+) (%d+)    0    gsub    ^%s*(.-)%s*$    %1    split      	      yes    insightsEntry 	   per_hour    _    url 
   d_minutes    d_count    d_timestamp !   (%d+) ([^,;]+) (%d+) (%d+) (%d+)    website    block    access_timestamp    close    print    open  	   failed.
    history                     l     )    À Á@  ÀÀâ Á  [ "ÀE  AB     ÆBAH Ã â ÆÂâ DÂÀBÂ DÂÀBDÂÀCDÂDÂÊ  ÀÃâÂ ÙB   [ c  @ø	 # #        client_list    os    time    ipairs    mac    gsub    :    -    upper 	   owner_id    name    type    client_type    access_time    set_client_info                          
/      Ê   Æ ÀJ AÀ È  âÁ  VÁ  Á Â@À M@À  Â@@Â@ý Á @AÀ  Á@@À @
  A ÀAÀ   "A MÀA
  B ÀAÀ   [ "A AB $ #  #  
   	   get_list 	   owner_id    website 	      blocked_status    true    delete 	    	   set_list    commit                             E     Ê   âÀ [   c  #                             £      J   @ À d  c   #        get_access_client_list                     ¦  ­      E      Ê   Æ ÀJ A  È  âÀÀ   É   @ É@  É  À A  A ÁA[ " D c  #        get 	   settings    enable    on    result    luci    json    encode                     ¯  ¾   .      Å      A@ @@ÁÀ " J  FÁÊ B H AÀA  B    B bA J  FÂÊ bA@AÀÁ J @ÁÂbA À J @ÁÂ bA E    Á  ÀAÀÀAÃ â DÁc #        luci    json    decode    data    set 	   settings    enable    on    off    commit 
   fork_exec    result    encode                     À     '      À@À ¢ Á    À â Á  E    Å  
  A ÈB !       
     
  "BÁ
 " 
" 
 " £ #     	   tonumber    start_index    amount 	       foreach    owner    owner_list 
   owner_max    filter_website_max    client_per_owner_max    sum        Ô  ø   L   E      Ê     Ê  
 Ñ À  @  À @ ¢ D  À@ AÀ@ ¢ D @  ÀA ¢ D  ÀA @ ¢   À BA  @AÂ@Â" D   DÀBÀ C DÀ À@C Ã Á@   D â DÀ  D@ÄÀD Ã Á@   E â DÀ  D@ÄÊ À@Å @À " â  D 
 J VQAÂA   @B   #     	   owner_id 	   tonumber    name    bin 
   b64encode    internet_blocked    blocked    get_insights 	   insights 	      spend_online 	       filter_level    workday_limit    1    workday_daily_time    workday_time 	ÿÿÿÿ   weekend_limit    weekend_daily_time    weekend_time    get_client_list_by 	   tostring    client_num                                   ³  
       @
 HA  ¢ @      À@Á  À@ÁÀÁ ÁÁ â  ÂÙ@  ÀAA b MÂJ @ÁÂ bA EA  DÃc @ÁÃM Ä@@AÄM Ä@DM ÄÀ@ÁDM Ä @EM Ä@@AEM Ä @Å ÄJ @ÁÂ bA EA  DÃc D Ä@ÁÃD@@AÄD@@DÀÅ H YA    HA D@@ÁDD@@EÀÅ H YA    HA D@@AED@@ÅD@Å     E    Å    A Ä b A@ÂÄ AA Å b A@BÅ AÀ@@  Å ÀA ÂÆ b ÄA@Ç ÄA@BÇ ÄAA Ç b ÄA@ÂÇ ÄA@È ÄA@ÂÃ Ä@@BÄ Ä@ÄÀ@@ Ä   ÄÀJb È ÂBÈÂ ¢B   ÈÂ £ B  À       I
 HC	 ¡  
 
  ¢B¢ Å  	 @ÃÉYC  À@J @YC  À ÄJ DÃE@ H üJ @Ê@CÊÃÃb ÄB@CÄÈ@ ÄF  ÄBF@ÂÄHÀ ÄÆÃÄÄ  ÄBÆÅHÀ ÄÆCÅÄ  ÄBÆÀ@@ÅHÄÅCLÄÅÃLÄÅCMÄÅÃMÄÅCNÄÅÃNÄ CÈÀÃFÈ@ÄFÀGÄÂÀCGÄÂ  ÄBFÀGÈ@ÄÆÀÃGÄÂ ÀHÄÂ   ÄBÆÄÂP¡  Q
 HD	 D ÀÄÉ¢ Û¢ C   Û  ãÆÃQ âC ÊÆÒâC ÀÃÉDÁÀ@ÀÁ ÀCÁÀÒâ Á¤#   c #  K      get_profile    support_pctl_v2_optimize    no    yes    luci    json    decode    data    time_limits    type    table    print    invalid data 
   errorcode    invalid new params    name     internet_blocked    enable_workday_time_limit    workday_daily_time    enable_weekend_time_limit    weekend_daily_time    allow_time_list    1    0 	   tonumber    enable_workday_bed_time    workday_bed_time_begin    workday_bed_time_end    enable_weekend_bed_time    weekend_bed_time_begin    weekend_bed_time_end 	   bed_time 	       owner num exceeds max num limit    foreach    owner 	    	   owner_id    bin 
   b64decode    blocked    workday_limit    workday_time    weekend_limit    weekend_time 	   sun_time 	   mon_time 	   	   tue_time 	   	   wed_time 	   	   thu_time 	   	   fri_time 	   	   sat_time 	      workday_bedtime    workday_begin    workday_end    weekend_bedtime    weekend_begin    weekend_end    filter_level    adult    section 	   tostring    uci section failed    commit    sync_hnat_status    result    encode        P  T      [      Ê   Ö Ñ À@  Á@   @ â ÀÀ#     	   	   tonumber 	   owner_id                                 µ  Ó        Á   À@ÀÀÀ Á@â  [" J  @BÁ bB J FÁÊ  bB    ýÁA "A 
B"A   E  c #  	      luci    json    decode    owner_list    ipairs    remove_client_list_for    delete    commit    sync_hnat_status                     Õ  =   z       @
 HA  ¢ @      À@ÀÁ  À@ÁÀÁ ÁÁ â Ù@  À [" M@B
  BHÁ "A A  AC# [ Û    A ÁÃb  DÛ¢A   AD
H ¡   
      ¢A  ÀEÀÁÄ@Å È ÙA    ÈÁ ÁÀEÀÆÁÀEÀAÆ@Å È ÙA    ÈÁ ÁÀEÀÆÁÀ@ ÀÁFÁ@ÀAGÀÇ@Å È ÙA    ÈÁ ÁÀAGÀÇÁÀAGÀÁÇÁÀAGÀÈ@Å È ÙA    ÈÁ ÁÀAGÀAÈÁÀAGÀÈÁÀ@ Å    BA I[ " Äã   £ #  %      get_profile    support_pctl_v2_optimize    no    yes    luci    json    decode    data    type    table    print    invalid data 
   errorcode    invalid new params 	   tonumber 	   owner_id 
   dumptable    foreach    owner    enable_workday_time_limit    time_limits 	   	       workday_daily_time    enable_weekend_time_limit    weekend_daily_time    allow_time_list    enable_workday_bed_time 	   bed_time    workday_bed_time_begin    workday_bed_time_end    enable_weekend_bed_time    weekend_bed_time_begin    weekend_bed_time_end    result    encode        æ     ~   A   @@ b     E     @È@  ¢@ À@  A@DÁ   À B ¢ DÀD@Â   À B Ù@    È ¢ DÀB  A@DA   ÀC ¢ DÀD@B   ÀC Ù@    È ¢ D  @  DÀ   Á    D â ÀÁ    E â ÀÁ    E â ÀÁ    F â ÀÁ    F â ÀÁ    G â ÀÁ    G â ÀÊ  Ä
   À H  Á@ÁÀÀH À À@I À @ÂÀÀH Ù@    È	 À À@I Ù@    ÈÀ	 À À J  Á@ÁÀÀJ À À@K À @ÂÀÀJ Ù@    È	 À À@K Ù@    ÈÀ	 À Ê  Ä #  /   	   tonumber 	   owner_id    print    workday_limit    1    enable_workday_time_limit    workday_daily_time    workday_time     120    weekend_limit    enable_weekend_time_limit    weekend_daily_time    weekend_time    time_limits    yes 	   	   sun_time 	   	   mon_time 	   	   tue_time 	   	   wed_time 	   	   thu_time 	   	   fri_time 	   	   sat_time    allow_time_list    workday_bedtime    enable_workday_bed_time    workday_bed_time_begin    workday_begin    workday_bed_time_end    workday_end    1320    420    weekend_bedtime    enable_weekend_bed_time    weekend_bed_time_begin    weekend_begin    weekend_bed_time_end    weekend_end 	   bed_time                                 ?  ­   Õ       @
 HA  ¢ @      À@@Á  À@ÁÀÁ ÁÁ â  ÂÙ@  ÀAA b MÂJ @ÁÂ bA EA  DÃc @ÁÃM Ä@AÄM ÄÀ@DM Ä @ÁDM Ä@@EM Ä @AE ÄJ @ÁÂ bA EA  DÃc D Ä@ÁÃD@@DÅ HÁ YA    H D@@ÁDD@@EÅ HÁ YA    H D@@AED@@AÄD@Û    @ÁÃAJ @AÆbA E    Á  Äâ DÁÀÁÄDÁÁ  Åâ DÁÀAÅDÁÀ@ ÀAÄÂA ÀÁ  ÂÆâ ÁÀÇÁÀAÇÁÁ  Çâ ÁÀÁÇÁÀÈÁÀÄ@ÈÀ ÁEÀÁÄÁ  FÀÅ@ÈÀ ÁEÀAÅÁ  FÀ@@ÀAÄÀAÈÁÀAÄÀÊÁÀAÄÀÊÁÀAÄÀËÁÀAÄÀËÁÀAÄÀÌÁÀAÄÀÌÁÀÀÁF@È@ÁÅÀGÁÀAGÁ  ÆÀG@È@ÁEÀÁGÁÀHÁ  FÊ  ÆAÎJ ÁÂ  ÃCâ  â ÙA   H #BO "B   E  À@À BAÂOÛ¢ #   c #  @      get_profile    support_pctl_v2_optimize    no    yes    luci    json    decode    data    time_limits    type    table    print    invalid data 
   errorcode    invalid new params 	   owner_id     allow_time_list    enable_workday_time_limit    workday_daily_time    enable_weekend_time_limit    weekend_daily_time    1    0 
   dumptable 	   tonumber    enable_workday_bed_time    workday_bed_time_begin    workday_bed_time_end    enable_weekend_bed_time    weekend_bed_time_begin    weekend_bed_time_end 	      workday_limit    workday_time    weekend_limit    weekend_time 	   sun_time 	   mon_time 	   	   tue_time 	   	   wed_time 	   	   thu_time 	   	   fri_time 	   	   sat_time 	      workday_bedtime    workday_begin    workday_end    weekend_bedtime    weekend_begin    weekend_end    section    owner 	   tostring    uci section failed    commit    result    encode                     ¯  è   %     À @ A@@@Á  Å    E    A
 HC ¡          ¢BDÂ DDD BBBÛ¢ D ÂBÛ¢B c #     	   owner_id    start_index    amount 	       foreach    owner    sum    filter_website_list    luci    json    encode 
   dumptable        Â  Ø   
.   A   @@ b     	@@   ÀÀ@ À   A@  ÀA Ù@    Å   ÀY   ÀÀ Û  ¢ @Ê
 ÀÊ
 J B  Ê
 BÄÊÑÂÃ  Àú#  	   	   tonumber 	   owner_id    website    filter_level 	       filter_categories_list 	   category    ipairs 	                                   ê     j     À @ A@@ @Á@Y     A
 AB b Â  Û¢A AÖ À Ê  ÆÁÁJ B Û¢ È âAÊ  ÆAÂJ B Û¢ È  âA ÀBÙ   À
  ÂA ÁB â Ã "B
  BB ÁB â Ã ["B @	J  FÃÊ B [" HÂ bBÈA  HB ÝÁ ÖÑBÃ DÜþÖMÀ Ê  ÆÁÁJ B Û¢ ÈÂ âAÊ  ÆAÂJ B Û¢ ÈÂ  âA FÁC bA E    £ #     	   owner_id    start_index 	       filter_level    set 	   tostring    filter_categories_list    delete 	   category 	   set_list    filter_website_list    website 	   get_list 	      new_website    commit                       A   
$     Å    @Ä 
   @ Á@@A@" Ä  @AA" A@ Ä Â  Ä@Â
 B ÈÁ  À[" A   [  cFAC bA E    £ #     	   owner_id    name    bin 
   b64decode 	   tonumber    internet_blocked 	      blocked    1    0    section    owner    uci section failed    commit                     C  i   /     Á    A@â   @@" HÁ    Å   AE    BAÁ  â ¢  ÁÂ  â@À  
  DB B@Â" ÄÄBDÂQÁÂÞ  ûÄÄÁÖÄÁÄAÄAã #     	   tonumber    start_index    amount 	    	   owner_id    get_client_list_by 	   tostring    ipairs    name    bin 
   b64encode 	      sum    client_list                     k     *     Ê   À À â@ Å    A@Ä    Á@ A@AA" A  b@ BBBÀÂÁ¢ D^  ÀýÄ FB ÛbÁYA   Û ãÊ ÀÁÂ
âA Å    # #     
   dumptable 	   owner_id    luci    json    decode    client_list    ipairs    name    bin 
   b64decode    add_clients 
   fork_exec                       °        Á    A@â    Á@ A@AA" Ù      J  @ÁÛ bAJ @ÁÁ bA E    £ #     	   tonumber 	   owner_id    luci    json    decode    clientmac_list    remove_client_list 
   fork_exec                     ²  8   !ü       @
 HA  ¢ @      À@Á  À@ÁÀÁ ÁÁ â Ù@  À [" M@B
  BHÁ "A A  AC#  ÃD  ÁÃ   Ä  À  ÁÃD  ÄD Û    E  ÃÆAD [ â ÄE  Â ÈÂ Ã HÃ À@@%ÃÃ   ÄC  @ Û ¢@Å   @EE	" Ä @ÅE	" Ä F	E    Å  F H F GFA ÇF	Çb ÄEÆýÄÄ [ 
"@À   E  @GEA GEb EV
QGÆD  ÀûÄDFFDÂ  ÀòDDA CAHÛ¢ # ÂÃÀÄ Û ¢ÀÅ   F	E    Å  ÀD  @FE	" Ä @ÆE	" ÄF H F GFA ÇF	Çb ÄEÆýÄÄ [ 
"@ QÇ@ÀE  @GEA GEb EV
QGÆDQCÆCF  ÀúÄDFFDÂ  @ñDÃÃDDADDA CAHÛ¢ #   Û ¢ÀÅ   EE	Ä F	H  Û 
¢ Û
Ç @G	 ÀGEH	 WÖ 
À Û
	 W   ü 
ÀD@ ÄÄIÀ 
È
 ÅÄEFDÂ  @öDDAc #  )      get_profile    support_pctl_v2_optimize    no    yes    luci    json    decode    data    type    table    print    invalid data 
   errorcode    invalid new params 	   owner_id    start_index    amount    get_insights 	   insights 	       ipairs    spend_online 	   tonumber    time_limit    website_list 	   	   	   per_hour    online_time_usage 	
      website    result    encode    sum    [    {"    ",    }    , 	   [{"",0}]    ]                     :  u    >     Á    A@â   @@" A  Á@b  Å    E    ÆBA @Ã@â@AÅ  Ã A bÀ DB	ÄB	 È  ÅÂH EÃÈ Ã	DB	  ÈÄ Ã	AB^  ù[  BÂVB# #     	   tonumber    start_index    amount 	   owner_id 	       get_insight_history    history    [    ipairs 	      {"    website    ",    access_timestamp    }    ,    ]    sum                     w           À @  E  c #     	   owner_id                       °   3     À @ A@E    @
 [B  ¢ÈÁ   HÂ  ÝÀM À ÖÑÂÀ DÜÁýÖÑÁÀDÊ  ÆÁJ B Û¢ ÈB  âAÖMÁ Ê  ÆÁÁJ B Û¢ ÈB  âA ÆB âA Å    # #  	   	   owner_id    website 	   get_list 	      delete 	   tostring 	    	   set_list    commit                     ²  Ê         Å     A    b   Å   ÀÄ ÃÀÄ ÁÄÂ A^   üJ b Ä@Ä@BÄ ã  #        pairs    filter_level    categories_list    prefilter_list    website_list    filter_level_detail 	      filter_website_file_ver    filter_website_file_path #   /tmp/tm-shn/list_pc_filter_apps.db    filter_level_list                     Ì  	          @
 HA  ¢ @      À@ÀÁ  À@ÁÀÁ ÁÁ â Ù@  À [" M@B
  BHÁ "A A  AC# [ Û    A ÁÃb  ÀÄ¢ Á  BÄâ 
  DÛÃ "E    È 
  CE[ "C  [ " À@QÄ@ VQÄÅDÑÂÅ   ýÀ@@
  DÛ "  [ " À@QÄ@ V QÄÅÑÂÅ   ýAÁÀ@ V C
  ÃFÛ "C    C A  A @CÁ@CÈ b C#   CA CH[" ÁHÁH# #  %      get_profile    support_pctl_v2_optimize    no    yes    luci    json    decode    data    type    table    print    invalid data 
   errorcode    invalid new params 	   tonumber 	   owner_id    start_index    amount 	   get_list    website 	    
   dumptable    ipairs 	      website_white    sum 	   cur_mode    get    website_type    1    filter_website_list    filter_website_list_wl    result    encode    filter_level        filter_categories_list                     	  p	   ÿ       @
 HA  ¢ @      À@ÀÁ  À@ÁÀÁ ÁÁ â Ù@  À [" M@B
  BHÁ "A A  AC# [ Û   ÃA @AÁ@ÁÁÃb  Ä@BÄÀ@"ÄÚA   ÈÁ M Å   BE
A  b Ã Û¢B M Æ@ ÀÄÀ@ÁÃB Û ¢ MF   ÂF
[  ¢Ö  [  Ä@ÄBÃþ
  CGÁ  â  "C
  GÁ  â  [ "C "  BG
A  b  ¢BMFÀ  G
A  b  Û¢B @ÁÇB Û ¢ MF   ÂF
[  ¢Ö  [  Ä@ÄBÃþ
  CGÁ  â  "C
  GÁ  â  [ "C   BG
A  b  ¢B MFÀ  G
A  b  Û ¢B @B Û ¢ MF   ÂF
[  ¢Ö  [  Ä@ÄBÃþ
  CGÁ  â  "C
  GÁ  â  [ "C À  BG
A  b  ¢BMF   G
A  b  Û¢B BH ¢B   Å  À@À  CA ÃH[" £   ã #  $      get_profile    support_pctl_v2_optimize    no    yes    luci    json    decode    data    type    table    print    invalid data 
   errorcode    invalid new params 	   owner_id    filter_website_list    start_index    amount 	   cur_mode    1     set 	   tostring    website_type 	   	   tonumber 	    	   get_list    website    delete 	   set_list    filter_website_list_wl    website_white    commit    result    encode                     r	  £	   X      Å   
   @[ "A  AÀ  
  Á@ A@À "   Á   @ÁÁ "   @AÂ " B  Ã @AÃ "   ACMC@  AD" A ACb OÄA @ÀÄÀÄ  Å@Å@Å
 @A@" JFÅÈÁ  HB bYA    H   AFÈ HÂ B@×¢A AAM@  @G GÛ ¢ Û  ÁGÊ ¢A ÁGÊ¢A ã  #      
   dumptable    mac    name    bin 
   b64decode    type    client_type 	   owner_id 	   tonumber    enable_priority 	      prio    on    time_period   àÿÿÿïA
   prio_time    os    time 	  	ÿÿÿÿ   off        get    client_mgmt    other    printf $   [avira debug]: This device type is  
   , mac is     client_type_changed    true    set_client_info 
   fork_exec                             