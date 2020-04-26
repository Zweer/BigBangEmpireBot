package visuals.ui.dialogs
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolUiCheckboxGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.icons.SymbolIconGuildAutoJoinBigGeneric;
   import visuals.ui.elements.icons.SymbolIconGuildBattleAttackGeneric;
   import visuals.ui.elements.icons.SymbolIconGuildBattleDefenseGeneric;
   
   public class SymbolDialogGuildBattleAutoJoinSettingsGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogGuildBattleAutoJoinSettings = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var txtDefense:ILabelArea = null;
      
      public var checkAttack:SymbolUiCheckboxGeneric = null;
      
      public var checkDefense:SymbolUiCheckboxGeneric = null;
      
      public var txtAttack:ILabelArea = null;
      
      public var txtInfo:ILabelArea = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public var symbolIconGuildBattleAttack:SymbolIconGuildBattleAttackGeneric = null;
      
      public var symbolIconGuildBattleDefense:SymbolIconGuildBattleDefenseGeneric = null;
      
      public var symbolIconGuildAutoJoinBig:SymbolIconGuildAutoJoinBigGeneric = null;
      
      public function SymbolDialogGuildBattleAutoJoinSettingsGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogGuildBattleAutoJoinSettings;
         }
         else
         {
            _nativeObject = new SymbolDialogGuildBattleAutoJoinSettings();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         txtDefense = FlashLabelArea.fromNative(_nativeObject.txtDefense);
         checkAttack = new SymbolUiCheckboxGeneric(_nativeObject.checkAttack);
         checkDefense = new SymbolUiCheckboxGeneric(_nativeObject.checkDefense);
         txtAttack = FlashLabelArea.fromNative(_nativeObject.txtAttack);
         txtInfo = FlashLabelArea.fromNative(_nativeObject.txtInfo);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
         symbolIconGuildBattleAttack = new SymbolIconGuildBattleAttackGeneric(_nativeObject.symbolIconGuildBattleAttack);
         symbolIconGuildBattleDefense = new SymbolIconGuildBattleDefenseGeneric(_nativeObject.symbolIconGuildBattleDefense);
         symbolIconGuildAutoJoinBig = new SymbolIconGuildAutoJoinBigGeneric(_nativeObject.symbolIconGuildAutoJoinBig);
      }
      
      public function setNativeInstance(param1:SymbolDialogGuildBattleAutoJoinSettings) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.dialogBackground)
         {
            dialogBackground.setNativeInstance(_nativeObject.dialogBackground);
         }
         FlashLabelArea.setNativeInstance(txtDefense,_nativeObject.txtDefense);
         if(_nativeObject.checkAttack)
         {
            checkAttack.setNativeInstance(_nativeObject.checkAttack);
         }
         if(_nativeObject.checkDefense)
         {
            checkDefense.setNativeInstance(_nativeObject.checkDefense);
         }
         FlashLabelArea.setNativeInstance(txtAttack,_nativeObject.txtAttack);
         FlashLabelArea.setNativeInstance(txtInfo,_nativeObject.txtInfo);
         FlashLabel.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         if(_nativeObject.symbolIconGuildBattleAttack)
         {
            symbolIconGuildBattleAttack.setNativeInstance(_nativeObject.symbolIconGuildBattleAttack);
         }
         if(_nativeObject.symbolIconGuildBattleDefense)
         {
            symbolIconGuildBattleDefense.setNativeInstance(_nativeObject.symbolIconGuildBattleDefense);
         }
         if(_nativeObject.symbolIconGuildAutoJoinBig)
         {
            symbolIconGuildAutoJoinBig.setNativeInstance(_nativeObject.symbolIconGuildAutoJoinBig);
         }
      }
   }
}
