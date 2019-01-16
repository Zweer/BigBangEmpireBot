package visuals.ui.elements.avatar
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolAvatarItemLayersGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolAvatarItemLayers = null;
      
      public var layerItemLegsBack:SymbolAvatarLayerGeneric = null;
      
      public var layerItemChestBack:SymbolAvatarLayerGeneric = null;
      
      public var layerItemBoots:SymbolAvatarLayerGeneric = null;
      
      public var layerItemLegsFront:SymbolAvatarLayerGeneric = null;
      
      public var layerItemChestFront:SymbolAvatarLayerGeneric = null;
      
      public var layerItemBelt:SymbolAvatarLayerGeneric = null;
      
      public var layerItemHead:SymbolAvatarLayerGeneric = null;
      
      public function SymbolAvatarItemLayersGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolAvatarItemLayers;
         }
         else
         {
            _nativeObject = new SymbolAvatarItemLayers();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         layerItemLegsBack = new SymbolAvatarLayerGeneric(_nativeObject.layerItemLegsBack);
         layerItemChestBack = new SymbolAvatarLayerGeneric(_nativeObject.layerItemChestBack);
         layerItemBoots = new SymbolAvatarLayerGeneric(_nativeObject.layerItemBoots);
         layerItemLegsFront = new SymbolAvatarLayerGeneric(_nativeObject.layerItemLegsFront);
         layerItemChestFront = new SymbolAvatarLayerGeneric(_nativeObject.layerItemChestFront);
         layerItemBelt = new SymbolAvatarLayerGeneric(_nativeObject.layerItemBelt);
         layerItemHead = new SymbolAvatarLayerGeneric(_nativeObject.layerItemHead);
      }
      
      public function setNativeInstance(param1:SymbolAvatarItemLayers) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.layerItemLegsBack)
         {
            layerItemLegsBack.setNativeInstance(_nativeObject.layerItemLegsBack);
         }
         if(_nativeObject.layerItemChestBack)
         {
            layerItemChestBack.setNativeInstance(_nativeObject.layerItemChestBack);
         }
         if(_nativeObject.layerItemBoots)
         {
            layerItemBoots.setNativeInstance(_nativeObject.layerItemBoots);
         }
         if(_nativeObject.layerItemLegsFront)
         {
            layerItemLegsFront.setNativeInstance(_nativeObject.layerItemLegsFront);
         }
         if(_nativeObject.layerItemChestFront)
         {
            layerItemChestFront.setNativeInstance(_nativeObject.layerItemChestFront);
         }
         if(_nativeObject.layerItemBelt)
         {
            layerItemBelt.setNativeInstance(_nativeObject.layerItemBelt);
         }
         if(_nativeObject.layerItemHead)
         {
            layerItemHead.setNativeInstance(_nativeObject.layerItemHead);
         }
      }
   }
}
