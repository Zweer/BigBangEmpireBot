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
   import visuals.ui.base.SymbolUiButtonDefaultGeneric;
   import visuals.ui.elements.backgrounds.SymbolBackgroundScalableGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.icons.SymbolIconXpGeneric;
   
   public class SymbolDialogGlobalTournamentResultGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogGlobalTournamentResult = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var btnClose:SymbolUiButtonDefaultGeneric = null;
      
      public var bonusBackground:SymbolBackgroundScalableGeneric = null;
      
      public var bonusBackground2:SymbolBackgroundScalableGeneric = null;
      
      public var iconXp:SymbolIconXpGeneric = null;
      
      public var txtXPValue:ILabel = null;
      
      public var txtTournamentCaption:ILabelArea = null;
      
      public var txtRank:ILabelArea = null;
      
      public var txtRewardCaption:ILabelArea = null;
      
      public var txtFights:ILabelArea = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var txtInfo:ILabelArea = null;
      
      public function SymbolDialogGlobalTournamentResultGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogGlobalTournamentResult;
         }
         else
         {
            _nativeObject = new SymbolDialogGlobalTournamentResult();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         btnClose = new SymbolUiButtonDefaultGeneric(_nativeObject.btnClose);
         bonusBackground = new SymbolBackgroundScalableGeneric(_nativeObject.bonusBackground);
         bonusBackground2 = new SymbolBackgroundScalableGeneric(_nativeObject.bonusBackground2);
         iconXp = new SymbolIconXpGeneric(_nativeObject.iconXp);
         txtXPValue = FlashLabel.fromNative(_nativeObject.txtXPValue);
         txtTournamentCaption = FlashLabelArea.fromNative(_nativeObject.txtTournamentCaption);
         txtRank = FlashLabelArea.fromNative(_nativeObject.txtRank);
         txtRewardCaption = FlashLabelArea.fromNative(_nativeObject.txtRewardCaption);
         txtFights = FlashLabelArea.fromNative(_nativeObject.txtFights);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         txtInfo = FlashLabelArea.fromNative(_nativeObject.txtInfo);
      }
      
      public function setNativeInstance(param1:SymbolDialogGlobalTournamentResult) : void
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
         if(_nativeObject.bonusBackground)
         {
            bonusBackground.setNativeInstance(_nativeObject.bonusBackground);
         }
         if(_nativeObject.bonusBackground2)
         {
            bonusBackground2.setNativeInstance(_nativeObject.bonusBackground2);
         }
         if(_nativeObject.iconXp)
         {
            iconXp.setNativeInstance(_nativeObject.iconXp);
         }
         FlashLabel.setNativeInstance(txtXPValue,_nativeObject.txtXPValue);
         FlashLabelArea.setNativeInstance(txtTournamentCaption,_nativeObject.txtTournamentCaption);
         FlashLabelArea.setNativeInstance(txtRank,_nativeObject.txtRank);
         FlashLabelArea.setNativeInstance(txtRewardCaption,_nativeObject.txtRewardCaption);
         FlashLabelArea.setNativeInstance(txtFights,_nativeObject.txtFights);
         FlashLabel.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         FlashLabelArea.setNativeInstance(txtInfo,_nativeObject.txtInfo);
      }
   }
}
