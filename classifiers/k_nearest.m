function error = k_nearest(training_set, testing_set)
    model = knnrule(training_set, 3);
    error = classify(testing_set, model);
end

function error = classify(testing_set, model)
    ypred_testing = knnclass(testing_set.X, model);
    error = get_error(ypred_testing, testing_set.y, []);
end