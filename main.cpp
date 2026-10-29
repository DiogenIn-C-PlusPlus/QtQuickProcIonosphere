#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickWindow>

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated, &app, [url](QObject *obj, const QUrl &objUrl)
    {
        if (!obj && url == objUrl)
        {
             QCoreApplication::exit(-1);
        }
    }, Qt::QueuedConnection);
    engine.load(url);

//    if (!engine.rootObjects().isEmpty())
//    {
//        QQuickWindow *mainWindow =
//            qobject_cast<QQuickWindow*>(engine.rootObjects().first());

//        if (mainWindow) {
//            QQuickWindow *searchWindow =
//                mainWindow->findChild<QQuickWindow*>("searchwindow");

//            if (searchWindow) {
//                qDebug() << "SearchWindow найден";
//                searchWindow->setTransientParent(mainWindow);
//                searchWindow->setModality(Qt::WindowModal);
//            } else {
//                qDebug() << "SearchWindow НЕ найден";
//                // Вывести всех детей для отладки
//                for (QObject *child : mainWindow->children()) {
//                    qDebug() << "  child:" << child->objectName()
//                             << child->metaObject()->className();
//                }
//            }
//        }
//    }

    return app.exec();
}
