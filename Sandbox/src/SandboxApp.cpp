#include <Ludus.h>

class Sandbox : public Ludus::Application
{
	public:
		Sandbox()
		{

		}
		~Sandbox()
		{

		}

};
Ludus::Application* Ludus::CreateApplication()
{
	return new Sandbox();
}