package com.playata.application.ui.elements.guild
{
   import com.playata.application.data.constants.CGuildEmblemBackground;
   import com.playata.application.data.constants.CGuildEmblemColor;
   import com.playata.application.data.constants.CGuildEmblemIcon;
   import com.playata.application.data.guild.Guild;
   import com.playata.application.data.guild.GuildEmblemSettings;
   import com.playata.application.data.user.User;
   import com.playata.application.messaging.Message;
   import com.playata.application.messaging.MessageRouter;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.color_picker.UiColorBox;
   import com.playata.application.ui.elements.generic.color_picker.UiColorBoxPicker;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.core.util.StringUtil;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.guild.SymbolGuildEmblemContentGeneric;
   
   public class UiGuildEmblemContent
   {
       
      
      private var _content:SymbolGuildEmblemContentGeneric = null;
      
      private var _btnChange:UiTextButton = null;
      
      private var _btnShapePrevious:UiButton = null;
      
      private var _btnShapeNext:UiButton = null;
      
      private var _btnIconPrevious:UiButton = null;
      
      private var _btnIconNext:UiButton = null;
      
      private var _btnSizeDecrease:UiButton = null;
      
      private var _btnSizeIncrease:UiButton = null;
      
      private var _colorBoxShapeBackground:UiColorBox = null;
      
      private var _colorBoxShapeBorder:UiColorBox = null;
      
      private var _colorBoxIcon:UiColorBox = null;
      
      private var _colorBoxPicker:UiColorBoxPicker = null;
      
      private var _emblem:UiGuildEmblem = null;
      
      private var _guild:Guild = null;
      
      private var _currentSettings:GuildEmblemSettings = null;
      
      private var _onClose:Function = null;
      
      public function UiGuildEmblemContent(param1:Guild, param2:SymbolGuildEmblemContentGeneric, param3:Function)
      {
         super();
         _content = param2;
         _guild = param1;
         _onClose = param3;
         _currentSettings = param1.emblemSettings;
         _content.txtColorCaption.text = LocText.current.text("dialog/guild_emblem/color_caption");
         _content.txtCostIconCaption.text = LocText.current.text("dialog/guild_emblem/cost_icon_caption");
         _content.txtCostShapeCaption.text = LocText.current.text("dialog/guild_emblem/cost_shape_caption");
         _content.txtIconCaption.text = LocText.current.text("dialog/guild_emblem/icon_caption");
         _content.txtShapeCaption.text = LocText.current.text("dialog/guild_emblem/shape_caption");
         _content.txtSizeCaption.text = LocText.current.text("dialog/guild_emblem/size_caption");
         _btnChange = new UiTextButton(_content.btnChange,LocText.current.text("dialog/guild_emblem/button_change"),"",onClickChange);
         if(User.current.character.guildRank != 1)
         {
            _btnChange.tooltip = LocText.current.text("dialog/guild_emblem/button_change_no_permission_tooltip");
         }
         _btnShapePrevious = new UiButton(_content.btnShapePrevious,"",onClickShapePrevious);
         _btnShapeNext = new UiButton(_content.btnShapeNext,"",onClickShapeNext);
         _btnIconPrevious = new UiButton(_content.btnIconPrevious,"",onClickIconPrevious);
         _btnIconNext = new UiButton(_content.btnIconNext,"",onClickIconNext);
         _btnSizeDecrease = new UiButton(_content.btnSizeDecrease,LocText.current.text("dialog/guild_emblem/button_size_decrease_tooltip"),onClickSizeDecrease);
         _btnSizeIncrease = new UiButton(_content.btnSizeIncrease,LocText.current.text("dialog/guild_emblem/button_size_increase_tooltip"),onClickSizeIncrease);
         _colorBoxShapeBackground = new UiColorBox(_content.colorBoxShapeBackground,_currentSettings.emblemBackgroundColor,LocText.current.text("dialog/guild_emblem/shape_background_color_text"),onClickChangeEmblemBackgroundColor);
         _colorBoxShapeBorder = new UiColorBox(_content.colorBoxShapeBorder,_currentSettings.emblemBackgroundBorderColor,LocText.current.text("dialog/guild_emblem/shape_border_color_text"),onClickChangeEmblemBackgroundBorderColor);
         _colorBoxIcon = new UiColorBox(_content.colorBoxIcon,_currentSettings.emblemIconColor,LocText.current.text("dialog/guild_emblem/icon_color_text"),onClickChangeEmblemIconColor);
         _colorBoxPicker = new UiColorBoxPicker(_content.colorBoxPicker);
         _colorBoxPicker.content.bringToTop();
         _emblem = new UiGuildEmblem(_content.emblem,_currentSettings,150,150);
         MessageRouter.addListener("ViewMessage.notifyNeededGuildDonationMade",handleMessages);
         refresh();
      }
      
      public function dispose() : void
      {
         MessageRouter.removeAllListeners(handleMessages);
         _btnChange.dispose();
         _btnChange = null;
         _btnShapePrevious.dispose();
         _btnShapePrevious = null;
         _btnShapeNext.dispose();
         _btnShapeNext = null;
         _btnIconPrevious.dispose();
         _btnIconPrevious = null;
         _btnIconNext.dispose();
         _btnIconNext = null;
         _btnSizeDecrease.dispose();
         _btnSizeDecrease = null;
         _btnSizeIncrease.dispose();
         _btnSizeIncrease = null;
         _colorBoxIcon.dispose();
         _colorBoxIcon = null;
         _colorBoxShapeBackground.dispose();
         _colorBoxShapeBackground = null;
         _colorBoxShapeBorder.dispose();
         _colorBoxShapeBorder = null;
         _colorBoxPicker.dispose();
         _colorBoxPicker = null;
         _emblem.dispose();
         _emblem = null;
      }
      
      public function get content() : SymbolGuildEmblemContentGeneric
      {
         return _content;
      }
      
      private function refresh() : void
      {
         _colorBoxIcon.refresh();
         _colorBoxShapeBackground.refresh();
         _colorBoxShapeBorder.refresh();
         _emblem.refresh();
         _colorBoxShapeBackground.color = _currentSettings.emblemBackgroundColor;
         _colorBoxShapeBorder.color = _currentSettings.emblemBackgroundBorderColor;
         _colorBoxIcon.color = _currentSettings.emblemIconColor;
         _content.txtShapeSelection.text = LocText.current.text("dialog/guild_emblem/selection",CGuildEmblemBackground.fromId(_currentSettings.emblemBackgroundShapeId).index);
         _content.txtIconSelection.text = LocText.current.text("dialog/guild_emblem/selection",CGuildEmblemIcon.fromId(_currentSettings.emblemIconShapeId).index);
         _content.txtSizeValue.text = _currentSettings.emblemIconSize.toString() + "%";
         if(_currentSettings.emblemBackgroundShapeId == _guild.emblemSettings.emblemBackgroundShapeId)
         {
            _content.txtShapeCoins.visible = true;
            _content.txtShapePremiumCurrency.visible = false;
            _content.iconShapeCoins.visible = false;
            _content.iconShapePremiumCurrency.visible = false;
            _content.txtShapeCoins.text = LocText.current.text("dialog/guild_emblem/active_text");
            _content.txtShapeCoins.x = _content.iconShapeCoins.x;
         }
         else
         {
            _content.txtShapeCoins.visible = _currentSettings.shapeNeedsCoins;
            _content.txtShapePremiumCurrency.visible = _currentSettings.shapeNeedsPremiumCurrency;
            _content.iconShapeCoins.visible = _currentSettings.shapeNeedsCoins;
            _content.iconShapePremiumCurrency.visible = _currentSettings.shapeNeedsPremiumCurrency;
            _content.txtShapeCoins.text = _currentSettings.shapeCoinCostString;
            _content.txtShapePremiumCurrency.text = _currentSettings.shapePremiumCurrencyCostString;
            if(!_content.txtShapeCoins.visible && !_content.txtShapePremiumCurrency.visible)
            {
               _content.txtShapeCoins.visible = true;
               _content.txtShapeCoins.x = _content.iconShapeCoins.x;
            }
            else
            {
               _content.txtShapeCoins.x = _content.txtShapePremiumCurrency.x;
            }
         }
         if(_currentSettings.emblemIconShapeId == _guild.emblemSettings.emblemIconShapeId)
         {
            _content.txtIconCoins.visible = true;
            _content.txtIconPremiumCurrency.visible = false;
            _content.iconIconCoins.visible = false;
            _content.iconIconPremiumCurrency.visible = false;
            _content.txtIconCoins.text = LocText.current.text("dialog/guild_emblem/active_text");
            _content.txtIconCoins.x = _content.iconIconCoins.x;
         }
         else
         {
            _content.txtIconCoins.visible = _currentSettings.iconNeedsGameCurrency;
            _content.txtIconPremiumCurrency.visible = _currentSettings.iconNeedsPremiumCurrency;
            _content.iconIconCoins.visible = _currentSettings.iconNeedsGameCurrency;
            _content.iconIconPremiumCurrency.visible = _currentSettings.iconNeedsPremiumCurrency;
            _content.txtIconCoins.text = _currentSettings.iconGameCurrencyCostString;
            _content.txtIconPremiumCurrency.text = _currentSettings.iconPremiumCurrencyCostString;
            if(!_content.txtIconCoins.visible && !_content.txtIconPremiumCurrency.visible)
            {
               _content.txtIconCoins.visible = true;
               _content.txtIconCoins.x = _content.iconIconCoins.x;
            }
            else
            {
               _content.txtIconCoins.x = _content.txtIconPremiumCurrency.x;
            }
         }
         _btnChange.buttonEnabled = !_currentSettings.isEqual(_guild.emblemSettings) && User.current.character.guildRank == 1;
      }
      
      private function onClickChangeEmblemBackgroundColor(param1:UiColorBox) : void
      {
         _colorBoxPicker.open(_currentSettings.emblemColors,param1.color,onColorChangeEmblemBackgroundColor);
      }
      
      private function onClickChangeEmblemBackgroundBorderColor(param1:UiColorBox) : void
      {
         _colorBoxPicker.open(_currentSettings.emblemColors,param1.color,onColorChangeEmblemBackgroundBorderColor);
      }
      
      private function onClickChangeEmblemIconColor(param1:UiColorBox) : void
      {
         _colorBoxPicker.open(_currentSettings.emblemColors,param1.color,onColorChangeEmblemIconColor);
      }
      
      private function onColorChangeEmblemBackgroundColor(param1:uint) : void
      {
         _colorBoxShapeBackground.color = param1;
         _currentSettings.emblemBackgroundColorIndex = getIndex(CGuildEmblemColor.constantsData,param1);
         refresh();
      }
      
      private function onColorChangeEmblemBackgroundBorderColor(param1:uint) : void
      {
         _colorBoxShapeBorder.color = param1;
         _currentSettings.emblemBackgroundBorderColorIndex = getIndex(CGuildEmblemColor.constantsData,param1);
         refresh();
      }
      
      private function onColorChangeEmblemIconColor(param1:uint) : void
      {
         _colorBoxIcon.color = param1;
         _currentSettings.emblemIconColorIndex = getIndex(CGuildEmblemColor.constantsData,param1);
         refresh();
      }
      
      public function getCount(param1:Object) : int
      {
         var _loc2_:int = 0;
         var _loc5_:int = 0;
         var _loc4_:* = param1;
         for(var _loc3_ in param1)
         {
            if(_loc3_ < 900)
            {
               _loc2_++;
            }
         }
         return _loc2_;
      }
      
      public function getIdFromIndex(param1:Object, param2:int) : int
      {
         var _loc5_:int = 0;
         var _loc4_:* = param1;
         for(var _loc3_ in param1)
         {
            if(param1[_loc3_].index as int == param2)
            {
               return _loc3_;
            }
         }
         return 0;
      }
      
      public function getPreviousId(param1:Object, param2:int) : int
      {
         var _loc3_:int = getCount(param1);
         var _loc4_:int = param1[param2].index as int;
         if(_loc4_ <= 1)
         {
            return getIdFromIndex(param1,_loc3_);
         }
         return getIdFromIndex(param1,_loc4_ - 1);
      }
      
      public function getNextId(param1:Object, param2:int) : int
      {
         var _loc3_:int = getCount(param1);
         var _loc4_:int = param1[param2].index as int;
         if(_loc4_ >= _loc3_)
         {
            return getIdFromIndex(param1,1);
         }
         return getIdFromIndex(param1,_loc4_ + 1);
      }
      
      public function getIndex(param1:Object, param2:uint) : int
      {
         var _loc4_:int = 0;
         var _loc6_:int = 0;
         var _loc5_:* = param1;
         for each(var _loc3_ in param1)
         {
            if(param2 == StringUtil.hexColorToUint(_loc3_))
            {
               return _loc4_;
            }
            _loc4_++;
         }
         return 0;
      }
      
      private function onClickShapePrevious(param1:InteractionEvent) : void
      {
         _currentSettings.emblemBackgroundShapeId = getPreviousId(CGuildEmblemBackground.constantsData,_currentSettings.emblemBackgroundShapeId);
         refresh();
      }
      
      private function onClickShapeNext(param1:InteractionEvent) : void
      {
         _currentSettings.emblemBackgroundShapeId = getNextId(CGuildEmblemBackground.constantsData,_currentSettings.emblemBackgroundShapeId);
         refresh();
      }
      
      private function onClickIconPrevious(param1:InteractionEvent) : void
      {
         _currentSettings.emblemIconShapeId = getPreviousId(CGuildEmblemIcon.constantsData,_currentSettings.emblemIconShapeId);
         refresh();
      }
      
      private function onClickIconNext(param1:InteractionEvent) : void
      {
         _currentSettings.emblemIconShapeId = getNextId(CGuildEmblemIcon.constantsData,_currentSettings.emblemIconShapeId);
         refresh();
      }
      
      private function onClickSizeDecrease(param1:InteractionEvent) : void
      {
         _currentSettings.emblemIconSize = int(Math.max(50,Math.min(150,_currentSettings.emblemIconSize - 5)));
         refresh();
      }
      
      private function onClickSizeIncrease(param1:InteractionEvent) : void
      {
         _currentSettings.emblemIconSize = int(Math.max(50,Math.min(150,_currentSettings.emblemIconSize + 5)));
         refresh();
      }
      
      private function onClickChange(param1:InteractionEvent) : void
      {
         setGuildEmblem();
      }
      
      private function setGuildEmblem() : void
      {
         Environment.application.sendActionRequest("setGuildEmblem",{
            "background_shape":_currentSettings.emblemBackgroundShapeId,
            "background_color":_currentSettings.emblemBackgroundColorIndex,
            "background_border_color":_currentSettings.emblemBackgroundBorderColorIndex,
            "icon_shape":_currentSettings.emblemIconShapeId,
            "icon_color":_currentSettings.emblemIconColorIndex,
            "icon_size":_currentSettings.emblemIconSize
         },handleRequests);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:* = param1.action;
         if("setGuildEmblem" !== _loc4_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            _onClose();
            UiGuildChatTab.instance.refreshGuildLog();
         }
         else if(param1.error == "errRemoveGameCurrencyNotEnough" || param1.error == "errRemovePremiumCurrencyNotEnough")
         {
            _loc2_ = 0;
            if(_currentSettings.emblemBackgroundShapeId != _guild.emblemSettings.emblemBackgroundShapeId)
            {
               _loc2_ = _loc2_ + _currentSettings.shapeGameCurrencyCost;
            }
            if(_currentSettings.emblemIconShapeId != _guild.emblemSettings.emblemIconShapeId)
            {
               _loc2_ = _loc2_ + _currentSettings.iconGameCurrencyCost;
            }
            _loc3_ = 0;
            if(_currentSettings.emblemBackgroundShapeId != _guild.emblemSettings.emblemBackgroundShapeId)
            {
               _loc3_ = _loc3_ + _currentSettings.shapePremiumCurrencyCost;
            }
            if(_currentSettings.emblemIconShapeId != _guild.emblemSettings.emblemIconShapeId)
            {
               _loc3_ = _loc3_ + _currentSettings.iconPremiumCurrencyCost;
            }
            ViewManager.instance.showGuildNotEnoughGameCurrencyPremiumCurrencyDialog(_loc2_,_loc3_);
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
      
      private function handleMessages(param1:Message) : void
      {
         if(!_content.visible)
         {
            return;
         }
         var _loc2_:* = param1.type;
         if("ViewMessage.notifyNeededGuildDonationMade" !== _loc2_)
         {
            throw new Error("Encountered unknown message type! type=" + param1.type);
         }
         _btnChange.buttonEnabled = false;
         Runtime.delayFunction(setGuildEmblem,0.3);
      }
   }
}
