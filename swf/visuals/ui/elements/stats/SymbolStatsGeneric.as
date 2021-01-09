package visuals.ui.elements.stats
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundTooltipGeneric;
   import visuals.ui.elements.battle_skills.SymbolBattleSkillBattleIconGeneric;
   import visuals.ui.elements.battle_skills.SymbolStatsBattleSkillBackgroundsGeneric;
   import visuals.ui.elements.buttons.SymbolButtonFastSkillGeneric;
   import visuals.ui.elements.icons.SymbolIconPlusGeneric;
   
   public class SymbolStatsGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolStats = null;
      
      public var backgroundBig:SymbolSlice9BackgroundTooltipGeneric = null;
      
      public var backgroundSmall:SymbolSlice9BackgroundTooltipGeneric = null;
      
      public var mouseLayer:SymbolDummyGeneric = null;
      
      public var barStrength:SymbolStatBarGeneric = null;
      
      public var barStamina:SymbolStatBarGeneric = null;
      
      public var barCriticalHitRating:SymbolStatBarGeneric = null;
      
      public var barDodgeRating:SymbolStatBarGeneric = null;
      
      public var skillBackgrounds:SymbolStatsBattleSkillBackgroundsGeneric = null;
      
      public var skill2:SymbolBattleSkillBattleIconGeneric = null;
      
      public var skill3:SymbolBattleSkillBattleIconGeneric = null;
      
      public var skill4:SymbolBattleSkillBattleIconGeneric = null;
      
      public var skill5:SymbolBattleSkillBattleIconGeneric = null;
      
      public var skill6:SymbolBattleSkillBattleIconGeneric = null;
      
      public var skill7:SymbolBattleSkillBattleIconGeneric = null;
      
      public var skill8:SymbolBattleSkillBattleIconGeneric = null;
      
      public var skill9:SymbolBattleSkillBattleIconGeneric = null;
      
      public var skill1:SymbolBattleSkillBattleIconGeneric = null;
      
      public var btnIncrease:SymbolIconPlusGeneric = null;
      
      public var btnFastSkill:SymbolButtonFastSkillGeneric = null;
      
      public function SymbolStatsGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolStats;
         }
         else
         {
            _nativeObject = new SymbolStats();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         backgroundBig = new SymbolSlice9BackgroundTooltipGeneric(_nativeObject.backgroundBig);
         backgroundSmall = new SymbolSlice9BackgroundTooltipGeneric(_nativeObject.backgroundSmall);
         mouseLayer = new SymbolDummyGeneric(_nativeObject.mouseLayer);
         barStrength = new SymbolStatBarGeneric(_nativeObject.barStrength);
         barStamina = new SymbolStatBarGeneric(_nativeObject.barStamina);
         barCriticalHitRating = new SymbolStatBarGeneric(_nativeObject.barCriticalHitRating);
         barDodgeRating = new SymbolStatBarGeneric(_nativeObject.barDodgeRating);
         skillBackgrounds = new SymbolStatsBattleSkillBackgroundsGeneric(_nativeObject.skillBackgrounds);
         skill2 = new SymbolBattleSkillBattleIconGeneric(_nativeObject.skill2);
         skill3 = new SymbolBattleSkillBattleIconGeneric(_nativeObject.skill3);
         skill4 = new SymbolBattleSkillBattleIconGeneric(_nativeObject.skill4);
         skill5 = new SymbolBattleSkillBattleIconGeneric(_nativeObject.skill5);
         skill6 = new SymbolBattleSkillBattleIconGeneric(_nativeObject.skill6);
         skill7 = new SymbolBattleSkillBattleIconGeneric(_nativeObject.skill7);
         skill8 = new SymbolBattleSkillBattleIconGeneric(_nativeObject.skill8);
         skill9 = new SymbolBattleSkillBattleIconGeneric(_nativeObject.skill9);
         skill1 = new SymbolBattleSkillBattleIconGeneric(_nativeObject.skill1);
         btnIncrease = new SymbolIconPlusGeneric(_nativeObject.btnIncrease);
         btnFastSkill = new SymbolButtonFastSkillGeneric(_nativeObject.btnFastSkill);
      }
      
      public function setNativeInstance(param1:SymbolStats) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.backgroundBig)
         {
            backgroundBig.setNativeInstance(_nativeObject.backgroundBig);
         }
         if(_nativeObject.backgroundSmall)
         {
            backgroundSmall.setNativeInstance(_nativeObject.backgroundSmall);
         }
         if(_nativeObject.mouseLayer)
         {
            mouseLayer.setNativeInstance(_nativeObject.mouseLayer);
         }
         if(_nativeObject.barStrength)
         {
            barStrength.setNativeInstance(_nativeObject.barStrength);
         }
         if(_nativeObject.barStamina)
         {
            barStamina.setNativeInstance(_nativeObject.barStamina);
         }
         if(_nativeObject.barCriticalHitRating)
         {
            barCriticalHitRating.setNativeInstance(_nativeObject.barCriticalHitRating);
         }
         if(_nativeObject.barDodgeRating)
         {
            barDodgeRating.setNativeInstance(_nativeObject.barDodgeRating);
         }
         if(_nativeObject.skillBackgrounds)
         {
            skillBackgrounds.setNativeInstance(_nativeObject.skillBackgrounds);
         }
         if(_nativeObject.skill2)
         {
            skill2.setNativeInstance(_nativeObject.skill2);
         }
         if(_nativeObject.skill3)
         {
            skill3.setNativeInstance(_nativeObject.skill3);
         }
         if(_nativeObject.skill4)
         {
            skill4.setNativeInstance(_nativeObject.skill4);
         }
         if(_nativeObject.skill5)
         {
            skill5.setNativeInstance(_nativeObject.skill5);
         }
         if(_nativeObject.skill6)
         {
            skill6.setNativeInstance(_nativeObject.skill6);
         }
         if(_nativeObject.skill7)
         {
            skill7.setNativeInstance(_nativeObject.skill7);
         }
         if(_nativeObject.skill8)
         {
            skill8.setNativeInstance(_nativeObject.skill8);
         }
         if(_nativeObject.skill9)
         {
            skill9.setNativeInstance(_nativeObject.skill9);
         }
         if(_nativeObject.skill1)
         {
            skill1.setNativeInstance(_nativeObject.skill1);
         }
         if(_nativeObject.btnIncrease)
         {
            btnIncrease.setNativeInstance(_nativeObject.btnIncrease);
         }
         if(_nativeObject.btnFastSkill)
         {
            btnFastSkill.setNativeInstance(_nativeObject.btnFastSkill);
         }
      }
   }
}
