plan d::write_file(
  TargetSpec $target,
  String[1] $path,
  String $content,
){
  $r=run_command( "echo '${content}' |install -D /dev/stdin ${path}", $target )
  out::message($r)
  return $r
}
