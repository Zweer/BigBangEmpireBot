package visuals.ui.elements.battle_skills
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolBattleSkillAnimationContainerGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolBattleSkillAnimationContainer = null;
      
      public var unknown:SymbolUnknownCustomizeItemResultGeneric = null;
      
      public var skill:SymbolBattleSkillGeneric = null;
      
      public function SymbolBattleSkillAnimationContainerGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolBattleSkillAnimationContainer;
         }
         else
         {
            _nativeObject = new SymbolBattleSkillAnimationContainer();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         unknown = new SymbolUnknownCustomizeItemResultGeneric(_nativeObject.unknown);
         skill = new SymbolBattleSkillGeneric(_nativeObject.skill);
      }
      
      public function setNativeInstance(param1:SymbolBattleSkillAnimationContainer) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.unknown)
         {
            unknown.setNativeInstance(_nativeObject.unknown);
         }
         if(_nativeObject.skill)
         {
            skill.setNativeInstance(_nativeObject.skill);
         }
      }
   }
}
