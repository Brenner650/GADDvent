private["_vehicleNetID", "_vehicleObject"];
_vehicleNetID = _this select 1;
_vehicleObject = objectFromNetId _vehicleNetID;
player moveInDriver _vehicleObject;