All the commands listed in this file are run in the "dataset" directory.
1.AthMethPre
1)encode the trainset and the testset and save the coding to the file "coding_train_sun" and "coding_test_sun".
>python encode_sun.py trainset coding_train_sun
>python encode_sun.py testset coding_test_sun
2)do the 5-fold cross validation and the prediction scores are saved to the file "sun_cv_score"(the path of the "LIBSVM" software should be set in the file "sun_cv.R").
>Rscript sun_cv.R
3)do the independent test and the prediction scores are saved to the file "sun_test_score" (the path of the "LIBSVM" software should be set in the file "predict_test_sun.R").
>Rscript predict_test_sun.R
2.M6ATH
1)encode the trainset and testset and save the coding to the file "coding_train_chen" and "coding_test_chen".
>python encode_chen.py trainset coding_train_chen
>python encode_chen.py testset coding_test_chen
2)do the 5-fold cross validation and the prediction scores are saved to the file "chen_cv_score"(the path of the "LIBSVM" software should be set in the file "chen_cv.R").
>Rscript chen_cv.R
3)do the independent test and the prediction scores are saved to the file "chen_test_score" (the path of the "LIBSVM" software should be set in the file "predict_test_chen.R").
>Rscript predict_test_chen.R
3.RFPSNSP
1)encode the feature and do the 5-fold cross validation. The prediction scores are saved to the file "psnsp_cv_score"(the path of the "LIBSVM" software should be set in the file "psnsp_cv.R").
>Rscript psnsp_cv.R
2)do the independent test and the prediction scores are saved to the file "psnsp_test_score" (the path of the "LIBSVM" software should be set in the file "predict_test_psnsp.R").
>Rscript predict_test_psnsp.R
4.RFPSDSP
1)encode the feature and do the 5-fold cross validation. The prediction scores are saved to the file "psdsp_cv_score"(the path of the "LIBSVM" software should be set in the file "psdsp_cv.R").
>Rscript psdsp_cv.R
2)do the independent test and the prediction scores are saved to the file "psdsp_test_score" (the path of the "LIBSVM" software should be set in the file "predict_test_psdsp.R").
>Rscript predict_test_psdsp.R
5.RFKSNPF
1)encode the trainset and the testset and save the coding to the file "coding_train_ksnpf" and "coding_test_ksnpf".
>python encode_ksnpf.py trainset coding_train_ksnpf
>python encode_ksnpf.py testset coding_test_ksnpf
2)do the 5-fold cross validation and the prediction scores are saved to the file "ksnpf_cv_score".
>Rscript ksnpf_cv.R
3)do the independent test and the prediction scores are saved to the file "ksnpf_test_score".
>Rscript predict_test_ksnpf.R
6.RFKNF
1)encode the trainset and the testset and save the coding to the file "coding_train_knf" and "coding_test_knf".
>python encode_knf.py trainset coding_train_knf
>python encode_knf.py testset coding_test_knf
2)do the 5-fold cross validation and the prediction scores are saved to the file "knf_cv_score".
>Rscript knf_cv.R
3)do the independent test and the prediction scores are saved to the file "knf_test_score".
>Rscript predict_test_knf.R
7.RFCombine
1)do the 5-fold cross validation and the prediction scores are saved to the file "combine_cv_score".
>Rscript knf_cv.R
2)do the independent test and the prediction scores are saved to the file "combine_test_score".
>Rscript predict_test_combine.R
8. The rules we extrated from the random forest models are listed in files "psnsp_rule", "psdsp_rule", "ksnpf_rule" and "knf_rule".
