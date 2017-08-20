% Function created by Akshar Agarwal

function [] = plotContour(imgStr)
warning off
% imgStr=input('image filename (.___): '); %take user input for image name
% imgStr='akku.png';
code_path='C:\Users\User1\Desktop'; % your/path/here
save_path1='C:\Users\User1\Desktop\cplots';

%% Set parameters
lvls=7; % levels of contour plot
radP=50; % radius for gaussian filter
stdP=50; % standard deviation for gaussian filter
% imgStr = 'img.jpg'; % Input for function, unless you want to use as script

%% Don't edit these
cd(code_path)
A=imread(imgStr);
map=[];
map(1:4,3)=0;
map(1:lvls,1)=.1:(1/lvls):1;
F=rgb2gray(A);

%% Blob type thing, all red
cd(save_path1);
mkdir('blobs');
cd('blobs');
mkdir(num2str(lvls));
cd(num2str(lvls));

fig1=figure;
G=imgaussfilt(F,stdP);
hg=contourf(G,lvls);
colormap(map);
colorbar('eastoutside');
set(gca,'XTickLabel','')
set(gca,'YTickLabel','')
% lgd2=legend('show');
title(['Filled Contour: Gaussian Filter (' num2str(stdP) ' std), ' num2str(lvls) ' lvls']);

filename=['levels_' num2str(lvls) '_std_' num2str(stdP)];
saveas(gcf, [filename '.png'])
saveas(gcf, [filename '.fig'])
cd(code_path)

%% Gaussian blur with a radius
cd(save_path1);
mkdir('radius');
cd('radius');
mkdir(num2str(radP));
cd(num2str(radP));

h=fspecial('gaussian', radP, stdP);
rad1 = imfilter(F,h,'symmetric');
fig2=figure;
tc=contourf(rad1,10);
colormap(map);
colorbar('eastoutside');
set(gca,'XTickLabel','')
set(gca,'YTickLabel','')
% lgd2=legend('show');
title(['Filled Contour: Gaussian Blur (' num2str(radP) 'px)']);

filename=['radius' num2str(radP) '_std_' num2str(stdP)];
saveas(gcf, [filename '.png'])
saveas(gcf, [filename '.fig'])
cd(code_path)

end