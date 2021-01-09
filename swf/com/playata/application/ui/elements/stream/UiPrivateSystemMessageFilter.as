package com.playata.application.ui.elements.stream
{
   import com.playata.application.data.stream.PrivateSystemMessage;
   import com.playata.application.data.stream.SystemMessageFilter;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.checkbox.UiCheckBox;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.stream.SymbolPrivateSystemMessageFilterGeneric;
   
   public class UiPrivateSystemMessageFilter
   {
      
      private static var _showSystemMails:Boolean = true;
      
      private static var _showItemMails:Boolean = true;
      
      private static var _showGuildMails:Boolean = true;
      
      private static var _showMarriageProposalMails:Boolean = true;
       
      
      private var _content:SymbolPrivateSystemMessageFilterGeneric = null;
      
      private var _callback:Function = null;
      
      private var _ckbShowSystemMails:UiCheckBox = null;
      
      private var _ckbShowItemMails:UiCheckBox = null;
      
      private var _ckbShowGuildMails:UiCheckBox = null;
      
      private var _ckbShowProposeMarriageMails:UiCheckBox = null;
      
      private var _btnSaveSettings:UiButton = null;
      
      private var _systemMailIcon:UiSystemStreamIcon = null;
      
      public function UiPrivateSystemMessageFilter(param1:SymbolPrivateSystemMessageFilterGeneric, param2:Function)
      {
         super();
         _content = param1;
         _content.visible = false;
         _callback = param2;
         getSavedSettings();
         _content.txtShowSystemMails.text = LocText.current.text("dialog/mailbox/show_system_mails");
         _content.txtShowSystemMails.autoFontSize = true;
         _content.txtShowItemMails.text = LocText.current.text("dialog/mailbox/show_item_mails");
         _content.txtShowItemMails.autoFontSize = true;
         _content.txtShowTeamMails.text = LocText.current.text("dialog/mailbox/show_team_mails");
         _content.txtShowTeamMails.autoFontSize = true;
         _content.txtShowProposeMarriageMails.text = LocText.current.text("dialog/mailbox/show_propose_marriage_mails");
         _content.txtShowProposeMarriageMails.autoFontSize = true;
         _ckbShowSystemMails = new UiCheckBox(_content.ckbShowSystemMails,_showSystemMails,"",onCheckedChangedShowSystemMails,null,_content.txtShowSystemMails);
         _ckbShowItemMails = new UiCheckBox(_content.ckbShowItemMails,_showItemMails,"",onCheckedChangedShowItemMails,null,_content.txtShowItemMails);
         _ckbShowGuildMails = new UiCheckBox(_content.ckbShowTeamMails,_showGuildMails,"",onCheckedChangedShowGuildMails,null,_content.txtShowTeamMails);
         _ckbShowProposeMarriageMails = new UiCheckBox(_content.ckbShowProposeMarriageMails,_showMarriageProposalMails,"",onCheckedChangedShowProposeMarriageMails,null,_content.txtShowProposeMarriageMails);
         _btnSaveSettings = new UiButton(_content.btnSaveSettings,LocText.current.text("dialog/mail_filter/button_save"),onClickSave);
         _content.background.applySettings(new TypedObject({"interactionEnabled":true}));
         _systemMailIcon = new UiSystemStreamIcon(_content.iconSystemMail);
         updateSaveButton();
      }
      
      public static function isAllowed(param1:PrivateSystemMessage) : Boolean
      {
         var _loc2_:Boolean = true;
         if(param1.isSystemMessage)
         {
            _loc2_ = _showSystemMails;
         }
         else if(param1.isItemMessage)
         {
            _loc2_ = _showItemMails;
         }
         else if(param1.isGuildMessage)
         {
            _loc2_ = _showGuildMails;
         }
         else if(param1.isPrivateConversationMarriageProposal)
         {
            _loc2_ = _showMarriageProposalMails;
         }
         return _loc2_;
      }
      
      public static function get filterSettings() : TypedObject
      {
         var _loc1_:TypedObject = new TypedObject({
            "ssm":_showSystemMails,
            "sim":_showItemMails,
            "stm":_showGuildMails,
            "smm":_showMarriageProposalMails
         });
         return _loc1_;
      }
      
      public static function get isFilterActive() : Boolean
      {
         return !_showSystemMails || !_showItemMails || !_showGuildMails || !_showMarriageProposalMails;
      }
      
      public function refreshLocalization() : void
      {
         _content.txtShowSystemMails.text = LocText.current.text("dialog/mailbox/show_system_mails");
         _content.txtShowItemMails.text = LocText.current.text("dialog/mailbox/show_item_mails");
         _content.txtShowTeamMails.text = LocText.current.text("dialog/mailbox/show_team_mails");
         _content.txtShowProposeMarriageMails.text = LocText.current.text("dialog/mailbox/show_propose_marriage_mails");
         _btnSaveSettings.tooltip = LocText.current.text("dialog/mail_filter/button_save");
      }
      
      public function dispose() : void
      {
         _btnSaveSettings.dispose();
         _btnSaveSettings = null;
         _ckbShowSystemMails.dispose();
         _ckbShowSystemMails = null;
         _ckbShowItemMails.dispose();
         _ckbShowItemMails = null;
         _ckbShowGuildMails.dispose();
         _ckbShowGuildMails = null;
         _ckbShowProposeMarriageMails.dispose();
         _ckbShowProposeMarriageMails = null;
         _systemMailIcon = null;
         _callback = null;
         _content = null;
         _showSystemMails = true;
         _showItemMails = true;
         _showGuildMails = true;
         _showMarriageProposalMails = true;
      }
      
      private function getSavedSettings() : void
      {
         var _loc1_:SystemMessageFilter = User.current.systemMessageFilter;
         if(_loc1_)
         {
            _showSystemMails = _loc1_.showSystemMails;
            _showItemMails = _loc1_.showItemMails;
            _showGuildMails = _loc1_.showGuildMails;
            _showMarriageProposalMails = _loc1_.showGuildMails;
         }
      }
      
      private function onClickSave(param1:InteractionEvent) : void
      {
         var _loc2_:* = null;
         if(!_showSystemMails && !_showItemMails && !_showGuildMails && !_showMarriageProposalMails)
         {
            _loc2_ = {
               "ssm":true,
               "sim":true,
               "stm":true,
               "smm":true
            };
         }
         else
         {
            _loc2_ = {
               "ssm":_showSystemMails,
               "sim":_showItemMails,
               "stm":_showGuildMails,
               "smm":_showMarriageProposalMails
            };
         }
         User.current.setSettingValue("system_message_filter_settings",_loc2_);
         updateSaveButton();
         hide();
      }
      
      public function toggle() : void
      {
         _content.visible = !_content.visible;
         _systemMailIcon.refresh(true);
      }
      
      public function hide() : void
      {
         _content.visible = false;
      }
      
      private function onCheckedChangedShowSystemMails(param1:Boolean) : void
      {
         _showSystemMails = param1;
         _callback();
         updateSaveButton();
      }
      
      private function onCheckedChangedShowItemMails(param1:Boolean) : void
      {
         _showItemMails = param1;
         _callback();
         updateSaveButton();
      }
      
      private function onCheckedChangedShowGuildMails(param1:Boolean) : void
      {
         _showGuildMails = param1;
         _callback();
         updateSaveButton();
      }
      
      private function onCheckedChangedShowProposeMarriageMails(param1:Boolean) : void
      {
         _showMarriageProposalMails = param1;
         _callback();
         updateSaveButton();
      }
      
      public function get content() : SymbolPrivateSystemMessageFilterGeneric
      {
         return _content;
      }
      
      private function updateSaveButton() : void
      {
         if(!ViewManager.instance)
         {
            return;
         }
         if(!User.current)
         {
            return;
         }
         var _loc1_:SystemMessageFilter = User.current.systemMessageFilter;
         if(_loc1_)
         {
            _btnSaveSettings.buttonEnabled = !(_showSystemMails == _loc1_.showSystemMails && _showItemMails == _loc1_.showItemMails && _showGuildMails == _loc1_.showGuildMails && _showMarriageProposalMails == _loc1_.showProposeMarriageMails);
         }
         else
         {
            _btnSaveSettings.buttonEnabled = isFilterActive;
         }
         _btnSaveSettings.alpha = !!_btnSaveSettings.buttonEnabled?1:0.5;
      }
   }
}
