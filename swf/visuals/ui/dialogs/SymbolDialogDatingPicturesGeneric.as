package visuals.ui.dialogs
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.buttons.SymbolButtonTabGeneric;
   import visuals.ui.elements.dating.SymbolUiDatingPicturesGeneric;
   import visuals.ui.elements.fan_foto.SymbolUiFanFotoPicturesGeneric;
   
   public class SymbolDialogDatingPicturesGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogDatingPictures = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var dating:SymbolUiDatingPicturesGeneric = null;
      
      public var fanFoto:SymbolUiFanFotoPicturesGeneric = null;
      
      public var btnTabDating:SymbolButtonTabGeneric = null;
      
      public var btnTabFanFoto:SymbolButtonTabGeneric = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public function SymbolDialogDatingPicturesGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogDatingPictures;
         }
         else
         {
            _nativeObject = new SymbolDialogDatingPictures();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         dating = new SymbolUiDatingPicturesGeneric(_nativeObject.dating);
         fanFoto = new SymbolUiFanFotoPicturesGeneric(_nativeObject.fanFoto);
         btnTabDating = new SymbolButtonTabGeneric(_nativeObject.btnTabDating);
         btnTabFanFoto = new SymbolButtonTabGeneric(_nativeObject.btnTabFanFoto);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
      }
      
      public function setNativeInstance(param1:SymbolDialogDatingPictures) : void
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
         if(_nativeObject.dating)
         {
            dating.setNativeInstance(_nativeObject.dating);
         }
         if(_nativeObject.fanFoto)
         {
            fanFoto.setNativeInstance(_nativeObject.fanFoto);
         }
         if(_nativeObject.btnTabDating)
         {
            btnTabDating.setNativeInstance(_nativeObject.btnTabDating);
         }
         if(_nativeObject.btnTabFanFoto)
         {
            btnTabFanFoto.setNativeInstance(_nativeObject.btnTabFanFoto);
         }
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
      }
   }
}
