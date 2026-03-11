
key=workshop_key
pub=${key}.pub
domain=mpopub1.betadots.training

generate_key(){
  rm -f $key $pub || true
  ssh-keygen -t ed25519 -f $key -N "" -C "boltdemo@gaia" >/dev/null
}

copy_key(){
  echo "copying key to"
  find -name $key
  for tgt in "$@"; do
    echo "dollar-at $tgt"
    ssh-copy-id -f -i $key $tgt.$domain
  done
}

dbg_params(){
  for p in "$@"; do
    echo "param $p"
  done
}

debug(){
  env
}

set -x
pwd

generate_key
#copy_key "$@"
echo "debug params"
echo "$@"
#echo "env"
#env
