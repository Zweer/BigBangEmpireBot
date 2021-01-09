package com.playata.application.ui.dialogs
{
   import com.playata.application.data.character.Character;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.item.Item;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.ui.elements.generic.dialog.UiTwoChoiceDialog;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.application.ui.elements.stats.UiStatBar;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.util.NumberUtil;
   import com.playata.framework.core.util.StringUtil;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.ui.TextInputType;
   import com.playata.framework.display.ui.controls.Button;
   import com.playata.framework.display.ui.controls.ITextField;
   import com.playata.framework.display.ui.controls.ITextInput;
   import com.playata.framework.display.ui.dialogs.Dialog;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogReskillStatsGeneric;
   
   public class DialogReskillStats extends UiDialog
   {
       
      
      private var _btnClose:UiButton = null;
      
      private var _btnApply:UiTextButton = null;
      
      private var _btnStaminaDecrease:UiButton = null;
      
      private var _btnStaminaIncrease:UiButton = null;
      
      private var _btnStrengthDecrease:UiButton = null;
      
      private var _btnStrengthIncrease:UiButton = null;
      
      private var _btnCriticalRatingDecrease:UiButton = null;
      
      private var _btnCriticalRatingIncrease:UiButton = null;
      
      private var _btnDodgeRatingDecrease:UiButton = null;
      
      private var _btnDodgeRatingIncrease:UiButton = null;
      
      private var _tooltipStaminaIcon:UiTextTooltip = null;
      
      private var _tooltipStaminaCaption:UiTextTooltip = null;
      
      private var _tooltipStaminaValue:UiTextTooltip = null;
      
      private var _tooltipStrengthIcon:UiTextTooltip = null;
      
      private var _tooltipStrengthCaption:UiTextTooltip = null;
      
      private var _tooltipStrengthValue:UiTextTooltip = null;
      
      private var _tooltipCriticalRatingIcon:UiTextTooltip = null;
      
      private var _tooltipCriticalRatingCaption:UiTextTooltip = null;
      
      private var _tooltipCriticalRatingValue:UiTextTooltip = null;
      
      private var _tooltipDodgeRatingIcon:UiTextTooltip = null;
      
      private var _tooltipDodgeRatingCaption:UiTextTooltip = null;
      
      private var _tooltipDodgeRatingValue:UiTextTooltip = null;
      
      private var _initialStaminaValue:int = 0;
      
      private var _initialStrengthValue:int = 0;
      
      private var _initialCriticalRatingValue:int = 0;
      
      private var _initialDodgeRatingValue:int = 0;
      
      private var _availableStatPointsTotal:int = 0;
      
      private var _baseStatValue:int = 0;
      
      private var _item:Item = null;
      
      public function DialogReskillStats(param1:Item = null)
      {
         var _loc3_:SymbolDialogReskillStatsGeneric = new SymbolDialogReskillStatsGeneric();
         super(_loc3_);
         _queued = false;
         var _loc2_:Character = User.current.character;
         _baseStatValue = CConstant.init_base_stat_value;
         _item = param1;
         _loc3_.txtDialogTitle.text = LocText.current.text("dialog/reskill_stats/title");
         _loc3_.txtDialogTitle.autoFontSize = true;
         _loc3_.txtInfo.text = LocText.current.text("dialog/reskill_stats/info_text");
         _loc3_.txtStamina.text = LocText.current.text("general/stat_stamina");
         _loc3_.txtStrength.text = LocText.current.text("general/stat_strength");
         _loc3_.txtCriticalRating.text = LocText.current.text("general/stat_critical_rating");
         _loc3_.txtDodgeRating.text = LocText.current.text("general/stat_dodge_rating");
         _loc3_.inputStamina.inputType = TextInputType.NUMBER;
         _loc3_.inputStamina.restrict = "0-9";
         _loc3_.inputStrength.inputType = TextInputType.NUMBER;
         _loc3_.inputStrength.restrict = "0-9";
         _loc3_.inputCriticalRating.inputType = TextInputType.NUMBER;
         _loc3_.inputCriticalRating.restrict = "0-9";
         _loc3_.inputDodgeRating.inputType = TextInputType.NUMBER;
         _loc3_.inputDodgeRating.restrict = "0-9";
         _loc3_.inputStamina.text = _loc2_.statBaseStamina.toString();
         _loc3_.inputStrength.text = _loc2_.statBaseStrength.toString();
         _loc3_.inputCriticalRating.text = _loc2_.statBaseCriticalRating.toString();
         _loc3_.inputDodgeRating.text = _loc2_.statBaseDodgeRating.toString();
         _initialStaminaValue = _loc2_.statBaseStamina;
         _initialStrengthValue = _loc2_.statBaseStrength;
         _initialCriticalRatingValue = _loc2_.statBaseCriticalRating;
         _initialDodgeRatingValue = _loc2_.statBaseDodgeRating;
         _availableStatPointsTotal = _initialStaminaValue + _initialStrengthValue + _initialCriticalRatingValue + _initialDodgeRatingValue + _loc2_.statPointsAvailable;
         _btnClose = new UiButton(_loc3_.btnClose,"",onClickClose);
         _btnApply = new UiTextButton(_loc3_.btnApply,LocText.current.text("dialog/reskill_stats/button_apply"),"",onClickApply);
         _btnStaminaDecrease = new UiButton(_loc3_.btnStaminaDecrease,"",onClickStaminaDecrease);
         _btnStaminaIncrease = new UiButton(_loc3_.btnStaminaIncrease,"",onClickStaminaIncrease);
         _btnStrengthDecrease = new UiButton(_loc3_.btnStrengthDecrease,"",onClickStrengthDecrease);
         _btnStrengthIncrease = new UiButton(_loc3_.btnStrengthIncrease,"",onClickStrengthIncrease);
         _btnCriticalRatingDecrease = new UiButton(_loc3_.btnCriticalRatingDecrease,"",onClickCriticalRatingDecrease);
         _btnCriticalRatingIncrease = new UiButton(_loc3_.btnCriticalRatingIncrease,"",onClickCriticalRatingIncrease);
         _btnDodgeRatingDecrease = new UiButton(_loc3_.btnDodgeRatingDecrease,"",onClickDodgeRatingDecrease);
         _btnDodgeRatingIncrease = new UiButton(_loc3_.btnDodgeRatingIncrease,"",onClickDodgeRatingIncrease);
         _tooltipStaminaIcon = new UiTextTooltip(_loc3_.iconStamina,"");
         _tooltipStaminaCaption = new UiTextTooltip(_loc3_.txtStamina,"");
         _tooltipStaminaValue = new UiTextTooltip(_loc3_.inputStamina,"");
         _tooltipStrengthIcon = new UiTextTooltip(_loc3_.iconStrength,"");
         _tooltipStrengthCaption = new UiTextTooltip(_loc3_.txtStrength,"");
         _tooltipStrengthValue = new UiTextTooltip(_loc3_.inputStrength,"");
         _tooltipCriticalRatingIcon = new UiTextTooltip(_loc3_.iconCriticalRating,"");
         _tooltipCriticalRatingCaption = new UiTextTooltip(_loc3_.txtCriticalRating,"");
         _tooltipCriticalRatingValue = new UiTextTooltip(_loc3_.inputCriticalRating,"");
         _tooltipDodgeRatingIcon = new UiTextTooltip(_loc3_.iconDodgeRating,"");
         _tooltipDodgeRatingCaption = new UiTextTooltip(_loc3_.txtDodgeRating,"");
         _tooltipDodgeRatingValue = new UiTextTooltip(_loc3_.inputDodgeRating,"");
         _tabObjects.push(_loc3_.inputStamina);
         _tabObjects.push(_loc3_.inputStrength);
         _tabObjects.push(_loc3_.inputCriticalRating);
         _tabObjects.push(_loc3_.inputDodgeRating);
         _loc3_.inputStamina.onChange.add(onInputChanged);
         _loc3_.inputStrength.onChange.add(onInputChanged);
         _loc3_.inputCriticalRating.onChange.add(onInputChanged);
         _loc3_.inputDodgeRating.onChange.add(onInputChanged);
         _loc3_.warningStrength.visible = false;
         _loc3_.warningStamina.visible = false;
         _loc3_.warningCriticalRating.visible = false;
         _loc3_.warningDodgeRating.visible = false;
         setFocus();
         refreshUI();
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         _btnApply.dispose();
         _btnApply = null;
         _btnStaminaDecrease.dispose();
         _btnStaminaDecrease = null;
         _btnStaminaIncrease.dispose();
         _btnStaminaIncrease = null;
         _btnStrengthDecrease.dispose();
         _btnStrengthDecrease = null;
         _btnStrengthIncrease.dispose();
         _btnStrengthIncrease = null;
         _btnCriticalRatingDecrease.dispose();
         _btnCriticalRatingDecrease = null;
         _btnCriticalRatingIncrease.dispose();
         _btnCriticalRatingIncrease = null;
         _btnDodgeRatingDecrease.dispose();
         _btnDodgeRatingDecrease = null;
         _btnDodgeRatingIncrease.dispose();
         _btnDodgeRatingIncrease = null;
         _tooltipStaminaIcon.dispose();
         _tooltipStaminaIcon = null;
         _tooltipStaminaCaption.dispose();
         _tooltipStaminaCaption = null;
         _tooltipStaminaValue.dispose();
         _tooltipStaminaValue = null;
         _tooltipStrengthIcon.dispose();
         _tooltipStrengthIcon = null;
         _tooltipStrengthCaption.dispose();
         _tooltipStrengthCaption = null;
         _tooltipStrengthValue.dispose();
         _tooltipStrengthValue = null;
         _tooltipCriticalRatingIcon.dispose();
         _tooltipCriticalRatingIcon = null;
         _tooltipCriticalRatingCaption.dispose();
         _tooltipCriticalRatingCaption = null;
         _tooltipCriticalRatingValue.dispose();
         _tooltipCriticalRatingValue = null;
         _tooltipDodgeRatingIcon.dispose();
         _tooltipDodgeRatingIcon = null;
         _tooltipDodgeRatingCaption.dispose();
         _tooltipDodgeRatingCaption = null;
         _tooltipDodgeRatingValue.dispose();
         _tooltipDodgeRatingValue = null;
         super.dispose();
      }
      
      private function onInputChanged(param1:ITextInput) : void
      {
         var _loc2_:SymbolDialogReskillStatsGeneric = _vo as SymbolDialogReskillStatsGeneric;
         var _loc3_:* = param1;
         switch(_loc3_)
         {
            case _loc2_.inputStrength:
               clampStat(_loc2_.inputStrength,_loc2_.warningStrength,NumberUtil.clamp(currentStrengthInput,0,_availableStatPointsTotal - currentStaminaInput - currentCriticalRatingInput - currentDodgeRatingInput));
               break;
            case _loc2_.inputStamina:
               clampStat(_loc2_.inputStamina,_loc2_.warningStamina,NumberUtil.clamp(currentStaminaInput,0,_availableStatPointsTotal - currentStrengthInput - currentCriticalRatingInput - currentDodgeRatingInput));
               break;
            case _loc2_.inputCriticalRating:
               clampStat(_loc2_.inputCriticalRating,_loc2_.warningCriticalRating,NumberUtil.clamp(currentCriticalRatingInput,0,_availableStatPointsTotal - currentStrengthInput - currentStaminaInput - currentDodgeRatingInput));
               break;
            case _loc2_.inputDodgeRating:
               clampStat(_loc2_.inputDodgeRating,_loc2_.warningDodgeRating,NumberUtil.clamp(currentDodgeRatingInput,0,_availableStatPointsTotal - currentStrengthInput - currentStaminaInput - currentCriticalRatingInput));
         }
         refreshUI();
      }
      
      private function clampStat(param1:ITextField, param2:IDisplayObject, param3:int) : void
      {
         param1.text = param3.toString();
         param2.visible = false;
      }
      
      private function refreshUI() : void
      {
         var _loc2_:SymbolDialogReskillStatsGeneric = _vo as SymbolDialogReskillStatsGeneric;
         _loc2_.txtAvailablePoints.text = LocText.current.text("dialog/reskill_stats/available_stat_points",LocText.current.formatHugeNumber(availableStatPoints),LocText.current.formatHugeNumber(_availableStatPointsTotal));
         _btnStaminaIncrease.buttonEnabled = availableStatPoints > 0;
         _btnStrengthIncrease.buttonEnabled = availableStatPoints > 0;
         _btnCriticalRatingIncrease.buttonEnabled = availableStatPoints > 0;
         _btnDodgeRatingIncrease.buttonEnabled = availableStatPoints > 0;
         _btnStaminaDecrease.buttonEnabled = currentStaminaInput > _baseStatValue;
         _btnStrengthDecrease.buttonEnabled = currentStrengthInput > _baseStatValue;
         _btnCriticalRatingDecrease.buttonEnabled = currentCriticalRatingInput > _baseStatValue;
         _btnDodgeRatingDecrease.buttonEnabled = currentDodgeRatingInput > _baseStatValue;
         var _loc1_:Character = User.current.character;
         var _loc3_:int = currentStrengthInput + currentStaminaInput + currentCriticalRatingInput + currentDodgeRatingInput;
         _loc2_.warningStrength.visible = currentStrengthInput < _baseStatValue || _loc3_ > _availableStatPointsTotal;
         _loc2_.warningStamina.visible = currentStaminaInput < _baseStatValue || _loc3_ > _availableStatPointsTotal;
         _loc2_.warningCriticalRating.visible = currentCriticalRatingInput < _baseStatValue || _loc3_ > _availableStatPointsTotal;
         _loc2_.warningDodgeRating.visible = currentDodgeRatingInput < _baseStatValue || _loc3_ > _availableStatPointsTotal;
         _tooltipStrengthIcon.text = !!_loc2_.warningStrength.visible?LocText.current.text("dialog/reskill_stats/toollip_not_enough_points",_baseStatValue):UiStatBar.getRawStatTooltip(2,_loc1_,currentStaminaInput,currentStrengthInput,currentCriticalRatingInput,currentDodgeRatingInput);
         _tooltipStrengthCaption.text = _tooltipStrengthIcon.text;
         _tooltipStrengthValue.text = _tooltipStrengthIcon.text;
         _btnStrengthDecrease.tooltip = _tooltipStrengthIcon.text;
         _btnStrengthIncrease.tooltip = _tooltipStrengthIcon.text;
         _tooltipStaminaIcon.text = !!_loc2_.warningStamina.visible?LocText.current.text("dialog/reskill_stats/toollip_not_enough_points",_baseStatValue):UiStatBar.getRawStatTooltip(1,_loc1_,currentStaminaInput,currentStrengthInput,currentCriticalRatingInput,currentDodgeRatingInput);
         _tooltipStaminaCaption.text = _tooltipStaminaIcon.text;
         _tooltipStaminaValue.text = _tooltipStaminaIcon.text;
         _btnStaminaDecrease.tooltip = _tooltipStaminaIcon.text;
         _btnStaminaIncrease.tooltip = _tooltipStaminaIcon.text;
         _tooltipCriticalRatingIcon.text = !!_loc2_.warningCriticalRating.visible?LocText.current.text("dialog/reskill_stats/toollip_not_enough_points",_baseStatValue):UiStatBar.getRawStatTooltip(3,_loc1_,currentStaminaInput,currentStrengthInput,currentCriticalRatingInput,currentDodgeRatingInput);
         _tooltipCriticalRatingCaption.text = _tooltipCriticalRatingIcon.text;
         _tooltipCriticalRatingValue.text = _tooltipCriticalRatingIcon.text;
         _btnCriticalRatingDecrease.tooltip = _tooltipCriticalRatingIcon.text;
         _btnCriticalRatingIncrease.tooltip = _tooltipCriticalRatingIcon.text;
         _tooltipDodgeRatingIcon.text = !!_loc2_.warningDodgeRating.visible?LocText.current.text("dialog/reskill_stats/toollip_not_enough_points",_baseStatValue):UiStatBar.getRawStatTooltip(4,_loc1_,currentStaminaInput,currentStrengthInput,currentCriticalRatingInput,currentDodgeRatingInput);
         _tooltipDodgeRatingCaption.text = _tooltipDodgeRatingIcon.text;
         _tooltipDodgeRatingValue.text = _tooltipDodgeRatingIcon.text;
         _btnDodgeRatingDecrease.tooltip = _tooltipDodgeRatingIcon.text;
         _btnDodgeRatingIncrease.tooltip = _tooltipDodgeRatingIcon.text;
         _btnApply.buttonEnabled = !_loc2_.warningStrength.visible && !_loc2_.warningStamina.visible && !_loc2_.warningCriticalRating.visible && !_loc2_.warningDodgeRating.visible;
      }
      
      private function get currentStaminaInput() : int
      {
         var _loc1_:SymbolDialogReskillStatsGeneric = _vo as SymbolDialogReskillStatsGeneric;
         return parseInt(_loc1_.inputStamina.text);
      }
      
      private function get currentStrengthInput() : int
      {
         var _loc1_:SymbolDialogReskillStatsGeneric = _vo as SymbolDialogReskillStatsGeneric;
         return parseInt(_loc1_.inputStrength.text);
      }
      
      private function get currentCriticalRatingInput() : int
      {
         var _loc1_:SymbolDialogReskillStatsGeneric = _vo as SymbolDialogReskillStatsGeneric;
         return parseInt(_loc1_.inputCriticalRating.text);
      }
      
      private function get currentDodgeRatingInput() : int
      {
         var _loc1_:SymbolDialogReskillStatsGeneric = _vo as SymbolDialogReskillStatsGeneric;
         return parseInt(_loc1_.inputDodgeRating.text);
      }
      
      private function get availableStatPoints() : int
      {
         var _loc1_:Character = User.current.character;
         var _loc3_:int = _loc1_.statBaseStamina + _loc1_.statBaseStrength + _loc1_.statBaseCriticalRating + _loc1_.statBaseDodgeRating + _loc1_.statPointsAvailable;
         var _loc2_:int = currentStaminaInput + currentStrengthInput + currentCriticalRatingInput + currentDodgeRatingInput;
         return int(Math.max(0,_loc3_ - _loc2_));
      }
      
      private function setFocus() : void
      {
         var _loc1_:SymbolDialogReskillStatsGeneric = _vo as SymbolDialogReskillStatsGeneric;
         if(StringUtil.isEmpty(_loc1_.inputStrength.text))
         {
            Dialog.focus = _loc1_.inputStrength;
         }
         else if(StringUtil.isEmpty(_loc1_.inputStamina.text))
         {
            Dialog.focus = _loc1_.inputStamina;
         }
         else if(StringUtil.isEmpty(_loc1_.inputCriticalRating.text))
         {
            Dialog.focus = _loc1_.inputCriticalRating;
         }
         else if(StringUtil.isEmpty(_loc1_.inputDodgeRating.text))
         {
            Dialog.focus = _loc1_.inputDodgeRating;
         }
         else
         {
            Dialog.focus = _loc1_.inputStrength;
            _loc1_.inputStrength.selectAll();
         }
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function onClickStaminaDecrease(param1:InteractionEvent) : void
      {
         var _loc2_:SymbolDialogReskillStatsGeneric = _vo as SymbolDialogReskillStatsGeneric;
         _loc2_.inputStamina.text = Math.max(_baseStatValue,currentStaminaInput - 1).toString();
         refreshUI();
      }
      
      private function onClickStaminaIncrease(param1:InteractionEvent) : void
      {
         var _loc2_:SymbolDialogReskillStatsGeneric = _vo as SymbolDialogReskillStatsGeneric;
         _loc2_.inputStamina.text = Math.min(currentStaminaInput + availableStatPoints,currentStaminaInput + 1).toString();
         refreshUI();
      }
      
      private function onClickStrengthDecrease(param1:InteractionEvent) : void
      {
         var _loc2_:SymbolDialogReskillStatsGeneric = _vo as SymbolDialogReskillStatsGeneric;
         _loc2_.inputStrength.text = Math.max(_baseStatValue,currentStrengthInput - 1).toString();
         refreshUI();
      }
      
      private function onClickStrengthIncrease(param1:InteractionEvent) : void
      {
         var _loc2_:SymbolDialogReskillStatsGeneric = _vo as SymbolDialogReskillStatsGeneric;
         _loc2_.inputStrength.text = Math.min(currentStrengthInput + availableStatPoints,currentStrengthInput + 1).toString();
         refreshUI();
      }
      
      private function onClickCriticalRatingDecrease(param1:InteractionEvent) : void
      {
         var _loc2_:SymbolDialogReskillStatsGeneric = _vo as SymbolDialogReskillStatsGeneric;
         _loc2_.inputCriticalRating.text = Math.max(_baseStatValue,currentCriticalRatingInput - 1).toString();
         refreshUI();
      }
      
      private function onClickCriticalRatingIncrease(param1:InteractionEvent) : void
      {
         var _loc2_:SymbolDialogReskillStatsGeneric = _vo as SymbolDialogReskillStatsGeneric;
         _loc2_.inputCriticalRating.text = Math.min(currentCriticalRatingInput + availableStatPoints,currentCriticalRatingInput + 1).toString();
         refreshUI();
      }
      
      private function onClickDodgeRatingDecrease(param1:InteractionEvent) : void
      {
         var _loc2_:SymbolDialogReskillStatsGeneric = _vo as SymbolDialogReskillStatsGeneric;
         _loc2_.inputDodgeRating.text = Math.max(_baseStatValue,currentDodgeRatingInput - 1).toString();
         refreshUI();
      }
      
      private function onClickDodgeRatingIncrease(param1:InteractionEvent) : void
      {
         var _loc2_:SymbolDialogReskillStatsGeneric = _vo as SymbolDialogReskillStatsGeneric;
         _loc2_.inputDodgeRating.text = Math.min(currentDodgeRatingInput + availableStatPoints,currentDodgeRatingInput + 1).toString();
         refreshUI();
      }
      
      private function onClickApply(param1:InteractionEvent) : void
      {
         var _loc2_:SymbolDialogReskillStatsGeneric = _vo as SymbolDialogReskillStatsGeneric;
         if(isNaN(parseInt(_loc2_.inputStamina.text)) || parseInt(_loc2_.inputStamina.text) < _baseStatValue)
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/reskill_stats/invalid_value/title"),LocText.current.text("dialog/reskill_stats/invalid_value/text",LocText.current.text("general/stat_stamina")),LocText.current.text("general/button_ok")));
            return;
         }
         if(isNaN(parseInt(_loc2_.inputStrength.text)) || parseInt(_loc2_.inputStrength.text) < _baseStatValue)
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/reskill_stats/invalid_value/title"),LocText.current.text("dialog/reskill_stats/invalid_value/text",LocText.current.text("general/stat_strength")),LocText.current.text("general/button_ok")));
            return;
         }
         if(isNaN(parseInt(_loc2_.inputCriticalRating.text)) || parseInt(_loc2_.inputCriticalRating.text) < _baseStatValue)
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/reskill_stats/invalid_value/title"),LocText.current.text("dialog/reskill_stats/invalid_value/text",LocText.current.text("general/stat_critical_rating")),LocText.current.text("general/button_ok")));
            return;
         }
         if(isNaN(parseInt(_loc2_.inputDodgeRating.text)) || parseInt(_loc2_.inputDodgeRating.text) < _baseStatValue)
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/reskill_stats/invalid_value/title"),LocText.current.text("dialog/reskill_stats/invalid_value/text",LocText.current.text("general/stat_dodge_rating")),LocText.current.text("general/button_ok")));
            return;
         }
         if(availableStatPoints > 0)
         {
            Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("dialog/reskill_stats/available_stat_points/title"),LocText.current.text("dialog/reskill_stats/available_stat_points/text",availableStatPoints),LocText.current.text("general/button_yes"),LocText.current.text("general/button_no"),applyReskill));
         }
         else
         {
            applyReskill();
         }
      }
      
      private function applyReskill() : void
      {
         var confirmReskill:Function = function():void
         {
            if(_item == null)
            {
               Environment.application.sendActionRequest("reskillCharacterStats",{
                  "stamina":currentStaminaInput,
                  "strength":currentStrengthInput,
                  "critical_rating":currentCriticalRatingInput,
                  "dodge_rating":currentDodgeRatingInput
               },handleRequests);
            }
            else
            {
               Environment.application.sendActionRequest("useInventoryItem",{
                  "item_id":_item.id,
                  "stamina":currentStaminaInput,
                  "strength":currentStrengthInput,
                  "critical_rating":currentCriticalRatingInput,
                  "dodge_rating":currentDodgeRatingInput
               },handleRequests);
            }
         };
         Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("dialog/reskill_stats/confirmation/title"),LocText.current.text("dialog/reskill_stats/confirmation/text"),LocText.current.text("general/button_yes"),LocText.current.text("general/button_no"),confirmReskill));
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = param1.action;
         switch(_loc3_)
         {
            case "reskillCharacterStats":
               _loc2_ = _vo as SymbolDialogReskillStatsGeneric;
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  if(!Environment.info.isTestMode)
                  {
                     User.current.character.setTutorialFlag("reskill_used");
                  }
                  close();
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "useInventoryItem":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  close();
               }
               else if(param1.error != "errUseItemNoMoreCharges")
               {
                  if(param1.error == "errUseItemItemReqLevel")
                  {
                     Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/use_item/error_req_item_level/title"),LocText.current.text("dialog/use_item/error_req_item_level/text",_item.requiredLevel),LocText.current.text("general/button_ok")));
                  }
                  else
                  {
                     Environment.reportError(param1.error,param1.request);
                  }
               }
               break;
            default:
               throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
      }
      
      override public function get defaultButton() : Button
      {
         return _btnApply;
      }
      
      override public function onEscape() : void
      {
         close();
      }
   }
}
