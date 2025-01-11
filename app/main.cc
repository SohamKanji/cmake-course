#include <iostream>

#include "my_lib.h"
#include "config.hpp"
#include <nlohmann/json.hpp>

int main() 
{
    print_hello_world();
    std::cout << "Project name: " << PROJECT_NAME << std::endl;

    std::cout << "JSON_LIB_VERSION: " << NLOHMANN_JSON_VERSION_MAJOR << " " <<  NLOHMANN_JSON_VERSION_MINOR << " " << NLOHMANN_JSON_VERSION_PATCH << std::endl; 
    return 0;
}