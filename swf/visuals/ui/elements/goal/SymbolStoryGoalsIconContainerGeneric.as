package visuals.ui.elements.goal
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolPlaceholderGeneric;
   
   public class SymbolStoryGoalsIconContainerGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolStoryGoalsIconContainer = null;
      
      public var itemContainer:SymbolPlaceholderGeneric = null;
      
      public function SymbolStoryGoalsIconContainerGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolStoryGoalsIconContainer;
         }
         else
         {
            _nativeObject = new SymbolStoryGoalsIconContainer();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         itemContainer = new SymbolPlaceholderGeneric(_nativeObject.itemContainer);
      }
      
      public function setNativeInstance(param1:SymbolStoryGoalsIconContainer) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.itemContainer)
         {
            itemContainer.setNativeInstance(_nativeObject.itemContainer);
         }
      }
   }
}
