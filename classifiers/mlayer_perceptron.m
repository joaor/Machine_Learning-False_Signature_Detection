function mlayer_perceptron(training_set, testing_set)
    model = mperceptron(training_set);
    
    ypred_training = linclass(training_set.X, model);
    ypred_testing = linclass(testing_set.X, model);
end