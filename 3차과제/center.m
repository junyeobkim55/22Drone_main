clc
clear

img=imread(['KakaoTalk_20220628_173406644.png']);
hsv_img=rgb2hsv(img);

s_lim_g = 0.3;
v_lim = 0.96;

h=hsv_img(:,:,1);
s=hsv_img(:,:,2);
v=hsv_img(:,:,3);

detect_green = ((0.25<h)&(h<0.4))&(s_lim_g < s)&(v_lim > v);
detectgreen_new=bwareafilt(detect_green,1);

gray_img=mat2gray(detectgreen_new);

canny_img=edge(gray_img,'canny');
canny_img = bwareaopen(canny_img,500);

%% edge
count_BW2(1) = sum(bwareafilt(canny_img,1),'all'); %픽셀 수로 Edge 몇 개인지 판별
BW3(:,:,1) = bwareafilt(canny_img,1); % 2차원인 행렬 쌓아야 하니까 3차원 행렬 지정
for i = 2:5
    BW2 = bwareafilt(canny_img,i);
    count_BW2(i) = sum(BW2,'all');
    if count_BW2(i-1) == count_BW2(i)
        i = i - 1; % Edge 개수
        break;
    else
        BW3(:,:,i) = BW2;
        for j = 1:i-1
            BW3(:,:,i) = BW3(:,:,i) - BW3(:,:,j); % Edge 각각 추출
        end
    end
end

for k = 1:i

    [xpoint,ypoint]=find(BW3(:,:,k)==1);
    if or((abs(max(xpoint)-min(xpoint)) < 100),(abs(max(ypoint)-min(ypoint)) < 100))
        BW3(:,:,k)=ones;
    else
        BW3(:,:,k)=BW3(:,:,k);
    end
    A(k)=sum(BW3(:,:,k),'all');
    B=find(A==min(A));
end
%% rectangular
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

%% origin

s=regionprops(canny_img,'Centroid');
centroids=cat(1,s.Centroid);

%% x coordinate
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

%% y coordinate
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

%% vertex

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

center=(center_sf+center_ft)/2;

imshow(img);
hold on
plot(center(1),center(2),'r*');
hold off
