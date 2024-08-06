%% import file
clc, clearvars, close all

file = 'cones.jpeg';
img_raw = imread(file);

clc, clearvars -except img_raw, close all

%% Image resizing
[img_h, img_w, ~] = size(img_raw);

if img_h > img_w
    multiplier = round(img_h ./ img_w, 1);
    target_width = 480;
    target_height = target_width * multiplier;
else 
    multiplier = img_w / img_h;
    target_height = 480;
    target_width = target_height * multiplier;
end

img = imresize(img_raw, [target_height, target_width]);

%% Edge detection
% MultiThresholding
img2 = img;         % For threshold
img2 = rgb2gray(img2);
%img2 = histeq(img2);

split = 1;
Threshold = multithresh(img2,split);
img2 = imquantize(img2, Threshold);
img2 = img2 - 1;
img2 = img2./split;

% Apply edge function
img3 = img2;    % For edge detection
edge_mask = edge(img3, "canny");

%% Color seperation
img4 = img;     % For color seperation
img4 = rgb2hsv(img4);   % convert to HSV space

% Red spectrum (Tweak limits for the desired color)
% minC/maxC(1) for the hue, minC/maxC(2) for the saturation, minC/maxC(3) for the brightness

minC = [0.962,0.4,0.4];
maxC = [0.05,0.4,0.4];

% Conditions to select color (According to a specific hue, saturation and brightness)
hue_mask = (img4(:,:,1) >= minC(1) | img4(:,:,1) <= maxC(1));
sat_mask = (img4(:,:,2) >= minC(2) | img4(:,:,2) <= maxC(2));
val_mask = (img4(:,:,3) >= minC(3) | img4(:,:,3) <= maxC(3));

colr_mask = hue_mask & sat_mask & val_mask;     % Combine the three masks into one color mask

%% Combined mask

% Combine edge detection and color separation/ filtration masks
img_mask = edge_mask | colr_mask;

% Concatenate 3 masks (one each for R, G, B) in the 3rd (color) Dimension
mask_filter = cat(3,img_mask, img_mask, img_mask); 

img5 = img;      % for mask application and noise removal
img5(~mask_filter) = 0;     % Turn every part of the image that is not included in the mask filter to black

% Remove noise 
% Adjust accordingly to remove edge detection noise
% img5 = medfilt3(img5, [3,3,3]);
% img5 = medfilt3(img5, [3,3,3]);

imshowpair(img, img5, 'montage')

%% Credits
% Photo by NewAfrica
% https://st.depositphotos.com/16122460/53628/i/1600/depositphotos_536283692-stock-photo-modern-car-driving-school-test.jpg

% Photo by Joshua 
% https://www.pexels.com/photo/a-red-vintage-car-12147106/
