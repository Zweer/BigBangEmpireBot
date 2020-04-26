package com.playata.application.ui.dialogs
{
   import com.playata.application.data.guild.Guild;
   import com.playata.application.data.guild.GuildArtifact;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.dialog.UiTwoChoiceDialog;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.ui.controls.Button;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogGuildBattleArtifactWonGeneric;
   
   public class DialogGuildBattleArtifactWon extends UiDialog
   {
       
      
      private var _btnClose:UiTextButton = null;
      
      private var _artifact:GuildArtifact = null;
      
      private var _tooltipArtifact:UiTextTooltip = null;
      
      public function DialogGuildBattleArtifactWon(param1:GuildArtifact, param2:Boolean, param3:Guild)
      {
         _artifact = param1;
         var _loc4_:SymbolDialogGuildBattleArtifactWonGeneric = new SymbolDialogGuildBattleArtifactWonGeneric();
         super(_loc4_);
         _queued = false;
         _loc4_.txtDialogTitle.text = LocText.current.text("dialog/guild_battle_artifact_won/title");
         _loc4_.artifact.setUriSprite(_artifact.imageUrl,112,134,false,1,null,true);
         _loc4_.txtArtifactName.text = _artifact.name;
         if(param2)
         {
            _loc4_.txtInfo.text = LocText.current.text("dialog/guild_battle_artifact_stolen/info_text",param3.name,User.current.character.guild.artifactsOwnedCurrent);
         }
         else
         {
            _loc4_.txtInfo.text = LocText.current.text("dialog/guild_battle_artifact_won/info_text",User.current.character.guild.artifactsOwnedCurrent);
         }
         _tooltipArtifact = new UiTextTooltip(_loc4_.artifact,param1.tooltip);
         Environment.audio.playFX("event_guild_artifact_won.mp3");
         _btnClose = new UiTextButton(_loc4_.btnClose,LocText.current.text("general/button_ok"),"",onClickClose);
      }
      
      override public function dispose() : void
      {
         if(_btnClose == null)
         {
            return;
         }
         _btnClose.dispose();
         _btnClose = null;
         _tooltipArtifact.dispose();
         _tooltipArtifact = null;
         super.dispose();
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function onClickGotoShop() : void
      {
         ViewManager.instance.showPanel("shop");
      }
      
      private function onClickGotoGuild() : void
      {
         ViewManager.instance.showPanel("guild");
      }
      
      override public function close(param1:Function = null) : void
      {
         if(_btnClose == null)
         {
            return;
         }
         if(User.current == null || User.current.character == null)
         {
            return;
         }
         if(User.current.character.hasRunOutMissiles())
         {
            Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("dialog/run_out_missiles/title"),LocText.current.text("dialog/run_out_missiles/text"),LocText.current.text("dialog/run_out_missiles/button_shop"),LocText.current.text("dialog/run_out_missiles/button_cancel"),onClickGotoShop,onClickGotoGuild));
         }
         else
         {
            ViewManager.instance.showPanel("guild");
         }
         super.close(param1);
      }
      
      override public function get defaultButton() : Button
      {
         return _btnClose;
      }
      
      override public function onEscape() : void
      {
         close();
      }
   }
}
