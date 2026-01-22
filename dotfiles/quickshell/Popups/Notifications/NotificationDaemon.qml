import QtQuick

QtObject {
    id: daemon

    property var notifications: []

    property int _nextId: 0

    signal notificationAdded(var notification)
    signal notificationRemoved(int id)
    signal notificationsChanged()

    function notify(data) {
        const notif = {
            id: _nextId++,
            appName: data.appName ?? "Unknown",
            appIcon: data.appIcon ?? "",
            summary: data.summary ?? "",
            body: data.body ?? "",
            timestamp: Date.now(),
            read: false
        }

        notifications.unshift(notif)

        notificationAdded(notif)
        notificationsChanged()
    }

    function dismiss(id) {
        for (let i = 0; i < notifications.length; i++) {
            if (notifications[i].id === id) {
                notifications.splice(i, 1)
                notificationRemoved(id)
                notificationsChanged()
                return
            }
        }
    }

    function markRead(id) {
        for (let n of notifications) {
            if (n.id === id) {
                n.read = true
                notificationsChanged()
                return
            }
        }
    }

    function clearAll() {
        notifications = []
        notificationsChanged()
    }
}
