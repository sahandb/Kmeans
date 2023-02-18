clc
clear
close all
 im=imread('bird.tiff');
 

 im = im2double(im);
 [im,map]=imresize(im, 0.237);
 imshow(im)
im=reshape(im,16384,3);
K=16;
[m,n]=size(im);
randidx = randperm(m);
C =im(randidx(1:K), :);
L = zeros(size(m,1), 1);
while(1)
    for i=1:m
        for j=1:K
            dist(j) = norm(im(i,:)-C(j,:));
        end
        % find index of closest centroid (= find the cluster)
        [~, c] = min(dist);
        cluster(i) = c;
    end
    for idxC = 1:K
        C(idxC,:) = mean(im(cluster==idxC,:));
    end
    if L==cluster
       break
    end
    L=cluster;
    
end
% im2=im;
% C=im2uint8(C);
for i = 1:K
    [r,v]=find(cluster==i);
       for j=1:size(v,2)
           im2(v(j),:)=C(i,:);
       end
end

x1=im2(:,1);
x2=im2(:,2);
x3=im2(:,3);
x1=reshape(x1,128,128);
x2=reshape(x2,128,128);
x3=reshape(x3,128,128);
im2=cat(3,x1,x2,x3);
imshow(im2)