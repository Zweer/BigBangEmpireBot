package com.playata.application.ui.elements.avatar
{
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.framework.input.InteractionEvent;
   import visuals.ui.elements.goal.SymbolCharacterAppearanceSheetGeneric;
   
   public class UiAppearanceSheet extends UiButton
   {
       
      
      private var _sheetContent:SymbolCharacterAppearanceSheetGeneric = null;
      
      public function UiAppearanceSheet(param1:SymbolCharacterAppearanceSheetGeneric, param2:int, param3:String, param4:Function)
      {
         _sheetContent = param1;
         super(param1,param3,param4);
         _sheetContent.info.caption.text = "!";
         _sheetContent.info.visible = false;
         this.index = param2;
         this.interactionOverMode = "none";
      }
      
      public function set tabbed(param1:Boolean) : void
      {
         _sheetContent.activeBackground.visible = param1;
         _sheetContent.inactiveBackground.visible = !param1;
         _sheetContent.inactiveBackgroundOver.visible = false;
      }
      
      public function get tabbed() : Boolean
      {
         return _sheetContent.activeBackground.visible;
      }
      
      public function set index(param1:int) : void
      {
         _sheetContent.icons.gotoAndStop(param1);
      }
      
      public function set infoVisible(param1:Boolean) : void
      {
         _sheetContent.info.visible = param1;
      }
      
      override protected function handleInteractionOver(param1:InteractionEvent) : void
      {
         if(_enabled)
         {
            if(!_sheetContent.activeBackground.visible)
            {
               _sheetContent.inactiveBackground.visible = false;
               _sheetContent.inactiveBackgroundOver.visible = true;
            }
         }
      }
      
      override protected function handleInteractionOut(param1:InteractionEvent) : void
      {
         if(_enabled)
         {
            if(!_sheetContent.activeBackground.visible)
            {
               _sheetContent.inactiveBackground.visible = true;
               _sheetContent.inactiveBackgroundOver.visible = false;
            }
         }
      }
   }
}
