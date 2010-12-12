function [ce fp fn] = svm_classifier(training_set, testing_set)
    options = struct('ker','rbf','arg',[0.1 0.5 1 5 10],'C',[1 10 100], 'solver', 'svm2', 'num_folds', 6, 'verb', 1);
    [model, errors] = evalsvm(training_set, options);

    ypred_testing = svmclass(testing_set.X, model);
    
    ce = cerror(ypred_testing, testing_set.y)
    fp = cerror(ypred_testing, testing_set.y, 2)
    fn = cerror(ypred_testing, testing_set.y, 1)
end