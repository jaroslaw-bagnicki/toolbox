# Working with STS temporary credentials

To get temporaty credentials use command `aws sts get-session-token` passing as argument MFA device arn and short-lived token code:
```bash
aws sts get-session-token
```

```powershell
Import-Module AWS.Tools.SecurityToken

Get-STSSessionToken -SerialNumber <mfaDeviceSerialNumber> -TokenCode <tokenCode>

# Sample output
AccessKeyId          Expiration          SecretAccessKey                          SessionToken
-----------          ----------          ---------------                          ------------
ASIAVZWZVXVXLFZAQVTF 6/8/2021 7:52:11 PM 39QN2di+VcIvaQdwExwMx4LNBKcqSgQFg82lzxFR FwoGZXIvYXdzEMf//////////wEaDN1wAVvBaH…
```

```powershell
Import-Module AWS.Tools.IdentityManagement

# Get MFA devices for current session user
Get-IAMMFADevice

# Sample output
EnableDate           SerialNumber                            UserName
----------           ------------                            --------
5/29/2021 7:12:07 PM arn:aws:iam::123456789012:mfa/jbagnicki jbagnicki
```