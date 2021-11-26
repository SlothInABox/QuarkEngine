#pragma once

#include "Core.h"
#include "Events/Event.h"

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