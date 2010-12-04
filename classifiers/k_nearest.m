function k_nearest(training_set, testing_set)
    model = knnrule(training_set, 2);

    ypred_training = knnclass(training_set.X,model);
    ypred_testing = knnclass(testing_set.X,model);
end