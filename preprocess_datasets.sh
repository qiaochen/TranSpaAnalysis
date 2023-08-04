#!/bin/bash
DIR="../../output"
if [ -d "$DIR" ]; then
  echo "Preprocessed files will be stored in ${DIR}..."
else
  ###  Control will jump here if $DIR does NOT exists ###
  echo "${DIR} not found. Create new..."
  mkdir -p ../../output/preprocessed_dataset/
  mkdir ../../output/locations/
  mkdir ../../output/clustering/
  mkdir ../../output/performance_uncertainty/
fi

python preprocess_osmFISH_AllenVISp.py
python preprocess_seqFISH_singlecell.py
python preprocess_starmap_AllenVISp.py
python preprocess_merfish_moffit.py

python preprocess_intestine.py
python preprocess_breastcancer.py
python preprocess_melanoma.py
python preprocess_mouseliver.py