package com.playata.application.ui.elements.battle
{
   import com.greensock.TimelineMax;
   import visuals.ui.elements.battle.SymbolBattleAvatarGeneric;
   import visuals.ui.elements.battle.SymbolTeamMissileExplodeAnimationGeneric;
   
   public class SymbolBattleAvatarAnimation
   {
       
      
      private var _avatar:UiBattleAvatar = null;
      
      private var _displayObject:SymbolBattleAvatarGeneric = null;
      
      public function SymbolBattleAvatarAnimation(param1:UiBattleAvatar, param2:SymbolBattleAvatarGeneric)
      {
         super();
         _avatar = param1;
         _displayObject = param2;
      }
      
      public function resetAnimations() : void
      {
      }
      
      public function defeated() : void
      {
         var _loc2_:TimelineMax = new TimelineMax({"paused":true});
         var _loc1_:TimelineMax = new TimelineMax({"paused":true});
         _loc1_.fromTo(_displayObject.container,0.633333333333333,{
            "x":0,
            "y":0,
            "alpha":1,
            "immediateRender":false
         },{
            "x":0,
            "y":0,
            "alpha":0
         });
         _loc1_.play();
         _loc2_.add(_loc1_,0);
         _loc2_.play();
      }
      
      public function attacking(param1:Boolean) : void
      {
         criticalHit = param1;
         var attacking:TimelineMax = new TimelineMax({"paused":true});
         var container:TimelineMax = new TimelineMax({"paused":true});
         container.fromTo(_displayObject.container,0.4,{
            "x":0,
            "y":0,
            "immediateRender":false
         },{
            "x":0,
            "y":8
         });
         container.to(_displayObject.container,0.2,{
            "x":0,
            "y":-30
         });
         container.to(_displayObject.container,0.433333333333333,{
            "x":0,
            "y":6
         });
         container.to(_displayObject.container,0.4,{
            "x":0,
            "y":0
         });
         container.play();
         attacking.add(container,0);
         var attackWooshB:TimelineMax = new TimelineMax({"paused":true});
         attackWooshB.fromTo(_displayObject.attackWooshB,0.833333333333333,{
            "x":68.4,
            "alpha":1,
            "immediateRender":false
         },{
            "x":-240,
            "alpha":0
         });
         attackWooshB.play();
         attacking.add(attackWooshB,0.6);
         var attackWooshA:TimelineMax = new TimelineMax({"paused":true});
         attackWooshA.fromTo(_displayObject.attackWooshA,0.833333333333333,{
            "x":126.15,
            "alpha":1,
            "immediateRender":false
         },{
            "x":453.15,
            "alpha":0
         });
         attackWooshA.play();
         attacking.add(attackWooshA,0.6);
         var teamMissileThrowB:TimelineMax = new TimelineMax({
            "paused":true,
            "onComplete":function():void
            {
               _displayObject.teamMissileThrowB.visible = false;
            }
         });
         teamMissileThrowB.fromTo(_displayObject.teamMissileThrowB,0.466666666666667,{
            "x":66,
            "y":125,
            "alpha":1,
            "immediateRender":false
         },{
            "x":-500,
            "y":55,
            "alpha":0
         });
         teamMissileThrowB.play();
         attacking.add(teamMissileThrowB,0.6);
         var teamMissileThrowA:TimelineMax = new TimelineMax({
            "paused":true,
            "onComplete":function():void
            {
               _displayObject.teamMissileThrowA.visible = false;
            }
         });
         teamMissileThrowA.fromTo(_displayObject.teamMissileThrowA,0.466666666666667,{
            "x":86,
            "y":125,
            "alpha":1,
            "immediateRender":false
         },{
            "x":550,
            "y":55,
            "alpha":0
         });
         teamMissileThrowA.play();
         attacking.add(teamMissileThrowA,0.6);
         if(criticalHit)
         {
            attacking.call(function():void
            {
               _avatar.handleEvent("attackSoundPerformAttackCritical");
            },null,0.533333333333333);
         }
         else
         {
            attacking.call(function():void
            {
               _avatar.handleEvent("attackSoundPerformAttack");
            },null,0.533333333333333);
         }
         attacking.call(function():void
         {
            _avatar.handleEvent("attackComplete");
         },null,1.43333333333333);
         attacking.play();
      }
      
      public function being_attacked_hit_from_right() : void
      {
         var being_attacked_hit_from_right:TimelineMax = new TimelineMax({"paused":true});
         var container:TimelineMax = new TimelineMax({"paused":true});
         container.fromTo(_displayObject.container,0.1,{
            "x":0,
            "y":0,
            "immediateRender":false
         },{
            "x":-20,
            "y":10
         });
         container.to(_displayObject.container,0.933333333333333,{
            "x":0,
            "y":0
         });
         container.play();
         being_attacked_hit_from_right.add(container,0.6);
         var damageDisplay:TimelineMax = new TimelineMax({"paused":true});
         damageDisplay.fromTo(_displayObject.damageDisplay,0.133333333333333,{
            "x":79,
            "y":82.75,
            "alpha":0,
            "scaleX":1,
            "scaleY":1,
            "immediateRender":false
         },{
            "x":78,
            "y":83,
            "scaleX":1.04400634765625,
            "scaleY":1.04400634765625,
            "alpha":1
         });
         damageDisplay.to(_displayObject.damageDisplay,0.666666666666667,{
            "x":79,
            "y":82.75,
            "alpha":0,
            "scaleX":1,
            "scaleY":1
         });
         damageDisplay.play();
         being_attacked_hit_from_right.add(damageDisplay,0.833333333333333);
         being_attacked_hit_from_right.call(function():void
         {
            _avatar.handleEvent("attackSoundGetHit");
         },null,0.6);
         being_attacked_hit_from_right.call(function():void
         {
            _avatar.handleEvent("damageDone");
         },null,0.966666666666667);
         being_attacked_hit_from_right.call(function():void
         {
            _avatar.handleEvent("hitAnimationComplete");
         },null,1.63333333333333);
         being_attacked_hit_from_right.play();
      }
      
      public function being_attacked_critical_from_right() : void
      {
         var being_attacked_critical_from_right:TimelineMax = new TimelineMax({"paused":true});
         var container:TimelineMax = new TimelineMax({"paused":true});
         container.fromTo(_displayObject.container,0.2,{
            "x":0,
            "y":0,
            "immediateRender":false
         },{
            "x":-50,
            "y":20
         });
         container.to(_displayObject.container,0.766666666666667,{
            "x":0,
            "y":0
         });
         container.play();
         being_attacked_critical_from_right.add(container,0.733333333333333);
         var criticalDisplay:TimelineMax = new TimelineMax({"paused":true});
         criticalDisplay.fromTo(_displayObject.criticalDisplay,0.133333333333333,{
            "alpha":0,
            "immediateRender":false
         },{"alpha":1});
         criticalDisplay.to(_displayObject.criticalDisplay,0.633333333333333,{"alpha":0});
         criticalDisplay.play();
         being_attacked_critical_from_right.add(criticalDisplay,0.933333333333333);
         var damageDisplay:TimelineMax = new TimelineMax({"paused":true});
         damageDisplay.fromTo(_displayObject.damageDisplay,0.133333333333333,{
            "x":51,
            "y":84.75,
            "alpha":0,
            "scaleX":1,
            "scaleY":1,
            "immediateRender":false
         },{
            "x":45.55,
            "y":96.8,
            "scaleX":1.61749267578125,
            "scaleY":1.61749267578125,
            "alpha":1
         });
         damageDisplay.to(_displayObject.damageDisplay,0.633333333333333,{
            "x":51,
            "y":84.75,
            "alpha":0,
            "scaleX":1,
            "scaleY":1
         });
         damageDisplay.play();
         being_attacked_critical_from_right.add(damageDisplay,0.933333333333333);
         being_attacked_critical_from_right.call(function():void
         {
            _avatar.handleEvent("attackSoundGetHitCritical");
         },null,0.766666666666667);
         being_attacked_critical_from_right.call(function():void
         {
            _avatar.handleEvent("damageDone");
         },null,1.03333333333333);
         being_attacked_critical_from_right.call(function():void
         {
            _avatar.handleEvent("hitAnimationComplete");
         },null,1.7);
         being_attacked_critical_from_right.play();
      }
      
      public function being_attacked_missile_from_right() : void
      {
         var being_attacked_missile_from_right:TimelineMax = new TimelineMax({"paused":true});
         var container:TimelineMax = new TimelineMax({"paused":true});
         container.fromTo(_displayObject.container,0.2,{
            "x":0,
            "y":0,
            "immediateRender":false
         },{
            "x":-50,
            "y":20
         });
         container.to(_displayObject.container,0.766666666666667,{
            "x":0,
            "y":0
         });
         container.play();
         being_attacked_missile_from_right.add(container,0.733333333333333);
         var criticalDisplay:TimelineMax = new TimelineMax({"paused":true});
         criticalDisplay.fromTo(_displayObject.criticalDisplay,0.133333333333333,{
            "alpha":0,
            "immediateRender":false
         },{"alpha":1});
         criticalDisplay.to(_displayObject.criticalDisplay,0.633333333333333,{"alpha":0});
         criticalDisplay.play();
         being_attacked_missile_from_right.add(criticalDisplay,0.933333333333333);
         var damageDisplay:TimelineMax = new TimelineMax({"paused":true});
         damageDisplay.fromTo(_displayObject.damageDisplay,0.133333333333333,{
            "x":51,
            "y":84.75,
            "alpha":0,
            "scaleX":1,
            "scaleY":1,
            "immediateRender":false
         },{
            "x":45.55,
            "y":96.8,
            "scaleX":1.61749267578125,
            "scaleY":1.61749267578125,
            "alpha":1
         });
         damageDisplay.to(_displayObject.damageDisplay,0.633333333333333,{
            "x":51,
            "y":84.75,
            "alpha":0,
            "scaleX":1,
            "scaleY":1
         });
         damageDisplay.play();
         being_attacked_missile_from_right.add(damageDisplay,0.933333333333333);
         being_attacked_missile_from_right.call(function():void
         {
            teamMissileExplode(_displayObject.teamMissileExplode);
         },null,0.733333333333333);
         being_attacked_missile_from_right.call(function():void
         {
            _avatar.handleEvent("attackSoundGetHitMissile");
         },null,0.766666666666667);
         being_attacked_missile_from_right.call(function():void
         {
            _avatar.handleEvent("damageDone");
         },null,1.03333333333333);
         being_attacked_missile_from_right.call(function():void
         {
            _avatar.handleEvent("hitAnimationComplete");
         },null,1.7);
         being_attacked_missile_from_right.play();
      }
      
      public function being_attacked_hit_from_left() : void
      {
         var being_attacked_hit_from_left:TimelineMax = new TimelineMax({"paused":true});
         var container:TimelineMax = new TimelineMax({"paused":true});
         container.fromTo(_displayObject.container,0.1,{
            "x":0,
            "y":0,
            "immediateRender":false
         },{
            "x":20,
            "y":10
         });
         container.to(_displayObject.container,0.933333333333333,{
            "x":0,
            "y":0
         });
         container.play();
         being_attacked_hit_from_left.add(container,0.6);
         var damageDisplay:TimelineMax = new TimelineMax({"paused":true});
         damageDisplay.fromTo(_displayObject.damageDisplay,0.133333333333333,{
            "x":79,
            "y":82.75,
            "alpha":0,
            "scaleX":1,
            "scaleY":1,
            "immediateRender":false
         },{
            "x":72.15,
            "y":84.2,
            "scaleX":1.29345703125,
            "scaleY":1.29345703125,
            "alpha":1
         });
         damageDisplay.to(_displayObject.damageDisplay,0.666666666666667,{
            "x":79,
            "y":82.75,
            "alpha":0,
            "scaleX":1,
            "scaleY":1
         });
         damageDisplay.play();
         being_attacked_hit_from_left.add(damageDisplay,0.833333333333333);
         being_attacked_hit_from_left.call(function():void
         {
            _avatar.handleEvent("attackSoundGetHit");
         },null,0.6);
         being_attacked_hit_from_left.call(function():void
         {
            _avatar.handleEvent("damageDone");
         },null,0.966666666666667);
         being_attacked_hit_from_left.call(function():void
         {
            _avatar.handleEvent("hitAnimationComplete");
         },null,1.63333333333333);
         being_attacked_hit_from_left.play();
      }
      
      public function being_attacked_critical_from_left() : void
      {
         var being_attacked_critical_from_left:TimelineMax = new TimelineMax({"paused":true});
         var container:TimelineMax = new TimelineMax({"paused":true});
         container.fromTo(_displayObject.container,0.2,{
            "x":0,
            "y":0,
            "immediateRender":false
         },{
            "x":50,
            "y":20
         });
         container.to(_displayObject.container,0.766666666666667,{
            "x":0,
            "y":0
         });
         container.play();
         being_attacked_critical_from_left.add(container,0.7);
         var criticalDisplay:TimelineMax = new TimelineMax({"paused":true});
         criticalDisplay.fromTo(_displayObject.criticalDisplay,0.133333333333333,{
            "alpha":0,
            "immediateRender":false
         },{"alpha":1});
         criticalDisplay.to(_displayObject.criticalDisplay,0.633333333333333,{"alpha":0});
         criticalDisplay.play();
         being_attacked_critical_from_left.add(criticalDisplay,0.9);
         var damageDisplay:TimelineMax = new TimelineMax({"paused":true});
         damageDisplay.fromTo(_displayObject.damageDisplay,0.133333333333333,{
            "x":51,
            "y":84.75,
            "alpha":0,
            "scaleX":1,
            "scaleY":1,
            "immediateRender":false
         },{
            "x":45.55,
            "y":96.8,
            "scaleX":1.61749267578125,
            "scaleY":1.61749267578125,
            "alpha":1
         });
         damageDisplay.to(_displayObject.damageDisplay,0.633333333333333,{
            "x":51,
            "y":84.75,
            "alpha":0,
            "scaleX":1,
            "scaleY":1
         });
         damageDisplay.play();
         being_attacked_critical_from_left.add(damageDisplay,0.9);
         being_attacked_critical_from_left.call(function():void
         {
            _avatar.handleEvent("attackSoundGetHitCritical");
         },null,0.733333333333333);
         being_attacked_critical_from_left.call(function():void
         {
            _avatar.handleEvent("damageDone");
         },null,1);
         being_attacked_critical_from_left.call(function():void
         {
            _avatar.handleEvent("hitAnimationComplete");
         },null,1.66666666666667);
         being_attacked_critical_from_left.play();
      }
      
      public function being_attacked_missile_from_left() : void
      {
         var being_attacked_missile_from_left:TimelineMax = new TimelineMax({"paused":true});
         var container:TimelineMax = new TimelineMax({"paused":true});
         container.fromTo(_displayObject.container,0.2,{
            "x":0,
            "y":0,
            "immediateRender":false
         },{
            "x":50,
            "y":20
         });
         container.to(_displayObject.container,0.766666666666667,{
            "x":0,
            "y":0
         });
         container.play();
         being_attacked_missile_from_left.add(container,0.7);
         var criticalDisplay:TimelineMax = new TimelineMax({"paused":true});
         criticalDisplay.fromTo(_displayObject.criticalDisplay,0.133333333333333,{
            "alpha":0,
            "immediateRender":false
         },{"alpha":1});
         criticalDisplay.to(_displayObject.criticalDisplay,0.633333333333333,{"alpha":0});
         criticalDisplay.play();
         being_attacked_missile_from_left.add(criticalDisplay,0.9);
         var damageDisplay:TimelineMax = new TimelineMax({"paused":true});
         damageDisplay.fromTo(_displayObject.damageDisplay,0.133333333333333,{
            "x":51,
            "y":84.75,
            "alpha":0,
            "scaleX":1,
            "scaleY":1,
            "immediateRender":false
         },{
            "x":45.55,
            "y":96.8,
            "scaleX":1.61749267578125,
            "scaleY":1.61749267578125,
            "alpha":1
         });
         damageDisplay.to(_displayObject.damageDisplay,0.633333333333333,{
            "x":51,
            "y":84.75,
            "alpha":0,
            "scaleX":1,
            "scaleY":1
         });
         damageDisplay.play();
         being_attacked_missile_from_left.add(damageDisplay,0.9);
         being_attacked_missile_from_left.call(function():void
         {
            teamMissileExplode(_displayObject.teamMissileExplode);
         },null,0.7);
         being_attacked_missile_from_left.call(function():void
         {
            _avatar.handleEvent("attackSoundGetHitMissile");
         },null,0.733333333333333);
         being_attacked_missile_from_left.call(function():void
         {
            _avatar.handleEvent("damageDone");
         },null,1);
         being_attacked_missile_from_left.call(function():void
         {
            _avatar.handleEvent("hitAnimationComplete");
         },null,1.66666666666667);
         being_attacked_missile_from_left.play();
      }
      
      public function being_attacked_dodge() : void
      {
         var being_attacked_dodge:TimelineMax = new TimelineMax({"paused":true});
         var container:TimelineMax = new TimelineMax({"paused":true});
         container.fromTo(_displayObject.container,0.233333333333333,{
            "x":0,
            "y":0,
            "immediateRender":false
         },{
            "x":0,
            "y":-60
         });
         container.to(_displayObject.container,0.666666666666667,{
            "x":0,
            "y":0
         });
         container.to(_displayObject.container,0.333333333333333,{
            "x":0,
            "y":0
         });
         container.play();
         being_attacked_dodge.add(container,0.533333333333333);
         var dodgedDisplay:TimelineMax = new TimelineMax({"paused":true});
         dodgedDisplay.fromTo(_displayObject.dodgedDisplay,0.133333333333333,{
            "alpha":0,
            "immediateRender":false
         },{"alpha":1});
         dodgedDisplay.to(_displayObject.dodgedDisplay,0.833333333333333,{"alpha":0});
         dodgedDisplay.play();
         being_attacked_dodge.add(dodgedDisplay,0.8);
         being_attacked_dodge.call(function():void
         {
            _avatar.handleEvent("attackSoundDodge");
         },null,0.533333333333333);
         being_attacked_dodge.call(function():void
         {
            _avatar.handleEvent("damageDone");
         },null,0.9);
         being_attacked_dodge.call(function():void
         {
            _avatar.handleEvent("hitAnimationComplete");
         },null,1.76666666666667);
         being_attacked_dodge.play();
      }
      
      public function fadeIn() : void
      {
         var _loc2_:TimelineMax = new TimelineMax({"paused":true});
         var _loc1_:TimelineMax = new TimelineMax({"paused":true});
         _loc1_.fromTo(_displayObject.container,0.633333333333333,{
            "x":0,
            "y":0,
            "alpha":0,
            "immediateRender":false
         },{
            "x":0,
            "y":0,
            "alpha":1
         });
         _loc1_.play();
         _loc2_.add(_loc1_,0);
         _loc2_.play();
      }
      
      public function damage_from_dot() : void
      {
         var damage_from_dot:TimelineMax = new TimelineMax({"paused":true});
         var container:TimelineMax = new TimelineMax({"paused":true});
         container.fromTo(_displayObject.container,0.133333333333333,{
            "x":0,
            "y":0,
            "immediateRender":false
         },{
            "x":0,
            "y":10
         });
         container.to(_displayObject.container,0.566666666666667,{
            "x":0,
            "y":0
         });
         container.play();
         damage_from_dot.add(container,0);
         var damageDisplay:TimelineMax = new TimelineMax({"paused":true});
         damageDisplay.fromTo(_displayObject.damageDisplay,0.133333333333333,{
            "x":81,
            "y":104.75,
            "alpha":0,
            "scaleX":1,
            "scaleY":1,
            "immediateRender":false
         },{
            "x":86.8,
            "y":109.05,
            "scaleX":1.29998779296875,
            "scaleY":1.29998779296875,
            "alpha":1
         });
         damageDisplay.to(_displayObject.damageDisplay,0.433333333333333,{
            "x":84,
            "y":102.75,
            "alpha":0,
            "scaleX":1,
            "scaleY":1
         });
         damageDisplay.play();
         damage_from_dot.add(damageDisplay,0.133333333333333);
         damage_from_dot.call(function():void
         {
            _avatar.handleEvent("attackSoundGetHit");
         },null,0.0333333333333333);
         damage_from_dot.call(function():void
         {
            _avatar.handleEvent("dotDamageDone");
         },null,0.233333333333333);
         damage_from_dot.call(function():void
         {
            _avatar.handleEvent("dotAnimationComplete");
         },null,0.7);
         damage_from_dot.play();
      }
      
      public function being_backfired_from_right() : void
      {
         var being_backfired_from_right:TimelineMax = new TimelineMax({"paused":true});
         var container:TimelineMax = new TimelineMax({"paused":true});
         container.fromTo(_displayObject.container,0.1,{
            "x":0,
            "y":0,
            "immediateRender":false
         },{
            "x":-20,
            "y":10
         });
         container.to(_displayObject.container,0.733333333333333,{
            "x":0,
            "y":0
         });
         container.play();
         being_backfired_from_right.add(container,0.0333333333333333);
         var damageDisplay:TimelineMax = new TimelineMax({"paused":true});
         damageDisplay.fromTo(_displayObject.damageDisplay,0.133333333333333,{
            "x":79,
            "y":82.75,
            "alpha":0,
            "scaleX":1,
            "scaleY":1,
            "immediateRender":false
         },{
            "x":72.15,
            "y":84.2,
            "scaleX":1.29345703125,
            "scaleY":1.29345703125,
            "alpha":1
         });
         damageDisplay.to(_displayObject.damageDisplay,0.466666666666667,{
            "x":79,
            "y":82.75,
            "alpha":0,
            "scaleX":1,
            "scaleY":1
         });
         damageDisplay.play();
         being_backfired_from_right.add(damageDisplay,0.266666666666667);
         being_backfired_from_right.call(function():void
         {
            _avatar.handleEvent("attackSoundGetHit");
         },null,0.0333333333333333);
         being_backfired_from_right.call(function():void
         {
            _avatar.handleEvent("backfireDamageDone");
         },null,0.366666666666667);
         being_backfired_from_right.call(function():void
         {
            _avatar.handleEvent("backfireAnimationComplete");
         },null,0.866666666666667);
         being_backfired_from_right.play();
      }
      
      public function being_backfired_from_left() : void
      {
         var being_backfired_from_left:TimelineMax = new TimelineMax({"paused":true});
         var container:TimelineMax = new TimelineMax({"paused":true});
         container.fromTo(_displayObject.container,0.1,{
            "x":0,
            "y":0,
            "immediateRender":false
         },{
            "x":20,
            "y":10
         });
         container.to(_displayObject.container,0.733333333333333,{
            "x":0,
            "y":0
         });
         container.play();
         being_backfired_from_left.add(container,0.0333333333333333);
         var damageDisplay:TimelineMax = new TimelineMax({"paused":true});
         damageDisplay.fromTo(_displayObject.damageDisplay,0.133333333333333,{
            "x":79,
            "y":82.75,
            "alpha":0,
            "scaleX":1,
            "scaleY":1,
            "immediateRender":false
         },{
            "x":72.15,
            "y":84.2,
            "scaleX":1.29345703125,
            "scaleY":1.29345703125,
            "alpha":1
         });
         damageDisplay.to(_displayObject.damageDisplay,0.466666666666667,{
            "x":79,
            "y":82.75,
            "alpha":0,
            "scaleX":1,
            "scaleY":1
         });
         damageDisplay.play();
         being_backfired_from_left.add(damageDisplay,0.266666666666667);
         being_backfired_from_left.call(function():void
         {
            _avatar.handleEvent("attackSoundGetHit");
         },null,0.0333333333333333);
         being_backfired_from_left.call(function():void
         {
            _avatar.handleEvent("backfireDamageDone");
         },null,0.366666666666667);
         being_backfired_from_left.call(function():void
         {
            _avatar.handleEvent("backfireAnimationComplete");
         },null,0.866666666666667);
         being_backfired_from_left.play();
      }
      
      public function teamMissileExplode(param1:SymbolTeamMissileExplodeAnimationGeneric) : void
      {
         displayObject = param1;
         displayObject.visible = true;
         var teamMissileExplodeAnimation:TimelineMax = new TimelineMax({
            "paused":true,
            "onComplete":function():void
            {
               displayObject.visible = false;
            }
         });
         var splash:TimelineMax = new TimelineMax({"paused":true});
         splash.fromTo(displayObject.splash,0.7,{
            "x":-47,
            "y":-44.95,
            "scaleX":0.372543334960938,
            "scaleY":0.372543334960938,
            "alpha":1,
            "immediateRender":false
         },{
            "x":-127,
            "y":-150.95,
            "scaleY":1.74131774902344,
            "alpha":0,
            "scaleX":1
         });
         splash.play();
         teamMissileExplodeAnimation.add(splash,0);
         var debris1:TimelineMax = new TimelineMax({"paused":true});
         debris1.fromTo(displayObject.debris1,0.7,{
            "x":-28.5,
            "y":-19.8,
            "rotation":0,
            "alpha":1,
            "immediateRender":false
         },{
            "x":-162.6,
            "y":-14.45,
            "rotation":74.9978179931641,
            "alpha":0
         });
         debris1.play();
         teamMissileExplodeAnimation.add(debris1,0);
         var debris2:TimelineMax = new TimelineMax({"paused":true});
         debris2.fromTo(displayObject.debris2,0.7,{
            "x":-4.5,
            "y":-0.8,
            "rotation":0,
            "alpha":1,
            "immediateRender":false
         },{
            "x":60.7,
            "y":162.75,
            "rotation":59.9817657470703,
            "alpha":0
         });
         debris2.play();
         teamMissileExplodeAnimation.add(debris2,0);
         var debris3:TimelineMax = new TimelineMax({"paused":true});
         debris3.fromTo(displayObject.debris3,0.7,{
            "x":-18.5,
            "y":-26.3,
            "rotation":0,
            "alpha":1,
            "immediateRender":false
         },{
            "x":84.5,
            "y":-173.3,
            "rotation":90,
            "alpha":0
         });
         debris3.play();
         teamMissileExplodeAnimation.add(debris3,0);
         teamMissileExplodeAnimation.play();
      }
   }
}
