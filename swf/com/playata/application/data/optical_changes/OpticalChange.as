package com.playata.application.data.optical_changes
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.constants.CItemEffect;
   import com.playata.application.data.constants.COpticalChange;
   import com.playata.application.data.constants.COpticalChangeEffect;
   import com.playata.application.data.dataobject.DOItem;
   import com.playata.application.data.item.Item;
   import com.playata.application.data.user.User;
   import com.playata.application.platform.ServerInfo;
   import com.playata.framework.core.util.DateTime;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.data.DataObject;
   import com.playata.framework.localization.LocText;
   
   public class OpticalChange extends DataObject
   {
       
      
      private var _id:int = 0;
      
      private var _isUnlocked:Boolean = false;
      
      private var _isUsed:Boolean = false;
      
      public function OpticalChange(param1:int, param2:COpticalChange)
      {
         _id = param1;
         super(param2);
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get identifier() : String
      {
         return getString("identifier");
      }
      
      public function get type() : int
      {
         return getInt("type");
      }
      
      public function get rarity() : int
      {
         return getInt("rarity");
      }
      
      public function get effect() : String
      {
         return getString("effect");
      }
      
      public function get event() : String
      {
         return getString("event");
      }
      
      public function get tsAvailabilityStart() : String
      {
         if(getString("ts_availability_start") == "")
         {
            return null;
         }
         return getString("ts_availability_start");
      }
      
      public function get tsAvailabilityEnd() : String
      {
         if(getString("ts_availability_end") == "")
         {
            return null;
         }
         return getString("ts_availability_end");
      }
      
      public function get iconImageUrl() : String
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(type == 101)
         {
            _loc1_ = Item.getBaseIdentifier(identifier);
            _loc2_ = "_i";
            if(GameUtil.doesItemNeedGenderSuffix(_loc1_))
            {
               _loc2_ = "_" + User.current.character.gender + _loc2_;
            }
            return ServerInfo.assetURL("items_hd/" + _loc1_ + _loc2_,"png");
         }
         return ServerInfo.assetURL("optical_changes_icons/" + identifier,"png");
      }
      
      public function get name() : String
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(type == 101)
         {
            _loc1_ = new Item(new DOItem({"identifier":identifier}));
            _loc2_ = _loc1_.name;
            _loc1_.dispose();
            return _loc2_;
         }
         return LocText.current.text("optical_change/" + identifier + "/name");
      }
      
      public function markAsUnlocked() : void
      {
         _isUnlocked = true;
      }
      
      public function markAsLocked() : void
      {
         _isUnlocked = false;
      }
      
      public function get isUnlocked() : Boolean
      {
         return _isUnlocked;
      }
      
      public function set isUsed(param1:Boolean) : void
      {
         _isUsed = param1;
      }
      
      public function get isUsed() : Boolean
      {
         return _isUsed;
      }
      
      public function isAvailable() : Boolean
      {
         if(tsAvailabilityStart != null)
         {
            if(DateTime.fromStringServer(tsAvailabilityStart).timestamp > TimeUtil.now)
            {
               return false;
            }
         }
         if(tsAvailabilityEnd != null)
         {
            if(DateTime.fromStringServer(tsAvailabilityEnd).timestamp < TimeUtil.now)
            {
               return false;
            }
         }
         return true;
      }
      
      public function get tooltip() : String
      {
         if(event == null || event == "")
         {
            return name;
         }
         return name + "\n\n" + sourceInfo;
      }
      
      public function get sourceInfo() : String
      {
         if(event == null || event == "")
         {
            return "";
         }
         return LocText.current.text("optical_change/source/" + event);
      }
      
      public function get hasEffect() : Boolean
      {
         return effect != null && effect != "";
      }
      
      public function get getEffectIconUrl() : String
      {
         if(!hasEffect)
         {
            return null;
         }
         var _loc2_:String = "";
         var _loc1_:String = "";
         if(type == 101)
         {
            if(CItemEffect.exists(effect))
            {
               _loc2_ = CItemEffect.fromId(effect).identifier;
            }
            _loc1_ = "item_effects/";
         }
         else
         {
            if(COpticalChangeEffect.exists(effect))
            {
               _loc2_ = COpticalChangeEffect.fromId(effect).spine;
            }
            _loc1_ = "optical_change_effects/";
         }
         return ServerInfo.assetURL(_loc1_ + _loc2_ + "_i","png");
      }
   }
}
