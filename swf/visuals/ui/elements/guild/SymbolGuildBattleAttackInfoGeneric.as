package visuals.ui.elements.guild
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.elements.icons.SymbolIconGuildBattleAttackGeneric;
   
   public class SymbolGuildBattleAttackInfoGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolGuildBattleAttackInfo = null;
      
      public var symbolIconGuildBattleAttack:SymbolIconGuildBattleAttackGeneric = null;
      
      public var infoJoinedMembers:ILabelArea = null;
      
      public function SymbolGuildBattleAttackInfoGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolGuildBattleAttackInfo;
         }
         else
         {
            _nativeObject = new SymbolGuildBattleAttackInfo();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolIconGuildBattleAttack = new SymbolIconGuildBattleAttackGeneric(_nativeObject.symbolIconGuildBattleAttack);
         infoJoinedMembers = FlashLabelArea.fromNative(_nativeObject.infoJoinedMembers);
      }
      
      public function setNativeInstance(param1:SymbolGuildBattleAttackInfo) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.symbolIconGuildBattleAttack)
         {
            symbolIconGuildBattleAttack.setNativeInstance(_nativeObject.symbolIconGuildBattleAttack);
         }
         FlashLabelArea.setNativeInstance(infoJoinedMembers,_nativeObject.infoJoinedMembers);
      }
   }
}
