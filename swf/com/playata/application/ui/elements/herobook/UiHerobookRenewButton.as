package com.playata.application.ui.elements.herobook
{
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.framework.display.IDisplayObjectContainer;
   import com.playata.framework.input.InteractionEvent;
   
   public class UiHerobookRenewButton extends UiButton
   {
       
      
      public function UiHerobookRenewButton(param1:IDisplayObjectContainer, param2:String, param3:Function)
      {
         super(param1,param2,param3);
         param1.alpha = 0;
      }
      
      override protected function handleInteractionOver(param1:InteractionEvent) : void
      {
         content.alpha = 1;
         super.handleInteractionOver(param1);
      }
      
      override protected function handleInteractionOut(param1:InteractionEvent) : void
      {
         content.alpha = 0;
         super.handleInteractionOut(param1);
      }
   }
}
