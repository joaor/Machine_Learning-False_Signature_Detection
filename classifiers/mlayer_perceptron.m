function error = mlayer_perceptron(training_set, testing_set)
    options.tmax = 100;
    model = mperceptron(training_set, options);
    
    [ypred_testing, dfce] = linclass(testing_set.X, model);
    error = get_error(ypred_testing, testing_set.y, dfce);
end