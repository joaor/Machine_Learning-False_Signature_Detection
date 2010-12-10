path='/home/diogo/Workspace/Projecto-TRP/firmasGPDS960bw300/';
from = 1;
to = 300;

for signature = from:to
    fprintf('Assinatura: %g\n',signature)
    all_features = [];
    
    tic
    for sample = 1:30
        fprintf('sample: %g\n',sample)
        
        fname = [num2str(signature,'%.3d'), '-', num2str(sample,'%.2d')];
        genuine = [path, num2str(signature,'%.3d'), '/c-', fname, '.bmp'];
        forged = [path, num2str(signature,'%.3d'), '/cf-', fname, '.bmp'];
        
        if eq( exist(genuine,'file'), 2 )
            all_features = [all_features; signature get_features(genuine) 1];
        else
            fprintf('Fichero de assinatura genuina %g nao encontrado\n',sample)
        end
        
        if eq( exist(forged,'file'), 2 )
            all_features = [all_features; signature get_features(forged) 2]; 
        else
            fprintf('Fichero e assinatura falsa %g nao encontrado\n',sample)
        end 
    end 
    
    [all_features(:,2)] = length_feature( all_features(:,2) );

    %struct('X', features, 'y', classes, 'num_data', length(features), 'dim', size(features,1));    
end

fname = sprintf('all_features_%d_%d.mat', from, to);
save(fname, 'all_features');

toc

