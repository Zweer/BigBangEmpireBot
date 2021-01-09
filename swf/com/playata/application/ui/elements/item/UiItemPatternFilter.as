package com.playata.application.ui.elements.item
{
   import com.playata.application.data.constants.CItemTemplate;
   import com.playata.application.data.item.Item;
   import com.playata.application.data.item.ItemPatternFilter;
   import com.playata.application.data.item_pattern.ItemPattern;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.checkbox.UiCheckBox;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.display.ui.controls.ITextInput;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.sewing_machine.SymbolItemPatternFilterGeneric;
   
   public class UiItemPatternFilter
   {
      
      private static var _filterText:String = "";
      
      private static var _showStatRewards:Boolean = true;
      
      private static var _showItemRewards:Boolean = true;
      
      private static var _showEnergyRewards:Boolean = true;
      
      private static var _showTitleRewards:Boolean = true;
      
      private static var _showEventItem:Boolean = true;
      
      private static var _showStoryDungeonItem:Boolean = true;
      
      private static var _showOtherItem:Boolean = true;
      
      private static var _showCommon:Boolean = true;
      
      private static var _showRare:Boolean = true;
      
      private static var _showEpic:Boolean = true;
       
      
      private var _content:SymbolItemPatternFilterGeneric = null;
      
      private var _callback:Function = null;
      
      private var _ckbShowStat:UiCheckBox = null;
      
      private var _ckbShowItem:UiCheckBox = null;
      
      private var _ckbShowEnergy:UiCheckBox = null;
      
      private var _ckbShowTitle:UiCheckBox = null;
      
      private var _ckbShowEventItem:UiCheckBox = null;
      
      private var _ckbShowStoryDungeonItem:UiCheckBox = null;
      
      private var _ckbShowOtherItem:UiCheckBox = null;
      
      private var _ckbShowCommon:UiCheckBox = null;
      
      private var _ckbShowRare:UiCheckBox = null;
      
      private var _ckbShowEpic:UiCheckBox = null;
      
      private var _tooltipSearch:UiTextTooltip = null;
      
      private var _btnSaveSettings:UiButton = null;
      
      public function UiItemPatternFilter(param1:SymbolItemPatternFilterGeneric, param2:Function)
      {
         super();
         _content = param1;
         _content.visible = false;
         _callback = param2;
         getSavedSettings();
         _content.txtShowStatRewards.text = LocText.current.text("dialog/item_pattern/show_stat_rewards");
         _content.txtShowStatRewards.autoFontSize = true;
         _content.txtShowItemRewards.text = LocText.current.text("dialog/item_pattern/show_item_rewards");
         _content.txtShowItemRewards.autoFontSize = true;
         _content.txtShowEnergyRewards.text = LocText.current.text("dialog/item_pattern/show_quest_energy_rewards");
         _content.txtShowEnergyRewards.autoFontSize = true;
         _content.txtShowTitleRewards.text = LocText.current.text("dialog/item_pattern/show_title_rewards");
         _content.txtShowTitleRewards.autoFontSize = true;
         _content.txtShowEventItem.text = LocText.current.text("dialog/item_pattern/show_event_items");
         _content.txtShowEventItem.autoFontSize = true;
         _content.txtShowStoryDungeonItem.text = LocText.current.text("dialog/item_pattern/show_story_dungeon_items");
         _content.txtShowStoryDungeonItem.autoFontSize = true;
         _content.txtShowOtherItem.text = LocText.current.text("dialog/item_pattern/show_other_items");
         _content.txtShowOtherItem.autoFontSize = true;
         _content.txtShowCommon.text = LocText.current.text("dialog/item_pattern/show_common_items");
         _content.txtShowCommon.autoFontSize = true;
         _content.txtShowRare.text = LocText.current.text("dialog/item_pattern/show_rare_items");
         _content.txtShowRare.autoFontSize = true;
         _content.txtShowEpic.text = LocText.current.text("dialog/item_pattern/show_epic_items");
         _content.txtShowEpic.autoFontSize = true;
         _ckbShowStat = new UiCheckBox(_content.ckbShowStatRewards,_showStatRewards,"",onCheckedChangedShowStatRewards,null,_content.txtShowStatRewards);
         _ckbShowItem = new UiCheckBox(_content.ckbShowItemRewards,_showItemRewards,"",onCheckedChangedShowItemRewards,null,_content.txtShowItemRewards);
         _ckbShowEnergy = new UiCheckBox(_content.ckbShowEnergyRewards,_showEnergyRewards,"",onCheckedChangedShowEnergyRewards,null,_content.txtShowEnergyRewards);
         _ckbShowTitle = new UiCheckBox(_content.ckbShowTitleRewards,_showTitleRewards,"",onCheckedChangedShowTitleRewards,null,_content.txtShowTitleRewards);
         _ckbShowEventItem = new UiCheckBox(_content.ckbShowEventItem,_showEventItem,"",onCheckedChangedShowEventItem,null,_content.txtShowEventItem);
         _ckbShowStoryDungeonItem = new UiCheckBox(_content.ckbShowStoryDungeonItem,_showStoryDungeonItem,"",onCheckedChangedShowStoryDungeonItem,null,_content.txtShowStoryDungeonItem);
         _ckbShowOtherItem = new UiCheckBox(_content.ckbShowOtherItem,_showOtherItem,"",onCheckedChangedShowOtherItem,null,_content.txtShowOtherItem);
         _ckbShowCommon = new UiCheckBox(_content.ckbShowCommon,_showCommon,"",onCheckedChangedShowCommon,null,_content.txtShowCommon);
         _ckbShowRare = new UiCheckBox(_content.ckbShowRare,_showRare,"",onCheckedChangedShowRare,null,_content.txtShowRare);
         _ckbShowEpic = new UiCheckBox(_content.ckbShowEpic,_showEpic,"",onCheckedChangedShowEpic,null,_content.txtShowEpic);
         _tooltipSearch = new UiTextTooltip(_content.inputSearch,LocText.current.text("dialog/item_pattern/button_search_tooltip"));
         if(_filterText != "")
         {
            _content.inputSearch.text = _filterText;
         }
         else
         {
            _content.inputSearch.text = LocText.current.text("dialog/item_pattern/search_text");
         }
         _content.inputSearch.onClick.add(handleSearchClick);
         _content.inputSearch.onChange.add(handleTextChanged);
         _btnSaveSettings = new UiButton(_content.btnSaveSettings,LocText.current.text("dialog/item_pattern/button_save_filter"),updateSavedSettings);
         _content.background.applySettings(new TypedObject({"interactionEnabled":true}));
         updateSaveButton();
      }
      
      public static function isAllowed(param1:ItemPattern) : Boolean
      {
         var _loc2_:Boolean = true;
         switch(int(param1.currentTargetValue().rewardType) - 1)
         {
            case 0:
               _loc2_ = _showStatRewards;
               break;
            case 1:
               _loc2_ = _showItemRewards;
               break;
            case 2:
               _loc2_ = _showEnergyRewards;
         }
         if(!_loc2_ && param1.currentTargetValue().hasTitleReward)
         {
            _loc2_ = _showTitleRewards;
         }
         if(_loc2_)
         {
            _loc2_ = false;
            var _loc5_:int = 0;
            var _loc4_:* = param1.getItemIdentifiers(User.current.character.gender);
            for each(var _loc3_ in param1.getItemIdentifiers(User.current.character.gender))
            {
               if(isItemAllowed(_loc3_,param1))
               {
                  _loc2_ = true;
                  break;
               }
            }
            if(!_loc2_ && _filterText != "" && _filterText != LocText.current.text("dialog/item_pattern/search_text"))
            {
               if(param1.title.toLowerCase().indexOf(_filterText) >= 0)
               {
                  _loc2_ = true;
               }
               else
               {
                  _loc2_ = false;
               }
            }
         }
         return _loc2_;
      }
      
      public static function isItemAllowed(param1:String, param2:ItemPattern) : Boolean
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:Boolean = true;
         if(_filterText != "" && _filterText != LocText.current.text("dialog/item_pattern/search_text"))
         {
            if(param2.title.toLowerCase().indexOf(_filterText) < 0)
            {
               _loc5_ = false;
            }
            if(!_loc5_)
            {
               _loc3_ = LocText.current.text("item/" + Item.getBaseIdentifier(param1) + "/name");
               if(_loc3_.toLowerCase().indexOf(_filterText) >= 0)
               {
                  _loc5_ = true;
               }
            }
         }
         if(_loc5_)
         {
            _loc4_ = CItemTemplate.fromId(param1);
            if(_loc4_.quality == 1 && !_showCommon)
            {
               _loc5_ = false;
            }
            else if(_loc4_.quality == 2 && !_showRare)
            {
               _loc5_ = false;
            }
            else if(_loc4_.quality == 3 && !_showEpic)
            {
               _loc5_ = false;
            }
            if(_loc5_)
            {
               _loc5_ = false;
               if(!_loc5_ && Item.isStoryDungeonItem(param1))
               {
                  _loc5_ = _showStoryDungeonItem;
               }
               if(!_loc5_ && _loc4_.isEvent)
               {
                  _loc5_ = _showEventItem;
               }
               if(!_loc5_ && !Item.isStoryDungeonItem(param1) && !_loc4_.isEvent)
               {
                  _loc5_ = _showOtherItem;
               }
            }
         }
         return _loc5_;
      }
      
      public static function get isFilterActive() : Boolean
      {
         return !_showStatRewards || !_showItemRewards || !_showEnergyRewards || !_showTitleRewards || !_showEventItem || !_showStoryDungeonItem || !_showOtherItem || !_showCommon || !_showRare || !_showEpic;
      }
      
      public function dispose() : void
      {
         _btnSaveSettings.dispose();
         _btnSaveSettings = null;
         _ckbShowStat.dispose();
         _ckbShowStat = null;
         _ckbShowItem.dispose();
         _ckbShowItem = null;
         _ckbShowEnergy.dispose();
         _ckbShowEnergy = null;
         _ckbShowTitle.dispose();
         _ckbShowTitle = null;
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
         _callback = null;
         _content = null;
         _filterText = "";
         _showStatRewards = true;
         _showItemRewards = true;
         _showEnergyRewards = true;
         _showTitleRewards = true;
         _showEventItem = true;
         _showStoryDungeonItem = true;
         _showOtherItem = true;
         _showCommon = true;
         _showRare = true;
         _showEpic = true;
      }
      
      private function getSavedSettings() : void
      {
         var _loc1_:ItemPatternFilter = User.current.itemPatternFilter;
         if(_loc1_)
         {
            _showStatRewards = _loc1_.showStatRewards;
            _showItemRewards = _loc1_.showItemRewards;
            _showEnergyRewards = _loc1_.showEnergyRewards;
            _showTitleRewards = _loc1_.showTitleRewards;
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
         if(!_showStatRewards && !_showItemRewards && !_showEnergyRewards && !_showTitleRewards && !_showEventItem && !_showStoryDungeonItem && !_showOtherItem && !_showCommon && !_showRare && !_showEpic)
         {
            _loc2_ = {
               "ssr":true,
               "sir":true,
               "ser":true,
               "str":true,
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
               "ssr":_showStatRewards,
               "sir":_showItemRewards,
               "ser":_showEnergyRewards,
               "str":_showTitleRewards,
               "sei":_showEventItem,
               "ssdi":_showStoryDungeonItem,
               "soi":_showOtherItem,
               "srci":_showCommon,
               "srri":_showRare,
               "srei":_showEpic
            };
         }
         User.current.setSettingValue("item_pattern_filter_settings",_loc2_);
         updateSaveButton();
      }
      
      public function toggle() : void
      {
         _content.visible = !_content.visible;
         if(_content.inputSearch.text == "")
         {
            _content.inputSearch.text = LocText.current.text("dialog/item_pattern/search_text");
         }
      }
      
      public function hide() : void
      {
         _content.visible = false;
         if(_content.inputSearch.text == "")
         {
            _content.inputSearch.text = LocText.current.text("dialog/item_pattern/search_text");
         }
      }
      
      private function handleSearchClick(param1:InteractionEvent) : void
      {
         if(_content.inputSearch.text == LocText.current.text("dialog/item_pattern/search_text"))
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
      
      private function onCheckedChangedShowStatRewards(param1:Boolean) : void
      {
         _showStatRewards = param1;
         _callback();
         updateSaveButton();
      }
      
      private function onCheckedChangedShowItemRewards(param1:Boolean) : void
      {
         _showItemRewards = param1;
         _callback();
         updateSaveButton();
      }
      
      private function onCheckedChangedShowEnergyRewards(param1:Boolean) : void
      {
         _showEnergyRewards = param1;
         _callback();
         updateSaveButton();
      }
      
      private function onCheckedChangedShowTitleRewards(param1:Boolean) : void
      {
         _showTitleRewards = param1;
         _callback();
         updateSaveButton();
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
         var _loc1_:ItemPatternFilter = User.current.itemPatternFilter;
         if(_loc1_)
         {
            _btnSaveSettings.buttonEnabled = !(_showStatRewards == _loc1_.showStatRewards && _showItemRewards == _loc1_.showItemRewards && _showEnergyRewards == _loc1_.showEnergyRewards && _showTitleRewards == _loc1_.showTitleRewards && _showEventItem == _loc1_.showEventItem && _showStoryDungeonItem == _loc1_.showStoryDungeonItem && _showOtherItem == _loc1_.showOtherItem && _showCommon == _loc1_.showCommon && _showRare == _loc1_.showRare && _showEpic == _loc1_.showEpic);
         }
      }
   }
}
