package visuals.ui.elements.guild_competition
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolButtonGuildCompetitionHighlightGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolButtonGuildCompetitionHighlight = null;
      
      public function SymbolButtonGuildCompetitionHighlightGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolButtonGuildCompetitionHighlight;
         }
         else
         {
            _nativeObject = new SymbolButtonGuildCompetitionHighlight();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
      }
      
      public function setNativeInstance(param1:SymbolButtonGuildCompetitionHighlight) : void
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
