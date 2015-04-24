function C = calculate_contrast(pyramid, theta, mode)
%----------------------------------------------------
% Copyright: Guangyu Zhong all rights reserved
% Date:2015-04-22
% Author: Guangyu Zhong, Guangyuzhonghikari@gmail.com 
%----------------------------------------------------
% calculate_contrast is the function to calculate the contrast matrix.
% pyramid : input image  height*width*dim.
% theta   : neighborhood size  I set the neighborhood as a square centered
% in p(i,j) with (2*theta)^2 pixels.
% mode    : two modes to calculate equation 1, the results are the same. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%
[height, width, ~] = size(pyramid);
L = pyramid(:,:,1);
U = pyramid(:,:,2);
V = pyramid(:,:,3);

for i = 1:height
    for j = 1:width
        % neighborhood of p(i, j)
        neighbors = gene_neighbors(i, j, theta, height, width);
        % calculate contrast matrix
        switch lower(mode)
            case 'ind'
                inds = sub2ind(size(pyramid), neighbors(:, 1), neighbors(:, 2));
                distance = sqrt((L(inds) - repmat(L(i, j), numel(inds), 1)).^2  + ...
                    (U(inds) - repmat(U(i, j), numel(inds), 1)).^2 + ...
                    (V(inds) - repmat(V(i, j), numel(inds), 1)).^2);
                C(i, j) = sum(distance);
            case 'circulation'
                % this mode will be much slower than above mode
                distance = zeros(size(neighbors, 1), 1);
                for k = 1:size(neighbors, 1)
                    nei_i = neighbors(k, 1);
                    nei_j = neighbors(k, 2);
                    distance(k) =  sqrt(sum((pyramid(i, j, :) - pyramid(nei_i, nei_j, :)) .^ 2));
                end
                C(i, j) = sum(distance);
        end
    end
end

function neighbors = gene_neighbors(i, j, theta, height, width)
    h_range = [i-theta, i + theta];
    h_range(1) = max(1, h_range(1));
    h_range(2) = min(height, h_range(2));
    w_range = [j-theta, j + theta];
    w_range(1) = max(1, w_range(1));
    w_range(2) = min(width, w_range(2));
    neighx = h_range(1) : h_range(2);
    neighy = w_range(1) : w_range(2);
    xsize = numel(neighx);
    ysize = numel(neighy);
    neighx = repmat(neighx, ysize, 1);
    neighx = reshape(neighx, numel(neighx), 1);
    neighy = repmat(neighy', xsize, 1);
    neighbors = [neighx, neighy];
end

end