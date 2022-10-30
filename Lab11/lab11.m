%Brandon Salazar
%CSE 185 
%Spring 2021
load('att_face.mat');

k = 50; % number of eigenfaces

h = size(face_training, 1);
w = size(face_training, 2);
n_train = size(face_training, 3);
n_test = size(face_testing, 3);
hw = h*w;

fprintf('Compute eigenface...\n');
%% reshape face_training from h x w x num_train to (h*w) x num_train
X = reshape(face_training, [hw, n_train]);

%% compute mean face
x_bar = mean(X(:));

%% substract mean from X
Y = bsxfun(@minus, X, x_bar);

%% compute covariance matrix C
Y_t = Y';
C = Y * Y_t;

%% singular value decomposition
[U, S, D] = svd(C);

%% select the first k column from U
U = U(:,1:k);

%% encode face image as coefficients of eigenface
fprintf('Face reconstruction...\n');
x = face_training(:, :, 1);
figure(1), 
subplot(1, 2, 1); imshow(imresize(x, 4)); title('input');

% TODO: compute coef
x = x(:);
x = x - x_bar;

coef =  U' * x;

%% reconstruct face image from coefficients
x_rec = x_bar + (U*coef);

x_rec = reshape(x_rec, h, w);
subplot(1, 2, 2); imshow(imresize(x_rec, 4)); title('reconstruction');
imwrite(imresize(x_rec, 4), sprintf('reconstruct_k%d.png', k));


%% encode all training data
fprintf('Convert training data to coef...\n');
coef_train = U'*Y;
% TODO: compute coef_train for all training images


%% Face recognition with eigenface coefficients
fprintf('Testing...\n');
id_predict = zeros(size(id_testing));

for i = 1:n_test
    
    %% extract testing image
    img_test = face_testing(:, :, i);
    img_test = img_test(:);
    img_test = bsxfun(@minus, img_test, x_bar);
    %% convert testing image to feature vector
    coef_test = U' * img_test; % TODO: replace this line
    
    error = zeros(n_train, 1);
    for j = 1:n_train
        
        %% compute the square error between feature vectors
        diff = coef_train(:, j) - coef_test;
        error(j) = sum( diff .^2 );
        
    end
    
    %% find the image id with minimal error
    [~, min_id] = min(error);
    id_predict(i) = min_id;
    
end

%% compute accuracy
accuracy = sum(id_testing == id_predict)/n_test;
fprintf('Accuracy = %f\n', accuracy);

%---------------------------------------%
%---------- Fill in this table ---------%
%---------------------------------------%
%   k   |  Accuracy
%---------------------------------------%
%  10   |   0.67500
%---------------------------------------%
%  20   |   0.70000
%---------------------------------------%
%  30   |   0.71875
%---------------------------------------%
%  40   |   0.73750
%---------------------------------------%
%  50   |   0.73750
%---------------------------------------%
