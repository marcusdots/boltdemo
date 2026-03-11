# This is the structure of a simple plan. To learn more about writing
# Puppet plans, see the documentation: http://pup.pt/bolt-puppet-plans

# The summary sets the description of the plan that will appear
# in 'bolt plan show' output. Bolt uses puppet-strings to parse the
# summary and parameters from the plan.
# @summary A plan created with bolt plan new.
# @param targets The targets to run on.
plan d::sshkey_distribute (
  TargetSpec $targets = "localhost",
  $remote_targets = get_targets( 'all' ) - get_targets('localhost'),
) {
  $remote_fqdn = get_targets('all').map |$t| { $t.uri}
#  $remote_fqdn = get_targets('all').name
  out::message("remote fqdns")
  out::message( $remote_fqdn )
  out::message("Hello from d::sshkey_distribute")
#  out::message("# targets=")
#  out::message( run_command('hostname -f', $targets) )
#  $command_result = run_command('hostname -f', $remote_targets)
#  out::message( $command_result )

  out::message( 'foo' )
  out::message( [$targets].flatten )

  $rs = run_script( 'd/sshkeys_distribute.sh', 'localhost', { arguments => [$remote_targets].flatten } )
#  $pubkey = file::read( 'workshop_key.pub')
  out::message( $rs )
#  out::message( $pubkey )
  return $rs
}
