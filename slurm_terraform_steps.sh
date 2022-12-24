# steps from gcp codelabs: https://codelabs.developers.google.com/codelabs/hpc-slurm-on-gcp
git clone https://github.com/SchedMD/slurm-gcp.git
# use older branch
cd slurm-gcp
git checkout v4
cd tf/examples/basic
cp basic.tfvars.example basic.tfvars

# edit tfvars file with the following info
# set parameters
cluster_name = "genoslurm"
project      = "genotools"
zone         = "us-central1-a"

# all options for partition
partitions = [
  { name                 = "debug"
    machine_type         = "n1-standard-2"
    static_node_count    = 0
    max_node_count       = 100
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
    network_storage      = [{
       server_ip     = "none"
       remote_mount  = "gs://gp2_data"
       local_mount   = "/data"
       fs_type       = "gcsfuse"
       mount_options = "file_mode=664,dir_mode=775,allow_other"
     }]
  }]


# now launch the cluster
terraform init
terraform apply -var-file=basic.tfvars

# use the login node
gcloud compute ssh --zone "us-central1-a" "genoslurm-login0"  --tunnel-through-iap --project "genotools"
# leave login node
exit

# now destroy all managed infrastructure
terraform destroy -var-file=basic.tfvars

