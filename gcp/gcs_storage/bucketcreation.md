C:\Tech_Learn_welcome\Dev_OPS\IAC_teraform\project\google_example\bucket_creation>terraform init

Initializing the backend...

Initializing provider plugins...
- Reusing previous version of hashicorp/google from the dependency lock file
- Using previously-installed hashicorp/google v3.84.0

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.

C:\Tech_Learn_welcome\Dev_OPS\IAC_teraform\project\google_example\bucket_creation>terraform plan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # google_storage_bucket.COLDLINE will be created
  + resource "google_storage_bucket" "COLDLINE" {
      + bucket_policy_only          = (known after apply)
      + force_destroy               = false
      + id                          = (known after apply)
      + location                    = "US-EAST1"
      + name                        = "akfkafkaprjectsss"
      + project                     = (known after apply)
      + self_link                   = (known after apply)
      + storage_class               = "COLDLINE"
      + uniform_bucket_level_access = (known after apply)
      + url                         = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.

──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.

C:\Tech_Learn_welcome\Dev_OPS\IAC_teraform\project\google_example\bucket_creation>terraform apply

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # google_storage_bucket.COLDLINE will be created
  + resource "google_storage_bucket" "COLDLINE" {
      + bucket_policy_only          = (known after apply)
      + force_destroy               = false
      + id                          = (known after apply)
      + location                    = "US-EAST1"
      + name                        = "akfkafkaprjectsss"
      + project                     = (known after apply)
      + self_link                   = (known after apply)
      + storage_class               = "COLDLINE"
      + uniform_bucket_level_access = (known after apply)
      + url                         = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

google_storage_bucket.COLDLINE: Creating...
google_storage_bucket.COLDLINE: Creation complete after 1s [id=akfkafkaprjectsss]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

C:\Tech_Learn_welcome\Dev_OPS\IAC_teraform\project\google_example\bucket_creation>terraform show
# google_storage_bucket.COLDLINE:
resource "google_storage_bucket" "COLDLINE" {
    bucket_policy_only          = false
    default_event_based_hold    = false
    force_destroy               = false
    id                          = "akfkafkaprjectsss"
    location                    = "US-EAST1"
    name                        = "akfkafkaprjectsss"
    project                     = "iwinner-data-318822"
    requester_pays              = false
    self_link                   = "https://www.googleapis.com/storage/v1/b/akfkafkaprjectsss"
    storage_class               = "COLDLINE"
    uniform_bucket_level_access = false
    url                         = "gs://akfkafkaprjectsss"
}

C:\Tech_Learn_welcome\Dev_OPS\IAC_teraform\project\google_example\bucket_creation>terraform destory
Terraform has no command named "destory". Did you mean "destroy"?

To see all of Terraform's top-level commands, run:
  terraform -help


C:\Tech_Learn_welcome\Dev_OPS\IAC_teraform\project\google_example\bucket_creation>terraform destroy
google_storage_bucket.COLDLINE: Refreshing state... [id=akfkafkaprjectsss]

Note: Objects have changed outside of Terraform

Terraform detected the following changes made outside of Terraform since the last "terraform apply":

  # google_storage_bucket.COLDLINE has been changed
  ~ resource "google_storage_bucket" "COLDLINE" {
        id                          = "akfkafkaprjectsss"
      + labels                      = {}
        name                        = "akfkafkaprjectsss"
        # (10 unchanged attributes hidden)
    }

Unless you have made equivalent changes to your configuration, or ignored the relevant attributes using ignore_changes, the following plan may include actions to undo or respond to these changes.

──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # google_storage_bucket.COLDLINE will be destroyed
  - resource "google_storage_bucket" "COLDLINE" {
      - bucket_policy_only          = false -> null
      - default_event_based_hold    = false -> null
      - force_destroy               = false -> null
      - id                          = "akfkafkaprjectsss" -> null
      - labels                      = {} -> null
      - location                    = "US-EAST1" -> null
      - name                        = "akfkafkaprjectsss" -> null
      - project                     = "iwinner-data-318822" -> null
      - requester_pays              = false -> null
      - self_link                   = "https://www.googleapis.com/storage/v1/b/akfkafkaprjectsss" -> null
      - storage_class               = "COLDLINE" -> null
      - uniform_bucket_level_access = false -> null
      - url                         = "gs://akfkafkaprjectsss" -> null
    }

Plan: 0 to add, 0 to change, 1 to destroy.

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value:


