project "ImGui"
	kind "StaticLib"
	language "C++"
    staticruntime "off"

	targetdir (outputdirBIN)
	objdir (outputdirOBJ)

	files
	{
		"imconfig.h",
		"imgui.h",
		"imgui.cpp",
		"imgui_draw.cpp",
		"imgui_internal.h",
		"imgui_tables.cpp",
		"imgui_widgets.cpp",
		"imstb_rectpack.h",
		"imstb_textedit.h",
		"imstb_truetype.h",
		"imgui_demo.cpp"
	}

	filter "system:windows"
		systemversion "latest"
		cppdialect "C++17"

        defines{
            "_IMGUI_WIN32"
        }

	filter "system:linux"
		pic "On"
		systemversion "latest"
		cppdialect "C++17"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		buildoptions "/MT"
		optimize "on"

    filter "configurations:Dist"
		buildoptions "/MT"
		optimize "on"
        symbols "off"
