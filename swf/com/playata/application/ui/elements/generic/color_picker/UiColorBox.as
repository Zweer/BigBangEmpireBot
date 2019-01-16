package com.playata.application.ui.elements.generic.color_picker
{
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.DisplayObjectFactory;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.IDisplayObjectContainer;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.display.filter.TintFilter;
   import com.playata.framework.input.InteractionEvent;
   import visuals.ui.elements.guild.SymbolColorBoxGeneric;
   
   public class UiColorBox extends InteractiveDisplayObject
   {
       
      
      private var _content:SymbolColorBoxGeneric = null;
      
      private var _color:uint = 0;
      
      private var _tooltip:UiTextTooltip = null;
      
      private var _onClickCallback:Function = null;
      
      public function UiColorBox(param1:SymbolColorBoxGeneric, param2:uint, param3:String, param4:Function = null)
      {
         _content = param1;
         super(_content);
         if(Environment.info.isTouchScreen)
         {
            param3 = "";
         }
         _color = param2;
         _tooltip = new UiTextTooltip(_content,param3);
         _onClickCallback = param4;
         _content.active.visible = false;
         _content.bg.visible = false;
         if(_onClickCallback != null)
         {
            onClick.add(handleClick);
         }
         refresh();
      }
      
      override public function dispose() : void
      {
         _tooltip.dispose();
         _tooltip = null;
         super.dispose();
      }
      
      public function get content() : SymbolColorBoxGeneric
      {
         return _content;
      }
      
      private function handleClick(param1:InteractionEvent) : void
      {
         if(_onClickCallback != null)
         {
            Environment.audio.playFX("ui_button_click.mp3");
            _onClickCallback(this);
         }
      }
      
      public function set active(param1:Boolean) : void
      {
         _content.active.visible = param1;
      }
      
      public function get active() : Boolean
      {
         return _content.active.visible;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function set color(param1:uint) : void
      {
         _color = param1;
         refresh();
      }
      
      public function refresh() : void
      {
         _content.color.removeAllFilters();
         _content.color.addFilter(new TintFilter(_color));
      }
      
      public function extendClickArea(param1:Number, param2:Number, param3:Number = 0, param4:Number = 0) : void
      {
         var _loc5_:* = null;
         var _loc9_:* = null;
         var _loc8_:int = 0;
         var _loc6_:* = NaN;
         var _loc7_:* = NaN;
         if(_content is IDisplayObjectContainer)
         {
            _loc5_ = _content as IDisplayObjectContainer;
            _loc9_ = null;
            _loc8_ = 0;
            _loc6_ = 0;
            _loc7_ = 0;
            _loc8_ = 0;
            while(_loc8_ < _loc5_.numChildren)
            {
               _loc9_ = _loc5_.getChildAt(_loc8_);
               if(_loc9_)
               {
                  if(_loc9_.x < _loc6_)
                  {
                     _loc6_ = Number(_loc9_.x);
                  }
                  if(_loc9_.y < _loc7_)
                  {
                     _loc7_ = Number(_loc9_.y);
                  }
               }
               _loc8_++;
            }
            _loc5_.addChildAt(DisplayObjectFactory.createQuadFromSettings({
               "x":_loc6_ - param1 / 2 + param3,
               "y":_loc7_ - param2 / 2 + param4,
               "width":_content.width + param1,
               "height":_content.height + param2,
               "touchable":true,
               "alpha":0,
               "color":16711680
            }),0);
         }
      }
   }
}
