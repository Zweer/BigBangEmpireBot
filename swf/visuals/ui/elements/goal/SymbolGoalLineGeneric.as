package visuals.ui.elements.goal
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolPlaceholderGeneric;
   import visuals.ui.base.SymbolUiButtonShortCheckGeneric;
   import visuals.ui.base.SymbolUiCheckboxGeneric;
   import visuals.ui.base.SymbolUiCheckboxStorygoalDefaultGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowRightBlueGeneric;
   import visuals.ui.elements.icons.SymbolIconCheckmarkGeneric;
   import visuals.ui.elements.icons.SymbolIconLockGeneric;
   
   public class SymbolGoalLineGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolGoalLine = null;
      
      public var backgroundOdd:SymbolGoalHighlightGeneric = null;
      
      public var btnRight:SymbolButtonArrowRightBlueGeneric = null;
      
      public var iconGoal:SymbolPlaceholderGeneric = null;
      
      public var txtShortDescription:ILabel = null;
      
      public var txtTitle:ILabel = null;
      
      public var iconLock:SymbolIconLockGeneric = null;
      
      public var btnCollect:SymbolUiButtonShortCheckGeneric = null;
      
      public var txtNew:ILabelArea = null;
      
      public var iconNew:SymbolGoalLineNewGeneric = null;
      
      public var iconCheckmark:SymbolIconCheckmarkGeneric = null;
      
      public var checkStorygoal:SymbolUiCheckboxGeneric = null;
      
      public var checkStorygoalDefault:SymbolUiCheckboxStorygoalDefaultGeneric = null;
      
      public function SymbolGoalLineGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolGoalLine;
         }
         else
         {
            _nativeObject = new SymbolGoalLine();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         backgroundOdd = new SymbolGoalHighlightGeneric(_nativeObject.backgroundOdd);
         btnRight = new SymbolButtonArrowRightBlueGeneric(_nativeObject.btnRight);
         iconGoal = new SymbolPlaceholderGeneric(_nativeObject.iconGoal);
         txtShortDescription = FlashLabel.fromNative(_nativeObject.txtShortDescription);
         txtTitle = FlashLabel.fromNative(_nativeObject.txtTitle);
         iconLock = new SymbolIconLockGeneric(_nativeObject.iconLock);
         btnCollect = new SymbolUiButtonShortCheckGeneric(_nativeObject.btnCollect);
         txtNew = FlashLabelArea.fromNative(_nativeObject.txtNew);
         iconNew = new SymbolGoalLineNewGeneric(_nativeObject.iconNew);
         iconCheckmark = new SymbolIconCheckmarkGeneric(_nativeObject.iconCheckmark);
         checkStorygoal = new SymbolUiCheckboxGeneric(_nativeObject.checkStorygoal);
         checkStorygoalDefault = new SymbolUiCheckboxStorygoalDefaultGeneric(_nativeObject.checkStorygoalDefault);
      }
      
      public function setNativeInstance(param1:SymbolGoalLine) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.backgroundOdd)
         {
            backgroundOdd.setNativeInstance(_nativeObject.backgroundOdd);
         }
         if(_nativeObject.btnRight)
         {
            btnRight.setNativeInstance(_nativeObject.btnRight);
         }
         if(_nativeObject.iconGoal)
         {
            iconGoal.setNativeInstance(_nativeObject.iconGoal);
         }
         FlashLabel.setNativeInstance(txtShortDescription,_nativeObject.txtShortDescription);
         FlashLabel.setNativeInstance(txtTitle,_nativeObject.txtTitle);
         if(_nativeObject.iconLock)
         {
            iconLock.setNativeInstance(_nativeObject.iconLock);
         }
         if(_nativeObject.btnCollect)
         {
            btnCollect.setNativeInstance(_nativeObject.btnCollect);
         }
         FlashLabelArea.setNativeInstance(txtNew,_nativeObject.txtNew);
         if(_nativeObject.iconNew)
         {
            iconNew.setNativeInstance(_nativeObject.iconNew);
         }
         if(_nativeObject.iconCheckmark)
         {
            iconCheckmark.setNativeInstance(_nativeObject.iconCheckmark);
         }
         if(_nativeObject.checkStorygoal)
         {
            checkStorygoal.setNativeInstance(_nativeObject.checkStorygoal);
         }
         if(_nativeObject.checkStorygoalDefault)
         {
            checkStorygoalDefault.setNativeInstance(_nativeObject.checkStorygoalDefault);
         }
      }
   }
}
