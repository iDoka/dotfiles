# VPN-on-iOS

## obsolete way

I use [leolovenet/install_StrongSwan.sh](https://gist.github.com/leolovenet/5fcc45a7baf1085866acdde820c089c7) to initial setup StrongSwan.

Then, I use [own script]() for generating all keys and certificates.



## frash way

Use `vpnsetup_centos.sh` from [hwdsl2/setup-ipsec-vpn](https://github.com/hwdsl2/setup-ipsec-vpn)



## iOS setup

Note: You should transfer to iDevice both files: *.p12 and CA-certificate (cert.pem).
Otherwise *.p12 will be unsigned/unverifyed.


## references

### EN

* https://raymii.org/s/tutorials/IPSEC_vpn_with_CentOS_7.html
* https://www.vultr.com/docs/using-strongswan-for-ipsec-vpn-on-centos-7

### RU

* https://bogachev.biz/2015/09/29/ustanovka-i-nastroika-ipsec-vpn-servera-s-strongswan-centos-7/
* https://www.digitalocean.com/community/tutorials/how-to-set-up-an-ikev2-vpn-server-with-strongswan-on-ubuntu-18-04-2-ru
