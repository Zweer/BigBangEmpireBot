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
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.guild.SymbolGuildBattleAutoJoinsPackageGeneric;
   import visuals.ui.elements.icons.SymbolIconGuildAutoJoinBigGeneric;
   
   public class SymbolDialogGuildRechargeGuildBattleAutoJoinsGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogGuildRechargeGuildBattleAutoJoins = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var iconMissiles:SymbolIconGuildAutoJoinBigGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var txtInfo:ILabelArea = null;
      
      public var package2:SymbolGuildBattleAutoJoinsPackageGeneric = null;
      
      public var package3:SymbolGuildBattleAutoJoinsPackageGeneric = null;
      
      public var package1:SymbolGuildBattleAutoJoinsPackageGeneric = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public function SymbolDialogGuildRechargeGuildBattleAutoJoinsGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogGuildRechargeGuildBattleAutoJoins;
         }
         else
         {
            _nativeObject = new SymbolDialogGuildRechargeGuildBattleAutoJoins();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         iconMissiles = new SymbolIconGuildAutoJoinBigGeneric(_nativeObject.iconMissiles);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         txtInfo = FlashLabelArea.fromNative(_nativeObject.txtInfo);
         package2 = new SymbolGuildBattleAutoJoinsPackageGeneric(_nativeObject.package2);
         package3 = new SymbolGuildBattleAutoJoinsPackageGeneric(_nativeObject.package3);
         package1 = new SymbolGuildBattleAutoJoinsPackageGeneric(_nativeObject.package1);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
      }
      
      public function setNativeInstance(param1:SymbolDialogGuildRechargeGuildBattleAutoJoins) : void
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
         if(_nativeObject.iconMissiles)
         {
            iconMissiles.setNativeInstance(_nativeObject.iconMissiles);
         }
         FlashLabel.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         FlashLabelArea.setNativeInstance(txtInfo,_nativeObject.txtInfo);
         if(_nativeObject.package2)
         {
            package2.setNativeInstance(_nativeObject.package2);
         }
         if(_nativeObject.package3)
         {
            package3.setNativeInstance(_nativeObject.package3);
         }
         if(_nativeObject.package1)
         {
            package1.setNativeInstance(_nativeObject.package1);
         }
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
      }
   }
}
