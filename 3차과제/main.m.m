clc
clear

img=imread(['문제6.png']);
imshow(img);
hsv_img=rgb2hsv(img);

s_lim = 0.3;
s_lim_g = 0.3;
v_lim = 0.96;

h=hsv_img(:,:,1);
s=hsv_img(:,:,2);
v=hsv_img(:,:,3);

detect_green = ((0.25<h)&(h<0.4))&(s_lim_g < s)&(v_lim > v);
detectgreen_new=bwareafilt(detect_green,1);
subplot(2,2,1),subimage(img);
subplot(2,2,2), subimage(detectgreen_new);
gray_img=mat2gray(detectgreen_new);

canny_img=edge(gray_img,'canny');
subplot(2,2,3), subimage(canny_img);
canny_img = bwareaopen(canny_img,700);
A=bwareafilt(canny_img,1);


%% edge 개수
count_BW2(1) = sum(bwareafilt(canny_img,1),'all');
BW3(:,:,1) = bwareafilt(canny_img,1);
for i = 2:5

    BW2 = bwareafilt(canny_img,i);
    count_BW2(i) = sum(BW2,'all');
    if count_BW2(i-1) == count_BW2(i)
        i = i - 1;
        break;
    else
        BW3(:,:,i) = BW2;
        for j = 1:i-1
            BW3(:,:,i) = BW3(:,:,i) - BW3(:,:,j);
        end
    end
end
for z=1:i
BW4(z)=sum(imfill(BW3(:,:,z),'holes'),'all');
if BW4(z)>10000
    BW4(z)=BW4(z);
   
else
    BW4(z)=700000;
end
end
p=find((BW4==min(BW4)));
canny_img=BW3(:,:,p);





%%



% 중심점 new
% [i,j]=find(canny_img==1);
% first=[max(j),min(i)];
% second=[min(j),min(i)];
% third=[min(j),max(i)];
% fourth=[max(j),max(i)];
% 
% firstmid=(first+third)/2;
% secondmid=(second+fourth)/2;
% realcenter=(firstmid+secondmid)/2

s=regionprops(canny_img,'Centroid');
centroids=cat(1,s.Centroid);

% 중심점 newnew
[row,col]=size(canny_img);
xmat=[];
for k=1:row
    for h=1:col
    if h<centroids(:,1)
       xmat(k,h)=h-fix(centroids(:,1));
    elseif h>centroids(:,1)
        xmat(k,h)=h-fix(centroids(:,1));
    else
        xmat(k,h)=0;
    end
    end
end

ymat=[];
for m=1:row
    for n=1:col
    if m<centroids(:,2)
       ymat(m,n)=m-fix(centroids(:,2));
    elseif m>centroids(:,2)
        ymat(m,n)=m-fix(centroids(:,2));
    else
        ymat(m,n)=0;
    end
    end
end

xmat=xmat.*canny_img;

ymat=-ymat.*canny_img;


first_result=xmat+ymat;
[first_y,first_x]=find(first_result==max(max(first_result)));
final_first_x=mean(first_x);
final_first_y=mean(first_y);

second_result=-xmat+ymat;
[second_y,second_x]=find(second_result==max(max(second_result)));
final_second_x=mean(second_x);
final_second_y=mean(second_y);

third_result=-xmat-ymat;
[third_y,third_x]=find(third_result==max(max(third_result)));
final_third_x=mean(third_x);
final_third_y=mean(third_y);

fourth_result=xmat-ymat;
[fourth_y,fourth_x]=find(fourth_result==max(max(fourth_result)));
final_fourth_x=mean(fourth_x);
final_fourth_y=mean(fourth_y);

center_ft=[(final_first_x+final_third_x)/2,(final_first_y+final_third_y)/2];
center_sf=[(final_second_x+final_fourth_x)/2,(final_second_y+final_fourth_y)/2];

center=(center_sf+center_ft)/2
imshow(canny_img);
hold on
% plot(center_ft(:,1),center_ft(:,2),'b*');
% plot(center_sf(:,1),center_sf(:,2),'g*');
% plot(centroids(1),centroids(2),'b*');
plot(center(:,1),center(:,2),'r*');
hold off
