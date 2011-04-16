/obj/item/weapon/storage/toolbox/New()
	..()
	if (src.type == /obj/item/weapon/storage/toolbox)
		world << "BAD: [src] ([src.type]) spawned at [src.x] [src.y] [src.z]"
		del(src)

/obj/item/weapon/storage/toolbox/emergency/New()
	..()
	new /obj/item/weapon/crowbar/red(src)
	new /obj/item/weapon/extinguisher(src)
	new /obj/item/device/flashlight(src)
	new /obj/item/device/radio(src)

/obj/item/weapon/storage/toolbox/mechanical/New()
	..()
	new /obj/item/weapon/screwdriver(src)
	new /obj/item/weapon/wrench(src)
	new /obj/item/weapon/weldingtool(src)
	new /obj/item/weapon/crowbar(src)
	new /obj/item/device/analyzer(src)
	new /obj/item/weapon/wirecutters(src)

/obj/item/weapon/storage/toolbox/electrical/New()
	..()
	new /obj/item/weapon/screwdriver(src)
	new /obj/item/weapon/wirecutters(src)
	new /obj/item/device/t_scanner(src)
	new /obj/item/weapon/crowbar(src)
	new /obj/item/weapon/cable_coil(src)
	new /obj/item/weapon/cable_coil(src)
	if(prob(5))
		new /obj/item/clothing/gloves/yellow(src)
	else
		new /obj/item/weapon/cable_coil(src)