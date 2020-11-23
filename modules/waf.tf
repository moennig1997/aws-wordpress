resource "aws_wafv2_web_acl" "wp_web_acl" {
  name        = "wp_web_acl"
  description = "web acl of wafV2 for wordpress"
  scope       = "REGIONAL"

  default_action {
    allow {}
  }

  rule {
    name     = "rule-1"
    priority = 1

    override_action {
        none {}
    }

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesCommonRuleSet"
        vendor_name = "AWS"
     }
    }
    
    visibility_config {
      cloudwatch_metrics_enabled = false
      metric_name                = "wp_web_waf_metric"
      sampled_requests_enabled   = false
    }
  }

  rule {
    name     = "rule-2"
    priority = 2

    override_action {
        none {}
    }

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesAmazonIpReputationList"
        vendor_name = "AWS"
     }
    }
    
    visibility_config {
      cloudwatch_metrics_enabled = false
      metric_name                = "wp_web_waf_metric"
      sampled_requests_enabled   = false
    }
  }

  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = "wp_web_waf_metric"
    sampled_requests_enabled   = false
  }
}