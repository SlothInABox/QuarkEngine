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
IncludeDir["Glad"] = "Quark/vendor/Glad/include"
IncludeDir["ImGui"] = "Quark/vendor/imgui"

include "Quark/vendor/GLFW"
include "Quark/vendor/Glad"
include "Quark/vendor/imgui"

project "Quark"
    location "Quark"
    kind "SharedLib"
    language "C++"
    staticruntime "Off"

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
        "%{IncludeDir.GLFW}",
        "%{IncludeDir.Glad}",
        "%{IncludeDir.ImGui}"
    }

    links
    {
        "GLFW",
        "Glad",
        "ImGui",
        "opengl32.lib"
    }

    filter "system:windows"
        cppdialect "C++17"
        systemversion "latest"

        defines
        {
            "QRK_PLATFORM_WINDOWS",
            "QRK_BUILD_DLL",
            "GLFW_INCLUDE_NONE"
        }

        postbuildcommands
        {
            ("{COPY} %{cfg.buildtarget.relpath} \"../bin/" .. outputdir .. "/Sandbox/\"")
        }

    filter "configurations:Debug"
        defines "QRK_DEBUG"
        runtime "Debug"
        symbols "On"

    filter "configurations:Release"
        defines "QRK_RELEASE"
        runtime "Release"
        optimize "On"

    filter "configurations:Dist"
        defines "QRK_DIST"
        runtime "Release"
        optimize "On"

project "Sandbox"
    location "Sandbox"
    kind "ConsoleApp"
    language "C++"
    staticruntime "Off"

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
        systemversion "latest"

        defines
        {
            "QRK_PLATFORM_WINDOWS"
        }

    filter "configurations:Debug"
        defines "QRK_DEBUG"
        runtime "Debug"
        symbols "On"

    filter "configurations:Release"
        defines "QRK_RELEASE"
        runtime "Release"
        optimize "On"

    filter "configurations:Dist"
        defines "QRK_DIST"
        runtime "Release"
        optimize "On"