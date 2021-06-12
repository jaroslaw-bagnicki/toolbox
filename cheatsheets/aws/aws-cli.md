# AWS CLI

## Installation

Download latest package
```bash
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
```

Extract zip archive
```bash
unzip awscliv2.zip
```

Install package
```bash
sudo ./aws/install
```

Verify installation
```bash
aws --version
```

It's recommend to enable command completition <sup>[src](https://github.com/aws/aws-cli/tree/v2#command-completion)<sup>
```bash
complete -C aws_completer aws
```

For more detail check [Official AWS CLI v2 official installation guide](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html).  
[AWS CLI v2 Changelog](https://github.com/aws/aws-cli/blob/v2/CHANGELOG.rst).


## AWS Credential configuration

### Setup configuration
To start levarege AWS CLI you need to setup default credentials with command:
```bash
aws configure
```
AWS CLI prompts you for input:
- Access key ID
- Secret access key
- [AWS Region](aws-regions.md) (e.g. `eu-central-1`)
- Default output format (`json` | `yaml` | `yaml-stream` | `text` | `table` <sup>[more](https://docs.aws.amazon.com/cli/latest/userguide/cli-usage-output-format.html)</sup>)

If you not done it yet, AWS access keys can be generated on user profile in **IAM Management Console**:
![IAM Management Console](https://i.imgur.com/MF6Bm4N.png)

### Using more than on credentials
If you want plan deal with more than one configure set use named profiles.<sup>[more](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-profiles.html)</sup>
```bash
aws configure --profile <profile-name>
```
To works iwh particular profile in AWS CLI `--profile <profile-name>` extra parameter need to be passed to each command.  
Alternatively, you can use `AWS_PROFILE` variable to set temp profile:
```bash
export AWS_PROFILE=<profile-name>
```

### Showing configuration
Configuration is store in to file in user home directory: `~/.aws/config` and `~/.aws/credentials`. 
To list current used attached credentials use command:
```bash
aws configure list
```

### Updating configuration 
To update default/profile configuration use `aws configure` like for configuration setup or use `aws set` to update paricular settings:
```bash
aws set region us-east-1 --profile <profile-name>
```

### Deleting configuration
To remove credential or profile you have to do it manually by deleting related entries in `~/.aws/config` and `~/.aws/credentials` files.

### Obtaining temporary credentials for MFA access

Temporary credential for MFA authorization can be obtained from AWS Security Token Service. 
```bash
aws sts get-session-token --serial-number <mfaDeviceArn> --token-code <tokenCode>
```
Command returns `AccessKeyId` (starting with `ASIA...`), `SecretAccessKey`, `SessionToken`, token expiration date (`Expiration`). Credential can be store in env variables or into profile
```bash
export AWS_ACCESS_KEY_ID=<AccessKeyId>
export AWS_SECRET_ACCESS_KEY=<SecretAccessKey>
export AWS_SESSION_TOKEN=<SessionToken>

aws configure set profile.mfaSession.aws_access_key_id <AccessKeyId>
aws configure set profile.mfaSession.aws_secret_access_key <AccessKeyId>
aws configure set profile.mfaSession.aws_session_token <SessionToken>
```


MFA device arn for current user can be retrived by command
```bash
aws iam list-mfa-devices
```


### Links
For more deails check [AWS User Guide - Configuring the AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html).
More about temporary credentials: [AWS User Guide - IAM - GetSessionToken](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_request.html#api_getsessiontoken)
