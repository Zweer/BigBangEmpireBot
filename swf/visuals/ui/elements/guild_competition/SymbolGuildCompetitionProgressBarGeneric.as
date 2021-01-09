package visuals.ui.elements.guild_competition
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   
   public class SymbolGuildCompetitionProgressBarGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolGuildCompetitionProgressBar = null;
      
      public var fill:SymbolGuildCompetitionProgressBarFillGeneric = null;
      
      public var m:SymbolDummyGeneric = null;
      
      public function SymbolGuildCompetitionProgressBarGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolGuildCompetitionProgressBar;
         }
         else
         {
            _nativeObject = new SymbolGuildCompetitionProgressBar();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         fill = new SymbolGuildCompetitionProgressBarFillGeneric(_nativeObject.fill);
         m = new SymbolDummyGeneric(_nativeObject.m);
      }
      
      public function setNativeInstance(param1:SymbolGuildCompetitionProgressBar) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
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
