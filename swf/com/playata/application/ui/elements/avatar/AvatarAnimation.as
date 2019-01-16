package com.playata.application.ui.elements.avatar
{
   import com.playata.application.data.character.AppearanceSettings;
   import com.playata.application.data.constants.CItemTemplate;
   import com.playata.application.data.item.Item;
   import com.playata.application.platform.ServerInfo;
   import com.playata.application.ui.elements.item.SpineItemAnimationEffects;
   import com.playata.framework.display.IUriSprite;
   import com.playata.framework.display.SpineDisplayObject;
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.UriSprite;
   
   public class AvatarAnimation extends Sprite
   {
      
      private static var _enableAnimations:Boolean = true;
      
      private static var _avatarAnimations:Vector.<AvatarAnimation> = new Vector.<AvatarAnimation>();
       
      
      private var _behindAvatarAnimation:Sprite = null;
      
      private var _infrontAvatarAnimation:Sprite = null;
      
      private var _settingsHash:String = null;
      
      private var _currentSettings:AppearanceSettings = null;
      
      private var _isMale:Boolean;
      
      private var _frontAnimations:Vector.<SpineDisplayObject>;
      
      private var _backAnimations:Vector.<SpineDisplayObject>;
      
      public function AvatarAnimation(param1:Sprite, param2:Sprite)
      {
         _frontAnimations = new Vector.<SpineDisplayObject>();
         _backAnimations = new Vector.<SpineDisplayObject>();
         super();
         _behindAvatarAnimation = param1;
         _infrontAvatarAnimation = param2;
         _behindAvatarAnimation.removeAllChildren(true);
         _infrontAvatarAnimation.removeAllChildren(true);
         _avatarAnimations.push(this);
      }
      
      public static function get enableAnimations() : Boolean
      {
         return _enableAnimations;
      }
      
      public static function set enableAnimations(param1:Boolean) : void
      {
         if(_enableAnimations == param1)
         {
            return;
         }
         _enableAnimations = param1;
         var _loc4_:int = 0;
         var _loc3_:* = _avatarAnimations;
         for each(var _loc2_ in _avatarAnimations)
         {
            if(!_enableAnimations)
            {
               _loc2_.stopAnimation();
            }
            else
            {
               _loc2_.startAnimation();
            }
         }
      }
      
      override public function dispose() : void
      {
         removeSpine();
         _backAnimations = null;
         _frontAnimations = null;
         _behindAvatarAnimation = null;
         _infrontAvatarAnimation = null;
         _avatarAnimations.splice(_avatarAnimations.indexOf(this),1);
      }
      
      private function removeSpine() : void
      {
         if(_backAnimations.length > 0 || _frontAnimations.length > 0)
         {
            _behindAvatarAnimation.removeAllChildren(false);
            _infrontAvatarAnimation.removeAllChildren(false);
         }
         else
         {
            _behindAvatarAnimation.removeAllChildren(true);
            _infrontAvatarAnimation.removeAllChildren(true);
         }
         var _loc3_:int = 0;
         var _loc2_:* = _backAnimations;
         for each(var _loc1_ in _backAnimations)
         {
            _loc1_.dispose();
         }
         _backAnimations.length = 0;
         var _loc5_:int = 0;
         var _loc4_:* = _frontAnimations;
         for each(_loc1_ in _frontAnimations)
         {
            _loc1_.dispose();
         }
         _frontAnimations.length = 0;
         _settingsHash = null;
      }
      
      public function stopAnimation() : void
      {
         removeSpine();
      }
      
      public function startAnimation() : void
      {
         update(_currentSettings);
      }
      
      public function update(param1:AppearanceSettings) : void
      {
         if(!param1)
         {
            return;
         }
         var _loc2_:String = param1.asJsonString;
         if(_loc2_ == _settingsHash)
         {
            return;
         }
         removeSpine();
         _settingsHash = _loc2_;
         _currentSettings = param1;
         _isMale = _currentSettings.gender == "m";
         setEquipment(4,_currentSettings);
         setEquipment(2,_currentSettings);
         setEquipment(1,_currentSettings);
         setEquipment(3,_currentSettings);
         setEquipment(5,_currentSettings);
      }
      
      private function getHasAnimation(param1:String) : Boolean
      {
         if(param1 != null)
         {
            return Item.getHasAnimation(param1);
         }
         return false;
      }
      
      private function isAnimationInFront(param1:String) : Boolean
      {
         if(param1 != null)
         {
            return !Item.getAnimation(param1).backAnimation;
         }
         return false;
      }
      
      private function getSpineIdentifier(param1:String) : String
      {
         if(param1 != null)
         {
            return Item.getAnimation(param1).spine;
         }
         return null;
      }
      
      private function getItemType(param1:String) : int
      {
         if(param1 != null)
         {
            return CItemTemplate.fromId(param1).type;
         }
         return 0;
      }
      
      private function setEquipment(param1:int, param2:AppearanceSettings) : void
      {
         var _loc6_:* = null;
         var _loc5_:* = null;
         var _loc3_:String = null;
         var _loc4_:Boolean = false;
         switch(int(param1) - 1)
         {
            case 0:
               _loc3_ = "head";
               if(param2.hasData("show_head_item") && param2.show_head_item == false)
               {
                  param2.setData(_loc3_,null);
               }
               break;
            case 1:
               _loc3_ = "chest";
               if(param2.hasData("show_chest_item") && param2.show_chest_item == false)
               {
                  param2.setData(_loc3_,null);
               }
               break;
            case 2:
               _loc3_ = "belt";
               if(param2.hasData("show_belt_item") && param2.show_belt_item == false)
               {
                  param2.setData(_loc3_,null);
               }
               break;
            case 3:
               _loc3_ = "legs";
               if(param2.hasData("show_legs_item") && param2.show_legs_item == false)
               {
                  param2.setData(_loc3_,null);
               }
               break;
            case 4:
               _loc3_ = "boots";
               if(param2.hasData("show_boots_item") && param2.show_boots_item == false)
               {
                  param2.setData(_loc3_,null);
                  break;
               }
         }
         var _loc7_:String = param2.getString(_loc3_);
         if(_loc7_)
         {
            _loc4_ = getHasAnimation(_loc7_);
         }
         if(_loc4_)
         {
            if(enableAnimations)
            {
               _loc6_ = new SpineItemAnimationEffects(getSpineIdentifier(_loc7_),getItemType(_loc7_),_isMale);
               _loc6_.play();
               if(isAnimationInFront(_loc7_))
               {
                  _infrontAvatarAnimation.addChild(_loc6_);
                  _frontAnimations.push(_loc6_);
               }
               else
               {
                  _behindAvatarAnimation.addChild(_loc6_);
                  _backAnimations.push(_loc6_);
               }
            }
            else
            {
               _loc5_ = UriSprite.load(ServerInfo.assetURL("item_effects/" + SpineItemAnimationEffects.getAnimationIdentifier(getSpineIdentifier(_loc7_),getItemType(_loc7_),_isMale),"png"),424,900,false,-1);
               if(isAnimationInFront(_loc7_))
               {
                  _infrontAvatarAnimation.addChild(_loc5_);
               }
               else
               {
                  _behindAvatarAnimation.addChild(_loc5_);
               }
            }
         }
      }
   }
}
