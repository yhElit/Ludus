#pragma once

#ifdef LUDUS_PLATFORM_WINDOWS

extern Ludus::Application* Ludus::CreateApplication();

int main(int argc, char** argv)
{
	Ludus::Log::Init();
	LD_CORE_WARN("Initialized Log!");
	LD_INFO("Initialized Log!");

	auto app = Ludus::CreateApplication();
	app->Run();
	delete app;
}
#endif 
