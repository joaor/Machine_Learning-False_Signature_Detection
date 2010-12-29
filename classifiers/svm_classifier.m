function error = svm_classifier(training_set, testing_set)
    options = struct('ker','rbf', 'arg',[0.5 0.55 0.6 0.65 0.7 0.75 0.8 0.85 0.9 0.95 1], 'C',[1 10 100 1000], 'solver','svm2', 'num_folds',6, 'verb',1);
    [model, errors] = evalsvm(training_set, options);

    ypred_testing = svmclass(testing_set.X, model);
    error = get_error(ypred_testing, testing_set.y);
end