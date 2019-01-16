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
   import visuals.ui.dialogs.SymbolDialogGuildBattleArtifactLostGeneric;
   
   public class DialogGuildBattleArtifactLost extends UiDialog
   {
       
      
      private var _btnClose:UiTextButton = null;
      
      private var _artifact:GuildArtifact = null;
      
      private var _tooltipArtifact:UiTextTooltip = null;
      
      private var _tooltipCross:UiTextTooltip = null;
      
      public function DialogGuildBattleArtifactLost(param1:GuildArtifact, param2:Guild)
      {
         _artifact = param1;
         var _loc3_:SymbolDialogGuildBattleArtifactLostGeneric = new SymbolDialogGuildBattleArtifactLostGeneric();
         super(_loc3_);
         _queued = false;
         _loc3_.txtDialogTitle.text = LocText.current.text("dialog/guild_battle_artifact_lost/title");
         _loc3_.artifact.setUriSprite(_artifact.imageUrl,112,134,false,1,null,true);
         _loc3_.txtArtifactName.text = _artifact.name;
         _loc3_.txtInfo.text = LocText.current.text("dialog/guild_battle_artifact_lost/info_text",param2.name,User.current.character.guild.artifactsOwnedCurrent);
         Environment.audio.playFX("event_guild_artifact_lost.mp3");
         _tooltipArtifact = new UiTextTooltip(_loc3_.artifact,param1.tooltip);
         _tooltipCross = new UiTextTooltip(_loc3_.cross,param1.tooltip);
         _btnClose = new UiTextButton(_loc3_.btnClose,LocText.current.text("general/button_ok"),"",onClickClose);
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
         _tooltipCross.dispose();
         _tooltipCross = null;
         super.dispose();
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function onClickGotoShop() : void
      {
         ViewManager.instance.showPanel("shop");
         close();
      }
      
      private function onClickGotoGuild() : void
      {
         close();
      }
      
      override public function close(param1:Function = null) : void
      {
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
