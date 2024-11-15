function r = find_rank_svd_based(M, sensitivity)
%Calculates the rank of a matrice based on the number of singular values
%having a total sum higher than 1-sensitivity ratio. 
%Example: r = #singular values higher than 99% of the sum of the singular
%values. 
    singular_vals = svd(M);
        
    max_it_cnt = length(singular_vals);
    r = 0;
    value = 0;
    value_tot = 0;
    cnt = 1;
    
    while (cnt <= max_it_cnt) && (value < (1-sensitivity))
        val_to_add = singular_vals(cnt);
        value_tot = value_tot + val_to_add;
        value = value_tot/sum(singular_vals);
        r = r+1;
        cnt = cnt+1;
    end

end