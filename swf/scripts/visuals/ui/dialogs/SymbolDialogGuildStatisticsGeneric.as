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
   import visuals.ui.elements.guild.SymbolButtonArtifactGeneric;
   import visuals.ui.elements.icons.SymbolIconCriticalHitRatingMediumGeneric;
   import visuals.ui.elements.icons.SymbolIconDodgeRatingMediumGeneric;
   import visuals.ui.elements.icons.SymbolIconDurationGeneric;
   import visuals.ui.elements.icons.SymbolIconGuildMemberGeneric;
   import visuals.ui.elements.icons.SymbolIconLevelStarGeneric;
   import visuals.ui.elements.icons.SymbolIconStaminaMediumGeneric;
   import visuals.ui.elements.icons.SymbolIconStrengthMediumGeneric;
   
   public class SymbolDialogGuildStatisticsGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogGuildStatistics = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var txtFounded:ILabelArea = null;
      
      public var txtMemberCount:ILabelArea = null;
      
      public var txtTotalPercentage:ILabelArea = null;
      
      public var txtGuildBattleCount:ILabelArea = null;
      
      public var iconLevel:SymbolIconDurationGeneric = null;
      
      public var symbolIconGuildMember:SymbolIconGuildMemberGeneric = null;
      
      public var txtGuildBattleAttackCount:ILabelArea = null;
      
      public var txtGuildBattleDefenseCount:ILabelArea = null;
      
      public var txtGuildBattleWonCount:ILabelArea = null;
      
      public var txtGuildBattleLostCount:ILabelArea = null;
      
      public var txtArtifactOwnCount:ILabelArea = null;
      
      public var txtArtifactMaxOwnedCount:ILabelArea = null;
      
      public var txtArtifactWonCount:ILabelArea = null;
      
      public var txtArtifactLostCount:ILabelArea = null;
      
      public var txtMissilesFiredCount:ILabelArea = null;
      
      public var txtLevelAverage:ILabelArea = null;
      
      public var symbolIconLevelStar:SymbolIconLevelStarGeneric = null;
      
      public var txtAutoJoinsUsedCount:ILabelArea = null;
      
      public var txtStaminaAverage:ILabelArea = null;
      
      public var txtStrengthAverage:ILabelArea = null;
      
      public var txtDodgeRatingAverage:ILabelArea = null;
      
      public var txtCriticalRatingAverage:ILabelArea = null;
      
      public var iconStaminaAverage:SymbolIconStaminaMediumGeneric = null;
      
      public var iconStrengthAverage:SymbolIconStrengthMediumGeneric = null;
      
      public var iconCriticalRatingAverage:SymbolIconCriticalHitRatingMediumGeneric = null;
      
      public var iconDodgeRatingAverage:SymbolIconDodgeRatingMediumGeneric = null;
      
      public var artifact1:SymbolButtonArtifactGeneric = null;
      
      public var txtMovies:ILabelArea = null;
      
      public var txtFans:ILabelArea = null;
      
      public var artifact3:SymbolButtonArtifactGeneric = null;
      
      public var artifact4:SymbolButtonArtifactGeneric = null;
      
      public var artifact5:SymbolButtonArtifactGeneric = null;
      
      public var artifact2:SymbolButtonArtifactGeneric = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public function SymbolDialogGuildStatisticsGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogGuildStatistics;
         }
         else
         {
            _nativeObject = new SymbolDialogGuildStatistics();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         txtFounded = FlashLabelArea.fromNative(_nativeObject.txtFounded);
         txtMemberCount = FlashLabelArea.fromNative(_nativeObject.txtMemberCount);
         txtTotalPercentage = FlashLabelArea.fromNative(_nativeObject.txtTotalPercentage);
         txtGuildBattleCount = FlashLabelArea.fromNative(_nativeObject.txtGuildBattleCount);
         iconLevel = new SymbolIconDurationGeneric(_nativeObject.iconLevel);
         symbolIconGuildMember = new SymbolIconGuildMemberGeneric(_nativeObject.symbolIconGuildMember);
         txtGuildBattleAttackCount = FlashLabelArea.fromNative(_nativeObject.txtGuildBattleAttackCount);
         txtGuildBattleDefenseCount = FlashLabelArea.fromNative(_nativeObject.txtGuildBattleDefenseCount);
         txtGuildBattleWonCount = FlashLabelArea.fromNative(_nativeObject.txtGuildBattleWonCount);
         txtGuildBattleLostCount = FlashLabelArea.fromNative(_nativeObject.txtGuildBattleLostCount);
         txtArtifactOwnCount = FlashLabelArea.fromNative(_nativeObject.txtArtifactOwnCount);
         txtArtifactMaxOwnedCount = FlashLabelArea.fromNative(_nativeObject.txtArtifactMaxOwnedCount);
         txtArtifactWonCount = FlashLabelArea.fromNative(_nativeObject.txtArtifactWonCount);
         txtArtifactLostCount = FlashLabelArea.fromNative(_nativeObject.txtArtifactLostCount);
         txtMissilesFiredCount = FlashLabelArea.fromNative(_nativeObject.txtMissilesFiredCount);
         txtLevelAverage = FlashLabelArea.fromNative(_nativeObject.txtLevelAverage);
         symbolIconLevelStar = new SymbolIconLevelStarGeneric(_nativeObject.symbolIconLevelStar);
         txtAutoJoinsUsedCount = FlashLabelArea.fromNative(_nativeObject.txtAutoJoinsUsedCount);
         txtStaminaAverage = FlashLabelArea.fromNative(_nativeObject.txtStaminaAverage);
         txtStrengthAverage = FlashLabelArea.fromNative(_nativeObject.txtStrengthAverage);
         txtDodgeRatingAverage = FlashLabelArea.fromNative(_nativeObject.txtDodgeRatingAverage);
         txtCriticalRatingAverage = FlashLabelArea.fromNative(_nativeObject.txtCriticalRatingAverage);
         iconStaminaAverage = new SymbolIconStaminaMediumGeneric(_nativeObject.iconStaminaAverage);
         iconStrengthAverage = new SymbolIconStrengthMediumGeneric(_nativeObject.iconStrengthAverage);
         iconCriticalRatingAverage = new SymbolIconCriticalHitRatingMediumGeneric(_nativeObject.iconCriticalRatingAverage);
         iconDodgeRatingAverage = new SymbolIconDodgeRatingMediumGeneric(_nativeObject.iconDodgeRatingAverage);
         artifact1 = new SymbolButtonArtifactGeneric(_nativeObject.artifact1);
         txtMovies = FlashLabelArea.fromNative(_nativeObject.txtMovies);
         txtFans = FlashLabelArea.fromNative(_nativeObject.txtFans);
         artifact3 = new SymbolButtonArtifactGeneric(_nativeObject.artifact3);
         artifact4 = new SymbolButtonArtifactGeneric(_nativeObject.artifact4);
         artifact5 = new SymbolButtonArtifactGeneric(_nativeObject.artifact5);
         artifact2 = new SymbolButtonArtifactGeneric(_nativeObject.artifact2);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
      }
      
      public function setNativeInstance(param1:SymbolDialogGuildStatistics) : void
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
         FlashLabel.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         FlashLabelArea.setNativeInstance(txtFounded,_nativeObject.txtFounded);
         FlashLabelArea.setNativeInstance(txtMemberCount,_nativeObject.txtMemberCount);
         FlashLabelArea.setNativeInstance(txtTotalPercentage,_nativeObject.txtTotalPercentage);
         FlashLabelArea.setNativeInstance(txtGuildBattleCount,_nativeObject.txtGuildBattleCount);
         if(_nativeObject.iconLevel)
         {
            iconLevel.setNativeInstance(_nativeObject.iconLevel);
         }
         if(_nativeObject.symbolIconGuildMember)
         {
            symbolIconGuildMember.setNativeInstance(_nativeObject.symbolIconGuildMember);
         }
         FlashLabelArea.setNativeInstance(txtGuildBattleAttackCount,_nativeObject.txtGuildBattleAttackCount);
         FlashLabelArea.setNativeInstance(txtGuildBattleDefenseCount,_nativeObject.txtGuildBattleDefenseCount);
         FlashLabelArea.setNativeInstance(txtGuildBattleWonCount,_nativeObject.txtGuildBattleWonCount);
         FlashLabelArea.setNativeInstance(txtGuildBattleLostCount,_nativeObject.txtGuildBattleLostCount);
         FlashLabelArea.setNativeInstance(txtArtifactOwnCount,_nativeObject.txtArtifactOwnCount);
         FlashLabelArea.setNativeInstance(txtArtifactMaxOwnedCount,_nativeObject.txtArtifactMaxOwnedCount);
         FlashLabelArea.setNativeInstance(txtArtifactWonCount,_nativeObject.txtArtifactWonCount);
         FlashLabelArea.setNativeInstance(txtArtifactLostCount,_nativeObject.txtArtifactLostCount);
         FlashLabelArea.setNativeInstance(txtMissilesFiredCount,_nativeObject.txtMissilesFiredCount);
         FlashLabelArea.setNativeInstance(txtLevelAverage,_nativeObject.txtLevelAverage);
         if(_nativeObject.symbolIconLevelStar)
         {
            symbolIconLevelStar.setNativeInstance(_nativeObject.symbolIconLevelStar);
         }
         FlashLabelArea.setNativeInstance(txtAutoJoinsUsedCount,_nativeObject.txtAutoJoinsUsedCount);
         FlashLabelArea.setNativeInstance(txtStaminaAverage,_nativeObject.txtStaminaAverage);
         FlashLabelArea.setNativeInstance(txtStrengthAverage,_nativeObject.txtStrengthAverage);
         FlashLabelArea.setNativeInstance(txtDodgeRatingAverage,_nativeObject.txtDodgeRatingAverage);
         FlashLabelArea.setNativeInstance(txtCriticalRatingAverage,_nativeObject.txtCriticalRatingAverage);
         if(_nativeObject.iconStaminaAverage)
         {
            iconStaminaAverage.setNativeInstance(_nativeObject.iconStaminaAverage);
         }
         if(_nativeObject.iconStrengthAverage)
         {
            iconStrengthAverage.setNativeInstance(_nativeObject.iconStrengthAverage);
         }
         if(_nativeObject.iconCriticalRatingAverage)
         {
            iconCriticalRatingAverage.setNativeInstance(_nativeObject.iconCriticalRatingAverage);
         }
         if(_nativeObject.iconDodgeRatingAverage)
         {
            iconDodgeRatingAverage.setNativeInstance(_nativeObject.iconDodgeRatingAverage);
         }
         if(_nativeObject.artifact1)
         {
            artifact1.setNativeInstance(_nativeObject.artifact1);
         }
         FlashLabelArea.setNativeInstance(txtMovies,_nativeObject.txtMovies);
         FlashLabelArea.setNativeInstance(txtFans,_nativeObject.txtFans);
         if(_nativeObject.artifact3)
         {
            artifact3.setNativeInstance(_nativeObject.artifact3);
         }
         if(_nativeObject.artifact4)
         {
            artifact4.setNativeInstance(_nativeObject.artifact4);
         }
         if(_nativeObject.artifact5)
         {
            artifact5.setNativeInstance(_nativeObject.artifact5);
         }
         if(_nativeObject.artifact2)
         {
            artifact2.setNativeInstance(_nativeObject.artifact2);
         }
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
      }
   }
}
