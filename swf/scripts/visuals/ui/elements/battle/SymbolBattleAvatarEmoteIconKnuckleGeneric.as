package visuals.ui.elements.battle
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolBattleAvatarEmoteIconKnuckleGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolBattleAvatarEmoteIconKnuckle = null;
      
      public function SymbolBattleAvatarEmoteIconKnuckleGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolBattleAvatarEmoteIconKnuckle;
         }
         else
         {
            _nativeObject = new SymbolBattleAvatarEmoteIconKnuckle();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
      }
      
      public function setNativeInstance(param1:SymbolBattleAvatarEmoteIconKnuckle) : void
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
