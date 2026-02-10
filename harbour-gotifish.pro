# NOTICE:
#
# Application name defined in TARGET has a corresponding QML filename.
# If name defined in TARGET is changed, the following needs to be done
# to match new name:
#   - corresponding QML filename must be changed
#   - desktop icon filename must be changed
#   - desktop filename must be changed
#   - icon definition filename in desktop file must be changed
#   - translation filenames have to be changed

# The name of your application
TARGET = harbour-gotifish

CONFIG += sailfishapp

QT += qml quick network

DISTFILES += qml/harbour-gotifish.qml \
    qml/cover/CoverPage.qml \
    qml/pages/Home.qml \
    qml/settings/instance.qml \
    qml/settings/instances.qml \
    rpm/harbour-gotifish.changes.in \
    rpm/harbour-gotifish.changes.run.in \
    rpm/harbour-gotifish.spec \
    translations/*.ts \
    harbour-gotifish.desktop

SAILFISHAPP_ICONS = 86x86 108x108 128x128 172x172

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n

# German translation is enabled as an example. If you aren't
# planning to localize your app, remember to comment out the
# following TRANSLATIONS line. And also do not forget to
# modify the localized app name in the the .desktop file.
TRANSLATIONS += translations/harbour-gotifish-de.ts

HEADERS += \
    src/gotifyclient.h \
    src/healthmodel.h \
    src/healthservice.h \
    src/networkmanager.h \
    src/requeststates.h

SOURCES += \
    src/gotifish.cpp \
    src/gotifyclient.cpp \
    src/healthservice.cpp \
    src/networkmanager.cpp
