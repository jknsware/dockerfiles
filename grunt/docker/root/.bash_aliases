##### ls - ls alias configured
#
# Set 'ls' to all, human readable, long format, display helpful info, and color
alias ll='ls -ahlFG'

alias ec2-ips="aws ec2 describe-instances | jq -r '.Reservations[].Instances[] | [.InstanceId, .NetworkInterfaces[].PrivateIpAddress, (.Tags[]|select(.Key==\"Name\")|.Value)]'"

if [ -f /etc/bash_completion ] ; then
  . /etc/bash_completion
fi
