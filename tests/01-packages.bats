#!/usr/bin/env bash

@test "package 'nginx' should be present" {
  run which nginx
  [ $status -eq 0 ]
}

@test "package 'envsubst' should be present" {
  run which envsubst
  [ $status -eq 0 ]
}

@test "package 'apache2-utils' should be present" {
  test "$( echo $NGINX_VERSION | awk -F'.' '( $1 == 1 && $2 < 13 )')" && skip "Package not installed in this version"
  run which htpasswd
  [ $status -eq 0 ]
}

@test "the module 'ngx_stream_geoip_module' should be present" {
  test "$( echo $NGINX_VERSION | awk -F'.' '( $1 == 1 && $2 < 13 && $3 <= 8)')" && skip "Module not installed in this version"
  run ls /etc/nginx/modules/ngx_stream_geoip_module.so
  [ $status -eq 0 ]
}