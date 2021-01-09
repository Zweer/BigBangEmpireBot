package com.playata.application.ui.elements.sewing_machine
{
   import com.playata.application.data.constants.CItemTemplate;
   import com.playata.application.data.item.Item;
   import com.playata.application.data.sewing_machine.SewingMachineFilter;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.checkbox.UiCheckBox;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.display.ui.controls.ITextInput;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.sewing_machine.SymbolSewingMachineFilterGeneric;
   
   public class UiSewingMachineFilter
   {
      
      private static var _filterText:String = "";
      
      private static var _showEventItem:Boolean = true;
      
      private static var _showStoryDungeonItem:Boolean = true;
      
      private static var _showOtherItem:Boolean = true;
      
      private static var _showCommon:Boolean = true;
      
      private static var _showRare:Boolean = true;
      
      private static var _showEpic:Boolean = true;
      
      private static var _itemQuality:int = 3;
       
      
      private var _content:SymbolSewingMachineFilterGeneric = null;
      
      private var _callback:Function = null;
      
      private var _ckbShowEventItem:UiCheckBox = null;
      
      private var _ckbShowStoryDungeonItem:UiCheckBox = null;
      
      private var _ckbShowOtherItem:UiCheckBox = null;
      
      private var _ckbShowCommon:UiCheckBox = null;
      
      private var _ckbShowRare:UiCheckBox = null;
      
      private var _ckbShowEpic:UiCheckBox = null;
      
      private var _tooltipSearch:UiTextTooltip = null;
      
      private var _btnSaveSettings:UiButton = null;
      
      public function UiSewingMachineFilter(param1:SymbolSewingMachineFilterGeneric, param2:Function)
      {
         super();
         _content = param1;
         _content.visible = false;
         _callback = param2;
         getSavedSettings();
         _content.txtShowEventItem.text = LocText.current.text("dialog/sewing_machine/show_event_items");
         _content.txtShowEventItem.autoFontSize = true;
         _content.txtShowStoryDungeonItem.text = LocText.current.text("dialog/sewing_machine/show_story_dungeon_items");
         _content.txtShowStoryDungeonItem.autoFontSize = true;
         _content.txtShowOtherItem.text = LocText.current.text("dialog/sewing_machine/show_other_items");
         _content.txtShowOtherItem.autoFontSize = true;
         _content.txtShowCommon.text = LocText.current.text("dialog/sewing_machine/show_common_items");
         _content.txtShowCommon.autoFontSize = true;
         _content.txtShowRare.text = LocText.current.text("dialog/sewing_machine/show_rare_items");
         _content.txtShowRare.autoFontSize = true;
         _content.txtShowEpic.text = LocText.current.text("dialog/sewing_machine/show_epic_items");
         _content.txtShowEpic.autoFontSize = true;
         _ckbShowEventItem = new UiCheckBox(_content.ckbShowEventItem,_showEventItem,"",onCheckedChangedShowEventItem,null,_content.txtShowEventItem);
         _ckbShowStoryDungeonItem = new UiCheckBox(_content.ckbShowStoryDungeonItem,_showStoryDungeonItem,"",onCheckedChangedShowStoryDungeonItem,null,_content.txtShowStoryDungeonItem);
         _ckbShowOtherItem = new UiCheckBox(_content.ckbShowOtherItem,_showOtherItem,"",onCheckedChangedShowOtherItem,null,_content.txtShowOtherItem);
         _ckbShowCommon = new UiCheckBox(_content.ckbShowCommon,_showCommon,"",onCheckedChangedShowCommon,null,_content.txtShowCommon);
         _ckbShowRare = new UiCheckBox(_content.ckbShowRare,_showRare,"",onCheckedChangedShowRare,null,_content.txtShowRare);
         _ckbShowEpic = new UiCheckBox(_content.ckbShowEpic,_showEpic,"",onCheckedChangedShowEpic,null,_content.txtShowEpic);
         _tooltipSearch = new UiTextTooltip(_content.inputSearch,LocText.current.text("dialog/sewing_machine/button_search_tooltip"));
         if(_filterText != "")
         {
            _content.inputSearch.text = _filterText;
         }
         else
         {
            _content.inputSearch.text = LocText.current.text("dialog/sewing_machine/search_text");
         }
         _content.inputSearch.onClick.add(handleSearchClick);
         _content.inputSearch.onChange.add(handleTextChanged);
         _btnSaveSettings = new UiButton(_content.btnSaveSettings,LocText.current.text("dialog/sewing_machine/button_save_filter"),updateSavedSettings);
         _content.background.applySettings(new TypedObject({"interactionEnabled":true}));
         updateSaveButton();
      }
      
      public static function isAllowed(param1:String) : Boolean
      {
         var _loc3_:* = null;
         var _loc4_:Boolean = true;
         if(!CItemTemplate.exists(param1))
         {
            return false;
         }
         var _loc2_:CItemTemplate = CItemTemplate.fromId(param1);
         if(_loc2_.quality == 1 && !_showCommon && _itemQuality >= 2)
         {
            _loc4_ = false;
         }
         else if(_loc2_.quality == 2 && !_showRare && _itemQuality >= 2)
         {
            _loc4_ = false;
         }
         else if(_loc2_.quality == 3 && !_showEpic && _itemQuality >= 3)
         {
            _loc4_ = false;
         }
         if(_loc4_)
         {
            _loc4_ = false;
            if(!_loc4_ && Item.isStoryDungeonItem(param1))
            {
               _loc4_ = _showStoryDungeonItem;
            }
            if(!_loc4_ && _loc2_.isEvent)
            {
               _loc4_ = _showEventItem;
            }
            if(!_loc4_ && !Item.isStoryDungeonItem(param1) && !_loc2_.isEvent)
            {
               _loc4_ = _showOtherItem;
            }
         }
         if(!_loc4_)
         {
            return _loc4_;
         }
         if(_filterText != "" && _filterText != LocText.current.text("dialog/sewing_machine/search_text"))
         {
            _loc3_ = LocText.current.text("item/" + Item.getBaseIdentifier(param1) + "/name");
            if(_loc3_.toLowerCase().indexOf(_filterText) >= 0)
            {
               return true;
            }
            return false;
         }
         return true;
      }
      
      public static function get isFilterActive() : Boolean
      {
         return !_showEventItem || !_showStoryDungeonItem || !_showOtherItem || !_showCommon && _itemQuality >= 2 || !_showRare && _itemQuality >= 2 || !_showEpic && _itemQuality >= 3;
      }
      
      public function set itemQuality(param1:int) : void
      {
         _itemQuality = param1;
         var _loc2_:* = _itemQuality >= 2;
         _ckbShowCommon.visible = _loc2_;
         _loc2_ = _loc2_;
         _content.txtShowCommon.visible = _loc2_;
         _content.iconShowCommon.visible = _loc2_;
         _loc2_ = _itemQuality >= 2;
         _ckbShowRare.visible = _loc2_;
         _loc2_ = _loc2_;
         _content.txtShowRare.visible = _loc2_;
         _content.iconShowRare.visible = _loc2_;
         _loc2_ = _itemQuality >= 3;
         _ckbShowEpic.visible = _loc2_;
         _loc2_ = _loc2_;
         _content.txtShowEpic.visible = _loc2_;
         _content.iconShowEpic.visible = _loc2_;
         if(_content.txtShowEpic.visible)
         {
            _btnSaveSettings.y = _content.txtShowEpic.y;
            _content.background.height = _content.txtShowEpic.y + 70;
            _content.txtShowOtherItem.width = 265;
            _content.txtShowRare.width = 240;
         }
         else if(_content.txtShowRare.visible)
         {
            _btnSaveSettings.y = _content.txtShowRare.y;
            _content.background.height = _content.txtShowRare.y + 70;
            _content.txtShowOtherItem.width = 265;
            _content.txtShowRare.width = 205;
         }
         else
         {
            _btnSaveSettings.y = _content.txtShowOtherItem.y;
            _content.background.height = _content.txtShowOtherItem.y + 70;
            _content.txtShowOtherItem.width = 230;
         }
      }
      
      public function dispose() : void
      {
         _btnSaveSettings.dispose();
         _btnSaveSettings = null;
         _ckbShowEventItem.dispose();
         _ckbShowEventItem = null;
         _ckbShowStoryDungeonItem.dispose();
         _ckbShowStoryDungeonItem = null;
         _ckbShowOtherItem.dispose();
         _ckbShowOtherItem = null;
         _ckbShowCommon.dispose();
         _ckbShowCommon = null;
         _ckbShowRare.dispose();
         _ckbShowRare = null;
         _ckbShowEpic.dispose();
         _ckbShowEpic = null;
         _tooltipSearch.dispose();
         _tooltipSearch = null;
         _callback = null;
         _content = null;
         _filterText = "";
         _showEventItem = true;
         _showStoryDungeonItem = true;
         _showOtherItem = true;
         _showCommon = true;
         _showRare = true;
         _showEpic = true;
         _itemQuality = 3;
      }
      
      private function getSavedSettings() : void
      {
         var _loc1_:SewingMachineFilter = User.current.sewingMachineFilter;
         if(_loc1_)
         {
            _showEventItem = _loc1_.showEventItem;
            _showStoryDungeonItem = _loc1_.showStoryDungeonItem;
            _showOtherItem = _loc1_.showOtherItem;
            _showCommon = _loc1_.showCommon;
            _showRare = _loc1_.showRare;
            _showEpic = _loc1_.showEpic;
         }
      }
      
      private function updateSavedSettings(param1:InteractionEvent) : void
      {
         var _loc2_:* = null;
         if(!_showEventItem && !_showStoryDungeonItem && !_showOtherItem && !_showCommon && !_showRare && !_showEpic)
         {
            _loc2_ = {
               "sei":true,
               "ssdi":true,
               "soi":true,
               "srci":true,
               "srri":true,
               "srei":true
            };
         }
         else
         {
            _loc2_ = {
               "sei":_showEventItem,
               "ssdi":_showStoryDungeonItem,
               "soi":_showOtherItem,
               "srci":_showCommon,
               "srri":_showRare,
               "srei":_showEpic
            };
         }
         User.current.setSettingValue("sewing_machine_filter_settings",_loc2_);
         updateSaveButton();
      }
      
      public function toggle() : void
      {
         _content.visible = !_content.visible;
         if(_content.inputSearch.text == "")
         {
            _content.inputSearch.text = LocText.current.text("dialog/sewing_machine/search_text");
         }
      }
      
      public function hide() : void
      {
         _content.visible = false;
         if(_content.inputSearch.text == "")
         {
            _content.inputSearch.text = LocText.current.text("dialog/sewing_machine/search_text");
         }
      }
      
      private function handleSearchClick(param1:InteractionEvent) : void
      {
         if(_content.inputSearch.text == LocText.current.text("dialog/sewing_machine/search_text"))
         {
            _content.inputSearch.text = "";
         }
      }
      
      private function handleTextChanged(param1:ITextInput) : void
      {
         _filterText = _content.inputSearch.text.toLowerCase();
         Runtime.delayFunction(textChanged,0.5,[_filterText]);
      }
      
      private function textChanged(param1:String) : void
      {
         if(_callback != null && param1 == _filterText)
         {
            _callback();
         }
      }
      
      private function onCheckedChangedShowEventItem(param1:Boolean) : void
      {
         _showEventItem = param1;
         _callback();
         updateSaveButton();
      }
      
      private function onCheckedChangedShowStoryDungeonItem(param1:Boolean) : void
      {
         _showStoryDungeonItem = param1;
         _callback();
         updateSaveButton();
      }
      
      private function onCheckedChangedShowOtherItem(param1:Boolean) : void
      {
         _showOtherItem = param1;
         _callback();
         updateSaveButton();
      }
      
      private function onCheckedChangedShowCommon(param1:Boolean) : void
      {
         _showCommon = param1;
         _callback();
         updateSaveButton();
      }
      
      private function onCheckedChangedShowRare(param1:Boolean) : void
      {
         _showRare = param1;
         _callback();
         updateSaveButton();
      }
      
      private function onCheckedChangedShowEpic(param1:Boolean) : void
      {
         _showEpic = param1;
         _callback();
         updateSaveButton();
      }
      
      private function updateSaveButton() : void
      {
         var _loc1_:SewingMachineFilter = User.current.sewingMachineFilter;
         if(_loc1_)
         {
            _btnSaveSettings.buttonEnabled = !(_showEventItem == _loc1_.showEventItem && _showStoryDungeonItem == _loc1_.showStoryDungeonItem && _showOtherItem == _loc1_.showOtherItem && _showCommon == _loc1_.showCommon && _showRare == _loc1_.showRare && _showEpic == _loc1_.showEpic);
         }
      }
   }
}
