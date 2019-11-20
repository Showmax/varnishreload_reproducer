#!/usr/bin/env bash

VARNISH=varnish61
ls /vagrant

apt-get update
apt-get install -y debian-archive-keyring
apt-get install -y curl gnupg apt-transport-https
curl -L https://packagecloud.io/varnishcache/${VARNISH}/gpgkey | apt-key add -
# apt-get install -y varnish

# cat > /etc/apt/sources.list <<EOF
cat > /etc/apt/sources.list.d/varnishcache_${VARNISH}.list <<EOF
deb https://packagecloud.io/varnishcache/${VARNISH}/debian/ stretch main
deb-src https://packagecloud.io/varnishcache/${VARNISH}/debian/ stretch main
EOF

apt-get update
apt-get install -y varnish

systemctl stop varnish

cp /vagrant/default.vcl /vagrant/fake.vcl /etc/varnish

systemctl start varnish
varnishadm param.set cli_limit 99999999b
