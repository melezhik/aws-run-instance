set -e

subnet=$(config subnet)
image=$(config image)
type=$(config type)
tag_key=$(config tag_key)
tag_value=$(config tag_value)


if test -z $tag_key; then

  echo aws ec2 run-instances --subnet-id $subnet --image-id $image --instance-type $type ...
  aws ec2 run-instances --subnet-id $subnet --image-id $image --instance-type $type

else

  echo aws ec2 run-instances --subnet-id $subnet --image-id $image --instance-type $type \
  --tag-specifications 'ResourceType=instance,Tags=[{Key='$tag_key',Value='$tag_value'}]' ...

  aws ec2 run-instances --subnet-id $subnet --image-id $image --instance-type $type \
  --tag-specifications 'ResourceType=instance,Tags=[{Key='$tag_key',Value='$tag_value'}]'

fi  



