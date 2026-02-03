# Terraform CI with OPA Conftest and Infracost

This repository demonstrates a CI pipeline for Terraform using GitHub Actions, OPA Conftest for policy enforcement, and Infracost for cost estimation.

## Structure

```
policy/
  ec2_instance_type.rego   # OPA policy for EC2 instance types
terraform/
  main.tf                  # Terraform configuration
  providers.tf             # Terraform providers
.github/
  workflows/
    ci.yml                 # GitHub Actions workflow
```

## Features
- **Terraform CI**: Runs `terraform init`, `validate`, and `plan`.
- **OPA Conftest**: (Optional, uncomment in workflow) Enforces policies on Terraform plans using Rego policies in the `policy/` directory.
- **Infracost**: Estimates and comments on infrastructure cost in pull requests.
- **AWS Credentials**: Uses GitHub secrets for AWS authentication.

## GitHub Actions Workflow
- Checks out code
- Sets up Terraform
- Configures AWS credentials
- Runs Terraform commands
- Installs and runs Conftest (for OPA policy checks)
- Installs and runs Infracost for cost estimation
- Posts cost breakdown as a PR comment

## Usage
1. **Configure Secrets**: Add the following secrets to your GitHub repository:
   - `AWS_ACCESS_KEY_ID`
   - `AWS_SECRET_ACCESS_KEY`
   - `INFRACOST_API_KEY`
   - `GITHUB_TOKEN` (automatically provided by GitHub)

2. **Policies**: Place your OPA Rego policies in the `policy/` directory.

3. **Terraform Code**: Place your Terraform code in the `terraform/` directory.

4. **Workflow Triggers**: Uncomment the `on:` section in `.github/workflows/ci.yml` to enable workflow on push or pull request to `main`.

## Example Policy (Rego)
See `policy/ec2_instance_type.rego` for an example OPA policy.

## Notes
- The OPA Conftest step is commented out by default. Uncomment it in the workflow to enforce policies.
- The workflow is set up for AWS and Infracost integration. Adjust as needed for your environment.

## References
- [Terraform](https://www.terraform.io/)
- [OPA Conftest](https://www.conftest.dev/)
- [Infracost](https://www.infracost.io/)
- [GitHub Actions](https://docs.github.com/en/actions)
