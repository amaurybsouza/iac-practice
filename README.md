# Terraform & Ansible: Deep dive into IaC

Motivated by the LinuxTips docker course, I did a little automation to provision an infrastructure on AWS and then use Ansible to install Docker on an EC2 instance.
now I plan to always provision new resources in the AWS cloud and write more code using Terraform and Ansible with CI/CD.

## Table of Contents
- [Requirements](#requirements)
- [How does it work?](#how-does-it-work)
- [Setup AWS credentials](#setup-aws-credentials)
- Usage
- Contributing

## Requirements

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

## Usage

```python
import foobar

# returns 'words'
foobar.pluralize('word')

# returns 'geese'
foobar.pluralize('goose')

# returns 'phenomenon'
foobar.singularize('phenomena')
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)
