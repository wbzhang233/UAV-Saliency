/*************************************************
Copyright: Guangyu Zhong all rights reserved
Author: Guangyu Zhong
Date:2015-04-23
Description: codes for Equation 1 in UAV saliency (part of the implementation)
Reference http://breckon.eu/toby/publications/papers/sokalski10uavsalient.pdf
**************************************************/
#define _CRT_SECURE_NO_DEPRECATE 
#include<iostream>
#include<highgui.h>
#include<cv.h>
#include<string>
void gene_neighbors(
	const int i,
	const int j,
	const int theta,
	const int height,
	const int width,
	std::vector<std::vector<int>> &neighbors,
	int &length);

void calculate_contrast(
	const cv::Mat &image,
	const int theta,
	cv::Mat &contrast);