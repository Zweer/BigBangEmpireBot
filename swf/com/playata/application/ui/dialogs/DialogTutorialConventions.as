package com.playata.application.ui.dialogs
{
   import com.greensock.easing.Linear;
   import com.playata.application.AppEnvironment;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.fan_foto.UiFansThermometer;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.framework.display.layout.LayoutUtil;
   import com.playata.framework.display.ui.controls.Button;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import com.playata.framework.tween.Tween;
   import visuals.ui.dialogs.SymbolDialogTutorialConventionsGeneric;
   
   public class DialogTutorialConventions extends UiDialog
   {
      
      private static const FANS:int = 357969;
      
      private static var _isOpen:Boolean;
       
      
      private var _btnClose:UiTextButton;
      
      private var _fansBar:UiFansThermometer;
      
      private var _isTutorial:Boolean;
      
      public function DialogTutorialConventions()
      {
         _isOpen = true;
         var _loc1_:SymbolDialogTutorialConventionsGeneric = new SymbolDialogTutorialConventionsGeneric();
         super(_loc1_);
         _isTutorial = !User.current.character.hasTutorialFlag("conventions");
         _queued = false;
         _fansBar = new UiFansThermometer(_loc1_.progress,357969,0,false);
         _loc1_.txtDialogTitle.text = LocText.current.text("tutorial/conventions/title");
         _loc1_.txtMessage.text = LocText.current.text("tutorial/conventions/text");
         _loc1_.txtFans.text = LocText.current.text("tutorial/conventions/fans");
         _loc1_.txtVisitors.text = LocText.current.text("tutorial/conventions/visitors");
         _btnClose = new UiTextButton(_loc1_.btnClose,LocText.current.text("general/button_ok"),"",onClickClose);
         _loc1_.lady.alpha = 0;
         _loc1_.lady.y = _loc1_.lady.y + LayoutUtil.deviceAdjustedHeightCorrection / 2;
         if(AppEnvironment.appPlatform.isHidePantiesAllowed)
         {
            _loc1_.lady.gotoAndStop("usk18");
         }
         else
         {
            _loc1_.lady.gotoAndStop("normal");
         }
      }
      
      public static function get isOpen() : Boolean
      {
         return _isOpen;
      }
      
      override public function show() : void
      {
         Tween.to(_fansBar,10,{
            "delay":0.5,
            "value":357969,
            "ease":Linear.easeNone
         });
         (_vo as SymbolDialogTutorialConventionsGeneric).lady.tweenTo(0.8,{
            "alpha":1,
            "delay":0.5
         });
         super.show();
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         _fansBar.dispose();
         _fansBar = null;
         super.dispose();
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         if(_isTutorial)
         {
            User.current.character.setTutorialFlag("conventions");
         }
         (_vo as SymbolDialogTutorialConventionsGeneric).lady.visible = false;
         _isOpen = false;
         close();
      }
      
      override public function get defaultButton() : Button
      {
         return _btnClose;
      }
   }
}
