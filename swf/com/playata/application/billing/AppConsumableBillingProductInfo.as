package com.playata.application.billing
{
   import com.playata.application.data.AppDateTime;
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.constants.CItemSetTemplate;
   import com.playata.application.data.constants.CItemSetTemplateBonus;
   import com.playata.application.data.constants.CItemTemplate;
   import com.playata.application.data.item.ItemSet;
   import com.playata.application.data.user.User;
   import com.playata.application.platform.ServerInfo;
   import com.playata.framework.application.Environment;
   import com.playata.framework.billing.ConsumableBillingProductInfo;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.util.DateTime;
   import com.playata.framework.core.util.StringUtil;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.localization.LocText;
   
   public class AppConsumableBillingProductInfo extends ConsumableBillingProductInfo
   {
      
      private static var _checkBuyable:Boolean = true;
       
      
      private var _minLevel:int = 0;
      
      private var _category:String = null;
      
      private var _itemIdentifiers:Vector.<String> = null;
      
      private var _availableViaVoucher:Boolean = true;
      
      private var _displayItemImage:String = null;
      
      private var _displayBackgroundImage:String = null;
      
      private var _slotName:String = null;
      
      public function AppConsumableBillingProductInfo(param1:TypedObject)
      {
         super(param1);
         var _loc3_:TypedObject = param1.getTypedObject("display_info");
         _slotName = _loc3_.getString("slot_name");
         _minLevel = _loc3_.getInt("min_level");
         _category = _loc3_.getString("category");
         _itemIdentifiers = _loc3_.getStringVector("item_identifiers");
         _availableViaVoucher = _loc3_.getBoolean("available_via_voucher");
         var _loc2_:TypedObject = _loc3_.getTypedObject("display");
         _displayItemImage = _loc2_.getString("item");
         _displayBackgroundImage = _loc2_.getString("background");
      }
      
      public static function set checkBuyable(param1:Boolean) : void
      {
         _checkBuyable = param1;
      }
      
      public function get category() : String
      {
         return _category;
      }
      
      public function get itemIdentifiers() : Vector.<String>
      {
         return _itemIdentifiers;
      }
      
      public function get itemSetIdentifier() : String
      {
         var _loc1_:* = null;
         var _loc4_:int = 0;
         var _loc3_:* = itemIdentifiers;
         for each(var _loc2_ in itemIdentifiers)
         {
            _loc1_ = CItemTemplate.fromId(_loc2_);
            if(_loc1_.itemSetIdentifier)
            {
               return _loc1_.itemSetIdentifier;
            }
         }
         return null;
      }
      
      public function getItemIdentifierForSlot(param1:int) : String
      {
         var _loc4_:int = 0;
         var _loc3_:* = itemIdentifiers;
         for each(var _loc2_ in itemIdentifiers)
         {
            if(CItemTemplate.fromId(_loc2_).type == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      override public function get description() : String
      {
         var _loc8_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         if(isBuyable)
         {
         }
         var _loc1_:String = super.description;
         if(itemSetIdentifier)
         {
            _loc8_ = new ItemSet(itemSetIdentifier);
            _loc2_ = _loc8_.name + " (" + LocText.current.text("general/item_set_parts",_loc8_.itemCount) + ")\n";
            _loc3_ = CItemSetTemplate.fromId(_loc8_.identifier);
            var _loc10_:int = 0;
            var _loc9_:* = _loc3_.bonusIds;
            for each(var _loc4_ in _loc3_.bonusIds)
            {
               _loc5_ = _loc3_.getBonus(_loc4_);
               _loc2_ = _loc2_ + "- ";
               _loc2_ = _loc2_ + LocText.current.text("general/item_set_parts",_loc4_);
               _loc2_ = _loc2_ + ": ";
               _loc2_ = _loc2_ + LocText.current.text("general/item_set_value",Math.round(_loc5_.value * 100),GameUtil.getStatName(_loc5_.type));
               _loc2_ = _loc2_ + "\n";
            }
            _loc1_ = _loc1_ + ("\n\n" + _loc2_);
         }
         if(availableTimeStart && availableTimeEnd)
         {
            _loc6_ = availableTimeStart.format(AppDateTime.dateFormat,Environment.info.defaultLocale);
            _loc7_ = availableTimeEnd.format(AppDateTime.dateFormat,Environment.info.defaultLocale);
            _loc1_ = StringUtil.replace(_loc1_,"<date_start>",_loc6_);
            _loc1_ = StringUtil.replace(_loc1_,"<date_end>",_loc7_);
            if(limit && limit < 999)
            {
               if(_loc6_ == _loc7_)
               {
                  _loc1_ = _loc1_ + ("\n\n" + LocText.current.text("payment/item_offer/limited_today",limit,_loc6_));
               }
               else
               {
                  _loc1_ = _loc1_ + ("\n\n" + LocText.current.text("payment/item_offer/limited_date_range",limit,_loc6_,_loc7_));
               }
            }
            else if(_loc6_ == _loc7_)
            {
               _loc1_ = _loc1_ + ("\n\n" + LocText.current.text("payment/item_offer/unlimited_today",_loc6_));
            }
            else
            {
               _loc1_ = _loc1_ + ("\n\n" + LocText.current.text("payment/item_offer/unlimited_date_range",_loc6_,_loc7_));
            }
         }
         else if(limit && limit < 999)
         {
            _loc1_ = _loc1_ + ("\n\n" + LocText.current.text("payment/item_offer/limited_without_date",limit));
         }
         if(minLevel > 0)
         {
            _loc1_ = _loc1_ + ("\n\n" + LocText.current.text("payment/item_offer/min_required_level_info",minLevel));
         }
         return _loc1_;
      }
      
      public function get minLevel() : int
      {
         return _minLevel;
      }
      
      public function get canBeBoughtAsVoucher() : Boolean
      {
         return _availableViaVoucher;
      }
      
      public function get itemImage() : String
      {
         var _loc1_:String = _displayItemImage;
         _loc1_ = _loc1_.replace("<gender>",User.current.character.gender);
         return ServerInfo.assetURL("item_offers/" + _loc1_,null);
      }
      
      public function get backgroundImage() : String
      {
         return ServerInfo.assetURL("item_offers/" + _displayBackgroundImage,null);
      }
      
      public function isAvailable(param1:int) : Boolean
      {
         if(availableTimeStart)
         {
            if(availableTimeStart.timestamp > TimeUtil.now)
            {
               return false;
            }
         }
         if(availableTimeEnd)
         {
            if(availableTimeEnd.timestamp < TimeUtil.now)
            {
               return false;
            }
         }
         if(minLevel > param1)
         {
            return false;
         }
         return true;
      }
      
      public function get isBuyable() : Boolean
      {
         if(!_checkBuyable)
         {
            return true;
         }
         return true;
      }
      
      public function get slotName() : String
      {
         return _slotName;
      }
   }
}
