@test "package 'nginx' should be present" {
  run which nginx
  [ $status -eq 0 ]
}

@test "package 'envsubst' should be present" {
  run which envsubst
  [ $status -eq 0 ]
}

@test "package 'apache2-utils' should be present" {
  test $(bc <<< "$VERSION >= 1.13") -eq 0 && skip "Package not installed in this version"
  run which htpasswd
  [ $status -eq 0 ]
}