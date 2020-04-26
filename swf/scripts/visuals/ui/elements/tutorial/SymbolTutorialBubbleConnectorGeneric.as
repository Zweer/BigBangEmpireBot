package visuals.ui.elements.tutorial
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolTutorialBubbleConnectorGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolTutorialBubbleConnector = null;
      
      public function SymbolTutorialBubbleConnectorGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolTutorialBubbleConnector;
         }
         else
         {
            _nativeObject = new SymbolTutorialBubbleConnector();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
      }
      
      public function setNativeInstance(param1:SymbolTutorialBubbleConnector) : void
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
