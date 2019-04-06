/// @description ROund x and y

var _x = x;
var _y = y;

x = floor(x);
y = floor(y);

draw_self();

x = _x;
y = _y;