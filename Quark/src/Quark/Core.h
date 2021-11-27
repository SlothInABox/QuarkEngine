#pragma once

#ifdef QRK_PLATFORM_WINDOWS
	#ifdef QRK_BUILD_DLL
		#define QUARK_API __declspec(dllexport)
	#else
		#define  QUARK_API __declspec(dllimport)
	#endif
#else
	#error Engine only supports windows
#endif

#ifdef QRK_ENABLE_ASSERTS
	#define QRK_ASSERT(x, ...) { if(!(x)) { QRK_ERROR("Assertion Failed: {0}", __VA_ARGS__); __debugbreak(); } }
	#define QRK_CORE_ASSERT(x, ...) { if(!(x)) { QRK_CORE_ERROR("Assertion Failed: {0}", __VA_ARGS__); __debugbreak(); } }
#else
	#define QRK_ASSERT(x, ...)
	#define QRK_CORE_ASSERT(x, ...)
#endif

#define BIT(x) (1 << x)

#define QRK_BIND_EVENT_FN(fn) std::bind(&fn, this, std::placeholders::_1)