package visuals.ui.elements.guild_competition
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.generic.SymbolCounterGeneric;
   
   public class SymbolButtonGuildCompetitionGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolButtonGuildCompetition = null;
      
      public var symbolIconGuildCompetition:SymbolIconGuildCompetitionGeneric = null;
      
      public var highlight:SymbolButtonGuildCompetitionHighlightGeneric = null;
      
      public var info:SymbolCounterGeneric = null;
      
      public function SymbolButtonGuildCompetitionGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolButtonGuildCompetition;
         }
         else
         {
            _nativeObject = new SymbolButtonGuildCompetition();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolIconGuildCompetition = new SymbolIconGuildCompetitionGeneric(_nativeObject.symbolIconGuildCompetition);
         highlight = new SymbolButtonGuildCompetitionHighlightGeneric(_nativeObject.highlight);
         info = new SymbolCounterGeneric(_nativeObject.info);
      }
      
      public function setNativeInstance(param1:SymbolButtonGuildCompetition) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.symbolIconGuildCompetition)
         {
            symbolIconGuildCompetition.setNativeInstance(_nativeObject.symbolIconGuildCompetition);
         }
         if(_nativeObject.highlight)
         {
            highlight.setNativeInstance(_nativeObject.highlight);
         }
         if(_nativeObject.info)
         {
            info.setNativeInstance(_nativeObject.info);
         }
      }
   }
}
