function svm_classifier()
    options=struct('ker','rbf','arg',1,'C',10);
    
    % sequencial minimal optimization
    model = smo(trn, options);
    
    % SVM decision boundary
    axes(handles.data);
    ppatterns(trn);
    
    psvm(model);
    
    guidata(hObject, handles); %updates the handles
    
    ypred_trn = svmclass(trn.X, model);
    ypred_tst = svmclass(tst.X, model);
end