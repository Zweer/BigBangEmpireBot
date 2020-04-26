package visuals.ui.elements.application
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.elements.goal.SymbolButtonFacebookConnectGeneric;
   
   public class SymbolRegisterUserAlternativeAccountsContentGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolRegisterUserAlternativeAccountsContent = null;
      
      public var btnFBLogin:SymbolButtonFacebookConnectGeneric = null;
      
      public var txtAlternativeCaption:ILabel = null;
      
      public function SymbolRegisterUserAlternativeAccountsContentGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolRegisterUserAlternativeAccountsContent;
         }
         else
         {
            _nativeObject = new SymbolRegisterUserAlternativeAccountsContent();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         btnFBLogin = new SymbolButtonFacebookConnectGeneric(_nativeObject.btnFBLogin);
         txtAlternativeCaption = FlashLabel.fromNative(_nativeObject.txtAlternativeCaption);
      }
      
      public function setNativeInstance(param1:SymbolRegisterUserAlternativeAccountsContent) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.btnFBLogin)
         {
            btnFBLogin.setNativeInstance(_nativeObject.btnFBLogin);
         }
         FlashLabel.setNativeInstance(txtAlternativeCaption,_nativeObject.txtAlternativeCaption);
      }
   }
}
