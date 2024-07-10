if ( isNil "GRLIB_arsenal_weapons" ) then { GRLIB_arsenal_weapons = [] };
if ( count GRLIB_arsenal_weapons == 0 ) then {
	[ missionNamespace, true ] call BIS_fnc_addVirtualWeaponCargo;
} else {
	[ missionNamespace, GRLIB_arsenal_weapons ] call BIS_fnc_addVirtualWeaponCargo;
};

if ( isNil "GRLIB_arsenal_magazines" ) then { GRLIB_arsenal_magazines = [] };
if ( count GRLIB_arsenal_magazines == 0 ) then {
	[ missionNamespace, true ] call BIS_fnc_addVirtualMagazineCargo;
} else {
	[ missionNamespace, GRLIB_arsenal_magazines ] call BIS_fnc_addVirtualMagazineCargo;
};

if ( isNil "GRLIB_arsenal_items" ) then { GRLIB_arsenal_items = [] };
if ( count GRLIB_arsenal_items == 0 ) then {
	[ missionNamespace, true ] call BIS_fnc_addVirtualItemCargo;
} else {
	[ missionNamespace, GRLIB_arsenal_items ] call BIS_fnc_addVirtualItemCargo;
};
