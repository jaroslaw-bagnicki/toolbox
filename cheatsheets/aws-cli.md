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
- AWS Region (e.g. `eu-central-1`)
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

## AWS Regions <sup>[src](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html#concepts-available-regions  )<sup>
\# | Continent | Code | Name | Opt-in Status
--- | --- | --- | --- | ---
1 | Europe | eu-central-1 | Europe (Frankfurt) | Not required
2 | Europe | eu-west-1 | Europe (Ireland) | Not required
3 | Europe | eu-west-2 | Europe (London) | Not required
4 | Europe | eu-west-3 | Europe (Paris) | Not required
5 | Europe | eu-north-1 | Europe (Stockholm) | Not required
6 | Europe | eu-south-1 | Europe (Milan) | Required
7 | North America | us-east-1 | US East (N. Virginia) | Not required
8 | North America | us-east-2 | US East (Ohio) | Not required
9 | North America | us-west-1 | US West (N. California) | Not required
10 | North America | us-west-2 | US West (Oregon) | Not required
11 | North America | ca-central-1 | Canada (Central) | Not required
12 | South America | sa-east-1 | South America (São Paulo) | Not required
13 | Asia & Pacific | ap-east-1 | Asia Pacific (Hong Kong) | Required
14 | Asia & Pacific | ap-south-1 | Asia Pacific (Mumbai) | Not required
15 | Asia & Pacific | ap-northeast-3 | Asia Pacific (Osaka) | Not required
16 | Asia & Pacific | ap-northeast-2 | Asia Pacific (Seoul) | Not required
17 | Asia & Pacific | ap-southeast-1 | Asia Pacific (Singapore) | Not required
18 | Asia & Pacific | ap-southeast-2 | Asia Pacific (Sydney) | Not required
19 | Asia & Pacific | ap-northeast-1 | Asia Pacific (Tokyo) | Not required
20 | Asia & Pacific | me-south-1 | Middle East (Bahrain) | Required
21 | Africa | af-south-1 | Africa (Cape Town) | Required


Note: You can also get available regions list by AWS CLI typing: `aws ec2 describe-regions --all-regions`