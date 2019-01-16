package visuals.ui.elements.debug
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.lib.flash.FlashTextInput;
   import com.playata.framework.display.ui.controls.ITextInput;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   import visuals.ui.elements.background.SymbolBackgroundFaderGeneric;
   import visuals.ui.elements.generic.SymbolScrollKnobGeneric;
   import visuals.ui.elements.generic.SymbolScrollLineGeneric;
   
   public class SymbolDebugContentGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDebugContent = null;
      
      public var symbolBackgroundFader:SymbolBackgroundFaderGeneric = null;
      
      public var symbolBackgroundFader2:SymbolBackgroundFaderGeneric = null;
      
      public var listContainer:SymbolDummyGeneric = null;
      
      public var scrollBarLine:SymbolScrollLineGeneric = null;
      
      public var scrollBarKnob:SymbolScrollKnobGeneric = null;
      
      public var inputFilter:ITextInput = null;
      
      public function SymbolDebugContentGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDebugContent;
         }
         else
         {
            _nativeObject = new SymbolDebugContent();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolBackgroundFader = new SymbolBackgroundFaderGeneric(_nativeObject.symbolBackgroundFader);
         symbolBackgroundFader2 = new SymbolBackgroundFaderGeneric(_nativeObject.symbolBackgroundFader2);
         listContainer = new SymbolDummyGeneric(_nativeObject.listContainer);
         scrollBarLine = new SymbolScrollLineGeneric(_nativeObject.scrollBarLine);
         scrollBarKnob = new SymbolScrollKnobGeneric(_nativeObject.scrollBarKnob);
         inputFilter = FlashTextInput.fromNative(_nativeObject.inputFilter);
      }
      
      public function setNativeInstance(param1:SymbolDebugContent) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.symbolBackgroundFader)
         {
            symbolBackgroundFader.setNativeInstance(_nativeObject.symbolBackgroundFader);
         }
         if(_nativeObject.symbolBackgroundFader2)
         {
            symbolBackgroundFader2.setNativeInstance(_nativeObject.symbolBackgroundFader2);
         }
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
         FlashTextInput.setNativeInstance(inputFilter,_nativeObject.inputFilter);
      }
   }
}
