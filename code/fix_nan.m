function [ n ] = fix_nan( a, b )
%FIX_NAN Return nan if both nan, else return the one that's not
    k = zeros(size(a,1),1);
    for i=1:size(a, 1)
        if isnan(a(i)) & isnan(b(i))
            k(i) = nan;
        else if isnan(a(i))
                k(i) = b(i);
            else k(i) = a(i);
            end
        end
    end
    n = k;
end