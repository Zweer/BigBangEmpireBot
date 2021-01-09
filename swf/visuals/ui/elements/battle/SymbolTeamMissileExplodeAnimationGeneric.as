package visuals.ui.elements.battle
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.duel.SymbolTeamMissileDebris1Generic;
   import visuals.ui.elements.duel.SymbolTeamMissileDebris2Generic;
   import visuals.ui.elements.duel.SymbolTeamMissileDebris3Generic;
   import visuals.ui.elements.duel.SymbolTeamMissileSplashGeneric;
   
   public class SymbolTeamMissileExplodeAnimationGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolTeamMissileExplodeAnimation = null;
      
      public var splash:SymbolTeamMissileSplashGeneric = null;
      
      public var debris2:SymbolTeamMissileDebris2Generic = null;
      
      public var debris3:SymbolTeamMissileDebris3Generic = null;
      
      public var debris1:SymbolTeamMissileDebris1Generic = null;
      
      public function SymbolTeamMissileExplodeAnimationGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolTeamMissileExplodeAnimation;
         }
         else
         {
            _nativeObject = new SymbolTeamMissileExplodeAnimation();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         splash = new SymbolTeamMissileSplashGeneric(_nativeObject.splash);
         debris2 = new SymbolTeamMissileDebris2Generic(_nativeObject.debris2);
         debris3 = new SymbolTeamMissileDebris3Generic(_nativeObject.debris3);
         debris1 = new SymbolTeamMissileDebris1Generic(_nativeObject.debris1);
      }
      
      public function setNativeInstance(param1:SymbolTeamMissileExplodeAnimation) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.splash)
         {
            splash.setNativeInstance(_nativeObject.splash);
         }
         if(_nativeObject.debris2)
         {
            debris2.setNativeInstance(_nativeObject.debris2);
         }
         if(_nativeObject.debris3)
         {
            debris3.setNativeInstance(_nativeObject.debris3);
         }
         if(_nativeObject.debris1)
         {
            debris1.setNativeInstance(_nativeObject.debris1);
         }
      }
   }
}
