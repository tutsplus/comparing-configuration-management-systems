for ip in `ls nodes | cut -d'.' -f1-4`; do
  knife solo cook $ip -u vagrant -P vagrant
done
