# Terraform & Ansible: The power of automation

Using Terraform to provision a EC2 instance on AWS and Ansible to install Docker

## Table of Contents
- [Requirements](#requirements)
- How does it work?
- Setup AWS credentials
- Usage
- Contributing

## Requirements

- AWS Account 
- Ansible
- Terraform
- AWS CLI
- Linux CLI 

## How does it work?

Basically, the Terraform will create the EC2 instance, a Security Group on AWS Cloud and the Ansible will be invoked via Terraform resources (local-exec) to call Ansible Roles for then install the Docker app on EC2 instance.

## Setup AWS credentials

Use the package manager [pip](https://pip.pypa.io/en/stable/) to install foobar.

```bash
pip install foobar
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
