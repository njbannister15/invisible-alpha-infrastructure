# Information

This folder holds everything you need to spin up a production ready, High availibility autoscaling rancher cluster.

1. Run the RDS cloud formation template, make sure you remember the username and password.
2. Run the the rancher master instances template as many times as you need for HA, I would recommend at least 2 in separate AZ's. This will create route53 entries in the hosted zone of you chosing.
3. Run the rancher master elb adding the previously created machines to the elb. This is an https only elb so make sure you have created a certificate https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-request.html. and note the ARN. This creates an A name ALIAS in the hosted zone of your choosing.
4. At this point you should vist the rancher master via the url and set up your login credentials.
5. Now go to __Infrastructure -> Hosts -> Add Host__. We need to find the command to add a custom host because we need the url, it may look like __http://<rancher-server-ip-and-port>/v1/projects/1a5/scripts/<registrationToken>__... record this url.
6. Run the rancher hosts template.
   If you are running a test infrastructure, to save money, add a spot price... this will create an autoscaling group using spot prices witch will be significantly cheaper, but can be terminted if the spot price spikes. 
   I would recomment m4.large or m4.xlarge where the price is 0.10 and 0.20 respectively.

```json
  "AutoscalingGroup": {
      "Type": "AWS::AutoScaling::AutoScalingGroup",
      "Properties": {
        ...
        "SpotPrice" : "String",
        ...
      }
  }
```