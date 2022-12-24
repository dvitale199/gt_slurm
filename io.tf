variable "cluster_name" {
  description = "Name of the cluster"
  type        = string
}

variable "project" {
  type = string
}

variable "zone" {
  type = string
}

variable "controller_machine_type" {
  description = "Machine type to use for the controller instance"
  type        = string
  default     = null
}

variable "controller_image" {
  description = "Slurm image to use for the controller instance"
  type        = string
  default     = null
}

variable "controller_disk_type" {
  description = "Disk type (pd-ssd or pd-standard) for controller."
  type        = string
  default     = null
}

variable "controller_disk_size_gb" {
  description = "Size of disk for the controller."
  type        = number
  default     = null
}

variable "login_machine_type" {
  description = "Machine type to use for login node instances."
  type        = string
  default     = null
}

variable "login_image" {
  description = "Slurm image to use for login instances"
  type        = string
  default     = null
}

variable "login_disk_type" {
  description = "Disk type (pd-ssd or pd-standard) for login nodes."
  type        = string
  default     = null
}

variable "login_disk_size_gb" {
  description = "Size of disk for login nodes."
  type        = number
  default     = null
}

variable "partitions" {
  description = "An array of configurations for specifying multiple machine types residing in their own Slurm partitions."
  type = list(object({
    name                 = string,
    machine_type         = string,
    max_node_count       = number,
    zone                 = string,
    image                = string,
    image_hyperthreads   = bool,
    compute_disk_type    = string,
    compute_disk_size_gb = number,
    compute_labels       = any,
    cpu_platform         = string,
    gpu_type             = string,
    gpu_count            = number,
    network_storage = list(object({
      server_ip    = string,
      remote_mount = string,
      local_mount  = string,
      fs_type      = string,
    mount_options = string })),
    preemptible_bursting = string,
    vpc_subnet           = string,
    exclusive            = bool,
    enable_placement     = bool,
    regional_capacity    = bool,
    regional_policy      = any,
    instance_template    = string,
    bandwidth_tier       = string,
  static_node_count = number }))
}


