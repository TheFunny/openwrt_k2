 #good for you
 version="22.03.2"
 wget https://downloads.openwrt.org/releases/${version}/targets/ramips/mt7620/openwrt-imagebuilder-${version}-ramips-mt7620.Linux-x86_64.tar.xz
 xz -d openwrt-imagebuilder-${version}-ramips-mt7620.Linux-x86_64.tar.xz
 tar -xvf openwrt-imagebuilder-${version}-ramips-mt7620.Linux-x86_64.tar
 cd openwrt-imagebuilder-${version}-ramips-mt7620.Linux-x86_64
 
 wget https://github.com/TheFunny/openwrt_k2/blob/master/chinadns-ng_1.0-beta.25-2_mips_24kc.ipk?raw=true -O ./package/chinadns-ng_1.0-beta.25-2_mips_24kc.ipk
 wget https://github.com/TheFunny/openwrt_k2/blob/master/luci-app-chinadns-ng_1.2-1_all.ipk?raw=true -O ./package/luci-app-chinadns-ng_1.2-1_all.ipk
 wget https://github.com/TheFunny/openwrt_k2/blob/master/luci-i18n-chinadns-ng-zh-cn_1.2-1_all.ipk?raw=true -O ./package/luci-i18n-chinadns-ng-zh-cn_1.2-1_all.ipk
 
 WORKINGDIR="`pwd`/feeds/packages/net/smartdns"
 mkdir $WORKINGDIR -p
 rm $WORKINGDIR/* -fr
 wget https://github.com/pymumu/openwrt-smartdns/archive/master.zip -O $WORKINGDIR/master.zip
 unzip $WORKINGDIR/master.zip -d $WORKINGDIR
 mv $WORKINGDIR/openwrt-smartdns-master/* $WORKINGDIR/
 rmdir $WORKINGDIR/openwrt-smartdns-master
 rm $WORKINGDIR/master.zip

 LUCIBRANCH="master" #更换此变量
 WORKINGDIR="`pwd`/feeds/luci/applications/luci-app-smartdns"
 mkdir $WORKINGDIR -p
 rm $WORKINGDIR/* -fr
 wget https://github.com/pymumu/luci-app-smartdns/archive/${LUCIBRANCH}.zip -O $WORKINGDIR/${LUCIBRANCH}.zip
 unzip $WORKINGDIR/${LUCIBRANCH}.zip -d $WORKINGDIR
 mv $WORKINGDIR/luci-app-smartdns-${LUCIBRANCH}/* $WORKINGDIR/
 rmdir $WORKINGDIR/luci-app-smartdns-${LUCIBRANCH}
 rm $WORKINGDIR/${LUCIBRANCH}.zip

 ./scripts/feeds update -a
 ./scripts/feeds install -a

 make info
 make image PROFILE=phicomm_k2-v22.4 PACKAGES="ncat uhttpd uhttpd-mod-ubus libiwinfo-lua luci-base luci-mod-admin-full luci-theme-bootstrap smartdns luci-app-smartdns chinadns-ng luci-app-chinadns-ng luci-i18n-chinadns-ng-zh-cn wpad-openssl -wpad-basic-wolfssl -ip6tables -odhcp6c -kmod-ipv6 -kmod-ip6tables -odhcpd-ipv6only" CONFIG_IPV6=n
 #make image PROFILE=lenovo_newifi-y1s PACKAGES="uhttpd uhttpd-mod-ubus libiwinfo-lua luci-base luci-app-firewall luci-proto-ppp luci-mod-admin-full luci-theme-bootstrap wpad-openssl luci-proto-wireguard  luci-app-wireguard curl -wpad-basic-wolfssl -ip6tables -odhcp6c -kmod-ipv6 -kmod-ip6tables -odhcpd-ipv6only" CONFIG_IPV6=n
