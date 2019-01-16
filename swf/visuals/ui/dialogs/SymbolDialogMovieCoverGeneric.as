package visuals.ui.dialogs
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolUiButtonDefaultGeneric;
   import visuals.ui.elements.backgrounds.SymbolBackgroundScalableGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowLeftGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowRightGeneric;
   import visuals.ui.elements.buttons.SymbolButtonPremiumAndGameCurrencyGeneric;
   import visuals.ui.elements.generic.SymbolButtonRandomizeGeneric;
   import visuals.ui.elements.icons.SymbolIconGameCurrencyGeneric;
   import visuals.ui.elements.icons.SymbolIconPremiumCurrencyGeneric;
   import visuals.ui.elements.movie.SymbolCoverImagePlaceholderGeneric;
   
   public class SymbolDialogMovieCoverGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogMovieCover = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var symbolBackgroundScalable:SymbolBackgroundScalableGeneric = null;
      
      public var cover:SymbolCoverImagePlaceholderGeneric = null;
      
      public var btnContinue:SymbolButtonPremiumAndGameCurrencyGeneric = null;
      
      public var btnClose:SymbolUiButtonDefaultGeneric = null;
      
      public var btnRandomize:SymbolButtonRandomizeGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var txtInfo:ILabelArea = null;
      
      public var txtActor:ILabel = null;
      
      public var btnRightActor:SymbolButtonArrowRightGeneric = null;
      
      public var btnLeftActor:SymbolButtonArrowLeftGeneric = null;
      
      public var iconPremium_cover_actor_type:SymbolIconPremiumCurrencyGeneric = null;
      
      public var txtPricePremium_cover_actor_type:ILabel = null;
      
      public var iconCoins_cover_actor_type:SymbolIconGameCurrencyGeneric = null;
      
      public var txtPriceCoins_cover_actor_type:ILabel = null;
      
      public var txtLayout:ILabel = null;
      
      public var btnRightLayout:SymbolButtonArrowRightGeneric = null;
      
      public var btnLeftLayout:SymbolButtonArrowLeftGeneric = null;
      
      public var txtPricePremium_cover_layout_new_type:ILabel = null;
      
      public var iconPremium_cover_layout_new_type:SymbolIconPremiumCurrencyGeneric = null;
      
      public var txtPriceCoins_cover_layout_new_type:ILabel = null;
      
      public var iconCoins_cover_layout_new_type:SymbolIconGameCurrencyGeneric = null;
      
      public var txtFont:ILabel = null;
      
      public var btnRightFont:SymbolButtonArrowRightGeneric = null;
      
      public var btnLeftFont:SymbolButtonArrowLeftGeneric = null;
      
      public var txtPricePremium_cover_font_type:ILabel = null;
      
      public var iconPremium_cover_font_type:SymbolIconPremiumCurrencyGeneric = null;
      
      public var txtPriceCoins_cover_font_type:ILabel = null;
      
      public var iconCoins_cover_font_type:SymbolIconGameCurrencyGeneric = null;
      
      public var txtRect:ILabel = null;
      
      public var btnRightRect:SymbolButtonArrowRightGeneric = null;
      
      public var btnLeftRect:SymbolButtonArrowLeftGeneric = null;
      
      public var txtPricePremium_cover_rect_type:ILabel = null;
      
      public var iconPremium_cover_rect_type:SymbolIconPremiumCurrencyGeneric = null;
      
      public var txtPriceCoins_cover_rect_type:ILabel = null;
      
      public var iconCoins_cover_rect_type:SymbolIconGameCurrencyGeneric = null;
      
      public var txtBackground:ILabel = null;
      
      public var btnRightBackground:SymbolButtonArrowRightGeneric = null;
      
      public var btnLeftBackground:SymbolButtonArrowLeftGeneric = null;
      
      public var txtPricePremium_cover_background_type:ILabel = null;
      
      public var iconPremium_cover_background_type:SymbolIconPremiumCurrencyGeneric = null;
      
      public var txtPriceCoins_cover_background_type:ILabel = null;
      
      public var iconCoins_cover_background_type:SymbolIconGameCurrencyGeneric = null;
      
      public var txtBorder:ILabel = null;
      
      public var btnRightBorder:SymbolButtonArrowRightGeneric = null;
      
      public var btnLeftBorder:SymbolButtonArrowLeftGeneric = null;
      
      public var txtPriceCoins_cover_border_type:ILabel = null;
      
      public var iconCoins_cover_border_type:SymbolIconGameCurrencyGeneric = null;
      
      public var txtPricePremium_cover_border_type:ILabel = null;
      
      public var iconPremium_cover_border_type:SymbolIconPremiumCurrencyGeneric = null;
      
      public var txtFilter:ILabel = null;
      
      public var btnRightFilter:SymbolButtonArrowRightGeneric = null;
      
      public var btnLeftFilter:SymbolButtonArrowLeftGeneric = null;
      
      public var iconCoins_cover_filter_type:SymbolIconGameCurrencyGeneric = null;
      
      public var txtPriceCoins_cover_filter_type:ILabel = null;
      
      public var iconPremium_cover_filter_type:SymbolIconPremiumCurrencyGeneric = null;
      
      public var txtPricePremium_cover_filter_type:ILabel = null;
      
      public function SymbolDialogMovieCoverGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogMovieCover;
         }
         else
         {
            _nativeObject = new SymbolDialogMovieCover();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         symbolBackgroundScalable = new SymbolBackgroundScalableGeneric(_nativeObject.symbolBackgroundScalable);
         cover = new SymbolCoverImagePlaceholderGeneric(_nativeObject.cover);
         btnContinue = new SymbolButtonPremiumAndGameCurrencyGeneric(_nativeObject.btnContinue);
         btnClose = new SymbolUiButtonDefaultGeneric(_nativeObject.btnClose);
         btnRandomize = new SymbolButtonRandomizeGeneric(_nativeObject.btnRandomize);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         txtInfo = FlashLabelArea.fromNative(_nativeObject.txtInfo);
         txtActor = FlashLabel.fromNative(_nativeObject.txtActor);
         btnRightActor = new SymbolButtonArrowRightGeneric(_nativeObject.btnRightActor);
         btnLeftActor = new SymbolButtonArrowLeftGeneric(_nativeObject.btnLeftActor);
         iconPremium_cover_actor_type = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremium_cover_actor_type);
         txtPricePremium_cover_actor_type = FlashLabel.fromNative(_nativeObject.txtPricePremium_cover_actor_type);
         iconCoins_cover_actor_type = new SymbolIconGameCurrencyGeneric(_nativeObject.iconCoins_cover_actor_type);
         txtPriceCoins_cover_actor_type = FlashLabel.fromNative(_nativeObject.txtPriceCoins_cover_actor_type);
         txtLayout = FlashLabel.fromNative(_nativeObject.txtLayout);
         btnRightLayout = new SymbolButtonArrowRightGeneric(_nativeObject.btnRightLayout);
         btnLeftLayout = new SymbolButtonArrowLeftGeneric(_nativeObject.btnLeftLayout);
         txtPricePremium_cover_layout_new_type = FlashLabel.fromNative(_nativeObject.txtPricePremium_cover_layout_new_type);
         iconPremium_cover_layout_new_type = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremium_cover_layout_new_type);
         txtPriceCoins_cover_layout_new_type = FlashLabel.fromNative(_nativeObject.txtPriceCoins_cover_layout_new_type);
         iconCoins_cover_layout_new_type = new SymbolIconGameCurrencyGeneric(_nativeObject.iconCoins_cover_layout_new_type);
         txtFont = FlashLabel.fromNative(_nativeObject.txtFont);
         btnRightFont = new SymbolButtonArrowRightGeneric(_nativeObject.btnRightFont);
         btnLeftFont = new SymbolButtonArrowLeftGeneric(_nativeObject.btnLeftFont);
         txtPricePremium_cover_font_type = FlashLabel.fromNative(_nativeObject.txtPricePremium_cover_font_type);
         iconPremium_cover_font_type = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremium_cover_font_type);
         txtPriceCoins_cover_font_type = FlashLabel.fromNative(_nativeObject.txtPriceCoins_cover_font_type);
         iconCoins_cover_font_type = new SymbolIconGameCurrencyGeneric(_nativeObject.iconCoins_cover_font_type);
         txtRect = FlashLabel.fromNative(_nativeObject.txtRect);
         btnRightRect = new SymbolButtonArrowRightGeneric(_nativeObject.btnRightRect);
         btnLeftRect = new SymbolButtonArrowLeftGeneric(_nativeObject.btnLeftRect);
         txtPricePremium_cover_rect_type = FlashLabel.fromNative(_nativeObject.txtPricePremium_cover_rect_type);
         iconPremium_cover_rect_type = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremium_cover_rect_type);
         txtPriceCoins_cover_rect_type = FlashLabel.fromNative(_nativeObject.txtPriceCoins_cover_rect_type);
         iconCoins_cover_rect_type = new SymbolIconGameCurrencyGeneric(_nativeObject.iconCoins_cover_rect_type);
         txtBackground = FlashLabel.fromNative(_nativeObject.txtBackground);
         btnRightBackground = new SymbolButtonArrowRightGeneric(_nativeObject.btnRightBackground);
         btnLeftBackground = new SymbolButtonArrowLeftGeneric(_nativeObject.btnLeftBackground);
         txtPricePremium_cover_background_type = FlashLabel.fromNative(_nativeObject.txtPricePremium_cover_background_type);
         iconPremium_cover_background_type = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremium_cover_background_type);
         txtPriceCoins_cover_background_type = FlashLabel.fromNative(_nativeObject.txtPriceCoins_cover_background_type);
         iconCoins_cover_background_type = new SymbolIconGameCurrencyGeneric(_nativeObject.iconCoins_cover_background_type);
         txtBorder = FlashLabel.fromNative(_nativeObject.txtBorder);
         btnRightBorder = new SymbolButtonArrowRightGeneric(_nativeObject.btnRightBorder);
         btnLeftBorder = new SymbolButtonArrowLeftGeneric(_nativeObject.btnLeftBorder);
         txtPriceCoins_cover_border_type = FlashLabel.fromNative(_nativeObject.txtPriceCoins_cover_border_type);
         iconCoins_cover_border_type = new SymbolIconGameCurrencyGeneric(_nativeObject.iconCoins_cover_border_type);
         txtPricePremium_cover_border_type = FlashLabel.fromNative(_nativeObject.txtPricePremium_cover_border_type);
         iconPremium_cover_border_type = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremium_cover_border_type);
         txtFilter = FlashLabel.fromNative(_nativeObject.txtFilter);
         btnRightFilter = new SymbolButtonArrowRightGeneric(_nativeObject.btnRightFilter);
         btnLeftFilter = new SymbolButtonArrowLeftGeneric(_nativeObject.btnLeftFilter);
         iconCoins_cover_filter_type = new SymbolIconGameCurrencyGeneric(_nativeObject.iconCoins_cover_filter_type);
         txtPriceCoins_cover_filter_type = FlashLabel.fromNative(_nativeObject.txtPriceCoins_cover_filter_type);
         iconPremium_cover_filter_type = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremium_cover_filter_type);
         txtPricePremium_cover_filter_type = FlashLabel.fromNative(_nativeObject.txtPricePremium_cover_filter_type);
      }
      
      public function setNativeInstance(param1:SymbolDialogMovieCover) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.dialogBackground)
         {
            dialogBackground.setNativeInstance(_nativeObject.dialogBackground);
         }
         if(_nativeObject.symbolBackgroundScalable)
         {
            symbolBackgroundScalable.setNativeInstance(_nativeObject.symbolBackgroundScalable);
         }
         if(_nativeObject.cover)
         {
            cover.setNativeInstance(_nativeObject.cover);
         }
         if(_nativeObject.btnContinue)
         {
            btnContinue.setNativeInstance(_nativeObject.btnContinue);
         }
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         if(_nativeObject.btnRandomize)
         {
            btnRandomize.setNativeInstance(_nativeObject.btnRandomize);
         }
         FlashLabel.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         FlashLabelArea.setNativeInstance(txtInfo,_nativeObject.txtInfo);
         FlashLabel.setNativeInstance(txtActor,_nativeObject.txtActor);
         if(_nativeObject.btnRightActor)
         {
            btnRightActor.setNativeInstance(_nativeObject.btnRightActor);
         }
         if(_nativeObject.btnLeftActor)
         {
            btnLeftActor.setNativeInstance(_nativeObject.btnLeftActor);
         }
         if(_nativeObject.iconPremium_cover_actor_type)
         {
            iconPremium_cover_actor_type.setNativeInstance(_nativeObject.iconPremium_cover_actor_type);
         }
         FlashLabel.setNativeInstance(txtPricePremium_cover_actor_type,_nativeObject.txtPricePremium_cover_actor_type);
         if(_nativeObject.iconCoins_cover_actor_type)
         {
            iconCoins_cover_actor_type.setNativeInstance(_nativeObject.iconCoins_cover_actor_type);
         }
         FlashLabel.setNativeInstance(txtPriceCoins_cover_actor_type,_nativeObject.txtPriceCoins_cover_actor_type);
         FlashLabel.setNativeInstance(txtLayout,_nativeObject.txtLayout);
         if(_nativeObject.btnRightLayout)
         {
            btnRightLayout.setNativeInstance(_nativeObject.btnRightLayout);
         }
         if(_nativeObject.btnLeftLayout)
         {
            btnLeftLayout.setNativeInstance(_nativeObject.btnLeftLayout);
         }
         FlashLabel.setNativeInstance(txtPricePremium_cover_layout_new_type,_nativeObject.txtPricePremium_cover_layout_new_type);
         if(_nativeObject.iconPremium_cover_layout_new_type)
         {
            iconPremium_cover_layout_new_type.setNativeInstance(_nativeObject.iconPremium_cover_layout_new_type);
         }
         FlashLabel.setNativeInstance(txtPriceCoins_cover_layout_new_type,_nativeObject.txtPriceCoins_cover_layout_new_type);
         if(_nativeObject.iconCoins_cover_layout_new_type)
         {
            iconCoins_cover_layout_new_type.setNativeInstance(_nativeObject.iconCoins_cover_layout_new_type);
         }
         FlashLabel.setNativeInstance(txtFont,_nativeObject.txtFont);
         if(_nativeObject.btnRightFont)
         {
            btnRightFont.setNativeInstance(_nativeObject.btnRightFont);
         }
         if(_nativeObject.btnLeftFont)
         {
            btnLeftFont.setNativeInstance(_nativeObject.btnLeftFont);
         }
         FlashLabel.setNativeInstance(txtPricePremium_cover_font_type,_nativeObject.txtPricePremium_cover_font_type);
         if(_nativeObject.iconPremium_cover_font_type)
         {
            iconPremium_cover_font_type.setNativeInstance(_nativeObject.iconPremium_cover_font_type);
         }
         FlashLabel.setNativeInstance(txtPriceCoins_cover_font_type,_nativeObject.txtPriceCoins_cover_font_type);
         if(_nativeObject.iconCoins_cover_font_type)
         {
            iconCoins_cover_font_type.setNativeInstance(_nativeObject.iconCoins_cover_font_type);
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
         FlashLabel.setNativeInstance(txtPricePremium_cover_rect_type,_nativeObject.txtPricePremium_cover_rect_type);
         if(_nativeObject.iconPremium_cover_rect_type)
         {
            iconPremium_cover_rect_type.setNativeInstance(_nativeObject.iconPremium_cover_rect_type);
         }
         FlashLabel.setNativeInstance(txtPriceCoins_cover_rect_type,_nativeObject.txtPriceCoins_cover_rect_type);
         if(_nativeObject.iconCoins_cover_rect_type)
         {
            iconCoins_cover_rect_type.setNativeInstance(_nativeObject.iconCoins_cover_rect_type);
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
         FlashLabel.setNativeInstance(txtPricePremium_cover_background_type,_nativeObject.txtPricePremium_cover_background_type);
         if(_nativeObject.iconPremium_cover_background_type)
         {
            iconPremium_cover_background_type.setNativeInstance(_nativeObject.iconPremium_cover_background_type);
         }
         FlashLabel.setNativeInstance(txtPriceCoins_cover_background_type,_nativeObject.txtPriceCoins_cover_background_type);
         if(_nativeObject.iconCoins_cover_background_type)
         {
            iconCoins_cover_background_type.setNativeInstance(_nativeObject.iconCoins_cover_background_type);
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
         FlashLabel.setNativeInstance(txtPriceCoins_cover_border_type,_nativeObject.txtPriceCoins_cover_border_type);
         if(_nativeObject.iconCoins_cover_border_type)
         {
            iconCoins_cover_border_type.setNativeInstance(_nativeObject.iconCoins_cover_border_type);
         }
         FlashLabel.setNativeInstance(txtPricePremium_cover_border_type,_nativeObject.txtPricePremium_cover_border_type);
         if(_nativeObject.iconPremium_cover_border_type)
         {
            iconPremium_cover_border_type.setNativeInstance(_nativeObject.iconPremium_cover_border_type);
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
         if(_nativeObject.iconCoins_cover_filter_type)
         {
            iconCoins_cover_filter_type.setNativeInstance(_nativeObject.iconCoins_cover_filter_type);
         }
         FlashLabel.setNativeInstance(txtPriceCoins_cover_filter_type,_nativeObject.txtPriceCoins_cover_filter_type);
         if(_nativeObject.iconPremium_cover_filter_type)
         {
            iconPremium_cover_filter_type.setNativeInstance(_nativeObject.iconPremium_cover_filter_type);
         }
         FlashLabel.setNativeInstance(txtPricePremium_cover_filter_type,_nativeObject.txtPricePremium_cover_filter_type);
      }
   }
}
