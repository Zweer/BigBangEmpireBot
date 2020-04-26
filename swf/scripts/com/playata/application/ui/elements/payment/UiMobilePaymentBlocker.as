package com.playata.application.ui.elements.payment
{
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.DisplayObjectFactory;
   import com.playata.framework.display.IQuad;
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.ui.Align;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.base.SymbolUiButtonDefaultGeneric;
   
   public class UiMobilePaymentBlocker
   {
       
      
      private var _onContinue:Function = null;
      
      private var _content:Sprite = null;
      
      private var _background:IQuad = null;
      
      private var _btnContinue:UiTextButton = null;
      
      public function UiMobilePaymentBlocker(param1:Function)
      {
         super();
         _onContinue = param1;
         _content = new Sprite();
         _background = DisplayObjectFactory.createQuadFromSettings({
            "width":Environment.layout.appWidth,
            "height":Environment.layout.appHeight,
            "color":0,
            "alpha":0.8
         });
         _content.addChild(_background);
         _btnContinue = new UiTextButton(new SymbolUiButtonDefaultGeneric(),LocText.current.text("payment/button_return_to_game"),"",onClickContinue);
         _btnContinue.align(Align.CENTER,Align.CENTER);
         _content.addChild(_btnContinue);
         Environment.display.displayContext.stage.addChild(_content);
      }
      
      private function onClickContinue(param1:InteractionEvent) : void
      {
         Environment.display.displayContext.stage.removeChild(_content);
      }
   }
}
