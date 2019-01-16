package visuals.ui.elements.guild
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
   import visuals.ui.elements.backgrounds.SymbolBackgroundScalableGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundTooltipGeneric;
   import visuals.ui.elements.buttons.SymbolButtonConfigSmallGeneric;
   import visuals.ui.elements.buttons.SymbolButtonPlusStaticGeneric;
   import visuals.ui.elements.generic.SymbolLocalePickerGeneric;
   import visuals.ui.elements.icons.SymbolIconCheckmarkGeneric;
   import visuals.ui.elements.icons.SymbolIconDeleteGeneric;
   import visuals.ui.elements.icons.SymbolIconGameCurrencyGeneric;
   import visuals.ui.elements.icons.SymbolIconGuildArtifactGeneric;
   import visuals.ui.elements.icons.SymbolIconGuildBattleAutojoinsGeneric;
   import visuals.ui.elements.icons.SymbolIconGuildHonorSmallGeneric;
   import visuals.ui.elements.icons.SymbolIconGuildMissileSmallGeneric;
   import visuals.ui.elements.icons.SymbolIconPremiumCurrencyGeneric;
   
   public class SymbolGuildInfoTabGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolGuildInfoTab = null;
      
      public var symbolSlice9BackgroundTooltip:SymbolSlice9BackgroundTooltipGeneric = null;
      
      public var symbolBackgroundScalable:SymbolBackgroundScalableGeneric = null;
      
      public var txtMemberCount:ILabel = null;
      
      public var txtAcceptMembers:ILabelArea = null;
      
      public var checkAcceptMembers:SymbolUiCheckboxGeneric = null;
      
      public var txtGuildHonor:ILabel = null;
      
      public var txtGuildArtifacts:ILabel = null;
      
      public var iconHonor:SymbolIconGuildHonorSmallGeneric = null;
      
      public var iconArtifact:SymbolIconGuildArtifactGeneric = null;
      
      public var btnApplySettings:SymbolButtonConfigSmallGeneric = null;
      
      public var iconAcceptMembersYes:SymbolIconCheckmarkGeneric = null;
      
      public var iconAcceptMembersNo:SymbolIconDeleteGeneric = null;
      
      public var statBarGuildCapacity:SymbolGuildStatBarGeneric = null;
      
      public var statBarCharacterBaseStatsBoost:SymbolGuildStatBarGeneric = null;
      
      public var statBarQuestXpRewardBoost:SymbolGuildStatBarGeneric = null;
      
      public var statBarQuestWorkGameCurrencyRewardBoost:SymbolGuildStatBarGeneric = null;
      
      public var iconMissiles:SymbolIconGuildMissileSmallGeneric = null;
      
      public var txtMissiles:ILabel = null;
      
      public var btnRechargeMissiles:SymbolButtonPlusStaticGeneric = null;
      
      public var btnMissileSettings:SymbolButtonConfigSmallGeneric = null;
      
      public var txtGuildBattleAutoJoin:ILabel = null;
      
      public var btnRechargeGuildBattleAutoJoins:SymbolButtonPlusStaticGeneric = null;
      
      public var btnGuildBattleAutoJoinSettings:SymbolButtonConfigSmallGeneric = null;
      
      public var iconGuildBattleAutoJoins:SymbolIconGuildBattleAutojoinsGeneric = null;
      
      public var txtCoins:ILabel = null;
      
      public var txtPremiumCurrency:ILabel = null;
      
      public var btnDonate:SymbolButtonPlusStaticGeneric = null;
      
      public var iconCoin:SymbolIconGameCurrencyGeneric = null;
      
      public var iconPremiumCurrency:SymbolIconPremiumCurrencyGeneric = null;
      
      public var btnApply:SymbolButtonGuildApplyGeneric = null;
      
      public var btnStatistics:SymbolButtonGuildStatisticsGeneric = null;
      
      public var btnAttack:SymbolButtonGuildAttackGeneric = null;
      
      public var btnCustomizeStudio:SymbolButtonGuildCustomizeStudioGeneric = null;
      
      public var btnMovies:SymbolButtonGuildMoviesGeneric = null;
      
      public var btnInvite:SymbolButtonGuildInviteGeneric = null;
      
      public var btnJoin:SymbolButtonGuildJoinGeneric = null;
      
      public var localePicker:SymbolLocalePickerGeneric = null;
      
      public function SymbolGuildInfoTabGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolGuildInfoTab;
         }
         else
         {
            _nativeObject = new SymbolGuildInfoTab();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolSlice9BackgroundTooltip = new SymbolSlice9BackgroundTooltipGeneric(_nativeObject.symbolSlice9BackgroundTooltip);
         symbolBackgroundScalable = new SymbolBackgroundScalableGeneric(_nativeObject.symbolBackgroundScalable);
         txtMemberCount = FlashLabel.fromNative(_nativeObject.txtMemberCount);
         txtAcceptMembers = FlashLabelArea.fromNative(_nativeObject.txtAcceptMembers);
         checkAcceptMembers = new SymbolUiCheckboxGeneric(_nativeObject.checkAcceptMembers);
         txtGuildHonor = FlashLabel.fromNative(_nativeObject.txtGuildHonor);
         txtGuildArtifacts = FlashLabel.fromNative(_nativeObject.txtGuildArtifacts);
         iconHonor = new SymbolIconGuildHonorSmallGeneric(_nativeObject.iconHonor);
         iconArtifact = new SymbolIconGuildArtifactGeneric(_nativeObject.iconArtifact);
         btnApplySettings = new SymbolButtonConfigSmallGeneric(_nativeObject.btnApplySettings);
         iconAcceptMembersYes = new SymbolIconCheckmarkGeneric(_nativeObject.iconAcceptMembersYes);
         iconAcceptMembersNo = new SymbolIconDeleteGeneric(_nativeObject.iconAcceptMembersNo);
         statBarGuildCapacity = new SymbolGuildStatBarGeneric(_nativeObject.statBarGuildCapacity);
         statBarCharacterBaseStatsBoost = new SymbolGuildStatBarGeneric(_nativeObject.statBarCharacterBaseStatsBoost);
         statBarQuestXpRewardBoost = new SymbolGuildStatBarGeneric(_nativeObject.statBarQuestXpRewardBoost);
         statBarQuestWorkGameCurrencyRewardBoost = new SymbolGuildStatBarGeneric(_nativeObject.statBarQuestWorkGameCurrencyRewardBoost);
         iconMissiles = new SymbolIconGuildMissileSmallGeneric(_nativeObject.iconMissiles);
         txtMissiles = FlashLabel.fromNative(_nativeObject.txtMissiles);
         btnRechargeMissiles = new SymbolButtonPlusStaticGeneric(_nativeObject.btnRechargeMissiles);
         btnMissileSettings = new SymbolButtonConfigSmallGeneric(_nativeObject.btnMissileSettings);
         txtGuildBattleAutoJoin = FlashLabel.fromNative(_nativeObject.txtGuildBattleAutoJoin);
         btnRechargeGuildBattleAutoJoins = new SymbolButtonPlusStaticGeneric(_nativeObject.btnRechargeGuildBattleAutoJoins);
         btnGuildBattleAutoJoinSettings = new SymbolButtonConfigSmallGeneric(_nativeObject.btnGuildBattleAutoJoinSettings);
         iconGuildBattleAutoJoins = new SymbolIconGuildBattleAutojoinsGeneric(_nativeObject.iconGuildBattleAutoJoins);
         txtCoins = FlashLabel.fromNative(_nativeObject.txtCoins);
         txtPremiumCurrency = FlashLabel.fromNative(_nativeObject.txtPremiumCurrency);
         btnDonate = new SymbolButtonPlusStaticGeneric(_nativeObject.btnDonate);
         iconCoin = new SymbolIconGameCurrencyGeneric(_nativeObject.iconCoin);
         iconPremiumCurrency = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremiumCurrency);
         btnApply = new SymbolButtonGuildApplyGeneric(_nativeObject.btnApply);
         btnStatistics = new SymbolButtonGuildStatisticsGeneric(_nativeObject.btnStatistics);
         btnAttack = new SymbolButtonGuildAttackGeneric(_nativeObject.btnAttack);
         btnCustomizeStudio = new SymbolButtonGuildCustomizeStudioGeneric(_nativeObject.btnCustomizeStudio);
         btnMovies = new SymbolButtonGuildMoviesGeneric(_nativeObject.btnMovies);
         btnInvite = new SymbolButtonGuildInviteGeneric(_nativeObject.btnInvite);
         btnJoin = new SymbolButtonGuildJoinGeneric(_nativeObject.btnJoin);
         localePicker = new SymbolLocalePickerGeneric(_nativeObject.localePicker);
      }
      
      public function setNativeInstance(param1:SymbolGuildInfoTab) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.symbolSlice9BackgroundTooltip)
         {
            symbolSlice9BackgroundTooltip.setNativeInstance(_nativeObject.symbolSlice9BackgroundTooltip);
         }
         if(_nativeObject.symbolBackgroundScalable)
         {
            symbolBackgroundScalable.setNativeInstance(_nativeObject.symbolBackgroundScalable);
         }
         FlashLabel.setNativeInstance(txtMemberCount,_nativeObject.txtMemberCount);
         FlashLabelArea.setNativeInstance(txtAcceptMembers,_nativeObject.txtAcceptMembers);
         if(_nativeObject.checkAcceptMembers)
         {
            checkAcceptMembers.setNativeInstance(_nativeObject.checkAcceptMembers);
         }
         FlashLabel.setNativeInstance(txtGuildHonor,_nativeObject.txtGuildHonor);
         FlashLabel.setNativeInstance(txtGuildArtifacts,_nativeObject.txtGuildArtifacts);
         if(_nativeObject.iconHonor)
         {
            iconHonor.setNativeInstance(_nativeObject.iconHonor);
         }
         if(_nativeObject.iconArtifact)
         {
            iconArtifact.setNativeInstance(_nativeObject.iconArtifact);
         }
         if(_nativeObject.btnApplySettings)
         {
            btnApplySettings.setNativeInstance(_nativeObject.btnApplySettings);
         }
         if(_nativeObject.iconAcceptMembersYes)
         {
            iconAcceptMembersYes.setNativeInstance(_nativeObject.iconAcceptMembersYes);
         }
         if(_nativeObject.iconAcceptMembersNo)
         {
            iconAcceptMembersNo.setNativeInstance(_nativeObject.iconAcceptMembersNo);
         }
         if(_nativeObject.statBarGuildCapacity)
         {
            statBarGuildCapacity.setNativeInstance(_nativeObject.statBarGuildCapacity);
         }
         if(_nativeObject.statBarCharacterBaseStatsBoost)
         {
            statBarCharacterBaseStatsBoost.setNativeInstance(_nativeObject.statBarCharacterBaseStatsBoost);
         }
         if(_nativeObject.statBarQuestXpRewardBoost)
         {
            statBarQuestXpRewardBoost.setNativeInstance(_nativeObject.statBarQuestXpRewardBoost);
         }
         if(_nativeObject.statBarQuestWorkGameCurrencyRewardBoost)
         {
            statBarQuestWorkGameCurrencyRewardBoost.setNativeInstance(_nativeObject.statBarQuestWorkGameCurrencyRewardBoost);
         }
         if(_nativeObject.iconMissiles)
         {
            iconMissiles.setNativeInstance(_nativeObject.iconMissiles);
         }
         FlashLabel.setNativeInstance(txtMissiles,_nativeObject.txtMissiles);
         if(_nativeObject.btnRechargeMissiles)
         {
            btnRechargeMissiles.setNativeInstance(_nativeObject.btnRechargeMissiles);
         }
         if(_nativeObject.btnMissileSettings)
         {
            btnMissileSettings.setNativeInstance(_nativeObject.btnMissileSettings);
         }
         FlashLabel.setNativeInstance(txtGuildBattleAutoJoin,_nativeObject.txtGuildBattleAutoJoin);
         if(_nativeObject.btnRechargeGuildBattleAutoJoins)
         {
            btnRechargeGuildBattleAutoJoins.setNativeInstance(_nativeObject.btnRechargeGuildBattleAutoJoins);
         }
         if(_nativeObject.btnGuildBattleAutoJoinSettings)
         {
            btnGuildBattleAutoJoinSettings.setNativeInstance(_nativeObject.btnGuildBattleAutoJoinSettings);
         }
         if(_nativeObject.iconGuildBattleAutoJoins)
         {
            iconGuildBattleAutoJoins.setNativeInstance(_nativeObject.iconGuildBattleAutoJoins);
         }
         FlashLabel.setNativeInstance(txtCoins,_nativeObject.txtCoins);
         FlashLabel.setNativeInstance(txtPremiumCurrency,_nativeObject.txtPremiumCurrency);
         if(_nativeObject.btnDonate)
         {
            btnDonate.setNativeInstance(_nativeObject.btnDonate);
         }
         if(_nativeObject.iconCoin)
         {
            iconCoin.setNativeInstance(_nativeObject.iconCoin);
         }
         if(_nativeObject.iconPremiumCurrency)
         {
            iconPremiumCurrency.setNativeInstance(_nativeObject.iconPremiumCurrency);
         }
         if(_nativeObject.btnApply)
         {
            btnApply.setNativeInstance(_nativeObject.btnApply);
         }
         if(_nativeObject.btnStatistics)
         {
            btnStatistics.setNativeInstance(_nativeObject.btnStatistics);
         }
         if(_nativeObject.btnAttack)
         {
            btnAttack.setNativeInstance(_nativeObject.btnAttack);
         }
         if(_nativeObject.btnCustomizeStudio)
         {
            btnCustomizeStudio.setNativeInstance(_nativeObject.btnCustomizeStudio);
         }
         if(_nativeObject.btnMovies)
         {
            btnMovies.setNativeInstance(_nativeObject.btnMovies);
         }
         if(_nativeObject.btnInvite)
         {
            btnInvite.setNativeInstance(_nativeObject.btnInvite);
         }
         if(_nativeObject.btnJoin)
         {
            btnJoin.setNativeInstance(_nativeObject.btnJoin);
         }
         if(_nativeObject.localePicker)
         {
            localePicker.setNativeInstance(_nativeObject.localePicker);
         }
      }
   }
}
