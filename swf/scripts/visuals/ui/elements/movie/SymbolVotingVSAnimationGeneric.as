package visuals.ui.elements.movie
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolVotingVSAnimationGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolVotingVSAnimation = null;
      
      public var symbolVotingFire:SymbolVotingFireGeneric = null;
      
      public var symbolVotingGlow:SymbolVotingGlowGeneric = null;
      
      public var symbolVotingArrow:SymbolVotingArrowGeneric = null;
      
      public var symbolVotingVS:SymbolVotingVSGeneric = null;
      
      public function SymbolVotingVSAnimationGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolVotingVSAnimation;
         }
         else
         {
            _nativeObject = new SymbolVotingVSAnimation();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolVotingFire = new SymbolVotingFireGeneric(_nativeObject.symbolVotingFire);
         symbolVotingGlow = new SymbolVotingGlowGeneric(_nativeObject.symbolVotingGlow);
         symbolVotingArrow = new SymbolVotingArrowGeneric(_nativeObject.symbolVotingArrow);
         symbolVotingVS = new SymbolVotingVSGeneric(_nativeObject.symbolVotingVS);
      }
      
      public function setNativeInstance(param1:SymbolVotingVSAnimation) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.symbolVotingFire)
         {
            symbolVotingFire.setNativeInstance(_nativeObject.symbolVotingFire);
         }
         if(_nativeObject.symbolVotingGlow)
         {
            symbolVotingGlow.setNativeInstance(_nativeObject.symbolVotingGlow);
         }
         if(_nativeObject.symbolVotingArrow)
         {
            symbolVotingArrow.setNativeInstance(_nativeObject.symbolVotingArrow);
         }
         if(_nativeObject.symbolVotingVS)
         {
            symbolVotingVS.setNativeInstance(_nativeObject.symbolVotingVS);
         }
      }
   }
}
