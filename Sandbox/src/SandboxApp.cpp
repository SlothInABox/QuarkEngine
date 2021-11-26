#include <Quark.h>

class Sandbox : public Quark::Application
{
public:
	Sandbox()
	{

	}

	~Sandbox()
	{

	}

};

Quark::Application* Quark::CreateApplication()
{
	return new Sandbox();
}