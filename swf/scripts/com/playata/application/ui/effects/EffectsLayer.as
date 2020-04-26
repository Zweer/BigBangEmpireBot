package com.playata.application.ui.effects
{
   import com.playata.framework.core.Core;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.IDisplayObjectContainer;
   
   public class EffectsLayer
   {
      
      protected static var _instance:EffectsLayer;
       
      
      protected var _effectsGeneric:Vector.<IEffect>;
      
      protected var _effectsSpecial:Vector.<IEffect>;
      
      protected var _genericLayer:IDisplayObject;
      
      protected var _specialLayer:IDisplayObject;
      
      protected var _enabled:Boolean = true;
      
      protected var _isPlaying:Boolean;
      
      public function EffectsLayer()
      {
         super();
         if(_instance != null)
         {
            throw new Error("EffectsLayer can only have a single instance!");
         }
         _instance = this;
         _effectsGeneric = new Vector.<IEffect>();
         _effectsSpecial = new Vector.<IEffect>();
      }
      
      public static function get instance() : EffectsLayer
      {
         return _instance;
      }
      
      public function set enabled(param1:Boolean) : void
      {
         _enabled = param1;
      }
      
      public function get enabled() : Boolean
      {
         return _enabled;
      }
      
      public function get genericLayer() : IDisplayObject
      {
         return _genericLayer;
      }
      
      public function show(param1:int, param2:Object = null, param3:IDisplayObjectContainer = null, param4:int = -1) : IEffect
      {
         if(!_enabled)
         {
            return null;
         }
         var _loc7_:Vector.<IEffect> = param3 != null?_effectsSpecial:_effectsGeneric;
         var _loc5_:* = param3 != null;
         if(param3)
         {
            setEffectLayerParent(param3,param4);
         }
         var _loc6_:IEffect = makeEffect(param1,param2,_loc5_);
         if(!_loc6_)
         {
            return null;
         }
         _loc7_.push(_loc6_);
         if(!_isPlaying)
         {
            startPlaying();
         }
         return _loc6_;
      }
      
      protected function makeEffect(param1:int, param2:Object, param3:Boolean) : IEffect
      {
         return null;
      }
      
      private function startPlaying() : void
      {
         Core.current.heartbeat.add(onTick);
         _isPlaying = true;
      }
      
      private function stopPlaying() : void
      {
         Core.current.heartbeat.remove(onTick);
         _isPlaying = false;
      }
      
      private function onTick(param1:int) : void
      {
         var _loc4_:Number = param1 / 1000;
         var _loc2_:Boolean = updateQueue(_effectsGeneric,_loc4_);
         var _loc3_:Boolean = updateQueue(_effectsSpecial,_loc4_);
         renderEffects(_loc2_,_loc3_);
         if(_effectsSpecial.length == 0)
         {
            removeSpecialLayer();
         }
         if(_effectsGeneric.length == 0 && _effectsSpecial.length == 0)
         {
            stopPlaying();
         }
      }
      
      private function removeSpecialLayer() : void
      {
         if(_specialLayer.parent)
         {
            _specialLayer.parent.removeChild(_specialLayer);
         }
      }
      
      private function setEffectLayerParent(param1:IDisplayObjectContainer, param2:int = -1) : void
      {
         if(_specialLayer.parent)
         {
            return;
         }
         if(param2 == -1)
         {
            param1.addChild(_specialLayer);
         }
         else
         {
            param1.addChildAt(_specialLayer,param2);
         }
      }
      
      private function updateQueue(param1:Vector.<IEffect>, param2:Number) : Boolean
      {
         var _loc3_:* = null;
         var _loc5_:Boolean = false;
         var _loc4_:int = 0;
         if(param1.length == 0)
         {
            return false;
         }
         _loc4_ = 0;
         while(_loc4_ < param1.length)
         {
            _loc3_ = param1[_loc4_];
            _loc5_ = _loc3_.update(param2);
            if(_loc5_)
            {
               _loc3_.dispose();
               param1.removeAt(_loc4_);
               _loc4_--;
            }
            _loc4_++;
         }
         return true;
      }
      
      protected function renderEffects(param1:Boolean, param2:Boolean) : void
      {
      }
   }
}
