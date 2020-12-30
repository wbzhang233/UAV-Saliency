/*************************************************
Copyright: Guangyu Zhong all rights reserved
Author: Guangyu Zhong
Date:2015-04-23
Description: codes for Equation 1 in UAV saliency (part of the implementation)
Reference http://breckon.eu/toby/publications/papers/sokalski10uavsalient.pdf
**************************************************/
#include "contrast.h"
#include <yaml-cpp/yaml.h>
#include <sys/sysmacros.h>

int main(int argc, char* argv[])
{
	string cfgPath = "/home/wbzhang/CLionProjects/UAV-Saliency/config/cfg.yaml";

	YAML::Node yamlCfg = YAML::LoadFile(cfgPath);
 	std::cout << "  node size: " << yamlCfg.size() << std::endl;

	string filepath = yamlCfg["filepath"].as<string>();

	cv::Mat image = cv::imread(filepath);
	int theta = yamlCfg["theta"].as<int>();


	// 计算结果
	cv::Mat res;
    calculate_contrast(image, theta, res);
	cv::normalize(res, res, 1.0, 0.0, cv::NORM_MINMAX);

	std::cout<<res.type()<<" "<<res.channels()<<std::endl;
	cv::imshow("contrast", res);
	cv::Mat dst;
	res.convertTo(dst,CV_8UC1,255,0.0);
	cv::imwrite("../contrast.png",dst);
	cv::waitKey();
}
