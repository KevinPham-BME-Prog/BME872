
%% perform edge detection
x = load("C:\Users\Kevin\Desktop\BME872\Lab1-BrainMRI2\brainMRI_1.mat");
image = x.vol;
imaged = image(:, :, 100);
x2 = load("C:\Users\Kevin\Desktop\BME872\Lab1-BrainMRI2\brainMRI_6.mat");
image2 = x2.vol;
imaged2 = image2(:, :, 100);

%%
[height, width, ~] = size(imaged);

% Define the block size
blockSize = 16;

% Calculate the number of blocks in each dimension
numBlocksHeight = floor(height / blockSize);
numBlocksWidth = floor(width / blockSize);

% Initialize a cell array to store blocks
blocks = cell(numBlocksHeight, numBlocksWidth);

% Extract and store each block
for i = 1:numBlocksHeight
    for j = 1:numBlocksWidth
        % Define the indices of the current block
        rowStart = (i - 1) * blockSize + 1;
        rowEnd = i * blockSize;
        colStart = (j - 1) * blockSize + 1;
        colEnd = j * blockSize;
        
        % Extract the current block
        block = imaged(rowStart:rowEnd, colStart:colEnd, :);
        
        % Store the block in the cell array
        blocks{i, j} = block;
    end
end
count = 0;
block_aggre = zeros(1, numBlocksHeight * numBlocksWidth);
block_avg_len = zeros(1, numBlocksHeight * numBlocksWidth);
block_prime = zeros(1, numBlocksHeight * numBlocksWidth);
block_num = zeros(1, numBlocksHeight * numBlocksWidth);
block_ver = zeros(1, numBlocksHeight * numBlocksWidth);
block_hori = zeros(1, numBlocksHeight * numBlocksWidth);
for z = 1:numBlocksHeight
    for j = 1:numBlocksWidth
        count = count + 1;
        current_ref = blocks{z,j};
        edges = edge(current_ref, 'Sobel');
        edges2 = edge(current_ref, 'Prewitt');
        edges3 = edge(current_ref, 'Roberts');
        %% get edge aggregation
        aggre = edges | edges2 | edges3;
        aggre_edge = nnz(aggre); %return this
        if isnan(aggre_edge)
            aggre_edge = 0;
        end
        block_aggre(count) = aggre_edge;
        
        %% get average length of edges
        conectors = bwconncomp(edges);
        total_len = 0;
        for i = 1:conectors.NumObjects
            perimeter_sum = regionprops(conectors, 'Perimeter');
            total_len = total_len + perimeter_sum(i).Perimeter;
        end
        average_len = total_len / conectors.NumObjects; %return this
        if isnan(average_len)
            average_len = 0;
        end
        block_avg_len(count) = average_len;
        %% get primitive length of edges
        overallperi = regionprops(edges, 'Perimeter');
        perimeters = [overallperi.Perimeter];
        primitive_len = sum(perimeters); %return this
        if isnan(primitive_len)
            primitive_len = 0;
        end
        block_prime(count) = primitive_len;
        %% get number of edge pixels
        numedge = nnz(edges); %return this
        if isnan(numedge)
            numedge = 0;
        end
        block_num(count) = numedge;
        %%
        %get vertical and horizontal orientation
        [Gx, Gy] = imgradientxy(current_ref);
        gradientDirection = atan2(Gy, Gx) * (180 / pi);
        verticalThreshold = 45; % Threshold for vertical orientation
        horizontalThreshold = 135; % Threshold for horizontal orientation
        verticalEdgesum = sum(abs(gradientDirection) <= verticalThreshold, 'all'); %return this
        if isnan(verticalEdgesum)
            verticalEdgesum = 0;
        end
        block_ver(count) = verticalEdgesum; 
        horizontalEdgesum = sum(abs(gradientDirection) >= horizontalThreshold, 'all'); %return this
        if isnan(horizontalEdgesum)
            horizontalEdgesum = 0;
        end
        block_hori(count) = horizontalEdgesum;
    end
end


%%
[height, width, ~] = size(imaged2);

% Define the block size
blockSize = 16;

% Calculate the number of blocks in each dimension
numBlocksHeight = floor(height / blockSize);
numBlocksWidth = floor(width / blockSize);

% Initialize a cell array to store blocks
blocks2 = cell(numBlocksHeight, numBlocksWidth);

% Extract and store each block
for i = 1:numBlocksHeight
    for j = 1:numBlocksWidth
        % Define the indices of the current block
        rowStart = (i - 1) * blockSize + 1;
        rowEnd = i * blockSize;
        colStart = (j - 1) * blockSize + 1;
        colEnd = j * blockSize;
        
        % Extract the current block
        block2 = imaged2(rowStart:rowEnd, colStart:colEnd, :);
        
        % Store the block in the cell array
        blocks2{i, j} = block2;
    end
end
count = 0;
block_aggre2 = zeros(1, numBlocksHeight * numBlocksWidth);
block_avg_len2 = zeros(1, numBlocksHeight * numBlocksWidth);
block_prime2 = zeros(1, numBlocksHeight * numBlocksWidth);
block_num2 = zeros(1, numBlocksHeight * numBlocksWidth);
block_ver2 = zeros(1, numBlocksHeight * numBlocksWidth);
block_hori2 = zeros(1, numBlocksHeight * numBlocksWidth);
for z = 1:numBlocksHeight
    for j = 1:numBlocksWidth
        count = count + 1;
        current_ref = blocks2{z,j};
        edges = edge(current_ref, 'Sobel');
        edges2 = edge(current_ref, 'Prewitt');
        edges3 = edge(current_ref, 'Roberts');
        %% get edge aggregation
        aggre = edges | edges2 | edges3;
        aggre_edge = nnz(aggre); %return this
        if isnan(aggre_edge)
            aggre_edge = 0;
        end
        block_aggre2(count) = aggre_edge;
        
        %% get average length of edges
        conectors = bwconncomp(edges);
        total_len = 0;
        for i = 1:conectors.NumObjects
            perimeter_sum = regionprops(conectors, 'Perimeter');
            total_len = total_len + perimeter_sum(i).Perimeter;
        end
        average_len = total_len / conectors.NumObjects; %return this
        if isnan(average_len)
            average_len = 0;
        end
        block_avg_len2(count) = average_len;
        %% get primitive length of edges
        overallperi = regionprops(edges, 'Perimeter');
        perimeters = [overallperi.Perimeter];
        primitive_len = sum(perimeters); %return this
        if isnan(primitive_len)
            primitive_len = 0;
        end
        block_prime2(count) = primitive_len;
        %% get number of edge pixels
        numedge = nnz(edges); %return this
        if isnan(numedge)
            numedge = 0;
        end
        block_num2(count) = numedge;
        %%
        %get vertical and horizontal orientation
        [Gx, Gy] = imgradientxy(current_ref);
        gradientDirection = atan2(Gy, Gx) * (180 / pi);
        verticalThreshold = 45; % Threshold for vertical orientation
        horizontalThreshold = 135; % Threshold for horizontal orientation
        verticalEdgesum = sum(abs(gradientDirection) <= verticalThreshold, 'all'); %return this
        if isnan(verticalEdgesum)
            verticalEdgesum = 0;
        end
        block_ver2(count) = verticalEdgesum; 
        horizontalEdgesum = sum(abs(gradientDirection) >= horizontalThreshold, 'all'); %return this
        if isnan(horizontalEdgesum)
            horizontalEdgesum = 0;
        end
        block_hori2(count) = horizontalEdgesum;
    end
end
dij = zeros(1, numBlocksWidth*numBlocksHeight);

for z = 1:numBlocksWidth*numBlocksHeight
    dij(z) = dij(z) + (block_aggre(z) - block_aggre2(z))^2;
    dij(z) = dij(z) + (block_avg_len(z) - block_avg_len2(z))^2;
    dij(z) = dij(z) + (block_prime(z) - block_prime2(z))^2;
    dij(z) = dij(z) + (block_num(z) - block_num2(z))^2;
    dij(z) = dij(z) + (block_hori(z) - block_hori2(z))^2;
    dij(z) = dij(z) + (block_ver(z) - block_ver2(z))^2;
end
finalp1 = sum(dij)^0.5;
final = 1 - finalp1/(height * width);
