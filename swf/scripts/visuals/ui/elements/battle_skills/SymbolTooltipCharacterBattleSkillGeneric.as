package visuals.ui.elements.battle_skills
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   
   public class SymbolTooltipCharacterBattleSkillGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolTooltipCharacterBattleSkill = null;
      
      public var img:SymbolDummyGeneric = null;
      
      public var text:ILabel = null;
      
      public function SymbolTooltipCharacterBattleSkillGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolTooltipCharacterBattleSkill;
         }
         else
         {
            _nativeObject = new SymbolTooltipCharacterBattleSkill();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         img = new SymbolDummyGeneric(_nativeObject.img);
         text = FlashLabel.fromNative(_nativeObject.text);
      }
      
      public function setNativeInstance(param1:SymbolTooltipCharacterBattleSkill) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.img)
         {
            img.setNativeInstance(_nativeObject.img);
         }
         FlashLabel.setNativeInstance(text,_nativeObject.text);
      }
   }
}
