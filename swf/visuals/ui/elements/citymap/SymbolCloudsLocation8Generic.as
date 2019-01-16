package visuals.ui.elements.citymap
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.icons.SymbolIconLockGeneric;
   
   public class SymbolCloudsLocation8Generic extends Sprite
   {
       
      
      private var _nativeObject:SymbolCloudsLocation8 = null;
      
      public var symbolCloud3_1:SymbolCloud3_1Generic = null;
      
      public var symbolCloud3_4:SymbolCloud3_4Generic = null;
      
      public var symbolCloud3_2:SymbolCloud3_2Generic = null;
      
      public var symbolCloud3_3:SymbolCloud3_3Generic = null;
      
      public var iconLockWorldmap:SymbolIconLockGeneric = null;
      
      public function SymbolCloudsLocation8Generic(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolCloudsLocation8;
         }
         else
         {
            _nativeObject = new SymbolCloudsLocation8();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolCloud3_1 = new SymbolCloud3_1Generic(_nativeObject.symbolCloud3_1);
         symbolCloud3_4 = new SymbolCloud3_4Generic(_nativeObject.symbolCloud3_4);
         symbolCloud3_2 = new SymbolCloud3_2Generic(_nativeObject.symbolCloud3_2);
         symbolCloud3_3 = new SymbolCloud3_3Generic(_nativeObject.symbolCloud3_3);
         iconLockWorldmap = new SymbolIconLockGeneric(_nativeObject.iconLockWorldmap);
      }
      
      public function setNativeInstance(param1:SymbolCloudsLocation8) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.symbolCloud3_1)
         {
            symbolCloud3_1.setNativeInstance(_nativeObject.symbolCloud3_1);
         }
         if(_nativeObject.symbolCloud3_4)
         {
            symbolCloud3_4.setNativeInstance(_nativeObject.symbolCloud3_4);
         }
         if(_nativeObject.symbolCloud3_2)
         {
            symbolCloud3_2.setNativeInstance(_nativeObject.symbolCloud3_2);
         }
         if(_nativeObject.symbolCloud3_3)
         {
            symbolCloud3_3.setNativeInstance(_nativeObject.symbolCloud3_3);
         }
         if(_nativeObject.iconLockWorldmap)
         {
            iconLockWorldmap.setNativeInstance(_nativeObject.iconLockWorldmap);
         }
      }
   }
}
