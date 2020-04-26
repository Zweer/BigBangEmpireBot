package visuals.ui.elements.stats
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolStatsBarFillColorHGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolStatsBarFillColorH = null;
      
      public function SymbolStatsBarFillColorHGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolStatsBarFillColorH;
         }
         else
         {
            _nativeObject = new SymbolStatsBarFillColorH();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
      }
      
      public function setNativeInstance(param1:SymbolStatsBarFillColorH) : void
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
