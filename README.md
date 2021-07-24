# terraform-github-repo module.

I use this module to

## How to call this module

```hcl
module "github_terraform_aws_ecs_service" {
  source       = "trussworks/repo/github"

  repo_name    = "terraform-aws-ecs-service"
  description  = "Creates an ECS Service."

  topics = [
    "terraform",
    "terraform-modules",
    "github"
  ]

  private             = false
  status_check_strict = true
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_push_users"></a> [additional\_push\_users](#input\_additional\_push\_users) | The list of Github usernames allowed to push to the protected main branch | `list(string)` | `[]` | no |
| <a name="input_archived"></a> [archived](#input\_archived) | Specifies if the repository should be archived | `bool` | `false` | no |
| <a name="input_default_branch_name"></a> [default\_branch\_name](#input\_default\_branch\_name) | The default branch for the repo. Branch protection settings will be applied to the branch with this name. Currently defaults to `main`. | `string` | `"main"` | no |
| <a name="input_delete_branch_on_merge"></a> [delete\_branch\_on\_merge](#input\_delete\_branch\_on\_merge) | Delete branches upon merge | `bool` | `true` | no |
| <a name="input_description"></a> [description](#input\_description) | A description of the repository | `string` | n/a | yes |
| <a name="input_homepage_url"></a> [homepage\_url](#input\_homepage\_url) | URL of a page describing the project | `string` | `""` | no |
| <a name="input_is_template"></a> [is\_template](#input\_is\_template) | Tell GitHub that this is a template repository | `bool` | `false` | no |
| <a name="input_private"></a> [private](#input\_private) | Set to true to create a private repository. Repositories are created as private by default | `bool` | `true` | no |
| <a name="input_repo_name"></a> [repo\_name](#input\_repo\_name) | The name of the repository | `string` | n/a | yes |
| <a name="input_status_checks_strict"></a> [status\_checks\_strict](#input\_status\_checks\_strict) | Require branches to be up to date before merging | `bool` | `true` | no |
| <a name="input_template"></a> [template](#input\_template) | Optional template to use for creating the repo | <pre>object({<br>    owner      = string<br>    repository = string<br>  })</pre> | `null` | no |
| <a name="input_topics"></a> [topics](#input\_topics) | The list of topics for the repository | `list(string)` | `[]` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
