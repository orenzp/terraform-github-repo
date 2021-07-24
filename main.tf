resource "github_repository" "main" {
  name        = var.repo_name
  description = var.description

  homepage_url = var.homepage_url
  visibility   = var.private ? "private" : "public"
  archived     = var.archived
  topics       = var.topics

  has_issues    = var.private ? false : true
  has_downloads = true
  has_projects  = false
  has_wiki      = false

  is_template = var.is_template

  delete_branch_on_merge = var.delete_branch_on_merge

  dynamic "template" {
    for_each = var.template != null ? [var.template] : []
    content {
      owner      = template.value.owner
      repository = template.value.repository
    }
  }
}

resource "github_branch" "main" {
  repository = github_repository.main.name
  branch     = var.default_branch_name
}

resource "github_branch_default" "main" {
  repository = github_repository.main.name
  branch     = github_branch.main.branch
}

resource "github_branch_protection" "main" {
  repository_id = github_repository.main.node_id
  pattern       = var.default_branch_name

  enforce_admins    = false
  push_restrictions = var.additional_push_users

  required_status_checks {
    strict = var.status_checks_strict
  }

  required_pull_request_reviews {
    dismiss_stale_reviews           = false
    require_code_owner_reviews      = false
    required_approving_review_count = 1
  }

  lifecycle {
    ignore_changes = [
      required_status_checks.0.contexts
    ]
  }

  depends_on = [github_branch_default.main]
}