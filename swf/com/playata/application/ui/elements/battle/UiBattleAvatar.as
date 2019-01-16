package com.playata.application.ui.elements.battle
{
   import com.greensock.TimelineMax;
   import com.playata.application.data.character.AppearanceSettings;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.effects.EffectsLayer;
   import com.playata.application.ui.elements.avatar.UiAvatar;
   import com.playata.framework.application.Environment;
   import com.playata.framework.assets.Assets;
   import com.playata.framework.core.util.NumberUtil;
   import com.playata.framework.display.IDisplayObjectContainer;
   import com.playata.framework.display.UriSprite;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.avatar.SymbolAvatarGeneric;
   import visuals.ui.elements.battle.SymbolBattleAvatarGeneric;
   
   public class UiBattleAvatar
   {
       
      
      private var _avatar:SymbolBattleAvatarGeneric = null;
      
      private var _onDamageDone:Function = null;
      
      private var _onHitAnimationComplete:Function = null;
      
      private var _onDotDamageDone:Function = null;
      
      private var _onBackfireDamageDone:Function = null;
      
      private var _voiceType:int = 0;
      
      private var _isLeft:Boolean = true;
      
      private var _emotes:UiBattleAvatarEmotes;
      
      private var _otherBattleAvatar:UiBattleAvatar;
      
      private var _isPVP:Boolean;
      
      private var _effectQueue:Vector.<String>;
      
      private var _iconAnimationPlaying:Boolean;
      
      private var _characterSettings:AppearanceSettings;
      
      private var _animation:SymbolBattleAvatarAnimation = null;
      
      private var _uiAvatar:UiAvatar = null;
      
      public function UiBattleAvatar(param1:SymbolBattleAvatarGeneric, param2:Function, param3:Function, param4:Function, param5:Function)
      {
         _effectQueue = new Vector.<String>();
         super();
         _onHitAnimationComplete = param2;
         _onDamageDone = param3;
         _onDotDamageDone = param4;
         _onBackfireDamageDone = param5;
         _avatar = param1;
         _avatar.dodgedDisplay.caption.text = LocText.current.text("screen/battle_visualization/dodged");
         _avatar.criticalDisplay.caption.text = LocText.current.text("screen/battle_visualization/critical");
         _animation = new SymbolBattleAvatarAnimation(this,_avatar);
         emptyAvatar();
         _emotes = new UiBattleAvatarEmotes();
         _effectQueue = new Vector.<String>();
      }
      
      public function dispose() : void
      {
      }
      
      public function defeated() : void
      {
         _animation.defeated();
      }
      
      public function fadeIn() : void
      {
         _animation.fadeIn();
      }
      
      public function attacking(param1:String, param2:Boolean = false, param3:Boolean = false) : void
      {
         if(emotes.isPVP)
         {
            emotes.show(true,param1);
         }
         _avatar.teamMissileThrowA.alpha = 0;
         _avatar.teamMissileThrowB.alpha = 0;
         if(_isLeft)
         {
            _avatar.teamMissileThrowA.visible = param2;
         }
         else
         {
            _avatar.teamMissileThrowB.visible = param2;
         }
         _animation.attacking(param3);
      }
      
      public function normal() : void
      {
         _animation.resetAnimations();
      }
      
      public function beingAttackedHit(param1:int) : void
      {
         _avatar.damageDisplay.caption.text = LocText.current.formatHugeNumber(param1);
         if(_isLeft)
         {
            _animation.being_attacked_hit_from_right();
         }
         else
         {
            _animation.being_attacked_hit_from_left();
         }
      }
      
      public function beingAttackedCritical(param1:int) : void
      {
         _avatar.damageDisplay.caption.text = LocText.current.formatHugeNumber(param1);
         if(_isLeft)
         {
            _animation.being_attacked_critical_from_right();
         }
         else
         {
            _animation.being_attacked_critical_from_left();
         }
      }
      
      public function beingAttackedDodge() : void
      {
         _animation.being_attacked_dodge();
      }
      
      public function beingAttackedGuildMissileHit(param1:int) : void
      {
         _avatar.damageDisplay.caption.text = LocText.current.formatHugeNumber(param1);
         if(_isLeft)
         {
            _animation.being_attacked_missile_from_right();
         }
         else
         {
            _animation.being_attacked_missile_from_left();
         }
      }
      
      public function beingAttackedDoT(param1:int) : void
      {
         _avatar.damageDisplay.caption.text = LocText.current.formatHugeNumber(param1);
         _animation.damage_from_dot();
      }
      
      public function beingBackfired(param1:int) : void
      {
         _avatar.damageDisplay.caption.text = LocText.current.formatHugeNumber(param1);
         if(_isLeft)
         {
            _animation.being_backfired_from_right();
         }
         else
         {
            _animation.being_backfired_from_left();
         }
      }
      
      public function queueEffect(param1:String, param2:Boolean = true) : void
      {
         _effectQueue.push(param1);
         if(param2 && _effectQueue.length == 1 && !_iconAnimationPlaying)
         {
            showNextEffect();
         }
      }
      
      public function showNextEffect() : void
      {
         var _loc1_:String = _effectQueue.shift();
         var _loc2_:String = Assets.assetURL("battle_skills/" + _loc1_ + "_big","png");
         _avatar.iconAnimation.icon.inner.setUriSprite(_loc2_,90,90,true,2);
         battleSkillIconAnimation();
         _iconAnimationPlaying = true;
      }
      
      public function battleSkillIconAnimation() : void
      {
         EffectsLayer.instance.show(11,{
            "x":_avatar.x + 106 * _avatar.scaleX,
            "y":_avatar.y,
            "r":105 * _avatar.scaleX
         });
         Environment.audio.playFX("battle_skill_triggered.mp3");
         var bigIconAnimation:TimelineMax = new TimelineMax({"paused":true});
         var icon:TimelineMax = new TimelineMax({"paused":true});
         icon.fromTo(_avatar.iconAnimation.icon,0.366666666666667,{
            "x":-88,
            "y":100,
            "scaleX":0.444442749023438,
            "scaleY":0.444442749023438,
            "alpha":0,
            "immediateRender":false
         },{
            "x":-113,
            "y":0,
            "scaleX":1,
            "scaleY":1,
            "alpha":1
         });
         icon.to(_avatar.iconAnimation.icon,0.566666666666667,{
            "x":-113,
            "y":0,
            "scaleX":1,
            "scaleY":1,
            "alpha":1
         });
         icon.to(_avatar.iconAnimation.icon,0.5,{
            "x":-143,
            "y":-30,
            "scaleX":1.66665649414063,
            "scaleY":1.66665649414063,
            "alpha":0
         });
         icon.play();
         bigIconAnimation.add(icon,0.4);
         bigIconAnimation.call(function():void
         {
            handleEvent("iconAnimationComplete");
         },null,1.83333333333333);
         bigIconAnimation.play();
      }
      
      public function fillCharacter(param1:AppearanceSettings, param2:Boolean, param3:Boolean) : void
      {
         emptyAvatar();
         _characterSettings = param1;
         var _loc4_:SymbolAvatarGeneric = new SymbolAvatarGeneric();
         _uiAvatar = new UiAvatar(_loc4_,param2);
         _avatar.container.character.addChild(_loc4_);
         _uiAvatar.update(_characterSettings,param2);
         _avatar.container.alpha = 1;
         _avatar.attackWooshA.visible = param3;
         _avatar.attackWooshB.visible = !param3;
         _avatar.teamMissileThrowA.visible = false;
         _avatar.teamMissileThrowB.visible = false;
         _avatar.teamMissileExplode.visible = false;
         normal();
         _voiceType = !!_characterSettings.isMale?1:2;
         _isLeft = param3;
         if(!_isLeft)
         {
            _loc4_.x = 212;
            _loc4_.scaleX = -1;
            _avatar.iconAnimation.scaleX = 1;
            _avatar.iconAnimation.icon.inner.scaleX = 1;
            _avatar.iconAnimation.icon.inner.x = 0;
         }
         else
         {
            _avatar.iconAnimation.scaleX = -1;
            _avatar.iconAnimation.icon.inner.scaleX = -1;
            _avatar.iconAnimation.icon.inner.x = 90;
         }
         _avatar.container.addChild(_emotes);
         _emotes.isLeft(_isLeft,false);
         isPVP = false;
      }
      
      public function showGuildMissile(param1:Boolean) : void
      {
         _avatar.teamMissileThrowA.visible = param1;
         _avatar.teamMissileThrowB.visible = !param1;
      }
      
      public function fillNpc(param1:String, param2:int, param3:Boolean = false) : void
      {
         emptyAvatar();
         var _loc4_:int = 360;
         var _loc6_:int = 420;
         var _loc5_:IDisplayObjectContainer = UriSprite.load(param1,_loc4_,_loc6_,true,1,null,true);
         _loc5_.x = 212 - _loc4_ >> 1;
         _loc5_.y = 15;
         _avatar.container.alpha = 1;
         _avatar.container.character.addChild(_loc5_);
         normal();
         _voiceType = param2;
         _isLeft = false;
         _avatar.attackWooshA.visible = param3;
         _avatar.attackWooshB.visible = !param3;
         _avatar.teamMissileThrowA.visible = false;
         _avatar.teamMissileThrowB.visible = false;
         _avatar.teamMissileExplode.visible = false;
         _avatar.container.addChild(_emotes);
         _emotes.isLeft(false,true);
         isPVP = false;
         _otherBattleAvatar.isPVP = false;
      }
      
      public function emptyAvatar() : void
      {
         if(_uiAvatar)
         {
            _uiAvatar.stopAnimation();
            _uiAvatar = null;
         }
         _avatar.container.character.removeAllChildren();
      }
      
      public function handleEvent(param1:String) : void
      {
         if(!User.current)
         {
            return;
         }
         var _loc2_:* = param1;
         switch(_loc2_)
         {
            case "attackComplete":
               _avatar.teamMissileThrowA.visible = false;
               _avatar.teamMissileThrowB.visible = false;
               break;
            case "damageDone":
               _onDamageDone();
               break;
            case "attackSoundPerformAttack":
               if(!isPVP)
               {
                  playAttackSound("attack",NumberUtil.randomInt(1,6));
               }
               break;
            case "attackSoundGetHit":
               emotes.show(false,"normal");
               playSound("normal",NumberUtil.randomInt(1,10));
               if(!isPVP)
               {
                  playAttackSound("punch",NumberUtil.randomInt(1,6));
               }
               break;
            case "attackSoundGetHitCritical":
               emotes.show(false,"crit");
               playSound("critical",NumberUtil.randomInt(1,10));
               if(!isPVP)
               {
                  playAttackSound("punch",NumberUtil.randomInt(1,6));
               }
               break;
            case "attackSoundGetHitMissile":
               emotes.show(false,"crit");
               playSound("critical",NumberUtil.randomInt(1,10));
               if(!isPVP)
               {
                  playAttackSound("punch_missile",-1);
               }
               break;
            case "attackSoundDodge":
               if(isPVP)
               {
                  emotes.show(false,"dodge",otherBattleAvatar.emotes.lastAttackNumber);
               }
               else
               {
                  emotes.show(false,"dodge");
               }
               if(!otherBattleAvatar.isPVP)
               {
                  otherBattleAvatar.emotes.show(true,"dodge");
               }
               playSound("dodge",-1);
               break;
            case "hitAnimationComplete":
               _onHitAnimationComplete(true,true);
               break;
            case "dotDamageDone":
               _onDotDamageDone();
               break;
            case "dotAnimationComplete":
               _onHitAnimationComplete(false,false);
               break;
            case "backfireDamageDone":
               _onBackfireDamageDone();
               break;
            case "backfireAnimationComplete":
               _onHitAnimationComplete(false,true);
               break;
            case "iconAnimationComplete":
               _iconAnimationPlaying = false;
               if(_effectQueue.length)
               {
                  showNextEffect();
               }
               break;
            default:
               throw new Error("Encountered unknown event type! type=" + param1);
         }
      }
      
      private function playSound(param1:String, param2:int) : void
      {
         switch(int(_voiceType) - 1)
         {
            case 0:
               Environment.audio.playFX("voice_male_" + param1 + (param2 == -1?"":param2.toString()) + ".mp3");
               break;
            case 1:
               Environment.audio.playFX("voice_female_" + param1 + (param2 == -1?"":param2.toString()) + ".mp3");
               break;
            case 2:
               Environment.audio.playFX("voice_kid_" + param1 + (param2 == -1?"":param2.toString()) + ".mp3");
         }
      }
      
      private function playAttackSound(param1:String, param2:int) : void
      {
         switch(int(_voiceType) - 1)
         {
            case 0:
            case 1:
            case 2:
               if(param1 == "attack_critical")
               {
                  param1 = "attack";
               }
               Environment.audio.playFX("battle_" + param1 + (param2 == -1?"":param2.toString()) + ".mp3");
         }
      }
      
      public function get emotes() : UiBattleAvatarEmotes
      {
         return _emotes;
      }
      
      public function get otherBattleAvatar() : UiBattleAvatar
      {
         return _otherBattleAvatar;
      }
      
      public function set otherBattleAvatar(param1:UiBattleAvatar) : void
      {
         _otherBattleAvatar = param1;
      }
      
      public function get isPVP() : Boolean
      {
         return _isPVP;
      }
      
      public function set isPVP(param1:Boolean) : void
      {
         _emotes.isPVP = param1;
         _isPVP = param1;
         _avatar.attackWooshA.visible = !param1 && _isLeft;
         _avatar.attackWooshB.visible = !param1 && !_isLeft;
      }
   }
}
