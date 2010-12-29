function error = perceptron_classifier(training_set, testing_set)
    data = genlsdata(training_set.dim, training_set.num_data, 1);
    model = perceptron(data);

    ypred_testing = linclass(testing_set.X, model);
    error = get_error(ypred_testing, testing_set.y);
end