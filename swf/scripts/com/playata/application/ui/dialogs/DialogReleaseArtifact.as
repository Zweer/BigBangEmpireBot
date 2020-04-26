package com.playata.application.ui.dialogs
{
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.guild.Guild;
   import com.playata.application.data.guild.GuildArtifact;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.button.UiPremiumButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.display.ui.controls.Button;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogReleaseArtifactGeneric;
   
   public class DialogReleaseArtifact extends UiDialog
   {
       
      
      private var _btnClose:UiTextButton = null;
      
      private var _btnRelease:UiPremiumButton;
      
      private var _artifact:GuildArtifact;
      
      private var _guild:Guild;
      
      public function DialogReleaseArtifact(param1:GuildArtifact, param2:Guild)
      {
         _artifact = param1;
         _guild = param2;
         var _loc4_:SymbolDialogReleaseArtifactGeneric = new SymbolDialogReleaseArtifactGeneric();
         super(_loc4_);
         _queued = false;
         _loc4_.txtDialogTitle.text = LocText.current.text("dialog/release_artifact/title");
         _loc4_.txtInfoTop.text = LocText.current.text("dialog/release_artifact/info_top");
         _loc4_.txtInfoTop.autoFontSize = true;
         _loc4_.txtInfoBottom.text = LocText.current.text("dialog/release_artifact/info_bottom");
         _loc4_.txtInfoBottom.autoFontSize = true;
         _loc4_.artifact.setUriSprite(_artifact.imageUrl,56,67,false,1,null,true);
         _loc4_.txtArtifactInfo.text = param1.tooltip;
         _loc4_.txtArtifactInfo.autoFontSize = true;
         _btnClose = new UiTextButton(_loc4_.btnClose,LocText.current.text("dialog/release_artifact/button_close"),"",onClickClose);
         _btnRelease = new UiPremiumButton(_loc4_.btnRelease,CConstant.release_guild_artifact_cost,"",LocText.current.text("dialog/release_artifact/button_release"),"","",onClickRelease);
         _btnRelease.premium = true;
         var _loc3_:int = -1;
         var _loc5_:int = -1;
         if(_guild.pendingAttackGuildBattle)
         {
            _loc3_ = Math.max(_guild.pendingAttackGuildBattle.tsAttack - TimeUtil.now,0);
         }
         if(_guild.pendingDefenseGuildBattle)
         {
            _loc3_ = Math.max(_guild.pendingDefenseGuildBattle.tsAttack - TimeUtil.now,0,_loc3_);
         }
         if(_guild.tsLastArtifactReleased + CConstant.release_guild_artifact_cooldown > TimeUtil.now)
         {
            _loc5_ = _guild.tsLastArtifactReleased + CConstant.release_guild_artifact_cooldown - TimeUtil.now;
         }
         _loc4_.txtError.visible = false;
         if(_loc3_ >= 0 || _loc5_ >= 0)
         {
            _btnRelease.visible = false;
            _btnClose.x = _btnClose.x - 131;
            _loc4_.txtInfoBottom.visible = false;
            _loc4_.txtError.visible = true;
            _btnClose.caption = LocText.current.text("dialog/release_artifact/button_later");
            if(_loc3_ >= 0 && _loc5_ >= 0)
            {
               _loc4_.txtError.text = LocText.current.text("dialog/release_artifact/info_active_battle_and_cooldown",TimeUtil.secondsToString(_loc3_ > _loc5_?_loc3_:int(_loc5_)));
            }
            else if(_loc5_ >= 0)
            {
               _loc4_.txtError.text = LocText.current.text("dialog/release_artifact/info_active_cooldown",TimeUtil.secondsToString(_loc5_));
            }
            else if(_loc3_ >= 0)
            {
               _loc4_.txtError.text = LocText.current.text("dialog/release_artifact/info_active_battle",TimeUtil.secondsToString(_loc3_));
            }
            _loc4_.txtError.autoFontSize = true;
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
         _btnRelease.dispose();
         _btnRelease = null;
         super.dispose();
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function onClickRelease(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("releaseArtifact",{"id":_artifact.id},handleRequests);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("releaseArtifact" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            close();
         }
         else if(param1.error == "errRemovePremiumCurrencyNotEnough")
         {
            ViewManager.instance.showGuildNotEnoughGameCurrencyPremiumCurrencyDialog(0,CConstant.release_guild_artifact_cost,null);
         }
         else if(param1.error == "errReleaseArtifactActiveBattle")
         {
            panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/release_artifact/error_title"),LocText.current.text("dialog/release_artifact/error_active_battle_text"),LocText.current.text("general/button_ok")));
            close();
         }
         else if(param1.error == "errReleaseArtifactActiveCooldown")
         {
            panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/release_artifact/error_title"),LocText.current.text("dialog/release_artifact/error_active_cooldown_text"),LocText.current.text("general/button_ok")));
            close();
         }
         else if(param1.error == "errReleaseArtifactNoPermission")
         {
            panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/release_artifact/error_title"),LocText.current.text("dialog/release_artifact/error_no_permission"),LocText.current.text("general/button_ok")));
            close();
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
         }
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
