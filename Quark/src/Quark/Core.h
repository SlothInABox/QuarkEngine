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