#include <yaml-cpp/yaml.h>
#include <iostream>
#include <string>

using namespace std;

int main()
{
    string cfgPath = "/home/wbzhang/CLionProjects/UAV-Saliency/config/cfg.yaml";
    cout<<"***** hello test ******"<<endl;

	YAML::Node yamlCfg = YAML::LoadFile(cfgPath);
 	std::cout << "node size: " << yamlCfg.size() << std::endl;

	string filepath = yamlCfg["filepath"].as<string>();
    cout<<"filepath: "<<filepath<<endl;
    cout<<"theta: "<<yamlCfg["theta"].as<int>()<<endl;

}