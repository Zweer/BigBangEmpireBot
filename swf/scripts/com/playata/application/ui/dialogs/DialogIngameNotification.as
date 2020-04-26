package com.playata.application.ui.dialogs
{
   import com.playata.application.data.event.IngameNotification;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.scrollbar.UiScrollBar;
   import com.playata.framework.application.Environment;
   import com.playata.framework.input.InteractionEvent;
   import visuals.ui.dialogs.SymbolDialogIngameNotificationGeneric;
   
   public class DialogIngameNotification extends UiDialog
   {
      
      private static var _isOpen:Boolean;
       
      
      private var _btnContinue:UiTextButton = null;
      
      private var _ingameNotification:IngameNotification;
      
      private var _scrollBar:UiScrollBar;
      
      public function DialogIngameNotification(param1:IngameNotification)
      {
         _isOpen = true;
         _ingameNotification = param1;
         var _loc2_:SymbolDialogIngameNotificationGeneric = new SymbolDialogIngameNotificationGeneric();
         super(_loc2_);
         _loc2_.txtDialogTitle.text = param1.subject;
         _loc2_.txtDialogTitle.autoFontSize = true;
         if(_ingameNotification.isHTML)
         {
            _loc2_.txtDescription.htmlText = param1.body;
         }
         else
         {
            _loc2_.txtDescription.text = param1.body;
         }
         _loc2_.image.setUriSprite(_ingameNotification.imageURL,880,550,true,1,null,true);
         _btnContinue = new UiTextButton(_loc2_.btnContinue,param1.button,"",onContinueClicked);
         _btnContinue.fitText();
         _scrollBar = new UiScrollBar(_loc2_.scrollKnob,_loc2_.scrollLine,_loc2_.txtDescription);
         _loc2_.txtDescription.verticalScrollBar = _scrollBar;
         _loc2_.txtDescription.interactionEnabled = true;
         _scrollBar.refresh();
      }
      
      public static function get isOpen() : Boolean
      {
         return _isOpen;
      }
      
      override public function dispose() : void
      {
         _btnContinue.dispose();
         _btnContinue = null;
         _scrollBar.dispose();
         super.dispose();
      }
      
      private function onContinueClicked(param1:InteractionEvent) : void
      {
         _isOpen = false;
         _ingameNotification.trackView();
         if(_ingameNotification.openPaymentDialog)
         {
            ViewManager.instance.showBuyCurrencyDialog();
         }
         else if(_ingameNotification.openOfferwallDialog)
         {
            platform.showOfferwall(User.current.id);
         }
         else if(_ingameNotification.openUrl)
         {
            Environment.platform.openLink(_ingameNotification.openUrl);
         }
         else
         {
            ViewManager.instance.showIngameNotifications();
         }
         close();
      }
   }
}
