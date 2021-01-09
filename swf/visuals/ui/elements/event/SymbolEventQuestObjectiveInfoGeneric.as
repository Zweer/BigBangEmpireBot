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
   import visuals.ui.elements.buttons.SymbolButtonArrowLeftGeneric;
   import visuals.ui.elements.buttons.SymbolButtonPremiumGeneric;
   
   public class SymbolEventQuestObjectiveInfoGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolEventQuestObjectiveInfo = null;
      
      public var txtTitle:ILabelArea = null;
      
      public var txtDescription:ILabelArea = null;
      
      public var txtRewardsCaption:ILabel = null;
      
      public var txtProgressCaption:ILabel = null;
      
      public var reward:SymbolEventQuestRewardGeneric = null;
      
      public var txtProgress:ILabel = null;
      
      public var btnInstantFinish:SymbolButtonPremiumGeneric = null;
      
      public var iconObjective:SymbolPlaceholderGeneric = null;
      
      public var btnBack:SymbolButtonArrowLeftGeneric = null;
      
      public function SymbolEventQuestObjectiveInfoGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolEventQuestObjectiveInfo;
         }
         else
         {
            _nativeObject = new SymbolEventQuestObjectiveInfo();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         txtTitle = FlashLabelArea.fromNative(_nativeObject.txtTitle);
         txtDescription = FlashLabelArea.fromNative(_nativeObject.txtDescription);
         txtRewardsCaption = FlashLabel.fromNative(_nativeObject.txtRewardsCaption);
         txtProgressCaption = FlashLabel.fromNative(_nativeObject.txtProgressCaption);
         reward = new SymbolEventQuestRewardGeneric(_nativeObject.reward);
         txtProgress = FlashLabel.fromNative(_nativeObject.txtProgress);
         btnInstantFinish = new SymbolButtonPremiumGeneric(_nativeObject.btnInstantFinish);
         iconObjective = new SymbolPlaceholderGeneric(_nativeObject.iconObjective);
         btnBack = new SymbolButtonArrowLeftGeneric(_nativeObject.btnBack);
      }
      
      public function setNativeInstance(param1:SymbolEventQuestObjectiveInfo) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         FlashLabelArea.setNativeInstance(txtTitle,_nativeObject.txtTitle);
         FlashLabelArea.setNativeInstance(txtDescription,_nativeObject.txtDescription);
         FlashLabel.setNativeInstance(txtRewardsCaption,_nativeObject.txtRewardsCaption);
         FlashLabel.setNativeInstance(txtProgressCaption,_nativeObject.txtProgressCaption);
         if(_nativeObject.reward)
         {
            reward.setNativeInstance(_nativeObject.reward);
         }
         FlashLabel.setNativeInstance(txtProgress,_nativeObject.txtProgress);
         if(_nativeObject.btnInstantFinish)
         {
            btnInstantFinish.setNativeInstance(_nativeObject.btnInstantFinish);
         }
         if(_nativeObject.iconObjective)
         {
            iconObjective.setNativeInstance(_nativeObject.iconObjective);
         }
         if(_nativeObject.btnBack)
         {
            btnBack.setNativeInstance(_nativeObject.btnBack);
         }
      }
   }
}
