#!/usr/bin/env ruby

puts 'Full Chain'
fullchain = File.read(File.absolute_path(File.join('letsencrypt', 'live', 'bosh-ci.cpi.sapcloud.io', 'fullchain.pem')))
puts fullchain

# echo "Private Key"
# cat letsencrypt/live/bosh-ci.cpi.sapcloud.io/privkey.pem
#
# echo 'Getting LastPass credentials...'
#
# lpass status || not_logged_in=$?
# if [ -z "$not_logged_in" ]; then
#  lpass show --notes 'concourse-master-secrets-aws-store' > store.yml
#
#  cat letsencrypt/live/bosh-ci.cpi.sapcloud.io/fullchain.pem | lpass edit --notes --non-interactive --sync now ''
# else
#   echo "Please login to lastpass"
# fi






