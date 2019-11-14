% Starter code prepared by James Hays for CS 143, Brown University

% This function creates a webpage (html and images) visualizing the
% classiffication results. This webpage will contain
% (1) A confusion matrix plot
% (2) A table with one row per category, with 3 columns - training
% examples, true positives, false positives, and false negatives.

% false positives are instances claimed as that category but belonging to
% another category, e.g. in the 'forest' row an image that was classified
% as 'forest' but is actually 'mountain'. This same image would be
% considered a false negative in the 'mountain' row, because it should have
% been claimed by the 'mountain' classifier but was not.

% This webpage is similar to the one we created for the SUN database in
% 2010: http://people.csail.mit.edu/jxiao/SUN/classification397.html

function create_results_webpage( train_image_paths, test_image_paths, train_labels, test_labels, categories, abbr_categories, predicted_categories)

fprintf('Creating confusion matrix\n')

%number of examples of training examples, true positives, false positives,
%and false negatives. Thus the table will be num_samples * 4 images wide
%(unless there aren't enough images)
num_samples = 2; 
thumbnail_height = 75; %pixels

%delete the old thumbnails, if there are any
delete('results_webpage/thumbnails/*.jpg')

[success,message,messageid] = mkdir('results_webpage');
[success,message,messageid] = mkdir('results_webpage/thumbnails');
fclose('all');
fid = fopen('results_webpage/index.html', 'w+t');

num_categories = length(categories);

%% Create And Save Confusion Matrix
% Based on the predicted category for each test case, we will now build a
% confusion matrix. Entry (i,j) in this matrix well be the proportion of
% times a test image of ground truth category i was predicted to be
% category j. An identity matrix is the ideal case. You should expect
% roughly 50-95% along the diagonal depending on your features,
% classifiers, and particular categories. For example, suburb is very easy
% to recognize.

confusion_matrix = zeros(num_categories, num_categories);
for i=1:length(predicted_categories)
    row = find(strcmp(test_labels{i}, categories));
    column = find(strcmp(predicted_categories{i}, categories));
    confusion_matrix(row, column) = confusion_matrix(row, column) + 1;
end
%if the number of training examples and test casees are not equal, this
%statement will be invalid.
num_test_per_cat = length(test_labels) / num_categories;
confusion_matrix = confusion_matrix ./ num_test_per_cat   
accuracy = mean(diag(confusion_matrix));
fprintf('Accuracy (mean of diagonal of confusion matrix) is %.3f\n', accuracy)