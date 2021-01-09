package visuals.ui.elements.buttons
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   import visuals.ui.elements.icons.SymbolIconVideoAdvertismentGeneric;
   
   public class SymbolButtonVideoAdvertismentGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolButtonVideoAdvertisment = null;
      
      public var icon:SymbolIconVideoAdvertismentGeneric = null;
      
      public var symbolDummy:SymbolDummyGeneric = null;
      
      public function SymbolButtonVideoAdvertismentGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolButtonVideoAdvertisment;
         }
         else
         {
            _nativeObject = new SymbolButtonVideoAdvertisment();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         icon = new SymbolIconVideoAdvertismentGeneric(_nativeObject.icon);
         symbolDummy = new SymbolDummyGeneric(_nativeObject.symbolDummy);
      }
      
      public function setNativeInstance(param1:SymbolButtonVideoAdvertisment) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.icon)
         {
            icon.setNativeInstance(_nativeObject.icon);
         }
         if(_nativeObject.symbolDummy)
         {
            symbolDummy.setNativeInstance(_nativeObject.symbolDummy);
         }
      }
   }
}
