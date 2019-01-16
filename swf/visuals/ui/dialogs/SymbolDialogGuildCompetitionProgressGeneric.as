package visuals.ui.dialogs
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolPlaceholderGeneric;
   import visuals.ui.base.SymbolUiButtonDefaultGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.guild.SymbolGuildEmblemGeneric;
   import visuals.ui.elements.guild_competition.SymbolGuildCompetitionProgressBarGeneric;
   import visuals.ui.elements.guild_competition.SymbolGuildCompetitionScoreInfoGeneric;
   import visuals.ui.elements.guild_competition.SymbolIconGuildCompetitionGeneric;
   
   public class SymbolDialogGuildCompetitionProgressGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogGuildCompetitionProgress = null;
      
      public var npc:SymbolPlaceholderGeneric = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var txtDialogTitle:ILabelArea = null;
      
      public var btnClose:SymbolUiButtonDefaultGeneric = null;
      
      public var txtFlavor:ILabelArea = null;
      
      public var txtDesciption:ILabelArea = null;
      
      public var scoreInfo1:SymbolGuildCompetitionScoreInfoGeneric = null;
      
      public var scoreInfo2:SymbolGuildCompetitionScoreInfoGeneric = null;
      
      public var scoreInfo3:SymbolGuildCompetitionScoreInfoGeneric = null;
      
      public var scoreInfo4:SymbolGuildCompetitionScoreInfoGeneric = null;
      
      public var txtNotAllowedInfo:ILabelArea = null;
      
      public var txtTimer:ILabelArea = null;
      
      public var txtRank:ILabelArea = null;
      
      public var txtSameRankBefore:ILabelArea = null;
      
      public var txtSameRankBehinde:ILabelArea = null;
      
      public var txtSameRankEqual:ILabelArea = null;
      
      public var guildEmplem1:SymbolGuildEmblemGeneric = null;
      
      public var guildEmplem2:SymbolGuildEmblemGeneric = null;
      
      public var iconGuildCompetition:SymbolIconGuildCompetitionGeneric = null;
      
      public var progressBar:SymbolGuildCompetitionProgressBarGeneric = null;
      
      public var txtProgress:ILabelArea = null;
      
      public function SymbolDialogGuildCompetitionProgressGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogGuildCompetitionProgress;
         }
         else
         {
            _nativeObject = new SymbolDialogGuildCompetitionProgress();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         npc = new SymbolPlaceholderGeneric(_nativeObject.npc);
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         txtDialogTitle = FlashLabelArea.fromNative(_nativeObject.txtDialogTitle);
         btnClose = new SymbolUiButtonDefaultGeneric(_nativeObject.btnClose);
         txtFlavor = FlashLabelArea.fromNative(_nativeObject.txtFlavor);
         txtDesciption = FlashLabelArea.fromNative(_nativeObject.txtDesciption);
         scoreInfo1 = new SymbolGuildCompetitionScoreInfoGeneric(_nativeObject.scoreInfo1);
         scoreInfo2 = new SymbolGuildCompetitionScoreInfoGeneric(_nativeObject.scoreInfo2);
         scoreInfo3 = new SymbolGuildCompetitionScoreInfoGeneric(_nativeObject.scoreInfo3);
         scoreInfo4 = new SymbolGuildCompetitionScoreInfoGeneric(_nativeObject.scoreInfo4);
         txtNotAllowedInfo = FlashLabelArea.fromNative(_nativeObject.txtNotAllowedInfo);
         txtTimer = FlashLabelArea.fromNative(_nativeObject.txtTimer);
         txtRank = FlashLabelArea.fromNative(_nativeObject.txtRank);
         txtSameRankBefore = FlashLabelArea.fromNative(_nativeObject.txtSameRankBefore);
         txtSameRankBehinde = FlashLabelArea.fromNative(_nativeObject.txtSameRankBehinde);
         txtSameRankEqual = FlashLabelArea.fromNative(_nativeObject.txtSameRankEqual);
         guildEmplem1 = new SymbolGuildEmblemGeneric(_nativeObject.guildEmplem1);
         guildEmplem2 = new SymbolGuildEmblemGeneric(_nativeObject.guildEmplem2);
         iconGuildCompetition = new SymbolIconGuildCompetitionGeneric(_nativeObject.iconGuildCompetition);
         progressBar = new SymbolGuildCompetitionProgressBarGeneric(_nativeObject.progressBar);
         txtProgress = FlashLabelArea.fromNative(_nativeObject.txtProgress);
      }
      
      public function setNativeInstance(param1:SymbolDialogGuildCompetitionProgress) : void
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
         FlashLabelArea.setNativeInstance(txtDesciption,_nativeObject.txtDesciption);
         if(_nativeObject.scoreInfo1)
         {
            scoreInfo1.setNativeInstance(_nativeObject.scoreInfo1);
         }
         if(_nativeObject.scoreInfo2)
         {
            scoreInfo2.setNativeInstance(_nativeObject.scoreInfo2);
         }
         if(_nativeObject.scoreInfo3)
         {
            scoreInfo3.setNativeInstance(_nativeObject.scoreInfo3);
         }
         if(_nativeObject.scoreInfo4)
         {
            scoreInfo4.setNativeInstance(_nativeObject.scoreInfo4);
         }
         FlashLabelArea.setNativeInstance(txtNotAllowedInfo,_nativeObject.txtNotAllowedInfo);
         FlashLabelArea.setNativeInstance(txtTimer,_nativeObject.txtTimer);
         FlashLabelArea.setNativeInstance(txtRank,_nativeObject.txtRank);
         FlashLabelArea.setNativeInstance(txtSameRankBefore,_nativeObject.txtSameRankBefore);
         FlashLabelArea.setNativeInstance(txtSameRankBehinde,_nativeObject.txtSameRankBehinde);
         FlashLabelArea.setNativeInstance(txtSameRankEqual,_nativeObject.txtSameRankEqual);
         if(_nativeObject.guildEmplem1)
         {
            guildEmplem1.setNativeInstance(_nativeObject.guildEmplem1);
         }
         if(_nativeObject.guildEmplem2)
         {
            guildEmplem2.setNativeInstance(_nativeObject.guildEmplem2);
         }
         if(_nativeObject.iconGuildCompetition)
         {
            iconGuildCompetition.setNativeInstance(_nativeObject.iconGuildCompetition);
         }
         if(_nativeObject.progressBar)
         {
            progressBar.setNativeInstance(_nativeObject.progressBar);
         }
         FlashLabelArea.setNativeInstance(txtProgress,_nativeObject.txtProgress);
      }
   }
}
