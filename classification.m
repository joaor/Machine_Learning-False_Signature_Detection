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

        result = zeros(5, 3);
        for j = 1 : 1
            fprintf('Test Number %g\n', j)
            training_set = build_set( data, training_indexes(j) );
            testing_set = build_set( data, testing_indexes(j) );

            result(j,:)  = classifier(training_set, testing_set);
        end
        
        %results.(char(file)) = mean( result )
        results.(char(file)) = result;
    end
end

