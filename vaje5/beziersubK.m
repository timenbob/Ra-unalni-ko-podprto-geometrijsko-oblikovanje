function BS = beziersubK(B, t, k)
    % Base case: 1 subdivision (k=1)
    if k == 1
        BS = beziersub(B, t);  % First subdivision
        
    else
        % Recursive subdivision for k > 1
        BS1= beziersub(B, t);
          % First subdivision
        % Recursively subdivide both the left and right parts
        BS_left_sub = beziersubK(BS1{1}, t, k-1);
        BS_right_sub = beziersubK(BS1{2}, t, k-1);
        
        % Combine the results: BS_left_sub and BS_right_sub are each cell arrays
        BS = {BS_left_sub, BS_right_sub};
    end
end


