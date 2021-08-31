# Terraform & Ansible: Deep dive into IaC

Motivated by the Docker course from @LINUXtips, I did a bit automation to provision an infrastructure as Code on AWS and then use Ansible to install Docker on an EC2 instance.
My plan is provision new resources on the AWS Cloud and write code using Terraform and Ansible with CI/CD tools to help all professionals who are starting their DevOps journey.

## `Table of Contents`
- [Requirements](#requirements)
- [How does it work?](#how-does-it-work)
- [Setup AWS credentials](#setup-aws-credentials)
- [Create a AWS Key pairs](#create-a-AWS-Key-pairs)
- [Create the Terraform files](#create-the-terraform-files)
- [Terraform CLI Usage](#terraform-cli-usage)
- [Contributing](#contributing)

## `Requirements`

- AWS Account 
- Ansible
- Terraform
- AWS CLI
- Linux CLI 

## How does it work?

Basically, the Terraform will create some resources on AWS, such as, EC2, SG and the Ansible will be invoked via Terraform resources (local-exec) to call Ansible Roles for then to install the Docker app on EC2 instance.

## Setup AWS credentials

Use the AWS Documentation to setup your AWS Credentials, basically you have some ways to do this, for example via credentials file or environment variables:

- In my case I used the ```~/.aws/credentials``` file to create my credentials:

```
[default]
aws_access_key_id=AKIAIOSFODNN7EXAMPLE
aws_secret_access_key=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
```

## Create a AWS Key pairs

Now you can create your Key pairs on AWS following the AWS Documentation below:

- [Create AWS Key pairs](https://docs.aws.amazon.com/pt_br/AWSEC2/latest/UserGuide/ec2-key-pairs.html)

Remember you can create a Terraform resource to provision automatically:

```
resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD3F6tyPEFEzV0LX3X8BsXdMsQz1x2cEikKDEY0aIj41qgxMCP/iteneqXSIFZBp5vizPvaoIR3Um9xK7PGoW8giupGn+EPuxIA4cDM4vzOqOkiMPhz5XK0whEjkVzTo4+S0puvDZuwIsdiW9mxhJc7tgBNL0cYlWSYVkz4G/fslNfRPW5mYAM49f4fhtxPb5ok4Q2Lg9dPKVHO/Bgeu5woMc7RY0p1ej6D4CKFE6lymSDJpW0YHX/wqE9+cfEauh7xZcG0q9t2ta6F6fmX0agvpFyZo8aFbXeUBr7osSCJNgvavWbM/06niWrOvYX2xwWdhXmXSrbX8ZbabVohBK41 email@example.com"
}
```

## Defining the Ansible Roles

It's the time to create the Ansible Roles:

```yml
$ ansible-galaxy init docker
```

## Create the Terraform files

According to the best practices from the Terraform documentation, is necessary create several files ".tf" to keep the environment working fine, the Terraform will read all files ".tf" and will provision on the AWS Cloud.

- provider.tf
- securityGroups.tf
- ec2Intance.tf

## Terraform CLI Usage

Main commands:

```
  init          Prepare your working directory for other commands
  validate      Check whether the configuration is valid
  plan          Show changes required by the current configuration
  apply         Create or update infrastructure
  destroy       Destroy previously-created infrastructure
```

Execute these commands after get completed before steps:

```
$ terraform init
$ terraform plan
$ terraform apply
$ terraform dstroy
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)
