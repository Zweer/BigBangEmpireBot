package visuals.ui.elements.guild
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.icons.SymbolIconGuildGeneric;
   
   public class SymbolButtonGuildBattleHistoryGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolButtonGuildBattleHistory = null;
      
      public var symbolIconGuild:SymbolIconGuildGeneric = null;
      
      public function SymbolButtonGuildBattleHistoryGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolButtonGuildBattleHistory;
         }
         else
         {
            _nativeObject = new SymbolButtonGuildBattleHistory();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolIconGuild = new SymbolIconGuildGeneric(_nativeObject.symbolIconGuild);
      }
      
      public function setNativeInstance(param1:SymbolButtonGuildBattleHistory) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.symbolIconGuild)
         {
            symbolIconGuild.setNativeInstance(_nativeObject.symbolIconGuild);
         }
      }
   }
}
