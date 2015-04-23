/*************************************************
Copyright: Guangyu Zhong all rights reserved
Author: Guangyu Zhong
Date:2015-04-23
Description: codes for Equation 1 in UAV saliency (part of the implementation)
Reference http://breckon.eu/toby/publications/papers/sokalski10uavsalient.pdf
**************************************************/
#include "contrast.h"

int main(int argc, char* argv[])
{
	const std::string filepath = "1.jpg";
	cv::Mat image = cv::imread(filepath);
	int theta = 5;
	cv::Mat C;
    calculate_contrast(image, theta, C);
	cv::normalize(C, C, 1.0, 0.0, cv::NORM_MINMAX);
	cv::imshow("contrast", C);
	cv::waitKey();
}
