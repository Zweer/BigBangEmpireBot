package com.playata.application.ui.dialogs
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.guild.GuildArtifact;
   import com.playata.application.data.guild.GuildBattle;
   import com.playata.application.data.item.Item;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.AppUiUtil;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.effects.EffectsLayer;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.dialog.UiTwoChoiceDialog;
   import com.playata.application.ui.elements.guild.UiGuildEmblem;
   import com.playata.application.ui.elements.item.UiItemSlot;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.display.ui.controls.Button;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogGuildBattleResultGeneric;
   
   public class DialogGuildBattleResult extends UiDialog
   {
       
      
      private var _guildBattle:GuildBattle = null;
      
      private var _btnClose:UiTextButton = null;
      
      private var _emblem:UiGuildEmblem = null;
      
      private var _itemReward:UiItemSlot = null;
      
      public function DialogGuildBattleResult(param1:GuildBattle)
      {
         var _loc3_:Boolean = false;
         var _loc4_:int = 0;
         _guildBattle = param1;
         var _loc2_:SymbolDialogGuildBattleResultGeneric = new SymbolDialogGuildBattleResultGeneric();
         super(_loc2_);
         _queued = false;
         _btnClose = new UiTextButton(_loc2_.btnClose,LocText.current.text("general/button_ok"),"",onClickClose);
         _emblem = new UiGuildEmblem(_loc2_.emblem,_guildBattle.winner.emblemSettings,100,100,null,true,3);
         if(_guildBattle.isOwnGuildWinner)
         {
            _loc2_.txtDialogTitle.text = LocText.current.text("dialog/guild_battle_won_result/title");
            Environment.audio.playFX("event_guild_battle_won.mp3");
         }
         else
         {
            _loc2_.txtDialogTitle.text = LocText.current.text("dialog/guild_battle_lost_result/title");
            Environment.audio.playFX("event_guild_battle_lost.mp3");
         }
         _loc2_.txtWinnerCaption.text = LocText.current.text("dialog/guild_battle_result/winner");
         _loc2_.txtWinnerName.text = _guildBattle.winner.name;
         _loc2_.txtGuildRewardCaption.text = LocText.current.text("dialog/guild_battle_result/guild_reward_caption");
         _loc2_.txtCharacterRewardCaption.text = LocText.current.text("dialog/guild_battle_result/character_reward_caption");
         _loc2_.txtNoRewardText.text = LocText.current.text("dialog/guild_battle_result/no_rewards");
         if(_guildBattle.isOwnGuildWinner)
         {
            _loc3_ = _guildBattle.hasJoinedMember(User.current.character.id);
            _loc2_.iconCoins.visible = _loc3_ && _guildBattle.characterReward.gameCurrency > 0;
            _loc2_.iconPremiumCurrency.visible = _loc3_ && _guildBattle.winnerReward.premiumCurrency > 0;
            _loc2_.txtCoins.visible = _loc3_ && _guildBattle.characterReward.gameCurrency > 0;
            _loc2_.txtPremiumCurrency.visible = _loc3_ && _guildBattle.winnerReward.premiumCurrency > 0;
            _loc2_.itemReward.visible = _loc3_ && _guildBattle.characterReward.itemId != 0;
            _loc2_.txtNoRewardText.visible = !_loc3_;
            if(_loc3_)
            {
               if(_guildBattle.characterReward.itemId != 0)
               {
                  _itemReward = new UiItemSlot(_loc2_.itemReward,0);
                  _itemReward.item = User.current.character.getItemById(_guildBattle.characterReward.itemId);
               }
               _loc2_.txtCoins.text = GameUtil.getGameCurrencyString(_guildBattle.characterReward.gameCurrency);
            }
            _loc2_.txtPremiumCurrency.text = _guildBattle.winnerReward.premiumCurrencyString;
            _loc2_.txtHonor.text = _guildBattle.winnerReward.honorString;
         }
         else
         {
            _loc2_.txtCharacterRewardCaption.visible = false;
            _loc2_.iconCoins.visible = false;
            _loc2_.iconPremiumCurrency.visible = false;
            _loc2_.txtCoins.visible = false;
            _loc2_.txtPremiumCurrency.visible = false;
            _loc2_.itemReward.visible = false;
            _loc2_.txtNoRewardText.visible = false;
            _loc4_ = 12;
            AppUiUtil.alignVerticallyCentered(_loc2_,-5,_loc2_.txtGuildRewardCaption);
            AppUiUtil.alignVerticallyCentered(_loc2_,-5,_loc2_.iconHonor,_loc2_.txtHonor);
            _loc2_.txtGuildRewardCaption.y = _loc2_.txtGuildRewardCaption.y + _loc4_;
            _loc2_.txtHonor.y = _loc2_.txtHonor.y + _loc4_;
            _loc2_.iconHonor.y = _loc2_.iconHonor.y + _loc4_;
            _loc2_.txtHonor.text = _guildBattle.loserReward.honorString;
         }
      }
      
      override public function show() : void
      {
         super.show();
         if(_guildBattle.isOwnGuildWinner)
         {
            EffectsLayer.instance.show(104,{},_vo.parent,1);
         }
      }
      
      override public function dispose() : void
      {
         if(_btnClose == null)
         {
            return;
         }
         _btnClose.dispose();
         _btnClose = null;
         _emblem.dispose();
         _emblem = null;
         super.dispose();
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("claimGuildBattleReward",{
            "discard_item":false,
            "guild_battle_id":_guildBattle.id
         },handleRequests);
      }
      
      private function onClickDiscardItem() : void
      {
         Environment.application.sendActionRequest("claimGuildBattleReward",{
            "discard_item":true,
            "guild_battle_id":_guildBattle.id
         },handleRequests);
      }
      
      private function onClickGotoShop() : void
      {
         ViewManager.instance.baseUserPanel.fadeInMainNavigationButtons();
         DialogGuildBattleView.reset();
         ViewManager.instance.showPanel("shop");
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("claimGuildBattleReward" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            ViewManager.instance.baseUserPanel.fadeInMainNavigationButtons();
            if(_guildBattle.isOwnGuildWinner && _guildBattle.winnerReward.artifactId != 0)
            {
               Environment.panelManager.showDialog(new DialogGuildBattleArtifactWon(new GuildArtifact(_guildBattle.winnerReward.artifactId),_guildBattle.winnerReward.artifactStolen,_guildBattle.loser));
            }
            else if(!_guildBattle.isOwnGuildWinner && _guildBattle.loserReward.artifactId != 0)
            {
               Environment.panelManager.showDialog(new DialogGuildBattleArtifactLost(new GuildArtifact(_guildBattle.loserReward.artifactId),_guildBattle.winner));
            }
            else
            {
               if(User.current.character.hasRunOutMissiles())
               {
                  Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("dialog/run_out_missiles/title"),LocText.current.text("dialog/run_out_missiles/text"),LocText.current.text("dialog/run_out_missiles/button_shop"),LocText.current.text("dialog/run_out_missiles/button_cancel"),onClickGotoShop));
               }
               ViewManager.instance.showPanel("guild");
            }
            showRewardEffect(!param1.request.getBoolean("discard_item"));
            close();
         }
         else if(param1.error == "errInventoryNoEmptySlot")
         {
            Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("dialog/no_free_slot/title"),LocText.current.text("dialog/no_free_slot/text",GameUtil.getGameCurrencyString(_itemReward.item.sellPrice)),LocText.current.text("dialog/no_free_slot/button_go_to_shop"),LocText.current.text("dialog/no_free_slot/button_discard_item"),onClickGotoShop,onClickDiscardItem));
            close();
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
      
      private function showRewardEffect(param1:Boolean) : void
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         try
         {
            _loc3_ = _vo as SymbolDialogGuildBattleResultGeneric;
            if(!_loc3_)
            {
               return;
            }
            if(_loc3_.iconCoins.visible)
            {
               EffectsLayer.instance.show(0,{"emitter":_loc3_.iconCoins});
            }
            if(param1 && _itemReward != null)
            {
               _loc2_ = User.current.character.getItemById(_guildBattle.characterReward.itemId);
               EffectsLayer.instance.show(3,{
                  "emitter":_loc3_.itemReward,
                  "imageUrl":_loc2_.iconImageUrl
               });
            }
            return;
         }
         catch(e:Error)
         {
            return;
         }
      }
      
      override public function get defaultButton() : Button
      {
         return _btnClose;
      }
   }
}
