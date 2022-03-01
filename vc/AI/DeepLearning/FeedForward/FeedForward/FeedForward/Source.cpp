#include <iostream>

using namespace std;


#define MAX2(a, b) (a) > (b) ? (a) : (b)
class Neuron
{
public:
	double w_;	// weight of one input
	double b_;	// bias


	double getActivation(const double& x)
	{
		// for linear or identity artivation functions
		return x;

		// for ReLU activation functions
		//return MAX2(0.0, x);
	}
	double feedForward(const double& input){
		// output y = f(\sigma)
		// \sigma = w_ * injput x + b
		// for multiple inputs,
		// \sigma = w0_ * x0_ + w1_ * x1 + ... + b


		// 
		const double sigma = w_ * input + b_;

		return getActivation(sigma);
	}
};

void main()
{
	Neuron my_neuron;
	my_neuron.w_ = 2.0;
	my_neuron.w_ = 1.0;

	cout << "Input = 0.0 " <<  my_neuron.feedForward(0.0) <<  endl;
	cout << "Input = 1.0 " <<  my_neuron.feedForward(1.0) <<  endl;
	cout << "Input = 2.0 " <<  my_neuron.feedForward(2.0) <<  endl;
	cout << "Input = 3.0 " <<  my_neuron.feedForward(3.0) <<  endl;

	int a;
	cin >> a;
}