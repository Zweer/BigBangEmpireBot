package com.playata.application.ui.dialogs
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.dataobject.DOGuildCompetition;
   import com.playata.application.data.dataobject.DOTournamentSoloGuildCompetitionReward;
   import com.playata.application.data.guild.GuildCompetition;
   import com.playata.application.data.reward.Reward;
   import com.playata.application.ui.effects.EffectOptions;
   import com.playata.application.ui.effects.EffectsLayer;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogSoloGuildCompetitionRewardGeneric;
   
   public class DialogSoloGuildCompetitionReward extends UiDialog
   {
       
      
      private var _btnClose:UiTextButton = null;
      
      private var _rewardData:DOTournamentSoloGuildCompetitionReward = null;
      
      private var _guildCompetition:GuildCompetition;
      
      private var _reward:Reward = null;
      
      private var _rank:int = 0;
      
      private var _score:int = 0;
      
      public function DialogSoloGuildCompetitionReward(param1:DOTournamentSoloGuildCompetitionReward)
      {
         var _loc2_:SymbolDialogSoloGuildCompetitionRewardGeneric = new SymbolDialogSoloGuildCompetitionRewardGeneric();
         super(_loc2_);
         _queued = false;
         _loc2_.txtFlavor.autoFontSize = true;
         _rewardData = param1;
         if(_rewardData.hasData("identifier",true))
         {
            _guildCompetition = new GuildCompetition(new DOGuildCompetition({"identifier":_rewardData.getString("identifier")}));
         }
         var _loc3_:TypedObject = _rewardData.getTypedObjectFromJson("rewards");
         if(_loc3_.hasData("reward",true))
         {
            _reward = new Reward(_loc3_.getString("reward"));
         }
         _rank = _loc3_.getInt("rank");
         _score = _loc3_.getInt("value");
         _loc2_.txtDialogTitle.text = LocText.current.text("dialog/guild_competition_reward/title");
         _btnClose = new UiTextButton(_loc2_.btnClose,LocText.current.text("dialog/solo_guild_competition_reward/button_close"),"",onClickClose);
         _vo.addChild(_btnClose);
         refresh();
      }
      
      override public function dispose() : void
      {
         if(_btnClose == null)
         {
            return;
         }
         _vo.removeChild(_btnClose);
         _btnClose.dispose();
         _btnClose = null;
         _reward = null;
         _rewardData = null;
         super.dispose();
      }
      
      private function refresh() : void
      {
         var _loc1_:* = null;
         var _loc3_:int = 0;
         var _loc2_:SymbolDialogSoloGuildCompetitionRewardGeneric = _vo as SymbolDialogSoloGuildCompetitionRewardGeneric;
         if(_guildCompetition)
         {
            _loc1_ = _guildCompetition.descriptionText;
            _loc3_ = _loc1_.indexOf("\n\n");
            if(_loc3_ >= 0)
            {
               _loc1_ = _loc1_.substr(0,_loc3_);
            }
            _loc2_.txtFlavor.text = _loc1_;
            _loc2_.txtFlavor.autoFontSize = true;
            _loc2_.npc.setUriSprite(_guildCompetition.npcImageUrl,348,670,true);
         }
         _loc2_.txtDesciptionScore.text = LocText.current.text("dialog/solo_guild_competition_reward/description_score");
         _loc2_.scoreInfo.txtInfo.htmlText = LocText.current.text("dialog/solo_guild_competition_reward/score_info",_score);
         _loc2_.txtDesciptionRank.text = LocText.current.text("dialog/solo_guild_competition_reward/rank_info",_rank);
         _loc2_.txtRewardsCaption.text = LocText.current.text("dialog/solo_guild_competition_reward/reward_caption");
         if(_reward && _reward.statPoints > 0)
         {
            _loc2_.txtNoRewards.visible = false;
            _loc2_.txtStatPoints.text = GameUtil.getStatPointString(_reward.statPoints);
         }
         else
         {
            _loc2_.iconStatPoints.visible = false;
            _loc2_.txtStatPoints.visible = false;
            _loc2_.txtNoRewards.text = LocText.current.text("dialog/solo_guild_competition_reward/no_rewards",300);
         }
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("claimSoloGuildCompetitionTournamentReward" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            showRewardEffect();
            close();
            Environment.panelManager.showDialog(new DialogLeaderboard());
         }
         else if(param1.error == "errClaimSoloGuildCompetitionTournamentRewardsNoRewards")
         {
            close();
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         if(_btnClose && _btnClose.enabled)
         {
            Environment.application.sendActionRequest("claimSoloGuildCompetitionTournamentReward",{},handleRequests);
         }
         _btnClose.enabled = false;
      }
      
      private function showRewardEffect() : void
      {
         var _loc1_:SymbolDialogSoloGuildCompetitionRewardGeneric = _vo as SymbolDialogSoloGuildCompetitionRewardGeneric;
         if(_loc1_.iconStatPoints.visible)
         {
            EffectsLayer.instance.show(7,EffectOptions.fromData({
               "emitter":_loc1_.iconStatPoints,
               "amount":_reward.statPoints
            }));
         }
      }
   }
}
