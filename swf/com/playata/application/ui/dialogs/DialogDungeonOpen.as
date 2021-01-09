package com.playata.application.ui.dialogs
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.constants.CDungeonTemplate;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiPremiumButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.application.ui.panels.PanelCitymap;
   import com.playata.application.ui.panels.PanelDungeon;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.display.ui.controls.Button;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogDungeonOpenGeneric;
   
   public class DialogDungeonOpen extends UiDialog
   {
       
      
      private var _btnOpen:UiPremiumButton = null;
      
      private var _btnClose:UiButton = null;
      
      private var _dungeonIdentifier:String;
      
      private var _tooltipDungeonKey:UiTextTooltip;
      
      private var _tooltipNumFans:UiTextTooltip;
      
      private var _tooltipDuration:UiTextTooltip;
      
      private var _tooltipMissions:UiTextTooltip;
      
      public function DialogDungeonOpen(param1:String)
      {
         _dungeonIdentifier = param1;
         var _loc4_:SymbolDialogDungeonOpenGeneric = new SymbolDialogDungeonOpenGeneric();
         super(_loc4_);
         _queued = false;
         var _loc2_:Character = User.current.character;
         _loc4_.txtDungeonName.text = LocText.current.text("dungeon/" + param1 + "/name");
         _loc4_.txtInfo.text = LocText.current.text("dungeon/" + param1 + "/unlock");
         _loc4_.txtDungeonGeneric.text = LocText.current.text("dialog/dungeon_open/title_generic");
         _loc4_.txtRequirementsCaption.text = LocText.current.text("dialog/dungeon_open/title_requirements");
         _loc4_.txtInfoCaption.text = LocText.current.text("dialog/dungeon_open/title_info");
         var _loc5_:CDungeonTemplate = CDungeonTemplate.fromId(param1);
         _loc4_.txtDungeonKey.text = LocText.current.text("dialog/dungeon_open/dungeon_key");
         if(!_loc2_.hasDungeonKey)
         {
            _loc4_.txtDungeonKey.textColor = 16711680;
         }
         if(_loc2_.fansTotal >= GameUtil.getDungeonUnlockFansCount(param1))
         {
            _loc4_.txtFans.text = LocText.current.formatHugeNumber(GameUtil.getDungeonUnlockFansCount(param1));
         }
         else
         {
            _loc4_.txtFans.text = LocText.current.shortenHugeNumber(_loc2_.fansTotal) + "/" + LocText.current.shortenHugeNumber(GameUtil.getDungeonUnlockFansCount(param1));
            _loc4_.txtFans.textColor = 16711680;
         }
         _loc4_.txtDuration.text = TimeUtil.secondsToStringFormat(_loc5_.duration,"H:m:s");
         _loc4_.txtMissions.text = LocText.current.text("dialog/dungeon_open/num_missions",GameUtil.numMissionsInDungeon(param1));
         _tooltipDungeonKey = new UiTextTooltip(_loc4_.txtDungeonKey,LocText.current.text("dialog/dungeon_open/tooltip_dungeon_key"));
         if(_loc2_.fansTotal >= GameUtil.getDungeonUnlockFansCount(param1))
         {
            _tooltipNumFans = new UiTextTooltip(_loc4_.txtFans,LocText.current.text("dialog/dungeon_open/tooltip_fans",LocText.current.formatHugeNumber(GameUtil.getDungeonUnlockFansCount(param1)),LocText.current.formatHugeNumber(_loc5_.getLevel(2).minFans),LocText.current.formatHugeNumber(_loc5_.getLevel(3).minFans)));
         }
         else
         {
            _tooltipNumFans = new UiTextTooltip(_loc4_.txtFans,LocText.current.text("dialog/dungeon_open/tooltip_fans_not_enough",LocText.current.formatHugeNumber(_loc2_.fansTotal),LocText.current.formatHugeNumber(GameUtil.getDungeonUnlockFansCount(param1)),LocText.current.formatHugeNumber(_loc5_.getLevel(2).minFans),LocText.current.formatHugeNumber(_loc5_.getLevel(3).minFans)));
         }
         _tooltipDuration = new UiTextTooltip(_loc4_.txtDuration,LocText.current.text("dialog/dungeon_open/tooltip_duration",TimeUtil.secondsToStringFormat(_loc5_.duration,"H:m:s")));
         _tooltipMissions = new UiTextTooltip(_loc4_.txtMissions,LocText.current.text("dialog/dungeon_open/tooltip_missions",GameUtil.numMissionsInDungeon(param1),3));
         _loc4_.photo.photo.setUriSprite(GameUtil.getDungeonPreviewImageUrl(param1),102,103,true,1,null,true);
         var _loc3_:int = 0;
         if(!_loc2_.hasDungeonKey)
         {
            _loc3_ = _loc3_ + _loc5_.unlockPremiumAmount;
         }
         if(_loc2_.fansTotal < GameUtil.getDungeonUnlockFansCount(param1))
         {
            _loc3_ = _loc3_ + _loc5_.unlockPremiumAmount;
         }
         _btnOpen = new UiPremiumButton(_loc4_.btnOpen,_loc3_,LocText.current.text("dialog/dungeon_open/button_open"),LocText.current.text("dialog/dungeon_open/button_open"),"","",onClickOpen);
         _btnOpen.premium = _loc3_ > 0;
         _btnClose = new UiButton(_loc4_.btnClose,"",onClickClose);
      }
      
      override public function dispose() : void
      {
         if(_btnOpen == null)
         {
            return;
         }
         _btnClose.dispose();
         _btnClose = null;
         _btnOpen.dispose();
         _btnOpen = null;
         _tooltipDungeonKey.dispose();
         _tooltipDungeonKey = null;
         _tooltipNumFans.dispose();
         _tooltipNumFans = null;
         _tooltipDuration.dispose();
         _tooltipDuration = null;
         _tooltipMissions.dispose();
         _tooltipMissions = null;
         super.dispose();
      }
      
      private function onClickOpen(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("openDungeon",{
            "dungeon_identifier":_dungeonIdentifier,
            "premium":_btnOpen.premium
         },handleRequests);
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      override public function get defaultButton() : Button
      {
         return _btnClose;
      }
      
      override public function onEscape() : void
      {
         onClickClose(null);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("openDungeon" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            close();
            PanelDungeon.visualizeEnter = true;
            ViewManager.instance.showPanel("dungeon");
            Environment.panelManager.showDialog(new DialogDungeonStatus(User.current.character.currentDungeon,true));
            Environment.audio.playFX("event_pvp_win.mp3");
            PanelCitymap.lastAction = 2;
         }
         else if(param1.error == "errRemovePremiumCurrencyNotEnough")
         {
            ViewManager.instance.showNotEnoughPremiumDialog(_btnOpen.premiumAmount);
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
   }
}
