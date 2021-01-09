package com.playata.application.ui.elements.dungeon
{
   import com.playata.application.data.character.Character;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.dialogs.DialogDungeonSelect;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.ui.panels.PanelCitymap;
   import com.playata.application.ui.panels.PanelDungeon;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.timer.ITimer;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.dungeon.SymbolButtonDungeonKeyGeneric;
   
   public class UiDungeonKeyButton extends UiButton
   {
       
      
      private var _realContent:SymbolButtonDungeonKeyGeneric;
      
      private var _timer:ITimer;
      
      public function UiDungeonKeyButton(param1:SymbolButtonDungeonKeyGeneric)
      {
         super(param1,"",onClickDungeonTicket);
         _realContent = param1;
         _timer = Environment.createTimer("UiDungeonKeyButton::timer",1000,onTimerEvent);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         _timer.dispose();
         _timer = null;
      }
      
      private function onClickDungeonTicket(param1:InteractionEvent) : void
      {
         var _loc2_:Character = User.current.character;
         if(_loc2_.currentDungeon)
         {
            Environment.application.sendActionRequest("setCharacterLocation",{"location":3},handleRequests);
         }
         else if(TimeUtil.serverDateTime.isToday(_loc2_.tsLastDungeonStarted))
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/dungeon_cooldown/title"),LocText.current.text("dialog/dungeon_cooldown/text"),LocText.current.text("general/button_ok")));
         }
         else
         {
            Environment.panelManager.showDialog(new DialogDungeonSelect());
         }
      }
      
      override public function set buttonEnabled(param1:Boolean) : void
      {
      }
      
      public function refreshTooltip() : void
      {
         var _loc1_:Character = User.current.character;
         if(_loc1_.currentDungeon)
         {
            tooltip = LocText.current.text("screen/citymap/btn_dungeon_key_active_tooltip",_loc1_.currentDungeon.name);
         }
         else if(_loc1_.hasDungeonKey)
         {
            tooltip = LocText.current.text("screen/citymap/btn_dungeon_key_available_tooltip",TimeUtil.secondsToString(_loc1_.dungeonKeyEndTimestamp - TimeUtil.now));
         }
         else if(TimeUtil.serverDateTime.isToday(_loc1_.tsLastDungeonStarted))
         {
            tooltip = LocText.current.text("screen/citymap/btn_dungeon_key_on_cooldown_tooltip");
         }
         else
         {
            tooltip = LocText.current.text("screen/citymap/btn_dungeon_key_missing_tooltip");
         }
      }
      
      public function refresh() : void
      {
         var _loc1_:Boolean = User.current.character.hasDungeonKey;
         visible = true;
         if(_loc1_ || User.current.character.currentDungeon)
         {
            _realContent.iconDelete.visible = false;
         }
         else if(!_loc1_)
         {
            _realContent.iconDelete.visible = true;
         }
         _realContent.iconTicket.alpha = !!_realContent.iconDelete.visible?0.8:1;
         refreshTooltip();
         if(_loc1_)
         {
            _timer.start();
            onTimerEvent();
         }
         else
         {
            _realContent.timer.visible = false;
         }
      }
      
      private function onTimerEvent() : void
      {
         if(!User.current)
         {
            if(_timer)
            {
               _timer.stop();
            }
            return;
         }
         var _loc1_:Character = User.current.character;
         if(!_loc1_.hasDungeonKey)
         {
            _timer.stop();
            refresh();
         }
         else
         {
            _realContent.timer.visible = true;
            _realContent.timer.txtTimer.text = TimeUtil.secondsToStringFormat(_loc1_.dungeonKeyEndTimestamp - TimeUtil.now,"H:m:s");
            refreshTooltip();
         }
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("setCharacterLocation" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            PanelCitymap.lastAction = 2;
            Environment.application.updateData(param1.data);
            PanelDungeon.visualizeEnter = true;
            ViewManager.instance.showPanel("dungeon");
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
   }
}
