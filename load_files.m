tic

addpath('features')
path='/home/diogo/Workspace/Projecto-TRP/firmasGPDS960bw300/';

from = 1; to = 300;
all_data = []; all_lens = [];

disp('starting features extraction')
for signature = from:to
    fprintf('Assinatura: %g\n',signature)

    for sample = 1:30
        fprintf('sample: %g\n',sample)
        
        fname = [num2str(signature,'%.3d'), '-', num2str(sample,'%.2d')];
        genuine = [path, num2str(signature,'%.3d'), '/c-', fname, '.bmp'];
        forged = [path, num2str(signature,'%.3d'), '/cf-', fname, '.bmp'];
        
        if eq( exist(genuine,'file'), 2 )
            result = features_result( get_features(genuine), 1, signature);
            all_data = [all_data; result];
            
            all_lens = [all_lens; result.length];
        else
            fprintf('Fichero de assinatura genuina %g nao encontrado\n',sample)
        end
        
        if eq( exist(forged,'file'), 2 )
            result = features_result( get_features(forged), 2, signature);
            all_data = [all_data;  result];
            
            all_lens = [all_lens; result.length];
        else
            fprintf('Fichero e assinatura falsa %g nao encontrado\n',sample)
        end 
        
    end 
    
    %pause
end

disp('saving all data #1');
save('all_data', 'all_data');

disp('updating length_feature');
maxL = max(all_lens);
minL = min(all_lens);
for i = 1:size(all_data, 1)
    all_data(i).length = length_feature( all_data(i).length, maxL, minL);
end

disp('saving all data #2');
save('all_data', 'all_data');

toc 
%Elapsed time is 21274.072267 seconds.
