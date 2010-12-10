function svm_classifier(training_set, testing_set)
    options = struct('ker','rbf','arg',[0.1 0.5 1 5 10],'C',[1 10 100], 'solver', 'smv2', 'num_folder', 5, 'verb', 1);
    model = evalsvm(training_set, options);

    ypred_training = svmclass(training_set.X, model);
    ypred_testing = svmclass(testing_set.X, model);
end