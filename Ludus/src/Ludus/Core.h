#pragma once

#ifdef LUDUS_PLATFORM_WINDOWS
	#ifdef LUDUS_BUILD_DLL	
		#define LUDUS_API __declspec(dllexport)
	#else
		#define LUDUS_API __declspec(dllimport)
	#endif
#else
	#error Ludus only supports Windows!
#endif 
