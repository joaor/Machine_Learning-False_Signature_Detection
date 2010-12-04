path='/home/diogo/Workspace/Projecto-TRP/firmasGPDS960bw300/';
for signature = 1:300
    
    fprintf('Assinatura: %g\n',signature)
    genuine_features = [];
    forged_features = [];
    
    for sample = 1:30
        fname = [num2str(signature,'%.3d'),'-',num2str(sample,'%.2d')];
        
        genuine = [path,num2str(signature,'%.3d'),'/c-',fname,'.bmp'];
        forged = [path,num2str(signature,'%.3d'),'/cf-',fname,'.bmp'];
        
        if eq(exist(genuine,'file'),2)
            genuine_features = [genuine_features; get_features(genuine)];
        else
            fprintf('Fichero de assinatura genuina %g nao encontrado\n',sample)
        end
        
        if eq(exist(forged,'file'),2)
            forged_features = [forged_features; get_features(forged)]; 
        else
            fprintf('Fichero e assinatura falsa %g nao encontrado\n',sample)
        end 
    end 
    [genuine_features(:,1), forged_features(:,1)] = length_feature(genuine_features(:,1), forged_features(:,1));
    
    
    
    struct('X','name','y','dim','num_data');
    
end

