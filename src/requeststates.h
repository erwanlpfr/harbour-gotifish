#ifndef REQUESTSTATES_H
#define REQUESTSTATES_H

#include <QObject>

class RequestStates : public QObject {
    Q_OBJECT
public:
    enum State { Idle,
        Loading,
        Success,
        Error };
    Q_ENUM(State)
};

#endif // REQUESTSTATES_H
