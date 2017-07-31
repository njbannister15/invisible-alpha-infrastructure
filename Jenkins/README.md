# Information
After this is spun up you want to attach and ebs volume to this instance and mount it to jenkins home.
So that we can move jenkins around if we need too.

The default location is __/var/lib/jenkins__.

in general the step are here
See: http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-using-volumes.html


and make sure you update /etc/fstab and chown ownershipp of jenkins home.
eg
```
sudo su
mount /dev/xvdf /var/lib/jenkins
cp /etc/fstab /etc/fstab.orig
echo '/dev/xvdf /var/lib/jenkins ext4 defaults,nofail 0 2' >> /etc/fstab
chown -R jenkins:jenkins /var/lib/jenkins
service jenkins restart 
reboot
exit
```
