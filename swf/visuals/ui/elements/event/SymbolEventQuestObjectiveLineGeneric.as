package visuals.ui.elements.event
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
   import visuals.ui.base.SymbolUiButtonDefaultCheckGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowRightGeneric;
   import visuals.ui.elements.buttons.SymbolButtonPremiumGeneric;
   import visuals.ui.elements.goal.SymbolGoalHighlightGeneric;
   import visuals.ui.elements.icons.SymbolIconCheckmarkGeneric;
   
   public class SymbolEventQuestObjectiveLineGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolEventQuestObjectiveLine = null;
      
      public var backgroundOdd:SymbolGoalHighlightGeneric = null;
      
      public var txtTitle:ILabel = null;
      
      public var txtShortDescription:ILabelArea = null;
      
      public var reward:SymbolEventQuestRewardGeneric = null;
      
      public var iconObjective:SymbolPlaceholderGeneric = null;
      
      public var btnRight:SymbolButtonArrowRightGeneric = null;
      
      public var btnInstantFinish:SymbolButtonPremiumGeneric = null;
      
      public var btnCollect:SymbolUiButtonDefaultCheckGeneric = null;
      
      public var iconCheckmark:SymbolIconCheckmarkGeneric = null;
      
      public function SymbolEventQuestObjectiveLineGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolEventQuestObjectiveLine;
         }
         else
         {
            _nativeObject = new SymbolEventQuestObjectiveLine();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         backgroundOdd = new SymbolGoalHighlightGeneric(_nativeObject.backgroundOdd);
         txtTitle = FlashLabel.fromNative(_nativeObject.txtTitle);
         txtShortDescription = FlashLabelArea.fromNative(_nativeObject.txtShortDescription);
         reward = new SymbolEventQuestRewardGeneric(_nativeObject.reward);
         iconObjective = new SymbolPlaceholderGeneric(_nativeObject.iconObjective);
         btnRight = new SymbolButtonArrowRightGeneric(_nativeObject.btnRight);
         btnInstantFinish = new SymbolButtonPremiumGeneric(_nativeObject.btnInstantFinish);
         btnCollect = new SymbolUiButtonDefaultCheckGeneric(_nativeObject.btnCollect);
         iconCheckmark = new SymbolIconCheckmarkGeneric(_nativeObject.iconCheckmark);
      }
      
      public function setNativeInstance(param1:SymbolEventQuestObjectiveLine) : void
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
         FlashLabel.setNativeInstance(txtTitle,_nativeObject.txtTitle);
         FlashLabelArea.setNativeInstance(txtShortDescription,_nativeObject.txtShortDescription);
         if(_nativeObject.reward)
         {
            reward.setNativeInstance(_nativeObject.reward);
         }
         if(_nativeObject.iconObjective)
         {
            iconObjective.setNativeInstance(_nativeObject.iconObjective);
         }
         if(_nativeObject.btnRight)
         {
            btnRight.setNativeInstance(_nativeObject.btnRight);
         }
         if(_nativeObject.btnInstantFinish)
         {
            btnInstantFinish.setNativeInstance(_nativeObject.btnInstantFinish);
         }
         if(_nativeObject.btnCollect)
         {
            btnCollect.setNativeInstance(_nativeObject.btnCollect);
         }
         if(_nativeObject.iconCheckmark)
         {
            iconCheckmark.setNativeInstance(_nativeObject.iconCheckmark);
         }
      }
   }
}
