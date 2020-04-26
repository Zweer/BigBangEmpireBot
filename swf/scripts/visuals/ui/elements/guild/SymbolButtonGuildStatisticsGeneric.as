package visuals.ui.elements.guild
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolUiButtonDefaultShapeSmallGeneric;
   
   public class SymbolButtonGuildStatisticsGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolButtonGuildStatistics = null;
      
      public var bg:SymbolUiButtonDefaultShapeSmallGeneric = null;
      
      public function SymbolButtonGuildStatisticsGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolButtonGuildStatistics;
         }
         else
         {
            _nativeObject = new SymbolButtonGuildStatistics();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         bg = new SymbolUiButtonDefaultShapeSmallGeneric(_nativeObject.bg);
      }
      
      public function setNativeInstance(param1:SymbolButtonGuildStatistics) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.bg)
         {
            bg.setNativeInstance(_nativeObject.bg);
         }
      }
   }
}
