function min_error = k_nearest(training_set, testing_set)
    min_error = [1 1 1];
    for i = 1 : 10
        model = knnrule(training_set, i);
        error = classify(testing_set, model);
        
        if error(1) < min_error(1)
            min_error = error;
        end  
    end
end

function error = classify(testing_set, model)
    ypred_testing = knnclass(testing_set.X,model);
    error = get_error(ypred_testing, testing_set.y);
end