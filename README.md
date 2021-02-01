# Terraform-module-project
Terraform infrastructure as code module for creating GCP projects 

## Requirements

[Terraform 14](https://www.terraform.io/downloads.html)

## Providers

| Name | Version |
|------|---------|
| google | `3.51.0` |
| google-beta | `3.51.0` |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| activate\_apis | A list of APIs to enable for the created project | `list(string)` | `[]` | no |
| billing\_account\_id | The billing id to initialise the project with | `string` | `"0195D1-0AA399-5825B6"` | no |
| deletion\_protection | For use when creating a formal project as opposed to a adhoc sandbox project | `bool` | `false` | no |
| folder\_id | The Id of folder to create the project in | `string` | `"578347862917"` | no |
| primary\_contact | The Primary contact (email) for this project | `string` | n/a | yes |
| project\_id | The project Id you want to assign to this project | `string` | n/a | yes |
| project\_owners | Additional entities to bind to the owner role | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| project\_display\_name | n/a |
| project\_id | n/a |
| project\_state\_bucket | n/a |


## Usage


```terraform
module "my_proj" {
  source          = "../"
  project_id      = "my-amazeballs-proj"
  primary_contact = "mikael.allison@ext.ons.gov.uk"

  activate_apis = [
    "iam.googleapis.com"
  ]
}
```

```shell
terraform init
terraform plan
terraform apply
```
