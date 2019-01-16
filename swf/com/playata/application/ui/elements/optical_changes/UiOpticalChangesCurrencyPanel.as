package com.playata.application.ui.elements.optical_changes
{
   import com.playata.application.data.character.Character;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import visuals.ui.elements.optical_changes.SymbolOpticalChangeCurrencyGeneric;
   
   public class UiOpticalChangesCurrencyPanel extends UiButton
   {
       
      
      private var _progressBar:UiOpticalChangesCurrencyProgressBar;
      
      public function UiOpticalChangesCurrencyPanel(param1:SymbolOpticalChangeCurrencyGeneric, param2:Function = null)
      {
         super(param1,"",param2);
         _progressBar = new UiOpticalChangesCurrencyProgressBar(param1);
      }
      
      public function refreshLocalization() : void
      {
         _progressBar.refreshLocalization();
      }
      
      public function refresh(param1:Character) : void
      {
         _progressBar.refresh(param1);
      }
      
      override public function dispose() : void
      {
         _progressBar.dispose();
         super.dispose();
      }
      
      public function reset() : void
      {
         _progressBar.reset();
      }
      
      public function hide() : void
      {
         _progressBar.hide();
      }
   }
}
