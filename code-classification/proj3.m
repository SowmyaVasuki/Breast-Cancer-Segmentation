FEATURE = 'spatial pyramid sift';

CLASSIFIER = 'support vector machine';

% set up paths to VLFeat functions.
run('C:\vlfeat-0.9.20\toolbox\vl_setup')

data_path = 'G:\data4002';

categories = {'benign','malignant'};
   
%This list of shortened category names is used later for visualization.
abbr_categories = {'b','m'};
    
num_train_per_cat = 40; 

fprintf('Getting paths and labels for all train and test data\n')
[train_image_paths, test_image_paths, train_labels, test_labels] = ...
    get_image_paths(data_path, categories,num_train_per_cat);
%   train_image_paths  1500x1   cell      
%   test_image_paths   1500x1   cell           
%   train_labels       1500x1   cell         
%   test_labels        1500x1   cell          

fprintf('Using %s representation for images\n', FEATURE)

switch lower(FEATURE) 
    
    case 'spatial pyramid sift'
        
          if ~exist('pyramid_vocab.mat', 'file')
            fprintf('No existing pyramid vocabulary found. Computing one from training images\n')
            pyramid_vocab = build_pyramid_vocab(train_image_paths);
            save('pyramid_vocab.mat', 'pyramid_vocab');
          end
        
        train_image_feats = get_pyramid_sift(train_image_paths);
        test_image_feats  = get_pyramid_sift(test_image_paths);
        
    otherwise
        error('Unknown feature type')
end

fprintf('Using %s classifier to predict test set categories\n', CLASSIFIER)



switch lower(CLASSIFIER)    
        
    case 'support vector machine'
        % YOU CODE svm_classify.m 
        predicted_categories = svm_classify(train_image_feats, train_labels, test_image_feats);
        
    otherwise
        error('Unknown classifier type')
end

create_results_webpage( train_image_paths, ...
                        test_image_paths, ...
                        train_labels, ...
                        test_labels, ...
                        categories, ...
                        abbr_categories, ...
                        predicted_categories) 
