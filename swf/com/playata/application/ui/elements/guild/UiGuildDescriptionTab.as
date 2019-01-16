package com.playata.application.ui.elements.guild
{
   import com.playata.application.data.guild.Guild;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.dialogs.DialogGuildDescriptionNote;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.guild.SymbolGuildDescriptionTabGeneric;
   
   public class UiGuildDescriptionTab
   {
       
      
      private var _guild:Guild = null;
      
      private var _content:SymbolGuildDescriptionTabGeneric = null;
      
      private var _textTooltip:UiTextTooltip = null;
      
      private var _btnBackgroundCollapse:UiButton = null;
      
      private var _btnBackgroundExpand:UiButton = null;
      
      private var _onCollapseChanged:Function = null;
      
      private var _clickLayer:InteractiveDisplayObject;
      
      public function UiGuildDescriptionTab(param1:SymbolGuildDescriptionTabGeneric, param2:Function)
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
            _content.txtDescription.fontSize = 16;
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
            _content.txtDescription.y = 13;
            _content.txtDescription.height = 102;
         }
         else
         {
            _content.txtDescription.y = -165;
            _content.txtDescription.height = 294;
         }
         _content.clickLayer.y = _content.txtDescription.y;
         _content.clickLayer.height = _content.txtDescription.height;
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
         Environment.audio.playFX("ui_button_click.mp3");
         Environment.panelManager.showDialog(new DialogGuildDescriptionNote(_guild,true));
      }
      
      public function refresh(param1:Guild) : void
      {
         var _loc3_:* = null;
         var _loc2_:int = 0;
         _guild = param1;
         if(_guild == null)
         {
            return;
         }
         if(_guild.isOwnGuild && User.current.character.guildRank != 3)
         {
            _textTooltip.text = LocText.current.text("screen/guild/description_change_tooltip");
         }
         else
         {
            _textTooltip.text = LocText.current.text("screen/guild/description_read_tooltip");
         }
         _content.txtDescription.text = param1.description;
         if(_content.txtDescription.textHeight >= _content.txtDescription.height)
         {
            _loc3_ = "";
            _loc2_ = 0;
            while(_loc2_ < _content.txtDescription.lastVisibleLine - 1)
            {
               _loc3_ = _loc3_ + _content.txtDescription.getLineText(_loc2_);
               _loc2_++;
            }
            _loc3_ = _loc3_ + ("... [" + LocText.current.text("screen/character/description/text_more") + "]");
            _content.txtDescription.text = _loc3_;
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
