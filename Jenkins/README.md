# Information
After this is spun up you want to attach and ebs volume to this instance and mount it to jenkins home, the location is __/var/lib/jenkins__ on the host.

In general the step are here
See: http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-using-volumes.html

Below are the commands that _should_ work

eg
```sh
sudo su
service jenkins stop
mount /dev/xvdf /var/lib/jenkins
cp /etc/fstab /etc/fstab.orig
echo '/dev/xvdf /var/lib/jenkins ext4 defaults,nofail 0 2' >> /etc/fstab #update fstab so it mounts on restart
chown -R jenkins:jenkins /var/lib/jenkins
service jenkins start 
reboot
exit
```


upon complete of this template a route53 entry is made into the hosted zone of your choice.