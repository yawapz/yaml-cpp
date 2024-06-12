import qbs

Product {
    name: "Yaml"
    targetName: "yaml"

    type: "staticlibrary"

    Properties {
        type: "dynamiclibrary"
        condition: project.yamlDynamicLib === true
    }
    Properties {
        destinationDirectory: project.destinationLibDirectory
        condition: project.destinationLibDirectory !== undefined
    }

    Depends { name: "cpp" }

    cpp.defines: [
        "YAML_CPP_STATIC_DEFINE"
    ]
    cpp.cxxFlags: [
        "-ggdb3",
        "-Wall",
        "-Wextra",
        "-Wno-unused-parameter",
    ]
    cpp.includePaths: ["include"]
    cpp.cxxLanguageVersion: "c++17"

    files: [
        "include/yaml-cpp/contrib/*.h",
        "include/yaml-cpp/node/detail/*.h",
        "include/yaml-cpp/node/*.h",
        "include/yaml-cpp/*.h",
        "src/*.cpp",
        "src/*.h",
    ]
    Export {
        Depends { name: "cpp" }
        cpp.systemIncludePaths: ["include"]
        cpp.defines: ["YAML_CPP_STATIC_DEFINE"]
    }
}
