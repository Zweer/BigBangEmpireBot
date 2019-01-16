package visuals.ui.dialogs
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.buttons.SymbolButtonHelpGeneric;
   import visuals.ui.elements.buttons.SymbolButtonTabGeneric;
   import visuals.ui.elements.mail.SymbolMailboxIgnoreContentGeneric;
   import visuals.ui.elements.mail.SymbolMailboxMailContentGeneric;
   import visuals.ui.elements.mail.SymbolMailboxRequestContentGeneric;
   
   public class SymbolDialogMailboxGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogMailbox = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var mailContent:SymbolMailboxMailContentGeneric = null;
      
      public var ignoreContent:SymbolMailboxIgnoreContentGeneric = null;
      
      public var requestContent:SymbolMailboxRequestContentGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public var btnHelp:SymbolButtonHelpGeneric = null;
      
      public var btnTabSent:SymbolButtonTabGeneric = null;
      
      public var btnTabReceived:SymbolButtonTabGeneric = null;
      
      public var btnTabRequests:SymbolButtonTabGeneric = null;
      
      public var btnTabIgnored:SymbolButtonTabGeneric = null;
      
      public function SymbolDialogMailboxGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogMailbox;
         }
         else
         {
            _nativeObject = new SymbolDialogMailbox();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         mailContent = new SymbolMailboxMailContentGeneric(_nativeObject.mailContent);
         ignoreContent = new SymbolMailboxIgnoreContentGeneric(_nativeObject.ignoreContent);
         requestContent = new SymbolMailboxRequestContentGeneric(_nativeObject.requestContent);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
         btnHelp = new SymbolButtonHelpGeneric(_nativeObject.btnHelp);
         btnTabSent = new SymbolButtonTabGeneric(_nativeObject.btnTabSent);
         btnTabReceived = new SymbolButtonTabGeneric(_nativeObject.btnTabReceived);
         btnTabRequests = new SymbolButtonTabGeneric(_nativeObject.btnTabRequests);
         btnTabIgnored = new SymbolButtonTabGeneric(_nativeObject.btnTabIgnored);
      }
      
      public function setNativeInstance(param1:SymbolDialogMailbox) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.dialogBackground)
         {
            dialogBackground.setNativeInstance(_nativeObject.dialogBackground);
         }
         if(_nativeObject.mailContent)
         {
            mailContent.setNativeInstance(_nativeObject.mailContent);
         }
         if(_nativeObject.ignoreContent)
         {
            ignoreContent.setNativeInstance(_nativeObject.ignoreContent);
         }
         if(_nativeObject.requestContent)
         {
            requestContent.setNativeInstance(_nativeObject.requestContent);
         }
         FlashLabel.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         if(_nativeObject.btnHelp)
         {
            btnHelp.setNativeInstance(_nativeObject.btnHelp);
         }
         if(_nativeObject.btnTabSent)
         {
            btnTabSent.setNativeInstance(_nativeObject.btnTabSent);
         }
         if(_nativeObject.btnTabReceived)
         {
            btnTabReceived.setNativeInstance(_nativeObject.btnTabReceived);
         }
         if(_nativeObject.btnTabRequests)
         {
            btnTabRequests.setNativeInstance(_nativeObject.btnTabRequests);
         }
         if(_nativeObject.btnTabIgnored)
         {
            btnTabIgnored.setNativeInstance(_nativeObject.btnTabIgnored);
         }
      }
   }
}
