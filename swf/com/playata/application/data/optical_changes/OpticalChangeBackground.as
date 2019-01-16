package com.playata.application.data.optical_changes
{
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.layout.LayoutUtil;
   import visuals.ui.base.SymbolDummyGeneric;
   
   public class OpticalChangeBackground
   {
       
      
      private var _target:SymbolDummyGeneric;
      
      private var _fallbackBackground:int;
      
      private var _currentOptions:Vector.<int>;
      
      private var _animationLayer:Sprite;
      
      private var _opticalChangeAnimation:OpticalChangeAnimation;
      
      public function OpticalChangeBackground(param1:SymbolDummyGeneric, param2:int = 0)
      {
         super();
         _target = param1;
         _fallbackBackground = param2;
         _animationLayer = new Sprite();
         _opticalChangeAnimation = new OpticalChangeAnimation(_animationLayer);
      }
      
      public function dispose() : void
      {
         _target = null;
         _currentOptions = null;
         _opticalChangeAnimation.dispose();
         _opticalChangeAnimation = null;
      }
      
      public function hide() : void
      {
         _target.visible = false;
         _opticalChangeAnimation.stopAnimation();
      }
      
      public function setBackground(param1:Vector.<int>) : void
      {
         if(sameOptions(param1))
         {
            _target.visible = true;
            _opticalChangeAnimation.startAnimation();
            return;
         }
         _currentOptions = param1;
         if(_target.getChildIndex(_animationLayer) >= 0)
         {
            _target.removeChild(_animationLayer,false);
         }
         _target.removeAllChildren(true);
         OpticalChangeUtil.setBackground(param1,_target,_fallbackBackground,onBackgroundLoaded);
         _opticalChangeAnimation.update(param1);
      }
      
      private function onBackgroundLoaded(param1:IDisplayObject) : void
      {
         _target.addChild(_animationLayer);
      }
      
      public function refreshAppSize(param1:int = 0) : void
      {
         var _loc2_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc3_:* = 1;
         if(LayoutUtil.isWidthAdjustedFormat)
         {
            _loc3_ = Number(Environment.layout.appWidth / Environment.layout.appDefaultWidth);
         }
         else
         {
            _loc3_ = Number(Environment.layout.appHeight / Environment.layout.appDefaultHeight);
         }
         if(_loc3_ != _target.scale)
         {
            if(_loc3_ == 1)
            {
               _target.scale = _loc3_;
               _target.x = 0;
               _target.y = 0 - param1;
            }
            else
            {
               _target.scale = _loc3_;
               _loc2_ = _loc3_ * Environment.layout.appDefaultHeight - Environment.layout.appHeight;
               _loc4_ = _loc3_ * Environment.layout.appDefaultWidth - Environment.layout.appWidth;
               _target.x = -_loc4_ / 2;
               _target.y = -_loc2_ / 2 - param1;
            }
         }
      }
      
      private function sameOptions(param1:Vector.<int>) : Boolean
      {
         if(!_currentOptions || !param1)
         {
            return false;
         }
         if(_currentOptions.length != param1.length)
         {
            return false;
         }
         var _loc4_:int = 0;
         var _loc3_:* = param1;
         for each(var _loc2_ in param1)
         {
            if(_currentOptions.indexOf(_loc2_) == -1)
            {
               return false;
            }
         }
         return true;
      }
      
      public function set fallbackBackground(param1:int) : void
      {
         _fallbackBackground = param1;
      }
   }
}
