/// @description

if (global.prevroom != room) global.prevroom = room;

if (room == 0) room_goto_next();

if (!global.freezeactors && global.freezeactors_time > 0) global.freezeactors_time--;
