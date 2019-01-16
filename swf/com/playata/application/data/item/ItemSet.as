package com.playata.application.data.item
{
   import com.playata.application.AppConfig;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.constants.CItemSetTemplate;
   import com.playata.application.data.constants.CItemSetTemplateBonus;
   import com.playata.application.data.user.User;
   import com.playata.framework.core.collection.IntMap;
   import com.playata.framework.localization.LocText;
   
   public class ItemSet
   {
       
      
      private var _identifier:String = null;
      
      private var _character:Character = null;
      
      public function ItemSet(param1:String, param2:Character = null)
      {
         super();
         _identifier = param1;
         _character = param2;
      }
      
      public static function getStatValue(param1:int, param2:Number, param3:Character = null) : int
      {
         if(AppConfig.itemsetsEnabled != true)
         {
            return 0;
         }
         if(!param3)
         {
            param3 = User.current.character;
         }
         switch(int(param1) - 1)
         {
            case 0:
               return Math.ceil(param3.statBaseStamina * param2);
            case 1:
               return Math.ceil(param3.statBaseStrength * param2);
            case 2:
               return Math.ceil(param3.statBaseCriticalRating * param2);
            case 3:
               return Math.ceil(param3.statBaseDodgeRating * param2);
         }
      }
      
      public static function getStatValueDiff(param1:Item, param2:Item) : IntMap
      {
         var _loc4_:int = 0;
         var _loc6_:* = null;
         var _loc5_:* = null;
         var _loc10_:int = 0;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc8_:IntMap = new IntMap();
         if(param1 == null || param2 == null)
         {
            return _loc8_;
         }
         if(param1.characterId != User.current.character.id || param2.characterId != User.current.character.id)
         {
            return _loc8_;
         }
         var _loc9_:Character = User.current.character;
         var _loc11_:int = 0;
         if(AppConfig.itemsetsEnabled == true)
         {
            if(param1.itemSetIdentifier && param1.itemSetIdentifier != param2.itemSetIdentifier)
            {
               _loc4_ = _loc9_.getEquippedItemSetCount(param1.itemSetIdentifier);
               _loc6_ = new ItemSet(param1.itemSetIdentifier,_loc9_);
               _loc5_ = _loc6_.getBonusData(_loc4_,_loc4_ - 1);
               if(_loc5_)
               {
                  var _loc15_:int = 0;
                  var _loc14_:* = _loc5_;
                  for(var _loc7_ in _loc5_)
                  {
                     _loc11_ = ItemSet.getStatValue(_loc7_,_loc5_.getData(_loc7_),_loc9_);
                     if(!_loc8_.exists(_loc7_))
                     {
                        _loc8_.setData(_loc7_,0);
                     }
                     _loc8_.setData(_loc7_,_loc8_.getData(_loc7_) + _loc11_);
                  }
               }
            }
            if(param2.itemSetIdentifier && param1.itemSetIdentifier != param2.itemSetIdentifier)
            {
               _loc10_ = _loc9_.getEquippedItemSetCount(param2.itemSetIdentifier);
               _loc12_ = new ItemSet(param2.itemSetIdentifier,_loc9_);
               _loc13_ = _loc12_.getBonusData(_loc10_,_loc10_ + 1);
               if(_loc13_)
               {
                  var _loc17_:int = 0;
                  var _loc16_:* = _loc13_;
                  for(var _loc3_ in _loc13_)
                  {
                     _loc11_ = ItemSet.getStatValue(_loc3_,_loc13_.getData(_loc3_),_loc9_);
                     if(!_loc8_.exists(_loc3_))
                     {
                        _loc8_.setData(_loc3_,0);
                     }
                     _loc8_.setData(_loc3_,_loc8_.getData(_loc3_) + _loc11_);
                  }
               }
            }
         }
         return _loc8_;
      }
      
      public function get character() : Character
      {
         if(!_character)
         {
            return User.current.character;
         }
         return _character;
      }
      
      public function get identifier() : String
      {
         return _identifier;
      }
      
      public function get name() : String
      {
         return LocText.current.text("item_set/" + _identifier + "/name");
      }
      
      public function get itemCount() : int
      {
         return CItemSetTemplate.fromId(_identifier).itemCount;
      }
      
      public function get equippedItemCount() : int
      {
         if(AppConfig.itemsetsEnabled != true)
         {
            return 0;
         }
         return character.getEquippedItemSetCount(identifier);
      }
      
      public function get characterBonusData() : IntMap
      {
         if(AppConfig.itemsetsEnabled != true)
         {
            return new IntMap();
         }
         return getBonusData(this.equippedItemCount);
      }
      
      public function getBonusData(param1:int, param2:int = -1) : IntMap
      {
         var _loc8_:* = null;
         var _loc5_:* = null;
         var _loc9_:* = null;
         if(AppConfig.itemsetsEnabled != true)
         {
            return new IntMap();
         }
         var _loc13_:* = param1;
         var _loc10_:IntMap = new IntMap();
         if(_loc13_ <= 0 && param2 <= 0)
         {
            return _loc10_;
         }
         var _loc3_:CItemSetTemplate = CItemSetTemplate.fromId(_identifier);
         var _loc6_:CItemSetTemplateBonus = null;
         var _loc12_:int = 0;
         var _loc11_:* = 0;
         var _loc15_:int = 0;
         var _loc14_:* = _loc3_.bonusIds;
         for each(var _loc7_ in _loc3_.bonusIds)
         {
            _loc6_ = _loc3_.getBonus(_loc7_);
            if(_loc7_ <= _loc13_)
            {
               _loc12_ = _loc6_.type;
               _loc11_ = Number(_loc6_.value);
               if(!_loc10_.exists(_loc12_))
               {
                  _loc10_.setData(_loc12_,0);
               }
               _loc10_.setData(_loc12_,_loc10_.getData(_loc12_) + _loc11_);
            }
         }
         if(param2 != -1)
         {
            _loc13_ = param2;
            _loc8_ = new IntMap();
            var _loc17_:int = 0;
            var _loc16_:* = _loc3_.bonusIds;
            for each(_loc7_ in _loc3_.bonusIds)
            {
               _loc6_ = _loc3_.getBonus(_loc7_);
               _loc12_ = _loc6_.type;
               _loc11_ = Number(_loc6_.value);
               if(_loc7_ <= _loc13_)
               {
                  if(!_loc8_.exists(_loc12_))
                  {
                     _loc8_.setData(_loc12_,0);
                  }
                  _loc8_.setData(_loc12_,_loc8_.getData(_loc12_) + _loc11_);
               }
            }
            _loc5_ = new IntMap();
            _loc9_ = _loc10_;
            if(_loc8_.length > _loc10_.length)
            {
               _loc9_ = _loc8_;
            }
            var _loc19_:int = 0;
            var _loc18_:* = _loc9_;
            for(var _loc4_ in _loc9_)
            {
               if(_loc8_.exists(_loc4_) && _loc10_.exists(_loc4_))
               {
                  _loc5_.setData(_loc4_,_loc8_.getData(_loc4_) - _loc10_.getData(_loc4_));
               }
               else if(_loc8_.exists(_loc4_))
               {
                  _loc5_.setData(_loc4_,_loc8_.getData(_loc4_));
               }
               else
               {
                  _loc5_.setData(_loc4_,0 - _loc10_.getData(_loc4_));
               }
            }
            return _loc5_;
         }
         return _loc10_;
      }
   }
}
