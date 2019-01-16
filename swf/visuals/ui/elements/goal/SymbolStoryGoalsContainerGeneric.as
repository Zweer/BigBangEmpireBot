package visuals.ui.elements.goal
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   
   public class SymbolStoryGoalsContainerGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolStoryGoalsContainer = null;
      
      public var symbolDummy:SymbolDummyGeneric = null;
      
      public var storyGoalsPanel:SymbolStoryGoalsCompleteGeneric = null;
      
      public function SymbolStoryGoalsContainerGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolStoryGoalsContainer;
         }
         else
         {
            _nativeObject = new SymbolStoryGoalsContainer();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolDummy = new SymbolDummyGeneric(_nativeObject.symbolDummy);
         storyGoalsPanel = new SymbolStoryGoalsCompleteGeneric(_nativeObject.storyGoalsPanel);
      }
      
      public function setNativeInstance(param1:SymbolStoryGoalsContainer) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.symbolDummy)
         {
            symbolDummy.setNativeInstance(_nativeObject.symbolDummy);
         }
         if(_nativeObject.storyGoalsPanel)
         {
            storyGoalsPanel.setNativeInstance(_nativeObject.storyGoalsPanel);
         }
      }
   }
}
