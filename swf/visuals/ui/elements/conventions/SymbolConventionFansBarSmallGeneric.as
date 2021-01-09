package visuals.ui.elements.conventions
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolConventionFansBarSmallGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolConventionFansBarSmall = null;
      
      public var m:SymbolThermoSmallMaskGeneric = null;
      
      public function SymbolConventionFansBarSmallGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolConventionFansBarSmall;
         }
         else
         {
            _nativeObject = new SymbolConventionFansBarSmall();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         m = new SymbolThermoSmallMaskGeneric(_nativeObject.m);
      }
      
      public function setNativeInstance(param1:SymbolConventionFansBarSmall) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.m)
         {
            m.setNativeInstance(_nativeObject.m);
         }
      }
   }
}
