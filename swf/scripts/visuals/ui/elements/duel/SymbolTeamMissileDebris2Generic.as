package visuals.ui.elements.duel
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolTeamMissileDebris2Generic extends Sprite
   {
       
      
      private var _nativeObject:SymbolTeamMissileDebris2 = null;
      
      public function SymbolTeamMissileDebris2Generic(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolTeamMissileDebris2;
         }
         else
         {
            _nativeObject = new SymbolTeamMissileDebris2();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
      }
      
      public function setNativeInstance(param1:SymbolTeamMissileDebris2) : void
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
