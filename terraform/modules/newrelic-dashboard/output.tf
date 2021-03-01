output "dashboard_url" {
  value       = newrelic_dashboard.tf_nr_dash.dashboard_url
  description = "New Relic Dashboard URL"
}