package visuals.ui.elements.streaming
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.goal.SymbolGoalExclamationMarkGeneric;
   
   public class SymbolStreamingActorButtonGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolStreamingActorButton = null;
      
      public var iconExclamationMark:SymbolGoalExclamationMarkGeneric = null;
      
      public function SymbolStreamingActorButtonGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolStreamingActorButton;
         }
         else
         {
            _nativeObject = new SymbolStreamingActorButton();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         iconExclamationMark = new SymbolGoalExclamationMarkGeneric(_nativeObject.iconExclamationMark);
      }
      
      public function setNativeInstance(param1:SymbolStreamingActorButton) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.iconExclamationMark)
         {
            iconExclamationMark.setNativeInstance(_nativeObject.iconExclamationMark);
         }
      }
   }
}
