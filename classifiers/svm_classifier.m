function svm_classifier(training_set, testing_set)
    model = smo(training_set, struct('ker','rbf','arg',1,'C',10));

    ypred_training = svmclass(training_set.X, model);
    ypred_testing = svmclass(testing_set.X, model);
end