function errors = get_error(predicted, real)
    ce = cerror(predicted, real);
    fp = cerror(predicted, real, 2);
    fn = cerror(predicted, real, 1);
    
    errors = [ce fp fn];
end