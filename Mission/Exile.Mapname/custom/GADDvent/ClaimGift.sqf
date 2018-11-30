/** 
	GADDvent Calendar by [GADD]Monkeynutz
**/

_uid = getPlayerUID player; 
_dayOfXmas = ExileServerStartTime select 2;
_pinRandom = (1000 +(round (random 8999)));
_pin = format ["%1", _pinRandom];

if (isNil "GADDventNumber") then
{
	["getGADDventNumber", [_uid]] call ExileClient_system_network_send;
};

_giftList = [];

if (_dayOfXmas == 25) then	// Set the gift selections for Christmas Day here.
{
	_giftList = [
	"srifle_LRR_tna_F",
	"O_T_APC_Tracked_02_cannon_ghex_F",         //Kamysh
	"I_APC_Tracked_03_cannon_F",                //Mora tank APC gun
	"I_APC_Wheeled_03_cannon_F",				//Gorgon
	"B_APC_Wheeled_01_cannon_F",                //Marshall
	"srifle_GM6_ghex_F",
	"srifle_GM6_camo_F",
	"srifle_GM6_F",
	"srifle_LRR_camo_F",
	"srifle_LRR_F",
	"Exile_Item_RubberDuck"
	];
}
else						// Set the gift selection for the other days of the month here.
{
	_giftList = [
	"Exile_Car_Ifrit",
	"Exile_Car_Hunter",
	"Exile_Car_Strider",
	"Exile_Item_Instadoc",
	"Exile_Weapon_RPK",
	"Exile_Weapon_PK",
	"Exile_Weapon_PKP",
	"Exile_Item_RubberDuck"
	];
};

_sound = selectRandom [		// Music Array
	"weWishYouAMerryXmas",
	"AllIWantForXmas",
	"Fairytale",
	"HappyXmas",
	"JingleBellRock",
	"JingleBells",
	"LetItSnow",
	"LookLikeXmas",
	"Rudolph"
];

_daysNotAllowed = [26,27,28,29,30,31];

if (GADDventOpening) exitWith
{
	["ErrorTitleAndText", ["GADDvent Calendar", "You can only open one at a time! Stop spamming!"]] call ExileClient_gui_toaster_addTemplateToast;
};

GADDventOpening = true;

if !(ExileServerStartTime select 1 == 12) exitWith
{
	["ErrorTitleAndText", ["GADDvent Calendar", "It's not even December yet, you scrub!"]] call ExileClient_gui_toaster_addTemplateToast;
	GADDventOpening = false;
};

if (_dayOfXmas in _daysNotAllowed) exitWith
{
	["ErrorTitleAndText", ["GADDvent Calendar", "It's no longer GADDvent! We hope you had a great Christmas! And have a Happy New Year!"]] call ExileClient_gui_toaster_addTemplateToast;
	GADDventOpening = false;
};

_selectedGift = selectRandom _giftList;

_cfgClass = _selectedGift call ExileClient_util_gear_getConfigNameByClassName;
_isVehicle = false;
if (_cfgClass == "CfgVehicles") then
{
	_isVehicle = true;
}
else
{
	_isVehicle = false;
};

if (_dayOfXmas == GADDventNumber) exitWith 
{
	["ErrorTitleAndText", ["GADDvent Calendar", "You have already claimed your GADDvent gift today! Open your next one Tomorrow!"]]	call ExileClient_gui_toaster_addTemplateToast;
	GADDventOpening = false;
};

["InfoTitleAndText", ["GADDvent Calendar", "Opening Gift for today! Stand by!"]] call ExileClient_gui_toaster_addTemplateToast;

uiSleep 3;

_GADDventNumber = GADDventNumber;

if (_GADDventNumber > _dayOfXmas) exitWith
{
	["ErrorTitleAndText", ["GADDvent Calendar", "You seem to have opened too many gifts! Contact an Admin!"]] call ExileClient_gui_toaster_addTemplateToast;
	GADDventOpening = false;
};

if (_dayOfXmas == _GADDventNumber) exitWith
{
	["ErrorTitleAndText", ["GADDvent Calendar", "You have already claimed your GADDvent gift today! Open your next one Tomorrow!"]] call ExileClient_gui_toaster_addTemplateToast;
	GADDventOpening = false;
};

if (_GADDventNumber < _dayOfXmas) then
{
	if (_isVehicle) then
	{
		["spawnGADDventVehicleRequest", [_selectedGift,_pin]] call ExileClient_system_network_send;
		["SuccessTitleAndText", ["GADDvent Calendar", format ["You have claimed your GADDvent gift for Today! Come back again tomorrow to claim another! Enjoy the ride! PIN: %1", _pin]]] call ExileClient_gui_toaster_addTemplateToast;
	}
	else
	{
		unitBackpack player addItemCargoGlobal [_selectedGift, 1];
		["SuccessTitleAndText", ["GADDvent Calendar", "You just claimed a GADDvent Gift! Check your Backpack! Come back again tomorrow to claim your next gift!"]] call ExileClient_gui_toaster_addTemplateToast;
	};
};

playSound _sound;
_newGADDventNumber = _dayOfXmas;
GADDventNumber = _newGADDventNumber;
["updateGADDventNumber", [_newGADDventNumber ,_uid]] call ExileClient_system_network_send;
GADDventOpening = false;