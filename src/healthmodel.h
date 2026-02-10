#ifndef HEALTHMODEL_H
#define HEALTHMODEL_H

#include <QObject>
#include <QString>

struct HealthModel {
    Q_GADGET
public:
    Q_PROPERTY(QString database MEMBER database)
    Q_PROPERTY(QString health MEMBER health)
    
    QString database;
    QString health;
};
Q_DECLARE_METATYPE(HealthModel)

#endif // HEALTHMODEL_H
