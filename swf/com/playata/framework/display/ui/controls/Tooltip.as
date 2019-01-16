package com.playata.framework.display.ui.controls
{
   import com.playata.framework.core.Core;
   import com.playata.framework.core.error.Exception;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.IInteractiveDisplayObject;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.display.ui.TooltipLayer;
   import com.playata.framework.input.InteractionEvent;
   import visuals.ui.elements.item.SymbolItemSlotGeneric;
   
   public class Tooltip extends InteractiveDisplayObject
   {
      
      public static const POSITION_BOTTOM_RIGHT:int = 1;
      
      public static const POSITION_BOTTOM_LEFT:int = 2;
      
      public static const POSITION_TOP_RIGHT:int = 3;
      
      public static const POSITION_TOP_LEFT:int = 4;
       
      
      protected var _element:IInteractiveDisplayObject = null;
      
      protected var _positionType:int = 1;
      
      protected var _offset:int = 0;
      
      protected var _forceShowOnMobile:Boolean = false;
      
      protected var _enabled:Boolean = true;
      
      public function Tooltip(param1:IInteractiveDisplayObject, param2:IDisplayObject)
      {
         element = param1;
         visual = param2;
         super(visual);
         _element = element;
         if(_element != null)
         {
            if(Core.current.info.isTouchScreen)
            {
               _element.onClick.add(handleInteractionOver);
               _element.onInactiveClick.add(handleInteractionOver);
            }
            else
            {
               _element.onInteractionOut.add(handleInteractionOut);
               _element.onInteractionOver.add(handleInteractionOver);
            }
         }
         this.visible = false;
         if(Core.current.info.isTouchScreen)
         {
            this.onClick.add(function():void
            {
               TooltipLayer.instance.tooltipVisible = false;
            });
         }
         _displayObject.nativeInstance.mouseChildren = false;
      }
      
      public function set forceShowOnMobile(param1:Boolean) : void
      {
         _forceShowOnMobile = param1;
      }
      
      public function get forceShowOnMobile() : Boolean
      {
         return _forceShowOnMobile;
      }
      
      override public function dispose() : void
      {
         if(_element != null)
         {
            if(Core.current.info.isTouchScreen)
            {
               if(_element.hasClick)
               {
                  _element.onClick.remove(handleInteractionOver);
               }
               if(_element.hasInactiveClick)
               {
                  _element.onInactiveClick.remove(handleInteractionOver);
               }
            }
            else
            {
               if(_element.hasInteractionOut)
               {
                  _element.onInteractionOut.remove(handleInteractionOut);
               }
               if(_element.hasInteractionOver)
               {
                  _element.onInteractionOver.remove(handleInteractionOver);
               }
            }
            _element = null;
         }
         super.dispose();
         if(TooltipLayer.instance.tooltip === this)
         {
            TooltipLayer.instance.tooltipVisible = false;
         }
      }
      
      public function get element() : IInteractiveDisplayObject
      {
         return _element;
      }
      
      public function get positionType() : int
      {
         return _positionType;
      }
      
      public function set positionType(param1:int) : void
      {
         _positionType = param1;
      }
      
      public function get offset() : int
      {
         return _offset;
      }
      
      public function set offset(param1:int) : void
      {
         _offset = param1;
      }
      
      public function get enabled() : Boolean
      {
         return _enabled;
      }
      
      public function set enabled(param1:Boolean) : void
      {
         if(!param1 && TooltipLayer.instance.tooltip == this)
         {
            TooltipLayer.instance.tooltipVisible = false;
         }
         _enabled = param1;
      }
      
      public function onAssigned() : void
      {
      }
      
      public function onShow() : void
      {
      }
      
      public function onHide() : void
      {
      }
      
      protected function handleInteractionOver(param1:InteractionEvent) : void
      {
         if(Core.current.info.isTouchScreen)
         {
            handleMobileTooltip();
         }
         else
         {
            handleNonMobileTooltip();
         }
      }
      
      protected function handleMobileTooltip() : void
      {
         var _loc1_:Boolean = false;
         if(!_enabled)
         {
            TooltipLayer.instance.tooltipVisible = false;
            return;
         }
         if(_displayObject != null)
         {
            if(TooltipLayer.instance == null)
            {
               throw new Exception("TooltipLayer must be initialised before this component can be used!");
            }
            if(!_forceShowOnMobile && _element is Button && (_element as Button).enabled)
            {
               TooltipLayer.instance.tooltipVisible = false;
               return;
            }
            if(!_forceShowOnMobile && !(_element is Button) && _element is IInteractiveDisplayObject && (_element as IInteractiveDisplayObject).hasInactiveClick && (_element as IInteractiveDisplayObject).onClick.numListeners > 1)
            {
               TooltipLayer.instance.tooltipVisible = false;
               return;
            }
            if(!_forceShowOnMobile && !(_element is Button) && _element is InteractiveDisplayObject && (_element as InteractiveDisplayObject).displayObject is SymbolItemSlotGeneric)
            {
               TooltipLayer.instance.tooltipVisible = false;
               return;
            }
            _loc1_ = TooltipLayer.instance.tooltip == this && this.visible;
            TooltipLayer.instance.tooltip = this;
            TooltipLayer.instance.tooltipVisible = !_loc1_;
         }
      }
      
      protected function handleNonMobileTooltip() : void
      {
         if(!_enabled)
         {
            return;
         }
         if(_displayObject != null)
         {
            if(TooltipLayer.instance == null)
            {
               throw new Exception("TooltipLayer must be initialised before this component can be used!");
            }
            TooltipLayer.instance.tooltip = this;
            TooltipLayer.instance.tooltipVisible = true;
         }
      }
      
      protected function handleInteractionOut(param1:InteractionEvent) : void
      {
         if(!_enabled)
         {
            return;
         }
         TooltipLayer.instance.tooltipVisible = false;
      }
   }
}
