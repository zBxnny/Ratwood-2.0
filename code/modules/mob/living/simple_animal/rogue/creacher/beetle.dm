/mob/living/simple_animal/hostile/retaliate/rogue/beetle
	name = "giant beetle"
	desc = "A massive beetle covered in thick, woolly fur-like bristles. These gentle giants often travel up from the underdeep in search of food, particularly sweet mushrooms and fungi."
	icon = 'icons/roguetown/mob/monster/beetle.dmi'
	icon_state = "beetle"
	icon_living = "beetle"
	icon_dead = "beetle_dead"
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	emote_see = list("clicks its mandibles.", "scratches at the ground.", "twitches its antennae.")
	speak_chance = 1
	turns_per_move = 6
	see_in_dark = 10
	move_to_delay = 1
	butcher_results = list(
		/obj/item/reagent_containers/food/snacks/rogue/meat = 4,
		/obj/item/natural/hide = 3,
		/obj/item/natural/fur = 2, // woolly fur
		/obj/item/natural/bundle/bone/full = 1,
		/obj/item/alch/sinew = 2,
		/obj/item/alch/viscera = 2
	)
	base_intents = list(/datum/intent/simple/headbutt)
	health = 300
	maxHealth = 300
	food_type = list(
		/obj/item/reagent_containers/food/snacks/grown/apple,
		/obj/item/reagent_containers/food/snacks/grown/berries,
	)
	tame_chance = 20
	bonus_tame_chance = 15
	footstep_type = FOOTSTEP_MOB_SHOE
	pooptype = null
	faction = list("beetles")
	attack_verb_continuous = "headbutts"
	attack_verb_simple = "headbutt"
	melee_damage_lower = 20
	melee_damage_upper = 35
	retreat_distance = 3
	minimum_distance = 0
	milkies = FALSE
	STASPD = 10 // slow but steady
	STACON = 15 // very hardy
	STASTR = 14 // strong
	STAWIL = 8
	pixel_x = -8
	pixel_y = 0
	can_buckle = TRUE
	buckle_lying = 0
	can_saddle = TRUE
	max_buckled_mobs = 1
	aggressive = FALSE // peaceful unless provoked
	remains_type = /obj/effect/decal/remains/beetle
	pass_flags = PASSTABLE
	mob_size = MOB_SIZE_LARGE

/mob/living/simple_animal/hostile/retaliate/rogue/beetle/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_CRITICAL_RESISTANCE, TRAIT_GENERIC) // thick chitin armor

/mob/living/simple_animal/hostile/retaliate/rogue/beetle/update_icon()
	cut_overlays()
	..()
	if(stat != DEAD)
		if(ssaddle)
			var/mutable_appearance/saddlet = mutable_appearance(icon, "saddle-above", 4.3)
			add_overlay(saddlet)
			saddlet = mutable_appearance(icon, "saddle")
			add_overlay(saddlet)

/mob/living/simple_animal/hostile/retaliate/rogue/beetle/tamed()
	..()
	deaggroprob = 30
	if(can_buckle)
		var/datum/component/riding/D = LoadComponent(/datum/component/riding)
		D.set_riding_offsets(RIDING_OFFSET_ALL, list(TEXT_NORTH = list(0, 8), TEXT_SOUTH = list(0, 8), TEXT_EAST = list(-2, 8), TEXT_WEST = list(2, 8)))
		D.set_vehicle_dir_layer(NORTH, MOB_LAYER+0.5)
		D.set_vehicle_dir_layer(SOUTH, OBJ_LAYER)
		D.set_vehicle_dir_layer(EAST, OBJ_LAYER)
		D.set_vehicle_dir_layer(WEST, OBJ_LAYER)

/mob/living/simple_animal/hostile/retaliate/rogue/beetle/get_sound(input)
	switch(input)
		if("aggro")
			return pick('sound/vo/mobs/beetle/aggro1.ogg','sound/vo/mobs/beetle/aggro2.ogg') // Placeholder sounds
		if("pain")
			return pick('sound/vo/mobs/beetle/pain1.ogg')
		if("death")
			return pick('sound/vo/mobs/beetle/death1.ogg')
		if("idle")
			return pick('sound/vo/mobs/beetle/idle1.ogg','sound/vo/mobs/beetle/idle2.ogg')

/mob/living/simple_animal/hostile/retaliate/rogue/beetle/tame
	tame = TRUE

/mob/living/simple_animal/hostile/retaliate/rogue/beetle/tame/saddled/Initialize(mapload)
	. = ..(mapload)
	var/obj/item/natural/saddle/S = new(src)
	ssaddle = S
	update_icon()

// Remains
/obj/effect/decal/remains/beetle
	name = "beetle remains"
	gender = PLURAL
	icon_state = "beetle_remains" // Placeholder
	icon = 'icons/roguetown/mob/monster/beetle.dmi'

// Beetle meat
/obj/item/reagent_containers/food/snacks/rogue/meat/steak/beetle
	name = "beetle meat"
	desc = "Rich, protein-dense meat from a giant beetle. Considered a delicacy in some underground settlements."
	icon_state = "meatcut"
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/meat/steak/beetle/cooked
	slice_path = /obj/item/reagent_containers/food/snacks/rogue/meat/mince/beef
	slices_num = 2

/obj/item/reagent_containers/food/snacks/rogue/meat/steak/beetle/cooked
	name = "cooked beetle meat"
	desc = "Cooked beetle meat has a nutty, earthy flavor."
	icon_state = "meatcutcooked"
	cooked_type = null
	slices_num = 0
	slice_path = null
