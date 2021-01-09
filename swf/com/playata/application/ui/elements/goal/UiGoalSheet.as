package com.playata.application.ui.elements.goal
{
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.framework.input.InteractionEvent;
   import visuals.ui.elements.goal.SymbolGoalSheetGeneric;
   
   public class UiGoalSheet extends UiButton
   {
       
      
      private var _sheetContent:SymbolGoalSheetGeneric = null;
      
      public function UiGoalSheet(param1:SymbolGoalSheetGeneric, param2:String, param3:String, param4:Function)
      {
         _sheetContent = param1;
         super(param1,param3,param4);
         this.caption = param2;
         this.interactionOverMode = "none";
      }
      
      public function set tabbed(param1:Boolean) : void
      {
         _sheetContent.activeBackground.visible = param1;
         _sheetContent.inactiveBackground.visible = !param1;
         _sheetContent.inactiveBackgroundOver.visible = false;
         _sheetContent.txtActiveText.visible = param1;
         _sheetContent.txtInactiveText.visible = !param1;
      }
      
      public function get tabbed() : Boolean
      {
         return _sheetContent.activeBackground.visible;
      }
      
      public function set caption(param1:String) : void
      {
         _sheetContent.txtActiveText.text = param1;
         _sheetContent.txtInactiveText.text = param1;
         _sheetContent.txtActiveText.autoFontSize = true;
         _sheetContent.txtInactiveText.autoFontSize = true;
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
