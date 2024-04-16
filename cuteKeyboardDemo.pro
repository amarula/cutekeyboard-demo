
QT += quick

CONFIG += c++11
TEMPLATE = app

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Refer to the documentation for the
# deprecated API to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS


SOURCES += \
        cuteKeyboardDemo.cpp

RESOURCES += qml.qrc


target.path = $$[QT_INSTALL_PREFIX]/bin
INSTALLS += target
