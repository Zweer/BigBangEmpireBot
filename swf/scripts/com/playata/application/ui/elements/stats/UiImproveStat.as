package com.playata.application.ui.elements.stats
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.progressbar.UiProgressBarMasked;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.display.ui.TooltipLayer;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.stats.SymbolImproveStatGeneric;
   
   public class UiImproveStat
   {
       
      
      private var _content:SymbolImproveStatGeneric = null;
      
      private var _progressBar:UiProgressBarMasked = null;
      
      private var _statType:int = 0;
      
      private var _btnIncrease:UiButton = null;
      
      private var _btnHelp:UiButton = null;
      
      private var _tooltipLayer:InteractiveDisplayObject = null;
      
      private var _onChange:Function = null;
      
      private var _fastSkillEnabled:Boolean = false;
      
      public function UiImproveStat(param1:SymbolImproveStatGeneric, param2:int, param3:Function)
      {
         super();
         _content = param1;
         _statType = param2;
         _onChange = param3;
         _btnIncrease = new UiButton(_content.btnIncrease,"",onClickIncrease);
         _btnHelp = new UiButton(_content.btnHelp,"",onClickHelp);
         _content.iconStamina.visible = param2 == 1;
         _content.iconStrength.visible = param2 == 2;
         _content.iconCriticalRating.visible = param2 == 3;
         _content.iconDodgeRating.visible = param2 == 4;
         _tooltipLayer = new InteractiveDisplayObject(_content.tooltipLayer);
         _tooltipLayer.onClick.add(onClickHelp);
         _progressBar = new UiProgressBarMasked(_content.barBackground.width,_content.barFill);
         refresh(false);
      }
      
      public function dispose() : void
      {
         _btnIncrease.dispose();
         _btnIncrease = null;
         _btnHelp.dispose();
         _btnHelp = null;
         _progressBar.dispose();
         _progressBar = null;
         if(_content != null)
         {
            _content.dispose();
            _content = null;
         }
      }
      
      private function onClickIncrease(param1:InteractionEvent) : void
      {
         TooltipLayer.instance.tooltipVisible = true;
         var _loc2_:int = !!_fastSkillEnabled?CConstant.stat_fast_skill_value:1;
         Environment.application.sendActionRequest("improveCharacterStat",{
            "stat_type":_statType,
            "skill_value":_loc2_
         },handleRequests);
      }
      
      private function onClickHelp(param1:InteractionEvent) : void
      {
      }
      
      public function refresh(param1:Boolean = true) : void
      {
         if(!_btnIncrease)
         {
            return;
         }
         var _loc2_:Character = User.current.character;
         var _loc4_:int = _loc2_.getStatValue(_statType);
         _content.txtStatValue.text = LocText.current.formatHugeNumber(_loc4_);
         UiStatBar.setStatFill(_loc4_,_content.barFill,76);
         var _loc3_:int = !!_fastSkillEnabled?CConstant.stat_fast_skill_value:1;
         if(_loc2_.hasAvailableStatPoints)
         {
            _content.btnIncrease.iconGameCurrency.visible = false;
            switch(int(_statType) - 1)
            {
               case 0:
                  _content.txtInfo.text = LocText.current.text("screen/character_overview/toughness_upgrade_free",_loc3_);
                  break;
               case 1:
                  _content.txtInfo.text = LocText.current.text("screen/character_overview/brawn_upgrade_free",_loc3_);
                  break;
               case 2:
                  _content.txtInfo.text = LocText.current.text("screen/character_overview/brain_upgrade_free",_loc3_);
                  break;
               case 3:
                  _content.txtInfo.text = LocText.current.text("screen/character_overview/awareness_upgrade_free",_loc3_);
            }
         }
         else
         {
            _content.btnIncrease.iconGameCurrency.visible = true;
            switch(int(_statType) - 1)
            {
               case 0:
                  _content.txtInfo.text = LocText.current.text("screen/character_overview/toughness_upgrade_buy",_loc3_,GameUtil.getGameCurrencyString(neededGameCurrency));
                  break;
               case 1:
                  _content.txtInfo.text = LocText.current.text("screen/character_overview/brawn_upgrade_buy",_loc3_,GameUtil.getGameCurrencyString(neededGameCurrency));
                  break;
               case 2:
                  _content.txtInfo.text = LocText.current.text("screen/character_overview/brain_upgrade_buy",_loc3_,GameUtil.getGameCurrencyString(neededGameCurrency));
                  break;
               case 3:
                  _content.txtInfo.text = LocText.current.text("screen/character_overview/awareness_upgrade_buy",_loc3_,GameUtil.getGameCurrencyString(neededGameCurrency));
            }
         }
         if(param1)
         {
            _onChange(_statType);
         }
      }
      
      private function get neededGameCurrency() : int
      {
         var _loc1_:int = !!_fastSkillEnabled?CConstant.stat_fast_skill_value:1;
         return User.current.character.getNeededImproveStatGameCurrency(_statType,_loc1_);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("improveCharacterStat" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            if(param1.request.getData("free") != true)
            {
               Environment.audio.playFX("character_upgrade_stat.mp3");
               Environment.audio.playFX("item_buy.mp3");
            }
            else
            {
               Environment.audio.playFX("character_upgrade_stat.mp3");
            }
            Environment.application.updateData(param1.data);
            refresh();
         }
         else if(param1.error == "errRemoveGameCurrencyNotEnough")
         {
            ViewManager.instance.showNotEnoughGameCurrencyDialog(neededGameCurrency);
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
      
      public function set fastSkillEnabled(param1:Boolean) : void
      {
         _fastSkillEnabled = param1;
         refresh(false);
      }
   }
}
