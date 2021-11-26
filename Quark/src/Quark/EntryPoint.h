#pragma once

#ifdef QRK_PLATFORM_WINDOWS

extern Quark::Application* Quark::CreateApplication();

int main(int argc, char** argv)
{
	Quark::Log::Init();
	QRK_CORE_WARN("Initialized log!");
	int a = 5;
	QRK_INFO("Hello! Var={0}", a);

	auto app = Quark::CreateApplication();
	app->Run();
	delete app;

	return 0;
}

#endif