package com.playata.application.ui.dialogs
{
   import com.playata.application.data.guild.Guild;
   import com.playata.application.data.guild.GuildBattle;
   import com.playata.application.data.user.User;
   import com.playata.application.messaging.Message;
   import com.playata.application.messaging.MessageRouter;
   import com.playata.application.ui.AppUiUtil;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.ui.elements.guild.UiGuildEmblem;
   import com.playata.application.ui.panels.PanelBattle;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.collection.IntMap;
   import com.playata.framework.display.ui.controls.Button;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogGuildBattleViewGeneric;
   
   public class DialogGuildBattleView extends UiDialog
   {
      
      private static var _showing:Boolean = false;
      
      private static var _shownGuildBattles:IntMap = new IntMap();
       
      
      private var _guildBattle:GuildBattle = null;
      
      private var _btnView:UiTextButton = null;
      
      private var _emblemOwnGuild:UiGuildEmblem = null;
      
      private var _emblemOtherGuild:UiGuildEmblem = null;
      
      public function DialogGuildBattleView(param1:GuildBattle)
      {
         _showing = true;
         _guildBattle = param1;
         var _loc2_:Boolean = User.current.showGuildBattles;
         PanelBattle.guildBattle = _guildBattle;
         PanelBattle.lastViewedMode = 5;
         if(_loc2_)
         {
            ViewManager.instance.showPanel("battle");
         }
         var _loc3_:SymbolDialogGuildBattleViewGeneric = new SymbolDialogGuildBattleViewGeneric();
         super(_loc3_);
         _queued = false;
         _btnView = new UiTextButton(_loc3_.btnView,!!_loc2_?LocText.current.text("dialog/guild_battle_view/button_view"):LocText.current.text("general/button_ok"),"",onClickView);
         _loc3_.txtDialogTitle.text = LocText.current.text("dialog/guild_battle_view/title");
         _loc3_.txtTime.text = _guildBattle.battleTimeString;
         _loc3_.txtVs.text = LocText.current.text("dialog/guild_battle_view/vs");
         _loc3_.txtOwnGuildName.text = _guildBattle.ownGuild.name;
         _loc3_.txtOtherGuildName.text = _guildBattle.otherGuild.name;
         _emblemOwnGuild = new UiGuildEmblem(_loc3_.emblemOwnGuild,_guildBattle.ownGuild.emblemSettings,100,100,null,true,3);
         _emblemOtherGuild = new UiGuildEmblem(_loc3_.emblemOtherGuild,_guildBattle.otherGuild.emblemSettings,100,100,onClickEmblem,true,3);
         _emblemOtherGuild.tooltip = LocText.current.text("dialog/guild_battle_view/emblem_tooltip");
         _emblemOtherGuild.enableButton = true;
         AppUiUtil.alignVerticallyCentered(_loc3_,-4,_loc3_.iconTime,_loc3_.txtTime);
      }
      
      public static function get isShowing() : Boolean
      {
         return _showing;
      }
      
      public static function wasShown(param1:int) : Boolean
      {
         return _shownGuildBattles.exists(param1);
      }
      
      public static function reset() : void
      {
         _shownGuildBattles = new IntMap();
      }
      
      override public function dispose() : void
      {
         if(_btnView == null)
         {
            return;
         }
         _btnView.dispose();
         _btnView = null;
         _emblemOwnGuild.dispose();
         _emblemOwnGuild = null;
         _emblemOtherGuild.dispose();
         _emblemOtherGuild = null;
         super.dispose();
      }
      
      private function onClickView(param1:InteractionEvent) : void
      {
         if(!_btnView || !_guildBattle)
         {
            return;
         }
         _shownGuildBattles.setData(_guildBattle.id,true);
         close();
         if(_guildBattle.hasRounds)
         {
            if(User.current.showGuildBattles)
            {
               if(ViewManager.instance.activePanelInstance is PanelBattle)
               {
                  (ViewManager.instance.activePanelInstance as PanelBattle).startGuildBattleVisualization();
               }
               else
               {
                  ViewManager.instance.showPanel("battle");
                  (ViewManager.instance.activePanelInstance as PanelBattle).startGuildBattleVisualization();
               }
            }
            else
            {
               onFinishBattle();
            }
         }
         else if(_guildBattle.isOwnGuildWinner)
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_battle_no_attacker_defender_won/title"),LocText.current.text("dialog/guild_battle_no_attacker_defender_won/text",!!_guildBattle.isOwnGuildAttack?_guildBattle.defender.name:_guildBattle.attacker.name),LocText.current.text("general/button_ok"),onFinishBattle));
         }
         else
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_battle_no_attacker_defender_lost/title"),LocText.current.text("dialog/guild_battle_no_attacker_defender_lost/text",!!_guildBattle.isOwnGuildAttack?_guildBattle.defender.name:_guildBattle.attacker.name),LocText.current.text("general/button_ok"),onFinishBattle));
         }
      }
      
      private function onFinishBattle() : void
      {
         if(User.current.showGuildBattles)
         {
            ViewManager.instance.baseUserPanel.fadeInMainNavigationButtons();
         }
         MessageRouter.dispatch(new Message("ViewMessage.notifyBattleFinished",null,this));
      }
      
      private function onClickEmblem() : void
      {
         if(_guildBattle.isOwnGuildAttack)
         {
            Environment.application.sendActionRequest("getGuild",{"guild_id":_guildBattle.guildDefenderId},handleRequests);
         }
         else
         {
            Environment.application.sendActionRequest("getGuild",{"guild_id":_guildBattle.guildAttackerId},handleRequests);
         }
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = param1.action;
         if("getGuild" !== _loc3_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            ViewManager.instance.baseUserPanel.fadeInMainNavigationButtons();
            _loc2_ = Guild.fromData(param1.data);
            ViewManager.instance.showGuild(_loc2_);
            close();
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
      
      override public function close(param1:Function = null) : void
      {
         _showing = false;
         super.close(param1);
      }
      
      override public function get defaultButton() : Button
      {
         return _btnView;
      }
   }
}
