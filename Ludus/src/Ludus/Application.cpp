#include "Application.h"

#include "Ludus/Log.h"
#include "Ludus/Events/ApplicationEvent.h"

namespace Ludus {
	Application::Application()
	{
	}

	Application::~Application()
	{
	}

	void Application::Run()
	{
		WindowResizeEvent e(1280, 720);

		if (e.IsInCategory(EventCategoryApplication))
			Ludus_CORE_TRACE(e);;

		if (e.IsInCategory(EventCategoryInput))
			Ludus_CORE_TRACE(e);

		while (true);
	}
}