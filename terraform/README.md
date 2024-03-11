# Terraform for managing GCP permissions

## Introduction

This Terraform will be in charge of creating and assigning custom roles to all different teams. We will use predefined Google Workspace groups to assign the roles and, therefore, the users within them. (Google Workspace groups are shared with GCP and will be provisioned automatically from MS365).

## Structure

- _**modules / iam_roles**_
    - _**assign_role**_
      - **main.tf** (module for assign native role)
      - **variables.tf** (variables needed for native role assignation)
    - _**custom_role**_
      - **main.tf** (module for custom role creation and assignment)
      - **variables.tf** (variables needed for custom role creation)
    - _**roles**_
        - **groupRole** (one file for each group with a list of permissions)
- _**custom_roles**_
  - **config.tf** (config needed for GCP provider and backend for remote tfstate)
  - **locals.tf** (locals definitions used to declare each team and their roles and custom role)
  - **main.tf** (custom role creation and assignment iterating withing envCustomRoles' local var)
  - **UBS-Development.tfvars** (variables for development env)
  - **UBS-Production.tfvars** (variables for production env)
  - **variables.tf** (variables needed for custom role creation)
- _**native_roles**_
  - **config.tf** (config needed for GCP provider and backend for remote tfstate)
  - **main.tf** (native roles assignment iterating withing nativeRoles' var)
  - **UBS-Development.tfvars** (variables for development env)
  - **UBS-Production.tfvars** (variables for production env)
  - **variables.tf** (variables needed for custom role creation)

## Example of adding a native role to a team

For adding a native role to a Team we will need to go to **native_roles/GCP-Project.tfvars** file and within *nativeRoles* find or add the key corresponding to the desired team and the value will be a set of strings with the roles separated by ",".

Example:
```
UBS-Development.tfvars

...
nativeRoles = {
  "Data-UBS-Development"       = ["roles/viewer"]
  "DevOps-UBS-Development"     = ["roles/editor"]
  "Backend-UBS-Development"    = ["roles/viewer"]
  "Frontend-UBS-Development"   = ["roles/viewer"]
  "QA-UBS-Development"         = ["roles/viewer"]
}
...
```

## Example of adding new custom role (unused for now)

### Introduction

As we are using GCP groups previously, it is needed that the 'team' variable represents an existing group. For example, for the QA team, we should already have a Google group called <TEAM>-<GCP-Project>@ubersuggest.com. In this case, an example would be QA-UBS-Development@ubersuggest.com.

### Setting up

We will need a new file under _**custom_roles/roles**_ called "QA-UBS-Development" with all permissions listed.

All permissions have this structure _service_._type_._permission_

Example:
```
iam.roles.list
iam.roles.get
compute.instances.list
compute.instances.get
```

Then we will need to add the role and permissions to the **locals** in **custom_roles/locals.tf** file

Example:

```
locals {
  devCustomRoles = {
    Data-UBS-Development       = file("./roles/test")
    DevOps-UBS-Development     = file("./roles/test")
    Backend-UBS-Development    = file("./roles/test")
    Frontend-UBS-Development   = file("./roles/test")
    QA-UBS-Development         = file("./roles/test")
  }

  prodCustomRoles = {
    Data-UBS-Production       = file("./roles/test")
    DevOps-UBS-Production     = file("./roles/test")
    Backend-UBS-Production    = file("./roles/test")
    Frontend-UBS-Production   = file("./roles/test")
    QA-UBS-Production         = file("./roles/test")
  }
}

```

## Terraform usage

For initializaing the working directory:
```
terraform init
```

For checking what Terraform will be adding/changing/deleting
```
terraform plan -var project_id=GCP-ProjectID
```

For applying all modifications
```
terraform apply -var project_id=GCP-ProjectID
```

**NOTE:** We will create a pipeline for this in order to apply changes everytime we modifiy the _master_ branch.