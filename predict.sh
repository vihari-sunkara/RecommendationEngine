#!/bin/bash


model_dir="model"

tst_ft_file="../tst_X_Xf.txt"
score_file="../score_mat.txt"

#mkdir -p $model_dir

# training
# Reads training features (in $trn_ft_file), training labels (in $trn_lbl_file), and writes FastXML model to $model_dir

# NOTE: The usage of Bonsai for other datasets requires setting parameter `-m` to 2 for smaller datasets like EUR-Lex, Wikipedia-31K 
#       and to 3 for larger datasets like Delicious-200K, WikiLSHTC-325K, Amazon-670K, Wikipedia-500K, Amazon-3M.


# testing
# Reads test features (in $tst_ft_file), FastXML model (in $model_dir), and writes test label scores to $score_file
bash sedscript
cd shallow

date +"%T"

./bonsai_predict $tst_ft_file $score_file ../$model_dir

date +"%T"
#if [ ! -f ${score_file} ]; then
#    ./bonsai_predict $tst_ft_file $score_file $model_dir
#else
#    echo "using $score_file (cached)"
#fi

# performance evaluation 
#matlab -nodesktop -nodisplay -r "cd('$PWD'); addpath(genpath('../tools')); trn_X_Y = read_text_mat('$trn_lbl_file'); tst_X_Y = read_text_mat('$tst_lbl_file'); wts = inv_propensity(trn_X_Y,0.55,1.5); score_mat = read_text_mat('$score_file'); get_all_metrics(score_mat, tst_X_Y, wts); exit;"

