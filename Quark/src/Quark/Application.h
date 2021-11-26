#pragma once
#include "Core.h"

namespace Quark
{
	class QUARK_API Application
	{
	public:
		Application();
		virtual ~Application();

		void Run();

	private:

	};

	// To be defined in client
	Application* CreateApplication();
}