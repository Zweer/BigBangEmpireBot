package visuals.ui.elements.fan_foto
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolIconFanFotoOffer2Generic extends Sprite
   {
       
      
      private var _nativeObject:SymbolIconFanFotoOffer2 = null;
      
      public var offer1:SymbolIconFanFotoOffer1Generic = null;
      
      public function SymbolIconFanFotoOffer2Generic(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolIconFanFotoOffer2;
         }
         else
         {
            _nativeObject = new SymbolIconFanFotoOffer2();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         offer1 = new SymbolIconFanFotoOffer1Generic(_nativeObject.offer1);
      }
      
      public function setNativeInstance(param1:SymbolIconFanFotoOffer2) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.offer1)
         {
            offer1.setNativeInstance(_nativeObject.offer1);
         }
      }
   }
}
