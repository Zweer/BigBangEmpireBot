package visuals.ui.elements.booster
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolBoosterType3SilhouetteGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolBoosterType3Silhouette = null;
      
      public function SymbolBoosterType3SilhouetteGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolBoosterType3Silhouette;
         }
         else
         {
            _nativeObject = new SymbolBoosterType3Silhouette();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
      }
      
      public function setNativeInstance(param1:SymbolBoosterType3Silhouette) : void
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
