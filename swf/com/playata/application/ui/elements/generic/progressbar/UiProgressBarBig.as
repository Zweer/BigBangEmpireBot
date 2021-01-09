package com.playata.application.ui.elements.generic.progressbar
{
   import visuals.ui.elements.generic.SymbolProgressBarBigGeneric;
   
   public class UiProgressBarBig extends UiProgressBarFillMasked
   {
       
      
      private var _progressBar:SymbolProgressBarBigGeneric = null;
      
      public function UiProgressBarBig(param1:SymbolProgressBarBigGeneric)
      {
         super(param1.m,param1.fill);
      }
   }
}
