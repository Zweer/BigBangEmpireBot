package visuals.ui.elements.battle
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolBattleAvatarContainerGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolBattleAvatarContainer = null;
      
      public var character:SymbolBattleAvatarContainerDummyGeneric = null;
      
      public function SymbolBattleAvatarContainerGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolBattleAvatarContainer;
         }
         else
         {
            _nativeObject = new SymbolBattleAvatarContainer();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         character = new SymbolBattleAvatarContainerDummyGeneric(_nativeObject.character);
      }
      
      public function setNativeInstance(param1:SymbolBattleAvatarContainer) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.character)
         {
            character.setNativeInstance(_nativeObject.character);
         }
      }
   }
}
