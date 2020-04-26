package visuals.ui.elements.story_dungeon
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.elements.conventions.SymbolItemRewardIconGeneric;
   import visuals.ui.elements.icons.SymbolIconPlusGeneric;
   
   public class SymbolStoryDungeonRewardGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolStoryDungeonReward = null;
      
      public var iconItem:SymbolItemRewardIconGeneric = null;
      
      public var txtItemReward:ILabelArea = null;
      
      public var txtStatPoints:ILabelArea = null;
      
      public var iconStatPoint:SymbolIconPlusGeneric = null;
      
      public var txtStageReward:ILabelArea = null;
      
      public var txtRewardsCaption:ILabel = null;
      
      public var txtStageMissionReward:ILabelArea = null;
      
      public var iconStageReward:SymbolIconStageChangeRewardGeneric = null;
      
      public var iconStageMissionReward:SymbolIconMoreMissionRewardGeneric = null;
      
      public function SymbolStoryDungeonRewardGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolStoryDungeonReward;
         }
         else
         {
            _nativeObject = new SymbolStoryDungeonReward();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         iconItem = new SymbolItemRewardIconGeneric(_nativeObject.iconItem);
         txtItemReward = FlashLabelArea.fromNative(_nativeObject.txtItemReward);
         txtStatPoints = FlashLabelArea.fromNative(_nativeObject.txtStatPoints);
         iconStatPoint = new SymbolIconPlusGeneric(_nativeObject.iconStatPoint);
         txtStageReward = FlashLabelArea.fromNative(_nativeObject.txtStageReward);
         txtRewardsCaption = FlashLabel.fromNative(_nativeObject.txtRewardsCaption);
         txtStageMissionReward = FlashLabelArea.fromNative(_nativeObject.txtStageMissionReward);
         iconStageReward = new SymbolIconStageChangeRewardGeneric(_nativeObject.iconStageReward);
         iconStageMissionReward = new SymbolIconMoreMissionRewardGeneric(_nativeObject.iconStageMissionReward);
      }
      
      public function setNativeInstance(param1:SymbolStoryDungeonReward) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.iconItem)
         {
            iconItem.setNativeInstance(_nativeObject.iconItem);
         }
         FlashLabelArea.setNativeInstance(txtItemReward,_nativeObject.txtItemReward);
         FlashLabelArea.setNativeInstance(txtStatPoints,_nativeObject.txtStatPoints);
         if(_nativeObject.iconStatPoint)
         {
            iconStatPoint.setNativeInstance(_nativeObject.iconStatPoint);
         }
         FlashLabelArea.setNativeInstance(txtStageReward,_nativeObject.txtStageReward);
         FlashLabel.setNativeInstance(txtRewardsCaption,_nativeObject.txtRewardsCaption);
         FlashLabelArea.setNativeInstance(txtStageMissionReward,_nativeObject.txtStageMissionReward);
         if(_nativeObject.iconStageReward)
         {
            iconStageReward.setNativeInstance(_nativeObject.iconStageReward);
         }
         if(_nativeObject.iconStageMissionReward)
         {
            iconStageMissionReward.setNativeInstance(_nativeObject.iconStageMissionReward);
         }
      }
   }
}
