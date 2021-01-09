package com.playata.application.ui.elements.battle
{
   import com.greensock.TimelineMax;
   import com.greensock.TweenMax;
   import com.greensock.easing.Back;
   import com.playata.application.data.battle.BattleSkill;
   import com.playata.application.ui.effects.EffectsLayer;
   import com.playata.application.ui.effects.flash.BattleSkillGeneratedCloudEffect;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.battle_skills.SymbolBattleSkillGenerationResultGeneric;
   
   public class UiBattleSkillGenerationResult
   {
       
      
      private var _content:SymbolBattleSkillGenerationResultGeneric;
      
      private var _skill:UiBattleSkill;
      
      private var _button:UiTextButton;
      
      private var _onSkillChosen:Function;
      
      private var _buildEffect:BattleSkillGeneratedCloudEffect;
      
      private var _isNew:Boolean;
      
      public function UiBattleSkillGenerationResult(param1:SymbolBattleSkillGenerationResultGeneric, param2:Function, param3:int)
      {
         super();
         _content = param1;
         _onSkillChosen = param2;
         _skill = new UiBattleSkill(param1.animationContainer.skill,2);
         _button = new UiTextButton(param1.btn,LocText.current.text("dialog/customize_item_result/button_new_skill"),"",onSelectSkill);
         _button.tag = param3;
         var _loc4_:Boolean = true;
         param1.txtInfo.autoFontSize = _loc4_;
         param1.txtNameSkill.autoFontSize = _loc4_;
      }
      
      public function dispose() : void
      {
         reset();
         _button.dispose();
         _button = null;
         _skill.dispose();
         _skill = null;
         _onSkillChosen = null;
      }
      
      private function onSelectSkill(param1:InteractionEvent) : void
      {
         if(!_button.enabled)
         {
            return;
         }
         _button.enabled = false;
         §§push(_onSkillChosen((param1.target as UiButton).tag));
      }
      
      public function setSkill(param1:BattleSkill, param2:Boolean = true) : void
      {
         reset();
         _isNew = param2;
         _skill.skill = param1;
         _content.bgOld.visible = !param2;
         _content.txtTitleSkill.text = !!param2?LocText.current.text("dialog/customize_item_result/title_new"):LocText.current.text("dialog/customize_item_result/title_old");
         _content.txtTitleSkill.textColor = !!param2?59396:16777215;
         _content.txtNameSkill.text = param1.name;
         _content.txtInfo.text = param1.shortDescription;
         var _loc3_:Number = _content.txtNameSkill.textHeight + 4 + _content.txtInfo.textHeight + 2;
         _content.txtNameSkill.y = 74 + (70 - _loc3_) * 0.5;
         _content.txtInfo.y = _content.txtNameSkill.y + _content.txtNameSkill.textHeight + 4;
         _button.caption = !!param2?LocText.current.text("dialog/customize_item_result/button_new_skill"):LocText.current.text("dialog/customize_item_result/button_old_skill");
         if(param2)
         {
            _content.animationContainer.skill.visible = false;
            _content.animationContainer.unknown.visible = true;
            _content.animationContainer.y = 4;
            _content.txtNameSkill.visible = false;
            _content.txtInfo.visible = false;
            _button.visible = false;
            _buildEffect = EffectsLayer.instance.show(109,{
               "emitter":_content.animationContainer.unknown,
               "quality":_skill.skill.quality
            },_content.parent.parent) as BattleSkillGeneratedCloudEffect;
         }
      }
      
      public function reveal() : void
      {
         if(_buildEffect)
         {
            _buildEffect.shutDown();
            _buildEffect = null;
            Runtime.delayFunction(onRevealSkill,0.8 * 0.5);
         }
         else
         {
            onRevealSkill();
         }
      }
      
      private function onRevealSkill() : void
      {
         var _loc1_:TimelineMax = new TimelineMax();
         var _loc2_:* = 0.15;
         _loc1_.append(new TweenMax(_content.animationContainer,_loc2_,{
            "scaleX":0.8,
            "scaleY":0.8,
            "ease":Back.easeIn,
            "onComplete":showFront
         }));
         _loc1_.insert(new TweenMax(_content.animationContainer,0.7,{
            "scaleX":1,
            "scaleY":1,
            "ease":Back.easeOut
         }),_loc2_);
         _loc1_.insert(_content.txtNameSkill.tweenFrom(0.9,{
            "scaleX":0.5,
            "scaleY":0.5,
            "x":-45,
            "y":"-20",
            "ease":Back.easeOut,
            "onStart":showDO,
            "onStartParams":[_content.txtNameSkill]
         }),_loc2_ + 0.1);
         _loc1_.insert(_content.txtInfo.tweenFrom(0.9,{
            "scaleX":0.5,
            "scaleY":0.5,
            "y":"-20",
            "ease":Back.easeOut,
            "onStart":showDO,
            "onStartParams":[_content.txtInfo]
         }),_loc2_ + 0.2);
         _loc1_.insert(_content.btn.tweenFrom(0.9,{
            "scaleX":0,
            "scaleY":0,
            "ease":Back.easeOut,
            "onStart":showDO,
            "onStartParams":[_button]
         }),_loc2_ + 0.3);
         Environment.audio.playFX("battle_attack5.mp3");
      }
      
      private function showEffect() : void
      {
         switch(int(_skill.skill.quality) - 1)
         {
            case 0:
               break;
            case 1:
               EffectsLayer.instance.show(106,{
                  "emitter":_content.animationContainer.unknown,
                  "quality":2
               },_content.parent.parent);
               break;
            case 2:
               EffectsLayer.instance.show(107,{
                  "emitter":_content.animationContainer.unknown,
                  "quality":3
               },_content.parent.parent);
               EffectsLayer.instance.show(108,{"emitter":_content.animationContainer.unknown},_content.parent.parent);
         }
      }
      
      private function showDO(param1:IDisplayObject) : void
      {
         param1.visible = true;
      }
      
      private function showFront() : void
      {
         _content.animationContainer.skill.visible = true;
         _content.animationContainer.unknown.visible = false;
         _content.animationContainer.tweenTo(0.5,{"y":0});
         showEffect();
      }
      
      private function reset() : void
      {
         if(_buildEffect)
         {
            _buildEffect.shotDownInstant();
            _buildEffect = null;
         }
         TweenMax.killDelayedCallsTo(onRevealSkill);
         _content.txtNameSkill.killTweens();
         _content.txtInfo.killTweens();
         _content.btn.killTweens();
         _content.animationContainer.killTweens();
         var _loc1_:* = 1;
         _content.animationContainer.scaleY = _loc1_;
         _content.animationContainer.scaleX = _loc1_;
         _content.animationContainer.skill.visible = true;
         _content.animationContainer.unknown.visible = false;
         _content.txtNameSkill.x = -110;
         _loc1_ = 1;
         _content.txtNameSkill.scaleY = _loc1_;
         _content.txtNameSkill.scaleX = _loc1_;
         _loc1_ = 1;
         _content.txtInfo.scaleY = _loc1_;
         _content.txtInfo.scaleX = _loc1_;
         _loc1_ = 1;
         _content.btn.scaleY = _loc1_;
         _content.btn.scaleX = _loc1_;
         _loc1_ = true;
         _content.txtInfo.visible = _loc1_;
         _content.txtNameSkill.visible = _loc1_;
         _button.visible = true;
      }
      
      public function get isNew() : Boolean
      {
         return _isNew;
      }
      
      public function get skill() : BattleSkill
      {
         return _skill.skill;
      }
   }
}
