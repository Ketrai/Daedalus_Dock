/obj/item/bodypart/chest/necromorph/spitter
	name = BODY_ZONE_CHEST
	desc = "It's impolite to stare at a person's chest."
	icon_static = 'necromorphs/icons/necromorphs/spitter.dmi'
	icon_state = "chest"
	max_damage = 200
	px_x = 0
	px_y = 0
	stam_damage_coeff = 1
	max_stamina_damage = 120
	wound_resistance = 10

/obj/item/bodypart/head/necromorph/spitter
	name = BODY_ZONE_HEAD
	desc = "Didn't make sense not to live for fun, your brain gets smart but your head gets dumb."
	icon_static = 'necromorphs/icons/necromorphs/spitter.dmi'
	icon_state = "l_arm"
	max_damage = 200
	px_x = 0
	px_y = -8
	stam_damage_coeff = 1
	max_stamina_damage = 100
	wound_resistance = 5

/obj/item/bodypart/l_arm/necromorph/spitter
	name = "left blade"
	desc = "Did you know that the word 'sinister' stems originally from the \
		Latin 'sinestra' (left hand), because the left hand was supposed to \
		be possessed by the devil? This arm appears to be possessed by no \
		one though."
	icon_static = 'necromorphs/icons/necromorphs/spitter.dmi'
	icon_state = "l_arm"
	attack_verb_continuous = list("slashes", "stabs")
	attack_verb_simple = list("slash", "stab")
	max_damage = 50
	max_stamina_damage = 50
	body_damage_coeff = 0.75
	px_x = -6
	px_y = 0
	wound_resistance = 0

/obj/item/bodypart/r_arm/necromorph/spitter
	name = "right blade"
	desc = "Over 87% of humans are right handed. That figure is much lower \
		among humans missing their right arm."
	icon_static = 'necromorphs/icons/necromorphs/spitter.dmi'
	icon_state = "l_arm"
	attack_verb_continuous = list("slashes", "stabs")
	attack_verb_simple = list("slash", "stab")
	max_damage = 50
	body_damage_coeff = 0.75
	px_x = 6
	px_y = 0
	max_stamina_damage = 50
	wound_resistance = 0

/obj/item/bodypart/l_leg/necromorph/spitter
	name = "left leg"
	desc = "Some athletes prefer to tie their left shoelaces first for good \
		luck. In this instance, it probably would not have helped."
	icon_static = 'necromorphs/icons/necromorphs/spitter.dmi'
	icon_state = "l_arm"
	attack_verb_continuous = list("kicks", "stomps")
	attack_verb_simple = list("kick", "stomp")
	max_damage = 50
	body_damage_coeff = 0.75
	px_x = -2
	px_y = 12
	max_stamina_damage = 50
	wound_resistance = 0

/obj/item/bodypart/r_leg/necromorph/spitter
	name = "right leg"
	desc = "You put your right leg in, your right leg out. In, out, in, out, \
		shake it all about. And apparently then it detaches.\n\
		The hokey pokey has certainly changed a lot since space colonisation."
	icon_static = 'necromorphs/icons/necromorphs/spitter.dmi'
	icon_state = "l_arm"
	attack_verb_continuous = list("kicks", "stomps")
	attack_verb_simple = list("kick", "stomp")
	max_damage = 50
	body_damage_coeff = 0.75
	px_x = 2
	px_y = 12
	max_stamina_damage = 50
	wound_resistance = 0
