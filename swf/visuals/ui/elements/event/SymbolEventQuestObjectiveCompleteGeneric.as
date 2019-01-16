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
   
   public class SymbolEventQuestObjectiveCompleteGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolEventQuestObjectiveComplete = null;
      
      public var txtTitle:ILabelArea = null;
      
      public var iconObjective:SymbolPlaceholderGeneric = null;
      
      public var txtDescription:ILabelArea = null;
      
      public var txtRewardsCaption:ILabel = null;
      
      public var reward:SymbolEventQuestRewardGeneric = null;
      
      public var btnCollect:SymbolUiButtonDefaultCheckGeneric = null;
      
      public function SymbolEventQuestObjectiveCompleteGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolEventQuestObjectiveComplete;
         }
         else
         {
            _nativeObject = new SymbolEventQuestObjectiveComplete();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         txtTitle = FlashLabelArea.fromNative(_nativeObject.txtTitle);
         iconObjective = new SymbolPlaceholderGeneric(_nativeObject.iconObjective);
         txtDescription = FlashLabelArea.fromNative(_nativeObject.txtDescription);
         txtRewardsCaption = FlashLabel.fromNative(_nativeObject.txtRewardsCaption);
         reward = new SymbolEventQuestRewardGeneric(_nativeObject.reward);
         btnCollect = new SymbolUiButtonDefaultCheckGeneric(_nativeObject.btnCollect);
      }
      
      public function setNativeInstance(param1:SymbolEventQuestObjectiveComplete) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         FlashLabelArea.setNativeInstance(txtTitle,_nativeObject.txtTitle);
         if(_nativeObject.iconObjective)
         {
            iconObjective.setNativeInstance(_nativeObject.iconObjective);
         }
         FlashLabelArea.setNativeInstance(txtDescription,_nativeObject.txtDescription);
         FlashLabel.setNativeInstance(txtRewardsCaption,_nativeObject.txtRewardsCaption);
         if(_nativeObject.reward)
         {
            reward.setNativeInstance(_nativeObject.reward);
         }
         if(_nativeObject.btnCollect)
         {
            btnCollect.setNativeInstance(_nativeObject.btnCollect);
         }
      }
   }
}
