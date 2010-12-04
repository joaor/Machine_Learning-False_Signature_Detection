function fisher_linear_discriminant(training_set, testing_set)
    model = fld(training_set);

    ypred_training = linclass(training_set.X, model);
    ypred_testing = linclass(testing_set.X, model);
end