resource "aws_wafv2_web_acl" "web_acl" {
  name        = "${var.project_name}-web-acl"
  description = "Web ACL for WebApp"
  scope       = "CLOUDFRONT"

  default_action {
    allow {}
  }

  rule {
    name     = "AWS-AWSManagedRulesCommonRuleSet"
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
      sampled_requests_enabled = true
      cloudwatch_metrics_enabled = true
      metric_name = "AWSManagedRulesCommonRuleSet"
    }
  }

  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = "webACL"
    sampled_requests_enabled   = true
  }
}

resource "aws_wafv2_web_acl_association" "web_acl_assoc" {
  resource_arn = aws_cloudfront_distribution.web_distribution.arn
  web_acl_arn  = aws_wafv2_web_acl.web_acl.arn
}
