load 'all_features_1_300';
load 'images_data';

data = get_first_sets(images_data, 44);

all_classifiers = dir('classifiers');
all_classifiers = all_classifiers(3:end);

%for i = 1 : length(all_classifiers)
%   file = all_classifiers(i).name;
%   classifier = str2func( file(1:end - 2) );

[training_indexes, testing_indexes] = crossval(size(data,1), 6);

results=[];
for j = 1 : 6
    training_set = build_set( data, training_indexes(j) )
    testing_set = build_set( data, testing_indexes(j) )

    pause
    result = svm_classifier(training_set, testing_set);
    results = [results;result];
end
results
pause
