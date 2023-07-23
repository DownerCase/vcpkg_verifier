// ecal_vcpkg_verifier.cpp : Defines the entry point for the application.
//

#include <iostream>

#include <ecal/ecal_core.h>

using namespace std;

int main()
{

	eCAL::Initialize();

	cout << "Hello CMake." << endl;

	eCAL::Finalize();

	return 0;
}
