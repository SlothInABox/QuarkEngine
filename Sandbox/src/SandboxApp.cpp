#include <Quark.h>

class ExampleLayer : public Quark::Layer
{
public:
	ExampleLayer() : Layer("Example")
	{
	}

	void OnUpdate() override
	{
		QRK_INFO("ExampleLayer::Update");
	}

	void OnEvent(Quark::Event& event) override
	{
		QRK_TRACE("{0}", event);
	}
};

class Sandbox : public Quark::Application
{
public:
	Sandbox()
	{
		PushLayer(new ExampleLayer());
		PushOverlay(new Quark::ImGuiLayer());
	}

	~Sandbox()
	{

	}

};

Quark::Application* Quark::CreateApplication()
{
	return new Sandbox();
}