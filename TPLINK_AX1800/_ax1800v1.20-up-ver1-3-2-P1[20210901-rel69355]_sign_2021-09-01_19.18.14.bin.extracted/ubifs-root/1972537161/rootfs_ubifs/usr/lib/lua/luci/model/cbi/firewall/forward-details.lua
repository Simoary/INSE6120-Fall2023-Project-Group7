LuaQ               ?     H@  "� A   ��  b� �   ��  �� � �� � �A��A    �ȁ ������ � B H� "� AB �� b ��  �  �A� ȁ �� Ā�����D A @B��� M C���A ��D�C���A # �  ���  BAH� �� �A   ���  BAH �� �  � �� @�� ��A � � ��� B H� "� [ �A �������� ����A�H �� �    �A����A � �BA� � � ��ǎȏ�AH A� �A���H A	 �B �B	 � �A  ƁIA	 ��	 �B 
 � �  [��A�H�
 ��
 �A �A�H �B �A �A�H� �� �A �A�H �B �A �A  D��ƁIA	 �� �B  � �  [�D�ǚD�M�DAN�ƁIA� �� �B  � C HC " �  [�D�G�DП�A � � D����A ������A�!�   ��A ƁIA	 �� �B � � C H " �  [�D�G�DAҟ�A � � D����A ��������!�   ��A ƁIA	 �� �B  � C HC " �  [�D�G�D�ӟ�A � � D���ƁIA	 �� �B  � C HC " �  [��A ��������!  ��A D�G�DAҟ�A � � D���ƁIA	 �� �B � � C H �C W��" �  [�D�ӟƁIA	 �� �B � � �  [�D�ǚDV�DAN�ƁIA	 �B �B � � C H� " �  [�Dן�A ��������!B  ��A ƁIA	 �B �B � � C H� " �  [��A � � D���D؟ƁIAB �� �B � � �  [�D�G���D���A�H� � �A � D��ƁIA	 �� �B � � C H " �A  �  # � i      require 	   luci.sys    luci.dispatcher    luci.tools.firewall    arg 	          Map 	   firewall 
   translate    Firewall - Port Forwards �   This page allows you to change advanced properties of the port 
	           forwarding entry. In most cases there is no need to modify 
			   those settings. 	   redirect 
   build_url     admin/network/firewall/forwards    uci    get    luci    http    name    _name 	       (Unnamed Entry)    title    %s - %s    foreach    zone    section    NamedSection 
   anonymous 
   addremove     opt_enabled    Button 	   opt_name    Value    Name    option    proto 	   Protocol    value    tcp udp    TCP+UDP    tcp    TCP    udp    UDP    icmp    ICMP 	   cfgvalue    src    Source zone 	   nocreate    default    wan 	   template    cbi/firewall_zonelist    DynamicList    src_mac    Source MAC address -   Only match incoming traffic from these MACs.    rmempty 	   datatype    neg(macaddr)    placeholder    any    sys    net 
   mac_hints    src_ip    Source IP address 3   Only match incoming traffic from this IP or range.    neg(ip4addr)    ipv4_hints 	   src_port    Source port d   Only match incoming traffic originating from the given source port or port range on the client host    neg(portrange)    src_dip    External IP address >   Only match incoming traffic directed at the given IP address. 
   src_dport    External port .   Match incoming traffic directed at the given  ,   destination port or port range on this host    dest    Internal zone    lan    dest_ip    Internal IP address D   Redirect matched incoming traffic to the specified 
		internal host    ip4addr 
   dest_port    Internal port L   Redirect matched incoming traffic to the given port on 
		the internal host 
   portrange    Flag    reflection    Enable NAT Loopback    enabled    depends    extra    Extra arguments 8   Passes additional arguments to iptables. Use with care!        -   8    	   @ @ Y@    �@@@ Y    ��  ƀ� H�  � �@� A� ��A@ �  �  � �@  ��# �       network    name    gmatch    %S+    wan                     H   N        A   @@� �   b�  Y   @ ��� @ ���  �  c  # �       Value 	   cfgvalue    tcpudp    tcp udp                     ^   `    
   �   � @  E �  �� _A RA���@ # �       value    %s (%s)                     j   l    
   �   � @  E �  �� _A RA���@ # �       value    %s (%s)                     {   }    
   �   � @  E �  �� _A RA���@ # �       value    %s (%s)                     �   �    
   �   � @  E �  �� _A RA���@ # �       value    %s (%s)                     �   �     	   A   @@� �   b�  Y@    �H�  c  # �       Flag 	   cfgvalue    1                             