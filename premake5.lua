workspace "Ludus"
	architecture "x64"

	configurations
	{
		"Debug",
		"Release",
		"Dist"
	}

	outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

	-- Include directories relative to root folder (solution directory)
	IncludeDir = {}
	IncludeDir["GLFW"] = "Ludus/vendor/GLFW/include"

	include "Ludus/vendor/GLFW"

	project "Ludus"
		location "Ludus"
		kind "SharedLib"
		language "C++"

		targetdir ("bin/" .. outputdir .. "/%{prj.name}")
		objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

		pchheader "ldpch.h"
		pchsource "Ludus/src/ldpch.cpp"

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
				"LUDUS_PLATFORM_WINDOWS",
				"LUDUS_BUILD_DLL"
			}

			postbuildcommands
			{
				("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
			}

		filter "configurations:Debug"
			defines "Ludus_DEBUG"
			symbols "On"

		filter "configurations:Release"
			defines "Ludus_RELEASE"
			optimize "On"

		filter "configurations:Dist"
			defines "Ludus_DIST"
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
		"Ludus/vendor/spdlog/include",
		"Ludus/src"
	}

	links 
	{
		"Ludus"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines
		{
			"LUDUS_PLATFORM_WINDOWS"
		}


	filter "configurations:Debug"
	defines "Ludus_DEBUG"
	symbols "On"

	filter "configurations:Release"
	defines "Ludus_RELEASE"
	optimize "On"

	filter "configurations:Dist"
	defines "LudusDIST"
	optimize "On"