set -e

subnet=$(config subnet)
image=$(config image)
type=$(config type)
tag_key=$(config tag_key)
tag_value=$(config tag_value)
associate_public_ip=$(config associate_public_ip)

if test -z $key; then
  keyname="";
else
  keyname="--key-name $key";
fi

if test "${associate_public_ip}" = "on"; then
  opts="--associate-public-ip-address";
else
  opts=""
fi


if test -z $tag_key; then

  echo aws ec2 run-instances --subnet-id $subnet --image-id $image --instance-type $type $keyname $opts ...
  aws ec2 run-instances --subnet-id $subnet --image-id $image --instance-type $type $keyname $opts

else

  echo aws ec2 run-instances --subnet-id $subnet --image-id $image --instance-type $type \
  --tag-specifications 'ResourceType=instance,Tags=[{Key='$tag_key',Value='$tag_value'}]' $keyname $opts ...

  aws ec2 run-instances --subnet-id $subnet --image-id $image --instance-type $type \
  --tag-specifications 'ResourceType=instance,Tags=[{Key='$tag_key',Value='$tag_value'}]' $keyname $opts

fi  



