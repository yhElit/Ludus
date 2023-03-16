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

#ifdef LUDUS_ENABLE_ASSERTS
	#define LUDUS_ASSERT(x, ...) { if(!(x)) { LUDUS_ERROR("Assertion Failed: {0}", __VA_ARGS__); __debugbreak(); } }
	#define LUDUS_CORE_ASSERT(x, ...) { if(!(x)) { LUDUS_CORE_ERROR("Assertion Failed: {0}", __VA_ARGS__); __debugbreak(); } }
#else
	#define LUDUS_ASSERT(x, ...)
	#define LUDUS_CORE_ASSERT(x, ...)
#endif

#define BIT(x) (1 << x)