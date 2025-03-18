cmake_minimum_required(VERSION 3.16)

project(qml-template VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick QuickControls2)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appqml-template
    src/main.cpp
)

qt_add_resources(appqml-template "qml"
        PREFIX /
        FILES
            resources/icons/info.svg
            resources/icons/settings.svg
            resources/icons/computer.svg
            resources/icons/memory.svg
            resources/icons/home.svg
            resources/icons/exit.svg
            resources/icons/account.svg
            resources/images/image.jpg
)

qt_add_qml_module(appqml-template
    URI qml-template
    VERSION 1.0
    QML_FILES
        qml/Main.qml
        qml/App.qml
        qml/Header.qml
        qml/Sidebar.qml
        qml/pages/MainView.qml
        qml/pages/Settings.qml
        qml/pages/Data.qml
        qml/pages/Info.qml
        qml/components/SidebarButton.qml
        QML_FILES qml/pages/Device.qml
        QML_FILES qml/components/HeaderButton.qml

)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appqml-template PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appqml-template
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appqml-template
    PRIVATE Qt6::Quick Qt6::QuickControls2
)

include(GNUInstallDirs)
install(TARGETS appqml-template
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
