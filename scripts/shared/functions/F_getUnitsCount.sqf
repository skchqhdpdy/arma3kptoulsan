params [ "_position", "_distance", "_side" ];
private [ "_infantrycount", "_countedvehicles", "_vehiclecrewcount" ];

_infantrycount = _side countSide ( ( _position nearEntities [ "Man", _distance]) select { !(captive _x) && ((getpos _x) select 2 < 100) } );
_countedvehicles =  ( _position nearEntities [ ["Car", "Tank"], _distance] ) select { ((getpos _x) select 2 < 750) && count (crew _x) > 0 };
_vehiclecrewcount = 0;
{ _vehiclecrewcount = _vehiclecrewcount + (_side countSide (crew _x)) } foreach _countedvehicles;

(_infantrycount + _vehiclecrewcount)
