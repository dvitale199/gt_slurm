import argparse
import subprocess
import os

parser = argparse.ArgumentParser(description='Merge PLINK BED files.')


parser.add_argument('--samples', type=str, required=True,
                    help='Path to file containing a single column of sample paths in gcs to include in merged output.')
parser.add_argument('--out_path', type=str, required=True,
                    help='Path to directory where merged output files should be written.')
parser.add_argument('--gcs_in', type=str, help='Google Cloud Storage output directory')
parser.add_argument('--gcs_out', type=str, help='Google Cloud Storage output directory')

args = parser.parse_args()

# use gcsfuse to mount the bucket
os.system(f"gcsfuse {args.gcs_in} {args.out_path}")

# copy files from Google Cloud Storage to local directory
os.system(f"gsutil cp gs://{args.gcs_out}/* {args.out_path}/")

# Run the plink --merge command
merge_cmd = ["plink", "--merge"] + args.samples + ["--make-bed", "--out", os.path.join(args.out_path, "merged_output")]
subprocess.run(merge_cmd, check=True)