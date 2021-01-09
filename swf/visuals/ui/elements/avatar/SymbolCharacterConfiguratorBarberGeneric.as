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
   import visuals.ui.elements.guild.SymbolColorBoxGeneric;
   import visuals.ui.elements.guild.SymbolColorBoxPickerGeneric;
   import visuals.ui.elements.icons.SymbolIconGameCurrencyGeneric;
   import visuals.ui.elements.icons.SymbolIconPremiumCurrencyGeneric;
   
   public class SymbolCharacterConfiguratorBarberGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolCharacterConfiguratorBarber = null;
      
      public var bg:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var txtPriceCoinsTotal:ILabel = null;
      
      public var iconCoinsTotal:SymbolIconGameCurrencyGeneric = null;
      
      public var txtPricePremiumTotal:ILabel = null;
      
      public var iconPremiumTotal:SymbolIconPremiumCurrencyGeneric = null;
      
      public var iconCoins_facial_hair_type:SymbolIconGameCurrencyGeneric = null;
      
      public var iconPremium_facial_hair_type:SymbolIconPremiumCurrencyGeneric = null;
      
      public var txtPriceCoins_facial_hair_type:ILabel = null;
      
      public var txtPricePremium_facial_hair_type:ILabel = null;
      
      public var btnRightFacialHair:SymbolButtonArrowRightGeneric = null;
      
      public var btnLeftFacialHair:SymbolButtonArrowLeftGeneric = null;
      
      public var txtFacialHair:ILabel = null;
      
      public var txtPriceCoins_facial_hair_color:ILabel = null;
      
      public var txtPricePremium_facial_hair_color:ILabel = null;
      
      public var iconCoins_facial_hair_color:SymbolIconGameCurrencyGeneric = null;
      
      public var iconPremium_facial_hair_color:SymbolIconPremiumCurrencyGeneric = null;
      
      public var colorBoxFacialHair:SymbolColorBoxGeneric = null;
      
      public var colorBoxPickerFacialHair:SymbolColorBoxPickerGeneric = null;
      
      public var txtPricePremium_decoration_type:ILabel = null;
      
      public var iconPremium_decoration_type:SymbolIconPremiumCurrencyGeneric = null;
      
      public var iconCoins_decoration_type:SymbolIconGameCurrencyGeneric = null;
      
      public var txtPriceCoins_decoration_type:ILabel = null;
      
      public var txtDecoration:ILabel = null;
      
      public var btnRightDecoration:SymbolButtonArrowRightGeneric = null;
      
      public var btnLeftDecoration:SymbolButtonArrowLeftGeneric = null;
      
      public var iconCoins_eyebrows_type:SymbolIconGameCurrencyGeneric = null;
      
      public var iconPremium_eyebrows_type:SymbolIconPremiumCurrencyGeneric = null;
      
      public var txtPriceCoins_eyebrows_type:ILabel = null;
      
      public var txtPricePremium_eyebrows_type:ILabel = null;
      
      public var txtEyebrows:ILabel = null;
      
      public var btnRightEyebrows:SymbolButtonArrowRightGeneric = null;
      
      public var btnLeftEyebrows:SymbolButtonArrowLeftGeneric = null;
      
      public var txtPriceCoins_eyebrows_color:ILabel = null;
      
      public var txtPricePremium_eyebrows_color:ILabel = null;
      
      public var iconCoins_eyebrows_color:SymbolIconGameCurrencyGeneric = null;
      
      public var iconPremium_eyebrows_color:SymbolIconPremiumCurrencyGeneric = null;
      
      public var colorBoxEyebrows:SymbolColorBoxGeneric = null;
      
      public var colorBoxPickerEyebrows:SymbolColorBoxPickerGeneric = null;
      
      public var iconCoins_hair_type:SymbolIconGameCurrencyGeneric = null;
      
      public var iconPremium_hair_type:SymbolIconPremiumCurrencyGeneric = null;
      
      public var txtPriceCoins_hair_type:ILabel = null;
      
      public var txtPricePremium_hair_type:ILabel = null;
      
      public var txtHair:ILabel = null;
      
      public var btnRightHair:SymbolButtonArrowRightGeneric = null;
      
      public var btnLeftHair:SymbolButtonArrowLeftGeneric = null;
      
      public var txtPriceCoins_hair_color:ILabel = null;
      
      public var txtPricePremium_hair_color:ILabel = null;
      
      public var iconCoins_hair_color:SymbolIconGameCurrencyGeneric = null;
      
      public var iconPremium_hair_color:SymbolIconPremiumCurrencyGeneric = null;
      
      public var colorBoxHair:SymbolColorBoxGeneric = null;
      
      public var colorBoxPickerHair:SymbolColorBoxPickerGeneric = null;
      
      public function SymbolCharacterConfiguratorBarberGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolCharacterConfiguratorBarber;
         }
         else
         {
            _nativeObject = new SymbolCharacterConfiguratorBarber();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         bg = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.bg);
         txtPriceCoinsTotal = FlashLabel.fromNative(_nativeObject.txtPriceCoinsTotal);
         iconCoinsTotal = new SymbolIconGameCurrencyGeneric(_nativeObject.iconCoinsTotal);
         txtPricePremiumTotal = FlashLabel.fromNative(_nativeObject.txtPricePremiumTotal);
         iconPremiumTotal = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremiumTotal);
         iconCoins_facial_hair_type = new SymbolIconGameCurrencyGeneric(_nativeObject.iconCoins_facial_hair_type);
         iconPremium_facial_hair_type = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremium_facial_hair_type);
         txtPriceCoins_facial_hair_type = FlashLabel.fromNative(_nativeObject.txtPriceCoins_facial_hair_type);
         txtPricePremium_facial_hair_type = FlashLabel.fromNative(_nativeObject.txtPricePremium_facial_hair_type);
         btnRightFacialHair = new SymbolButtonArrowRightGeneric(_nativeObject.btnRightFacialHair);
         btnLeftFacialHair = new SymbolButtonArrowLeftGeneric(_nativeObject.btnLeftFacialHair);
         txtFacialHair = FlashLabel.fromNative(_nativeObject.txtFacialHair);
         txtPriceCoins_facial_hair_color = FlashLabel.fromNative(_nativeObject.txtPriceCoins_facial_hair_color);
         txtPricePremium_facial_hair_color = FlashLabel.fromNative(_nativeObject.txtPricePremium_facial_hair_color);
         iconCoins_facial_hair_color = new SymbolIconGameCurrencyGeneric(_nativeObject.iconCoins_facial_hair_color);
         iconPremium_facial_hair_color = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremium_facial_hair_color);
         colorBoxFacialHair = new SymbolColorBoxGeneric(_nativeObject.colorBoxFacialHair);
         colorBoxPickerFacialHair = new SymbolColorBoxPickerGeneric(_nativeObject.colorBoxPickerFacialHair);
         txtPricePremium_decoration_type = FlashLabel.fromNative(_nativeObject.txtPricePremium_decoration_type);
         iconPremium_decoration_type = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremium_decoration_type);
         iconCoins_decoration_type = new SymbolIconGameCurrencyGeneric(_nativeObject.iconCoins_decoration_type);
         txtPriceCoins_decoration_type = FlashLabel.fromNative(_nativeObject.txtPriceCoins_decoration_type);
         txtDecoration = FlashLabel.fromNative(_nativeObject.txtDecoration);
         btnRightDecoration = new SymbolButtonArrowRightGeneric(_nativeObject.btnRightDecoration);
         btnLeftDecoration = new SymbolButtonArrowLeftGeneric(_nativeObject.btnLeftDecoration);
         iconCoins_eyebrows_type = new SymbolIconGameCurrencyGeneric(_nativeObject.iconCoins_eyebrows_type);
         iconPremium_eyebrows_type = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremium_eyebrows_type);
         txtPriceCoins_eyebrows_type = FlashLabel.fromNative(_nativeObject.txtPriceCoins_eyebrows_type);
         txtPricePremium_eyebrows_type = FlashLabel.fromNative(_nativeObject.txtPricePremium_eyebrows_type);
         txtEyebrows = FlashLabel.fromNative(_nativeObject.txtEyebrows);
         btnRightEyebrows = new SymbolButtonArrowRightGeneric(_nativeObject.btnRightEyebrows);
         btnLeftEyebrows = new SymbolButtonArrowLeftGeneric(_nativeObject.btnLeftEyebrows);
         txtPriceCoins_eyebrows_color = FlashLabel.fromNative(_nativeObject.txtPriceCoins_eyebrows_color);
         txtPricePremium_eyebrows_color = FlashLabel.fromNative(_nativeObject.txtPricePremium_eyebrows_color);
         iconCoins_eyebrows_color = new SymbolIconGameCurrencyGeneric(_nativeObject.iconCoins_eyebrows_color);
         iconPremium_eyebrows_color = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremium_eyebrows_color);
         colorBoxEyebrows = new SymbolColorBoxGeneric(_nativeObject.colorBoxEyebrows);
         colorBoxPickerEyebrows = new SymbolColorBoxPickerGeneric(_nativeObject.colorBoxPickerEyebrows);
         iconCoins_hair_type = new SymbolIconGameCurrencyGeneric(_nativeObject.iconCoins_hair_type);
         iconPremium_hair_type = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremium_hair_type);
         txtPriceCoins_hair_type = FlashLabel.fromNative(_nativeObject.txtPriceCoins_hair_type);
         txtPricePremium_hair_type = FlashLabel.fromNative(_nativeObject.txtPricePremium_hair_type);
         txtHair = FlashLabel.fromNative(_nativeObject.txtHair);
         btnRightHair = new SymbolButtonArrowRightGeneric(_nativeObject.btnRightHair);
         btnLeftHair = new SymbolButtonArrowLeftGeneric(_nativeObject.btnLeftHair);
         txtPriceCoins_hair_color = FlashLabel.fromNative(_nativeObject.txtPriceCoins_hair_color);
         txtPricePremium_hair_color = FlashLabel.fromNative(_nativeObject.txtPricePremium_hair_color);
         iconCoins_hair_color = new SymbolIconGameCurrencyGeneric(_nativeObject.iconCoins_hair_color);
         iconPremium_hair_color = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremium_hair_color);
         colorBoxHair = new SymbolColorBoxGeneric(_nativeObject.colorBoxHair);
         colorBoxPickerHair = new SymbolColorBoxPickerGeneric(_nativeObject.colorBoxPickerHair);
      }
      
      public function setNativeInstance(param1:SymbolCharacterConfiguratorBarber) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.bg)
         {
            bg.setNativeInstance(_nativeObject.bg);
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
         if(_nativeObject.iconCoins_facial_hair_type)
         {
            iconCoins_facial_hair_type.setNativeInstance(_nativeObject.iconCoins_facial_hair_type);
         }
         if(_nativeObject.iconPremium_facial_hair_type)
         {
            iconPremium_facial_hair_type.setNativeInstance(_nativeObject.iconPremium_facial_hair_type);
         }
         FlashLabel.setNativeInstance(txtPriceCoins_facial_hair_type,_nativeObject.txtPriceCoins_facial_hair_type);
         FlashLabel.setNativeInstance(txtPricePremium_facial_hair_type,_nativeObject.txtPricePremium_facial_hair_type);
         if(_nativeObject.btnRightFacialHair)
         {
            btnRightFacialHair.setNativeInstance(_nativeObject.btnRightFacialHair);
         }
         if(_nativeObject.btnLeftFacialHair)
         {
            btnLeftFacialHair.setNativeInstance(_nativeObject.btnLeftFacialHair);
         }
         FlashLabel.setNativeInstance(txtFacialHair,_nativeObject.txtFacialHair);
         FlashLabel.setNativeInstance(txtPriceCoins_facial_hair_color,_nativeObject.txtPriceCoins_facial_hair_color);
         FlashLabel.setNativeInstance(txtPricePremium_facial_hair_color,_nativeObject.txtPricePremium_facial_hair_color);
         if(_nativeObject.iconCoins_facial_hair_color)
         {
            iconCoins_facial_hair_color.setNativeInstance(_nativeObject.iconCoins_facial_hair_color);
         }
         if(_nativeObject.iconPremium_facial_hair_color)
         {
            iconPremium_facial_hair_color.setNativeInstance(_nativeObject.iconPremium_facial_hair_color);
         }
         if(_nativeObject.colorBoxFacialHair)
         {
            colorBoxFacialHair.setNativeInstance(_nativeObject.colorBoxFacialHair);
         }
         if(_nativeObject.colorBoxPickerFacialHair)
         {
            colorBoxPickerFacialHair.setNativeInstance(_nativeObject.colorBoxPickerFacialHair);
         }
         FlashLabel.setNativeInstance(txtPricePremium_decoration_type,_nativeObject.txtPricePremium_decoration_type);
         if(_nativeObject.iconPremium_decoration_type)
         {
            iconPremium_decoration_type.setNativeInstance(_nativeObject.iconPremium_decoration_type);
         }
         if(_nativeObject.iconCoins_decoration_type)
         {
            iconCoins_decoration_type.setNativeInstance(_nativeObject.iconCoins_decoration_type);
         }
         FlashLabel.setNativeInstance(txtPriceCoins_decoration_type,_nativeObject.txtPriceCoins_decoration_type);
         FlashLabel.setNativeInstance(txtDecoration,_nativeObject.txtDecoration);
         if(_nativeObject.btnRightDecoration)
         {
            btnRightDecoration.setNativeInstance(_nativeObject.btnRightDecoration);
         }
         if(_nativeObject.btnLeftDecoration)
         {
            btnLeftDecoration.setNativeInstance(_nativeObject.btnLeftDecoration);
         }
         if(_nativeObject.iconCoins_eyebrows_type)
         {
            iconCoins_eyebrows_type.setNativeInstance(_nativeObject.iconCoins_eyebrows_type);
         }
         if(_nativeObject.iconPremium_eyebrows_type)
         {
            iconPremium_eyebrows_type.setNativeInstance(_nativeObject.iconPremium_eyebrows_type);
         }
         FlashLabel.setNativeInstance(txtPriceCoins_eyebrows_type,_nativeObject.txtPriceCoins_eyebrows_type);
         FlashLabel.setNativeInstance(txtPricePremium_eyebrows_type,_nativeObject.txtPricePremium_eyebrows_type);
         FlashLabel.setNativeInstance(txtEyebrows,_nativeObject.txtEyebrows);
         if(_nativeObject.btnRightEyebrows)
         {
            btnRightEyebrows.setNativeInstance(_nativeObject.btnRightEyebrows);
         }
         if(_nativeObject.btnLeftEyebrows)
         {
            btnLeftEyebrows.setNativeInstance(_nativeObject.btnLeftEyebrows);
         }
         FlashLabel.setNativeInstance(txtPriceCoins_eyebrows_color,_nativeObject.txtPriceCoins_eyebrows_color);
         FlashLabel.setNativeInstance(txtPricePremium_eyebrows_color,_nativeObject.txtPricePremium_eyebrows_color);
         if(_nativeObject.iconCoins_eyebrows_color)
         {
            iconCoins_eyebrows_color.setNativeInstance(_nativeObject.iconCoins_eyebrows_color);
         }
         if(_nativeObject.iconPremium_eyebrows_color)
         {
            iconPremium_eyebrows_color.setNativeInstance(_nativeObject.iconPremium_eyebrows_color);
         }
         if(_nativeObject.colorBoxEyebrows)
         {
            colorBoxEyebrows.setNativeInstance(_nativeObject.colorBoxEyebrows);
         }
         if(_nativeObject.colorBoxPickerEyebrows)
         {
            colorBoxPickerEyebrows.setNativeInstance(_nativeObject.colorBoxPickerEyebrows);
         }
         if(_nativeObject.iconCoins_hair_type)
         {
            iconCoins_hair_type.setNativeInstance(_nativeObject.iconCoins_hair_type);
         }
         if(_nativeObject.iconPremium_hair_type)
         {
            iconPremium_hair_type.setNativeInstance(_nativeObject.iconPremium_hair_type);
         }
         FlashLabel.setNativeInstance(txtPriceCoins_hair_type,_nativeObject.txtPriceCoins_hair_type);
         FlashLabel.setNativeInstance(txtPricePremium_hair_type,_nativeObject.txtPricePremium_hair_type);
         FlashLabel.setNativeInstance(txtHair,_nativeObject.txtHair);
         if(_nativeObject.btnRightHair)
         {
            btnRightHair.setNativeInstance(_nativeObject.btnRightHair);
         }
         if(_nativeObject.btnLeftHair)
         {
            btnLeftHair.setNativeInstance(_nativeObject.btnLeftHair);
         }
         FlashLabel.setNativeInstance(txtPriceCoins_hair_color,_nativeObject.txtPriceCoins_hair_color);
         FlashLabel.setNativeInstance(txtPricePremium_hair_color,_nativeObject.txtPricePremium_hair_color);
         if(_nativeObject.iconCoins_hair_color)
         {
            iconCoins_hair_color.setNativeInstance(_nativeObject.iconCoins_hair_color);
         }
         if(_nativeObject.iconPremium_hair_color)
         {
            iconPremium_hair_color.setNativeInstance(_nativeObject.iconPremium_hair_color);
         }
         if(_nativeObject.colorBoxHair)
         {
            colorBoxHair.setNativeInstance(_nativeObject.colorBoxHair);
         }
         if(_nativeObject.colorBoxPickerHair)
         {
            colorBoxPickerHair.setNativeInstance(_nativeObject.colorBoxPickerHair);
         }
      }
   }
}
