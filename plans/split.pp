plan d::split(
  String $inp,
  Variant[String[1],RegExp] $sep,
) {

  $res = split( $inp, $sep)
  out::message( $res )
  return $res
}
