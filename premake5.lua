workspace "Ludus"
	architecture "x64"

	configurations
	{
		"Debug",
		"Release",
		"Dist"
	}

	outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

	project "Ludus"
		location "Ludus"
		kind "SharedLib"
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
			"%{prj.name}/src",
			"%{prj.name}/vendor/spdlog/include"
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