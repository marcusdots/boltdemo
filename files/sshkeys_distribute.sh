
key=workshop_key
pub=${key}.pub

generate_key(){
  rm -f $key $pub || true
  ssh-keygen -t ed25519 -f $key -N "" >/dev/null
}

copy_key(){
  echo "copying key to"
  find -name $key
  for tgt in "$@"; do
    echo "dollar-at $tgt"
    echo ssh-copy-id -i $key $tgt
  done
}

debug(){
  env
}

set -x
pwd

generate_key
copy_key "$@"
echo "debug params"
echo "$@"
#echo "env"
#env
