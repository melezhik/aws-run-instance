set -e

subnet=$(config subnet)
image=$(config image)
type=$(config type)

echo aws ec2 run-instances --subnet-id $subnet --image-id $image --instance-type $type ...

aws ec2 run-instances --subnet-id $subnet --image-id $image --instance-type $type
