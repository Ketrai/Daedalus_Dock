/datum/mod_theme/deadspace/astronaut
	name = "Astronaut"
	desc = "A very light, emergency rig for use by non-qualified personnel in the case of emergency decompression. Soft materials barely impede movement."
	default_skin = "astro"
	armor = list(MELEE = 10, BULLET = 5, LASER = 5, ENERGY = 5, BOMB = 0, BIO = 100, FIRE = 25, ACID = 25, WOUND = 5, )

	skins = list(
		"astro" = list(
			HELMET_FLAGS = list(
				UNSEALED_LAYER = NECK_LAYER,
				UNSEALED_CLOTHING = SNUG_FIT,
				SEALED_CLOTHING = THICKMATERIAL|STOPSPRESSUREDAMAGE,
				UNSEALED_INVISIBILITY = HIDEFACIALHAIR,
				SEALED_INVISIBILITY = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDESNOUT,
				SEALED_COVER = HEADCOVERSMOUTH|HEADCOVERSEYES|PEPPERPROOF,
			),
			CHESTPLATE_FLAGS = list(
				UNSEALED_CLOTHING = THICKMATERIAL,
				SEALED_CLOTHING = STOPSPRESSUREDAMAGE,
				SEALED_INVISIBILITY = HIDEJUMPSUIT,
			),
			GAUNTLETS_FLAGS = list(
				UNSEALED_CLOTHING = THICKMATERIAL,
				SEALED_CLOTHING = STOPSPRESSUREDAMAGE,
				CAN_OVERSLOT = TRUE,
			),
			BOOTS_FLAGS = list(
				UNSEALED_CLOTHING = THICKMATERIAL,
				SEALED_CLOTHING = STOPSPRESSUREDAMAGE,
				CAN_OVERSLOT = TRUE,
			),
		),
	)

/obj/item/mod/control/pre_equipped/astronaut
	theme = /datum/mod_theme/deadspace/astronaut
	initial_modules = list(
		/obj/item/mod/module/storage,
		/obj/item/mod/module/jetpack,
		/obj/item/mod/module/flashlight,
		/obj/item/mod/module/magboot,
		/obj/item/mod/module/welding,
		/obj/item/mod/module/tether,
	)
