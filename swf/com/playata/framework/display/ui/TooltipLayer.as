package com.playata.framework.display.ui
{
   import com.playata.framework.core.Core;
   import com.playata.framework.core.error.Exception;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.IDisplayObjectContainer;
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.layout.LayoutUtil;
   import com.playata.framework.display.ui.controls.Tooltip;
   import com.playata.framework.input.InputCore;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class TooltipLayer
   {
      
      public static var TOOLTIP_OFFSET:int = 15;
      
      public static var TOOLTIP_SCREEN_BOUNDARY_DISTANCE:Number = 20;
      
      private static var _instance:TooltipLayer = null;
       
      
      private var _tooltipLayer:IDisplayObjectContainer = null;
      
      private var _tooltipVisible:Boolean = false;
      
      private var _tooltip:Tooltip = null;
      
      private var _tooltipRect:Rectangle;
      
      private var _tooltipPos:Point;
      
      private var _lockedPosition:Boolean = false;
      
      private var _lockedTooltip:Boolean = false;
      
      private var _validTooltipArea:Rectangle = null;
      
      public function TooltipLayer(param1:IDisplayObjectContainer)
      {
         _tooltipRect = new Rectangle();
         _tooltipPos = new Point();
         super();
         if(_instance != null)
         {
            throw new Exception("TooltipLayer can not be instantiated twice!");
         }
         _instance = this;
         _tooltipLayer = new Sprite();
         _tooltipLayer.onEnterFrame.add(handlerEnterFrame);
         param1.addChild(_tooltipLayer);
      }
      
      public static function get instance() : TooltipLayer
      {
         return _instance;
      }
      
      public function lockTooltipPosition(param1:Number, param2:Number) : void
      {
         _tooltipPos.x = param1;
         _tooltipPos.y = param2;
         _lockedPosition = true;
         updateTooltipPosition();
      }
      
      public function unlockTooltipPosition() : void
      {
         _lockedPosition = false;
      }
      
      public function set validTooltipArea(param1:Rectangle) : void
      {
         _validTooltipArea = param1;
      }
      
      public function set showTooltips(param1:Boolean) : void
      {
         _tooltipLayer.visible = param1;
      }
      
      public function set tooltipVisible(param1:Boolean) : void
      {
         if(_lockedTooltip)
         {
            return;
         }
         _tooltipVisible = param1;
         if(_tooltip)
         {
            _tooltip.visible = _tooltipVisible;
            if(_tooltipVisible)
            {
               _tooltip.onShow();
            }
            else
            {
               _tooltip.onHide();
            }
         }
      }
      
      public function lockTooltip(param1:Tooltip) : void
      {
         this.tooltip = param1;
         _lockedTooltip = true;
      }
      
      public function unlockTooltip() : void
      {
         _lockedTooltip = false;
      }
      
      public function set tooltip(param1:Tooltip) : void
      {
         if(_lockedTooltip)
         {
            return;
         }
         if(_tooltip == param1)
         {
            updateTooltipPosition();
            return;
         }
         if(_tooltip != null)
         {
            _tooltipLayer.removeChild(_tooltip);
         }
         _tooltip = param1;
         _tooltipLayer.addChild(_tooltip);
         _tooltip.onAssigned();
         updateTooltipPosition();
      }
      
      public function get tooltip() : Tooltip
      {
         return _tooltip;
      }
      
      public function setDesiredPosition(param1:Number, param2:Number) : void
      {
         updateTooltipPosition(param1,param2);
      }
      
      private function handlerEnterFrame(param1:IDisplayObject) : void
      {
         if(_tooltipVisible && _tooltip != null && !Core.current.info.isTouchScreen)
         {
            updateTooltipPosition();
         }
      }
      
      private function updateTooltipPosition(param1:Number = -1, param2:Number = -1) : void
      {
         if(_lockedPosition)
         {
            if(_tooltip)
            {
               _tooltip.x = _tooltipPos.x + TOOLTIP_OFFSET + _tooltip.offset;
               _tooltip.y = _tooltipPos.y + TOOLTIP_OFFSET + _tooltip.offset;
            }
            return;
         }
         if(param1 == -1)
         {
            param1 = InputCore.current.mouse.mouseX;
         }
         if(param2 == -1)
         {
            param2 = InputCore.current.mouse.mouseY;
         }
         if(Core.current.info.isTouchScreen)
         {
            if(param1 == -1)
            {
               param1 = _tooltip.element.globalX + _tooltip.element.width / 2;
            }
            if(param2 == -1)
            {
               param2 = _tooltip.element.globalY + _tooltip.element.height / 2;
            }
         }
         if(_tooltip.positionType == 4)
         {
            _tooltipRect.x = param1 - _tooltip.width;
            _tooltipRect.y = param2 - _tooltip.height;
         }
         else if(_tooltip.positionType == 3)
         {
            _tooltipRect.x = param1;
            _tooltipRect.y = param2 - _tooltip.height;
         }
         else if(_tooltip.positionType == 2)
         {
            _tooltipRect.x = param1 - _tooltip.width;
            _tooltipRect.y = param2;
         }
         else
         {
            _tooltipRect.x = param1;
            _tooltipRect.y = param2;
         }
         _tooltipRect.width = _tooltip.width;
         _tooltipRect.height = _tooltip.height;
         _tooltipPos = LayoutUtil.verifyRectInScreen(_tooltipRect,TOOLTIP_SCREEN_BOUNDARY_DISTANCE,_validTooltipArea);
         _tooltip.x = _tooltipPos.x + TOOLTIP_OFFSET + _tooltip.offset;
         _tooltip.y = _tooltipPos.y + TOOLTIP_OFFSET + _tooltip.offset;
      }
   }
}
