clc;
clear all;
image_folder='/Users/Ariel/Downloads/dataset/training';
test_folder='/Users/Ariel/Downloads/dataset/test';
training = dir(fullfile(image_folder,'*.bmp'));
test = dir(fullfile(test_folder,'*.bmp'));
total_images = numel(training);
test_images = numel(test);
corr=0;

for i=1:test_images
    f=fullfile(test_folder,test(i).name);
    testnow=imread(f);
    tra=fullfile(image_folder,training(1).name);
    I=imread(tra);
    k=sum(sum(imabsdiff(I,testnow)));

    now=floor((i-1)/13);
    which=0;

    for n=2:total_images
        tra=fullfile(image_folder,training(n).name);
        I=imread(tra);
        dis=sum(sum(imabsdiff(I,testnow)));
        if(k>dis)
            k = dis;
            which=floor((n-1)/13);
        end
    end
    i
    if now==which
        corr=corr+1;
    end
    corr/i
end
