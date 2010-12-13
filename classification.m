load 'all_features_1_300';
data = get_first_sets(all_features, 44);

all_classifiers = dir('classifiers');
all_classifiers = all_classifiers(3: end);

for i = 1 : length(all_classifiers)
    file = all_classifiers(i).name(1: end-2);
    
    results = [];
    results = setfield(results, file, []);
    
    classifier = str2func( file );

    [training_indexes, testing_indexes] = crossval(size(data,1), 6);

    for j = 1 : 6
        training_set = build_set( data, training_indexes(j) );
        testing_set = build_set( data, testing_indexes(j) );

        result = svm_classifier(training_set, testing_set)
        results = setfield(results, file, [getfield(results, file);result]);
    end
    pause

end
results
pause
