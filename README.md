# learn-terraform
Learn terraform repository
---

# Terraform README

This repository contains Terraform code for managing infrastructure. Below are the instructions for setting up and using the code.

## Prerequisites

- Terraform installed on your machine. You can download it from [here](https://www.terraform.io/downloads.html).
- An account for the relevant cloud provider with appropriate permissions.

## Setup

1. Clone this repository to your local machine:

    ```bash
    git clone <repository-url>
    ```

2. Navigate to the directory:

    ```bash
    cd <repository-directory>
    ```

3. Initialize Terraform:

    ```bash
    terraform init
    ```

## Configuration

### `main.tf`

- This file contains the main configuration for the infrastructure resources.
- Modify this file to define the resources you want to create, such as compute instances, storage buckets, or networking components.
- Make sure to set the correct provider configuration for your chosen cloud provider.

### `variables.tf`

- This file defines input variables that can be customized when running Terraform commands.
- Update the variables as needed to match your specific requirements.

### `terraform.tfvars`

- This file is used to set values for the input variables defined in `variables.tf`.
- Provide values for the variables specific to your environment in this file.
- **Note:** Ensure not to commit sensitive information such as access keys or passwords into version control.

### `terraform.tfstate`

- This file stores the current state of your infrastructure managed by Terraform.
- It should not be modified manually, as it is managed by Terraform itself.

### `.terraform.lock.hcl`

- This file locks the versions of the providers and their dependencies used by your configuration.
- It ensures that Terraform always uses the same provider versions, providing consistency across runs.

## Usage

1. Run Terraform plan to preview the changes:

    ```bash
    terraform plan -out "out.tfplan"
    ```

2. Review the proposed changes and ensure they match your expectations.

3. Apply the changes to create or update the infrastructure:

    ```bash
    terraform apply "out.tfplan"
    ```

4. Confirm the changes when prompted.

## Clean Up

After you're done experimenting or no longer need the infrastructure, you can destroy it using:

```bash
terraform destroy
```

## Contributing

Feel free to contribute by submitting issues or pull requests.

---