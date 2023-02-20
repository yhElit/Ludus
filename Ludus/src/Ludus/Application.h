#pragma once

#include "Core.h"

namespace Ludus {

	class LUDUS_API Application
	{
	public:	
		Application();
		virtual ~Application();

		void Run();
	};

	// To be defined in CLIENT
	Application* CreateApplication();
}


