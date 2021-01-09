package com.playata.application.ui.elements.avatar
{
   import com.playata.application.data.battle.BattleSkill;
   import com.playata.application.data.battle.BattleSkills;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.character.CharacterTooltipInformation;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.generic.UiClosableTooltip;
   import com.playata.application.ui.elements.stats.UiStatBar;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.IInteractiveDisplayObject;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.display.ui.Align;
   import com.playata.framework.display.ui.TextFieldAutoAdjustWidthHeight;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.base.SymbolUiTooltipCharacterGeneric;
   
   public class UiCharacterTooltip extends UiClosableTooltip
   {
      
      protected static var _tooltipContent:SymbolUiTooltipCharacterGeneric = null;
      
      private static var _statsBarStamina:UiStatBar;
      
      private static var _statsBarStrength:UiStatBar;
      
      private static var _statsBarCriticalRating:UiStatBar;
      
      private static var _statsBarDodgeRating:UiStatBar;
      
      private static var _avatar:UiAvatarImage;
      
      private static var _skills:Vector.<UiCharacterTooltipBattleSkill>;
      
      private static var _currentTooltipProvider:ICharacterTooltipProvider;
       
      
      private var _tooltipProvider:ICharacterTooltipProvider;
      
      private var _introText:String;
      
      private var _outroText:String;
      
      private var _showAvatar:Boolean;
      
      private var _compareWithPlayer:Boolean;
      
      private var _generate:Boolean;
      
      private var _settings:String;
      
      private var _height:Number;
      
      private var _interactiveDisplayObject:IInteractiveDisplayObject = null;
      
      public function UiCharacterTooltip(param1:IDisplayObject)
      {
         if(param1 is IInteractiveDisplayObject)
         {
            _interactiveDisplayObject = param1 as IInteractiveDisplayObject;
         }
         else if(param1)
         {
            _interactiveDisplayObject = new InteractiveDisplayObject(param1);
         }
         if(!_tooltipContent)
         {
            _tooltipContent = new SymbolUiTooltipCharacterGeneric();
            _tooltipContent.stats.stop();
            _tooltipContent.tooltipTop.autoAdjustWidthHeight = TextFieldAutoAdjustWidthHeight.VERTICAL;
            _tooltipContent.tooltipBottom.autoAdjustWidthHeight = TextFieldAutoAdjustWidthHeight.VERTICAL;
            _statsBarStamina = new UiStatBar(_tooltipContent.stats.barStamina,1,false);
            _statsBarStamina.enableIncrease(false);
            _statsBarStrength = new UiStatBar(_tooltipContent.stats.barStrength,2,false);
            _statsBarStrength.enableIncrease(false);
            _statsBarCriticalRating = new UiStatBar(_tooltipContent.stats.barCriticalHitRating,3,false);
            _statsBarCriticalRating.enableIncrease(false);
            _statsBarDodgeRating = new UiStatBar(_tooltipContent.stats.barDodgeRating,4,false);
            _statsBarDodgeRating.enableIncrease(false);
            _avatar = new UiAvatarImage(_tooltipContent.stats.avatarImage);
            _skills = new Vector.<UiCharacterTooltipBattleSkill>(0);
            _skills.push(new UiCharacterTooltipBattleSkill(_tooltipContent.battleSkills.skill1));
            _skills.push(new UiCharacterTooltipBattleSkill(_tooltipContent.battleSkills.skill2));
            _skills.push(new UiCharacterTooltipBattleSkill(_tooltipContent.battleSkills.skill3));
            _skills.push(new UiCharacterTooltipBattleSkill(_tooltipContent.battleSkills.skill4));
            _skills.push(new UiCharacterTooltipBattleSkill(_tooltipContent.battleSkills.skill5));
            _skills.push(new UiCharacterTooltipBattleSkill(_tooltipContent.battleSkills.skill6));
            _skills.push(new UiCharacterTooltipBattleSkill(_tooltipContent.battleSkills.skill7));
            _skills.push(new UiCharacterTooltipBattleSkill(_tooltipContent.battleSkills.skill8));
            _skills.push(new UiCharacterTooltipBattleSkill(_tooltipContent.battleSkills.skill9));
         }
         _tooltipContent.visible = false;
         _forceShowOnMobile = true;
         super(_interactiveDisplayObject,_tooltipContent);
      }
      
      override protected function handleInteractionOver(param1:InteractionEvent) : void
      {
         super.handleInteractionOver(param1);
         if(_generate)
         {
            _avatar.showWithSettings(_settings);
            _settings = null;
            _generate = false;
         }
      }
      
      override public function onAssigned() : void
      {
         var _loc3_:* = null;
         var _loc8_:int = 0;
         var _loc1_:int = 0;
         var _loc7_:int = 0;
         var _loc4_:int = 0;
         var _loc9_:int = 0;
         var _loc6_:Number = NaN;
         if(_currentTooltipProvider == _tooltipProvider)
         {
            return;
         }
         _currentTooltipProvider = _tooltipProvider;
         if(_tooltipProvider == null)
         {
            _tooltipContent.visible = false;
            _generate = false;
            return;
         }
         var _loc10_:CharacterTooltipInformation = _tooltipProvider.getCharacterTooltipInformation();
         _tooltipContent.tooltipTop.text = _introText;
         _tooltipContent.tooltipBottom.text = _outroText;
         if(_showAvatar && _loc10_.avatarImageSettings)
         {
            _tooltipContent.stats.gotoAndStop("full");
            _tooltipContent.stats.txtCompareValue.hAlign = Align.RIGHT;
            _settings = _loc10_.avatarImageSettings;
            _generate = true;
         }
         else
         {
            _tooltipContent.stats.gotoAndStop("simple");
            _tooltipContent.stats.txtCompareValue.hAlign = Align.CENTER;
            _generate = false;
         }
         _tooltipContent.visible = true;
         if(_compareWithPlayer)
         {
            _loc3_ = User.current.character;
            _statsBarStamina.refreshCompareValue(_loc10_.totalStamina,_loc3_.statTotalStamina,true);
            _statsBarStrength.refreshCompareValue(_loc10_.totalStrength,_loc3_.statTotalStrength,true);
            _statsBarCriticalRating.refreshCompareValue(_loc10_.totalCriticalRating,_loc3_.statTotalCriticalRating,true);
            _statsBarDodgeRating.refreshCompareValue(_loc10_.totalDodgeRating,_loc3_.statTotalDodgeRating,true);
            _loc8_ = _loc3_.statTotalStamina + _loc3_.statTotalStrength + _loc3_.statTotalCriticalRating + _loc3_.statTotalDodgeRating - (_loc10_.totalStamina + _loc10_.totalStrength + _loc10_.totalCriticalRating + _loc10_.totalDodgeRating);
            _loc1_ = 59396;
            _loc7_ = 14155776;
            _tooltipContent.stats.txtCompareValue.textColor = _loc8_ >= 0?_loc1_:uint(_loc7_);
            if(_loc8_ == 0)
            {
               _tooltipContent.stats.txtCompareValue.text = LocText.current.text("general/item_compare_same");
            }
            else
            {
               _tooltipContent.stats.txtCompareValue.text = LocText.current.text("general/item_compare",LocText.current.formatHugeNumber(_loc8_,true));
            }
            _tooltipContent.stats.txtCompareValue.visible = true;
            _loc4_ = 20;
            if(_showAvatar)
            {
               _tooltipContent.stats.backgroundImage.height = 145 + _loc4_;
            }
            else
            {
               _tooltipContent.stats.backgroundImage.height = 95 + _loc4_;
            }
         }
         else
         {
            _statsBarStamina.value = _loc10_.totalStamina;
            _statsBarStrength.value = _loc10_.totalStrength;
            _statsBarCriticalRating.value = _loc10_.totalCriticalRating;
            _statsBarDodgeRating.value = _loc10_.totalDodgeRating;
            _tooltipContent.stats.txtCompareValue.visible = false;
            if(_showAvatar)
            {
               _tooltipContent.stats.backgroundImage.height = 145;
            }
            else
            {
               _tooltipContent.stats.backgroundImage.height = 95;
            }
         }
         var _loc2_:Vector.<BattleSkill> = BattleSkills.instance.getSkillsFromBattleEffectData(_loc10_.battleEffectsData);
         var _loc5_:* = 0;
         _loc9_ = 0;
         while(_loc9_ < 9)
         {
            if(_loc9_ < _loc2_.length)
            {
               _skills[_loc9_].setSkill(_loc2_[_loc9_]);
               _loc5_ = Number(_loc5_ + 20);
            }
            else
            {
               _skills[_loc9_].setSkill(null);
            }
            _loc9_++;
         }
         if(_introText == "" && _outroText == "" && _loc5_ == 0)
         {
            _tooltipContent.background.visible = false;
            _height = 140;
         }
         else
         {
            _tooltipContent.background.visible = true;
            _loc6_ = _tooltipContent.stats.backgroundImage.height;
            if(_loc5_ > 0)
            {
               _tooltipContent.battleSkills.y = _loc6_;
               _loc6_ = _loc6_ + (_loc5_ + 5);
               if(_introText != "" || _outroText != "")
               {
                  _loc6_ = _loc6_ + 5;
               }
            }
            if(_introText != "")
            {
               _tooltipContent.tooltipTop.y = _loc6_;
               _loc6_ = _loc6_ + Math.round(_tooltipContent.tooltipTop.textHeight);
               if(_outroText != "")
               {
                  _loc6_ = _loc6_ + 5;
               }
            }
            if(_outroText != "")
            {
               _tooltipContent.tooltipBottom.y = _loc6_;
               _loc6_ = _loc6_ + Math.round(_tooltipContent.tooltipBottom.textHeight);
            }
            _loc6_ = _loc6_ - _tooltipContent.background.y;
            _loc6_ = _loc6_ + 25;
            _tooltipContent.background.height = _loc6_;
            _height = _loc6_ + _tooltipContent.background.y;
         }
      }
      
      override public function onShow() : void
      {
         if(!Environment.info.isTouchScreen)
         {
            return;
         }
         onAssigned();
      }
      
      public function setText(param1:String, param2:ICharacterTooltipProvider, param3:String, param4:Boolean = true, param5:Boolean = false) : void
      {
         _tooltipProvider = param2;
         _introText = param1;
         _outroText = param3;
         _showAvatar = param4;
         _compareWithPlayer = param5;
      }
      
      override public function get width() : Number
      {
         return 275 * scale;
      }
      
      override public function get height() : Number
      {
         return _height * scale;
      }
   }
}
