package visuals.ui.elements.shop
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolShopIconOption1Generic extends Sprite
   {
       
      
      private var _nativeObject:SymbolShopIconOption1 = null;
      
      public function SymbolShopIconOption1Generic(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolShopIconOption1;
         }
         else
         {
            _nativeObject = new SymbolShopIconOption1();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
      }
      
      public function setNativeInstance(param1:SymbolShopIconOption1) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
      }
   }
}
