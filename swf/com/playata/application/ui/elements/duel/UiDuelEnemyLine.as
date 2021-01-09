package com.playata.application.ui.elements.duel
{
   import com.playata.application.AppConfig;
   import com.playata.application.data.duel.DuelOpponent;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.avatar.UiCharacterTooltip;
   import com.playata.application.ui.elements.generic.UiOnlinePoint;
   import com.playata.application.ui.panels.PanelDuels;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.base.SymbolAvatarContainerGeneric;
   import visuals.ui.elements.duel.SymbolDuelEnemyLineGeneric;
   
   public class UiDuelEnemyLine extends InteractiveDisplayObject
   {
       
      
      private var _content:SymbolDuelEnemyLineGeneric = null;
      
      private var _onClickFunction:Function = null;
      
      private var _onDoubleClickFunction:Function = null;
      
      private var _tooltipLine:UiCharacterTooltip = null;
      
      private var _onlinePoint:UiOnlinePoint = null;
      
      private var _avatar:UiDuelAvatar = null;
      
      private var _index:int = 0;
      
      public function UiDuelEnemyLine(param1:SymbolDuelEnemyLineGeneric, param2:SymbolAvatarContainerGeneric, param3:Function, param4:Function, param5:int, param6:int)
      {
         _content = param1;
         super(_content);
         _onClickFunction = param3;
         _onDoubleClickFunction = param4;
         _index = param5;
         _onlinePoint = new UiOnlinePoint(_content.iconOnline,_content.txtName);
         _tooltipLine = new UiCharacterTooltip(this);
         _avatar = new UiDuelAvatar(param2,handleAvatarClick,handleAvatarDoubleClick,handleAvatarOver,handleAvatarOut,param6);
         onClick.add(handleClick);
         onDoubleClick.add(handleDoubleClick);
         onInteractionOver.add(handleLineOver);
         onInteractionOut.add(handleLineOut);
         useHandCursor = false;
      }
      
      public function get content() : SymbolDuelEnemyLineGeneric
      {
         return _content;
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function get avatar() : UiDuelAvatar
      {
         return _avatar;
      }
      
      override public function dispose() : void
      {
         _tooltipLine.dispose();
         _tooltipLine = null;
         _onlinePoint.dispose();
         _onlinePoint = null;
         _avatar.dispose();
         _avatar = null;
         super.dispose();
      }
      
      override public function set visible(param1:Boolean) : void
      {
         .super.visible = param1;
         if(!param1)
         {
            _avatar.hide();
         }
      }
      
      public function refresh() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(User.current.character.duelOpponents.length < index)
         {
            _content.visible = false;
            avatar.hide();
            return;
         }
         var _loc3_:DuelOpponent = User.current.character.duelOpponents[index - 1];
         avatar.show(_loc3_.getCharacterTooltipInformation().avatarImageSettings);
         avatar.selected = false;
         _content.visible = true;
         _content.txtName.setTextToFit(_loc3_.name,"...");
         _content.txtHonor.text = LocText.current.formatHugeNumber(_loc3_.honor);
         _content.iconGenderMale.visible = _loc3_.isMale;
         _content.iconGenderFemale.visible = _loc3_.isFemale;
         _content.txtName.textColor = !!_loc3_.isMyGuildMember?16711908:14342874;
         _content.backgroundEven.visible = index % 2 == 0;
         _content.backgroundOdd.visible = index % 2 != 0;
         _onlinePoint.refresh(_loc3_.isOnline,_loc3_.name);
         if(_tooltipLine)
         {
            _loc1_ = AppConfig.titlesEnabled && _content.txtName.text.indexOf("...") > 0?_loc3_.name:"";
            _loc2_ = PanelDuels.getDuelResultTooltip(_loc3_.level,_loc3_.honor,_loc3_.totalStats);
            if(_loc3_.hasMissile)
            {
               _loc2_ = _loc2_ + ("\n\n" + LocText.current.text("screen/duel/tooltip_opponent_with_missile"));
            }
            else
            {
               _loc2_ = _loc2_ + ("\n\n" + LocText.current.text("screen/duel/tooltip_opponent_without_missile"));
            }
            _tooltipLine.setText(_loc1_,_loc3_,_loc2_,false,true);
            avatar.setTooltipText(_loc1_,_loc3_,_loc2_);
         }
      }
      
      public function highlight(param1:Boolean, param2:Number = 1) : void
      {
         if(!_content.visible)
         {
            return;
         }
         _content.backgroundHighlight.alpha = !!param1?param2:1;
         _content.backgroundHighlight.visible = param1;
         _content.backgroundEven.visible = !param1 && index % 2 == 0;
         _content.backgroundOdd.visible = !param1 && index % 2 != 0;
      }
      
      public function selected(param1:Boolean) : void
      {
         if(!_content.visible)
         {
            return;
         }
         highlight(param1);
         avatar.highlighted = param1;
         avatar.selected = param1;
      }
      
      private function handleLineOver(param1:InteractionEvent) : void
      {
         if(avatar.selected)
         {
            return;
         }
         avatar.highlighted = true;
         highlight(true,0.5);
      }
      
      private function handleLineOut(param1:InteractionEvent) : void
      {
         if(avatar.selected)
         {
            return;
         }
         avatar.highlighted = false;
         highlight(false);
      }
      
      private function handleAvatarOver(param1:UiDuelAvatar) : void
      {
         highlight(true,0.75);
      }
      
      private function handleAvatarOut(param1:UiDuelAvatar) : void
      {
         highlight(false);
      }
      
      private function handleClick(param1:InteractionEvent) : void
      {
      }
      
      private function handleAvatarClick(param1:UiDuelAvatar) : void
      {
      }
      
      private function handleDoubleClick(param1:InteractionEvent) : void
      {
      }
      
      private function handleAvatarDoubleClick(param1:UiDuelAvatar) : void
      {
      }
   }
}
