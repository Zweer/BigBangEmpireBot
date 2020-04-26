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
   import visuals.ui.base.SymbolPlaceholderGeneric;
   import visuals.ui.base.SymbolUiButtonDefaultGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.guild.SymbolGuildBattleArtifactLostCrossGeneric;
   
   public class SymbolDialogGuildBattleArtifactLostGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogGuildBattleArtifactLost = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var btnClose:SymbolUiButtonDefaultGeneric = null;
      
      public var txtDialogTitle:ILabelArea = null;
      
      public var txtArtifactName:ILabel = null;
      
      public var artifact:SymbolPlaceholderGeneric = null;
      
      public var cross:SymbolGuildBattleArtifactLostCrossGeneric = null;
      
      public var txtInfo:ILabelArea = null;
      
      public function SymbolDialogGuildBattleArtifactLostGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogGuildBattleArtifactLost;
         }
         else
         {
            _nativeObject = new SymbolDialogGuildBattleArtifactLost();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         btnClose = new SymbolUiButtonDefaultGeneric(_nativeObject.btnClose);
         txtDialogTitle = FlashLabelArea.fromNative(_nativeObject.txtDialogTitle);
         txtArtifactName = FlashLabel.fromNative(_nativeObject.txtArtifactName);
         artifact = new SymbolPlaceholderGeneric(_nativeObject.artifact);
         cross = new SymbolGuildBattleArtifactLostCrossGeneric(_nativeObject.cross);
         txtInfo = FlashLabelArea.fromNative(_nativeObject.txtInfo);
      }
      
      public function setNativeInstance(param1:SymbolDialogGuildBattleArtifactLost) : void
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
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         FlashLabelArea.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         FlashLabel.setNativeInstance(txtArtifactName,_nativeObject.txtArtifactName);
         if(_nativeObject.artifact)
         {
            artifact.setNativeInstance(_nativeObject.artifact);
         }
         if(_nativeObject.cross)
         {
            cross.setNativeInstance(_nativeObject.cross);
         }
         FlashLabelArea.setNativeInstance(txtInfo,_nativeObject.txtInfo);
      }
   }
}
