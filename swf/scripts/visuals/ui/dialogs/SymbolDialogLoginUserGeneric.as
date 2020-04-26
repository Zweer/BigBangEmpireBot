package visuals.ui.dialogs
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolUiButtonDefaultGeneric;
   import visuals.ui.elements.application.SymbolLoginUserEmailContentGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.buttons.SymbolButtonIconOnlyTabGeneric;
   
   public class SymbolDialogLoginUserGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogLoginUser = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var emailContent:SymbolLoginUserEmailContentGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public var btnSave:SymbolUiButtonDefaultGeneric = null;
      
      public var txtLoginInfo:ILabelArea = null;
      
      public var tabMobile:SymbolButtonIconOnlyTabGeneric = null;
      
      public var tabFacebook:SymbolButtonIconOnlyTabGeneric = null;
      
      public var tabGameService:SymbolButtonIconOnlyTabGeneric = null;
      
      public var tabEmail:SymbolButtonIconOnlyTabGeneric = null;
      
      public function SymbolDialogLoginUserGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogLoginUser;
         }
         else
         {
            _nativeObject = new SymbolDialogLoginUser();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         emailContent = new SymbolLoginUserEmailContentGeneric(_nativeObject.emailContent);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
         btnSave = new SymbolUiButtonDefaultGeneric(_nativeObject.btnSave);
         txtLoginInfo = FlashLabelArea.fromNative(_nativeObject.txtLoginInfo);
         tabMobile = new SymbolButtonIconOnlyTabGeneric(_nativeObject.tabMobile);
         tabFacebook = new SymbolButtonIconOnlyTabGeneric(_nativeObject.tabFacebook);
         tabGameService = new SymbolButtonIconOnlyTabGeneric(_nativeObject.tabGameService);
         tabEmail = new SymbolButtonIconOnlyTabGeneric(_nativeObject.tabEmail);
      }
      
      public function setNativeInstance(param1:SymbolDialogLoginUser) : void
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
         if(_nativeObject.emailContent)
         {
            emailContent.setNativeInstance(_nativeObject.emailContent);
         }
         FlashLabel.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         if(_nativeObject.btnSave)
         {
            btnSave.setNativeInstance(_nativeObject.btnSave);
         }
         FlashLabelArea.setNativeInstance(txtLoginInfo,_nativeObject.txtLoginInfo);
         if(_nativeObject.tabMobile)
         {
            tabMobile.setNativeInstance(_nativeObject.tabMobile);
         }
         if(_nativeObject.tabFacebook)
         {
            tabFacebook.setNativeInstance(_nativeObject.tabFacebook);
         }
         if(_nativeObject.tabGameService)
         {
            tabGameService.setNativeInstance(_nativeObject.tabGameService);
         }
         if(_nativeObject.tabEmail)
         {
            tabEmail.setNativeInstance(_nativeObject.tabEmail);
         }
      }
   }
}
