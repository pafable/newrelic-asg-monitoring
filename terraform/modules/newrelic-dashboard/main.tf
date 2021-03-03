terraform {
  required_providers {
    newrelic = {
      source  = "newrelic/newrelic"
      version = "~> 2.19"
    }
  }
}

resource "newrelic_dashboard" "tf_nr_dash" {
  title = "${var.project}-dashboard-${terraform.workspace}"

  widget {
    title         = "ASG: New Relic POC 1 Dev"
    visualization = "event_table"
    nrql          = var.nrql1
    row           = 1
    column        = 1
  }

  widget {
    title         = "ASG: New Relic POC 2 Dev"
    visualization = "event_table"
    nrql          = var.nrql2
    row           = 1
    column        = 2
  }

  widget {
    title         = "ASG: New Relic POC 3 Dev"
    visualization = "event_table"
    nrql          = var.nrql3
    row           = 1
    column        = 3
  }

  widget {
    title         = "ASG: New Relic POC 1 Dev"
    visualization = "line_chart"
    nrql          = var.nrql4
    row           = 2
    column        = 1
  }

  widget {
    title         = "ASG: New Relic POC 2 Dev"
    visualization = "line_chart"
    nrql          = var.nrql5
    row           = 2
    column        = 2
  }

  widget {
    title         = "ASG: New Relic POC 3 Dev"
    visualization = "line_chart"
    nrql          = var.nrql6
    row           = 2
    column        = 3
  }

  widget {
    title         = "CPU 5 Min Load Avg"
    visualization = "line_chart"
    nrql          = var.nrql7
    row           = 3
    column        = 1
    width         = 3
  }

  widget {
    title         = "Free Memory %"
    visualization = "line_chart"
    nrql          = var.nrql8
    row           = 4
    column        = 1
    width         = 3
  }
}