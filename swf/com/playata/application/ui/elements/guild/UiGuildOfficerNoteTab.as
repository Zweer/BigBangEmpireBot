package com.playata.application.ui.elements.guild
{
   import com.playata.application.data.guild.Guild;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.dialogs.DialogGuildOfficerNote;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.display.layout.LayoutUtil;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.guild.SymbolGuildOfficerNoteTabGeneric;
   
   public class UiGuildOfficerNoteTab
   {
       
      
      private var _guild:Guild = null;
      
      private var _content:SymbolGuildOfficerNoteTabGeneric = null;
      
      private var _textTooltip:UiTextTooltip = null;
      
      private var _btnBackgroundCollapse:UiButton = null;
      
      private var _btnBackgroundExpand:UiButton = null;
      
      private var _onCollapseChanged:Function = null;
      
      private var _clickLayer:InteractiveDisplayObject = null;
      
      public function UiGuildOfficerNoteTab(param1:SymbolGuildOfficerNoteTabGeneric, param2:Function)
      {
         super();
         _content = param1;
         _onCollapseChanged = param2;
         _clickLayer = new InteractiveDisplayObject(_content.clickLayer);
         _clickLayer.onClick.add(handleClick);
         _textTooltip = new UiTextTooltip(_clickLayer,"");
         _btnBackgroundCollapse = new UiButton(_content.bgExpanded.btnCollapse,LocText.current.text("guild/bottom_frame/collapse_tooltip"),onClickBackgroundCollapse);
         _btnBackgroundExpand = new UiButton(_content.bgCollapsed.btnExpand,LocText.current.text("guild/bottom_frame/expand_tooltip"),onClickBackgroundExpand);
         if(Environment.info.isTouchScreen)
         {
            _content.txtOfficerNote.fontSize = 16;
         }
         collapse(true);
      }
      
      public function dispose() : void
      {
         _btnBackgroundCollapse.dispose();
         _btnBackgroundCollapse = null;
         _btnBackgroundExpand.dispose();
         _btnBackgroundExpand = null;
         _clickLayer.dispose();
         _textTooltip.dispose();
         _textTooltip = null;
      }
      
      public function collapse(param1:Boolean, param2:Boolean = false) : void
      {
         _content.bgCollapsed.visible = param1;
         _content.bgExpanded.visible = !param1;
         if(_content.bgCollapsed.visible)
         {
            _content.txtOfficerNote.y = 13 + LayoutUtil.deviceAdjustedHeightCorrection;
            _content.txtOfficerNote.height = 101.5;
         }
         else
         {
            _content.txtOfficerNote.y = -189;
            _content.txtOfficerNote.height = 308.5 + LayoutUtil.deviceAdjustedHeightCorrection;
         }
         _content.clickLayer.y = _content.txtOfficerNote.y;
         _content.clickLayer.height = _content.txtOfficerNote.height;
         refresh(_guild);
         if(param2 && _onCollapseChanged != null)
         {
            _onCollapseChanged(_content.bgCollapsed.visible);
         }
      }
      
      private function onClickBackgroundCollapse(param1:InteractionEvent) : void
      {
         collapse(true,true);
      }
      
      private function onClickBackgroundExpand(param1:InteractionEvent) : void
      {
         collapse(false,true);
      }
      
      private function handleClick(param1:InteractionEvent) : void
      {
         if(_guild)
         {
            Environment.audio.playFX("ui_button_click.mp3");
            Environment.panelManager.showDialog(new DialogGuildOfficerNote(_guild));
         }
      }
      
      public function refresh(param1:Guild) : void
      {
         var _loc3_:* = null;
         var _loc2_:int = 0;
         _content.txtOfficerNote.text = "";
         _guild = null;
         if(param1 == null)
         {
            return;
         }
         if(!param1.hasData("officer_note"))
         {
            return;
         }
         if(!param1.isOwnGuild || User.current.character.guildRank == 3)
         {
            return;
         }
         _guild = param1;
         _textTooltip.text = LocText.current.text("screen/guild/officer_note_change_tooltip");
         _content.txtOfficerNote.text = _guild.officerNote;
         if(_content.txtOfficerNote.textHeight >= _content.txtOfficerNote.height)
         {
            _loc3_ = "";
            _loc2_ = 0;
            while(_loc2_ < _content.txtOfficerNote.lastVisibleLine - 1)
            {
               _loc3_ = _loc3_ + _content.txtOfficerNote.getLineText(_loc2_);
               _loc2_++;
            }
            _loc3_ = _loc3_ + ("... [" + LocText.current.text("screen/character/description/text_more") + "]");
            _content.txtOfficerNote.text = _loc3_;
         }
      }
      
      public function set visible(param1:Boolean) : void
      {
         _content.visible = param1;
      }
      
      public function get visible() : Boolean
      {
         return _content.visible;
      }
   }
}
