package visuals.ui.elements.battle_skills
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   
   public class SymbolBattleSkillIconGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolBattleSkillIcon = null;
      
      public var img:SymbolDummyGeneric = null;
      
      public function SymbolBattleSkillIconGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolBattleSkillIcon;
         }
         else
         {
            _nativeObject = new SymbolBattleSkillIcon();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         img = new SymbolDummyGeneric(_nativeObject.img);
      }
      
      public function setNativeInstance(param1:SymbolBattleSkillIcon) : void
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
      }
   }
}
