% Function created by Akshar Agarwal

% function [] = plotContour(imgStr)
warning off
% imgStr=input('image filename (.___): ');
%     % in imgStr, input the name of the original file you want to process
code_path='C:\Users\User1\Desktop'; % your/path/here
cd(code_path)
mkdir('cplots');
save_path1='C:\Users\User1\Desktop\cplots';
imgStr1='akku.jpg';
imgStr2='akku2.jpg';
%% Set parameters
lvls=7; % levels of contour plot
radP=50; % radius for gaussian filter
stdP=50; % standard deviation for gaussian filter
% imgStr = 'img.jpg'; % Input for function, unless you want to use as script
% color = input('Enter "red","green", or "blue" in single quotes: ');  % red, green, or blue
color1 = 'red';
color2 = 'green';
%% Don't edit these
% cd(code_path)
A1=imread(imgStr1);
A2=imread(imgStr2);

colors={'red' 1; 'green' 2; 'blue' 3};
indC=strmatch(color1,colors(:,1));
map1=zeros(3,3);
map1(1:lvls,indC)=.1:(1/lvls):1;

indC=strmatch(color2,colors(:,1));
map2=zeros(3,3);
map2(1:lvls,indC)=.1:(1/lvls):1;
%% Blob type thing, all red
cd(save_path1)
mkdir('blobs');
cd('blobs');
mkdir(num2str(lvls));
cd(num2str(lvls));
f1=figure;
F=rgb2gray(A1);
G=imgaussfilt(F,stdP);
hg=contourf(G,lvls);
colormap(f1,map1);
% colorbar('eastoutside');
set(gca,'XTickLabel','')
set(gca,'YTickLabel','')
set(gca,'YDir','Reverse')
% lgd2=legend('show');
% title(['Filled Contour: Gaussian Filter (' num2str(stdP) ' std), ' num2str(lvls) ' lvls, ' 'color: ' color1]);
filename1=['stdP_' num2str(stdP) '_lvls_' num2str(lvls) '_color_' color1];
saveas(gcf, [filename1 '.png'])
saveas(gcf, [filename1 '.fig'])
cd(code_path)

cd(save_path1)
cd('blobs')
cd(num2str(lvls));
f2=figure%#ok<*NOPTS>
% F=rgb2gray(A2);
G=imgaussfilt(A2,stdP);
hg=contourf(G,lvls);
colormap(f2,map2);
% colorbar('eastoutside');
set(gca,'XTickLabel','')
set(gca,'YTickLabel','')
% lgd2=legend('show');
% title(['Filled Contour: Gaussian Filter (' num2str(stdP) ' std), ' num2str(lvls) ' lvls, ' 'color: ' color2]);
filename2=['stdP_' num2str(stdP) '_lvls_' num2str(lvls) '_color_' color2];
saveas(gcf, [filename2 '.png'])
saveas(gcf, [filename2 '.fig'])
cd(code_path)

cd(save_path1);
mkdir('radius');
cd('radius');
mkdir(num2str(radP));
cd(num2str(radP));

h=fspecial('gaussian', radP, stdP);
F=rgb2gray(A1);
rad1 = imfilter(F,h,'symmetric');
fig3=figure;
tc=contourf(rad1,10);
colormap(map1);
% colorbar('eastoutside');
set(gca,'XTickLabel','')
set(gca,'YTickLabel','')
set(gca,'YDir','Reverse')
% lgd2=legend('show');
filename3=['GRadstdP_' num2str(stdP) '_lvls_' num2str(lvls) '_color_' color1];
saveas(gcf, [filename3 '.png'])
saveas(gcf, [filename3 '.fig'])


h=fspecial('gaussian', radP, stdP);
% F=rgb2gray(A2);
rad1 = imfilter(A2,h,'symmetric');
fig4=figure;
tc2=contourf(rad1,10);
colormap(map2);
% colorbar('eastoutside');
set(gca,'XTickLabel','')
set(gca,'YTickLabel','')
set(gca,'YDir','Reverse')
% lgd2=legend('show');
filename4=['GRadstdP_' num2str(stdP) '_lvls_' num2str(lvls) '_color_' color2 'g'];
saveas(gcf, [filename4 '.png'])
saveas(gcf, [filename4 '.fig'])
cd(code_path)



close all
%%

fig1=figure;
f1=subplot(2,3,1)
F=rgb2gray(A1);
G=imgaussfilt(F,stdP);
hg=contourf(G,lvls);
colormap(f1,map1);
chi1=colorbar('northoutside');
set(gca,'XTickLabel','')
set(gca,'YTickLabel','')
set(gca,'YDir','Reverse')
set(chi1,'YTick',[])
% title(['Filled Contour: Gaussian Filter (' num2str(stdP) ' std), ' num2str(lvls) ' lvls']);

f2=subplot(2,3,2) %#ok<*NOPTS>
% F=rgb2gray(A2);
G=imgaussfilt(A2,stdP);
hg=contourf(G,lvls);
colormap(f2,map2);
chi2=colorbar('northoutside');
set(gca,'XTickLabel','')
set(gca,'YTickLabel','')
set(chi2,'YTick',[])
% title(['Filled Contour: Gaussian Filter (' num2str(stdP) ' std), ' num2str(lvls) ' lvls']);



cd(save_path1)
cd('radius')
cd(num2str(radP));
fn1=subplot(2,3,4)
h=fspecial('gaussian', radP, stdP);
F=rgb2gray(A1);
rad1 = imfilter(F,h,'symmetric');
tc=contourf(rad1,10);
colormap(fn1,map1);
chi3=colorbar('southoutside');
set(gca,'XTickLabel','')
set(gca,'YTickLabel','')
set(gca,'YDir','Reverse')
set(chi3,'YTick',[])
title(['Guassian Blur 1']);



fn3=subplot(2,3,5)
img2s=imshow([filename4 '.png'])
h=fspecial('gaussian', radP, stdP);
% F=rgb2gray(A2);
rad1 = imfilter(A2,h,'symmetric');
tc2=contourf(rad1,10);
colormap(fn3,map2);
chi4=colorbar('southoutside');
set(gca,'XTickLabel','')
set(gca,'YTickLabel','')
set(gca,'YDir','Reverse')
set(chi4,'YTick',[])
%%
cd(save_path1)
cd('blobs')
cd(num2str(lvls))
f3=subplot(2,3,3)
img1s=imshow([filename1 '.png'])
hold on
img2s=imshow([filename2 '.png'])
set(img2s,'AlphaData',0.5);
set(img1s,'AlphaData',1);
set(gca,'XTickLabel','')
set(gca,'YTickLabel','')
% c1=colormap([map2;map1]);
% c1h=colorbar('northoutside');
% set(c1h,'YTick',[])
title(['Superimposed blobs']);

cd(save_path1)
cd('radius')
cd(num2str(radP));
f3=subplot(2,3,6)
img3s=imshow([filename3 '.png'])
hold on
img4s=imshow([filename4 '.png'])
set(img4s,'AlphaData',0.5);
set(img3s,'AlphaData',1);
set(gca,'XTickLabel','')
set(gca,'YTickLabel','')
c1=colormap([map2;map1]);
c1h=colorbar('southoutside');
set(c1h,'YTick',[])
title(['Superimposed gausianak radiis fix tlte tmrw']);


% filename1=['levels_' num2str(lvls) 'std' num2str(stdP)];
% saveas(gcf, [filename1 '.png'])
% saveas(gcf, [filename1 '.fig'])
% cd('../')
% end