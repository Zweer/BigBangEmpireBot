package visuals.ui.elements.avatar
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.battle_skills.SymbolBattleSkillIconInnerGeneric;
   
   public class SymbolAvatarIconGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolAvatarIcon = null;
      
      public var inner:SymbolBattleSkillIconInnerGeneric = null;
      
      public function SymbolAvatarIconGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolAvatarIcon;
         }
         else
         {
            _nativeObject = new SymbolAvatarIcon();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         inner = new SymbolBattleSkillIconInnerGeneric(_nativeObject.inner);
      }
      
      public function setNativeInstance(param1:SymbolAvatarIcon) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.inner)
         {
            inner.setNativeInstance(_nativeObject.inner);
         }
      }
   }
}
