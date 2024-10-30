#include <iostream>

int add(int a, int b) {
    return a + b;
}

int subtract(int a, int b) {
    return a - b;
}

int main() {
    std::cout << "Sum: " << add(2, 3) << std::endl;
    std::cout << "Substract: " << subtract(3, 2) << std::endl;
    std::cout << "Substract: " << subtract(5, 2) << std::endl;
    //sirock
    return 0;
}
