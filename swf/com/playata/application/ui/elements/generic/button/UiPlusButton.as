package com.playata.application.ui.elements.generic.button
{
   import com.playata.application.ui.effects.HighlightEffect;
   import visuals.ui.elements.buttons.SymbolButtonPlusGeneric;
   
   public class UiPlusButton extends UiButton
   {
       
      
      private var _highlight:HighlightEffect = null;
      
      public function UiPlusButton(param1:SymbolButtonPlusGeneric, param2:String, param3:Function)
      {
         super(param1.mainButton,param2,param3);
         _highlight = new HighlightEffect(param1.highlight,1,1,true);
      }
      
      override public function dispose() : void
      {
         _highlight.dispose();
         super.dispose();
      }
      
      public function idle() : void
      {
         _highlight.unhighlight(true);
      }
      
      public function glow() : void
      {
         _highlight.highlight();
      }
   }
}
