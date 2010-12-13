function error = k_means(training_set, testing_set)
    [model,ypred_testing] = cmeans(testing_set.X, 2);
    
    error = get_error(ypred_testing, testing_set.y);
end