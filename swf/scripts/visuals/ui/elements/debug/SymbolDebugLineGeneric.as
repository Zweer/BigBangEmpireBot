package visuals.ui.elements.debug
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.lib.flash.FlashTextInput;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ITextInput;
   import flash.display.MovieClip;
   import visuals.ui.elements.buttons.SymbolButtonArrowRightGeneric;
   import visuals.ui.elements.generic.SymbolGenericListLineEvenGeneric;
   import visuals.ui.elements.generic.SymbolGenericListLineHighlightGeneric;
   import visuals.ui.elements.generic.SymbolGenericListLineOddGeneric;
   
   public class SymbolDebugLineGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDebugLine = null;
      
      public var backgroundEven:SymbolGenericListLineEvenGeneric = null;
      
      public var backgroundHighlight:SymbolGenericListLineHighlightGeneric = null;
      
      public var backgroundOdd:SymbolGenericListLineOddGeneric = null;
      
      public var txtDebugFunction:ILabel = null;
      
      public var inputBackground:SymbolGenericListLineHighlightGeneric = null;
      
      public var txtInput:ITextInput = null;
      
      public var btnSend:SymbolButtonArrowRightGeneric = null;
      
      public var txtHeader:ILabel = null;
      
      public function SymbolDebugLineGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDebugLine;
         }
         else
         {
            _nativeObject = new SymbolDebugLine();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         backgroundEven = new SymbolGenericListLineEvenGeneric(_nativeObject.backgroundEven);
         backgroundHighlight = new SymbolGenericListLineHighlightGeneric(_nativeObject.backgroundHighlight);
         backgroundOdd = new SymbolGenericListLineOddGeneric(_nativeObject.backgroundOdd);
         txtDebugFunction = FlashLabel.fromNative(_nativeObject.txtDebugFunction);
         inputBackground = new SymbolGenericListLineHighlightGeneric(_nativeObject.inputBackground);
         txtInput = FlashTextInput.fromNative(_nativeObject.txtInput);
         btnSend = new SymbolButtonArrowRightGeneric(_nativeObject.btnSend);
         txtHeader = FlashLabel.fromNative(_nativeObject.txtHeader);
      }
      
      public function setNativeInstance(param1:SymbolDebugLine) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.backgroundEven)
         {
            backgroundEven.setNativeInstance(_nativeObject.backgroundEven);
         }
         if(_nativeObject.backgroundHighlight)
         {
            backgroundHighlight.setNativeInstance(_nativeObject.backgroundHighlight);
         }
         if(_nativeObject.backgroundOdd)
         {
            backgroundOdd.setNativeInstance(_nativeObject.backgroundOdd);
         }
         FlashLabel.setNativeInstance(txtDebugFunction,_nativeObject.txtDebugFunction);
         if(_nativeObject.inputBackground)
         {
            inputBackground.setNativeInstance(_nativeObject.inputBackground);
         }
         FlashTextInput.setNativeInstance(txtInput,_nativeObject.txtInput);
         if(_nativeObject.btnSend)
         {
            btnSend.setNativeInstance(_nativeObject.btnSend);
         }
         FlashLabel.setNativeInstance(txtHeader,_nativeObject.txtHeader);
      }
   }
}
