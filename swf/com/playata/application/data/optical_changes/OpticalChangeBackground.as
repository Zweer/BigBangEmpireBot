package com.playata.application.data.optical_changes
{
   import com.playata.application.ui.ViewManager;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.layout.LayoutUtil;
   import visuals.ui.base.SymbolDummyGeneric;
   
   public class OpticalChangeBackground
   {
       
      
      private var _target:SymbolDummyGeneric;
      
      private var _fallbackBackground:int;
      
      private var _backgroundType:int;
      
      private var _currentOptions:Vector.<int>;
      
      private var _animationLayerBehind:Sprite;
      
      private var _animationLayerInfront:Sprite;
      
      private var _opticalChangeAnimation:OpticalChangeAnimation;
      
      public function OpticalChangeBackground(param1:SymbolDummyGeneric, param2:int = 0, param3:int = 0)
      {
         super();
         _target = param1;
         _backgroundType = param2;
         _fallbackBackground = param3;
         _animationLayerBehind = new Sprite();
         _animationLayerInfront = new Sprite();
         _opticalChangeAnimation = new OpticalChangeAnimation(_animationLayerBehind,_animationLayerInfront);
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
            if(param1 == null || param1.length == 0)
            {
               ViewManager.instance.setBackground(_fallbackBackground);
            }
            else if(_backgroundType != 0)
            {
               ViewManager.instance.setBackground(_backgroundType);
            }
            return;
         }
         _currentOptions = param1;
         if(_target.getChildIndex(_animationLayerBehind) >= 0)
         {
            _target.removeChild(_animationLayerBehind,false);
         }
         if(_target.getChildIndex(_animationLayerInfront) >= 0)
         {
            _target.removeChild(_animationLayerInfront,false);
         }
         _target.removeAllChildren(true);
         OpticalChangeUtil.setBackground(param1,_target,_backgroundType,_fallbackBackground,onBackgroundLoaded);
         _opticalChangeAnimation.update(param1);
      }
      
      private function onBackgroundLoaded(param1:IDisplayObject) : void
      {
         _target.addChildAt(_animationLayerBehind,0);
         _target.addChild(_animationLayerInfront);
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
