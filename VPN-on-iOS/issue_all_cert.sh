#!/bin/bash

echo "please run as root/sudo!"

### domain and IP address
CN_NAME="idoka.ru"
CN_IP="139.99.47.235"

### non critical info, might be any|informative
CN_ORG="Doka"
CN_COUNTRY="RU"

### 10 years
LIFETIME="3650"

### cert names, setup on your own flavor
CERT_ROOT="strongswan"
CERT_VPN="vpnhost"
CERT_USER="doka"



cd /etc/strongswan

####################
#### Root Cert #####
####################
strongswan pki --gen --type rsa --size 4096 --outform der > ipsec.d/private/${CERT_ROOT}Key.der
chmod 600 ipsec.d/private/${CERT_ROOT}Key.der
strongswan pki --self --ca --lifetime ${LIFETIME} --in ipsec.d/private/${CERT_ROOT}Key.der --type rsa --dn "C=${CN_COUNTRY}, O=${CN_ORG}, CN=Root CA" --outform der > ipsec.d/cacerts/${CERT_ROOT}Cert.der
openssl x509 -inform DER -in ipsec.d/cacerts/${CERT_ROOT}Cert.der -out ipsec.d/cacerts/${CERT_ROOT}Cert.pem -outform PEM
#strongswan pki --print --in ipsec.d/cacerts/${CERT_ROOT}Cert.der


####################
##### For VPN ######
####################
strongswan pki --gen --type rsa --size 2048 --outform der > ipsec.d/private/${CERT_VPN}Key.der
chmod 600 ipsec.d/private/${CERT_VPN}Key.der
strongswan pki --pub --in ipsec.d/private/${CERT_VPN}Key.der --type rsa | strongswan pki --issue --lifetime ${LIFETIME} --cacert ipsec.d/cacerts/${CERT_ROOT}Cert.der --cakey ipsec.d/private/${CERT_ROOT}Key.der --dn "C=${CN_COUNTRY}, O=${CN_ORG}, CN=${CN_NAME}" --san ${CN_NAME} --san ${CN_IP}  --san @${CN_IP} --flag serverAuth --flag ikeIntermediate --outform der > ipsec.d/certs/${CERT_VPN}Cert.der



####################
#### For Users #####
####################
echo "You shoul setup passphrase which use to install cert on your iDevices (empty passphrase doesn't work)"
strongswan pki --gen --type rsa --size 2048 --outform der > ipsec.d/private/${CERT_USER}Key.der
chmod 600 ipsec.d/private/${CERT_USER}Key.der


strongswan pki --pub --in ipsec.d/private/${CERT_USER}Key.der --type rsa | strongswan pki --issue --lifetime ${LIFETIME} --cacert ipsec.d/cacerts/${CERT_ROOT}Cert.der --cakey ipsec.d/private/${CERT_ROOT}Key.der --dn "C=${CN_COUNTRY}, O=${CN_ORG}, CN=${CERT_USER}" --san ${CERT_USER} --outform der > ipsec.d/certs/${CERT_USER}Cert.der

openssl rsa  -inform DER -in ipsec.d/private/${CERT_USER}Key.der -out ipsec.d/private/${CERT_USER}Key.pem -outform PEM
openssl x509 -inform DER -in ipsec.d/certs/${CERT_USER}Cert.der  -out ipsec.d/certs/${CERT_USER}Cert.pem  -outform PEM

openssl pkcs12 -export -inkey ipsec.d/private/${CERT_USER}Key.pem -in ipsec.d/certs/${CERT_USER}Cert.pem -name "${CERT_USER}'s VPN Certificate" -certfile ipsec.d/cacerts/${CERT_ROOT}Cert.pem -caname "Root CA" -out ${CERT_USER}.p12


echo "Now transfer to iDevice files: ${CERT_ROOT}Cert.pem and ${CERT_USER}.p12"
echo "Run to share certs from your webserver:"
echo "======================================="
echo "    cp /etc/strongswan/ipsec.d/cacerts/${CERT_ROOT}Cert.pem  /var/www/myownwebserver/certs"
echo "    cp /etc/strongswan/${CERT_USER}.p12                      /var/www/myownwebserver/certs"
