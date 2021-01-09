package com.playata.application.ui.elements.action_bar
{
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.Core;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.display.DisplayObjectFactory;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.IDisplayObjectContainer;
   import com.playata.framework.display.IQuad;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.layout.LayoutUtil;
   import com.playata.framework.display.ui.TooltipLayer;
   import com.playata.framework.display.ui.controls.Tooltip;
   import com.playata.framework.input.InteractionEvent;
   
   public class ActionBarLayer
   {
      
      private static var _instance:ActionBarLayer = null;
       
      
      private var _actionBarLayer:Sprite = null;
      
      private var _blocker:InteractiveDisplayObject = null;
      
      private var _actionBar:UiActionBarRing = null;
      
      private var _scaleOffsetX:int = 0;
      
      private var _scaleOffsetY:int = 0;
      
      public function ActionBarLayer(param1:IDisplayObjectContainer)
      {
         var _loc3_:Number = NaN;
         super();
         if(_instance != null)
         {
            throw new Error("ActionBarLayer can not be instantiated twice!");
         }
         _instance = this;
         var _loc2_:IQuad = DisplayObjectFactory.createQuadFromSettings({
            "x":0,
            "y":0,
            "width":Environment.layout.appWidth,
            "height":Environment.layout.appHeight,
            "color":0,
            "alpha":0
         });
         _blocker = new InteractiveDisplayObject(_loc2_);
         _blocker.applySettings(new TypedObject({"touchable":true}));
         _blocker.onClick.add(onBlockerClick);
         _actionBarLayer = new Sprite();
         _actionBarLayer.x = 0;
         _actionBarLayer.y = 0;
         param1.addChild(_actionBarLayer);
         _actionBar = new UiActionBarRing();
         _actionBarLayer.addChild(_blocker);
         _actionBarLayer.addChild(_actionBar);
         _actionBarLayer.visible = false;
         if(Core.current.info.isTouchScreen && LayoutUtil.isPhoneLayout)
         {
            _loc3_ = LayoutUtil.getScaleFactor(1.5);
            _scaleOffsetX = int((_actionBar.width * _loc3_ - _actionBar.width) / 2);
            _scaleOffsetY = int((_actionBar.height * _loc3_ - _actionBar.height) / 2);
            _actionBar.scale = _loc3_;
         }
      }
      
      public static function get instance() : ActionBarLayer
      {
         return _instance;
      }
      
      public function open(param1:IDisplayObject, param2:int, param3:Function, param4:Object = null, param5:int = 0, param6:int = 0, param7:Tooltip = null, param8:Function = null) : void
      {
         origin = param1;
         type = param2;
         onAction = param3;
         tag = param4;
         offsetX = param5;
         offsetY = param6;
         delayedTooltip = param7;
         onClose = param8;
         _actionBar.x = origin.globalX - origin.width / 2 + offsetX - _scaleOffsetX;
         _actionBar.y = origin.globalY - origin.height / 2 + offsetY - _scaleOffsetY;
         if(_actionBar.x < 25)
         {
            _actionBar.tweenTo(0.2,{"x":25});
         }
         if(_actionBar.y < 35)
         {
            _actionBar.tweenTo(0.2,{"y":35});
         }
         _actionBarLayer.bringToTop();
         _actionBarLayer.visible = true;
         _actionBar.open(type,onAction,tag,onClose);
         if(delayedTooltip)
         {
            TooltipLayer.instance.tooltipVisible = false;
            _actionBar.visible = false;
            Runtime.delayFunction(function():void
            {
               _actionBar.visible = true;
               TooltipLayer.instance.tooltip = delayedTooltip;
               TooltipLayer.instance.setDesiredPosition(_actionBar.x + _actionBar.width - 20,_actionBar.y);
               TooltipLayer.instance.tooltipVisible = true;
               var _loc1_:Number = _actionBar.x - TooltipLayer.instance.tooltip.width + 20;
               var _loc2_:Number = _actionBar.x + _actionBar.width - 20;
               if(TooltipLayer.instance.tooltip.x > _loc1_ && TooltipLayer.instance.tooltip.x < _loc2_)
               {
                  TooltipLayer.instance.setDesiredPosition(_loc1_,_actionBar.y);
               }
            },0.05);
         }
      }
      
      public function close() : void
      {
         _actionBar.close();
         _actionBarLayer.visible = false;
      }
      
      public function get actionBar() : UiActionBarRing
      {
         return _actionBar;
      }
      
      private function onBlockerClick(param1:InteractionEvent) : void
      {
         close();
      }
   }
}
