path='firmasGPDS960bw300/';
for signature = 1:300
    
    fprintf('Assinatura: %g\n',signature)
    curr_len = zeros(1,54);
    pos = 1;
    for sample = 1:30
        fname = [num2str(signature,'%.3d'),'-',num2str(sample,'%.2d')];
        
        genuine = [path,num2str(signature,'%.3d'),'/c-',fname,'.bmp'];
        forged = [path,num2str(signature,'%.3d'),'/cf-',fname,'.bmp'];
        
        if eq(exist(genuine,'file'),2)
            curr_len(pos) = get_features(genuine);
        else
            pos = pos - 1;
            fprintf('Fichero de assinatura genuina %g nao encontrado\n',sample)
        end
        
        if eq(exist(forged,'file'),2)
            curr_len(pos+1) = get_features(forged); 
        else
            pos = pos - 1;
            fprintf('Fichero e assinatura falsa %g nao encontrado\n',sample)
        end 
        
        pos = pos + 2;
    end
    
    max_len = max(curr_len);
    min_len = min(curr_len);
    new_max = max_len - min_len;

    for pos = 1:size(curr_len,2)
        new_curr = curr_len(pos) - min_len;
        length_feature = new_curr/new_max;
    end
end