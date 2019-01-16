package visuals.ui.elements.guild
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   
   public class SymbolGuildBattleInfoContentGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolGuildBattleInfoContent = null;
      
      public var guildBattleInfo:SymbolGuildBattleInfoGeneric = null;
      
      public var txtGuildBattleAttack:ILabel = null;
      
      public var txtGuildBattleDefense:ILabel = null;
      
      public var iconGuildBattleAttack:SymbolGuildBattleAttackInfoGeneric = null;
      
      public var iconGuildBattleDefense:SymbolGuildBattleDefenseInfoGeneric = null;
      
      public function SymbolGuildBattleInfoContentGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolGuildBattleInfoContent;
         }
         else
         {
            _nativeObject = new SymbolGuildBattleInfoContent();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         guildBattleInfo = new SymbolGuildBattleInfoGeneric(_nativeObject.guildBattleInfo);
         txtGuildBattleAttack = FlashLabel.fromNative(_nativeObject.txtGuildBattleAttack);
         txtGuildBattleDefense = FlashLabel.fromNative(_nativeObject.txtGuildBattleDefense);
         iconGuildBattleAttack = new SymbolGuildBattleAttackInfoGeneric(_nativeObject.iconGuildBattleAttack);
         iconGuildBattleDefense = new SymbolGuildBattleDefenseInfoGeneric(_nativeObject.iconGuildBattleDefense);
      }
      
      public function setNativeInstance(param1:SymbolGuildBattleInfoContent) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.guildBattleInfo)
         {
            guildBattleInfo.setNativeInstance(_nativeObject.guildBattleInfo);
         }
         FlashLabel.setNativeInstance(txtGuildBattleAttack,_nativeObject.txtGuildBattleAttack);
         FlashLabel.setNativeInstance(txtGuildBattleDefense,_nativeObject.txtGuildBattleDefense);
         if(_nativeObject.iconGuildBattleAttack)
         {
            iconGuildBattleAttack.setNativeInstance(_nativeObject.iconGuildBattleAttack);
         }
         if(_nativeObject.iconGuildBattleDefense)
         {
            iconGuildBattleDefense.setNativeInstance(_nativeObject.iconGuildBattleDefense);
         }
      }
   }
}
