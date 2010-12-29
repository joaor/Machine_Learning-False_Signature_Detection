function error = mlayer_perceptron(training_set, testing_set)
    %kk = training_set.X;
    %training_set.X = kk(:,1:200);
    %kk = training_set.y;
    %training_set.y = kk(:,1:200);
    
    options.tmax = 500;
    model = mperceptron(training_set, options);
    
    ypred_testing = linclass(testing_set.X, model);
    error = get_error(ypred_testing, testing_set.y);
end