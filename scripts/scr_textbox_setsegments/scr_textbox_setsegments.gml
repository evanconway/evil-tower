/// @description scr_textbox_setsegments(textboxID, segmentlist)

/// @param textboxID
/// @param segmentlist

ds_list_clear(argument[0].v_textbox_segments);
argument[0].v_textbox_recalculate = true;

argument[0].v_textbox_typetimer = argument[0].v_textbox_typestart_delay;

argument[0].v_textbox_typeto_line = 0;
argument[0].v_textbox_typeto_sgmt = 0;
argument[0].v_textbox_typeto_otxt = 0;
argument[0].v_textbox_typeto_char = 0;

argument[0].v_textbox_segments = argument[1];