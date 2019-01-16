package visuals.ui.elements.sewing_machine
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
   import visuals.ui.elements.goal.SymbolGoalExclamationMarkGeneric;
   import visuals.ui.elements.goal.SymbolGoalHighlightGeneric;
   import visuals.ui.elements.icons.SymbolIconCheckmarkGeneric;
   import visuals.ui.elements.icons.SymbolIconLockGeneric;
   
   public class SymbolItemPatternLineGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolItemPatternLine = null;
      
      public var backgroundHighlight:SymbolGenericListLineOddGeneric = null;
      
      public var backgroundEven:SymbolGenericListLineEvenGeneric = null;
      
      public var backgroundOdd:SymbolGoalHighlightGeneric = null;
      
      public var iconImage:SymbolPlaceholderGeneric = null;
      
      public var txtName:ILabelArea = null;
      
      public var iconLock:SymbolIconLockGeneric = null;
      
      public var iconCheckmark:SymbolIconCheckmarkGeneric = null;
      
      public var iconCounter:SymbolGoalExclamationMarkGeneric = null;
      
      public function SymbolItemPatternLineGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolItemPatternLine;
         }
         else
         {
            _nativeObject = new SymbolItemPatternLine();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         backgroundHighlight = new SymbolGenericListLineOddGeneric(_nativeObject.backgroundHighlight);
         backgroundEven = new SymbolGenericListLineEvenGeneric(_nativeObject.backgroundEven);
         backgroundOdd = new SymbolGoalHighlightGeneric(_nativeObject.backgroundOdd);
         iconImage = new SymbolPlaceholderGeneric(_nativeObject.iconImage);
         txtName = FlashLabelArea.fromNative(_nativeObject.txtName);
         iconLock = new SymbolIconLockGeneric(_nativeObject.iconLock);
         iconCheckmark = new SymbolIconCheckmarkGeneric(_nativeObject.iconCheckmark);
         iconCounter = new SymbolGoalExclamationMarkGeneric(_nativeObject.iconCounter);
      }
      
      public function setNativeInstance(param1:SymbolItemPatternLine) : void
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
         if(_nativeObject.iconImage)
         {
            iconImage.setNativeInstance(_nativeObject.iconImage);
         }
         FlashLabelArea.setNativeInstance(txtName,_nativeObject.txtName);
         if(_nativeObject.iconLock)
         {
            iconLock.setNativeInstance(_nativeObject.iconLock);
         }
         if(_nativeObject.iconCheckmark)
         {
            iconCheckmark.setNativeInstance(_nativeObject.iconCheckmark);
         }
         if(_nativeObject.iconCounter)
         {
            iconCounter.setNativeInstance(_nativeObject.iconCounter);
         }
      }
   }
}
