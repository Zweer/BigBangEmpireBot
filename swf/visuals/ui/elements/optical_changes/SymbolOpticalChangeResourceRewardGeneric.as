package visuals.ui.elements.optical_changes
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   import visuals.ui.elements.item.SymbolItemSlotBorderGeneric;
   
   public class SymbolOpticalChangeResourceRewardGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolOpticalChangeResourceReward = null;
      
      public var symbolItemSlotBorder:SymbolItemSlotBorderGeneric = null;
      
      public var symbolOpticalChangeResource:SymbolOpticalChangeResourceGeneric = null;
      
      public var txtAmount:ILabel = null;
      
      public var tooltipLayer:SymbolDummyGeneric = null;
      
      public function SymbolOpticalChangeResourceRewardGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolOpticalChangeResourceReward;
         }
         else
         {
            _nativeObject = new SymbolOpticalChangeResourceReward();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolItemSlotBorder = new SymbolItemSlotBorderGeneric(_nativeObject.symbolItemSlotBorder);
         symbolOpticalChangeResource = new SymbolOpticalChangeResourceGeneric(_nativeObject.symbolOpticalChangeResource);
         txtAmount = FlashLabel.fromNative(_nativeObject.txtAmount);
         tooltipLayer = new SymbolDummyGeneric(_nativeObject.tooltipLayer);
      }
      
      public function setNativeInstance(param1:SymbolOpticalChangeResourceReward) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.symbolItemSlotBorder)
         {
            symbolItemSlotBorder.setNativeInstance(_nativeObject.symbolItemSlotBorder);
         }
         if(_nativeObject.symbolOpticalChangeResource)
         {
            symbolOpticalChangeResource.setNativeInstance(_nativeObject.symbolOpticalChangeResource);
         }
         FlashLabel.setNativeInstance(txtAmount,_nativeObject.txtAmount);
         if(_nativeObject.tooltipLayer)
         {
            tooltipLayer.setNativeInstance(_nativeObject.tooltipLayer);
         }
      }
   }
}
