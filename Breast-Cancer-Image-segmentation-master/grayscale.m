clear all;
close all;

fileFolder= fullfile('G:/', 'change');
files= dir(fullfile(fileFolder,'*.png'));
fileNames= {files.name};
for i = 1: length(fileNames)
    fname{i} = fullfile(fileFolder,fileNames{i});
    I{i} = imread(fname{i});
    I{i}=rgb2gray(I{i});
    imshow(I{i});
    imwrite(I{i},sprintf('sample%d.png',i))
end