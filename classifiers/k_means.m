function k_means(training_set, testing_set)
    [model_trn,trn.y] = cmeans(training_set.X, 2);
    [model_tst,tst.y] = cmeans(testing_set.X, 2);
end