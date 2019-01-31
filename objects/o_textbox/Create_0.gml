/// @description Text Box for whatever

/*
So here's the big explanation for how text works in this game. We'll go from bottom up. 
First, there is the o_txt object. This object stores a string as well as special properties 
that text can have like font, color, and effects. 
Next we have o_segment. It's literally just a list of o_txt objects, except it also stores
the pixel width and height of the combination of all o_txt objects stored in the list. 
Additionally, functionally segments are words. We never create a segment with text
like: "hello john!". This would always be two segments each with their own o_txt
objects for "hello " and "john!". Spaces and punctuation are included in the segment text. 

Frankly, segments should probably be called "words" but since segments have
stuff like spaces and puncuation in them, it felt wrong to call them words.
Also, the o-txt object should've been "chars" or something since o_txt
objects are almost always complete words or parts of a word. 

Finally there are chunks. A chunk is a list of o_segment objects. It might have
made sense to call them "paragraphs" instead, since that's how I'm thinking about them.
Whatever, the most confusing aspect here is that "chunks" is a list of LISTS of segments.

The process for creating textboxes and adding text is kind of annoying. First you create 
the textbox object with "instance_create_layer(x, y, "Text", o_textbox)". Then you create 
a list. Conceptually this list is a "chunk" which we will add segments to. We have a number
of scripts that simplify the process of making segments and adding o_txt to them. For
example, scr_list_addsegment_multi will automatically take a string and make segments and 
o_txt objects and add them to the chunk list. Here's an example of creating a textbox and 
adding text to it. 

v_mytextbox = instance_create_layer(x, y, "Text", o_textbox);
var t_chunk = ds_list_create();
scr_list_addsegment_multi(t_chunk, "This is some example text!", c_white);
scr_textbox_addchunk(v_mytextbox, t_chunk);
t_chunk = ds_list_create(); // last two lines are just for deleting the list
ds_list_destroy(t_chunk);
*/
/*
BEHOLD!!!
We're going to redo how this works. Forget chunks and lists of lists. It's a supid idea.
Textboxes now will just have a list called "segments". And it is a great big list of...
you guessed it... segments. We started with the idea of "chunks" as a way to organize 
paragraphs. However, it is easier to simply add "new line" flags to segments. So that's
how we're going to do this from now on. 
*/

// REMOVING: v_textbox_chunks = ds_list_create(); // a list of lists of o_segment objects
v_textbox_segments = ds_list_create();
v_textbox_lines = ds_list_create();//auto generated list of segments (from segments) that line wrap correctly

v_textbox_visible = true;
v_textbox_ispopup = false;

// triggered and close are used to open and close text boxes
v_textbox_triggered = false;
v_textbox_close = false;
//v_textbox_active = false;
v_textbox_collapses = true; // I don't remember what this is for
v_textbox_ispermenant = false;
v_textbox_isgui = false;
enum enum_textbox_guipos {
	center_center,
	custom
}
v_textbox_guipos = enum_textbox_guipos.center_center;
v_textbox_guiX = 0;//used for enum custom
v_textbox_guiY = 0;//used for enum custom
v_textbox_lockplayer = false;

v_textbox_collideswithplayer = false;

//text box is drawn center oriented from the top of the bbox_top
//these values adjust that (0 means no change)
v_textbox_x_offset = 0;
v_textbox_y_offset = 0;

v_textbox_bodycolor = c_black;
v_textbox_bordercolor = c_navy;

v_textbox_border_width = 2;
v_textbox_xpad = 2;

//textbox states
enum enum_textbox_state {
	off,
	opening,
	active,
	closing
}
v_textbox_state = enum_textbox_state.off;

/* 
This width and height max values include the border.
So if the max width is 20, and the border width is 2,
the actual space allowed inside the box for text is 16
box width (20) - 2 * border width (2)
*/
v_textbox_width_max = 0;// this will be resized if a word (segment) is too big
v_textbox_height_max = 0;// this will be resized if there are too many lines

v_textbox_width = v_textbox_width_max;
v_textbox_height = v_textbox_height_max;

v_textbox_width_min = 5;
v_textbox_height_min = 1;

v_textbox_recalculate = true;

//expand rate is automatically adjusted to the size of the box.
v_textbox_expandrate = 0;
v_textbox_expanddiv = 30;

//variables for typing text
v_textbox_typeto_line = 0;
v_textbox_typeto_sgmt = 0;
v_textbox_typeto_otxt = 0;
v_textbox_typeto_char = 0;

v_textbox_typetimer = 0;

v_textbox_char_delay = 1;
v_textbox_punc_delay = 2;

event_inherited();
v_static_bbox_color = c_yellow;