/datum/hud/proc/hologram_hud(var/ui_style='icons/mob/screen1_White.dmi')
	src.adding = list()
	src.other = list()
	ui_style = 'icons/mob/screen1_White.dmi'

	var/obj/abstract/screen/using
	var/obj/abstract/screen/inventory/inv_box

	using = new /obj/abstract/screen
	using.name = "act_intent"
	using.dir = SOUTHWEST
	using.icon = ui_style
	using.icon_state = (mymob.a_intent == I_HURT ? "harm" : mymob.a_intent)
	using.screen_loc = ui_acti
	src.adding += using
	action_intent = using

//intent small hud objects
	var/icon/ico

	ico = new(ui_style, "black")
	ico.MapColors(0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0, -1,-1,-1,-1)
	ico.DrawBox(rgb(255,255,255,1),1,ico.Height()/2,ico.Width()/2,ico.Height())
	using = new /obj/abstract/screen(src)
	using.name = "help"
	using.icon = ico
	using.screen_loc = ui_acti
	using.layer = HUD_ABOVE_ITEM_LAYER
	src.adding += using
	help_intent = using

	ico = new(ui_style, "black")
	ico.MapColors(0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0, -1,-1,-1,-1)
	ico.DrawBox(rgb(255,255,255,1),ico.Width()/2,ico.Height()/2,ico.Width(),ico.Height())
	using = new /obj/abstract/screen(src)
	using.name = "disarm"
	using.icon = ico
	using.screen_loc = ui_acti
	using.layer = HUD_ABOVE_ITEM_LAYER
	src.adding += using
	disarm_intent = using

	ico = new(ui_style, "black")
	ico.MapColors(0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0, -1,-1,-1,-1)
	ico.DrawBox(rgb(255,255,255,1),ico.Width()/2,1,ico.Width(),ico.Height()/2)
	using = new /obj/abstract/screen(src)
	using.name = "grab"
	using.icon = ico
	using.screen_loc = ui_acti
	using.layer = HUD_ABOVE_ITEM_LAYER
	src.adding += using
	grab_intent = using

	ico = new(ui_style, "black")
	ico.MapColors(0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0, -1,-1,-1,-1)
	ico.DrawBox(rgb(255,255,255,1),1,1,ico.Width()/2,ico.Height()/2)
	using = new /obj/abstract/screen(src)
	using.name = "harm"
	using.icon = ico
	using.screen_loc = ui_acti
	using.layer = HUD_ABOVE_ITEM_LAYER
	src.adding += using
	hurt_intent = using

//end intent small hud objects

	using = new /obj/abstract/screen
	using.name = "mov_intent"
	using.dir = SOUTHWEST
	using.icon = ui_style
	using.icon_state = (mymob.m_intent == "run" ? "running" : "walking")
	using.screen_loc = ui_movi
	src.adding += using
	move_intent = using

	using = new /obj/abstract/screen
	using.name = "drop"
	using.icon = ui_style
	using.icon_state = "act_drop"
	using.screen_loc = ui_drop_throw
	using.layer = HUD_BASE_LAYER
	src.adding += using

	init_hand_icons(ui_style)

	#define ui_swaphand_hologram1	"CENTER-1:16,SOUTH:5"
	#define ui_swaphand_hologram2	"CENTER:16,SOUTH:5"
	#define ui_equip_hologram		"CENTER:16,SOUTH:5"

	using = new /obj/abstract/screen/inventory
	using.name = "hand"
	using.dir = SOUTH
	using.icon = ui_style
	using.icon_state = "hand1"
	using.screen_loc = ui_swaphand1
	using.layer = HUD_BASE_LAYER
	src.adding += using

	using = new /obj/abstract/screen/inventory
	using.name = "hand"
	using.dir = SOUTH
	using.icon = ui_style
	using.icon_state = "hand2"
	using.screen_loc = ui_swaphand2
	using.layer = HUD_BASE_LAYER
	src.adding += using

	#undef ui_equip_hologram
	#undef ui_swaphand_hologram1
	#undef ui_swaphand_hologram2

	using = new /obj/abstract/screen
	using.name = "equip"
	using.icon = ui_style
	using.icon_state = "act_equip"
	using.screen_loc = ui_equip
	src.adding += using
/*
	using = new /obj/abstract/screen
	using.name = "resist"
	using.icon = ui_style
	using.icon_state = "act_resist"
	using.screen_loc = ui_pull_resist
	using.layer = HUD_BASE_LAYER
	src.adding += using
*/
	inv_box = new /obj/abstract/screen/inventory
	inv_box.name = "head"
	inv_box.dir = SOUTH
	inv_box.icon = ui_style
	inv_box.slot_id = slot_head
	inv_box.icon_state = "hair"
	inv_box.screen_loc = ui_id
	inv_box.layer = HUD_BASE_LAYER
	src.adding += inv_box

	inv_box = new /obj/abstract/screen/inventory
	inv_box.name = "i_clothing"
	inv_box.dir = SOUTH
	inv_box.icon = ui_style
	inv_box.slot_id = slot_w_uniform
	inv_box.icon_state = "center"
	inv_box.screen_loc = ui_belt
	inv_box.layer = HUD_BASE_LAYER
	src.adding += inv_box

	inv_box = new /obj/abstract/screen/inventory
	inv_box.name = "o_clothing"
	inv_box.dir = SOUTH
	inv_box.icon = ui_style
	inv_box.slot_id = slot_wear_suit
	inv_box.icon_state = "equip"
	inv_box.screen_loc = ui_back
	inv_box.layer = HUD_BASE_LAYER
	src.adding += inv_box

	mymob.throw_icon = new /obj/abstract/screen
	mymob.throw_icon.icon = ui_style
	mymob.throw_icon.icon_state = "act_throw_off"
	mymob.throw_icon.name = "throw"
	mymob.throw_icon.screen_loc = ui_drop_throw

	mymob.healths = new /obj/abstract/screen
	mymob.healths.icon = ui_style
	mymob.healths.icon_state = "health0"
	mymob.healths.name = "health"
	mymob.healths.screen_loc = ui_health

	mymob.pullin = new /obj/abstract/screen
	mymob.pullin.icon = ui_style
	mymob.pullin.icon_state = "pull0"
	mymob.pullin.name = "pull"
	mymob.pullin.screen_loc = ui_pull_resist

	mymob.zone_sel = new /obj/abstract/screen/zone_sel
	mymob.zone_sel.icon = ui_style
	mymob.zone_sel.overlays.len = 0
	mymob.zone_sel.overlays += image('icons/mob/zone_sel.dmi', "[mymob.zone_sel.selecting]")

	//Handle the gun settings buttons
	mymob.gun_setting_icon = new /obj/abstract/screen/gun/mode
	if (mymob.client)
		if (mymob.client.gun_mode) // If in aim mode, correct the sprite
			mymob.gun_setting_icon.dir = 2
	for(var/obj/item/weapon/gun/G in mymob) // If targeting someone, display other buttons
		if (G.target)
			mymob.item_use_icon = new /obj/abstract/screen/gun/item
			if (mymob.client.target_can_click)
				mymob.item_use_icon.dir = 1
			src.adding += mymob.item_use_icon
			mymob.gun_move_icon = new /obj/abstract/screen/gun/move
			if (mymob.client.target_can_move)
				mymob.gun_move_icon.dir = 1
				mymob.gun_run_icon = new /obj/abstract/screen/gun/run
				if (mymob.client.target_can_run)
					mymob.gun_run_icon.dir = 1
				src.adding += mymob.gun_run_icon
			src.adding += mymob.gun_move_icon

	mymob.client.reset_screen()

	mymob.client.screen += list( mymob.throw_icon, mymob.zone_sel, mymob.healths, mymob.pullin, mymob.gun_setting_icon)
	mymob.client.screen += src.adding + src.other