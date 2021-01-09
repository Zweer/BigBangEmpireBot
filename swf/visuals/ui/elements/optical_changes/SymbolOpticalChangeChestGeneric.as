package visuals.ui.elements.optical_changes
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   import visuals.ui.elements.backgrounds.SymbolBackgroundScalableGeneric;
   import visuals.ui.elements.item.SymbolItemSlotGeneric;
   
   public class SymbolOpticalChangeChestGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolOpticalChangeChest = null;
      
      public var spine:SymbolDummyGeneric = null;
      
      public var bg:SymbolBackgroundScalableGeneric = null;
      
      public var txtOpticalChangeName:ILabelArea = null;
      
      public var txtOpticalChangeQualityCommon:ILabelArea = null;
      
      public var txtOpticalChangeQualityRare:ILabelArea = null;
      
      public var txtOpticalChangeQualityEpic:ILabelArea = null;
      
      public var txtOpticalChangeType:ILabelArea = null;
      
      public var m:SymbolDummyGeneric = null;
      
      public var opticalChangeIcon:SymbolOpticalChangeSlotGeneric = null;
      
      public var itemSlot:SymbolItemSlotGeneric = null;
      
      public function SymbolOpticalChangeChestGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolOpticalChangeChest;
         }
         else
         {
            _nativeObject = new SymbolOpticalChangeChest();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         spine = new SymbolDummyGeneric(_nativeObject.spine);
         bg = new SymbolBackgroundScalableGeneric(_nativeObject.bg);
         txtOpticalChangeName = FlashLabelArea.fromNative(_nativeObject.txtOpticalChangeName);
         txtOpticalChangeQualityCommon = FlashLabelArea.fromNative(_nativeObject.txtOpticalChangeQualityCommon);
         txtOpticalChangeQualityRare = FlashLabelArea.fromNative(_nativeObject.txtOpticalChangeQualityRare);
         txtOpticalChangeQualityEpic = FlashLabelArea.fromNative(_nativeObject.txtOpticalChangeQualityEpic);
         txtOpticalChangeType = FlashLabelArea.fromNative(_nativeObject.txtOpticalChangeType);
         m = new SymbolDummyGeneric(_nativeObject.m);
         opticalChangeIcon = new SymbolOpticalChangeSlotGeneric(_nativeObject.opticalChangeIcon);
         itemSlot = new SymbolItemSlotGeneric(_nativeObject.itemSlot);
      }
      
      public function setNativeInstance(param1:SymbolOpticalChangeChest) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.spine)
         {
            spine.setNativeInstance(_nativeObject.spine);
         }
         if(_nativeObject.bg)
         {
            bg.setNativeInstance(_nativeObject.bg);
         }
         FlashLabelArea.setNativeInstance(txtOpticalChangeName,_nativeObject.txtOpticalChangeName);
         FlashLabelArea.setNativeInstance(txtOpticalChangeQualityCommon,_nativeObject.txtOpticalChangeQualityCommon);
         FlashLabelArea.setNativeInstance(txtOpticalChangeQualityRare,_nativeObject.txtOpticalChangeQualityRare);
         FlashLabelArea.setNativeInstance(txtOpticalChangeQualityEpic,_nativeObject.txtOpticalChangeQualityEpic);
         FlashLabelArea.setNativeInstance(txtOpticalChangeType,_nativeObject.txtOpticalChangeType);
         if(_nativeObject.m)
         {
            m.setNativeInstance(_nativeObject.m);
         }
         if(_nativeObject.opticalChangeIcon)
         {
            opticalChangeIcon.setNativeInstance(_nativeObject.opticalChangeIcon);
         }
         if(_nativeObject.itemSlot)
         {
            itemSlot.setNativeInstance(_nativeObject.itemSlot);
         }
      }
   }
}
