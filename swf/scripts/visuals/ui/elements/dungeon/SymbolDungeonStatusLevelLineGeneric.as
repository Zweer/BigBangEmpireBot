package visuals.ui.elements.dungeon
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.elements.backgrounds.SymbolBackgroundScalableGeneric;
   import visuals.ui.elements.item.SymbolItemSlotGeneric;
   
   public class SymbolDungeonStatusLevelLineGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDungeonStatusLevelLine = null;
      
      public var bgEven:SymbolBackgroundScalableGeneric = null;
      
      public var bgOdd:SymbolBackgroundScalableGeneric = null;
      
      public var txtMissionsRemaining:ILabelArea = null;
      
      public var photo:SymbolDungeonPhotoSmallGeneric = null;
      
      public var tooltipLayer:SymbolDungeonStatusLevelLineTooltipLayerGeneric = null;
      
      public var itemReward:SymbolItemSlotGeneric = null;
      
      public function SymbolDungeonStatusLevelLineGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDungeonStatusLevelLine;
         }
         else
         {
            _nativeObject = new SymbolDungeonStatusLevelLine();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         bgEven = new SymbolBackgroundScalableGeneric(_nativeObject.bgEven);
         bgOdd = new SymbolBackgroundScalableGeneric(_nativeObject.bgOdd);
         txtMissionsRemaining = FlashLabelArea.fromNative(_nativeObject.txtMissionsRemaining);
         photo = new SymbolDungeonPhotoSmallGeneric(_nativeObject.photo);
         tooltipLayer = new SymbolDungeonStatusLevelLineTooltipLayerGeneric(_nativeObject.tooltipLayer);
         itemReward = new SymbolItemSlotGeneric(_nativeObject.itemReward);
      }
      
      public function setNativeInstance(param1:SymbolDungeonStatusLevelLine) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.bgEven)
         {
            bgEven.setNativeInstance(_nativeObject.bgEven);
         }
         if(_nativeObject.bgOdd)
         {
            bgOdd.setNativeInstance(_nativeObject.bgOdd);
         }
         FlashLabelArea.setNativeInstance(txtMissionsRemaining,_nativeObject.txtMissionsRemaining);
         if(_nativeObject.photo)
         {
            photo.setNativeInstance(_nativeObject.photo);
         }
         if(_nativeObject.tooltipLayer)
         {
            tooltipLayer.setNativeInstance(_nativeObject.tooltipLayer);
         }
         if(_nativeObject.itemReward)
         {
            itemReward.setNativeInstance(_nativeObject.itemReward);
         }
      }
   }
}
