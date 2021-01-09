package com.playata.application.ui.dialogs
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.application.ui.elements.stats.UiImproveStat;
   import com.playata.application.ui.elements.stats.UiStatBar;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.ui.TooltipLayer;
   import com.playata.framework.display.ui.controls.Button;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogImproveStatsGeneric;
   
   public class DialogImproveStats extends UiDialog
   {
       
      
      private var _btnClose:UiTextButton = null;
      
      private var _tooltipInfo:UiTextTooltip = null;
      
      private var _btnFastSkill:UiButton = null;
      
      private var _stamina:UiImproveStat = null;
      
      private var _strength:UiImproveStat = null;
      
      private var _criticalRating:UiImproveStat = null;
      
      private var _dodgeRating:UiImproveStat = null;
      
      private var _fastSkillEnabled:Boolean = false;
      
      public function DialogImproveStats()
      {
         _xOffset = 100;
         var _loc1_:SymbolDialogImproveStatsGeneric = new SymbolDialogImproveStatsGeneric();
         super(_loc1_);
         _queued = false;
         _loc1_.txtDialogTitle.text = LocText.current.text("dialog/reskill_stats/title");
         _loc1_.txtDialogTitle.autoFontSize = true;
         _tooltipInfo = new UiTextTooltip(null,"");
         _btnClose = new UiTextButton(_loc1_.btnClose,LocText.current.text("general/button_ok"),"",onClickClose);
         _btnFastSkill = new UiButton(_loc1_.btnFastSkill,LocText.current.text("screen/character_overview/button_fast_skill_disabled",CConstant.stat_fast_skill_value),onClickFastSkill);
         _btnFastSkill.visible = false;
         _stamina = new UiImproveStat(_loc1_.stamina,1,onUpdate);
         _strength = new UiImproveStat(_loc1_.strength,2,onUpdate);
         _criticalRating = new UiImproveStat(_loc1_.criticalRating,3,onUpdate);
         _dodgeRating = new UiImproveStat(_loc1_.dodgeRating,4,onUpdate);
         if(Environment.info.isTouchScreen)
         {
            TooltipLayer.instance.lockTooltipPosition(50,150);
         }
         onUpdate(2);
      }
      
      override public function dispose() : void
      {
         if(Environment.info.isTouchScreen)
         {
            TooltipLayer.instance.unlockTooltipPosition();
         }
         _btnClose.dispose();
         _btnClose = null;
         _stamina.dispose();
         _stamina = null;
         _strength.dispose();
         _strength = null;
         _criticalRating.dispose();
         _criticalRating = null;
         _dodgeRating.dispose();
         _dodgeRating = null;
         _tooltipInfo.dispose();
         _tooltipInfo = null;
         _btnFastSkill.dispose();
         _btnFastSkill = null;
         super.dispose();
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function onUpdate(param1:int) : void
      {
         if(_stamina)
         {
            _stamina.refresh(false);
         }
         if(_strength)
         {
            _strength.refresh(false);
         }
         if(_criticalRating)
         {
            _criticalRating.refresh(false);
         }
         if(_dodgeRating)
         {
            _dodgeRating.refresh(false);
         }
         _tooltipInfo.text = UiStatBar.getStatTooltip(param1,User.current.character);
         TooltipLayer.instance.tooltipVisible = true;
         TooltipLayer.instance.tooltip = _tooltipInfo;
         var _loc2_:SymbolDialogImproveStatsGeneric = _vo as SymbolDialogImproveStatsGeneric;
         _loc2_.txtAvailablePoints.text = LocText.current.text("dialog/reskill_stats/available_stat_points_improve",LocText.current.formatHugeNumber(User.current.character.statPointsAvailable)) + " (" + LocText.current.text("general/no_cost") + ")";
         refreshFastSkillButton();
      }
      
      private function refreshFastSkillButton() : void
      {
         var _loc1_:* = 0;
         var _loc4_:int = 0;
         var _loc3_:int = 0;
         _btnFastSkill.visible = false;
         var _loc2_:Character = User.current.character;
         if(_loc2_.hasData("stat_points_available") && _loc2_.getInt("stat_points_available") > 0)
         {
            if(_loc2_.getInt("stat_points_available") > CConstant.stat_fast_skill_value)
            {
               _btnFastSkill.visible = true;
            }
         }
         else if(_loc2_.hasData("stat_bought_stamina"))
         {
            _loc1_ = 0;
            _loc4_ = 0;
            _loc3_ = _loc2_.getInt("stat_bought_stamina");
            while(_loc3_ < _loc2_.getInt("stat_bought_stamina") + 10)
            {
               _loc4_ = _loc4_ + GameUtil.calcNeededGameCurrency(_loc3_);
               _loc3_++;
            }
            if(_loc4_ > _loc1_)
            {
               _loc1_ = _loc4_;
            }
            _loc4_ = 0;
            _loc3_ = _loc2_.getInt("stat_bought_strength");
            while(_loc3_ < _loc2_.getInt("stat_bought_strength") + 10)
            {
               _loc4_ = _loc4_ + GameUtil.calcNeededGameCurrency(_loc3_);
               _loc3_++;
            }
            if(_loc4_ > _loc1_)
            {
               _loc1_ = _loc4_;
            }
            _loc4_ = 0;
            _loc3_ = _loc2_.getInt("stat_bought_critical_rating");
            while(_loc3_ < _loc2_.getInt("stat_bought_critical_rating") + 10)
            {
               _loc4_ = _loc4_ + GameUtil.calcNeededGameCurrency(_loc3_);
               _loc3_++;
            }
            if(_loc4_ > _loc1_)
            {
               _loc1_ = _loc4_;
            }
            _loc4_ = 0;
            _loc3_ = _loc2_.getInt("stat_bought_dodge_rating");
            while(_loc3_ < _loc2_.getInt("stat_bought_dodge_rating") + 10)
            {
               _loc4_ = _loc4_ + GameUtil.calcNeededGameCurrency(_loc3_);
               _loc3_++;
            }
            if(_loc4_ > _loc1_)
            {
               _loc1_ = _loc4_;
            }
            _btnFastSkill.visible = _loc2_.gameCurrency >= _loc1_;
         }
         if(!_btnFastSkill.visible && _fastSkillEnabled)
         {
            onClickFastSkill(null);
         }
      }
      
      override public function get defaultButton() : Button
      {
         return _btnClose;
      }
      
      override public function onEscape() : void
      {
         close();
      }
      
      private function onClickFastSkill(param1:InteractionEvent) : void
      {
         _fastSkillEnabled = !_fastSkillEnabled;
         if(_fastSkillEnabled)
         {
            (_vo as SymbolDialogImproveStatsGeneric).btnFastSkill.gotoAndStop("active");
            _btnFastSkill.tooltip = LocText.current.text("screen/character_overview/button_fast_skill_enabled",CConstant.stat_fast_skill_value);
         }
         else
         {
            (_vo as SymbolDialogImproveStatsGeneric).btnFastSkill.gotoAndStop("inactive");
            _btnFastSkill.tooltip = LocText.current.text("screen/character_overview/button_fast_skill_disabled",CConstant.stat_fast_skill_value);
         }
         if(_stamina)
         {
            _stamina.fastSkillEnabled = _fastSkillEnabled;
         }
         if(_strength)
         {
            _strength.fastSkillEnabled = _fastSkillEnabled;
         }
         if(_criticalRating)
         {
            _criticalRating.fastSkillEnabled = _fastSkillEnabled;
         }
         if(_dodgeRating)
         {
            _dodgeRating.fastSkillEnabled = _fastSkillEnabled;
         }
      }
   }
}
