package visuals.ui.elements.battle
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolBattleAvatarEmoteIconSkullGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolBattleAvatarEmoteIconSkull = null;
      
      public function SymbolBattleAvatarEmoteIconSkullGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolBattleAvatarEmoteIconSkull;
         }
         else
         {
            _nativeObject = new SymbolBattleAvatarEmoteIconSkull();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
      }
      
      public function setNativeInstance(param1:SymbolBattleAvatarEmoteIconSkull) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
      }
   }
}
