package com.playata.application.ui.elements.generic.tab
{
   import com.playata.application.ui.elements.generic.button.UiButton;
   import visuals.ui.elements.buttons.SymbolButtonNarrowTabGeneric;
   
   public class UiHighlightTabButton extends UiButton
   {
       
      
      protected var _tabButton:SymbolButtonNarrowTabGeneric = null;
      
      public function UiHighlightTabButton(param1:SymbolButtonNarrowTabGeneric, param2:String, param3:String, param4:Function)
      {
         _tabButton = param1;
         super(param1,param3,param4);
         this.caption = param2;
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
      
      public function set tabbed(param1:Boolean) : void
      {
         _tabButton.tabbed.visible = param1;
         _tabButton.clear.visible = !param1;
      }
      
      public function get tabbed() : Boolean
      {
         return _tabButton.tabbed.visible;
      }
      
      public function set caption(param1:String) : void
      {
         _tabButton.tabbed.caption.autoFontSize = true;
         _tabButton.clear.caption.autoFontSize = true;
         _tabButton.tabbed.caption.text = param1;
         _tabButton.clear.caption.text = param1;
      }
      
      public function highlight() : void
      {
      }
      
      public function unhighlight() : void
      {
      }
   }
}
