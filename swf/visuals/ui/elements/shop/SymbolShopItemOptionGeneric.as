package visuals.ui.elements.shop
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolPlaceholderGeneric;
   import visuals.ui.elements.payment.SymbolPaymentMethodSelectedGeneric;
   
   public class SymbolShopItemOptionGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolShopItemOption = null;
      
      public var background:SymbolPlaceholderGeneric = null;
      
      public var backgroundUnselected:SymbolShopBackgroundUnselectedGeneric = null;
      
      public var backgroundSelected:SymbolShopBackgroundSelectedGeneric = null;
      
      public var iconItem:SymbolPlaceholderGeneric = null;
      
      public var txtPrice:ILabelArea = null;
      
      public var selected:SymbolPaymentMethodSelectedGeneric = null;
      
      public var txtName:ILabelArea = null;
      
      public function SymbolShopItemOptionGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolShopItemOption;
         }
         else
         {
            _nativeObject = new SymbolShopItemOption();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         background = new SymbolPlaceholderGeneric(_nativeObject.background);
         backgroundUnselected = new SymbolShopBackgroundUnselectedGeneric(_nativeObject.backgroundUnselected);
         backgroundSelected = new SymbolShopBackgroundSelectedGeneric(_nativeObject.backgroundSelected);
         iconItem = new SymbolPlaceholderGeneric(_nativeObject.iconItem);
         txtPrice = FlashLabelArea.fromNative(_nativeObject.txtPrice);
         selected = new SymbolPaymentMethodSelectedGeneric(_nativeObject.selected);
         txtName = FlashLabelArea.fromNative(_nativeObject.txtName);
      }
      
      public function setNativeInstance(param1:SymbolShopItemOption) : void
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
         if(_nativeObject.backgroundUnselected)
         {
            backgroundUnselected.setNativeInstance(_nativeObject.backgroundUnselected);
         }
         if(_nativeObject.backgroundSelected)
         {
            backgroundSelected.setNativeInstance(_nativeObject.backgroundSelected);
         }
         if(_nativeObject.iconItem)
         {
            iconItem.setNativeInstance(_nativeObject.iconItem);
         }
         FlashLabelArea.setNativeInstance(txtPrice,_nativeObject.txtPrice);
         if(_nativeObject.selected)
         {
            selected.setNativeInstance(_nativeObject.selected);
         }
         FlashLabelArea.setNativeInstance(txtName,_nativeObject.txtName);
      }
   }
}
