function errors = get_error(predicted, real, dfce)
    ce = cerror(predicted, real);
    fp = cerror(predicted, real, 2);
    fn = cerror(predicted, real, 1);
    
    errors.errors = [ce fp fn];
    errors.roc = [];
    if dfce
        errors.roc = roc(dfce, real);
    end
end