function rbf(training_set, testing_set)
    rb = newrb(training_set.X, training_set.y, 0.0, 100, 100, 100);
    
    ypred_training = sim(rb, training_set.X);
    ypred_testing = sim(rb, testing_set.X);
end