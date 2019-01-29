package com.playata.application.ui.panels
{
   import com.playata.application.AppEnvironment;
   import com.playata.application.data.bonus.SlotMachineAnimation;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.resource.ResourceFeature;
   import com.playata.application.data.reward.Reward;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.dialogs.DialogSlotmachineReward;
   import com.playata.application.ui.dialogs.DialogTutorialPopup;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.application.ui.elements.resource.UiResourceButton;
   import com.playata.application.ui.elements.slotmachine.UiSlotMachine;
   import com.playata.application.ui.elements.slotmachine.UiSlotmachineChat;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.util.DateTime;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.display.AnchorPoint;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.panels.SymbolPanelSlotMachineGeneric;
   
   public class PanelSlotMachine extends DefaultPanel
   {
       
      
      private var _btnHelp:UiButton = null;
      
      private var _btnSpin:UiResourceButton = null;
      
      private var _btnFreeSpin:UiTextButton = null;
      
      private var _slotMachine:UiSlotMachine = null;
      
      private var _jetonTooltip:UiTextTooltip;
      
      private var _chat:UiSlotmachineChat;
      
      private var _animation:SlotMachineAnimation;
      
      public function PanelSlotMachine(param1:SymbolPanelSlotMachineGeneric)
      {
         super(param1);
         var _loc2_:ResourceFeature = new ResourceFeature(3);
         _slotMachine = new UiSlotMachine(param1.slotmachine.slotMachine);
         _btnHelp = new UiButton(param1.btnHelp,"",onClickHelp);
         _btnSpin = new UiResourceButton(param1.slotmachine.btnSpin,_loc2_.resourceIconIndex,_loc2_.useAmount,_loc2_.useDialogButtonText,"",onClickSpin,false);
         _btnFreeSpin = new UiTextButton(param1.slotmachine.btnFreeSpin,LocText.current.text("panel/slotmachine/button_free_spin"),"",onClickSpin);
         _jetonTooltip = new UiTextTooltip(param1.slotmachine.jetonTooltip,"");
         _chat = new UiSlotmachineChat(param1.slotmachine.chat);
         _animation = new SlotMachineAnimation();
         _animation.setup(param1);
         _anchorContainer.add(param1.slotmachine,AnchorPoint.RIGHT_FIXED,0.5);
         _anchorContainer.add(param1.slotmachine,AnchorPoint.BOTTOM_FIXED);
      }
      
      public static function slotmachineAvailable() : Boolean
      {
         var _loc1_:int = DateTime.fromStringServer(CConstant.slotmachine_event_start).timestamp;
         var _loc3_:int = DateTime.fromStringServer(CConstant.slotmachine_event_end).timestamp;
         var _loc2_:int = TimeUtil.now;
         return _loc2_ >= _loc1_ && _loc2_ <= _loc3_;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         _btnHelp.dispose();
         _btnHelp = null;
         _btnSpin.dispose();
         _btnSpin = null;
         _slotMachine.dispose();
         _slotMachine = null;
         _btnFreeSpin.dispose();
         _btnFreeSpin = null;
         _jetonTooltip.dispose();
         _jetonTooltip = null;
         _animation.dispose();
         _animation = null;
      }
      
      override public function refreshPanelLocalization() : void
      {
         var _loc1_:ResourceFeature = new ResourceFeature(3);
         _btnSpin.caption = _loc1_.useDialogButtonText;
         _btnFreeSpin.caption = LocText.current.text("panel/slotmachine/button_free_spin");
         if(_shown)
         {
            refresh();
         }
      }
      
      override public function show(param1:* = null) : void
      {
         super.show(param1);
         if(AppEnvironment.appPlatform.isHidePantiesAllowed)
         {
            ViewManager.instance.setBackground(1100);
         }
         else
         {
            ViewManager.instance.setBackground(100);
         }
         ViewManager.instance.fadeInPanel(_vo);
         var _loc2_:Character = User.current.character;
         if(!_loc2_.hasTutorialFlag("slotmachine"))
         {
            showTutorialDialog();
         }
         if(_loc2_.currentSlotmachineSpin > 0)
         {
            _btnSpin.buttonEnabled = false;
            _btnFreeSpin.buttonEnabled = false;
            Environment.application.sendActionRequest("getSlotMachineReward",{},handleRequests);
         }
         _animation.animate(1);
         _chat.show();
      }
      
      override public function hide() : void
      {
         super.hide();
         if(_animation)
         {
            _animation.animate(0);
         }
         if(_chat)
         {
            _chat.hide();
         }
      }
      
      override public function refresh() : void
      {
         super.refresh();
         refreshButtons();
         refreshJetons();
      }
      
      private function refreshButtons() : void
      {
         var _loc1_:Character = User.current.character;
         if(_loc1_.hasDailySlotmachineSpinLimitReached)
         {
            _btnSpin.tooltip = LocText.current.text("panel/slotmachine/button_no_spin_tooltip",CConstant.slotmachine_max_daily_spins,_loc1_.slotmachineSpinCount,TimeUtil.secondsToString(TimeUtil.serverDateTime.secondsUntilTomorrow));
            _btnFreeSpin.tooltip = LocText.current.text("panel/slotmachine/button_no_spin_tooltip",CConstant.slotmachine_max_daily_spins,_loc1_.slotmachineSpinCount,TimeUtil.secondsToString(TimeUtil.serverDateTime.secondsUntilTomorrow));
            _btnSpin.buttonEnabled = false;
            _btnFreeSpin.buttonEnabled = false;
            _btnSpin.visible = false;
            _btnFreeSpin.visible = true;
         }
         else
         {
            _btnSpin.tooltip = LocText.current.text("panel/slotmachine/button_spin_tooltip",CConstant.slotmachine_max_daily_spins,_loc1_.slotmachineSpinCount);
            _btnFreeSpin.tooltip = LocText.current.text("panel/slotmachine/button_spin_tooltip",CConstant.slotmachine_max_daily_spins,_loc1_.slotmachineSpinCount);
            _btnSpin.buttonEnabled = true;
            _btnFreeSpin.buttonEnabled = true;
            _btnSpin.premiumMode = _loc1_.getUnusedResourceCount(3) < CConstant.resource_slotmachine_jeton_usage_amount;
            if(_btnSpin.premiumMode)
            {
               _btnSpin.amount = CConstant.slotmachine_premium_currency_amount;
            }
            else
            {
               _btnSpin.amount = CConstant.resource_slotmachine_jeton_usage_amount;
            }
            _btnSpin.visible = _loc1_.getUnusedResourceCount(2) <= 0;
            _btnFreeSpin.visible = _loc1_.getUnusedResourceCount(2) > 0;
         }
      }
      
      private function refreshJetons() : void
      {
         var _loc1_:Character = User.current.character;
         var _loc2_:int = _loc1_.getUnusedResourceCount(3);
         (_vo as SymbolPanelSlotMachineGeneric).slotmachine.txtJetons.text = LocText.current.formatHugeNumber(_loc2_);
         if(_loc2_ > 0)
         {
            _jetonTooltip.text = LocText.current.text("dialog/use_resource/slotmachine_jetons/button_resources_left_tooltip",CConstant.resource_slotmachine_jeton_usage_amount,_loc2_);
         }
         else
         {
            _jetonTooltip.text = LocText.current.text("dialog/use_resource/slotmachine_jetons/button_no_resources_left_tooltip",CConstant.resource_slotmachine_jeton_usage_amount);
         }
      }
      
      private function onClickHelp(param1:InteractionEvent) : void
      {
         showTutorialDialog();
      }
      
      private function showTutorialDialog() : void
      {
         Environment.panelManager.showDialog(new DialogTutorialPopup(LocText.current.text("dialog/tutorial/slotmachine/title"),LocText.current.text("dialog/tutorial/slotmachine/text",CConstant.resource_slotmachine_jeton_usage_amount,CConstant.slotmachine_max_daily_spins),onTutorialDialogClosed));
      }
      
      private function onTutorialDialogClosed() : void
      {
         User.current.character.setTutorialFlag("slotmachine");
      }
      
      private function onClickSpin(param1:InteractionEvent) : void
      {
         _animation.animate(2);
         _btnSpin.buttonEnabled = false;
         _btnFreeSpin.buttonEnabled = false;
         Environment.application.sendActionRequest("spinSlotMachine",{},handleRequests);
      }
      
      private function onRewardShownCallback() : void
      {
         _animation.animate(1);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         response = param1;
         var _loc3_:* = response.action;
         switch(_loc3_)
         {
            case "spinSlotMachine":
               _btnSpin.buttonEnabled = true;
               _btnFreeSpin.buttonEnabled = true;
               if(response.error == "")
               {
                  _slotMachine.startSpin();
                  Environment.application.updateData(response.data);
                  refreshButtons();
                  _btnSpin.buttonEnabled = false;
                  _btnFreeSpin.buttonEnabled = false;
                  var showDialog:Function = function():void
                  {
                     _btnSpin.buttonEnabled = true;
                     _btnFreeSpin.buttonEnabled = true;
                     _animation.animate(3);
                     Environment.panelManager.showDialog(new DialogSlotmachineReward(new Reward(response.appResponse.reward),response.appResponse.slotmachine_reward_quality,onRewardShownCallback));
                     ViewManager.instance.baseUserPanel.fadeInMainNavigationButtons();
                     ViewManager.instance.baseUserPanel.showUserBars(true,true,true);
                     ViewManager.instance.baseUserPanel.showTopIcons(true,true);
                  };
                  _slotMachine.stopSpin(response.appResponse.slotmachine_slot1,response.appResponse.slotmachine_slot2,response.appResponse.slotmachine_slot3,false,showDialog);
                  ViewManager.instance.baseUserPanel.fadeOutMainNavigationButtons();
                  ViewManager.instance.baseUserPanel.showUserBars(false,true,true);
                  ViewManager.instance.baseUserPanel.showTopIcons(false,true);
               }
               else if(response.error == "errRemovePremiumCurrencyNotEnough")
               {
                  ViewManager.instance.showNotEnoughPremiumDialog(CConstant.slotmachine_premium_currency_amount);
               }
               else if(response.error == "errSpinSlotmachineCharacterHasActiveSpin")
               {
                  _btnSpin.buttonEnabled = false;
                  _btnFreeSpin.buttonEnabled = false;
                  Environment.application.sendActionRequest("getSlotMachineReward",{},handleRequests);
               }
               else if(response.error != "errSpinSlotmachineDailyLimitReached")
               {
                  if(response.error == "errInvalidFunction")
                  {
                     _btnSpin.buttonEnabled = false;
                     _btnFreeSpin.buttonEnabled = false;
                     _btnSpin.tooltip = "";
                     _btnFreeSpin.tooltip = "";
                  }
                  else
                  {
                     Environment.reportError(response.error,response.request);
                  }
               }
               break;
            case "getSlotMachineReward":
               _btnSpin.buttonEnabled = true;
               _btnFreeSpin.buttonEnabled = true;
               if(response.error == "")
               {
                  Environment.application.updateData(response.data);
                  refreshButtons();
                  _slotMachine.stopSpin(response.appResponse.slotmachine_slot1,response.appResponse.slotmachine_slot2,response.appResponse.slotmachine_slot3,true);
                  _animation.animate(3);
                  Environment.panelManager.showDialog(new DialogSlotmachineReward(new Reward(response.appResponse.reward),response.appResponse.slotmachine_reward_quality,onRewardShownCallback));
               }
               else if(response.error != "errGetSlotmachineRewardCharacterHasNoActiveSpin")
               {
                  Environment.reportError(response.error,response.request);
               }
               break;
            default:
               throw new Error("Unsupported request action \'" + response.action + "\'!");
         }
      }
   }
}
