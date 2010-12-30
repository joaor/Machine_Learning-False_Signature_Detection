function results = classification(data)
    all_classifiers = dir('classifiers');
    all_classifiers = all_classifiers(3: end);

    %all_classifiers(6:9) = [];
    all_classifiers = all_classifiers(8);

    results = [];
    for i = 1 : length(all_classifiers)
        file = all_classifiers(i).name(1: end-2);
        classifier = str2func( file )
        
        [training_indexes, testing_indexes] = crossval(size(data,1), 5);

        result.errors = [];
        result.roc = [];
        for j = 1 : 5
            fprintf('Test Number %g\n', j)
            training_set = build_set( data, training_indexes(j) );
            testing_set = build_set( data, testing_indexes(j) );

            aux  = classifier(training_set, testing_set);
            result.errors = [result.errors; aux];
            result.roc = [result.roc; aux.roc];
              
        end

        results.(char(file)).mean = mean( result.errors );
        results.(char(file)).std = std( result.errors );
        results.(char(file)).roc = result.roc;
        %results.(char(file)) = result;
        pause
    end
end
%sensitivity vs 1-specificity

