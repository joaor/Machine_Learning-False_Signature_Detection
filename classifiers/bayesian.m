function error = bayesian(training_set, testing_set)
    inx1 = find( training_set.y == 1 );
    inx2 = find( training_set.y == 2 );
    
    model.Pclass{1} = mlcgmm( training_set.X(:, inx1) );
    model.Pclass{2} = mlcgmm( training_set.X(:, inx2) );
    model.Prior = [length(inx1) length(inx2)] / (length(inx1) + length(inx2));
    
    [ypred_testing, dfce] = bayescls(testing_set.X, model);
    error = get_error(ypred_testing, testing_set.y, dfce);
end