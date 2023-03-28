import os
import argparse
import sys

parser = argparse.ArgumentParser(description='Process some files.')
parser.add_argument('--input', type=str, help='Input directory containing idat files')
parser.add_argument('--output', type=str, help='Output directory for plink bed/bim/fam files')

args = parser.parse_args()

home_dir = os.path.expanduser("~")
mount_dir = "/genoslurm_nfs"
iaap = f"{home_dir}/GenoTools/executables/iaap-cli-linux-x64-1.1.0-sha.80d7e5b3d9c1fdfc2e99b472a90652fd3848bbc7/iaap-cli/iaap-cli"

# Run iaap-cli command
os.system(f"{iaap} gencall {mount_dir}/ilmn_files/NeuroBooster_20042459_A2.bpm {mount_dir}/ilmn_files/recluster_09272022.egt {args.output} -f {args.input} -p -t 4")

# Convert PED files to BED/BIM/FAM files using plink
for ped_file in os.listdir(args.output):
    if ped_file.endswith(".ped"):
        ped_file_path = os.path.join(args.output, ped_file)
        out_file_path = os.path.join(args.output, os.path.splitext(ped_file)[0])
        ped_in = ped_file_path.split('.')[0]
        cp_cmd = f"cp {args.output}/NeuroBooster_20042459_A2.map {out_file_path}.map"
        os.system(cp_cmd)
        plink_cmd = f"{mount_dir}/bin/plink --file {ped_in} --make-bed --out {out_file_path}"
        os.system(plink_cmd)
        # if output bed exists, delete ped/map files otherwise print error to stderr
        if os.path.exists(f"{out_file_path}.bed"):
            rm_cmd = f"rm {ped_in}.{{ped,map}}"
            os.system(rm_cmd)
        else:
            # print error to stderr
            print(f"Error: {out_file_path}.bed does not exist", file=sys.stderr)

