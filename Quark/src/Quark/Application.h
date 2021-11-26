#pragma once

#include "Core.h"

#include "Window.h"
#include "Quark/LayerStack.h"
#include "Quark/Events/Event.h"
#include "Quark/Events/ApplicationEvent.h"


namespace Quark
{
	class QUARK_API Application
	{
	public:
		Application();
		virtual ~Application();

		void Run();

		void OnEvent(Event& e);

		void PushLayer(Layer* layer);
		void PushOverlay(Layer* layer);
	private:
		bool OnWindowClose(WindowCloseEvent& e);

		std::unique_ptr<Window> m_Window;
		bool m_Running = true;
		LayerStack m_LayerStack;
	};

	// To be defined in client
	Application* CreateApplication();
}