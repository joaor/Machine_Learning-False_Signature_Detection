function error = rbf(training_set, testing_set)
    rb = newrb(training_set.X, training_set.y, 0.0, 100, 100, 100);
    
    ypred_testing = sim(rb, testing_set.X);
    error = get_error(ypred_testing, testing_set.y);
end