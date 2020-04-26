package com.playata.application.data.battle
{
   import com.playata.application.data.AppDateTime;
   import com.playata.application.data.dataobject.DOBattle;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.logging.Logger;
   import com.playata.framework.core.util.JsonUtil;
   
   public class Battle extends DOBattle
   {
       
      
      private var _battleRounds:Vector.<CharacterBattleRound> = null;
      
      private var _profileAAppearance:TypedObject = null;
      
      private var _profileBAppearance:TypedObject = null;
      
      public function Battle(param1:DOBattle)
      {
         super(param1);
      }
      
      public function get dateTime() : String
      {
         return AppDateTime.getPassedShortFormattedTimestamp(tsCreation);
      }
      
      public function get isClose() : Boolean
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(winner == "a")
         {
            _loc1_ = profileAEndHitPoints;
            _loc2_ = profileAHitPoints;
         }
         else
         {
            _loc1_ = profileBEndHitPoints;
            _loc2_ = profileBHitPoints;
         }
         var _loc3_:Number = _loc1_ / _loc2_;
         return _loc3_ < 0.15;
      }
      
      public function get profileA() : TypedObject
      {
         return getTypedObjectFromJson("profile_a_stats");
      }
      
      public function get profileB() : TypedObject
      {
         return getTypedObjectFromJson("profile_b_stats");
      }
      
      public function get profileAHitPoints() : int
      {
         return profileA.getInt("hitpoints");
      }
      
      public function get profileBHitPoints() : int
      {
         return profileB.getInt("hitpoints");
      }
      
      public function get profileATotalDamage() : int
      {
         var _loc1_:int = 0;
         var _loc4_:int = 0;
         var _loc3_:* = battleRounds;
         for each(var _loc2_ in battleRounds)
         {
            if(_loc2_.attackerA)
            {
               _loc1_ = _loc1_ + (_loc2_.damage + _loc2_.dotDamage);
            }
            else
            {
               _loc1_ = _loc1_ + _loc2_.backfireDamage;
            }
         }
         return _loc1_;
      }
      
      public function get profileBTotalDamage() : int
      {
         var _loc1_:int = 0;
         var _loc4_:int = 0;
         var _loc3_:* = battleRounds;
         for each(var _loc2_ in battleRounds)
         {
            if(_loc2_.attackerB)
            {
               _loc1_ = _loc1_ + (_loc2_.damage + _loc2_.dotDamage);
            }
            else
            {
               _loc1_ = _loc1_ + _loc2_.backfireDamage;
            }
         }
         return _loc1_;
      }
      
      public function get profileAEndHitPoints() : int
      {
         return profileAHitPoints - profileBTotalDamage;
      }
      
      public function get profileBEndHitPoints() : int
      {
         return profileBHitPoints - profileATotalDamage;
      }
      
      public function get profileAIsWinner() : Boolean
      {
         return winner == "a";
      }
      
      public function get profileAAppearance() : TypedObject
      {
         if(_profileAAppearance != null)
         {
            return _profileAAppearance;
         }
         calculateRounds();
         return _profileAAppearance;
      }
      
      public function get profileBAppearance() : TypedObject
      {
         if(_profileBAppearance != null)
         {
            return _profileBAppearance;
         }
         calculateRounds();
         return _profileBAppearance;
      }
      
      public function get profileABattleEffects() : Object
      {
         if(profileAAppearance == null || !profileAAppearance.hasData("effects"))
         {
            return {};
         }
         return profileAAppearance.getData("effects");
      }
      
      public function get profileBBattleEffects() : Object
      {
         if(profileBAppearance == null || !profileBAppearance.hasData("effects"))
         {
            return {};
         }
         return profileBAppearance.getData("effects");
      }
      
      public function get opticalChanges() : Vector.<int>
      {
         if(profileB.hasData("oc",true))
         {
            return profileB.getIntVector("oc");
         }
         return null;
      }
      
      public function get battleRounds() : Vector.<CharacterBattleRound>
      {
         if(_battleRounds != null)
         {
            return _battleRounds;
         }
         calculateRounds();
         return _battleRounds;
      }
      
      private function calculateRounds() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(_battleRounds == null)
         {
            _battleRounds = new Vector.<CharacterBattleRound>();
            _loc2_ = rounds;
            if(_loc2_ != "")
            {
               try
               {
                  _loc3_ = new TypedObject(JsonUtil.decode(_loc2_));
                  if(_loc3_.hasData("rounds"))
                  {
                     if(_loc3_.hasData("profile_a_appearance"))
                     {
                        _profileAAppearance = _loc3_.getTypedObject("profile_a_appearance");
                     }
                     if(_loc3_.hasData("profile_b_appearance"))
                     {
                        _profileBAppearance = _loc3_.getTypedObject("profile_b_appearance");
                     }
                     _loc3_ = _loc3_.getTypedObject("rounds");
                  }
                  var _loc7_:int = 0;
                  var _loc6_:* = _loc3_.rawData;
                  for each(var _loc1_ in _loc3_.rawData)
                  {
                     _loc4_ = new CharacterBattleRound(_loc1_);
                     _battleRounds.push(_loc4_);
                  }
                  return;
               }
               catch(e:Error)
               {
                  Logger.debug("[Battle] Exception: \'" + e.message + "\'");
                  Logger.debug("[Battle] JSON: \'" + _loc2_ + "\'");
                  return;
               }
            }
         }
      }
   }
}
