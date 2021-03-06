# Wordpress deployment in AWS with RDS mysql

![arch](wordpress.png)
## Pre-requisites:
* Make sure you have terraform installed
* Make sure you have the aws cli and it's set up
* This terraform template will install the following:
    * VPC
    * 4 subnets: 2 private, 2 public
    * 1 internet gateway and 1 NAT in one of the public subnets
    * 2 route tables
        * 1 private, with default route pointint to the NAT gw
        * 1 public, with default route pointint to the igw
    * RDS subnet group with the 2 private subnets
    * RDS DB in the above VPC and subnet group

## Instructions:
After deploying the terraform infra:

* Create an Elastic Beanstalk app from the AWS console
* Choose a docker app, then upload the `Dockerrun.aws.js` file (this will deploy wordpress in the container)
* Under your configuration:
    * choose to put this in the VPC you created, public subnets
    * add envoronment variables in the `.env` file with the appropriate values. This will automatically link the DB to the wordpress deployment
