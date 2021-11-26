workspace "Quark"
    architecture "x64"
    startproject "Sandbox"

    configurations
    {
        "Debug",
        "Release",
        "Dist"
    }

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

-- Include directories relative to root folder (solution directory)
IncludeDir = {}
IncludeDir["GLFW"] = "Quark/vendor/GLFW/include"

include "Quark/vendor/GLFW"

project "Quark"
    location "Quark"
    kind "SharedLib"
    language "C++"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    pchheader "qrkpch.h"
    pchsource "Quark/src/qrkpch.cpp"

    files
    {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp"
    }

    includedirs
    {
        "%{prj.name}/src",
        "%{prj.name}/vendor/spdlog/include",
        "%{IncludeDir.GLFW}"
    }

    links
    {
        "GLFW",
        "opengl32.lib"
    }

    filter "system:windows"
        cppdialect "C++17"
        staticruntime "On"
        systemversion "latest"

        defines
        {
            "QRK_PLATFORM_WINDOWS",
            "QRK_BUILD_DLL"
        }

        postbuildcommands
        {
            ("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox/")
        }

    filter "configurations:Debug"
        defines "QRK_DEBUG"
        symbols "On"

    filter "configurations:Release"
        defines "QRK_RELEASE"
        optimize "On"

    filter "configurations:Dist"
        defines "QRK_DIST"
        optimize "On"

project "Sandbox"
    location "Sandbox"
    kind "ConsoleApp"
    language "C++"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files
    {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp"
    }

    includedirs
    {
        "Quark/vendor/spdlog/include",
        "Quark/src"
    }

    links
    {
        "Quark"
    }

    filter "system:windows"
        cppdialect "C++17"
        staticruntime "On"
        systemversion "latest"

        defines
        {
            "QRK_PLATFORM_WINDOWS"
        }

    filter "configurations:Debug"
        defines "QRK_DEBUG"
        symbols "On"

    filter "configurations:Release"
        defines "QRK_RELEASE"
        optimize "On"

    filter "configurations:Dist"
        defines "QRK_DIST"
        optimize "On"