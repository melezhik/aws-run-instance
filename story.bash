set -e

subnet=$(config subnet)
image=$(config image)
type=$(config type)
tag_key=$(config tag_key)
tag_value=$(config tag_value)
key=$(config key)

if test -z $key; then
  keyname="";
else
  keyname="--key-name $key";
fi


if test -z $tag_key; then

  echo aws ec2 run-instances --subnet-id $subnet --image-id $image --instance-type $type $keyname ...
  aws ec2 run-instances --subnet-id $subnet --image-id $image --instance-type $type $keyname

else

  echo aws ec2 run-instances --subnet-id $subnet --image-id $image --instance-type $type \
  --tag-specifications 'ResourceType=instance,Tags=[{Key='$tag_key',Value='$tag_value'}]' $keyname ...

  aws ec2 run-instances --subnet-id $subnet --image-id $image --instance-type $type \
  --tag-specifications 'ResourceType=instance,Tags=[{Key='$tag_key',Value='$tag_value'}]' $keyname

fi  



