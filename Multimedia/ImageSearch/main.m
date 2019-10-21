
%% Initialize
clear
clc

%% Choose photo to train
PicPath = uigetdir("ѡ��holidayͼƬ�����ļ���");
% cd(PicPath);
PicInfo = struct2cell(dir([PicPath '\' '*.jpg']));
[k,len]=size(PicInfo);

%% ahash training
AHashResult = {};

for col=1:len
    PicName = [PicInfo{2,col} '\' PicInfo{1,col}];
    PicData = imread(PicName);
    AHashResult{1,col} = get_ahash_value(PicData);%get ahash value
    AHashResult{2,col} = PicName;
    AHashResult{3,col} = PicInfo{1,col};
end
save AHashResult AHashResult %save to .mat file

%% phash training
PHashTable = {};
for col = 1:len
    PicName = [PicInfo{2,col} '\' PicInfo{1,col}];
    PicData = imread(PicName);
    PHashTable{1,col} = get_phash_value(PicData);%get phash value
    PHashTable{2,col} = PicName;%����·��
    PHashTable{3,col} = PicInfo{1,col};%�ļ���
end
save PHashTable PHashTable

%% DHash training
DHashTable = {};
for col = 1:len
    PicName = [PicInfo{2,col} '\' PicInfo{1,col}];
    PicData = imread(PicName);
    DHashTable{1,col} = get_dhash_value(PicData);%get phash value
    DHashTable{2,col} = PicName;%����·��
    DHashTable{3,col} = PicInfo{1,col};%�ļ���
end
save DHashTable DHashTable%save to .mat
