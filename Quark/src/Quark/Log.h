#pragma once

#include <memory>

#include "Core.h"
#include "spdlog/spdlog.h"
#include "spdlog/fmt/ostr.h"

namespace Quark
{

	class QUARK_API Log
	{
	public:
		static void Init();

		inline static std::shared_ptr<spdlog::logger>& GetCoreLogger() { return s_CoreLogger; }
		inline static std::shared_ptr<spdlog::logger>& GetClientLogger() { return s_ClientLogger; }
	private:
		static std::shared_ptr<spdlog::logger> s_CoreLogger;
		static std::shared_ptr<spdlog::logger> s_ClientLogger;
	};

}

// Core log macros
#define QRK_CORE_TRACE(...)    ::Quark::Log::GetCoreLogger()->trace(__VA_ARGS__)
#define QRK_CORE_INFO(...)     ::Quark::Log::GetCoreLogger()->info(__VA_ARGS__)
#define QRK_CORE_WARN(...)     ::Quark::Log::GetCoreLogger()->warn(__VA_ARGS__)
#define QRK_CORE_ERROR(...)    ::Quark::Log::GetCoreLogger()->error(__VA_ARGS__)
#define QRK_CORE_FATAL(...)    ::Quark::Log::GetCoreLogger()->fatal(__VA_ARGS__)

// Client log macros
#define QRK_TRACE(...)    ::Quark::Log::GetClientLogger()->trace(__VA_ARGS__)
#define QRK_INFO(...)     ::Quark::Log::GetClientLogger()->info(__VA_ARGS__)
#define QRK_WARN(...)     ::Quark::Log::GetClientLogger()->warn(__VA_ARGS__)
#define QRK_ERROR(...)    ::Quark::Log::GetClientLogger()->error(__VA_ARGS__)
#define QRK_FATAL(...)    ::Quark::Log::GetClientLogger()->fatal(__VA_ARGS__)