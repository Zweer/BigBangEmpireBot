package visuals.ui.elements.streaming
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolUiButtonDefaultGeneric;
   import visuals.ui.elements.item.SymbolItemSlotGeneric;
   import visuals.ui.elements.slotmachine.SymbolSlotmachineRewardCoinGeneric;
   
   public class SymbolStreamingRoomRewardGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolStreamingRoomReward = null;
      
      public var iconItemReward:SymbolItemSlotGeneric = null;
      
      public var iconGameCurrencyReward:SymbolSlotmachineRewardCoinGeneric = null;
      
      public var iconStreamingReward:SymbolIconStreamingResourceGeneric = null;
      
      public var txtRewards:ILabelArea = null;
      
      public var btnCollectReward:SymbolUiButtonDefaultGeneric = null;
      
      public function SymbolStreamingRoomRewardGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolStreamingRoomReward;
         }
         else
         {
            _nativeObject = new SymbolStreamingRoomReward();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         iconItemReward = new SymbolItemSlotGeneric(_nativeObject.iconItemReward);
         iconGameCurrencyReward = new SymbolSlotmachineRewardCoinGeneric(_nativeObject.iconGameCurrencyReward);
         iconStreamingReward = new SymbolIconStreamingResourceGeneric(_nativeObject.iconStreamingReward);
         txtRewards = FlashLabelArea.fromNative(_nativeObject.txtRewards);
         btnCollectReward = new SymbolUiButtonDefaultGeneric(_nativeObject.btnCollectReward);
      }
      
      public function setNativeInstance(param1:SymbolStreamingRoomReward) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.iconItemReward)
         {
            iconItemReward.setNativeInstance(_nativeObject.iconItemReward);
         }
         if(_nativeObject.iconGameCurrencyReward)
         {
            iconGameCurrencyReward.setNativeInstance(_nativeObject.iconGameCurrencyReward);
         }
         if(_nativeObject.iconStreamingReward)
         {
            iconStreamingReward.setNativeInstance(_nativeObject.iconStreamingReward);
         }
         FlashLabelArea.setNativeInstance(txtRewards,_nativeObject.txtRewards);
         if(_nativeObject.btnCollectReward)
         {
            btnCollectReward.setNativeInstance(_nativeObject.btnCollectReward);
         }
      }
   }
}
