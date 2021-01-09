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
   import visuals.ui.elements.conventions.SymbolItemRewardIconGeneric;
   import visuals.ui.elements.icons.SymbolIconPlusGeneric;
   
   public class SymbolDatingStepRewardGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDatingStepReward = null;
      
      public var iconItem:SymbolItemRewardIconGeneric = null;
      
      public var txtItemReward:ILabelArea = null;
      
      public var txtStatPoints:ILabelArea = null;
      
      public var iconStatPoint:SymbolIconPlusGeneric = null;
      
      public var txtGirlPictureReward:ILabelArea = null;
      
      public var txtRewardsCaption:ILabel = null;
      
      public var iconGirlPictureReward:SymbolDatingImageGeneric = null;
      
      public function SymbolDatingStepRewardGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDatingStepReward;
         }
         else
         {
            _nativeObject = new SymbolDatingStepReward();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         iconItem = new SymbolItemRewardIconGeneric(_nativeObject.iconItem);
         txtItemReward = FlashLabelArea.fromNative(_nativeObject.txtItemReward);
         txtStatPoints = FlashLabelArea.fromNative(_nativeObject.txtStatPoints);
         iconStatPoint = new SymbolIconPlusGeneric(_nativeObject.iconStatPoint);
         txtGirlPictureReward = FlashLabelArea.fromNative(_nativeObject.txtGirlPictureReward);
         txtRewardsCaption = FlashLabel.fromNative(_nativeObject.txtRewardsCaption);
         iconGirlPictureReward = new SymbolDatingImageGeneric(_nativeObject.iconGirlPictureReward);
      }
      
      public function setNativeInstance(param1:SymbolDatingStepReward) : void
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
         FlashLabelArea.setNativeInstance(txtGirlPictureReward,_nativeObject.txtGirlPictureReward);
         FlashLabel.setNativeInstance(txtRewardsCaption,_nativeObject.txtRewardsCaption);
         if(_nativeObject.iconGirlPictureReward)
         {
            iconGirlPictureReward.setNativeInstance(_nativeObject.iconGirlPictureReward);
         }
      }
   }
}
