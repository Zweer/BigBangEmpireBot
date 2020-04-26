package visuals.ui.elements.goal
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
   
   public class SymbolGoalInfoListGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolGoalInfoList = null;
      
      public var listContainer:SymbolDummyGeneric = null;
      
      public var txtNoGoalValues:ILabelArea = null;
      
      public var scrollBarLine:SymbolScrollLineSmallGeneric = null;
      
      public var scrollBarKnob:SymbolScrollKnobSmallGeneric = null;
      
      public function SymbolGoalInfoListGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolGoalInfoList;
         }
         else
         {
            _nativeObject = new SymbolGoalInfoList();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         listContainer = new SymbolDummyGeneric(_nativeObject.listContainer);
         txtNoGoalValues = FlashLabelArea.fromNative(_nativeObject.txtNoGoalValues);
         scrollBarLine = new SymbolScrollLineSmallGeneric(_nativeObject.scrollBarLine);
         scrollBarKnob = new SymbolScrollKnobSmallGeneric(_nativeObject.scrollBarKnob);
      }
      
      public function setNativeInstance(param1:SymbolGoalInfoList) : void
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
         FlashLabelArea.setNativeInstance(txtNoGoalValues,_nativeObject.txtNoGoalValues);
         if(_nativeObject.scrollBarLine)
         {
            scrollBarLine.setNativeInstance(_nativeObject.scrollBarLine);
         }
         if(_nativeObject.scrollBarKnob)
         {
            scrollBarKnob.setNativeInstance(_nativeObject.scrollBarKnob);
         }
      }
   }
}
