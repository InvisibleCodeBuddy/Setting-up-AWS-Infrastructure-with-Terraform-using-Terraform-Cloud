name               = "devon" # project name
environment        = "dev" # environment name
region             = "ap-south-1" # region
account_id         = "005640028272" # account id from aws top right profile


# vpc Stack
vpc = {
vpc_cidr                    = "10.0.0.0/16"
availability_zones          = ["ap-south-1a", "ap-south-1b"]
enable_dns_support          = "true"
enable_dns_hostnames        = "true"
instance_tenancy            = "default"
enable_ipv6                 = "false"
map_public_ip_on_launch     = "true" #set to false then public IP will not associate
public-subnets              = ["10.0.10.0/24", "10.0.20.0/24"]
private-subnets             = ["10.0.30.0/24", "10.0.40.0/24"]
database-subnets            = ["10.0.50.0/24", "10.0.60.0/24"]

}

ecr = {
image_tag_mutability = "MUTABLE"
scan_on_push         = true #false for not scanning#
force_delete         = "true"
}

# docker images
# change port to match docker images

alb = {

  port        = 5000
  protocol    = "HTTP"
  target_type = "ip"
  path        = "/"
  matcher     = 200
  enabled     = true
  timeout     = 120
  interval    = 130
}

# RDS
rds = {
engine                                = "postgres"
engine_version                        = "14.4"
family                                = "postgres13"  # DB parameter group
major_engine_version                  = "14"          # DB option group
instance_class                        = "db.t3.small"

allocated_storage                     = 20
max_allocated_storage                 = 50
storage_encrypted                     = true

username                              = "test"
password                              = "sfsfewRE2131dq"
random_password_length                = 20
port                                  = 5432

multi_az                              = false #true for enable multi availability zone
#create_db_subnet_group                = false
db_subnet_group_description           = "subnet group for rds"
maintenance_window                    = "Mon:00:00-Mon:03:00"
backup_window                         = "03:00-06:00"
enabled_cloudwatch_logs_exports       = ["postgresql", "upgrade"]

backup_retention_period               = 7
skip_final_snapshot                   = true #false for disable final snapshot
deletion_protection                   = false #database can't be deleted when true

performance_insights_enabled          = false #true for enabling Performance Insights
performance_insights_retention_period = 0
create_monitoring_role                = true
monitoring_role_name                  = "rds-monitoring-role"
monitoring_interval                   = 0

}

# change git hub to match your personal github
github = {

repo_owner    = "ankushtechtweek"
repo_name     = "vpc"
branch_name   = "main"
token         =  "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"

}

ecs_task_def = {

  task_cpu_limit       = "2048"
  task_memory_limit    = "4096"
  container_cpu    = "0"
  container_memory = "4096"
  container_port   = "5000"
}

# how long the loads persist
retention_in_days = "7"

# need to add to AWS Domain Registry
# need to manage ACM (Amazon Certificate Manager) - Add CNAME records to domain
acm = {
domain_name = "invisiblecoworker.com"
}

# S3 Bucket
s3_name = "test-bucket-name-tech"