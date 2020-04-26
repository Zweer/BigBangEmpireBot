package visuals.ui.elements.citymap
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.icons.SymbolIconLockGeneric;
   
   public class SymbolCloudsDungeon2Generic extends Sprite
   {
       
      
      private var _nativeObject:SymbolCloudsDungeon2 = null;
      
      public var symbolCloud2_1:SymbolCloud2_1Generic = null;
      
      public var symbolCloud2_2:SymbolCloud2_2Generic = null;
      
      public var symbolCloud2_3:SymbolCloud2_3Generic = null;
      
      public var iconLockWorldmap:SymbolIconLockGeneric = null;
      
      public function SymbolCloudsDungeon2Generic(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolCloudsDungeon2;
         }
         else
         {
            _nativeObject = new SymbolCloudsDungeon2();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolCloud2_1 = new SymbolCloud2_1Generic(_nativeObject.symbolCloud2_1);
         symbolCloud2_2 = new SymbolCloud2_2Generic(_nativeObject.symbolCloud2_2);
         symbolCloud2_3 = new SymbolCloud2_3Generic(_nativeObject.symbolCloud2_3);
         iconLockWorldmap = new SymbolIconLockGeneric(_nativeObject.iconLockWorldmap);
      }
      
      public function setNativeInstance(param1:SymbolCloudsDungeon2) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.symbolCloud2_1)
         {
            symbolCloud2_1.setNativeInstance(_nativeObject.symbolCloud2_1);
         }
         if(_nativeObject.symbolCloud2_2)
         {
            symbolCloud2_2.setNativeInstance(_nativeObject.symbolCloud2_2);
         }
         if(_nativeObject.symbolCloud2_3)
         {
            symbolCloud2_3.setNativeInstance(_nativeObject.symbolCloud2_3);
         }
         if(_nativeObject.iconLockWorldmap)
         {
            iconLockWorldmap.setNativeInstance(_nativeObject.iconLockWorldmap);
         }
      }
   }
}
