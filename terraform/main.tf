terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
    newrelic = {
      source  = "newrelic/newrelic"
      version = "~> 2.19"
    }
  }

  backend "s3" {}
}

provider "aws" {
  region = var.aws_region[terraform.workspace]
}

provider "newrelic" {
  account_id = var.nr_acct_id
  api_key    = var.nr_apikey
  region     = "US"

}

module "nr_poc1" {
  source              = "./modules/autoscaling"
  aws_region          = var.aws_region
  project             = "${var.project}-1"
  tags                = var.tags
  sshkey              = var.sshkey
  workspace_iam_roles = var.workspace_iam_roles
}

module "nr_poc2" {
  source              = "./modules/autoscaling"
  aws_region          = var.aws_region
  project             = "${var.project}-2"
  tags                = var.tags
  sshkey              = var.sshkey
  workspace_iam_roles = var.workspace_iam_roles
}

module "nr_poc3" {
  source              = "./modules/autoscaling"
  aws_region          = var.aws_region
  project             = "${var.project}-3"
  tags                = var.tags
  sshkey              = var.sshkey
  workspace_iam_roles = var.workspace_iam_roles
}

module "nr_dash1" {
  source  = ".modules/newrelic-dashboard"
  project = "${var.project} dashboard (US-EAST-2)"
  nrql1   = var.nrql1
  nrql2   = var.nrql2
  nrql3   = var.nrql3
  nrql4   = var.nrql4
  nrql5   = var.nrql5
  nrql6   = var.nrql6
  nrql7   = var.nrql7
  nrql8   = var.nrql8
}

module "nr_dash2" {
  source  = ".modules/newrelic-dashboard"
  project = "${var.project} dashboard (US-WEST-2)"
  nrql1   = var.nrql1
  nrql2   = var.nrql2
  nrql3   = var.nrql3
  nrql4   = var.nrql4
  nrql5   = var.nrql5
  nrql6   = var.nrql6
  nrql7   = var.nrql7
  nrql8   = var.nrql8
}