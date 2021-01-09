package visuals.ui.elements.dungeon
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolPlaceholderGeneric;
   import visuals.ui.elements.quest.SymbolQuestIconFightAnimationCompleteGeneric;
   import visuals.ui.elements.quest.SymbolQuestIconStatCritAnimationGeneric;
   import visuals.ui.elements.quest.SymbolQuestIconStatDodgeAnimationGeneric;
   import visuals.ui.elements.quest.SymbolQuestIconStatStaminaAnimationGeneric;
   import visuals.ui.elements.quest.SymbolQuestIconStatStrengthAnimationGeneric;
   
   public class SymbolDungeonProgressButtonQuestGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDungeonProgressButtonQuest = null;
      
      public var stat1:SymbolQuestIconStatStaminaAnimationGeneric = null;
      
      public var stat2:SymbolQuestIconStatStrengthAnimationGeneric = null;
      
      public var stat3:SymbolQuestIconStatCritAnimationGeneric = null;
      
      public var stat4:SymbolQuestIconStatDodgeAnimationGeneric = null;
      
      public var fight:SymbolQuestIconFightAnimationCompleteGeneric = null;
      
      public var npc:SymbolPlaceholderGeneric = null;
      
      public var txtProgress:ILabel = null;
      
      public function SymbolDungeonProgressButtonQuestGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDungeonProgressButtonQuest;
         }
         else
         {
            _nativeObject = new SymbolDungeonProgressButtonQuest();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         stat1 = new SymbolQuestIconStatStaminaAnimationGeneric(_nativeObject.stat1);
         stat2 = new SymbolQuestIconStatStrengthAnimationGeneric(_nativeObject.stat2);
         stat3 = new SymbolQuestIconStatCritAnimationGeneric(_nativeObject.stat3);
         stat4 = new SymbolQuestIconStatDodgeAnimationGeneric(_nativeObject.stat4);
         fight = new SymbolQuestIconFightAnimationCompleteGeneric(_nativeObject.fight);
         npc = new SymbolPlaceholderGeneric(_nativeObject.npc);
         txtProgress = FlashLabel.fromNative(_nativeObject.txtProgress);
      }
      
      public function setNativeInstance(param1:SymbolDungeonProgressButtonQuest) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.stat1)
         {
            stat1.setNativeInstance(_nativeObject.stat1);
         }
         if(_nativeObject.stat2)
         {
            stat2.setNativeInstance(_nativeObject.stat2);
         }
         if(_nativeObject.stat3)
         {
            stat3.setNativeInstance(_nativeObject.stat3);
         }
         if(_nativeObject.stat4)
         {
            stat4.setNativeInstance(_nativeObject.stat4);
         }
         if(_nativeObject.fight)
         {
            fight.setNativeInstance(_nativeObject.fight);
         }
         if(_nativeObject.npc)
         {
            npc.setNativeInstance(_nativeObject.npc);
         }
         FlashLabel.setNativeInstance(txtProgress,_nativeObject.txtProgress);
      }
   }
}
