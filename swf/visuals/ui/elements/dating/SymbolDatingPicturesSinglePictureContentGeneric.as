package visuals.ui.elements.dating
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   
   public class SymbolDatingPicturesSinglePictureContentGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDatingPicturesSinglePictureContent = null;
      
      public var picture1:SymbolDatingPictureBigGeneric = null;
      
      public var picture2:SymbolDatingPictureBigGeneric = null;
      
      public var picture4:SymbolDatingPictureBigGeneric = null;
      
      public var picture5:SymbolDatingPictureBigGeneric = null;
      
      public var picture3:SymbolDatingPictureBigGeneric = null;
      
      public var textLockInfo:ILabelArea = null;
      
      public function SymbolDatingPicturesSinglePictureContentGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDatingPicturesSinglePictureContent;
         }
         else
         {
            _nativeObject = new SymbolDatingPicturesSinglePictureContent();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         picture1 = new SymbolDatingPictureBigGeneric(_nativeObject.picture1);
         picture2 = new SymbolDatingPictureBigGeneric(_nativeObject.picture2);
         picture4 = new SymbolDatingPictureBigGeneric(_nativeObject.picture4);
         picture5 = new SymbolDatingPictureBigGeneric(_nativeObject.picture5);
         picture3 = new SymbolDatingPictureBigGeneric(_nativeObject.picture3);
         textLockInfo = FlashLabelArea.fromNative(_nativeObject.textLockInfo);
      }
      
      public function setNativeInstance(param1:SymbolDatingPicturesSinglePictureContent) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.picture1)
         {
            picture1.setNativeInstance(_nativeObject.picture1);
         }
         if(_nativeObject.picture2)
         {
            picture2.setNativeInstance(_nativeObject.picture2);
         }
         if(_nativeObject.picture4)
         {
            picture4.setNativeInstance(_nativeObject.picture4);
         }
         if(_nativeObject.picture5)
         {
            picture5.setNativeInstance(_nativeObject.picture5);
         }
         if(_nativeObject.picture3)
         {
            picture3.setNativeInstance(_nativeObject.picture3);
         }
         FlashLabelArea.setNativeInstance(textLockInfo,_nativeObject.textLockInfo);
      }
   }
}
