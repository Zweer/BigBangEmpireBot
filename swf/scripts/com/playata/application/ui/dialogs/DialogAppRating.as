package com.playata.application.ui.dialogs
{
   import com.playata.application.AppConfig;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.ui.controls.Button;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogAppRatingGeneric;
   
   public class DialogAppRating extends UiDialog
   {
      
      public static const APP_RATING_LEVEL:int = 5;
       
      
      private var _btnClose:UiButton = null;
      
      private var _btnRate:UiTextButton = null;
      
      private var _btnNo:UiTextButton = null;
      
      public function DialogAppRating()
      {
         var _loc1_:SymbolDialogAppRatingGeneric = new SymbolDialogAppRatingGeneric();
         super(_loc1_);
         _queued = true;
         _loc1_.txtDialogTitle.text = LocText.current.text("mobile/rating/title",AppConfig.appName);
         _loc1_.txtInfo.text = LocText.current.text("mobile/rating/description",User.current.character.name,AppConfig.appName);
         _btnClose = new UiButton(_loc1_.btnClose,"",onClickClose);
         _btnRate = new UiTextButton(_loc1_.btnRate,LocText.current.text("mobile/rating/button_now"),"",onClickRate);
         _btnNo = new UiTextButton(_loc1_.btnNo,LocText.current.text("mobile/rating/button_no"),"",onClickNo);
      }
      
      public static function get allowedToShowRating() : Boolean
      {
         if(!Environment.platform.isSteam)
         {
            return false;
         }
         if(User.current.character.level < 5)
         {
            return false;
         }
         if(User.current.hasRatedApp)
         {
            return false;
         }
         return true;
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         _btnRate.dispose();
         _btnRate = null;
         _btnNo.dispose();
         _btnNo = null;
         super.dispose();
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function onClickRate(param1:InteractionEvent) : void
      {
         platform.openLink(AppConfig.urlAppRating);
         User.current.hasRatedApp = true;
         close();
      }
      
      private function onClickNo(param1:InteractionEvent) : void
      {
         User.current.hasRatedApp = false;
         close();
      }
      
      override public function get defaultButton() : Button
      {
         return _btnRate;
      }
      
      override public function onEscape() : void
      {
         close();
      }
   }
}
