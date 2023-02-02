# steps from gcp codelabs: https://codelabs.developers.google.com/codelabs/hpc-slurm-on-gcp
git clone https://github.com/SchedMD/slurm-gcp.git
# use older branch
cd slurm-gcp
git checkout v4
cd tf/examples/basic
cp basic.tfvars.example basic.tfvars

# now launch the cluster
terraform init
terraform plan -var-file=genoslurm.tfvars -out genoslurm_plan
terraform apply -var-file=genoslurm.tfvars

# use the login node
gcloud compute ssh --zone "us-central1-a" "genoslurm-login0"  --tunnel-through-iap --project "genotools"
# leave login node
exit

# now destroy all managed infrastructure
terraform destroy -var-file=basic.tfvars

