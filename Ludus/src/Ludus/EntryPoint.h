#pragma once

#ifdef LUDUS_PLATFORM_WINDOWS

extern Ludus::Application* Ludus::CreateApplication();

int main(int argc, char** argv)
{

	auto app = Ludus::CreateApplication();
	app->Run();
	delete app;
}
#endif 
