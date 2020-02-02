conky.config = {
-- Conky settings
	background = true,
	update_interval = 1,

	cpu_avg_samples = 2,
	net_avg_samples = 2,

	override_utf8_locale = true,

	double_buffer = true,
	no_buffers = true,

	text_buffer_size = 2048,
--imlib_cache_size 0

	temperature_unit = 'celsius',

-- Window specifications
	own_window_class = 'Conky',
	own_window = true,
	own_window_type = 'desktop',
	own_window_transparent = true,
	own_window_hints = 'undecorated,sticky,skip_taskbar,skip_pager,below',
	own_window_argb_visual = true,
	own_window_argb_value = 1,

	border_inner_margin = 0,
	border_outer_margin = 0,

	minimum_width = 700, minimum_height = 1080,
	maximum_width = 960,

	alignment = 'top_right',
	gap_x = 10,
	gap_y = 200,

-- Graphics settings
	draw_shades = false,
	draw_outline = false,
	draw_borders = false,
	draw_graph_borders = false,

	default_color = 'gray',
	default_shade_color = 'blue',
	default_outline_color = 'green',

-- Text settings
	use_xft = true,
	override_utf8_locale = true,
	font = 'Play:normal:size=7',
	xftalpha = 0.9,
	uppercase = false,

	default_color = '#E1E4E7',
	color0 = '#a95da3',
	color1 = '#E1E4E7',

-- Lua Load
	lua_load = '~/.config/bspwm/conky/Neo/.conky/rings-v1.3.1.lua',
	lua_draw_hook_pre = 'ring_stats',

};

conky.text = [[
${font Play:normal:size=8}${goto 200}${exec sensors | grep "Package id 0:" | awk '{print $4}' | sed 's/+//' | rev | cut -c6- | rev} °C
${font Play:normal:size=10}${voffset 2}${goto 120}${color1}CPU 1${goto 196}${color1}${cpu cpu1}%
${font Play:normal:size=10}${voffset 2}${goto 120}${color1}CPU 2${goto 192}${color1}${cpu cpu2}%
${font Play:normal:size=10}${voffset 2}${goto 120}${color1}CPU 3${goto 188}${color1}${cpu cpu3}%
${font Play:normal:size=10}${voffset 2}${goto 120}${color1}CPU 4${goto 184}${color1}${cpu cpu4}%
${font Play:normal:size=10}${voffset 2}${goto 120}${color1}CPU 5${goto 180}${color1}${cpu cpu5}%
${font Play:normal:size=10}${voffset 2}${goto 120}${color1}CPU 6${goto 176}${color1}${cpu cpu6}%
${font Play:normal:size=10}${voffset 8}${color1}${goto 185}${freq_g cpu0} Ghz
${goto 100}${voffset 4}${font Play:normal:size=10}${color1}${top cpu 1}%${goto 160}${top name 1}
${goto 100}${font Play:normal:size=10}${color1}${top cpu 2}%${goto 160}${top name 2}
${goto 100}${font Play:normal:size=10}${color1}${top cpu 3}%${goto 160}${top name 3}
${goto 100}${font Play:normal:size=10}${color1}${top cpu 4}%${goto 160}${top name 4}
${goto 100}${font Play:normal:size=10}${color1}${top cpu 5}%${goto 160}${top name 5}
${voffset 2}${font Michroma:size=18}${color0}${goto 70}${voffset 3}CPU
${goto 470}${voffset 70}${font Play:normal:size=10}${color1}${top name 6}${goto 570}${top cpu 6}%
${goto 470}${font Play:normal:size=10}${color1}${top name 7}${goto 570}${top cpu 7}%
${goto 470}${font Play:normal:size=10}${color1}${top name 8}${goto 570}${top cpu 8}%
${goto 470}${font Play:normal:size=10}${color1}${top name 9}${goto 570}${top cpu 9}%
${goto 470}${font Play:normal:size=10}${color1}${top name 10}${goto 570}${top cpu 10}%
${font Play:normal:size=10}${voffset 32}${goto 650}${color1}CPU 7${goto 555}${color1}${cpu cpu7}%
${font Play:normal:size=10}${voffset 1}${goto 650}${color1}CPU 8${goto 563}${color1}${cpu cpu8}%
${font Play:normal:size=10}${voffset 1}${goto 650}${color1}CPU 9${goto 571}${color1}${cpu cpu9}%
${font Play:normal:size=10}${voffset 1}${goto 650}${color1}CPU 10${goto 579}${color1}${cpu cpu10}%
${font Play:normal:size=10}${voffset 1}${goto 650}${color1}CPU 11${goto 587}${color1}${cpu cpu11}%
${font Play:normal:size=10}${voffset 1}${goto 650}${color1}CPU 12${goto 595}${color1}${cpu cpu12}%
${font Play:normal:size=12}${voffset -135}${goto 60}${color1}RAM ${goto 100}${color1}${mem} / ${color1}${memmax}
${voffset 23}${goto 110}${font Play:normal:size=11}${color1}${top_mem mem_vsize 1}${goto 165}${top_mem name 1}
${goto 110}${font Play:normal:size=10}${color1}${top_mem mem_vsize 2}${goto 165}${top_mem name 2}
${goto 110}${font Play:normal:size=10}${color1}${top_mem mem_vsize 3}${goto 165}${top_mem name 3}
${goto 110}${font Play:normal:size=10}${color1}${top_mem mem_vsize 4}${goto 165}${top_mem name 4}
${goto 110}${font Play:normal:size=10}${color1}${top_mem mem_vsize 5}${goto 165}${top_mem name 5}
${goto 110}${font Play:normal:size=10}${color1}${top_mem mem_vsize 6}${goto 165}${top_mem name 6}
${goto 110}${font Play:normal:size=10}${color1}${top_mem mem_vsize 7}${goto 165}${top_mem name 7}
${goto 110}${font Play:normal:size=10}${color1}${top_mem mem_vsize 8}${goto 165}${top_mem name 8}
${goto 110}${font Play:normal:size=10}${color1}${top_mem mem_vsize 9}${goto 165}${top_mem name 9}
${goto 110}${font Play:normal:size=10}${color1}${top_mem mem_vsize 10}${goto 165}${top_mem name 10}
${font Michroma:size=18}${voffset -65}${color0}${voffset 45}MEMORY${color1}
${voffset 12}${font Play:normal:size=10}${goto 520}${voffset -30}Root${color1}${goto 410}${fs_used /} / ${fs_size /}
${font Play:normal:size=10}${goto 520}${voffset 0}Vids${goto 410}${color1}${fs_used /home/doc/Vids} / ${fs_size /home/doc/Vids}
${font Michroma:size=13}${color0}${goto 370}${voffset 8}HARD  DRIVE
${font Michroma:size=13}${color0}${voffset -30}${goto 570}INTERNET  INFO
${voffset 4}${font Play:normal:size=9}${color1}${goto 575}Up${goto 590}${color1}${totalup wlo1} / ${color1}${upspeed wlo1}
${font Play:normal:size=9}${goto 555}${color1}Down${goto 590}${color1}${totaldown wlo1} / ${color1}${downspeed wlo1}
${font Play:normal:size=9}${goto 555}Local IP${goto 590}${addr wlo1}
${font Michroma:size=12}${alignc 110}${voffset 15} ${color0}${time %d %B %Y}
${font Michroma:size=18}${alignc 105}${color1}${time %H}:${time %M}
${font Michroma:size=15}${color0}${goto 500}${voffset 10}Uptime${font Play:normal:size=10}${color1}${goto 560}${uptime_short}
${font Michroma:size=15}${color0}${goto 500}${voffset 3}Kernel${font Play:normal:size=10}${color1}${goto 560}${kernel}
${font Michroma:size=15}${color0}${goto 500}${voffset 3}Distro${font Play:normal:size=10}${color1}${goto 560}Arch Linux]];
