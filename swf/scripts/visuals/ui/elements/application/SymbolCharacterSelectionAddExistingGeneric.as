package visuals.ui.elements.application
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.elements.buttons.SymbolButtonIconOnlyTabGeneric;
   import visuals.ui.elements.generic.SymbolLocalePickerGeneric;
   import visuals.ui.elements.server_picker.SymbolServerPickerGeneric;
   
   public class SymbolCharacterSelectionAddExistingGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolCharacterSelectionAddExisting = null;
      
      public var emailLogin:SymbolCharacterSelectionAddExistingEmailLoginGeneric = null;
      
      public var txtLoginInfo:ILabelArea = null;
      
      public var localePicker:SymbolLocalePickerGeneric = null;
      
      public var serverPicker:SymbolServerPickerGeneric = null;
      
      public var tabMobile:SymbolButtonIconOnlyTabGeneric = null;
      
      public var tabFacebook:SymbolButtonIconOnlyTabGeneric = null;
      
      public var tabGameService:SymbolButtonIconOnlyTabGeneric = null;
      
      public var tabEmail:SymbolButtonIconOnlyTabGeneric = null;
      
      public function SymbolCharacterSelectionAddExistingGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolCharacterSelectionAddExisting;
         }
         else
         {
            _nativeObject = new SymbolCharacterSelectionAddExisting();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         emailLogin = new SymbolCharacterSelectionAddExistingEmailLoginGeneric(_nativeObject.emailLogin);
         txtLoginInfo = FlashLabelArea.fromNative(_nativeObject.txtLoginInfo);
         localePicker = new SymbolLocalePickerGeneric(_nativeObject.localePicker);
         serverPicker = new SymbolServerPickerGeneric(_nativeObject.serverPicker);
         tabMobile = new SymbolButtonIconOnlyTabGeneric(_nativeObject.tabMobile);
         tabFacebook = new SymbolButtonIconOnlyTabGeneric(_nativeObject.tabFacebook);
         tabGameService = new SymbolButtonIconOnlyTabGeneric(_nativeObject.tabGameService);
         tabEmail = new SymbolButtonIconOnlyTabGeneric(_nativeObject.tabEmail);
      }
      
      public function setNativeInstance(param1:SymbolCharacterSelectionAddExisting) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.emailLogin)
         {
            emailLogin.setNativeInstance(_nativeObject.emailLogin);
         }
         FlashLabelArea.setNativeInstance(txtLoginInfo,_nativeObject.txtLoginInfo);
         if(_nativeObject.localePicker)
         {
            localePicker.setNativeInstance(_nativeObject.localePicker);
         }
         if(_nativeObject.serverPicker)
         {
            serverPicker.setNativeInstance(_nativeObject.serverPicker);
         }
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
