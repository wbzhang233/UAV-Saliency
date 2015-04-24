%%%%%%%%%%%%%%%%%%%%%%%%%%%
%----------------------------------------------------
% Copyright: Guangyu Zhong all rights reserved
% This is a rough implementation for Equation 1 in the paper : 
% AUTOMATIC SALIENT OBJECT DETECTION IN UAV IMAGERY
% Date:2015-04-22
% Author: Guangyu Zhong, Guangyuzhonghikari@gmail.com 
%----------------------------------------------------
%
% pyramid is the L-th Gaussian image pyramid.
% I simply utilized the input image as one of the Gaussian image pyramid.
% As shown in the paper the input image should be transformed in LUV color space. 
% Anyway, I utilized RGB color space for convenience.
%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear; clc; close all;
theta = 5;
mode = 'ind';
for L = 1:1
pyramid = im2double(imread('1.jpg'));
C = calculate_contrast(pyramid, theta, mode);
figure;imshow(C, []);
end