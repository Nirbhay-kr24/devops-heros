# AWS IAM - Governance

AWS Identity and Access Management (IAM) controls **who** can access AWS resources and **what** they can do. IAM is a global service used to manage identities, authentication, and authorization across AWS.

## Core concepts

### Users

An IAM user represents a person or application that needs long-term credentials in an AWS account. A user can have a password for AWS Console access and access keys for programmatic access.

For human users, prefer federated identities and temporary credentials where possible. If access keys are required, rotate them, monitor their use, and never commit them to source control.

### Groups

An IAM group is a collection of users. Policies attached to a group apply to its members, making groups useful for job functions such as `Developers`, `Auditors`, or `ReadOnlyUsers`.

Groups simplify permission management by allowing common permissions to be assigned once instead of separately to every user.

### Roles

An IAM role is an identity with permissions that can be assumed to receive temporary credentials.

A role has:

- **Trust policy** — defines who or what can assume the role.
- **Permissions policies** — define what the role can do.

Roles are commonly used by EC2 instances, Lambda functions, containers, CI/CD systems, and federated users so they do not need long-term access keys.

### Policies

IAM policies are JSON documents that define permissions.

Example:

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": ["s3:GetObject"],
      "Resource": "arn:aws:s3:::example-bucket/reports/*"
    }
  ]
}
```

Important policy elements:

| Element | Purpose |
| --- | --- |
| `Effect` | Specifies `Allow` or `Deny` |
| `Action` | Specifies AWS API operations |
| `Resource` | Specifies the resources affected |
| `Principal` | Specifies who or what is granted access |
| `Condition` | Adds additional access requirements |

Policies can be identity-based or resource-based. Other policy mechanisms include permissions boundaries, session policies, and AWS Organizations SCPs.

An explicit `Deny` overrides an `Allow`.

### Permissions and Least Privilege

Permissions define which actions an identity can perform on AWS resources.

**Least privilege** means granting only the permissions required for a specific task.

For example, instead of:

```text
Action: "*"
Resource: "*"
```

grant only the required actions and resources, such as:

```text
s3:GetObject
```

on a specific S3 bucket.

Least privilege reduces security risks and limits the impact of compromised credentials.

## IAM best practices

1. Use IAM Identity Center or federation for human users where possible.
2. Enable MFA, especially for the root user and privileged identities.
3. Do not use the root user for everyday tasks.
4. Use IAM roles and temporary credentials for applications and CI/CD.
5. Follow the principle of least privilege.
6. Avoid sharing IAM users or credentials.
7. Rotate or remove unused access keys.
8. Never commit AWS credentials to source control.
9. Regularly review IAM policies and permissions.
10. Use CloudTrail and IAM Access Analyzer to monitor and review access.

## Common use cases

- Providing developers with controlled access to AWS resources.
- Allowing Lambda functions to access S3 or DynamoDB.
- Allowing EC2 instances to access AWS services without storing credentials.
- Giving CI/CD pipelines permissions to deploy applications.
- Providing temporary access to AWS resources.
- Managing access across multiple AWS accounts.

## Useful distinction

**Authentication** answers: **"Who are you?"**

**Authorization** answers: **"What are you allowed to do?"**

IAM primarily handles identity and authorization. Network controls such as security groups and encryption services such as AWS KMS provide additional layers of security.

## Further reading

- [AWS IAM User Guide](https://docs.aws.amazon.com/IAM/latest/UserGuide/)
- [IAM Policy Elements](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements.html)
- [IAM Best Practices](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html)
```
