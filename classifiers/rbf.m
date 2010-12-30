function error = rbf(training_set, testing_set)
    error = sim_error(10, training_set, testing_set);
end

function error = sim_error(i, training_set, testing_set)
    net = newrb(training_set.X, training_set.y, 10e-7, i, 300, 50);

    ypred_testing = sim(net, testing_set.X);
    error = get_error( round(ypred_testing), testing_set.y, [])
end
