function error = mlayer_perceptron(training_set, testing_set)
    model = mperceptron(training_set);
    
    ypred_testing = linclass(testing_set.X, model);
    error = get_error(ypred_testing, testing_set.y);
end