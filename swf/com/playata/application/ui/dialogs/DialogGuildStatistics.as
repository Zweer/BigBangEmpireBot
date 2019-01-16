package com.playata.application.ui.dialogs
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.guild.Guild;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.guild.UiArtifactButton;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogGuildStatisticsGeneric;
   
   public class DialogGuildStatistics extends UiDialog
   {
       
      
      private var _guild:Guild = null;
      
      private var _btnClose:UiButton = null;
      
      private var _artifact1:UiArtifactButton = null;
      
      private var _artifact2:UiArtifactButton = null;
      
      private var _artifact3:UiArtifactButton = null;
      
      private var _artifact4:UiArtifactButton = null;
      
      private var _artifact5:UiArtifactButton = null;
      
      public function DialogGuildStatistics(param1:Guild)
      {
         _guild = param1;
         var _loc2_:SymbolDialogGuildStatisticsGeneric = new SymbolDialogGuildStatisticsGeneric();
         super(_loc2_);
         _queued = false;
         _loc2_.txtDialogTitle.text = LocText.current.text("dialog/guild_statistics/title");
         _loc2_.txtFounded.text = LocText.current.text("dialog/guild_statistics/founded",_guild.foundationDateString);
         _loc2_.txtMemberCount.text = LocText.current.text("dialog/guild_statistics/member_count",GameUtil.getGuildMemberCountString(_guild.memberCount));
         _loc2_.txtLevelAverage.text = LocText.current.text("dialog/guild_statistics/level_average",_guild.averageLevel);
         _loc2_.txtStrengthAverage.text = LocText.current.text("dialog/guild_statistics/brawn_average",LocText.current.formatHugeNumber(_guild.averageStamina));
         _loc2_.txtStaminaAverage.text = LocText.current.text("dialog/guild_statistics/toughness_average",LocText.current.formatHugeNumber(_guild.averageStrength));
         _loc2_.txtCriticalRatingAverage.text = LocText.current.text("dialog/guild_statistics/brain_average",LocText.current.formatHugeNumber(_guild.averageCriticalRating));
         _loc2_.txtDodgeRatingAverage.text = LocText.current.text("dialog/guild_statistics/awareness_average",LocText.current.formatHugeNumber(_guild.averageDodgeRating));
         _loc2_.txtTotalPercentage.text = LocText.current.text("dialog/guild_statistics/total_percentage",_guild.totalImprovementPercentageString);
         _loc2_.txtGuildBattleCount.text = LocText.current.text("dialog/guild_statistics/guild_battle_count",GameUtil.getGuildBattleCountString(_guild.battlesFought));
         _loc2_.txtGuildBattleAttackCount.text = LocText.current.text("dialog/guild_statistics/guild_battle_attack_count",_guild.battlesAttacked);
         _loc2_.txtGuildBattleDefenseCount.text = LocText.current.text("dialog/guild_statistics/guild_battle_defense_count",_guild.battlesDefended);
         _loc2_.txtGuildBattleWonCount.text = LocText.current.text("dialog/guild_statistics/guild_battle_count_format",LocText.current.text("dialog/guild_statistics/guild_battle_won_count",_guild.battlesWon),_guild.battlesFought == 0?0:Number(Math.round(_guild.battlesWon / _guild.battlesFought * 100)));
         _loc2_.txtGuildBattleLostCount.text = LocText.current.text("dialog/guild_statistics/guild_battle_count_format",LocText.current.text("dialog/guild_statistics/guild_battle_lost_count",_guild.battlesLost),_guild.battlesFought == 0?0:Number(Math.round(_guild.battlesLost / _guild.battlesFought * 100)));
         _loc2_.txtMovies.text = LocText.current.text("dialog/guild_statistics/movies",_guild.movies);
         _loc2_.txtFans.text = LocText.current.text("dialog/guild_statistics/fans",_guild.fans);
         _loc2_.txtMissilesFiredCount.text = LocText.current.text("dialog/guild_statistics/guild_missiles_fired_count",_guild.missilesFired);
         _loc2_.txtAutoJoinsUsedCount.text = LocText.current.text("dialog/guild_statistics/guild_auto_joins_used_count",_guild.autoJoinsUsed);
         _loc2_.txtArtifactOwnCount.text = LocText.current.text("dialog/guild_statistics/guild_artifact_own_count",GameUtil.getArtifactString(_guild.artifactsOwnedCurrent));
         _loc2_.txtArtifactMaxOwnedCount.text = LocText.current.text("dialog/guild_statistics/guild_artifact_max_owned_count",_guild.artifactsOwnedMax);
         _loc2_.txtArtifactWonCount.text = LocText.current.text("dialog/guild_statistics/guild_artifact_won_count",_guild.artifactsWon);
         _loc2_.txtArtifactLostCount.text = LocText.current.text("dialog/guild_statistics/guild_artifact_lost_count",_guild.artifactsLost);
         _artifact1 = new UiArtifactButton(_loc2_.artifact1,1,_guild,onClickArtifact);
         _artifact2 = new UiArtifactButton(_loc2_.artifact2,2,_guild,onClickArtifact);
         _artifact3 = new UiArtifactButton(_loc2_.artifact3,3,_guild,onClickArtifact);
         _artifact4 = new UiArtifactButton(_loc2_.artifact4,4,_guild,onClickArtifact);
         _artifact5 = new UiArtifactButton(_loc2_.artifact5,5,_guild,onClickArtifact);
         _btnClose = new UiButton(_loc2_.btnClose,"",onClickClose);
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         _artifact1.dispose();
         _artifact1 = null;
         _artifact2.dispose();
         _artifact2 = null;
         _artifact3.dispose();
         _artifact3 = null;
         _artifact4.dispose();
         _artifact4 = null;
         _artifact5.dispose();
         _artifact5 = null;
         super.dispose();
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function onClickArtifact(param1:InteractionEvent) : void
      {
         if(!(param1.target as UiArtifactButton).allowClick)
         {
            return;
         }
         panelManager.showDialog(new DialogReleaseArtifact(_guild.getArtifact((param1.target as UiArtifactButton).index - 1),_guild));
         close();
      }
      
      override public function onEscape() : void
      {
         close();
      }
   }
}
