package visuals.ui.elements.application
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.lib.flash.FlashTextInput;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ITextInput;
   import flash.display.MovieClip;
   
   public class SymbolCharacterSelectionAddExistingEmailLoginGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolCharacterSelectionAddExistingEmailLogin = null;
      
      public var txtEmailCaption:ILabel = null;
      
      public var txtPasswordCaption:ILabel = null;
      
      public var inputEmail:ITextInput = null;
      
      public var inputPassword:ITextInput = null;
      
      public function SymbolCharacterSelectionAddExistingEmailLoginGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolCharacterSelectionAddExistingEmailLogin;
         }
         else
         {
            _nativeObject = new SymbolCharacterSelectionAddExistingEmailLogin();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         txtEmailCaption = FlashLabel.fromNative(_nativeObject.txtEmailCaption);
         txtPasswordCaption = FlashLabel.fromNative(_nativeObject.txtPasswordCaption);
         inputEmail = FlashTextInput.fromNative(_nativeObject.inputEmail);
         inputPassword = FlashTextInput.fromNative(_nativeObject.inputPassword);
      }
      
      public function setNativeInstance(param1:SymbolCharacterSelectionAddExistingEmailLogin) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         FlashLabel.setNativeInstance(txtEmailCaption,_nativeObject.txtEmailCaption);
         FlashLabel.setNativeInstance(txtPasswordCaption,_nativeObject.txtPasswordCaption);
         FlashTextInput.setNativeInstance(inputEmail,_nativeObject.inputEmail);
         FlashTextInput.setNativeInstance(inputPassword,_nativeObject.inputPassword);
      }
   }
}
