package visuals.ui.elements.optical_changes
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   import visuals.ui.base.SymbolPlaceholderGeneric;
   
   public class SymbolOpticalChangeSlotGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolOpticalChangeSlot = null;
      
      public var iconBorderCommon:SymbolOpticalChangeIconCommonGeneric = null;
      
      public var iconBorderRare:SymbolOpticalChangeIconRareGeneric = null;
      
      public var iconBorderEpic:SymbolOpticalChangeIconEpicGeneric = null;
      
      public var icon:SymbolPlaceholderGeneric = null;
      
      public var iconEffect:SymbolDummyGeneric = null;
      
      public function SymbolOpticalChangeSlotGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolOpticalChangeSlot;
         }
         else
         {
            _nativeObject = new SymbolOpticalChangeSlot();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         iconBorderCommon = new SymbolOpticalChangeIconCommonGeneric(_nativeObject.iconBorderCommon);
         iconBorderRare = new SymbolOpticalChangeIconRareGeneric(_nativeObject.iconBorderRare);
         iconBorderEpic = new SymbolOpticalChangeIconEpicGeneric(_nativeObject.iconBorderEpic);
         icon = new SymbolPlaceholderGeneric(_nativeObject.icon);
         iconEffect = new SymbolDummyGeneric(_nativeObject.iconEffect);
      }
      
      public function setNativeInstance(param1:SymbolOpticalChangeSlot) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.iconBorderCommon)
         {
            iconBorderCommon.setNativeInstance(_nativeObject.iconBorderCommon);
         }
         if(_nativeObject.iconBorderRare)
         {
            iconBorderRare.setNativeInstance(_nativeObject.iconBorderRare);
         }
         if(_nativeObject.iconBorderEpic)
         {
            iconBorderEpic.setNativeInstance(_nativeObject.iconBorderEpic);
         }
         if(_nativeObject.icon)
         {
            icon.setNativeInstance(_nativeObject.icon);
         }
         if(_nativeObject.iconEffect)
         {
            iconEffect.setNativeInstance(_nativeObject.iconEffect);
         }
      }
   }
}
