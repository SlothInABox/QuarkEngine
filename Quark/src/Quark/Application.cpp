#include "Application.h"

#include "Quark/Events/ApplicationEvent.h"
#include "Quark/Log.h"

namespace Quark
{
	Application::Application()
	{

	}

	Application::~Application()
	{

	}

	void Application::Run()
	{
		WindowResizeEvent e(1280, 720);
		QRK_TRACE(e);

		while (true);
	}

}
