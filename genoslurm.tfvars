# cluster details
cluster_name = "genoslurm"
project      = "genotools"
zone         = "us-central1-a"

# controller machine specs
controller_machine_type = "n1-standard-2"
controller_image        = "projects/schedmd-slurm-public/global/images/family/schedmd-slurm-20-11-4-hpc-centos-7"
controller_disk_type    = "pd-standard"
controller_disk_size_gb = 10

# login machine specs
login_machine_type = "n1-standard-2"
login_image        = "projects/schedmd-slurm-public/global/images/family/schedmd-slurm-20-11-4-hpc-centos-7"
login_disk_type    = "pd-standard"
login_disk_size_gb = 20

#create partition
partitions = [
    { name               = "gt_core"
    machine_type         = "n1-standard-2"
    static_node_count    = 0
    max_node_count       = 10
    zone                 = "us-central1-a"
    image                ="projects/schedmd-slurm-public/global/images/family/schedmd-slurm-20-11-4-hpc-centos-7"
    image_hyperthreads   = false
    compute_disk_type    = "pd-standard"
    compute_disk_size_gb = 20
    compute_labels       = {}
    cpu_platform         = null
    gpu_count            = 0
    gpu_type             = null
    network_storage      = []
    preemptible_bursting = false
    vpc_subnet           = null
    exclusive            = false
    enable_placement     = false
    regional_capacity    = false
    regional_policy      = {}
    instance_template    = null
    bandwidth_tier       = null
    network_storage      = [{
       server_ip     = "none"
       remote_mount  = "gs://gp2_data"
       local_mount   = "/data"
       fs_type       = "gcsfuse"
       mount_options = "file_mode=664,dir_mode=775,allow_other"
     }]
    }
  ]






















