package visuals.ui.elements.generic
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolPlayerPanelStarAnimationGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolPlayerPanelStarAnimation = null;
      
      public var iconLevel:SymbolBasePanelIconLevelGeneric = null;
      
      public var level:SymbolPlayerPanelLevelGeneric = null;
      
      public function SymbolPlayerPanelStarAnimationGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolPlayerPanelStarAnimation;
         }
         else
         {
            _nativeObject = new SymbolPlayerPanelStarAnimation();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         iconLevel = new SymbolBasePanelIconLevelGeneric(_nativeObject.iconLevel);
         level = new SymbolPlayerPanelLevelGeneric(_nativeObject.level);
      }
      
      public function setNativeInstance(param1:SymbolPlayerPanelStarAnimation) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.iconLevel)
         {
            iconLevel.setNativeInstance(_nativeObject.iconLevel);
         }
         if(_nativeObject.level)
         {
            level.setNativeInstance(_nativeObject.level);
         }
      }
   }
}
