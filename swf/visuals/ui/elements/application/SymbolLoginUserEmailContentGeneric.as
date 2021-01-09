package visuals.ui.elements.application
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.lib.flash.FlashTextInput;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import com.playata.framework.display.ui.controls.ITextInput;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolUiButtonDefaultGeneric;
   
   public class SymbolLoginUserEmailContentGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolLoginUserEmailContent = null;
      
      public var txtEmailCaption:ILabel = null;
      
      public var txtPasswordCaption:ILabel = null;
      
      public var txtPasswordLostCaption:ILabelArea = null;
      
      public var inputPassword:ITextInput = null;
      
      public var inputEmail:ITextInput = null;
      
      public var btnPasswordLost:SymbolUiButtonDefaultGeneric = null;
      
      public function SymbolLoginUserEmailContentGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolLoginUserEmailContent;
         }
         else
         {
            _nativeObject = new SymbolLoginUserEmailContent();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         txtEmailCaption = FlashLabel.fromNative(_nativeObject.txtEmailCaption);
         txtPasswordCaption = FlashLabel.fromNative(_nativeObject.txtPasswordCaption);
         txtPasswordLostCaption = FlashLabelArea.fromNative(_nativeObject.txtPasswordLostCaption);
         inputPassword = FlashTextInput.fromNative(_nativeObject.inputPassword);
         inputEmail = FlashTextInput.fromNative(_nativeObject.inputEmail);
         btnPasswordLost = new SymbolUiButtonDefaultGeneric(_nativeObject.btnPasswordLost);
      }
      
      public function setNativeInstance(param1:SymbolLoginUserEmailContent) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         FlashLabel.setNativeInstance(txtEmailCaption,_nativeObject.txtEmailCaption);
         FlashLabel.setNativeInstance(txtPasswordCaption,_nativeObject.txtPasswordCaption);
         FlashLabelArea.setNativeInstance(txtPasswordLostCaption,_nativeObject.txtPasswordLostCaption);
         FlashTextInput.setNativeInstance(inputPassword,_nativeObject.inputPassword);
         FlashTextInput.setNativeInstance(inputEmail,_nativeObject.inputEmail);
         if(_nativeObject.btnPasswordLost)
         {
            btnPasswordLost.setNativeInstance(_nativeObject.btnPasswordLost);
         }
      }
   }
}
