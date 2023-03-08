import os
import argparse

parser = argparse.ArgumentParser(description='Process some files.')
parser.add_argument('--input', type=str, help='Local input directory')
# parser.add_argument('--output', type=str, help='Local output directory')
parser.add_argument('--gcs_in', type=str, help='Google Cloud Storage input directory')
parser.add_argument('--gcs_out', type=str, help='Google Cloud Storage output directory')

args = parser.parse_args()

# Create directories
os.makedirs(args.input, exist_ok=True)
# os.makedirs(args.output, exist_ok=True)

# Copy files from Google Cloud Storage to local directory
os.system(f"gsutil cp gs://{args.gcs_in}/* {args.input}/")

# Run iaap-cli command
os.system(f"/home/dan_datatecnica_com/GenoTools/executables/iaap-cli-linux-x64-1.1.0-sha.80d7e5b3d9c1fdfc2e99b472a90652fd3848bbc7/iaap-cli/iaap-cli gencall /home/dan_datatecnica_com/ilmn_files/NeuroBooster_20042459_A2.bpm /home/dan_datatecnica_com/ilmn_files/recluster_09272022.egt {args.input} -f {args.input} -p -t 4")

# Convert PED files to BED/BIM/FAM files using plink2
for ped_file in os.listdir(args.input):
    if ped_file.endswith(".ped"):
        ped_file_path = os.path.join(args.input, ped_file)
        out_file_path = os.path.join(args.input, os.path.splitext(ped_file)[0])
        cp_cmd = f"cp {args.input}/NeuroBooster_20042459_A2.map {out_file_path}.map"
        os.system(cp_cmd)
        plink_cmd = f"plink --ped {ped_file_path} --make-bed --out {out_file_path}"
        os.system(plink_cmd)

# Copy output files back to Google Cloud Storage
os.system(f"gsutil cp {args.input}/*.{{bed,bim,fam,log}} gs://{args.gcs_out}/")
