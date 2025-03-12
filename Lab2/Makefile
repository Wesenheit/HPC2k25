CXX=clang++

all:
	$(CXX) dft.cpp -o dft -Ofast -lomp -fopenmp
plot:
	$(CXX) plot_dft.cpp -o plot_dft -Ofast -lomp -fopenmp -lhdf5 -lhdf5_cpp

ass:
	$(CXX) dft.cpp -o dft.s -Ofast -lomp -fopenmp -S
