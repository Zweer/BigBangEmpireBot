package visuals.ui.elements.tutorial
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   
   public class SymbolTutorialMessageBubbleGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolTutorialMessageBubble = null;
      
      public var connector:SymbolTutorialBubbleConnectorGeneric = null;
      
      public var background:SymbolTutorialBubbleBackgroundGeneric = null;
      
      public var caption:ILabelArea = null;
      
      public function SymbolTutorialMessageBubbleGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolTutorialMessageBubble;
         }
         else
         {
            _nativeObject = new SymbolTutorialMessageBubble();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         connector = new SymbolTutorialBubbleConnectorGeneric(_nativeObject.connector);
         background = new SymbolTutorialBubbleBackgroundGeneric(_nativeObject.background);
         caption = FlashLabelArea.fromNative(_nativeObject.caption);
      }
      
      public function setNativeInstance(param1:SymbolTutorialMessageBubble) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.connector)
         {
            connector.setNativeInstance(_nativeObject.connector);
         }
         if(_nativeObject.background)
         {
            background.setNativeInstance(_nativeObject.background);
         }
         FlashLabelArea.setNativeInstance(caption,_nativeObject.caption);
      }
   }
}
