path='Projecto_TRP/firmasGPDS960bw300/';
for signature = 1:300
    fprintf('Assinatura: %g\n',signature)
    for sample = 1:30
        fname = [num2str(signature,'%.3d'),'-',num2str(sample,'%.2d')];
        
        genuine = [path,num2str(signature,'%.3d'),'/c-',fname,'.bmp'];
        forged = [path,num2str(signature,'%.3d'),'/cf-',fname,'.bmp'];
        
        if eq(exist(genuine,'file'),2)
            get_features(genuine);
            pause
        else
            fprintf('Fichero de assinatura genuina %g nao encontrado\n',sample)
        end
        
        if eq(exist(forged,'file'),2)
            get_features(genuine);
            pause
        else
            fprintf('Fichero e assinatura falsa %g nao encontrado\n',sample)
        end  
    end 
end