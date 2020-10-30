#include <iostream>
#include <map>
#include <fstream>
#include <string>
#include <sstream>
#include <ios>

// INSERT INTO projetos VALUES ('MSAzjgjJnNHGhzynFAlIhYfoBRBGtU','361281',87479909.37,'aiXcO','16-10-13',NULL);

int main (){    
    std::ifstream file;
    std::ofstream output_file;
    std::map<int, std::string> map;
    std::stringstream ss;
    output_file.open("output_file.sql");
    file.open("spawn_projetos.sql");
    file.unsetf(std::ios_base::skipws);
    int dado;


    if(file.is_open()){
        for(int i = 0; i < 1000; i++){
            int simple_quotes = 0;
            char c;
            file >> c;
            ss << c;
            // std::cout << c;
            while(simple_quotes < 3){
                file >> c;
                ss << c;
                // std::cout << c;
                if(c == '\''){
                    // std::cout << simple_quotes << std::endl;
                    simple_quotes++;
                }
            }
            file >> dado;
            ss << dado;
            while(file >> c) {
                ss << c;
                if(c == '\n') {
                    if(map.find(dado) == map.end()){
                        map[dado] = ss.str();
                        output_file << map[dado];
                    }
                    ss.str("");
                    break;
                }
            }
        }
    }

    file.close();
    output_file.close();
}