package visuals.ui.elements.dating
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   import visuals.ui.base.SymbolPlaceholderGeneric;
   
   public class SymbolDatingPictureBigGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDatingPictureBig = null;
      
      public var txtDescription:ILabelArea = null;
      
      public var picture:SymbolPlaceholderGeneric = null;
      
      public var m:SymbolDummyGeneric = null;
      
      public var mouseLayer:SymbolDummyGeneric = null;
      
      public function SymbolDatingPictureBigGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDatingPictureBig;
         }
         else
         {
            _nativeObject = new SymbolDatingPictureBig();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         txtDescription = FlashLabelArea.fromNative(_nativeObject.txtDescription);
         picture = new SymbolPlaceholderGeneric(_nativeObject.picture);
         m = new SymbolDummyGeneric(_nativeObject.m);
         mouseLayer = new SymbolDummyGeneric(_nativeObject.mouseLayer);
      }
      
      public function setNativeInstance(param1:SymbolDatingPictureBig) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         FlashLabelArea.setNativeInstance(txtDescription,_nativeObject.txtDescription);
         if(_nativeObject.picture)
         {
            picture.setNativeInstance(_nativeObject.picture);
         }
         if(_nativeObject.m)
         {
            m.setNativeInstance(_nativeObject.m);
         }
         if(_nativeObject.mouseLayer)
         {
            mouseLayer.setNativeInstance(_nativeObject.mouseLayer);
         }
      }
   }
}
