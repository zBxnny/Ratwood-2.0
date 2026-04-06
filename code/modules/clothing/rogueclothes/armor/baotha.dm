
/obj/item/clothing/suit/roguetown/armor/plate/half/baotha
	name = "baothan cuirass"
	desc = "A mighty muscled cuirass. Powerful Baothan Magycks protect the exposed flesh that glints tantalising between plates."
	icon_state = "CHANGEME"
	body_parts_covered = CHEST|VITALS|GROIN
	max_integrity = ARMOR_INT_CHEST_PLATE_STEEL
	max_integrity = ARMOR_INT_CHEST_PLATE_ANTAG
	// max_integrity = ARMOR_INT_CHEST_PLATE_ANTAG
	// peel_threshold = 5	//-Any- weapon will require 5 peel hits to peel coverage off of this armor.

/obj/item/clothing/suit/roguetown/armor/plate/blacksteel_half_plate/baotha/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, CURSED_ITEM_TRAIT)

/obj/item/clothing/suit/roguetown/armor/plate/blacksteel_half_plate/baotha/dropped(mob/living/carbon/human/user)
	. = ..()
	if(QDELETED(src))
		return
	qdel(src)

/obj/item/clothing/under/roguetown/platelegs/baotha
	max_integrity = ARMOR_INT_LEG_ANTAG
	name = "baothan leg-plates"
	desc = "Powerful Baothan Magycks protect the exposed flesh that glints tantalising between plates."
	icon_state = "CHANGEME"
	armor = ARMOR_ASCENDANT
	body_parts_covered = LEGS|HANDS
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_SMASH, BCLASS_PICK)

/obj/item/clothing/under/roguetown/platelegs/baotha/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, CURSED_ITEM_TRAIT)
	AddComponent(/datum/component/cursed_item, TRAIT_DEPRAVED, "ARMOR")

/obj/item/clothing/under/roguetown/platelegs/baotha/dropped(mob/living/carbon/human/user)
	. = ..()
	if(QDELETED(src))
		return
	qdel(src)

/obj/item/clothing/under/roguetown/platelegs/baotha/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/item_equipped_movement_rustle, SFX_PLATE_STEP)

/obj/item/clothing/wrists/roguetown/bracers/baotha
	name = "baothan bracers"
	desc = "Gilded bracers that protect the arms and, through powerful Baothan Magic, the hands."
	body_parts_covered = ARMS|HANDS
	icon_state = "bracers"
	item_state = "bracers"
	armor = ARMOR_PLATE
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_SMASH, BCLASS_PICK)
	max_integrity = ARMOR_INT_SIDE_ANTAG



/obj/item/clothing/suit/roguetown/armor/leather/studded/baotha
	name = "baothan straps"
	desc = "Studded leather harness covering the whole body."
	// icon_state = "studleather"
	// item_state = "studleather"
	armor = ARMOR_LEATHER_STUDDED
	nodismemsleeves = TRUE
	body_parts_covered = COVERAGE_FULL
	max_integrity = ARMOR_INT_CHEST_LIGHT_MASTER
	armor_class = ARMOR_CLASS_LIGHT



/obj/item/clothing/head/roguetown/helmet/heavy/baotha
	name = "gilded visage"
	// mob_overlay_icon = 'icons/roguetown/clothing/onmob/64x64/head.dmi'
	bloody_icon = 'icons/effects/blood64.dmi'
	// desc = "All that glitters is not gold,"
	flags_inv = HIDEFACE|HIDEHAIR
	// icon_state = "matthioshelm"
	max_integrity = ARMOR_INT_HELMET_ANTAG
	worn_x_dimension = 64
	worn_y_dimension = 64
	bloody_icon = 'icons/effects/blood64.dmi'
	experimental_inhand = FALSE
	experimental_onhip = FALSE

/obj/item/clothing/head/roguetown/helmet/heavy/baotha/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/cursed_item, TRAIT_DEPRAVED, "VISAGE")
