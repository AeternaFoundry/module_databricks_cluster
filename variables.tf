variable "clusters" {
  description = <<EOT
Map of clusters, attributes below
Required:
    - spark_version
Optional:
    - apply_policy_default_values
    - autotermination_minutes
    - clear_cloud_attributes_on_remove
    - cluster_name
    - custom_tags
    - data_security_mode
    - dependency_mode
    - driver_instance_pool_id
    - driver_node_type_id
    - enable_elastic_disk
    - enable_local_disk_encryption
    - idempotency_token
    - instance_pool_id
    - is_pinned
    - is_single_node
    - kind
    - no_wait
    - node_type_id
    - num_workers
    - policy_id
    - remote_disk_throughput
    - runtime_engine
    - single_user_name
    - spark_conf
    - spark_env_vars
    - ssh_public_keys
    - total_initial_remote_disk_size
    - use_ml_runtime
    - autoscale (block):
        - max_workers (optional)
        - min_workers (optional)
    - aws_attributes (block):
        - availability (optional)
        - ebs_volume_count (optional)
        - ebs_volume_iops (optional)
        - ebs_volume_size (optional)
        - ebs_volume_throughput (optional)
        - ebs_volume_type (optional)
        - first_on_demand (optional)
        - instance_profile_arn (optional)
        - spot_bid_price_percent (optional)
        - zone_id (optional)
    - azure_attributes (block):
        - availability (optional)
        - capacity_reservation_group (optional)
        - first_on_demand (optional)
        - log_analytics_info (optional, block):
            - log_analytics_primary_key (optional)
            - log_analytics_workspace_id (optional)
        - spot_bid_max_price (optional)
    - cluster_log_conf (block):
        - dbfs (optional, block):
            - destination (required)
        - s3 (optional, block):
            - canned_acl (optional)
            - destination (required)
            - enable_encryption (optional)
            - encryption_type (optional)
            - endpoint (optional)
            - kms_key (optional)
            - region (optional)
        - volumes (optional, block):
            - destination (required)
    - cluster_mount_info (block):
        - local_mount_dir_path (required)
        - network_filesystem_info (required, block):
            - mount_options (optional)
            - server_address (required)
        - remote_mount_dir_path (optional)
    - docker_image (block):
        - basic_auth (optional, block):
            - password (required)
            - username (required)
        - url (required)
    - driver_node_type_flexibility (block):
        - alternate_node_type_ids (optional)
        - aws_context_id (optional)
    - gcp_attributes (block):
        - availability (optional)
        - boot_disk_size (optional)
        - confidential_compute_type (optional)
        - first_on_demand (optional)
        - google_service_account (optional)
        - local_ssd_count (optional)
        - use_preemptible_executors (optional)
        - zone_id (optional)
    - init_scripts (block):
        - abfss (optional, block):
            - destination (required)
        - dbfs (optional, block):
            - destination (required)
        - file (optional, block):
            - destination (required)
        - gcs (optional, block):
            - destination (required)
        - s3 (optional, block):
            - canned_acl (optional)
            - destination (required)
            - enable_encryption (optional)
            - encryption_type (optional)
            - endpoint (optional)
            - kms_key (optional)
            - region (optional)
        - volumes (optional, block):
            - destination (required)
        - workspace (optional, block):
            - destination (required)
    - library (block):
        - cran (optional, block):
            - package (required)
            - repo (optional)
        - egg (optional)
        - jar (optional)
        - maven (optional, block):
            - coordinates (required)
            - exclusions (optional)
            - repo (optional)
        - pypi (optional, block):
            - package (required)
            - repo (optional)
        - requirements (optional)
        - whl (optional)
    - provider_config (block):
        - workspace_id (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
    - worker_node_type_flexibility (block):
        - alternate_node_type_ids (optional)
        - aws_context_id (optional)
    - workload_type (block):
        - clients (required, block):
            - jobs (optional)
            - notebooks (optional)
EOT

  type = map(object({
    spark_version                    = string
    apply_policy_default_values      = optional(bool)
    autotermination_minutes          = optional(number)
    clear_cloud_attributes_on_remove = optional(bool)
    cluster_name                     = optional(string)
    custom_tags                      = optional(map(string))
    data_security_mode               = optional(string)
    dependency_mode                  = optional(string)
    driver_instance_pool_id          = optional(string)
    driver_node_type_id              = optional(string)
    enable_elastic_disk              = optional(bool)
    enable_local_disk_encryption     = optional(bool)
    idempotency_token                = optional(string)
    instance_pool_id                 = optional(string)
    is_pinned                        = optional(bool)
    is_single_node                   = optional(bool)
    kind                             = optional(string)
    no_wait                          = optional(bool)
    node_type_id                     = optional(string)
    num_workers                      = optional(number)
    policy_id                        = optional(string)
    remote_disk_throughput           = optional(number)
    runtime_engine                   = optional(string)
    single_user_name                 = optional(string)
    spark_conf                       = optional(map(string))
    spark_env_vars                   = optional(map(string))
    ssh_public_keys                  = optional(list(string))
    total_initial_remote_disk_size   = optional(number)
    use_ml_runtime                   = optional(bool)
    autoscale = optional(object({
      max_workers = optional(number)
      min_workers = optional(number)
    }))
    aws_attributes = optional(object({
      availability           = optional(string)
      ebs_volume_count       = optional(number)
      ebs_volume_iops        = optional(number)
      ebs_volume_size        = optional(number)
      ebs_volume_throughput  = optional(number)
      ebs_volume_type        = optional(string)
      first_on_demand        = optional(number)
      instance_profile_arn   = optional(string)
      spot_bid_price_percent = optional(number)
      zone_id                = optional(string)
    }))
    azure_attributes = optional(object({
      availability               = optional(string)
      capacity_reservation_group = optional(string)
      first_on_demand            = optional(number)
      log_analytics_info = optional(object({
        log_analytics_primary_key  = optional(string)
        log_analytics_workspace_id = optional(string)
      }))
      spot_bid_max_price = optional(number)
    }))
    cluster_log_conf = optional(object({
      dbfs = optional(object({
        destination = string
      }))
      s3 = optional(object({
        canned_acl        = optional(string)
        destination       = string
        enable_encryption = optional(bool)
        encryption_type   = optional(string)
        endpoint          = optional(string)
        kms_key           = optional(string)
        region            = optional(string)
      }))
      volumes = optional(object({
        destination = string
      }))
    }))
    cluster_mount_info = optional(list(object({
      local_mount_dir_path = string
      network_filesystem_info = object({
        mount_options  = optional(string)
        server_address = string
      })
      remote_mount_dir_path = optional(string)
    })))
    docker_image = optional(object({
      basic_auth = optional(object({
        password = string
        username = string
      }))
      url = string
    }))
    driver_node_type_flexibility = optional(object({
      alternate_node_type_ids = optional(list(string))
      aws_context_id          = optional(string)
    }))
    gcp_attributes = optional(object({
      availability              = optional(string)
      boot_disk_size            = optional(number)
      confidential_compute_type = optional(string)
      first_on_demand           = optional(number)
      google_service_account    = optional(string)
      local_ssd_count           = optional(number)
      use_preemptible_executors = optional(bool)
      zone_id                   = optional(string)
    }))
    init_scripts = optional(list(object({
      abfss = optional(object({
        destination = string
      }))
      dbfs = optional(object({
        destination = string
      }))
      file = optional(object({
        destination = string
      }))
      gcs = optional(object({
        destination = string
      }))
      s3 = optional(object({
        canned_acl        = optional(string)
        destination       = string
        enable_encryption = optional(bool)
        encryption_type   = optional(string)
        endpoint          = optional(string)
        kms_key           = optional(string)
        region            = optional(string)
      }))
      volumes = optional(object({
        destination = string
      }))
      workspace = optional(object({
        destination = string
      }))
    })))
    library = optional(list(object({
      cran = optional(object({
        package = string
        repo    = optional(string)
      }))
      egg = optional(string)
      jar = optional(string)
      maven = optional(object({
        coordinates = string
        exclusions  = optional(list(string))
        repo        = optional(string)
      }))
      pypi = optional(object({
        package = string
        repo    = optional(string)
      }))
      requirements = optional(string)
      whl          = optional(string)
    })))
    provider_config = optional(object({
      workspace_id = optional(string)
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
    worker_node_type_flexibility = optional(object({
      alternate_node_type_ids = optional(list(string))
      aws_context_id          = optional(string)
    }))
    workload_type = optional(object({
      clients = object({
        jobs      = optional(bool)
        notebooks = optional(bool)
      })
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.clusters : (
        v.init_scripts == null || (length(v.init_scripts) <= 10)
      )
    ])
    error_message = "Each init_scripts list must contain at most 10 items"
  }
}

