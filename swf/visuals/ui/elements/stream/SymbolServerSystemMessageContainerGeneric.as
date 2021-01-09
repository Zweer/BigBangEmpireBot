package visuals.ui.elements.stream
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   import visuals.ui.elements.generic.SymbolScrollKnobSmallGeneric;
   import visuals.ui.elements.generic.SymbolScrollLineSmallGeneric;
   
   public class SymbolServerSystemMessageContainerGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolServerSystemMessageContainer = null;
      
      public var listContainer:SymbolDummyGeneric = null;
      
      public var scrollBarLine:SymbolScrollLineSmallGeneric = null;
      
      public var scrollBarKnob:SymbolScrollKnobSmallGeneric = null;
      
      public var txtNoMessages:ILabelArea = null;
      
      public function SymbolServerSystemMessageContainerGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolServerSystemMessageContainer;
         }
         else
         {
            _nativeObject = new SymbolServerSystemMessageContainer();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         listContainer = new SymbolDummyGeneric(_nativeObject.listContainer);
         scrollBarLine = new SymbolScrollLineSmallGeneric(_nativeObject.scrollBarLine);
         scrollBarKnob = new SymbolScrollKnobSmallGeneric(_nativeObject.scrollBarKnob);
         txtNoMessages = FlashLabelArea.fromNative(_nativeObject.txtNoMessages);
      }
      
      public function setNativeInstance(param1:SymbolServerSystemMessageContainer) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.listContainer)
         {
            listContainer.setNativeInstance(_nativeObject.listContainer);
         }
         if(_nativeObject.scrollBarLine)
         {
            scrollBarLine.setNativeInstance(_nativeObject.scrollBarLine);
         }
         if(_nativeObject.scrollBarKnob)
         {
            scrollBarKnob.setNativeInstance(_nativeObject.scrollBarKnob);
         }
         FlashLabelArea.setNativeInstance(txtNoMessages,_nativeObject.txtNoMessages);
      }
   }
}
