package com.playata.application.ui.dialogs
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.dataobject.DOGuildCompetition;
   import com.playata.application.data.dataobject.DOTournamentGuildCompetitionReward;
   import com.playata.application.data.guild.GuildCompetition;
   import com.playata.application.data.reward.Reward;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.effects.EffectsLayer;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.dialog.UiTwoChoiceDialog;
   import com.playata.application.ui.elements.item.UiItemSlot;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogGuildCompetitionRewardGeneric;
   
   public class DialogGuildCompetitionReward extends UiDialog
   {
      
      private static var _showing:Boolean = false;
       
      
      private var _btnClose:UiTextButton = null;
      
      private var _rewardData:DOTournamentGuildCompetitionReward = null;
      
      private var _guildCompetition:GuildCompetition;
      
      private var _reward:Reward = null;
      
      private var _rank:int = 0;
      
      private var _score:int = 0;
      
      private var _item:UiItemSlot;
      
      public function DialogGuildCompetitionReward(param1:DOTournamentGuildCompetitionReward)
      {
         _showing = true;
         var _loc2_:SymbolDialogGuildCompetitionRewardGeneric = new SymbolDialogGuildCompetitionRewardGeneric();
         super(_loc2_);
         _queued = false;
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
         _item = new UiItemSlot(_loc2_.item,0);
         _loc2_.txtDialogTitle.text = LocText.current.text("dialog/guild_competition_reward/title");
         _btnClose = new UiTextButton(_loc2_.btnClose,LocText.current.text("dialog/guild_competition_reward/button_close"),"",onClickClose);
         refresh();
      }
      
      public static function get isShowing() : Boolean
      {
         return _showing;
      }
      
      override public function dispose() : void
      {
         if(_btnClose == null)
         {
            return;
         }
         _btnClose.dispose();
         _btnClose = null;
         _reward = null;
         _rewardData = null;
         super.dispose();
      }
      
      private function refresh() : void
      {
         var _loc1_:SymbolDialogGuildCompetitionRewardGeneric = _vo as SymbolDialogGuildCompetitionRewardGeneric;
         if(_guildCompetition)
         {
            _loc1_.txtFlavor.text = _guildCompetition.flavorText;
            _loc1_.txtFlavor.autoFontSize = true;
            _loc1_.npc.setUriSprite(_guildCompetition.npcImageUrl,304,586,true);
         }
         _loc1_.txtDesciptionScore.text = LocText.current.text("dialog/guild_competition_reward/description_score");
         _loc1_.scoreInfo.txtInfo.htmlText = LocText.current.text("dialog/guild_competition_reward/score_info",_score);
         if(_score >= CConstant.guild_competition_min_score)
         {
            _loc1_.txtDesciptionRank.text = LocText.current.text("dialog/guild_competition_reward/description_rank",_rank);
         }
         else
         {
            _loc1_.txtDesciptionRank.text = LocText.current.text("dialog/guild_competition_reward/description_no_rank",LocText.current.formatHugeNumber(CConstant.guild_competition_min_score));
         }
         _loc1_.txtRewardsCaption.text = LocText.current.text("dialog/guild_competition_reward/reward_caption");
         if(_rank <= CConstant.guild_competition_min_rank_reward && _reward)
         {
            _loc1_.txtNoRewards.visible = false;
            _loc1_.txtStatPoints.text = _reward.statPointsString;
            _loc1_.txtXP.text = _reward.xpString;
            if(_reward.itemId > 0)
            {
               _item.item = User.current.character.getItemById(_reward.itemId);
               _loc1_.item.visible = true;
            }
            else
            {
               _loc1_.item.visible = false;
            }
         }
         else
         {
            var _loc2_:Boolean = false;
            _loc1_.iconStatPoints.visible = _loc2_;
            _loc1_.iconXP.visible = _loc2_;
            _loc2_ = false;
            _loc1_.txtStatPoints.visible = _loc2_;
            _loc1_.txtXP.visible = _loc2_;
            _loc1_.item.visible = false;
            _loc1_.txtNoRewards.text = LocText.current.text("dialog/guild_competition_reward/no_rewards",CConstant.guild_competition_min_rank_reward);
         }
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("claimGuildCompetitionTournamentReward" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            _showing = false;
            showRewardEffect(!param1.request.rawData.discard_item);
            close();
         }
         else if(param1.error == "errTournamentLocked")
         {
            _showing = false;
            close();
         }
         else if(param1.error == "errClaimGuildCompetitionTournamentRewardsNoRewards")
         {
            _showing = false;
            close();
         }
         else if(param1.error == "errInventoryNoEmptySlot")
         {
            Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("dialog/no_free_slot/title"),LocText.current.text("dialog/no_free_slot/text",GameUtil.getGameCurrencyString(_item.item.sellPrice)),LocText.current.text("dialog/no_free_slot/button_go_to_shop"),LocText.current.text("dialog/no_free_slot/button_discard_item"),onClickGotoShop,onClickDiscardItem,false));
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
            Environment.application.sendActionRequest("claimGuildCompetitionTournamentReward",{"discard_item":false},handleRequests);
         }
         _btnClose.enabled = false;
      }
      
      private function onClickGotoShop() : void
      {
         ViewManager.instance.showPanel("shop");
         _showing = false;
         close();
      }
      
      private function onClickDiscardItem() : void
      {
         Environment.application.sendActionRequest("claimGuildCompetitionTournamentReward",{"discard_item":true},handleRequests);
      }
      
      private function showRewardEffect(param1:Boolean) : void
      {
         var _loc2_:SymbolDialogGuildCompetitionRewardGeneric = _vo as SymbolDialogGuildCompetitionRewardGeneric;
         if(_loc2_.iconXP.visible)
         {
            EffectsLayer.instance.show(1,{"emitter":_loc2_.iconXP});
         }
         if(_loc2_.iconStatPoints.visible)
         {
            EffectsLayer.instance.show(7,{
               "emitter":_loc2_.iconStatPoints,
               "amount":_reward.statPoints
            });
         }
         if(param1 && _loc2_.item.visible)
         {
            EffectsLayer.instance.show(3,{
               "emitter":_loc2_.item,
               "imageUrl":_item.item.iconImageUrl
            });
         }
      }
   }
}
