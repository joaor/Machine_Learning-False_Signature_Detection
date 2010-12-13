function error = k_nearest(training_set, testing_set)
    model = knnrule(training_set, 2);

    ypred_testing = knnclass(testing_set.X,model);
    error = get_error(ypred_testing, testing_set.y);
end