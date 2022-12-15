 #good for you
 version="22.03.2"
 wget https://downloads.openwrt.org/releases/${version}/targets/ramips/mt7620/openwrt-imagebuilder-${version}-ramips-mt7620.Linux-x86_64.tar.xz
 xz -d openwrt-imagebuilder-${version}-ramips-mt7620.Linux-x86_64.tar.xz
 tar -xvf openwrt-imagebuilder-${version}-ramips-mt7620.Linux-x86_64.tar
 cd openwrt-imagebuilder-${version}-ramips-mt7620.Linux-x86_64
 
 wget https://github.com/TheFunny/openwrt_k2/archive/refs/heads/master.zip -O ./packages/master.zip
 unzip ./packages/master.zip -d ./packages/
 mv ./packages/openwrt_k2-master/* ./packages/
 rmdir /packages/openwrt_k2-master
 rm ./packages/master.zip

 make info
 make image PROFILE=phicomm_k2-v22.4 PACKAGES="ncat uhttpd uhttpd-mod-ubus libiwinfo-lua luci-base luci-mod-admin-full luci-theme-bootstrap smartdns luci-app-smartdns chinadns-ng luci-app-chinadns-ng luci-i18n-chinadns-ng-zh-cn wpad-openssl -wpad-basic-wolfssl -ip6tables -odhcp6c -kmod-ipv6 -kmod-ip6tables -odhcpd-ipv6only" CONFIG_IPV6=n
 #make image PROFILE=lenovo_newifi-y1s PACKAGES="uhttpd uhttpd-mod-ubus libiwinfo-lua luci-base luci-app-firewall luci-proto-ppp luci-mod-admin-full luci-theme-bootstrap wpad-openssl luci-proto-wireguard  luci-app-wireguard curl -wpad-basic-wolfssl -ip6tables -odhcp6c -kmod-ipv6 -kmod-ip6tables -odhcpd-ipv6only" CONFIG_IPV6=n
