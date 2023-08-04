# TranSpaAnalysis
Analysis notebooks reported in Manuscript:

For replication please follow the following steps:

## 0. Preparation

### 0.1 Install required packages

- Please refer to repo [Transpa](https://github.com/qiaochen/tranSpa/tree/main) for installing tranSpa,
- We have SpaGE included in this repo, but [Tangram](https://github.com/broadinstitute/Tangram), [stPlus](https://github.com/xy-chen16/stPlus), and [SparkX](https://xzhoulab.github.io/SPARK/04_installation/) should be installed following their software documents:
- Note that SparkX is an R package, make sure you change the R software bin path in line `!source /home/cqiao/.bashrc; ~/R/bin/Rscript sparkX.r intestine5fold` to your working R environment when executing the following notebooks:
    - `imputation_base_intestine.ipynb`
    - `imputation_base_melanoma.ipynb`
    - `imputation_base_breastcancer.ipynb`
    - `imputation_base_mouseliver.ipynb`
- [scvelo](https://scvelo.readthedocs.io/en/stable/installation/) is required for RNA Velocity analysis

### 0.2 Get raw data

- All the ST and SC datasets can be downloaded from [Zenodo](https://zenodo.org/record/8172197); 
- the raw data are compressed as [data.tar.gz](https://zenodo.org/record/8172197/files/data.tar.gz?download=1)

after downloading `data.tar.gz` (may take a while), extract files using the following command (linux):

```
tar -xvzf data.tar.gz
```

If you do not want to change the file paths in the codes, please organize the project directory as:

```
RootFolder
    |-- analysis
    |        |-- TranSpaAnalysis
    |                    |- README.md
    |                    |- preprocess_datasets.sh
    |                    |  ... 
    |-- data
    |-- output            
```

>It is also possible to have a quick inspection for the reported plots in our manuscript with our generated [output.tar.gz](https://zenodo.org/record/8172197/files/output.tar.gz?download=1) and extracting it to the specified location.

### 0.3 Run preprocessing

Run preprocessing for all the ST and SC datasets, so that our codes and notebooks can run more efficiently. 

```
sh ./preprocess_datasets.sh
```

This will run all the `preprocess_*.py` scripts. The preprocessed data would be stored in `../../output/preprocessed_dataset` (relative location based on the default project organization shown above)

## 1. Run Experiments:

### 1.1 Executing ST imputation notebooks:
- `imputation_base_seqfish_singlecell.ipynb`
- `imputation_base_osmFISH_AllenVISp.ipynb`
- `imputation_base_merfish_moffit.ipynb`
- `imputation_base_starmap_AllenVISp.ipynb`

### 1.2 Results plotting:
- `plotting_merfish.ipynb`
- `plotting_osmfish.ipynb`
- `plotting_seqfish.ipynb`
- `plotting_starmap.ipynb`

### 1.3 Run efficiency benchmarking
```
sh ./eval.sh
```

### 1.4 Summary plotting
- `plotting.ipynb`

### 1.5 Explore imputed non-probed genes on SeqFISH:
- `seqfish_exploration.ipynb`

### 1.6 Executing imputation & downstream analysis on Visium datasets
Please remember to change the R bin path in the line `!source /home/cqiao/.bashrc; ~/R/bin/Rscript sparkX.r intestine5fold` to your working R environment.

- `imputation_base_intestine.ipynb`
- `imputation_base_melanoma.ipynb`
- `imputation_base_breastcancer.ipynb`
- `imputation_base_mouseliver.ipynb`

### 1.7 Results plotting for Visium experiments:
- `visium_eval.ipynb`

### 1.8 ST RNA velocity estimation:
Please install [scvelo](https://scvelo.readthedocs.io/en/stable/installation/) before running the notebooks.

- `transvelo_chickenheart.ipynb`
- `transvelo_mousebrain.ipynb`






