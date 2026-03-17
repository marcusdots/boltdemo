plan d::read_file(
  TargetSpec $target,
  String[1] $path,
) {
  $r=run_command( "/bin/cat ${path}", $target)
  $val = $r.first.value['stdout']
  out::message( $val )
  return $val
}
