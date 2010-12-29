function data = script_change(data, str)
    to_order = 0;
    %data = change_order(data, to_order);
    
    load 'images_data';
    data = change_features(data, images_data, str);
end