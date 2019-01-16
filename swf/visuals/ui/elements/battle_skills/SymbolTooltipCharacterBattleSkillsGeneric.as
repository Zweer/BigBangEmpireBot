package visuals.ui.elements.battle_skills
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolTooltipCharacterBattleSkillsGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolTooltipCharacterBattleSkills = null;
      
      public var skill1:SymbolTooltipCharacterBattleSkillGeneric = null;
      
      public var skill2:SymbolTooltipCharacterBattleSkillGeneric = null;
      
      public var skill3:SymbolTooltipCharacterBattleSkillGeneric = null;
      
      public var skill4:SymbolTooltipCharacterBattleSkillGeneric = null;
      
      public var skill5:SymbolTooltipCharacterBattleSkillGeneric = null;
      
      public var skill6:SymbolTooltipCharacterBattleSkillGeneric = null;
      
      public var skill7:SymbolTooltipCharacterBattleSkillGeneric = null;
      
      public var skill8:SymbolTooltipCharacterBattleSkillGeneric = null;
      
      public var skill9:SymbolTooltipCharacterBattleSkillGeneric = null;
      
      public function SymbolTooltipCharacterBattleSkillsGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolTooltipCharacterBattleSkills;
         }
         else
         {
            _nativeObject = new SymbolTooltipCharacterBattleSkills();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         skill1 = new SymbolTooltipCharacterBattleSkillGeneric(_nativeObject.skill1);
         skill2 = new SymbolTooltipCharacterBattleSkillGeneric(_nativeObject.skill2);
         skill3 = new SymbolTooltipCharacterBattleSkillGeneric(_nativeObject.skill3);
         skill4 = new SymbolTooltipCharacterBattleSkillGeneric(_nativeObject.skill4);
         skill5 = new SymbolTooltipCharacterBattleSkillGeneric(_nativeObject.skill5);
         skill6 = new SymbolTooltipCharacterBattleSkillGeneric(_nativeObject.skill6);
         skill7 = new SymbolTooltipCharacterBattleSkillGeneric(_nativeObject.skill7);
         skill8 = new SymbolTooltipCharacterBattleSkillGeneric(_nativeObject.skill8);
         skill9 = new SymbolTooltipCharacterBattleSkillGeneric(_nativeObject.skill9);
      }
      
      public function setNativeInstance(param1:SymbolTooltipCharacterBattleSkills) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.skill1)
         {
            skill1.setNativeInstance(_nativeObject.skill1);
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
      }
   }
}
