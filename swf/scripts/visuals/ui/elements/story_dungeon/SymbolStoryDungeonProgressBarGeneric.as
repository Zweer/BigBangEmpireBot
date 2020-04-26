package visuals.ui.elements.story_dungeon
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundTooltipGeneric;
   import visuals.ui.elements.dating.SymbolDatingBarMaskGeneric;
   
   public class SymbolStoryDungeonProgressBarGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolStoryDungeonProgressBar = null;
      
      public var symbolSlice9BackgroundTooltip:SymbolSlice9BackgroundTooltipGeneric = null;
      
      public var fill:SymbolStoryDungeonBarFillGeneric = null;
      
      public var m:SymbolDatingBarMaskGeneric = null;
      
      public function SymbolStoryDungeonProgressBarGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolStoryDungeonProgressBar;
         }
         else
         {
            _nativeObject = new SymbolStoryDungeonProgressBar();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolSlice9BackgroundTooltip = new SymbolSlice9BackgroundTooltipGeneric(_nativeObject.symbolSlice9BackgroundTooltip);
         fill = new SymbolStoryDungeonBarFillGeneric(_nativeObject.fill);
         m = new SymbolDatingBarMaskGeneric(_nativeObject.m);
      }
      
      public function setNativeInstance(param1:SymbolStoryDungeonProgressBar) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.symbolSlice9BackgroundTooltip)
         {
            symbolSlice9BackgroundTooltip.setNativeInstance(_nativeObject.symbolSlice9BackgroundTooltip);
         }
         if(_nativeObject.fill)
         {
            fill.setNativeInstance(_nativeObject.fill);
         }
         if(_nativeObject.m)
         {
            m.setNativeInstance(_nativeObject.m);
         }
      }
   }
}
