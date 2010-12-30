function error = fisher_linear_discriminant_quadratic(training_set, testing_set)
    model = fldqp(training_set);
    
    [ypred_testing, dfce] = linclass(testing_set.X, model);
    error = get_error(ypred_testing, testing_set.y, dfce);
end