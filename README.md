TERRAFORM AZURE INFRASTRUCTURE AS CODE


PROJECT OVERVIEW

This project demonstrates the deployment and management of Microsoft Azure infrastructure using Terraform Infrastructure as Code.

The infrastructure was initially designed and understood through the Azure Portal and was then rebuilt using Terraform.

The purpose of the project is to demonstrate how cloud infrastructure can be defined as code, organized into reusable modules, version controlled using Git, managed through Terraform state, and deployed consistently to Microsoft Azure.

The project demonstrates practical Terraform and Azure concepts including Terraform providers, resources, variables, outputs, modules, module dependencies, Terraform state, remote state using Azure Storage, backend bootstrapping, environment separation, Azure CLI authentication, infrastructure planning, deployment, verification, troubleshooting, and Git based version control.


PROJECT OBJECTIVES

The main objective is to convert an Azure infrastructure design into a repeatable Infrastructure as Code solution.

The project follows this workflow.

Understand the Azure architecture.

Design the required infrastructure.

Define the infrastructure using Terraform.

Create reusable Terraform modules.

Configure Terraform variables and outputs.

Configure Terraform state.

Configure a remote Terraform backend.

Separate environment configuration from reusable modules.

Deploy infrastructure to Azure.

Verify the deployed resources.

Manage the infrastructure using Git and GitHub.

The result is an infrastructure configuration that can be recreated and managed consistently without manually creating every resource through the Azure Portal.


PROJECT NAME

Terraform Azure Infrastructure as Code


TECHNOLOGIES USED

Microsoft Azure

Azure Resource Manager

Terraform

AzureRM Terraform Provider

Azure CLI

Git

GitHub

Linux Virtual Machine

Azure Virtual Network

Azure Subnets

Network Security Groups

Azure Storage

Azure SQL Database

Azure Log Analytics

Terraform Modules

Terraform Remote State


AZURE ARCHITECTURE

The infrastructure is organized into several logical components.

Networking provides the virtual network, subnets, and network security controls.

Compute provides the Linux virtual machine, network interface, and public IP address.

Storage provides Azure Storage resources and the storage used for Terraform remote state.

Database provides the Azure SQL Server and Azure SQL Database.

Monitoring provides the Log Analytics Workspace.

The architecture contains the following logical components.

Azure Resource Group

Virtual Network

Frontend Subnet

Backend Subnet

Network Security Group

Public IP Address

Network Interface

Linux Virtual Machine

Storage Account

Blob Container

Azure SQL Server

Azure SQL Database

Log Analytics Workspace


ARCHITECTURE FLOW

The overall infrastructure workflow is as follows.

Developer

Git

GitHub

Terraform

AzureRM Provider

Azure Resource Manager

Azure Resource Group

Azure Networking

Azure Compute

Azure Storage

Azure Database

Azure Monitoring

Terraform Remote State


NETWORKING ARCHITECTURE

The networking module creates the Azure Virtual Network.

The virtual network provides the private network boundary for the infrastructure.

The network is divided into frontend and backend subnets.

The frontend subnet provides a logical network segment for frontend workloads.

The backend subnet provides a logical network segment for backend infrastructure such as the Linux virtual machine.

The Network Security Group provides network traffic control for the required infrastructure.

The networking module exposes subnet information through Terraform outputs.

The compute module consumes the backend subnet information.

This demonstrates module communication and dependency management in Terraform.


COMPUTE ARCHITECTURE

The compute module is responsible for the virtual machine infrastructure.

The compute module creates the following resources.

Public IP Address

Network Interface

Linux Virtual Machine

The Network Interface connects the virtual machine to the backend subnet.

The Public IP provides external connectivity when required and when appropriate network access rules are configured.

The Linux Virtual Machine provides the compute workload for the environment.

The virtual machine uses an Azure supported Linux operating system.

The project demonstrates how Terraform can create the dependency chain between the virtual network, subnet, network interface, public IP address, and virtual machine.


STORAGE ARCHITECTURE

The storage module manages Azure Storage resources.

The module creates an Azure Storage Account and Blob Container.

The Storage Account provides cloud based storage.

The Blob Container provides a logical location for blob objects.

Azure Storage is also used as part of the Terraform remote state architecture.


DATABASE ARCHITECTURE

The database module manages Azure SQL resources.

The module creates an Azure SQL Server and Azure SQL Database.

The SQL Server provides the logical hosting environment for the database.

The Azure SQL Database provides a managed relational database service.

The database resources are managed through Terraform so that their configuration can be reproduced through Infrastructure as Code.


MONITORING ARCHITECTURE

The monitoring module creates an Azure Log Analytics Workspace.

The Log Analytics Workspace provides a centralized location for collecting and analyzing monitoring information.

The workspace provides a foundation for integration with Azure Monitor and other Azure monitoring services.

A production implementation can extend this architecture with alerts, dashboards, diagnostic settings, and additional monitoring rules.


PROJECT STRUCTURE

The project is organized into reusable Terraform modules and environment specific configuration.

The main project contains the Terraform provider configuration, variables, outputs, backend configuration, and module references.

The modules directory contains the reusable infrastructure components.

The networking module contains the networking resources.

The compute module contains the virtual machine resources.

The storage module contains the storage resources.

The database module contains the Azure SQL resources.

The monitoring module contains the Log Analytics resources.

The environments directory contains environment specific Terraform configurations.

The development environment is currently separated from the reusable modules.


TERRAFORM PROVIDER

The project uses the AzureRM Terraform provider.

The AzureRM provider allows Terraform to communicate with Microsoft Azure through Azure Resource Manager.

Terraform uses the provider to create and manage Azure resources.

Examples include resource groups, virtual networks, subnets, virtual machines, storage resources, SQL resources, and monitoring resources.

The provider configuration is maintained separately from the infrastructure modules.


AZURE AUTHENTICATION

Azure CLI authentication is used during development.

The Azure CLI can be authenticated using the Azure login command.

After authentication, the active Azure subscription can be checked using the Azure account show command.

Available subscriptions can be listed using the Azure account list command.

The appropriate Azure subscription must be selected before Terraform infrastructure is deployed.

For production CI CD environments, workload identity or OpenID Connect based authentication should be preferred over long lived credentials.


RESOURCE GROUP

The Terraform configuration creates a dedicated Azure Resource Group for the infrastructure.

The Resource Group provides a logical container for the Azure resources managed by Terraform.

Using a dedicated Resource Group simplifies resource organization, management, access control, and cleanup.


TERRAFORM VARIABLES

Terraform variables are used to separate configuration values from infrastructure definitions.

Typical configuration values include the following.

Azure location

Resource group configuration

Virtual machine configuration

Virtual network configuration

Subnet configuration

Storage configuration

Database configuration

Variables make the Terraform modules reusable across different environments.


TERRAFORM VARIABLE FILES

Terraform variable files can be used to provide environment specific configuration values.

Variable files allow configuration to be separated from the main infrastructure definitions.

Sensitive information must never be stored in a public repository.

Credentials, passwords, access tokens, private keys, and other secrets should be stored using secure mechanisms such as Azure Key Vault, managed identity, environment variables, or CI CD secret management.


TERRAFORM OUTPUTS

Terraform outputs provide useful information after infrastructure deployment.

The project can expose information such as resource group details, virtual machine information, and public IP information.

Terraform outputs can be displayed using the Terraform output command.

A specific output can be retrieved using the Terraform output command with the appropriate output name.

Sensitive output values should not be exposed in public documentation.


TERRAFORM MODULES

The project uses reusable Terraform modules.

The main modules are as follows.

Networking

Compute

Storage

Database

Monitoring

Each module contains its own Terraform configuration, variables, and outputs.

The module structure improves organization, maintainability, readability, and reusability.

The modules can be reused with different environment specific configurations.


MODULE INPUTS AND OUTPUTS

Terraform modules communicate using variables and outputs.

The networking module creates the required subnet resources and exposes subnet information through outputs.

The compute module consumes the subnet information as an input.

This creates a dependency between networking and compute.

Terraform uses these references to automatically determine the required resource creation order.


DEPENDENCY MANAGEMENT

Terraform automatically builds a dependency graph based on resource references and module outputs.

A simplified dependency relationship is as follows.

Resource Group

Virtual Network

Backend Subnet

Network Interface

Public IP Address

Linux Virtual Machine

Terraform uses these relationships to determine the appropriate order for creating and updating resources.

This removes the need to manually create every resource in a predefined order.


TERRAFORM STATE

Terraform state is a critical component of Terraform infrastructure management.

The state records information about resources managed by Terraform.

Terraform uses the state to compare the desired configuration with the existing infrastructure.

This allows Terraform to determine which resources need to be created, changed, or removed.

Terraform state can be inspected using the Terraform state list command.

Terraform state can also be inspected using the Terraform show command.

Terraform state files must not be committed to a public GitHub repository because they can contain sensitive infrastructure information.


REMOTE TERRAFORM STATE

The project demonstrates remote Terraform state using Azure Storage.

The remote state architecture consists of the following components.

Terraform

Azure Storage Account

Blob Container

Terraform State

Remote state provides centralized state storage.

This approach is more suitable for collaborative infrastructure management because the Terraform state is stored centrally rather than only on an individual developer machine.


BACKEND BOOTSTRAPPING

Terraform cannot use an Azure Storage Account as a backend before the storage infrastructure exists.

The project therefore uses a backend bootstrap configuration.

The bootstrap configuration creates the Azure Storage resources required for Terraform remote state.

After the backend storage infrastructure has been created, Terraform can be initialized using the Azure Storage backend.

This demonstrates a common real world Terraform design consideration.


ENVIRONMENT SEPARATION

The project contains an environments directory.

The current environment configuration is maintained separately from the reusable modules.

The architecture allows additional environments to be introduced later.

For example, development and production environments can use the same reusable modules while maintaining different environment specific values.

This design reduces duplication and makes the infrastructure easier to maintain.


DEVELOPMENT ENVIRONMENT

The development environment contains its own Terraform configuration.

The environment configuration references the reusable Terraform modules.

Environment specific values can be maintained separately from the shared infrastructure modules.

This provides a foundation for introducing additional environments in the future.


PRODUCTION ENVIRONMENT

The Terraform architecture is designed so that a production environment can be added using the same reusable modules.

A future production environment can use separate configuration and state while continuing to share the networking, compute, storage, database, and monitoring modules.

This allows development and production infrastructure to follow the same architectural standards while maintaining appropriate separation.


TERRAFORM INITIALIZATION

Terraform initialization is performed using the Terraform init command.

Terraform initialization performs several tasks.

It initializes the Terraform working directory.

It downloads required providers.

It initializes modules.

It configures the Terraform backend.

It prepares the dependency lock file.


TERRAFORM FORMATTING

Terraform configuration should be formatted using the Terraform fmt command.

Recursive formatting can be performed using the Terraform fmt recursive command.

Formatting ensures that Terraform configuration follows standard formatting conventions.


TERRAFORM VALIDATION

Terraform configuration can be validated using the Terraform validate command.

Validation checks the configuration for syntax and configuration errors.

Validation should be performed before creating infrastructure.


TERRAFORM PLAN

Terraform plan is used to preview infrastructure changes.

Terraform compares the desired configuration with the current Terraform state and Azure infrastructure.

The plan identifies resources that Terraform intends to create, update, or destroy.

Reviewing the plan before deployment helps prevent unexpected infrastructure changes.


TERRAFORM APPLY

Terraform apply is used to deploy the infrastructure.

Terraform displays the proposed changes and requests confirmation before applying them.

After confirmation, Terraform creates or updates the required Azure resources.


TERRAFORM VERIFICATION

After deployment, the infrastructure can be verified using Terraform and Azure CLI.

Terraform outputs can be reviewed.

Terraform state can be inspected.

Azure resources can be listed using Azure CLI.

The virtual machine can be accessed through SSH when appropriate network access has been configured.

The operating system and required services can then be verified on the virtual machine.


TERRAFORM DESTROY

Terraform destroy can be used to remove infrastructure managed by Terraform.

This is useful for development and lab environments when the infrastructure is no longer required.

Production environments should use appropriate approval and change management procedures before destructive operations are performed.


GIT VERSION CONTROL

The Terraform project is managed using Git.

Git provides version control for infrastructure code.

Changes can be reviewed, committed, and pushed to GitHub.

A typical Git workflow consists of checking repository status, staging changes, creating a commit, and pushing the changes to the remote repository.


GITIGNORE

Terraform generated files and sensitive files should be excluded using the Git ignore configuration.

The repository should not contain Terraform state files, Terraform working directories, local credentials, environment files, or sensitive variable files containing secrets.

Before making the repository public, the complete Git history should also be checked for accidentally committed credentials.


SECURITY

Security is an important part of Azure Infrastructure as Code.

Passwords and credentials should never be hard coded into Terraform configuration.

Sensitive information should be stored using secure mechanisms.

Recommended solutions include Azure Key Vault, managed identity, workload identity, environment variables, CI CD secret management, and OpenID Connect authentication.

For production environments, long lived cloud credentials should be avoided where possible.


AZURE KEY VAULT

Azure Key Vault can be integrated into a future production implementation.

Key Vault can securely store application secrets, database credentials, certificates, and other sensitive information.

Terraform should retrieve or reference sensitive values securely instead of storing credentials directly in configuration files.


COST MANAGEMENT

Azure infrastructure can generate costs depending on the resources and configuration used.

Potential cost generating resources include virtual machines, managed databases, storage, and Log Analytics.

Development environments should use appropriate resource sizes and should be removed when they are no longer required.

A production implementation should introduce Azure Cost Management, budgets, cost alerts, resource tagging, resource right sizing, and monitoring of Log Analytics retention.


TROUBLESHOOTING EXPERIENCE

Several Terraform configuration issues were identified and corrected during development.

The first issue involved incorrect module references.

Terraform reported unreadable module directories when a module was referenced incorrectly.

The module structure was corrected so that the environment configuration called the reusable modules correctly.

Another issue involved unsupported networking arguments.

The root configuration used argument names that did not match the variables defined inside the networking module.

The module variables and root configuration were reviewed and aligned.

Terraform initialization was then performed again.

A backend configuration formatting issue also caused a Terraform initialization error.

The backend configuration was corrected and Terraform initialization was successfully performed again.

These troubleshooting experiences provided practical experience with Terraform module organization, module inputs and outputs, initialization, backend configuration, dependency management, and configuration troubleshooting.


PRACTICAL TERRAFORM COMMANDS

Terraform initialization

terraform init


Terraform formatting

terraform fmt recursive


Terraform validation

terraform validate


Terraform planning

terraform plan


Terraform deployment

terraform apply


Terraform outputs

terraform output


Terraform state resources

terraform state list


Terraform state information

terraform show


Terraform infrastructure removal

terraform destroy


PROJECT WORKFLOW

The complete project workflow is as follows.

Understand the Azure architecture.

Design the infrastructure.

Configure the Terraform provider.

Define Terraform variables.

Create the Resource Group.

Create the networking module.

Create the compute module.

Create the storage module.

Create the database module.

Create the monitoring module.

Configure Terraform outputs.

Configure Terraform state.

Configure the remote backend.

Initialize Terraform.

Format the configuration.

Validate the configuration.

Create a Terraform plan.

Review the planned changes.

Apply the Terraform configuration.

Verify the Azure resources.

Inspect Terraform outputs.

Inspect Terraform state.

Commit infrastructure code to Git.

Push the project to GitHub.


PROJECT OUTCOME

The project successfully demonstrates the transformation of an Azure infrastructure design into Terraform Infrastructure as Code.

The infrastructure is organized into reusable modules.

Networking is separated from compute.

Storage is separated from database resources.

Monitoring is separated into its own module.

Terraform variables provide configuration flexibility.

Terraform outputs provide useful deployment information.

Terraform dependencies allow resources to be created in the appropriate order.

Terraform remote state is configured using Azure Storage.

Environment configuration is separated from reusable modules.

The infrastructure can be formatted, validated, planned, deployed, verified, and destroyed using Terraform.

The infrastructure code is version controlled using Git and stored in GitHub.


SKILLS DEMONSTRATED

Microsoft Azure

Azure Resource Manager

Azure Virtual Network

Azure Subnets

Network Security Groups

Linux Virtual Machines

Azure Storage

Azure SQL Database

Azure Monitor

Log Analytics

Terraform Infrastructure as Code

AzureRM Terraform Provider

Terraform Resources

Terraform Variables

Terraform Outputs

Terraform Modules

Terraform Module Dependencies

Terraform State

Terraform Remote Backend

Azure Storage Backend

Terraform Backend Bootstrapping

Terraform Environment Separation

Azure CLI

Azure Authentication

Git

GitHub

Infrastructure Deployment

Infrastructure Validation

Infrastructure Troubleshooting

Cloud Infrastructure Design


FUTURE IMPROVEMENTS

The project provides the Terraform foundation for a more complete Azure DevOps platform.

Future improvements include GitHub Actions based Terraform CI CD, automated Terraform formatting, automated validation, automated Terraform planning, pull request based infrastructure reviews, manual approval before production deployment, Azure OpenID Connect authentication, a dedicated production environment, Azure Key Vault integration, managed identity, Azure Monitor alerts, Azure Policy, Terraform security scanning, Terraform cost estimation, and automated infrastructure documentation.


CONCLUSION

This project demonstrates practical Infrastructure as Code using Terraform and Microsoft Azure.

Instead of relying exclusively on manual Azure Portal configuration, the infrastructure is defined through reusable Terraform modules.

Terraform variables make the infrastructure configurable.

Terraform outputs provide useful deployment information.

Terraform module dependencies allow Terraform to determine the required resource creation order.

Terraform state allows infrastructure to be tracked and managed.

Remote state using Azure Storage provides centralized state management.

Environment separation provides a foundation for managing multiple environments.

Git and GitHub provide version control for the infrastructure code.

The project therefore demonstrates a complete Infrastructure as Code workflow covering Azure architecture, Terraform configuration, reusable modules, state management, remote backend configuration, environment separation, deployment, verification, troubleshooting, and version control.


PUBLIC REPOSITORY SECURITY CHECK

Before making this repository public, verify that the repository does not contain the following.

Terraform state files

Terraform backup state files

Terraform variable files containing secrets

Environment files

Passwords

API keys

Azure credentials

Service principal credentials

Private keys

SSH private keys

Access tokens

Subscription credentials

Client secrets

Sensitive database credentials

The Git history should also be checked because deleting a secret from the latest commit does not necessarily remove it from previous Git commits.

Only after the repository and its Git history have been reviewed should the repository be changed from private to public.
