package visuals.ui.elements.optical_changes
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolPlaceholderGeneric;
   import visuals.ui.elements.generic.SymbolGenericListLineEvenGeneric;
   import visuals.ui.elements.generic.SymbolGenericListLineOddGeneric;
   import visuals.ui.elements.goal.SymbolGoalHighlightGeneric;
   import visuals.ui.elements.icons.SymbolIconCheckmarkGeneric;
   import visuals.ui.elements.icons.SymbolIconExclamationMarkGeneric;
   
   public class SymbolOpticalChangesLineGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolOpticalChangesLine = null;
      
      public var backgroundHighlight:SymbolGenericListLineOddGeneric = null;
      
      public var backgroundEven:SymbolGenericListLineEvenGeneric = null;
      
      public var backgroundOdd:SymbolGoalHighlightGeneric = null;
      
      public var txtName:ILabelArea = null;
      
      public var iconImage:SymbolPlaceholderGeneric = null;
      
      public var iconCheckmark:SymbolIconCheckmarkGeneric = null;
      
      public var iconExclamationMark:SymbolIconExclamationMarkGeneric = null;
      
      public function SymbolOpticalChangesLineGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolOpticalChangesLine;
         }
         else
         {
            _nativeObject = new SymbolOpticalChangesLine();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         backgroundHighlight = new SymbolGenericListLineOddGeneric(_nativeObject.backgroundHighlight);
         backgroundEven = new SymbolGenericListLineEvenGeneric(_nativeObject.backgroundEven);
         backgroundOdd = new SymbolGoalHighlightGeneric(_nativeObject.backgroundOdd);
         txtName = FlashLabelArea.fromNative(_nativeObject.txtName);
         iconImage = new SymbolPlaceholderGeneric(_nativeObject.iconImage);
         iconCheckmark = new SymbolIconCheckmarkGeneric(_nativeObject.iconCheckmark);
         iconExclamationMark = new SymbolIconExclamationMarkGeneric(_nativeObject.iconExclamationMark);
      }
      
      public function setNativeInstance(param1:SymbolOpticalChangesLine) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.backgroundHighlight)
         {
            backgroundHighlight.setNativeInstance(_nativeObject.backgroundHighlight);
         }
         if(_nativeObject.backgroundEven)
         {
            backgroundEven.setNativeInstance(_nativeObject.backgroundEven);
         }
         if(_nativeObject.backgroundOdd)
         {
            backgroundOdd.setNativeInstance(_nativeObject.backgroundOdd);
         }
         FlashLabelArea.setNativeInstance(txtName,_nativeObject.txtName);
         if(_nativeObject.iconImage)
         {
            iconImage.setNativeInstance(_nativeObject.iconImage);
         }
         if(_nativeObject.iconCheckmark)
         {
            iconCheckmark.setNativeInstance(_nativeObject.iconCheckmark);
         }
         if(_nativeObject.iconExclamationMark)
         {
            iconExclamationMark.setNativeInstance(_nativeObject.iconExclamationMark);
         }
      }
   }
}
