#!/bin/bash

restart_service()
{
  [[ -z $1 ]] && echo "ERR: You must supply service name to restart." && exit -1
  service $1 restart
}

update_apache_config()
{
  orig_apache_conf=/etc/apache2/apache2.conf
  unlink $orig_apache_conf
  cp -vf ./locales/apache.conf $orig_apache_conf
  restart_service apache2
}

update_apt_config()
{
  apt_sources_path=/etc/apt/sources.list.d
  apt_conf_name=repos.list
  unlink $apt_sources_path/$apt_conf_name
  cp -v ./apt/$apt_conf_name $apt_sources_path/$apt_conf_name
  apt-get update
}

gen_locales()
{
  locale-gen $(cat ./locales/locale-gen.txt | xargs)
}

update_locales_config()
{
  gen_locales
  orig_locale_conf=/etc/default/locale
  unlink $orig_locale_conf
  cp -vf ./locales/locale $orig_locale_conf
}

update_nginx_config()
{
  nginx_conf_name=nginx.conf
  nginx_conf_path=/etc/nginx
  unlink $nginx_conf_path/$nginx_conf_name
  cp -vf ./nginx/$nginx_conf_name $nginx_conf_path/$nginx_conf_name
  restart_service nginx
}

update_postgresql_config()
{
  pg_version=`psql --verions | grep -ohP -e '\d\.\d'`
  pg_conf_name=postgresql.conf
  pg_conf_path=/etc/postgresql/$pg_version/main
  unlink $pg_conf_path/$pg_conf_name
  cp -vf ./postgresql/$pg_conf_name $pg_conf_path/$pg_conf_name
  restart_service postgresql
}

update_sysctl_config()
{
  sysctl_conf_name='sysctl.conf'
  unlink /etc/$sysctl_conf_name
  cp -vf ./sysctl/$sysctl_conf_name /etc/$sysctl_conf_name
  echo "WARN: You must reboot system to apply [$sysctl_conf_name]";
}

update_configs()
{
  for arg in $@; do
    case $arg in
      apache)
        update_apache_config
      ;;
      apt)
        update_apt_config
      ;;
      locales)
        update_locales_config
      ;;
      nginx)
        update_nginx_config
      ;;
      postgresql)
        update_postgresql_config
      ;;
      sysctl)
        update_sysctl_config
      ;;
    esac
  done
}


update_configs $@