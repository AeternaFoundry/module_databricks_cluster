output "clusters_id" {
  description = "Map of id values across all clusters, keyed the same as var.clusters except keys with no id are omitted"
  value       = { for k, v in databricks_cluster.clusters : k => v.id if v.id != null && length(v.id) > 0 }
}
output "clusters_apply_policy_default_values" {
  description = "Map of apply_policy_default_values values across all clusters, keyed the same as var.clusters except keys with no apply_policy_default_values are omitted"
  value       = { for k, v in databricks_cluster.clusters : k => v.apply_policy_default_values if v.apply_policy_default_values != null }
}
output "clusters_autoscale" {
  description = "Map of autoscale values across all clusters, keyed the same as var.clusters except keys with no autoscale are omitted"
  value       = { for k, v in databricks_cluster.clusters : k => one(v.autoscale) if v.autoscale != null && length(v.autoscale) > 0 }
}
output "clusters_autotermination_minutes" {
  description = "Map of autotermination_minutes values across all clusters, keyed the same as var.clusters except keys with no autotermination_minutes are omitted"
  value       = { for k, v in databricks_cluster.clusters : k => v.autotermination_minutes if v.autotermination_minutes != null }
}
output "clusters_aws_attributes" {
  description = "Map of aws_attributes values across all clusters, keyed the same as var.clusters except keys with no aws_attributes are omitted"
  value       = { for k, v in databricks_cluster.clusters : k => one(v.aws_attributes) if v.aws_attributes != null && length(v.aws_attributes) > 0 }
}
output "clusters_azure_attributes" {
  description = "Map of azure_attributes values across all clusters, keyed the same as var.clusters except keys with no azure_attributes are omitted"
  value       = { for k, v in databricks_cluster.clusters : k => one(v.azure_attributes) if v.azure_attributes != null && length(v.azure_attributes) > 0 }
}
output "clusters_clear_cloud_attributes_on_remove" {
  description = "Map of clear_cloud_attributes_on_remove values across all clusters, keyed the same as var.clusters except keys with no clear_cloud_attributes_on_remove are omitted"
  value       = { for k, v in databricks_cluster.clusters : k => v.clear_cloud_attributes_on_remove if v.clear_cloud_attributes_on_remove != null }
}
output "clusters_cluster_id" {
  description = "Map of cluster_id values across all clusters, keyed the same as var.clusters except keys with no cluster_id are omitted"
  value       = { for k, v in databricks_cluster.clusters : k => v.cluster_id if v.cluster_id != null && length(v.cluster_id) > 0 }
}
output "clusters_cluster_log_conf" {
  description = "Map of cluster_log_conf values across all clusters, keyed the same as var.clusters except keys with no cluster_log_conf are omitted"
  value       = { for k, v in databricks_cluster.clusters : k => one(v.cluster_log_conf) if v.cluster_log_conf != null && length(v.cluster_log_conf) > 0 }
}
output "clusters_cluster_mount_info" {
  description = "Map of cluster_mount_info values across all clusters, keyed the same as var.clusters except keys with no cluster_mount_info are omitted"
  value       = { for k, v in databricks_cluster.clusters : k => v.cluster_mount_info if v.cluster_mount_info != null && length(v.cluster_mount_info) > 0 }
}
output "clusters_cluster_name" {
  description = "Map of cluster_name values across all clusters, keyed the same as var.clusters except keys with no cluster_name are omitted"
  value       = { for k, v in databricks_cluster.clusters : k => v.cluster_name if v.cluster_name != null && length(v.cluster_name) > 0 }
}
output "clusters_custom_tags" {
  description = "Map of custom_tags values across all clusters, keyed the same as var.clusters except keys with no custom_tags are omitted"
  value       = { for k, v in databricks_cluster.clusters : k => v.custom_tags if v.custom_tags != null && length(v.custom_tags) > 0 }
}
output "clusters_data_security_mode" {
  description = "Map of data_security_mode values across all clusters, keyed the same as var.clusters except keys with no data_security_mode are omitted"
  value       = { for k, v in databricks_cluster.clusters : k => v.data_security_mode if v.data_security_mode != null && length(v.data_security_mode) > 0 }
}
output "clusters_default_tags" {
  description = "Map of default_tags values across all clusters, keyed the same as var.clusters except keys with no default_tags are omitted"
  value       = { for k, v in databricks_cluster.clusters : k => v.default_tags if v.default_tags != null && length(v.default_tags) > 0 }
}
output "clusters_dependency_mode" {
  description = "Map of dependency_mode values across all clusters, keyed the same as var.clusters except keys with no dependency_mode are omitted"
  value       = { for k, v in databricks_cluster.clusters : k => v.dependency_mode if v.dependency_mode != null && length(v.dependency_mode) > 0 }
}
output "clusters_docker_image" {
  description = "Map of docker_image values across all clusters, keyed the same as var.clusters except keys with no docker_image are omitted"
  value       = { for k, v in databricks_cluster.clusters : k => one(v.docker_image) if v.docker_image != null && length(v.docker_image) > 0 }
  sensitive   = true
}
output "clusters_driver_instance_pool_id" {
  description = "Map of driver_instance_pool_id values across all clusters, keyed the same as var.clusters except keys with no driver_instance_pool_id are omitted"
  value       = { for k, v in databricks_cluster.clusters : k => v.driver_instance_pool_id if v.driver_instance_pool_id != null && length(v.driver_instance_pool_id) > 0 }
}
output "clusters_driver_node_type_flexibility" {
  description = "Map of driver_node_type_flexibility values across all clusters, keyed the same as var.clusters except keys with no driver_node_type_flexibility are omitted"
  value       = { for k, v in databricks_cluster.clusters : k => one(v.driver_node_type_flexibility) if v.driver_node_type_flexibility != null && length(v.driver_node_type_flexibility) > 0 }
}
output "clusters_driver_node_type_id" {
  description = "Map of driver_node_type_id values across all clusters, keyed the same as var.clusters except keys with no driver_node_type_id are omitted"
  value       = { for k, v in databricks_cluster.clusters : k => v.driver_node_type_id if v.driver_node_type_id != null && length(v.driver_node_type_id) > 0 }
}
output "clusters_enable_elastic_disk" {
  description = "Map of enable_elastic_disk values across all clusters, keyed the same as var.clusters except keys with no enable_elastic_disk are omitted"
  value       = { for k, v in databricks_cluster.clusters : k => v.enable_elastic_disk if v.enable_elastic_disk != null }
}
output "clusters_enable_local_disk_encryption" {
  description = "Map of enable_local_disk_encryption values across all clusters, keyed the same as var.clusters except keys with no enable_local_disk_encryption are omitted"
  value       = { for k, v in databricks_cluster.clusters : k => v.enable_local_disk_encryption if v.enable_local_disk_encryption != null }
}
output "clusters_gcp_attributes" {
  description = "Map of gcp_attributes values across all clusters, keyed the same as var.clusters except keys with no gcp_attributes are omitted"
  value       = { for k, v in databricks_cluster.clusters : k => one(v.gcp_attributes) if v.gcp_attributes != null && length(v.gcp_attributes) > 0 }
}
output "clusters_idempotency_token" {
  description = "Map of idempotency_token values across all clusters, keyed the same as var.clusters except keys with no idempotency_token are omitted"
  value       = { for k, v in databricks_cluster.clusters : k => v.idempotency_token if v.idempotency_token != null && length(v.idempotency_token) > 0 }
}
output "clusters_init_scripts" {
  description = "Map of init_scripts values across all clusters, keyed the same as var.clusters except keys with no init_scripts are omitted"
  value       = { for k, v in databricks_cluster.clusters : k => v.init_scripts if v.init_scripts != null && length(v.init_scripts) > 0 }
}
output "clusters_instance_pool_id" {
  description = "Map of instance_pool_id values across all clusters, keyed the same as var.clusters except keys with no instance_pool_id are omitted"
  value       = { for k, v in databricks_cluster.clusters : k => v.instance_pool_id if v.instance_pool_id != null && length(v.instance_pool_id) > 0 }
}
output "clusters_is_pinned" {
  description = "Map of is_pinned values across all clusters, keyed the same as var.clusters except keys with no is_pinned are omitted"
  value       = { for k, v in databricks_cluster.clusters : k => v.is_pinned if v.is_pinned != null }
}
output "clusters_is_single_node" {
  description = "Map of is_single_node values across all clusters, keyed the same as var.clusters except keys with no is_single_node are omitted"
  value       = { for k, v in databricks_cluster.clusters : k => v.is_single_node if v.is_single_node != null }
}
output "clusters_kind" {
  description = "Map of kind values across all clusters, keyed the same as var.clusters except keys with no kind are omitted"
  value       = { for k, v in databricks_cluster.clusters : k => v.kind if v.kind != null && length(v.kind) > 0 }
}
output "clusters_library" {
  description = "Map of library values across all clusters, keyed the same as var.clusters except keys with no library are omitted"
  value       = { for k, v in databricks_cluster.clusters : k => v.library if v.library != null && length(v.library) > 0 }
}
output "clusters_no_wait" {
  description = "Map of no_wait values across all clusters, keyed the same as var.clusters except keys with no no_wait are omitted"
  value       = { for k, v in databricks_cluster.clusters : k => v.no_wait if v.no_wait != null }
}
output "clusters_node_type_id" {
  description = "Map of node_type_id values across all clusters, keyed the same as var.clusters except keys with no node_type_id are omitted"
  value       = { for k, v in databricks_cluster.clusters : k => v.node_type_id if v.node_type_id != null && length(v.node_type_id) > 0 }
}
output "clusters_num_workers" {
  description = "Map of num_workers values across all clusters, keyed the same as var.clusters except keys with no num_workers are omitted"
  value       = { for k, v in databricks_cluster.clusters : k => v.num_workers if v.num_workers != null }
}
output "clusters_policy_id" {
  description = "Map of policy_id values across all clusters, keyed the same as var.clusters except keys with no policy_id are omitted"
  value       = { for k, v in databricks_cluster.clusters : k => v.policy_id if v.policy_id != null && length(v.policy_id) > 0 }
}
output "clusters_provider_config" {
  description = "Map of provider_config values across all clusters, keyed the same as var.clusters except keys with no provider_config are omitted"
  value       = { for k, v in databricks_cluster.clusters : k => one(v.provider_config) if v.provider_config != null && length(v.provider_config) > 0 }
}
output "clusters_remote_disk_throughput" {
  description = "Map of remote_disk_throughput values across all clusters, keyed the same as var.clusters except keys with no remote_disk_throughput are omitted"
  value       = { for k, v in databricks_cluster.clusters : k => v.remote_disk_throughput if v.remote_disk_throughput != null }
}
output "clusters_runtime_engine" {
  description = "Map of runtime_engine values across all clusters, keyed the same as var.clusters except keys with no runtime_engine are omitted"
  value       = { for k, v in databricks_cluster.clusters : k => v.runtime_engine if v.runtime_engine != null && length(v.runtime_engine) > 0 }
}
output "clusters_single_user_name" {
  description = "Map of single_user_name values across all clusters, keyed the same as var.clusters except keys with no single_user_name are omitted"
  value       = { for k, v in databricks_cluster.clusters : k => v.single_user_name if v.single_user_name != null && length(v.single_user_name) > 0 }
}
output "clusters_spark_conf" {
  description = "Map of spark_conf values across all clusters, keyed the same as var.clusters except keys with no spark_conf are omitted"
  value       = { for k, v in databricks_cluster.clusters : k => v.spark_conf if v.spark_conf != null && length(v.spark_conf) > 0 }
}
output "clusters_spark_env_vars" {
  description = "Map of spark_env_vars values across all clusters, keyed the same as var.clusters except keys with no spark_env_vars are omitted"
  value       = { for k, v in databricks_cluster.clusters : k => v.spark_env_vars if v.spark_env_vars != null && length(v.spark_env_vars) > 0 }
}
output "clusters_spark_version" {
  description = "Map of spark_version values across all clusters, keyed the same as var.clusters except keys with no spark_version are omitted"
  value       = { for k, v in databricks_cluster.clusters : k => v.spark_version if v.spark_version != null && length(v.spark_version) > 0 }
}
output "clusters_ssh_public_keys" {
  description = "Map of ssh_public_keys values across all clusters, keyed the same as var.clusters except keys with no ssh_public_keys are omitted"
  value       = { for k, v in databricks_cluster.clusters : k => v.ssh_public_keys if v.ssh_public_keys != null && length(v.ssh_public_keys) > 0 }
}
output "clusters_state" {
  description = "Map of state values across all clusters, keyed the same as var.clusters except keys with no state are omitted"
  value       = { for k, v in databricks_cluster.clusters : k => v.state if v.state != null && length(v.state) > 0 }
}
output "clusters_total_initial_remote_disk_size" {
  description = "Map of total_initial_remote_disk_size values across all clusters, keyed the same as var.clusters except keys with no total_initial_remote_disk_size are omitted"
  value       = { for k, v in databricks_cluster.clusters : k => v.total_initial_remote_disk_size if v.total_initial_remote_disk_size != null }
}
output "clusters_url" {
  description = "Map of url values across all clusters, keyed the same as var.clusters except keys with no url are omitted"
  value       = { for k, v in databricks_cluster.clusters : k => v.url if v.url != null && length(v.url) > 0 }
}
output "clusters_use_ml_runtime" {
  description = "Map of use_ml_runtime values across all clusters, keyed the same as var.clusters except keys with no use_ml_runtime are omitted"
  value       = { for k, v in databricks_cluster.clusters : k => v.use_ml_runtime if v.use_ml_runtime != null }
}
output "clusters_worker_node_type_flexibility" {
  description = "Map of worker_node_type_flexibility values across all clusters, keyed the same as var.clusters except keys with no worker_node_type_flexibility are omitted"
  value       = { for k, v in databricks_cluster.clusters : k => one(v.worker_node_type_flexibility) if v.worker_node_type_flexibility != null && length(v.worker_node_type_flexibility) > 0 }
}
output "clusters_workload_type" {
  description = "Map of workload_type values across all clusters, keyed the same as var.clusters except keys with no workload_type are omitted"
  value       = { for k, v in databricks_cluster.clusters : k => one(v.workload_type) if v.workload_type != null && length(v.workload_type) > 0 }
}

