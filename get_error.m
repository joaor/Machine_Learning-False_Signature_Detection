function errors = get_error(predicted, real, dfce)
    ce = cerror(predicted, real);
    fp = cerror(predicted, real, 2);
    fn = cerror(predicted, real, 1);
    
    errors.Errors = [ce fp fn];
    errors.FP = [];
    errors.FN = [];
    if dfce
        [errors.FP, errors.FN] = roc(dfce, real);
        
        %plot(errors.FP, 1-errors.FN);
        %xlabel('False Positive Rate'); 
        %ylabel('True Positive Rate');
    end
end