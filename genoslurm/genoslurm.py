import os


def chunks(lst, n):
    """Yield successive n-sized chunks from lst."""
    outlist = []
    for i in range(0, len(lst), n):
        outlist.append(lst[i:i + n])
    return outlist

class GenCallJob:
    def __init__(self, sbatch_path, idat_dir_ins, gcs_idat_path, iaap, bpm, egt, gcs_plink_path, log_path, job_name='my_job', threads=2, ntasks=1, cpus_per_task=1, mem_per_cpu='2G', time='01:00:00'):
        self.sbatch_path = sbatch_path
        self.idat_dir_ins = idat_dir_ins
        # self.tmp_out_dir = tmp_out_dir
        self.gcs_idat_path = gcs_idat_path
        self.iaap = iaap
        self.bpm = bpm
        self.egt = egt
        self.gcs_plink_path = gcs_plink_path
        self.log_path = log_path
        self.job_name = job_name
        self.threads = threads
        self.ntasks = ntasks
        self.cpus_per_task = cpus_per_task
        self.mem_per_cpu = mem_per_cpu
        self.time = time

    def write_header(self):
        header = f"""#!/bin/bash
#SBATCH --job-name={self.job_name}
#SBATCH --ntasks={self.ntasks}
#SBATCH --cpus-per-task={self.cpus_per_task}
#SBATCH --mem-per-cpu={self.mem_per_cpu}
#SBATCH --time={self.time}

"""
        return header


    def write_script(self, idat_dir_in, gcs_idat_path):
        script = f"""
# Processing {idat_dir_in}
mkdir -p {idat_dir_in}
gsutil cp gs://{gcs_idat_path}/* {idat_dir_in}/
{self.iaap} gencall {self.bpm} {self.egt} {idat_dir_in} -f {idat_dir_in} -p -t {self.threads}

# Convert PED files to BED/BIM/FAM files using plink2
for ped_file in {idat_dir_in}/*.ped; do
    
    plink2 --ped "${{ped_file%.*}}" --map {idat_dir_in}/NeuroBooster_20042459_A2.map --make-bed --out "${{ped_file%.*}}"
done

gsutil cp {idat_dir_in}/*.{{bed,bim,fam,log}} gs://{self.gcs_plink_path}/

"""
        return script


    def write_sbatch_script(self):
        commands = []
        header = self.write_header()
        for idat_dir_in in self.idat_dir_ins:
            code = idat_dir_in.split('/')[-1]
            gcs_idat_path = f'{self.gcs_idat_path}/{code}'
            command = self.write_script(idat_dir_in, gcs_idat_path)
            commands.append(command)
#             commands.append(
#                 f'\
# srun \
# --ntasks=1 \
# --nodes=1 \
# --cpus-per-task 3 \
# --output={self.log_path}/{self.job_name}-%j-%t.out \
# --error={self.log_path}/{self.job_name}-%j-%t.err \
# /bin/bash -c "{command}"'
#                 )
        
        script = " & \\\n".join(commands)

        full_script = header + script

        with open(f'{self.sbatch_path}', 'w') as f:
            f.write(full_script)


#    cp {idat_dir_in}/NeuroBooster_20042459_A2.map "${{ped_file%.*}}.map"    