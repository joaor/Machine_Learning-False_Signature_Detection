function min_error = rbf(training_set, testing_set)
    min_error = [1 1 1];
    for i = [10]
        i
        error = sim_error(i, training_set, testing_set);
        if error(1) < min_error(1)
            min_error = error;
        end
    end
end

function error = sim_error(i, training_set, testing_set)
    net = newrb(training_set.X, training_set.y, 10e-7, i, 300, 50);
    %net = newrbe(training_set.X, training_set.y);

    ypred_testing = sim(net, testing_set.X);
    error = get_error( round(ypred_testing), testing_set.y)
end
