resource "databricks_cluster" "clusters" {
  for_each = var.clusters

  spark_version                    = each.value.spark_version
  apply_policy_default_values      = each.value.apply_policy_default_values
  autotermination_minutes          = each.value.autotermination_minutes
  clear_cloud_attributes_on_remove = each.value.clear_cloud_attributes_on_remove
  cluster_name                     = each.value.cluster_name
  custom_tags                      = each.value.custom_tags
  data_security_mode               = each.value.data_security_mode
  dependency_mode                  = each.value.dependency_mode
  driver_instance_pool_id          = each.value.driver_instance_pool_id
  driver_node_type_id              = each.value.driver_node_type_id
  enable_elastic_disk              = each.value.enable_elastic_disk
  enable_local_disk_encryption     = each.value.enable_local_disk_encryption
  idempotency_token                = each.value.idempotency_token
  instance_pool_id                 = each.value.instance_pool_id
  is_pinned                        = each.value.is_pinned
  is_single_node                   = each.value.is_single_node
  kind                             = each.value.kind
  no_wait                          = each.value.no_wait
  node_type_id                     = each.value.node_type_id
  num_workers                      = each.value.num_workers
  policy_id                        = each.value.policy_id
  remote_disk_throughput           = each.value.remote_disk_throughput
  runtime_engine                   = each.value.runtime_engine
  single_user_name                 = each.value.single_user_name
  spark_conf                       = each.value.spark_conf
  spark_env_vars                   = each.value.spark_env_vars
  ssh_public_keys                  = each.value.ssh_public_keys
  total_initial_remote_disk_size   = each.value.total_initial_remote_disk_size
  use_ml_runtime                   = each.value.use_ml_runtime

  dynamic "autoscale" {
    for_each = each.value.autoscale != null ? [each.value.autoscale] : []
    content {
      max_workers = autoscale.value.max_workers
      min_workers = autoscale.value.min_workers
    }
  }

  dynamic "aws_attributes" {
    for_each = each.value.aws_attributes != null ? [each.value.aws_attributes] : []
    content {
      availability           = aws_attributes.value.availability
      ebs_volume_count       = aws_attributes.value.ebs_volume_count
      ebs_volume_iops        = aws_attributes.value.ebs_volume_iops
      ebs_volume_size        = aws_attributes.value.ebs_volume_size
      ebs_volume_throughput  = aws_attributes.value.ebs_volume_throughput
      ebs_volume_type        = aws_attributes.value.ebs_volume_type
      first_on_demand        = aws_attributes.value.first_on_demand
      instance_profile_arn   = aws_attributes.value.instance_profile_arn
      spot_bid_price_percent = aws_attributes.value.spot_bid_price_percent
      zone_id                = aws_attributes.value.zone_id
    }
  }

  dynamic "azure_attributes" {
    for_each = each.value.azure_attributes != null ? [each.value.azure_attributes] : []
    content {
      availability               = azure_attributes.value.availability
      capacity_reservation_group = azure_attributes.value.capacity_reservation_group
      first_on_demand            = azure_attributes.value.first_on_demand
      dynamic "log_analytics_info" {
        for_each = azure_attributes.value.log_analytics_info != null ? [azure_attributes.value.log_analytics_info] : []
        content {
          log_analytics_primary_key  = log_analytics_info.value.log_analytics_primary_key
          log_analytics_workspace_id = log_analytics_info.value.log_analytics_workspace_id
        }
      }
      spot_bid_max_price = azure_attributes.value.spot_bid_max_price
    }
  }

  dynamic "cluster_log_conf" {
    for_each = each.value.cluster_log_conf != null ? [each.value.cluster_log_conf] : []
    content {
      dynamic "dbfs" {
        for_each = cluster_log_conf.value.dbfs != null ? [cluster_log_conf.value.dbfs] : []
        content {
          destination = dbfs.value.destination
        }
      }
      dynamic "s3" {
        for_each = cluster_log_conf.value.s3 != null ? [cluster_log_conf.value.s3] : []
        content {
          canned_acl        = s3.value.canned_acl
          destination       = s3.value.destination
          enable_encryption = s3.value.enable_encryption
          encryption_type   = s3.value.encryption_type
          endpoint          = s3.value.endpoint
          kms_key           = s3.value.kms_key
          region            = s3.value.region
        }
      }
      dynamic "volumes" {
        for_each = cluster_log_conf.value.volumes != null ? [cluster_log_conf.value.volumes] : []
        content {
          destination = volumes.value.destination
        }
      }
    }
  }

  dynamic "cluster_mount_info" {
    for_each = each.value.cluster_mount_info != null ? each.value.cluster_mount_info : []
    content {
      local_mount_dir_path = cluster_mount_info.value.local_mount_dir_path
      network_filesystem_info {
        mount_options  = cluster_mount_info.value.network_filesystem_info.mount_options
        server_address = cluster_mount_info.value.network_filesystem_info.server_address
      }
      remote_mount_dir_path = cluster_mount_info.value.remote_mount_dir_path
    }
  }

  dynamic "docker_image" {
    for_each = each.value.docker_image != null ? [each.value.docker_image] : []
    content {
      dynamic "basic_auth" {
        for_each = docker_image.value.basic_auth != null ? [docker_image.value.basic_auth] : []
        content {
          password = basic_auth.value.password
          username = basic_auth.value.username
        }
      }
      url = docker_image.value.url
    }
  }

  dynamic "driver_node_type_flexibility" {
    for_each = each.value.driver_node_type_flexibility != null ? [each.value.driver_node_type_flexibility] : []
    content {
      alternate_node_type_ids = driver_node_type_flexibility.value.alternate_node_type_ids
      aws_context_id          = driver_node_type_flexibility.value.aws_context_id
    }
  }

  dynamic "gcp_attributes" {
    for_each = each.value.gcp_attributes != null ? [each.value.gcp_attributes] : []
    content {
      availability              = gcp_attributes.value.availability
      boot_disk_size            = gcp_attributes.value.boot_disk_size
      confidential_compute_type = gcp_attributes.value.confidential_compute_type
      first_on_demand           = gcp_attributes.value.first_on_demand
      google_service_account    = gcp_attributes.value.google_service_account
      local_ssd_count           = gcp_attributes.value.local_ssd_count
      use_preemptible_executors = gcp_attributes.value.use_preemptible_executors
      zone_id                   = gcp_attributes.value.zone_id
    }
  }

  dynamic "init_scripts" {
    for_each = each.value.init_scripts != null ? each.value.init_scripts : []
    content {
      dynamic "abfss" {
        for_each = init_scripts.value.abfss != null ? [init_scripts.value.abfss] : []
        content {
          destination = abfss.value.destination
        }
      }
      dynamic "dbfs" {
        for_each = init_scripts.value.dbfs != null ? [init_scripts.value.dbfs] : []
        content {
          destination = dbfs.value.destination
        }
      }
      dynamic "file" {
        for_each = init_scripts.value.file != null ? [init_scripts.value.file] : []
        content {
          destination = file.value.destination
        }
      }
      dynamic "gcs" {
        for_each = init_scripts.value.gcs != null ? [init_scripts.value.gcs] : []
        content {
          destination = gcs.value.destination
        }
      }
      dynamic "s3" {
        for_each = init_scripts.value.s3 != null ? [init_scripts.value.s3] : []
        content {
          canned_acl        = s3.value.canned_acl
          destination       = s3.value.destination
          enable_encryption = s3.value.enable_encryption
          encryption_type   = s3.value.encryption_type
          endpoint          = s3.value.endpoint
          kms_key           = s3.value.kms_key
          region            = s3.value.region
        }
      }
      dynamic "volumes" {
        for_each = init_scripts.value.volumes != null ? [init_scripts.value.volumes] : []
        content {
          destination = volumes.value.destination
        }
      }
      dynamic "workspace" {
        for_each = init_scripts.value.workspace != null ? [init_scripts.value.workspace] : []
        content {
          destination = workspace.value.destination
        }
      }
    }
  }

  dynamic "library" {
    for_each = each.value.library != null ? each.value.library : []
    content {
      dynamic "cran" {
        for_each = library.value.cran != null ? [library.value.cran] : []
        content {
          package = cran.value.package
          repo    = cran.value.repo
        }
      }
      egg = library.value.egg
      jar = library.value.jar
      dynamic "maven" {
        for_each = library.value.maven != null ? [library.value.maven] : []
        content {
          coordinates = maven.value.coordinates
          exclusions  = maven.value.exclusions
          repo        = maven.value.repo
        }
      }
      dynamic "pypi" {
        for_each = library.value.pypi != null ? [library.value.pypi] : []
        content {
          package = pypi.value.package
          repo    = pypi.value.repo
        }
      }
      requirements = library.value.requirements
      whl          = library.value.whl
    }
  }

  dynamic "provider_config" {
    for_each = each.value.provider_config != null ? [each.value.provider_config] : []
    content {
      workspace_id = provider_config.value.workspace_id
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }

  dynamic "worker_node_type_flexibility" {
    for_each = each.value.worker_node_type_flexibility != null ? [each.value.worker_node_type_flexibility] : []
    content {
      alternate_node_type_ids = worker_node_type_flexibility.value.alternate_node_type_ids
      aws_context_id          = worker_node_type_flexibility.value.aws_context_id
    }
  }

  dynamic "workload_type" {
    for_each = each.value.workload_type != null ? [each.value.workload_type] : []
    content {
      clients {
        jobs      = workload_type.value.clients.jobs
        notebooks = workload_type.value.clients.notebooks
      }
    }
  }
}

