#pragma once
#include <memory>

#include "Core.h"
#include "spdlog/spdlog.h"

namespace Ludus
{
	class LUDUS_API Log
	{
	public:
		static void Init();
		static void Shutdown();
		static void Write(const char* message);

		inline static std::shared_ptr<spdlog::logger>& GetCoreLogger() { return s_CoreLogger; }
		inline static std::shared_ptr<spdlog::logger>& GetClientLogger() { return s_ClientLogger; }
	
	private:
		static std::shared_ptr<spdlog::logger> s_CoreLogger;
		static std::shared_ptr<spdlog::logger> s_ClientLogger;
	};
}

// Core log macros
#define Ludus_CORE_ERROR(...)	::Ludus::Log::GetCoreLogger()->error(__VA_ARGS__)
#define Ludus_CORE_WARN(...)	::Ludus::Log::GetCoreLogger()->warn(__VA_ARGS__)
#define Ludus_CORE_INFO(...)	::Ludus::Log::GetCoreLogger()->info(__VA_ARGS__)
#define Ludus_CORE_TRACE(...)	::Ludus::Log::GetCoreLogger()->trace(__VA_ARGS__)
#define Ludus_CORE_FATAL(...)	::Ludus::Log::GetCoreLogger()->fatal(__VA_ARGS__)

// Client log macros
#define Ludus_ERROR(...)		::Ludus::Log::GetClientLogger()->error(__VA_ARGS__)
#define Ludus_WARN(...)		::Ludus::Log::GetClientLogger()->warn(__VA_ARGS__)
#define Ludus_INFO(...)		::Ludus::Log::GetClientLogger()->info(__VA_ARGS__)
#define Ludus_TRACE(...)		::Ludus::Log::GetClientLogger()->trace(__VA_ARGS__)
#define Ludus_FATAL(...)		::Ludus::Log::GetClientLogger()->fatal(__VA_ARGS__)