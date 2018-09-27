#!/usr/bin/env bash
sudo echo "Alias /print-forms /var/www/print-forms/" > /etc/httpd/conf.d/print_forms_ssl.conf
sudo chown bahmni:bahmni /etc/httpd/conf.d/print_forms_ssl.conf
sudo /etc/init.d/httpd restart
sudo wget -O /tmp/print-forms.zip https://s3.ap-south-1.amazonaws.com/print-forms/artifact/print-froms.zip
unzip -o /tmp/print-forms.zip -d /tmp
sudo rm -rf /opt/bahmni-web/etc/print-forms
sudo mv /tmp/print-forms /opt/bahmni-web/etc/print-forms
sudo rm -rf /tmp/print-forms.zip
sudo ln -s /opt/bahmni-web/etc/print-forms /var/www/print-forms
sudo /etc/init.d/httpd restart
