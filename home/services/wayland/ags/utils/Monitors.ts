/* The purpose here is to make dynamic sized windows, and it started with an annoying bug
 * where my notifications were small. I tried to use Window.set_geometry_hints() to fix it
 * but the notification window isn't focused... Meaning resizes won't work */
import Gdk from "gi://Gdk";

/* NOTE: Shouldn't this be in the plural? */
interface Geometries {
  [monitor: number]: Gdk.Rectangle;
}

const geometry: Geometries = {};
const rect = new Gdk.Rectangle();

export function monitorInfo(monitor: number) {
    if (!(monitor in geometry)) {
        const output = Gdk.Display.get_default()?.get_monitor(monitor);
        geometry[monitor] = output?.get_geometry() || rect;
    }

    return {
        width: geometry[monitor].width,
        height: geometry[monitor].height,
    };
}

// export function monitorRatio(monitor: number) {}
