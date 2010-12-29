tic
addpath('classifiers')

%load 'xnuno';
%data = get_first_sets(xnuno, 44);

load 'all_data';
data = get_first_sets(all_data, 44);

fields = {'length' 'sixfold' 'trisurface' 'bestfit' 'centroid' 'mdf'};%fieldnames( data(1) );
fields_indexes = 1:size(fields,2);

from = 6; to = 5;
fname = sprintf('testing', from, to);

all_results = [];
for i = from : -1 : to
   fprintf('NUMBER %g\n',i);
   combinations = combntns(fields_indexes,i);
   
   for j = 1 : size(combinations,1)
       combination = combinations(j,:)
       
       result = [];
       all_vectors = [];
      
       for k = 1 : size(data,1)
           signature = data(k);
           vector = [];
           
           for w = 1: size(combination,2)
               fid = combination(w);
               
               value = signature.(char( fields(fid) ));
               vector = [vector, value];
           end
           
           vector = [vector, signature.class];
           all_vectors = [all_vectors; vector];
       end
       
       disp('PERFORMING CLASSIFICATION');
       result.combination = combination;
       result.results = classification(all_vectors);
       all_results = [all_results; result];
       size(all_results)
   end
   
   save(fname, 'all_results');
end


save(fname, 'all_results');
toc