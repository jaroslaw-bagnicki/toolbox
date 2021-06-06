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

For more detail check [AWS CLI v2 official installation guide](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html).  
[AWS CLI v2 Changelog](https://github.com/aws/aws-cli/blob/v2/CHANGELOG.rst).


## Credential configuration
TODO

## AWS Regions
# | Continent | Code | Name | Opt-in Status
--- | --- | --- | --- | ---
1 | Europe | eu-central-1 | Europe (Frankfurt) | Not required
2 | Europe | eu-west-1 | Europe (Ireland) | Not required
3 | Europe | eu-west-2 | Europe (London) | Not required
4 | Europe | eu-south-1 | Europe (Milan) | Required
5 | Europe | eu-west-3 | Europe (Paris) | Not required
6 | Europe | eu-north-1 | Europe (Stockholm) | Not required
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

**TODO**  
[ ] Supplement China and US-Gov regions.  
[ ] Add info about AZs.

Source: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html#concepts-available-regions  
Regions and Availability Zones: https://aws.amazon.com/about-aws/global-infrastructure/regions_az/