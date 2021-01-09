package visuals.ui.elements.dungeon
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolDungeonStatusLevelLineTooltipLayerGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDungeonStatusLevelLineTooltipLayer = null;
      
      public function SymbolDungeonStatusLevelLineTooltipLayerGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDungeonStatusLevelLineTooltipLayer;
         }
         else
         {
            _nativeObject = new SymbolDungeonStatusLevelLineTooltipLayer();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
      }
      
      public function setNativeInstance(param1:SymbolDungeonStatusLevelLineTooltipLayer) : void
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
