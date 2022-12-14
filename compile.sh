 #good for you
 version="22.03.2"
 wget https://downloads.openwrt.org/releases/${version}/targets/ramips/mt7620/openwrt-imagebuilder-${version}-ramips-mt7620.Linux-x86_64.tar.xz
 xz -d openwrt-imagebuilder-${version}-ramips-mt7620.Linux-x86_64.tar.xz
 tar -xvf openwrt-imagebuilder-${version}-ramips-mt7620.Linux-x86_64.tar
 cd openwrt-imagebuilder-${version}-ramips-mt7620.Linux-x86_64
 #git clone https://github.com/NagaseKouichi/openwrt-chinadns-ng.git packages/chinadns-ng
 #git clone -b luci https://github.com/NagaseKouichi/openwrt-chinadns-ng.git packages/luci-app-chinadns-ng
 
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
 
 WORKINGDIR="`pwd`/feeds/packages/net/chinadns-ng"
 mkdir $WORKINGDIR -p
 rm $WORKINGDIR/* -fr
 wget https://github.com/NagaseKouichi/openwrt-chinadns-ng/archive/master.zip -O $WORKINGDIR/master.zip
 unzip $WORKINGDIR/master.zip -d $WORKINGDIR
 mv $WORKINGDIR/openwrt-chinadns-ng-master/* $WORKINGDIR/
 rmdir $WORKINGDIR/openwrt-chinadns-ng
 rm $WORKINGDIR/master.zip
 
 WORKINGDIR="`pwd`/feeds/luci/applications/luci-app-chinadns-ng"
 mkdir $WORKINGDIR -p
 rm $WORKINGDIR/* -fr
 wget https://github.com/NagaseKouichi/openwrt-chinadns-ng/archive/luci.zip -O $WORKINGDIR/luci.zip
 unzip $WORKINGDIR/luci.zip -d $WORKINGDIR
 mv $WORKINGDIR/openwrt-chinadns-ng-luci/* $WORKINGDIR/
 rmdir $WORKINGDIR/openwrt-chinadns-ng-luci
 rm $WORKINGDIR/luci.zip

 ./scripts/feeds update -a
 ./scripts/feeds install -a

 make info
 make image PROFILE=phicomm_k2-v22.4 PACKAGES="ncat uhttpd uhttpd-mod-ubus libiwinfo-lua luci-base luci-mod-admin-full luci-theme-bootstrap smartdns luci-app-smartdns chinadns-ng luci-app-chinadns-ng wpad-openssl -wpad-basic-wolfssl -ip6tables -odhcp6c -kmod-ipv6 -kmod-ip6tables -odhcpd-ipv6only" CONFIG_IPV6=n
 #make image PROFILE=lenovo_newifi-y1s PACKAGES="uhttpd uhttpd-mod-ubus libiwinfo-lua luci-base luci-app-firewall luci-proto-ppp luci-mod-admin-full luci-theme-bootstrap wpad-openssl luci-proto-wireguard  luci-app-wireguard curl -wpad-basic-wolfssl -ip6tables -odhcp6c -kmod-ipv6 -kmod-ip6tables -odhcpd-ipv6only" CONFIG_IPV6=n
