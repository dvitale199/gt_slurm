import argparse
import os 
from QC.imputation import impute_data_prep

# argparse arguments for impute_data_prep
parser = argparse.ArgumentParser(description='Process some files.')
parser.add_argument('--geno_in', type=str, help='plink file prefix (everything before .bed/.bim/.fam))')
parser.add_argument('--geno_out', type=str, help='prefix for per-chromosome imputation files')
parser.add_argument('--ref_panel', type=str, help='Local reference panel directory')
parser.add_argument('--check_bim_pl', type=str, help='Local check_bim.pl directory')

args = parser.parse_args()
geno_in = args.geno_in
geno_out = args.geno_out
ref_panel = args.ref_panel
check_bim_pl = args.check_bim_pl

impute_data_prep(geno_in, geno_out, ref_panel, check_bim_pl)


# remove intermediate files from michigan imputation server prep steps

