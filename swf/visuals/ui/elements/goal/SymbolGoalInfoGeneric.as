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
   import visuals.ui.elements.buttons.SymbolButtonArrowLeftBlueGeneric;
   import visuals.ui.elements.icons.SymbolIconLockGeneric;
   
   public class SymbolGoalInfoGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolGoalInfo = null;
      
      public var backgroundOdd:SymbolGoalHighlightGeneric = null;
      
      public var iconGoal:SymbolPlaceholderGeneric = null;
      
      public var txtRewardsCaption:ILabel = null;
      
      public var txtProgressCaption:ILabel = null;
      
      public var txtDescription:ILabelArea = null;
      
      public var txtTitle:ILabelArea = null;
      
      public var btnBack:SymbolButtonArrowLeftBlueGeneric = null;
      
      public var txtStageCaption:ILabel = null;
      
      public var list:SymbolGoalInfoListGeneric = null;
      
      public var iconLock:SymbolIconLockGeneric = null;
      
      public function SymbolGoalInfoGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolGoalInfo;
         }
         else
         {
            _nativeObject = new SymbolGoalInfo();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         backgroundOdd = new SymbolGoalHighlightGeneric(_nativeObject.backgroundOdd);
         iconGoal = new SymbolPlaceholderGeneric(_nativeObject.iconGoal);
         txtRewardsCaption = FlashLabel.fromNative(_nativeObject.txtRewardsCaption);
         txtProgressCaption = FlashLabel.fromNative(_nativeObject.txtProgressCaption);
         txtDescription = FlashLabelArea.fromNative(_nativeObject.txtDescription);
         txtTitle = FlashLabelArea.fromNative(_nativeObject.txtTitle);
         btnBack = new SymbolButtonArrowLeftBlueGeneric(_nativeObject.btnBack);
         txtStageCaption = FlashLabel.fromNative(_nativeObject.txtStageCaption);
         list = new SymbolGoalInfoListGeneric(_nativeObject.list);
         iconLock = new SymbolIconLockGeneric(_nativeObject.iconLock);
      }
      
      public function setNativeInstance(param1:SymbolGoalInfo) : void
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
         if(_nativeObject.iconGoal)
         {
            iconGoal.setNativeInstance(_nativeObject.iconGoal);
         }
         FlashLabel.setNativeInstance(txtRewardsCaption,_nativeObject.txtRewardsCaption);
         FlashLabel.setNativeInstance(txtProgressCaption,_nativeObject.txtProgressCaption);
         FlashLabelArea.setNativeInstance(txtDescription,_nativeObject.txtDescription);
         FlashLabelArea.setNativeInstance(txtTitle,_nativeObject.txtTitle);
         if(_nativeObject.btnBack)
         {
            btnBack.setNativeInstance(_nativeObject.btnBack);
         }
         FlashLabel.setNativeInstance(txtStageCaption,_nativeObject.txtStageCaption);
         if(_nativeObject.list)
         {
            list.setNativeInstance(_nativeObject.list);
         }
         if(_nativeObject.iconLock)
         {
            iconLock.setNativeInstance(_nativeObject.iconLock);
         }
      }
   }
}
