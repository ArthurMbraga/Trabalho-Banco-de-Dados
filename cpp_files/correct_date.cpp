#include <iostream>
#include <map>
#include <fstream>
#include <string>
#include <sstream>
#include <ios>
#include <cstdlib>

// INSERT INTO projetos VALUES ('MSAzjgjJnNHGhzynFAlIhYfoBRBGtU','361281',87479909.37,'aiXcO','16-10-13',NULL);
// INSERT INTO consultores VALUES ('272-69-2819','Fitzgerald@blandit.us','29-8-04','23-6-12','248-107-4358','Adrian Dyer');

bool compara_data(int entrada[], int saida[]){
    for(int i = 2; i >= 0; i--){
        if(entrada[i] > saida[i]){
            return true;
        }
        else if(entrada[i] < saida[i]){
            return false;
        }
    }
    return false;
}

void troca_data(int* entrada, int* saida){
    for(int i = 2; i >= 0; i--){
        entrada[i] = entrada[i] + saida[i];
        saida[i] = entrada[i] - saida[i];
        entrada[i] = entrada[i] - saida[i];
    }
}

int main (){    
    std::ifstream file;
    std::ofstream output_file;
    std::stringstream ss;
    output_file.open("../Popular Banco/a.sql");
    file.open("../Popular Banco/consultores_backup.sql");
    file.unsetf(std::ios_base::skipws);


    if(file.is_open()){
        for(int i = 0; i < 1000; i++){
            int entrada[3], saida[3];
            int simple_quotes = 0;
            char c, dc;
            file >> c;
            ss << c;
            while(simple_quotes < 5){
                file >> c;
                ss << c;
                if(c == '\''){
                    simple_quotes++;
                }
            }
            file >> entrada[0] >> dc >> entrada[1] >> dc >> entrada[2];
            while(simple_quotes < 7){
                file >> c;
                if(c == '\''){
                    simple_quotes++;
                }
            }
            file >> saida[0] >> dc >> saida[1] >> dc >> saida[2];
            if(compara_data(entrada, saida)){
                troca_data(entrada, saida);
            }
            ss << abs(entrada[0]) << '-' << abs(entrada[1]) << '-' << abs(entrada[2]) << "','" << abs(saida[0]) << '-' << abs(saida[1]) << '-' << abs(saida[2]);
            while(file >> c) {
                ss << c;
                if(c == '\n') {
                    output_file << ss.str();
                    ss.str("");
                    break;
                }
            }
        }
    }

    file.close();
    output_file.close();
}