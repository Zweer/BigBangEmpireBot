package visuals.ui.elements.avatar
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowLeftGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowRightGeneric;
   import visuals.ui.elements.icons.SymbolIconGameCurrencyGeneric;
   import visuals.ui.elements.icons.SymbolIconPremiumCurrencyGeneric;
   
   public class SymbolCharacterConfiguratorPhotographerGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolCharacterConfiguratorPhotographer = null;
      
      public var background:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var txtRect:ILabel = null;
      
      public var btnRightRect:SymbolButtonArrowRightGeneric = null;
      
      public var btnLeftRect:SymbolButtonArrowLeftGeneric = null;
      
      public var txtBorder:ILabel = null;
      
      public var btnRightBorder:SymbolButtonArrowRightGeneric = null;
      
      public var btnLeftBorder:SymbolButtonArrowLeftGeneric = null;
      
      public var txtBackground:ILabel = null;
      
      public var btnRightBackground:SymbolButtonArrowRightGeneric = null;
      
      public var btnLeftBackground:SymbolButtonArrowLeftGeneric = null;
      
      public var txtFilter:ILabel = null;
      
      public var btnRightFilter:SymbolButtonArrowRightGeneric = null;
      
      public var btnLeftFilter:SymbolButtonArrowLeftGeneric = null;
      
      public var txtIcon:ILabel = null;
      
      public var btnRightIcon:SymbolButtonArrowRightGeneric = null;
      
      public var btnLeftIcon:SymbolButtonArrowLeftGeneric = null;
      
      public var txtSexuality:ILabel = null;
      
      public var btnRightSexuality:SymbolButtonArrowRightGeneric = null;
      
      public var btnLeftSexuality:SymbolButtonArrowLeftGeneric = null;
      
      public var txtPriceCoins_photo_rect_type:ILabel = null;
      
      public var iconCoins_photo_rect_type:SymbolIconGameCurrencyGeneric = null;
      
      public var txtPriceCoins_photo_border_type:ILabel = null;
      
      public var txtPriceCoins_photo_background_type:ILabel = null;
      
      public var txtPriceCoins_photo_filter_type:ILabel = null;
      
      public var txtPriceCoins_photo_icon_type:ILabel = null;
      
      public var iconCoins_photo_icon_type:SymbolIconGameCurrencyGeneric = null;
      
      public var iconCoins_photo_border_type:SymbolIconGameCurrencyGeneric = null;
      
      public var iconCoins_photo_background_type:SymbolIconGameCurrencyGeneric = null;
      
      public var iconCoins_photo_filter_type:SymbolIconGameCurrencyGeneric = null;
      
      public var txtPriceCoins_photo_sexuality_type:ILabel = null;
      
      public var iconCoins_photo_sexuality_type:SymbolIconGameCurrencyGeneric = null;
      
      public var txtPricePremium_photo_rect_type:ILabel = null;
      
      public var iconPremium_photo_rect_type:SymbolIconPremiumCurrencyGeneric = null;
      
      public var txtPricePremium_photo_border_type:ILabel = null;
      
      public var txtPricePremium_photo_background_type:ILabel = null;
      
      public var txtPricePremium_photo_filter_type:ILabel = null;
      
      public var txtPricePremium_photo_icon_type:ILabel = null;
      
      public var iconPremium_photo_icon_type:SymbolIconPremiumCurrencyGeneric = null;
      
      public var iconPremium_photo_border_type:SymbolIconPremiumCurrencyGeneric = null;
      
      public var iconPremium_photo_background_type:SymbolIconPremiumCurrencyGeneric = null;
      
      public var iconPremium_photo_filter_type:SymbolIconPremiumCurrencyGeneric = null;
      
      public var txtPricePremium_photo_sexuality_type:ILabel = null;
      
      public var iconPremium_photo_sexuality_type:SymbolIconPremiumCurrencyGeneric = null;
      
      public var txtPriceCoinsTotal:ILabel = null;
      
      public var iconCoinsTotal:SymbolIconGameCurrencyGeneric = null;
      
      public var txtPricePremiumTotal:ILabel = null;
      
      public var iconPremiumTotal:SymbolIconPremiumCurrencyGeneric = null;
      
      public function SymbolCharacterConfiguratorPhotographerGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolCharacterConfiguratorPhotographer;
         }
         else
         {
            _nativeObject = new SymbolCharacterConfiguratorPhotographer();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         background = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.background);
         txtRect = FlashLabel.fromNative(_nativeObject.txtRect);
         btnRightRect = new SymbolButtonArrowRightGeneric(_nativeObject.btnRightRect);
         btnLeftRect = new SymbolButtonArrowLeftGeneric(_nativeObject.btnLeftRect);
         txtBorder = FlashLabel.fromNative(_nativeObject.txtBorder);
         btnRightBorder = new SymbolButtonArrowRightGeneric(_nativeObject.btnRightBorder);
         btnLeftBorder = new SymbolButtonArrowLeftGeneric(_nativeObject.btnLeftBorder);
         txtBackground = FlashLabel.fromNative(_nativeObject.txtBackground);
         btnRightBackground = new SymbolButtonArrowRightGeneric(_nativeObject.btnRightBackground);
         btnLeftBackground = new SymbolButtonArrowLeftGeneric(_nativeObject.btnLeftBackground);
         txtFilter = FlashLabel.fromNative(_nativeObject.txtFilter);
         btnRightFilter = new SymbolButtonArrowRightGeneric(_nativeObject.btnRightFilter);
         btnLeftFilter = new SymbolButtonArrowLeftGeneric(_nativeObject.btnLeftFilter);
         txtIcon = FlashLabel.fromNative(_nativeObject.txtIcon);
         btnRightIcon = new SymbolButtonArrowRightGeneric(_nativeObject.btnRightIcon);
         btnLeftIcon = new SymbolButtonArrowLeftGeneric(_nativeObject.btnLeftIcon);
         txtSexuality = FlashLabel.fromNative(_nativeObject.txtSexuality);
         btnRightSexuality = new SymbolButtonArrowRightGeneric(_nativeObject.btnRightSexuality);
         btnLeftSexuality = new SymbolButtonArrowLeftGeneric(_nativeObject.btnLeftSexuality);
         txtPriceCoins_photo_rect_type = FlashLabel.fromNative(_nativeObject.txtPriceCoins_photo_rect_type);
         iconCoins_photo_rect_type = new SymbolIconGameCurrencyGeneric(_nativeObject.iconCoins_photo_rect_type);
         txtPriceCoins_photo_border_type = FlashLabel.fromNative(_nativeObject.txtPriceCoins_photo_border_type);
         txtPriceCoins_photo_background_type = FlashLabel.fromNative(_nativeObject.txtPriceCoins_photo_background_type);
         txtPriceCoins_photo_filter_type = FlashLabel.fromNative(_nativeObject.txtPriceCoins_photo_filter_type);
         txtPriceCoins_photo_icon_type = FlashLabel.fromNative(_nativeObject.txtPriceCoins_photo_icon_type);
         iconCoins_photo_icon_type = new SymbolIconGameCurrencyGeneric(_nativeObject.iconCoins_photo_icon_type);
         iconCoins_photo_border_type = new SymbolIconGameCurrencyGeneric(_nativeObject.iconCoins_photo_border_type);
         iconCoins_photo_background_type = new SymbolIconGameCurrencyGeneric(_nativeObject.iconCoins_photo_background_type);
         iconCoins_photo_filter_type = new SymbolIconGameCurrencyGeneric(_nativeObject.iconCoins_photo_filter_type);
         txtPriceCoins_photo_sexuality_type = FlashLabel.fromNative(_nativeObject.txtPriceCoins_photo_sexuality_type);
         iconCoins_photo_sexuality_type = new SymbolIconGameCurrencyGeneric(_nativeObject.iconCoins_photo_sexuality_type);
         txtPricePremium_photo_rect_type = FlashLabel.fromNative(_nativeObject.txtPricePremium_photo_rect_type);
         iconPremium_photo_rect_type = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremium_photo_rect_type);
         txtPricePremium_photo_border_type = FlashLabel.fromNative(_nativeObject.txtPricePremium_photo_border_type);
         txtPricePremium_photo_background_type = FlashLabel.fromNative(_nativeObject.txtPricePremium_photo_background_type);
         txtPricePremium_photo_filter_type = FlashLabel.fromNative(_nativeObject.txtPricePremium_photo_filter_type);
         txtPricePremium_photo_icon_type = FlashLabel.fromNative(_nativeObject.txtPricePremium_photo_icon_type);
         iconPremium_photo_icon_type = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremium_photo_icon_type);
         iconPremium_photo_border_type = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremium_photo_border_type);
         iconPremium_photo_background_type = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremium_photo_background_type);
         iconPremium_photo_filter_type = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremium_photo_filter_type);
         txtPricePremium_photo_sexuality_type = FlashLabel.fromNative(_nativeObject.txtPricePremium_photo_sexuality_type);
         iconPremium_photo_sexuality_type = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremium_photo_sexuality_type);
         txtPriceCoinsTotal = FlashLabel.fromNative(_nativeObject.txtPriceCoinsTotal);
         iconCoinsTotal = new SymbolIconGameCurrencyGeneric(_nativeObject.iconCoinsTotal);
         txtPricePremiumTotal = FlashLabel.fromNative(_nativeObject.txtPricePremiumTotal);
         iconPremiumTotal = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremiumTotal);
      }
      
      public function setNativeInstance(param1:SymbolCharacterConfiguratorPhotographer) : void
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
         FlashLabel.setNativeInstance(txtRect,_nativeObject.txtRect);
         if(_nativeObject.btnRightRect)
         {
            btnRightRect.setNativeInstance(_nativeObject.btnRightRect);
         }
         if(_nativeObject.btnLeftRect)
         {
            btnLeftRect.setNativeInstance(_nativeObject.btnLeftRect);
         }
         FlashLabel.setNativeInstance(txtBorder,_nativeObject.txtBorder);
         if(_nativeObject.btnRightBorder)
         {
            btnRightBorder.setNativeInstance(_nativeObject.btnRightBorder);
         }
         if(_nativeObject.btnLeftBorder)
         {
            btnLeftBorder.setNativeInstance(_nativeObject.btnLeftBorder);
         }
         FlashLabel.setNativeInstance(txtBackground,_nativeObject.txtBackground);
         if(_nativeObject.btnRightBackground)
         {
            btnRightBackground.setNativeInstance(_nativeObject.btnRightBackground);
         }
         if(_nativeObject.btnLeftBackground)
         {
            btnLeftBackground.setNativeInstance(_nativeObject.btnLeftBackground);
         }
         FlashLabel.setNativeInstance(txtFilter,_nativeObject.txtFilter);
         if(_nativeObject.btnRightFilter)
         {
            btnRightFilter.setNativeInstance(_nativeObject.btnRightFilter);
         }
         if(_nativeObject.btnLeftFilter)
         {
            btnLeftFilter.setNativeInstance(_nativeObject.btnLeftFilter);
         }
         FlashLabel.setNativeInstance(txtIcon,_nativeObject.txtIcon);
         if(_nativeObject.btnRightIcon)
         {
            btnRightIcon.setNativeInstance(_nativeObject.btnRightIcon);
         }
         if(_nativeObject.btnLeftIcon)
         {
            btnLeftIcon.setNativeInstance(_nativeObject.btnLeftIcon);
         }
         FlashLabel.setNativeInstance(txtSexuality,_nativeObject.txtSexuality);
         if(_nativeObject.btnRightSexuality)
         {
            btnRightSexuality.setNativeInstance(_nativeObject.btnRightSexuality);
         }
         if(_nativeObject.btnLeftSexuality)
         {
            btnLeftSexuality.setNativeInstance(_nativeObject.btnLeftSexuality);
         }
         FlashLabel.setNativeInstance(txtPriceCoins_photo_rect_type,_nativeObject.txtPriceCoins_photo_rect_type);
         if(_nativeObject.iconCoins_photo_rect_type)
         {
            iconCoins_photo_rect_type.setNativeInstance(_nativeObject.iconCoins_photo_rect_type);
         }
         FlashLabel.setNativeInstance(txtPriceCoins_photo_border_type,_nativeObject.txtPriceCoins_photo_border_type);
         FlashLabel.setNativeInstance(txtPriceCoins_photo_background_type,_nativeObject.txtPriceCoins_photo_background_type);
         FlashLabel.setNativeInstance(txtPriceCoins_photo_filter_type,_nativeObject.txtPriceCoins_photo_filter_type);
         FlashLabel.setNativeInstance(txtPriceCoins_photo_icon_type,_nativeObject.txtPriceCoins_photo_icon_type);
         if(_nativeObject.iconCoins_photo_icon_type)
         {
            iconCoins_photo_icon_type.setNativeInstance(_nativeObject.iconCoins_photo_icon_type);
         }
         if(_nativeObject.iconCoins_photo_border_type)
         {
            iconCoins_photo_border_type.setNativeInstance(_nativeObject.iconCoins_photo_border_type);
         }
         if(_nativeObject.iconCoins_photo_background_type)
         {
            iconCoins_photo_background_type.setNativeInstance(_nativeObject.iconCoins_photo_background_type);
         }
         if(_nativeObject.iconCoins_photo_filter_type)
         {
            iconCoins_photo_filter_type.setNativeInstance(_nativeObject.iconCoins_photo_filter_type);
         }
         FlashLabel.setNativeInstance(txtPriceCoins_photo_sexuality_type,_nativeObject.txtPriceCoins_photo_sexuality_type);
         if(_nativeObject.iconCoins_photo_sexuality_type)
         {
            iconCoins_photo_sexuality_type.setNativeInstance(_nativeObject.iconCoins_photo_sexuality_type);
         }
         FlashLabel.setNativeInstance(txtPricePremium_photo_rect_type,_nativeObject.txtPricePremium_photo_rect_type);
         if(_nativeObject.iconPremium_photo_rect_type)
         {
            iconPremium_photo_rect_type.setNativeInstance(_nativeObject.iconPremium_photo_rect_type);
         }
         FlashLabel.setNativeInstance(txtPricePremium_photo_border_type,_nativeObject.txtPricePremium_photo_border_type);
         FlashLabel.setNativeInstance(txtPricePremium_photo_background_type,_nativeObject.txtPricePremium_photo_background_type);
         FlashLabel.setNativeInstance(txtPricePremium_photo_filter_type,_nativeObject.txtPricePremium_photo_filter_type);
         FlashLabel.setNativeInstance(txtPricePremium_photo_icon_type,_nativeObject.txtPricePremium_photo_icon_type);
         if(_nativeObject.iconPremium_photo_icon_type)
         {
            iconPremium_photo_icon_type.setNativeInstance(_nativeObject.iconPremium_photo_icon_type);
         }
         if(_nativeObject.iconPremium_photo_border_type)
         {
            iconPremium_photo_border_type.setNativeInstance(_nativeObject.iconPremium_photo_border_type);
         }
         if(_nativeObject.iconPremium_photo_background_type)
         {
            iconPremium_photo_background_type.setNativeInstance(_nativeObject.iconPremium_photo_background_type);
         }
         if(_nativeObject.iconPremium_photo_filter_type)
         {
            iconPremium_photo_filter_type.setNativeInstance(_nativeObject.iconPremium_photo_filter_type);
         }
         FlashLabel.setNativeInstance(txtPricePremium_photo_sexuality_type,_nativeObject.txtPricePremium_photo_sexuality_type);
         if(_nativeObject.iconPremium_photo_sexuality_type)
         {
            iconPremium_photo_sexuality_type.setNativeInstance(_nativeObject.iconPremium_photo_sexuality_type);
         }
         FlashLabel.setNativeInstance(txtPriceCoinsTotal,_nativeObject.txtPriceCoinsTotal);
         if(_nativeObject.iconCoinsTotal)
         {
            iconCoinsTotal.setNativeInstance(_nativeObject.iconCoinsTotal);
         }
         FlashLabel.setNativeInstance(txtPricePremiumTotal,_nativeObject.txtPricePremiumTotal);
         if(_nativeObject.iconPremiumTotal)
         {
            iconPremiumTotal.setNativeInstance(_nativeObject.iconPremiumTotal);
         }
      }
   }
}
