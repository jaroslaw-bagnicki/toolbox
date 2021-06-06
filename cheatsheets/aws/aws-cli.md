# AWS CLI

## Installation

Download latest package
```
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
```

Extract zip archive
```
unzip awscliv2.zip
```

Install package
```
sudo ./aws/install
```

Verify installation
```
aws --version
```

It's recommend to enable command completition <sup>[src](https://github.com/aws/aws-cli/tree/v2#command-completion)<sup>
```
complete -C aws_completer aws
```

For more detail check [Official AWS CLI v2 official installation guide](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html).  
[AWS CLI v2 Changelog](https://github.com/aws/aws-cli/blob/v2/CHANGELOG.rst).


## AWS Credential configuration

### Setup configuration
To start levarege AWS CLI you need to setup default credentials with command:
```
aws configure
```
AWS CLI prompts you for input:
- Access key ID
- Secret access key
- [AWS Region](aws-regions.md) (e.g. `eu-central-1`)
- Default output format (`json` | `yaml` | `yaml-stream` | `text` | `table` <sup>[src](https://docs.aws.amazon.com/cli/latest/userguide/cli-usage-output-format.html)</sup>)

If you not done it yet, AWS access keys can be generated on user profile in **IAM Management Console**:
![IAM Management Console](https://i.imgur.com/MF6Bm4N.png)

### Using more than on credentials
If you want plan deal with more than one configure set use named profiles.<sup>[src](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-profiles.html)</sup>
```
aws configure --profile <profile-name>
```
To works iwh particular profile in AWS CLI `--profile <profile-name>` extra parameter need to be passed to each command.  
Alternatively, you can use `AWS_PROFILE` variable to set temp profile:
```
export AWS_PROFILE=<profile-name>
```

### Showing configuration
Configuration is store in to file in user home directory: `~/.aws/config` and `~/.aws/credentials`. 
To list current used attached credentials use command:
```
aws configure list
```

### Updating configuration 
To update default/profile configuration use `aws configure` like for configuration setup or use `aws set` to update paricular settings:
```
aws set region us-east-1 --profile jbagnicki
```

### Deleting configuration
To remove credential or profile you have to do it manually by deleting related entries in `~/.aws/config` and `~/.aws/credentials` files.  

### Links
For more deails check [AWS User Guide - Configuring the AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html).
