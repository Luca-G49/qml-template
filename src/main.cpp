// Copyright (c) 2025 Luca-G49
// Distribuited under the MIT License. See the LICENSE file for more details.

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    //App information
    app.setOrganizationName("Luca");
    app.setOrganizationDomain("LucaG49");
    app.setApplicationName("qml-template");

    QQmlApplicationEngine engine;
    QQuickStyle::setStyle("Default");
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("qml-template", "Main");

    return app.exec();
}
