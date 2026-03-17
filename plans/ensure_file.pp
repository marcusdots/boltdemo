plan d::ensure_file(
  TargetSpec $target,
  String[1] $path,
  String $content,
){

  apply( $target) {
   class { 'stdlib::manage':
     create_resources => {
       file => {
         $path => {
            content => $content, }}}}}


#  apply( $target ) {
#    include stdlib
#    class { 'stdlib::manage':
#      'create_ressources' => {
#         'file' => {
#           $path => {
#              'content' => $content,
#           }
#         }
#      }
#    }
#

}
