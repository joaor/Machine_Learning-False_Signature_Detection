path='Projecto_TRP/firmasGPDS960bw300/';
for signature = 1:300
    fprintf('Assinatura: %g\n',signature)
    for sample = 1:30
        fname = [num2str(signature,'%.3d'),'-',num2str(sample,'%.2d')];
        
        genuine = [path,num2str(signature,'%.3d'),'/c-',fname,'.bmp'];
        forged = [path,num2str(signature,'%.3d'),'/cf-',fname,'.bmp'];
        
        if eq(exist(genuine),2)
            I=imread(genuine);
            figure(1);
            [C,H] = imcontour(I)
            contornos = ones(size(I,1), size(I,2));
            for i = 2:2:size(C,2)
                contornos(int16(C(2,i)),int16(C(1,i))) = 0;
            end
            figure(2);
            imshow(contornos);
            pause
        else
            fprintf('Fichero de assinatura genuina %g nao encontrado\n',sample)
        end
        
        if eq(exist(forged),2)
            I=imread(forged);
        else
            fprintf('Fichero e assinatura falsa %g nao encontrado\n',sample)
        end  
    end 
end