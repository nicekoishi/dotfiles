import Icons from "utils/Icons";
const Audio = await Service.import("audio");

export const spkIcon = (self: any) => {
    const vol = Audio.speaker.is_muted ? 0 : Audio.speaker.volume;
    const { muted, low, medium, high, overamplified } = Icons.audio.speaker;
    const cons = [
        [101, overamplified],
        [67, high],
        [34, medium],
        [1, low],
        [0, muted],
    ] as const; /* read-only? */

    self.className = "spkBtn";
    self.icon = cons.find(([n]) => n <= vol * 100)?.[1] || "";
    // console.log(`spkIcon type: ${typeof self}`);
};

export const micIcon = (self: any) => {
    const vol = Audio.microphone.is_muted ? 0 : Audio.microphone.volume;
    const { muted, low, medium, high } = Icons.audio.microphone;
    const cons = [
        [67, high],
        [34, medium],
        [1, low],
        [0, muted],
    ] as const; /* read-only? */

    self.className = "micBtn";
    self.icon = cons.find(([n]) => n <= vol * 100)?.[1] || "";
    // console.log(`micIcon type: ${typeof self}`);
};
