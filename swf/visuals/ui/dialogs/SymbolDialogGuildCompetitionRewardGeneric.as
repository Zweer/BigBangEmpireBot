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
   import visuals.ui.elements.guild_competition.SymbolGuildCompetitionScoreInfoGeneric;
   import visuals.ui.elements.icons.SymbolIconPlusGeneric;
   import visuals.ui.elements.icons.SymbolIconXpGeneric;
   import visuals.ui.elements.item.SymbolItemSlotGeneric;
   
   public class SymbolDialogGuildCompetitionRewardGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogGuildCompetitionReward = null;
      
      public var npc:SymbolPlaceholderGeneric = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var txtDialogTitle:ILabelArea = null;
      
      public var btnClose:SymbolUiButtonDefaultGeneric = null;
      
      public var txtFlavor:ILabelArea = null;
      
      public var txtDesciptionScore:ILabelArea = null;
      
      public var txtDesciptionRank:ILabelArea = null;
      
      public var scoreInfo:SymbolGuildCompetitionScoreInfoGeneric = null;
      
      public var txtNoRewards:ILabelArea = null;
      
      public var txtRewardsCaption:ILabel = null;
      
      public var iconStatPoints:SymbolIconPlusGeneric = null;
      
      public var txtStatPoints:ILabelArea = null;
      
      public var iconXP:SymbolIconXpGeneric = null;
      
      public var txtXP:ILabelArea = null;
      
      public var item:SymbolItemSlotGeneric = null;
      
      public function SymbolDialogGuildCompetitionRewardGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogGuildCompetitionReward;
         }
         else
         {
            _nativeObject = new SymbolDialogGuildCompetitionReward();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         npc = new SymbolPlaceholderGeneric(_nativeObject.npc);
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         txtDialogTitle = FlashLabelArea.fromNative(_nativeObject.txtDialogTitle);
         btnClose = new SymbolUiButtonDefaultGeneric(_nativeObject.btnClose);
         txtFlavor = FlashLabelArea.fromNative(_nativeObject.txtFlavor);
         txtDesciptionScore = FlashLabelArea.fromNative(_nativeObject.txtDesciptionScore);
         txtDesciptionRank = FlashLabelArea.fromNative(_nativeObject.txtDesciptionRank);
         scoreInfo = new SymbolGuildCompetitionScoreInfoGeneric(_nativeObject.scoreInfo);
         txtNoRewards = FlashLabelArea.fromNative(_nativeObject.txtNoRewards);
         txtRewardsCaption = FlashLabel.fromNative(_nativeObject.txtRewardsCaption);
         iconStatPoints = new SymbolIconPlusGeneric(_nativeObject.iconStatPoints);
         txtStatPoints = FlashLabelArea.fromNative(_nativeObject.txtStatPoints);
         iconXP = new SymbolIconXpGeneric(_nativeObject.iconXP);
         txtXP = FlashLabelArea.fromNative(_nativeObject.txtXP);
         item = new SymbolItemSlotGeneric(_nativeObject.item);
      }
      
      public function setNativeInstance(param1:SymbolDialogGuildCompetitionReward) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.npc)
         {
            npc.setNativeInstance(_nativeObject.npc);
         }
         if(_nativeObject.dialogBackground)
         {
            dialogBackground.setNativeInstance(_nativeObject.dialogBackground);
         }
         FlashLabelArea.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         FlashLabelArea.setNativeInstance(txtFlavor,_nativeObject.txtFlavor);
         FlashLabelArea.setNativeInstance(txtDesciptionScore,_nativeObject.txtDesciptionScore);
         FlashLabelArea.setNativeInstance(txtDesciptionRank,_nativeObject.txtDesciptionRank);
         if(_nativeObject.scoreInfo)
         {
            scoreInfo.setNativeInstance(_nativeObject.scoreInfo);
         }
         FlashLabelArea.setNativeInstance(txtNoRewards,_nativeObject.txtNoRewards);
         FlashLabel.setNativeInstance(txtRewardsCaption,_nativeObject.txtRewardsCaption);
         if(_nativeObject.iconStatPoints)
         {
            iconStatPoints.setNativeInstance(_nativeObject.iconStatPoints);
         }
         FlashLabelArea.setNativeInstance(txtStatPoints,_nativeObject.txtStatPoints);
         if(_nativeObject.iconXP)
         {
            iconXP.setNativeInstance(_nativeObject.iconXP);
         }
         FlashLabelArea.setNativeInstance(txtXP,_nativeObject.txtXP);
         if(_nativeObject.item)
         {
            item.setNativeInstance(_nativeObject.item);
         }
      }
   }
}
