plan d::facts(
  TargetSpec $target_list,
){
  apply_prep( $target_list )
  get_targets($target_list).map |$t| {
    out::message( $t.host )
    out::message( $t.name )
#    out::message( $t.facts )
    out::message( $t.facts['os'] )
  }
  apply( $target_list ){
    file { '/tmp/foo':
      ensure => file,
      content=> $facts['networking']['hostname'],}}}

