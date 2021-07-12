sudo sed -i '$ d' /entrypoint.sh
/entrypoint.sh
git clone https://github.com/MultiSafepay/shopware6.git /var/www/html/custom/plugins/MltisafeMultiSafepay
tail -f /dev/null