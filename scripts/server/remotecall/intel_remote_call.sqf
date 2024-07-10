if ( !isServer ) exitWith {};

params [ "_intel_object" ];

if ( isNull _intel_object ) exitWith {};

_intel_yield = 15;
deleteVehicle _intel_object;
resources_intel = resources_intel + (floor (10 + (random _intel_yield)));

[ 1 ] remoteExec ["remote_call_intel",-2];
