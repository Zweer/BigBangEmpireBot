package visuals.ui.elements.battle
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolBattleAvatarEmoteIconLassoGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolBattleAvatarEmoteIconLasso = null;
      
      public function SymbolBattleAvatarEmoteIconLassoGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolBattleAvatarEmoteIconLasso;
         }
         else
         {
            _nativeObject = new SymbolBattleAvatarEmoteIconLasso();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
      }
      
      public function setNativeInstance(param1:SymbolBattleAvatarEmoteIconLasso) : void
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
