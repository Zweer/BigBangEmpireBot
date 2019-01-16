package com.playata.application.ui.elements.hud
{
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.framework.display.IDisplayObjectContainer;
   import com.playata.framework.display.filter.GlowFilter;
   import visuals.ui.elements.buttons.SymbolButtonMainNavGeneric;
   
   public class UiMainNavigationButton extends UiButton
   {
      
      public static const HIGHLIGHT_FILTER:GlowFilter = new GlowFilter(16777215,2,2,1,5);
       
      
      private var _realContent:SymbolButtonMainNavGeneric = null;
      
      private var _selected:Boolean = false;
      
      private var _highlighted:Boolean = false;
      
      private var _progressMask:IDisplayObjectContainer;
      
      public function UiMainNavigationButton(param1:SymbolButtonMainNavGeneric, param2:IDisplayObjectContainer, param3:String, param4:Function)
      {
         _realContent = param1;
         super(_realContent,param3,param4);
         _realContent.container.dummy.visible = false;
         param2.x = _realContent.container.dummy.x;
         param2.y = _realContent.container.dummy.y;
         _realContent.container.addChild(param2);
         _tooltip.positionType = 3;
         _tooltip.offset = -20;
         _progressMask = param2.getChildByName("progressMask") as IDisplayObjectContainer;
      }
      
      public function set progress(param1:Number) : void
      {
         if(_progressMask == null)
         {
            return;
         }
         _progressMask.getChildByName("m").scaleY = 1 - param1 / 100;
      }
      
      override public function set buttonEnabled(param1:Boolean) : void
      {
         _enabled = param1;
         refresh();
      }
      
      public function set highlighted(param1:Boolean) : void
      {
         _highlighted = param1;
         if(_highlighted)
         {
            _enabled = true;
         }
         refresh();
      }
      
      public function get highlighted() : Boolean
      {
         return _highlighted;
      }
      
      public function set selected(param1:Boolean) : void
      {
         _selected = param1;
         if(param1)
         {
            enabled = true;
         }
         refresh();
      }
      
      private function refresh() : void
      {
         _realContent.container.removeAllFilters();
         _realContent.container.tweenTo(0,{"glowFilter":{"remove":true}});
         if(_enabled == false)
         {
            _realContent.container.alpha = 0.3;
         }
         else if(_selected)
         {
            _realContent.container.tweenTo(0.6,{
               "glowFilter":{
                  "color":16777215,
                  "alpha":1,
                  "blurX":10,
                  "blurY":10,
                  "strength":3
               },
               "yoyo":false
            });
            _realContent.container.alpha = 1;
         }
         else if(_highlighted)
         {
            _realContent.container.tweenTo(0.6,{
               "glowFilter":{
                  "color":16777215,
                  "alpha":1,
                  "blurX":10,
                  "blurY":10,
                  "strength":3
               },
               "yoyo":true,
               "repeat":-1
            });
            _realContent.container.alpha = 1;
         }
         else
         {
            _realContent.container.alpha = 1;
         }
      }
   }
}
