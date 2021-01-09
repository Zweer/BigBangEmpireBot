package visuals.ui.elements.guild
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.elements.icons.SymbolIconGuildBattleDefenseGeneric;
   
   public class SymbolGuildBattleDefenseInfoGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolGuildBattleDefenseInfo = null;
      
      public var symbolIconGuildBattleDefense:SymbolIconGuildBattleDefenseGeneric = null;
      
      public var infoJoinedMembers:ILabelArea = null;
      
      public function SymbolGuildBattleDefenseInfoGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolGuildBattleDefenseInfo;
         }
         else
         {
            _nativeObject = new SymbolGuildBattleDefenseInfo();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolIconGuildBattleDefense = new SymbolIconGuildBattleDefenseGeneric(_nativeObject.symbolIconGuildBattleDefense);
         infoJoinedMembers = FlashLabelArea.fromNative(_nativeObject.infoJoinedMembers);
      }
      
      public function setNativeInstance(param1:SymbolGuildBattleDefenseInfo) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.symbolIconGuildBattleDefense)
         {
            symbolIconGuildBattleDefense.setNativeInstance(_nativeObject.symbolIconGuildBattleDefense);
         }
         FlashLabelArea.setNativeInstance(infoJoinedMembers,_nativeObject.infoJoinedMembers);
      }
   }
}
