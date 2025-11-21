## Static IP
In order for Pi-hole and NPM to work properly, the Pi must have a static IP address. Follow this guide:
[Tom's Hardware Guide](https://www.tomshardware.com/how-to/static-ip-raspberry-pi)

## UFW Firewall
Only allow necessary ports

## Self-Signed SSL Certificate
To use HTTPS, a SSL certificate must be set up in Nginx Proxy Manager (NPM). NPM uses Let'sEncrypt, which requires a registered domain name. These services are intended only for private use, so a paid domain is not needed. Instead, a self-signed certificate is sufficient.

To generate a certificate, run:
```
sudo openssl req -x509 -sha256 -nodes -newkey rsa:2048 -days 365 -keyout homeserver.key -out homeserver.crt
```
This certificate can be added to NPM so that services can use HTTPS. **NOTE**: when using a self-signed certificate, the traffic will be encrypted, but clients who don't have the signing CA will flag the traffic as untrusted HTTP.

## Nextcloud Trusted Domains
For Nextcloud to work with the custom domain from NPM/Pi-hole, it must be configured to trust the domain. This can't be done in the web GUI, so we must modify the config.php ourselves. To do this, run these commands:
```
docker exec -it nextcloud bash
php occ config:system:set trusted_domains 1 --value=nextcloud.lan
exit
docker exec nextcloud php -r 'opcache_reset();'
```