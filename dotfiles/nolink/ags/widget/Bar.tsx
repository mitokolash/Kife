import app from "ags/gtk4/app"
import { Astal, Gtk, Gdk } from "ags/gtk4"
import { createPoll } from "ags/time"

export default function Bar(gdkmonitor: Gdk.Monitor) {
  const time = createPoll("", 1000, ["sh", "-c", "date +\"%a %d %b %H:%M\" | sed -E 's/\\b(.)/\\u\\1/g'"])
  const { BOTTOM, LEFT, RIGHT } = Astal.WindowAnchor

  return (
    <window
      visible
      name="bar"
      class="Bar"
      gdkmonitor={gdkmonitor}
      exclusivity={Astal.Exclusivity.EXCLUSIVE}
      anchor={BOTTOM | LEFT | RIGHT}
      application={app}
    >
      <centerbox cssName="centerbox">
        <box $type="start" halign={Gtk.Align.START}/>
        <box $type="center" />
        <box $type="end" halign={Gtk.Align.END}>
          <label cssName="clock" label={time} />
        </box>
      </centerbox>
    </window>
  )
}
