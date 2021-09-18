/// @description scr_segment_addtxt(o_segment, o_txt)
function scr_segment_addtxt() {

	/// @param o_segment
	/// @param o_txt

	ds_list_add(argument[0].v_segment_txts, argument[1]);

	argument[0].v_segment_width = 0;
	argument[0].v_segment_height = 0;
	for (var segment_addtxt_i = 0; segment_addtxt_i < ds_list_size(argument[0].v_segment_txts); segment_addtxt_i++)
	{
		var t_txt = ds_list_find_value(argument[0].v_segment_txts, segment_addtxt_i);
		argument[0].v_segment_width += t_txt.v_txt_width;
		if (argument[0].v_segment_height < t_txt.v_txt_height) argument[0].v_segment_height = t_txt.v_txt_height;
	}


}
