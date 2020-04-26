package visuals.dungeon_paths
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolDungeon1_3OverlayGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDungeon1_3Overlay = null;
      
      public function SymbolDungeon1_3OverlayGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDungeon1_3Overlay;
         }
         else
         {
            _nativeObject = new SymbolDungeon1_3Overlay();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
      }
      
      public function setNativeInstance(param1:SymbolDungeon1_3Overlay) : void
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
