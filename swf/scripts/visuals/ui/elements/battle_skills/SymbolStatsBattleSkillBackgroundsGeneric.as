package visuals.ui.elements.battle_skills
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.stats.SymbolStatsBattleSkillBackgroundGeneric;
   
   public class SymbolStatsBattleSkillBackgroundsGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolStatsBattleSkillBackgrounds = null;
      
      public var symbolStatsBattleSkillBackground:SymbolStatsBattleSkillBackgroundGeneric = null;
      
      public var symbolStatsBattleSkillBackground2:SymbolStatsBattleSkillBackgroundGeneric = null;
      
      public var symbolStatsBattleSkillBackground3:SymbolStatsBattleSkillBackgroundGeneric = null;
      
      public var symbolStatsBattleSkillBackground4:SymbolStatsBattleSkillBackgroundGeneric = null;
      
      public var symbolStatsBattleSkillBackground5:SymbolStatsBattleSkillBackgroundGeneric = null;
      
      public var symbolStatsBattleSkillBackground6:SymbolStatsBattleSkillBackgroundGeneric = null;
      
      public var symbolStatsBattleSkillBackground7:SymbolStatsBattleSkillBackgroundGeneric = null;
      
      public var symbolStatsBattleSkillBackground8:SymbolStatsBattleSkillBackgroundGeneric = null;
      
      public var symbolStatsBattleSkillBackground9:SymbolStatsBattleSkillBackgroundGeneric = null;
      
      public function SymbolStatsBattleSkillBackgroundsGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolStatsBattleSkillBackgrounds;
         }
         else
         {
            _nativeObject = new SymbolStatsBattleSkillBackgrounds();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolStatsBattleSkillBackground = new SymbolStatsBattleSkillBackgroundGeneric(_nativeObject.symbolStatsBattleSkillBackground);
         symbolStatsBattleSkillBackground2 = new SymbolStatsBattleSkillBackgroundGeneric(_nativeObject.symbolStatsBattleSkillBackground2);
         symbolStatsBattleSkillBackground3 = new SymbolStatsBattleSkillBackgroundGeneric(_nativeObject.symbolStatsBattleSkillBackground3);
         symbolStatsBattleSkillBackground4 = new SymbolStatsBattleSkillBackgroundGeneric(_nativeObject.symbolStatsBattleSkillBackground4);
         symbolStatsBattleSkillBackground5 = new SymbolStatsBattleSkillBackgroundGeneric(_nativeObject.symbolStatsBattleSkillBackground5);
         symbolStatsBattleSkillBackground6 = new SymbolStatsBattleSkillBackgroundGeneric(_nativeObject.symbolStatsBattleSkillBackground6);
         symbolStatsBattleSkillBackground7 = new SymbolStatsBattleSkillBackgroundGeneric(_nativeObject.symbolStatsBattleSkillBackground7);
         symbolStatsBattleSkillBackground8 = new SymbolStatsBattleSkillBackgroundGeneric(_nativeObject.symbolStatsBattleSkillBackground8);
         symbolStatsBattleSkillBackground9 = new SymbolStatsBattleSkillBackgroundGeneric(_nativeObject.symbolStatsBattleSkillBackground9);
      }
      
      public function setNativeInstance(param1:SymbolStatsBattleSkillBackgrounds) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.symbolStatsBattleSkillBackground)
         {
            symbolStatsBattleSkillBackground.setNativeInstance(_nativeObject.symbolStatsBattleSkillBackground);
         }
         if(_nativeObject.symbolStatsBattleSkillBackground2)
         {
            symbolStatsBattleSkillBackground2.setNativeInstance(_nativeObject.symbolStatsBattleSkillBackground2);
         }
         if(_nativeObject.symbolStatsBattleSkillBackground3)
         {
            symbolStatsBattleSkillBackground3.setNativeInstance(_nativeObject.symbolStatsBattleSkillBackground3);
         }
         if(_nativeObject.symbolStatsBattleSkillBackground4)
         {
            symbolStatsBattleSkillBackground4.setNativeInstance(_nativeObject.symbolStatsBattleSkillBackground4);
         }
         if(_nativeObject.symbolStatsBattleSkillBackground5)
         {
            symbolStatsBattleSkillBackground5.setNativeInstance(_nativeObject.symbolStatsBattleSkillBackground5);
         }
         if(_nativeObject.symbolStatsBattleSkillBackground6)
         {
            symbolStatsBattleSkillBackground6.setNativeInstance(_nativeObject.symbolStatsBattleSkillBackground6);
         }
         if(_nativeObject.symbolStatsBattleSkillBackground7)
         {
            symbolStatsBattleSkillBackground7.setNativeInstance(_nativeObject.symbolStatsBattleSkillBackground7);
         }
         if(_nativeObject.symbolStatsBattleSkillBackground8)
         {
            symbolStatsBattleSkillBackground8.setNativeInstance(_nativeObject.symbolStatsBattleSkillBackground8);
         }
         if(_nativeObject.symbolStatsBattleSkillBackground9)
         {
            symbolStatsBattleSkillBackground9.setNativeInstance(_nativeObject.symbolStatsBattleSkillBackground9);
         }
      }
   }
}
