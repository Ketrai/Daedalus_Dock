/**********************Asteroid**************************/

/turf/open/misc/asteroid //floor piece
	gender = PLURAL
	name = "asteroid sand"
	desc = "It's coarse and rough and gets everywhere."
	baseturfs = /turf/open/misc/asteroid
	icon = 'icons/turf/floors.dmi'
	icon_state = "asteroid"
	base_icon_state = "asteroid"

	footstep = FOOTSTEP_SAND
	barefootstep = FOOTSTEP_SAND
	clawfootstep = FOOTSTEP_SAND
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY

	simulated = TRUE //Kilostation

	/// Base turf type to be created by the tunnel
	var/turf_type = /turf/open/misc/asteroid
	/// Probability floor has a different icon state
	var/floor_variance = 20
	/// Itemstack to drop when dug by a shovel
	var/obj/item/stack/digResult = /obj/item/stack/ore/glass/basalt
	/// Whether the turf has been dug or not
	var/dug = FALSE
	/// Icon state to use when broken
	var/broken_state = "asteroid_dug"

/turf/open/misc/asteroid/break_tile()
	icon_state = broken_state

/turf/open/misc/asteroid/Initialize(mapload)
	var/proper_name = name
	. = ..()
	name = proper_name
	if(prob(floor_variance))
		icon_state = "[base_icon_state][rand(0,12)]"

/// Drops itemstack when dug and changes icon
/turf/open/misc/asteroid/proc/getDug()
	dug = TRUE
	new digResult(src, 5)
	icon_state = "[base_icon_state]_dug"

/// If the user can dig the turf
/turf/open/misc/asteroid/proc/can_dig(mob/user)
	if(!dug)
		return TRUE
	if(user)
		to_chat(user, span_warning("Looks like someone has dug here already!"))

/turf/open/misc/asteroid/burn_tile()
	return
/turf/open/misc/asteroid/MakeSlippery(wet_setting, min_wet_time, wet_time_to_add, max_wet_time, permanent)
	return

/turf/open/misc/asteroid/MakeDry()
	return

/turf/open/misc/asteroid/ex_act(severity, target)
	return

/turf/open/misc/asteroid/attackby(obj/item/W, mob/user, params)
	. = ..()
	if(.)
		return TRUE

	if(W.tool_behaviour == TOOL_SHOVEL || W.tool_behaviour == TOOL_MINING)
		if(!can_dig(user))
			return TRUE

		if(!isturf(user.loc))
			return

		to_chat(user, span_notice("You start digging..."))

		if(W.use_tool(src, user, 40, volume=50))
			if(!can_dig(user))
				return TRUE
			to_chat(user, span_notice("You dig a hole."))
			getDug()
			SSblackbox.record_feedback("tally", "pick_used_mining", 1, W.type)
			return TRUE
	else if(istype(W, /obj/item/storage/bag/ore))
		for(var/obj/item/stack/ore/O in src)
			SEND_SIGNAL(W, COMSIG_PARENT_ATTACKBY, O)


/turf/open/floor/plating/lavaland_baseturf
	baseturfs = /turf/open/misc/asteroid/basalt/lava_land_surface

/turf/open/misc/asteroid/dug //When you want one of these to be already dug.
	dug = TRUE
	base_icon_state = "asteroid_dug"
	icon_state = "asteroid_dug"

/// Used by ashstorms to replenish basalt tiles that have been dug up without going through all of them.
GLOBAL_LIST_EMPTY(dug_up_basalt)

/turf/open/misc/asteroid/basalt
	name = "volcanic floor"
	baseturfs = /turf/open/misc/asteroid/basalt
	icon = 'icons/turf/floors.dmi'
	icon_state = "basalt"
	base_icon_state = "basalt"
	floor_variance = 15
	digResult = /obj/item/stack/ore/glass/basalt
	broken_state = "basalt_dug"

	initial_gas = LAVALAND_DEFAULT_ATMOS
	simulated = FALSE //OH *FUCK* NO.

/turf/open/misc/asteroid/basalt/getDug()
	set_light(0)
	GLOB.dug_up_basalt |= src
	return ..()

/turf/open/misc/asteroid/basalt/Destroy()
	GLOB.dug_up_basalt -= src
	return ..()

/turf/open/misc/asteroid/basalt/lava //lava underneath
	baseturfs = /turf/open/lava/smooth

/turf/open/misc/asteroid/basalt/safe_air //Used on Centcom
	initial_gas = OPENTURF_DEFAULT_ATMOS
	temperature = T20C

/turf/open/misc/asteroid/basalt/airless
	initial_gas = AIRLESS_ATMOS

/turf/open/misc/asteroid/basalt/Initialize(mapload)
	. = ..()
	set_basalt_light(src)

/proc/set_basalt_light(turf/open/floor/B)
	switch(B.icon_state)
		if("basalt1", "basalt2", "basalt3")
			B.set_light(2, 0.6, LIGHT_COLOR_LAVA) //more light
		if("basalt5", "basalt9")
			B.set_light(1.4, 0.6, LIGHT_COLOR_LAVA) //barely anything!

///////Surface. The surface is warm, but survivable without a suit. Internals are required. The floors break to chasms, which drop you into the underground.

/turf/open/misc/asteroid/basalt/lava_land_surface
	initial_gas = LAVALAND_DEFAULT_ATMOS
	baseturfs = /turf/open/lava/smooth/lava_land_surface

/turf/open/misc/asteroid/lowpressure
	initial_gas = OPENTURF_LOW_PRESSURE
	baseturfs = /turf/open/misc/asteroid/lowpressure
	turf_type = /turf/open/misc/asteroid/lowpressure

/turf/open/misc/asteroid/airless
	initial_gas = AIRLESS_ATMOS
	temperature = T0C

	baseturfs = /turf/open/misc/asteroid/airless
	turf_type = /turf/open/misc/asteroid/airless

/turf/open/misc/asteroid/snow
	gender = PLURAL
	name = "snow"
	desc = "Looks cold."
	icon = 'icons/turf/snow.dmi'
	baseturfs = /turf/open/misc/asteroid/snow
	icon_state = "snow"
	base_icon_state = "snow"
	broken_state = "snow_dug"
	temperature = 180
	slowdown = 2
	flags_1 = NONE

	simulated = FALSE
	initial_gas = ICEMOON_DEFAULT_ATMOS

	bullet_sizzle = TRUE
	bullet_bounce_sound = null
	digResult = /obj/item/stack/sheet/mineral/snow
	var/burnt = FALSE

/turf/open/misc/asteroid/snow/burn_tile()
	if(!burnt)
		visible_message(span_danger("[src] melts away!."))
		slowdown = 0
		burnt = TRUE
		icon_state = "snow_dug"
		return TRUE
	return FALSE

/turf/open/misc/asteroid/snow/icemoon
	baseturfs = /turf/open/openspace/icemoon
	slowdown = 0

/turf/open/lava/plasma/ice_moon
	baseturfs = /turf/open/lava/plasma/ice_moon
	initial_gas = ICEMOON_DEFAULT_ATMOS

/turf/open/misc/asteroid/snow/ice
	name = "icy snow"
	desc = "Looks colder."
	baseturfs = /turf/open/misc/asteroid/snow/ice
	floor_variance = 0
	icon_state = "snow-ice"
	base_icon_state = "snow-ice"
	footstep = FOOTSTEP_FLOOR
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_HARD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY

/turf/open/misc/asteroid/snow/ice/break_tile()
	return

/turf/open/misc/asteroid/snow/ice/icemoon
	baseturfs = /turf/open/misc/asteroid/snow/ice/icemoon

	slowdown = 0

/turf/open/misc/asteroid/snow/ice/burn_tile()
	return FALSE

/turf/open/misc/asteroid/snow/airless
	initial_gas = AIRLESS_ATMOS

/turf/open/misc/asteroid/snow/temperatre
	temperature = 255.37

//Used in SnowCabin.dm
/turf/open/misc/asteroid/snow/snow_cabin
	temperature = 180

/turf/open/misc/asteroid/snow/atmosphere
	temperature = 180


/turf/open/misc/asteroid/snow/standard_air
	initial_gas = OPENTURF_DEFAULT_ATMOS
	temperature = T0C

