package visuals.ui.elements.dating
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   import visuals.ui.elements.backgrounds.SymbolBackgroundScalableGeneric;
   import visuals.ui.elements.buttons.SymbolButtonInstantFinishGeneric;
   import visuals.ui.elements.buttons.SymbolButtonPremiumGeneric;
   
   public class SymbolDatingBriefingContentGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDatingBriefingContent = null;
      
      public var txtDescription:ILabelArea = null;
      
      public var reward:SymbolDatingStepRewardGeneric = null;
      
      public var txtProgressCaption:ILabel = null;
      
      public var progressBar:SymbolDatingProgressBarGeneric = null;
      
      public var txtProgress:ILabelArea = null;
      
      public var girl:SymbolDummyGeneric = null;
      
      public var symbolBackgroundScalable:SymbolBackgroundScalableGeneric = null;
      
      public var hearth1:SymbolDatingHearthGeneric = null;
      
      public var hearth2:SymbolDatingHearthGeneric = null;
      
      public var hearth3:SymbolDatingHearthGeneric = null;
      
      public var hearth4:SymbolDatingHearthGeneric = null;
      
      public var hearth5:SymbolDatingHearthGeneric = null;
      
      public var txtCooldown:ILabelArea = null;
      
      public var btnInstantFinishBattle:SymbolButtonPremiumGeneric = null;
      
      public var btnInstantFinish:SymbolButtonInstantFinishGeneric = null;
      
      public var balloon:SymbolDatingDialogMessageBubbleGeneric = null;
      
      public function SymbolDatingBriefingContentGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDatingBriefingContent;
         }
         else
         {
            _nativeObject = new SymbolDatingBriefingContent();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         txtDescription = FlashLabelArea.fromNative(_nativeObject.txtDescription);
         reward = new SymbolDatingStepRewardGeneric(_nativeObject.reward);
         txtProgressCaption = FlashLabel.fromNative(_nativeObject.txtProgressCaption);
         progressBar = new SymbolDatingProgressBarGeneric(_nativeObject.progressBar);
         txtProgress = FlashLabelArea.fromNative(_nativeObject.txtProgress);
         girl = new SymbolDummyGeneric(_nativeObject.girl);
         symbolBackgroundScalable = new SymbolBackgroundScalableGeneric(_nativeObject.symbolBackgroundScalable);
         hearth1 = new SymbolDatingHearthGeneric(_nativeObject.hearth1);
         hearth2 = new SymbolDatingHearthGeneric(_nativeObject.hearth2);
         hearth3 = new SymbolDatingHearthGeneric(_nativeObject.hearth3);
         hearth4 = new SymbolDatingHearthGeneric(_nativeObject.hearth4);
         hearth5 = new SymbolDatingHearthGeneric(_nativeObject.hearth5);
         txtCooldown = FlashLabelArea.fromNative(_nativeObject.txtCooldown);
         btnInstantFinishBattle = new SymbolButtonPremiumGeneric(_nativeObject.btnInstantFinishBattle);
         btnInstantFinish = new SymbolButtonInstantFinishGeneric(_nativeObject.btnInstantFinish);
         balloon = new SymbolDatingDialogMessageBubbleGeneric(_nativeObject.balloon);
      }
      
      public function setNativeInstance(param1:SymbolDatingBriefingContent) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         FlashLabelArea.setNativeInstance(txtDescription,_nativeObject.txtDescription);
         if(_nativeObject.reward)
         {
            reward.setNativeInstance(_nativeObject.reward);
         }
         FlashLabel.setNativeInstance(txtProgressCaption,_nativeObject.txtProgressCaption);
         if(_nativeObject.progressBar)
         {
            progressBar.setNativeInstance(_nativeObject.progressBar);
         }
         FlashLabelArea.setNativeInstance(txtProgress,_nativeObject.txtProgress);
         if(_nativeObject.girl)
         {
            girl.setNativeInstance(_nativeObject.girl);
         }
         if(_nativeObject.symbolBackgroundScalable)
         {
            symbolBackgroundScalable.setNativeInstance(_nativeObject.symbolBackgroundScalable);
         }
         if(_nativeObject.hearth1)
         {
            hearth1.setNativeInstance(_nativeObject.hearth1);
         }
         if(_nativeObject.hearth2)
         {
            hearth2.setNativeInstance(_nativeObject.hearth2);
         }
         if(_nativeObject.hearth3)
         {
            hearth3.setNativeInstance(_nativeObject.hearth3);
         }
         if(_nativeObject.hearth4)
         {
            hearth4.setNativeInstance(_nativeObject.hearth4);
         }
         if(_nativeObject.hearth5)
         {
            hearth5.setNativeInstance(_nativeObject.hearth5);
         }
         FlashLabelArea.setNativeInstance(txtCooldown,_nativeObject.txtCooldown);
         if(_nativeObject.btnInstantFinishBattle)
         {
            btnInstantFinishBattle.setNativeInstance(_nativeObject.btnInstantFinishBattle);
         }
         if(_nativeObject.btnInstantFinish)
         {
            btnInstantFinish.setNativeInstance(_nativeObject.btnInstantFinish);
         }
         if(_nativeObject.balloon)
         {
            balloon.setNativeInstance(_nativeObject.balloon);
         }
      }
   }
}
