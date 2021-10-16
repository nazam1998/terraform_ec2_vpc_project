# Terraform EC2 Project

## Description

A simple project that deploys a VPC with 2 instances in it with a Nat Gateway for the private Subnet
Be careful, you will probably need to pay a little bit in order to use these resources.
Nat Gateway costs 0.5$ per hour and if you are creating an AWS account for the first time, you will be charged ~1$ the first time, but you will get refund. It is just a security to actually check if you are using an actual card and not some fake thing.

## Components

- VPC
- Internet Gateway
- Nat Gateway
- 2 Route Tables
- 2 Subnets (Private and Public)
- 2 EC2 Instances (one for each subnet)

## Instructions

Before starting, you must install Terraform. It is quite easy, you can look at this link https://learn.hashicorp.com/tutorials/terraform/install-cli . And of course, you will also need an AWS account (https://www.youtube.com/watch?v=v3WLJ_0hnOU)

You first need to provide access keys (https://www.youtube.com/watch?v=JvtmmS9_tfU) in the **providers.tf** file. As mentioned in the introduction project, this is not a good practice in AWS as someone could fetch your keys and use them for himself to access your resources

Then you need to create a KeyPair to access your access instances via SSH and then put the name of the KP in the **ec2.tf** file inside the **key_name** variable (there are two variables, you need to change both).

After that, you need to go to the root directory of the project and type **terraform init**

If everything goes successfully, you can then type **terraform plan**. You will see all the resources that will get created

Then to actually create the resources, you can type **terraform apply**, then you will get prompted to type **yes** so you can check the resources that will get created. It is the same thing as **terraform plan** except that we are actually going to create all the resources after you confirm it.
You can skip this annoying part with this command **terraform apply --auto-approve** instead of the other