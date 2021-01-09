package com.playata.application.data.optical_changes
{
   import com.playata.application.data.constants.COpticalChange;
   import com.playata.application.data.constants.COpticalChangeEffect;
   import com.playata.application.platform.ServerInfo;
   import com.playata.framework.display.SpineDisplayObject;
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.UriSprite;
   
   public class OpticalChangeAnimation
   {
      
      private static var _enableAnimations:Boolean = true;
      
      private static var _opticalChangeAnimations:Vector.<OpticalChangeAnimation> = new Vector.<OpticalChangeAnimation>();
       
      
      private var _behindAnimationLayer:Sprite = null;
      
      private var _infrontAnimationLayer:Sprite = null;
      
      private var _currentOptions:Vector.<int> = null;
      
      private var _currentOptionsHash:String = null;
      
      private var _behindAnimations:Vector.<SpineDisplayObject>;
      
      private var _infrontAnimations:Vector.<SpineDisplayObject>;
      
      public function OpticalChangeAnimation(param1:Sprite, param2:Sprite)
      {
         _behindAnimations = new Vector.<SpineDisplayObject>();
         _infrontAnimations = new Vector.<SpineDisplayObject>();
         super();
         _behindAnimationLayer = param1;
         _infrontAnimationLayer = param2;
         _opticalChangeAnimations.push(this);
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
         var _loc3_:* = _opticalChangeAnimations;
         for each(var _loc2_ in _opticalChangeAnimations)
         {
            _loc2_.stopAnimation();
            _loc2_.startAnimation();
         }
      }
      
      public function dispose() : void
      {
         removeSpine();
         _behindAnimationLayer.dispose();
         _behindAnimationLayer = null;
         _infrontAnimationLayer.dispose();
         _infrontAnimationLayer = null;
         _infrontAnimations = null;
         _opticalChangeAnimations.splice(_opticalChangeAnimations.indexOf(this),1);
      }
      
      private function removeSpine() : void
      {
         if(_behindAnimations.length > 0 || _infrontAnimations.length > 0)
         {
            _behindAnimationLayer.removeAllChildren(false);
            _infrontAnimationLayer.removeAllChildren(false);
         }
         else
         {
            _behindAnimationLayer.removeAllChildren(true);
            _infrontAnimationLayer.removeAllChildren(true);
         }
         var _loc3_:int = 0;
         var _loc2_:* = _behindAnimations;
         for each(var _loc1_ in _behindAnimations)
         {
            _loc1_.dispose();
         }
         _behindAnimations.length = 0;
         var _loc5_:int = 0;
         var _loc4_:* = _infrontAnimations;
         for each(_loc1_ in _infrontAnimations)
         {
            _loc1_.dispose();
         }
         _infrontAnimations.length = 0;
         _currentOptionsHash = null;
      }
      
      public function stopAnimation() : void
      {
         removeSpine();
      }
      
      public function startAnimation() : void
      {
         update(_currentOptions);
      }
      
      public function update(param1:Vector.<int>) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = null;
         var _loc6_:* = null;
         var _loc5_:* = null;
         var _loc2_:String = getOptionsHash(param1);
         if(_loc2_ == _currentOptionsHash)
         {
            return;
         }
         removeSpine();
         _currentOptionsHash = _loc2_;
         _currentOptions = param1;
         if(!_currentOptions)
         {
            return;
         }
         _loc4_ = 0;
         while(_loc4_ < _currentOptions.length)
         {
            _loc3_ = getAnimationName(_currentOptions[_loc4_]);
            if(_loc3_ != null && _loc3_ != "")
            {
               _loc6_ = getSpineIdentifier(_loc3_);
               if(enableAnimations)
               {
                  _loc5_ = new SpineOpticalChangeAnimationEffects(_loc6_,_loc3_);
                  _loc5_.play();
                  if(isAnimationInFront(_loc3_))
                  {
                     _infrontAnimationLayer.addChild(_loc5_);
                     _infrontAnimations.push(_loc5_);
                  }
                  else
                  {
                     _behindAnimationLayer.addChild(_loc5_);
                     _behindAnimations.push(_loc5_);
                  }
               }
               else if(isAnimationInFront(_loc3_))
               {
                  _infrontAnimationLayer.addChild(UriSprite.load(ServerInfo.assetURL("optical_change_effects/" + _loc6_ + "_" + _loc3_,"png"),1120,630,false,-1));
               }
               else
               {
                  _behindAnimationLayer.addChild(UriSprite.load(ServerInfo.assetURL("optical_change_effects/" + _loc6_ + "_" + _loc3_,"png"),1120,630,false,-1));
               }
            }
            _loc4_++;
         }
      }
      
      private function getAnimationName(param1:int) : String
      {
         var _loc2_:* = null;
         if(param1 > 0)
         {
            if(COpticalChange.exists(param1))
            {
               _loc2_ = COpticalChange.fromId(param1).effect;
               return _loc2_;
            }
         }
         return null;
      }
      
      private function getSpineIdentifier(param1:String) : String
      {
         var _loc2_:* = null;
         if(param1 != null)
         {
            if(COpticalChangeEffect.exists(param1))
            {
               _loc2_ = COpticalChangeEffect.fromId(param1).spine;
               return _loc2_;
            }
         }
         return null;
      }
      
      private function isAnimationInFront(param1:String) : Boolean
      {
         if(param1 != null)
         {
            if(COpticalChangeEffect.exists(param1))
            {
               return !COpticalChangeEffect.fromId(param1).backAnimation;
            }
         }
         return false;
      }
      
      private function getOptionsHash(param1:Vector.<int>) : String
      {
         if(!param1)
         {
            return null;
         }
         return param1.toString();
      }
   }
}
