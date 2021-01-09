package visuals.ui.elements.fan_foto
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   import visuals.ui.base.SymbolPlaceholderGeneric;
   
   public class SymbolFanFotoPictureGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolFanFotoPicture = null;
      
      public var picture:SymbolPlaceholderGeneric = null;
      
      public var txtName:ILabelArea = null;
      
      public var symbolDummy:SymbolDummyGeneric = null;
      
      public function SymbolFanFotoPictureGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolFanFotoPicture;
         }
         else
         {
            _nativeObject = new SymbolFanFotoPicture();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         picture = new SymbolPlaceholderGeneric(_nativeObject.picture);
         txtName = FlashLabelArea.fromNative(_nativeObject.txtName);
         symbolDummy = new SymbolDummyGeneric(_nativeObject.symbolDummy);
      }
      
      public function setNativeInstance(param1:SymbolFanFotoPicture) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.picture)
         {
            picture.setNativeInstance(_nativeObject.picture);
         }
         FlashLabelArea.setNativeInstance(txtName,_nativeObject.txtName);
         if(_nativeObject.symbolDummy)
         {
            symbolDummy.setNativeInstance(_nativeObject.symbolDummy);
         }
      }
   }
}
