package com.playata.application.ui.elements.duel
{
   import com.playata.application.data.duel.MissedDuel;
   import com.playata.application.ui.elements.generic.UiOnlinePoint;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.application.ui.panels.PanelDuels;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.duel.SymbolMissedDuelLineGeneric;
   
   public class UiMissedDuelLine extends InteractiveDisplayObject
   {
       
      
      private var _content:SymbolMissedDuelLineGeneric = null;
      
      private var _index:int = 0;
      
      private var _duel:MissedDuel = null;
      
      private var _tooltipLine:UiTextTooltip = null;
      
      private var _onlinePoint:UiOnlinePoint = null;
      
      private var _onClickFunction:Function = null;
      
      private var _onDoubleClickFunction:Function = null;
      
      public function UiMissedDuelLine(param1:SymbolMissedDuelLineGeneric, param2:int, param3:Function, param4:Function)
      {
         _content = param1;
         super(_content);
         _index = param2;
         _onClickFunction = param3;
         _onDoubleClickFunction = param4;
         _tooltipLine = new UiTextTooltip(_content,"");
         _onlinePoint = new UiOnlinePoint(_content.iconOnline,_content.txtName);
         onClick.add(handleClick);
         onDoubleClick.add(handleDoubleClick);
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function get duel() : MissedDuel
      {
         return _duel;
      }
      
      private function handleClick(param1:InteractionEvent) : void
      {
         Environment.audio.playFX("ui_button_click.mp3");
      }
      
      private function handleDoubleClick(param1:InteractionEvent) : void
      {
         Environment.audio.playFX("ui_button_click.mp3");
      }
      
      public function highlight(param1:Boolean) : void
      {
         if(!_content.visible)
         {
            return;
         }
         _content.backgroundHighlight.visible = param1;
         _content.backgroundEven.visible = !param1 && _index % 2 == 0;
         _content.backgroundOdd.visible = !param1 && _index % 2 != 0;
      }
      
      public function refresh(param1:MissedDuel, param2:int) : void
      {
         _index = param2;
         _duel = param1;
         if(_duel == null)
         {
            _content.visible = false;
            return;
         }
         _content.visible = true;
         _content.iconUnread.visible = param1.unread;
         _content.txtDate.text = param1.dateTime;
         _content.txtName.text = param1.opponent.name.toString();
         _content.txtLevel.text = param1.opponent.level.toString();
         _content.txtHonor.text = param1.reward.honor > 0?"+" + param1.reward.honor.toString():param1.reward.honor.toString();
         _content.txtStatusLost.visible = !param1.isWon;
         _content.txtStatusWon.visible = param1.isWon;
         _content.txtStatusLost.text = LocText.current.text("dialog/missed_duels/lost_text");
         _content.txtStatusWon.text = LocText.current.text("dialog/missed_duels/won_text");
         _content.iconGenderMale.visible = param1.opponent.isMale;
         _content.iconGenderFemale.visible = param1.opponent.isFemale;
         _content.backgroundEven.visible = param2 % 2 == 0;
         _content.backgroundOdd.visible = param2 % 2 != 0;
         _onlinePoint.refresh(param1.opponent.isOnline,param1.opponent.name);
         _tooltipLine.text = PanelDuels.getDuelResultTooltip(param1.opponent.level,param1.opponent.honor,param1.opponent.totalStats);
      }
   }
}
