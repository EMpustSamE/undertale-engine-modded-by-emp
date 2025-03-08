// Override GetName OnUse OnInfo OnDrop(optional) to make an useful item type.
// OnDrop already has a default implementation.
function ItemType() constructor {
    _name = "";
	_name_short = "";
	_name_short_serious = "";
    _info = "";
    _price_buy = 0;
    _price_sell = 0;
    _shop_description = "";
    _use = "";
    _drop = "";
    function GetName() {
        return _name;
    }
	function GetNameShort() {
        return _name_short;
    }
	function GetNameShortSerious() {
        return _name_short_serious;
    }
	function GetPriceBuy() {
		return _price_buy;
	}
	function GetPriceSell() {
		return _price_sell;
	}
	function GetShopDescription() {
		return _shop_description;
	}

    function OnUse(inventory, index) {}
    function OnInfo(inventory, index) {}
    function OnDrop(inventory, index) {
        var rand=irandom(18);
		var sub=0;
		switch(rand){
			case 0: sub=1; break;
			case 1: sub=2; break;
			case 2: sub=3; break;
			case 3: sub=4; break;
		}
		Dialog_Add("{define `ITEM` `"+GetName()+"`}"+Lang_GetString("item.drop."+string(sub)));
        Dialog_Start();

        inventory.Remove(index);
    }
}

// ItemTypeSimple base receives a name localization key.
// It automatically sets up GetName to show the localized name "item.key.name"
// and OnInfo to show the localized dialog "item.key.info"
function ItemTypeSimple(keyId) : ItemType() constructor {
    self.nameKey=$"item.{keyId}.name";
	self.nameShortKey=$"item.{keyId}.name.short";
	self.nameShortSeriousKey=$"item.{keyId}.name.short.serious";
	self.infoTextKey=$"item.{keyId}.info";
	
	function GetName(){
		return Lang_GetString(nameKey,nameKey);
	}
	function GetNameShort(){
		return Lang_GetString(nameShortKey,nameShortKey);
	}
	function GetNameShortSerious(){
		return Lang_GetString(nameShortSeriousKey,nameShortSeriousKey);
	}
	function OnInfo(inventory,index){
		Dialog_Add(Lang_GetString(infoTextKey,infoTextKey));
		Dialog_Start();
	}
}

#macro ITEM_EMPTY ""
#macro FALLBACK_ITEM_NAME_EMPTY "!EMPTY!"
#macro FALLBACK_ITEM_NAME_UNDEFINED "!UNDEFINED!"

function ItemTypeManager() : RegisterManager() constructor {
    function GetNameOrFallback(id) {
        if (id == ITEM_EMPTY) {
            return FALLBACK_ITEM_NAME_EMPTY;
        }
        var itemType = GetOrUndefined(id);
        if (is_undefined(itemType)) {
            return FALLBACK_ITEM_NAME_UNDEFINED;
        }
        return itemType.GetName();
    }
    function IsValid(itemId) {
        return itemId != ITEM_EMPTY && Contains(itemId);
    }
    function IsEmptyOrValid(itemId) {
        return itemId == ITEM_EMPTY || Contains(itemId);
    }
}