package visuals.ui.elements.guild
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundButtonGeneric;
   import visuals.ui.elements.icons.SymbolIconGuildBattleAttackGeneric;
   
   public class SymbolButtonGuildBattleAttackGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolButtonGuildBattleAttack = null;
      
      public var bg:SymbolSlice9BackgroundButtonGeneric = null;
      
      public var caption:ILabel = null;
      
      public var symbolIconGuildBattleAttack:SymbolIconGuildBattleAttackGeneric = null;
      
      public function SymbolButtonGuildBattleAttackGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolButtonGuildBattleAttack;
         }
         else
         {
            _nativeObject = new SymbolButtonGuildBattleAttack();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         bg = new SymbolSlice9BackgroundButtonGeneric(_nativeObject.bg);
         caption = FlashLabel.fromNative(_nativeObject.caption);
         symbolIconGuildBattleAttack = new SymbolIconGuildBattleAttackGeneric(_nativeObject.symbolIconGuildBattleAttack);
      }
      
      public function setNativeInstance(param1:SymbolButtonGuildBattleAttack) : void
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
         if(_nativeObject.symbolIconGuildBattleAttack)
         {
            symbolIconGuildBattleAttack.setNativeInstance(_nativeObject.symbolIconGuildBattleAttack);
         }
      }
   }
}
