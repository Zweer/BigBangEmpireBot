package visuals.ui.elements.item
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundTooltipGeneric;
   
   public class SymbolEmptyItemTooltipGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolEmptyItemTooltip = null;
      
      public var background:SymbolSlice9BackgroundTooltipGeneric = null;
      
      public var txtStats:ILabelArea = null;
      
      public var txtItemName:ILabelArea = null;
      
      public var txtItemQualityCommon:ILabelArea = null;
      
      public var txtItemQualityRare:ILabelArea = null;
      
      public var txtItemQualityEpic:ILabelArea = null;
      
      public var txtItemCategory:ILabelArea = null;
      
      public var txtStatsCaption:ILabelArea = null;
      
      public function SymbolEmptyItemTooltipGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolEmptyItemTooltip;
         }
         else
         {
            _nativeObject = new SymbolEmptyItemTooltip();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         background = new SymbolSlice9BackgroundTooltipGeneric(_nativeObject.background);
         txtStats = FlashLabelArea.fromNative(_nativeObject.txtStats);
         txtItemName = FlashLabelArea.fromNative(_nativeObject.txtItemName);
         txtItemQualityCommon = FlashLabelArea.fromNative(_nativeObject.txtItemQualityCommon);
         txtItemQualityRare = FlashLabelArea.fromNative(_nativeObject.txtItemQualityRare);
         txtItemQualityEpic = FlashLabelArea.fromNative(_nativeObject.txtItemQualityEpic);
         txtItemCategory = FlashLabelArea.fromNative(_nativeObject.txtItemCategory);
         txtStatsCaption = FlashLabelArea.fromNative(_nativeObject.txtStatsCaption);
      }
      
      public function setNativeInstance(param1:SymbolEmptyItemTooltip) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.background)
         {
            background.setNativeInstance(_nativeObject.background);
         }
         FlashLabelArea.setNativeInstance(txtStats,_nativeObject.txtStats);
         FlashLabelArea.setNativeInstance(txtItemName,_nativeObject.txtItemName);
         FlashLabelArea.setNativeInstance(txtItemQualityCommon,_nativeObject.txtItemQualityCommon);
         FlashLabelArea.setNativeInstance(txtItemQualityRare,_nativeObject.txtItemQualityRare);
         FlashLabelArea.setNativeInstance(txtItemQualityEpic,_nativeObject.txtItemQualityEpic);
         FlashLabelArea.setNativeInstance(txtItemCategory,_nativeObject.txtItemCategory);
         FlashLabelArea.setNativeInstance(txtStatsCaption,_nativeObject.txtStatsCaption);
      }
   }
}
