package com.playata.application.ui.dialogs
{
   import com.playata.application.AppEnvironment;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.framework.display.layout.LayoutUtil;
   import com.playata.framework.display.ui.controls.Button;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogTutorialPopupGeneric;
   
   public class DialogTutorialPopup extends UiDialog
   {
       
      
      private var _btnClose:UiTextButton = null;
      
      private var _callback:Function = null;
      
      public function DialogTutorialPopup(param1:String, param2:String, param3:Function = null)
      {
         _callback = param3;
         var _loc4_:SymbolDialogTutorialPopupGeneric = new SymbolDialogTutorialPopupGeneric();
         super(_loc4_,false);
         _loc4_.txtDialogTitle.text = param1;
         _loc4_.txtTutorialText.autoFontSize = true;
         _loc4_.txtTutorialText.text = param2;
         var _loc5_:Number = _loc4_.txtTutorialText.height - _loc4_.txtTutorialText.textHeight - 10;
         _loc4_.btnClose.y = _loc4_.btnClose.y - _loc5_;
         _loc4_.dialogBackground.height = _loc4_.dialogBackground.height - _loc5_;
         _btnClose = new UiTextButton(_loc4_.btnClose,LocText.current.text("general/button_ok"),"",onClickClose);
         _btnClose.bringToTop();
         _loc4_.lady.alpha = 0;
         _loc4_.lady.y = _loc4_.lady.y + LayoutUtil.deviceAdjustedHeightCorrection / 2;
         if(AppEnvironment.appPlatform.isHidePantiesAllowed)
         {
            _loc4_.lady.gotoAndStop("usk18");
         }
         else
         {
            _loc4_.lady.gotoAndStop("normal");
         }
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         super.dispose();
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         if(_callback != null)
         {
            _callback();
         }
         (_vo as SymbolDialogTutorialPopupGeneric).lady.visible = false;
         close();
      }
      
      override public function get defaultButton() : Button
      {
         return _btnClose;
      }
      
      override public function onEscape() : void
      {
         onClickClose(null);
      }
      
      override public function show() : void
      {
         (_vo as SymbolDialogTutorialPopupGeneric).lady.tweenTo(0.8,{
            "alpha":1,
            "delay":0.5
         });
         super.show();
      }
   }
}
