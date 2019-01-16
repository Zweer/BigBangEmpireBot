package visuals.ui.elements.guild
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundButtonGeneric;
   import visuals.ui.elements.icons.SymbolIconGuildBattleDefenseGeneric;
   
   public class SymbolButtonGuildBattleDefendGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolButtonGuildBattleDefend = null;
      
      public var bg:SymbolSlice9BackgroundButtonGeneric = null;
      
      public var caption:ILabel = null;
      
      public var symbolIconGuildBattleDefense:SymbolIconGuildBattleDefenseGeneric = null;
      
      public function SymbolButtonGuildBattleDefendGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolButtonGuildBattleDefend;
         }
         else
         {
            _nativeObject = new SymbolButtonGuildBattleDefend();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         bg = new SymbolSlice9BackgroundButtonGeneric(_nativeObject.bg);
         caption = FlashLabel.fromNative(_nativeObject.caption);
         symbolIconGuildBattleDefense = new SymbolIconGuildBattleDefenseGeneric(_nativeObject.symbolIconGuildBattleDefense);
      }
      
      public function setNativeInstance(param1:SymbolButtonGuildBattleDefend) : void
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
         FlashLabel.setNativeInstance(caption,_nativeObject.caption);
         if(_nativeObject.symbolIconGuildBattleDefense)
         {
            symbolIconGuildBattleDefense.setNativeInstance(_nativeObject.symbolIconGuildBattleDefense);
         }
      }
   }
}
