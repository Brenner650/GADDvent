class CfgInteractionMenus
{
	class GADDvent
	{
		targetType = 2;
		target = "Exile_Trader_Office";

		class Actions 
		{	
			class GADDvent: ExileAbstractAction
			{
				title = "<t color='#01c415'>Open my GADDvent Calendar!</t>";
				condition = "true";
				action = "call GADDvent_ClaimGift";
			};
		};
	};
};