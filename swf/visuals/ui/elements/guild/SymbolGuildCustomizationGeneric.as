package visuals.ui.elements.guild
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.elements.backgrounds.SymbolBackgroundScalableGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowLeftGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowRightGeneric;
   import visuals.ui.elements.buttons.SymbolButtonSimplePremiumAndGameCurrencyGeneric;
   import visuals.ui.elements.goal.SymbolButtonCancelGeneric;
   import visuals.ui.elements.icons.SymbolIconGameCurrencyGeneric;
   import visuals.ui.elements.icons.SymbolIconPremiumCurrencyGeneric;
   
   public class SymbolGuildCustomizationGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolGuildCustomization = null;
      
      public var background:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var btnCustomize:SymbolButtonSimplePremiumAndGameCurrencyGeneric = null;
      
      public var btnCancel:SymbolButtonCancelGeneric = null;
      
      public var symbolBackgroundScalable:SymbolBackgroundScalableGeneric = null;
      
      public var txtCurrentPremiumCaption:ILabel = null;
      
      public var txtCurrentPremium:ILabel = null;
      
      public var symbolIconPremiumCurrency:SymbolIconPremiumCurrencyGeneric = null;
      
      public var symbolIconGameCurrency:SymbolIconGameCurrencyGeneric = null;
      
      public var txtCurrentGameCurrency:ILabel = null;
      
      public var txtPriceFreeRoom:ILabel = null;
      
      public var txtRoom:ILabel = null;
      
      public var btnLeftRoom:SymbolButtonArrowLeftGeneric = null;
      
      public var txtPriceRoom:ILabel = null;
      
      public var iconPremiumRoom:SymbolIconPremiumCurrencyGeneric = null;
      
      public var btnRightRoom:SymbolButtonArrowRightGeneric = null;
      
      public var bubbleNewRoom:SymbolStudioCustomizationNewBubbleGeneric = null;
      
      public var iconGameCurrencyRoom:SymbolIconGameCurrencyGeneric = null;
      
      public var txtPriceFreeQuarter:ILabel = null;
      
      public var txtQuarter:ILabel = null;
      
      public var btnLeftQuarter:SymbolButtonArrowLeftGeneric = null;
      
      public var txtPriceQuarter:ILabel = null;
      
      public var iconPremiumQuarter:SymbolIconPremiumCurrencyGeneric = null;
      
      public var btnRightQuarter:SymbolButtonArrowRightGeneric = null;
      
      public var bubbleNewQuarter:SymbolStudioCustomizationNewBubbleGeneric = null;
      
      public var iconGameCurrencyQuarter:SymbolIconGameCurrencyGeneric = null;
      
      public var txtPriceFreePopularity:ILabel = null;
      
      public var txtPopularity:ILabel = null;
      
      public var btnLeftPopularity:SymbolButtonArrowLeftGeneric = null;
      
      public var txtPricePopularity:ILabel = null;
      
      public var iconPremiumPopularity:SymbolIconPremiumCurrencyGeneric = null;
      
      public var btnRightPopularity:SymbolButtonArrowRightGeneric = null;
      
      public var bubbleNewPopularity:SymbolStudioCustomizationNewBubbleGeneric = null;
      
      public var iconGameCurrencyPopularity:SymbolIconGameCurrencyGeneric = null;
      
      public var txtPriceFreeMotivation:ILabel = null;
      
      public var txtMotivation:ILabel = null;
      
      public var btnLeftMotivation:SymbolButtonArrowLeftGeneric = null;
      
      public var txtPriceMotivation:ILabel = null;
      
      public var iconPremiumMotivation:SymbolIconPremiumCurrencyGeneric = null;
      
      public var btnRightMotivation:SymbolButtonArrowRightGeneric = null;
      
      public var bubbleNewMotivation:SymbolStudioCustomizationNewBubbleGeneric = null;
      
      public var iconGameCurrencyMotivation:SymbolIconGameCurrencyGeneric = null;
      
      public var txtPriceFreeEquipment:ILabel = null;
      
      public var txtEquipment:ILabel = null;
      
      public var btnLeftEquipment:SymbolButtonArrowLeftGeneric = null;
      
      public var txtPriceEquipment:ILabel = null;
      
      public var iconPremiumEquipment:SymbolIconPremiumCurrencyGeneric = null;
      
      public var btnRightEquipment:SymbolButtonArrowRightGeneric = null;
      
      public var bubbleNewEquipment:SymbolStudioCustomizationNewBubbleGeneric = null;
      
      public var iconGameCurrencyEquipment:SymbolIconGameCurrencyGeneric = null;
      
      public var txtPriceFreeActorsLeft:ILabel = null;
      
      public var txtActorsLeft:ILabel = null;
      
      public var btnLeftActorsLeft:SymbolButtonArrowLeftGeneric = null;
      
      public var txtPriceActorsLeft:ILabel = null;
      
      public var iconPremiumActorsLeft:SymbolIconPremiumCurrencyGeneric = null;
      
      public var btnRightActorsLeft:SymbolButtonArrowRightGeneric = null;
      
      public var bubbleNewActorsLeft:SymbolStudioCustomizationNewBubbleGeneric = null;
      
      public var iconGameCurrencyActorsLeft:SymbolIconGameCurrencyGeneric = null;
      
      public var txtPriceFreeActorsRight:ILabel = null;
      
      public var txtActorsRight:ILabel = null;
      
      public var btnLeftActorsRight:SymbolButtonArrowLeftGeneric = null;
      
      public var txtPriceActorsRight:ILabel = null;
      
      public var iconPremiumActorsRight:SymbolIconPremiumCurrencyGeneric = null;
      
      public var btnRightActorsRight:SymbolButtonArrowRightGeneric = null;
      
      public var bubbleNewActorsRight:SymbolStudioCustomizationNewBubbleGeneric = null;
      
      public var iconGameCurrencyActorsRight:SymbolIconGameCurrencyGeneric = null;
      
      public var txtPricePremiumTotal:ILabel = null;
      
      public var iconPremiumTotal:SymbolIconPremiumCurrencyGeneric = null;
      
      public var iconGameCurrencyTotal:SymbolIconGameCurrencyGeneric = null;
      
      public var txtPriceGameCurrencyTotal:ILabel = null;
      
      public function SymbolGuildCustomizationGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolGuildCustomization;
         }
         else
         {
            _nativeObject = new SymbolGuildCustomization();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         background = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.background);
         btnCustomize = new SymbolButtonSimplePremiumAndGameCurrencyGeneric(_nativeObject.btnCustomize);
         btnCancel = new SymbolButtonCancelGeneric(_nativeObject.btnCancel);
         symbolBackgroundScalable = new SymbolBackgroundScalableGeneric(_nativeObject.symbolBackgroundScalable);
         txtCurrentPremiumCaption = FlashLabel.fromNative(_nativeObject.txtCurrentPremiumCaption);
         txtCurrentPremium = FlashLabel.fromNative(_nativeObject.txtCurrentPremium);
         symbolIconPremiumCurrency = new SymbolIconPremiumCurrencyGeneric(_nativeObject.symbolIconPremiumCurrency);
         symbolIconGameCurrency = new SymbolIconGameCurrencyGeneric(_nativeObject.symbolIconGameCurrency);
         txtCurrentGameCurrency = FlashLabel.fromNative(_nativeObject.txtCurrentGameCurrency);
         txtPriceFreeRoom = FlashLabel.fromNative(_nativeObject.txtPriceFreeRoom);
         txtRoom = FlashLabel.fromNative(_nativeObject.txtRoom);
         btnLeftRoom = new SymbolButtonArrowLeftGeneric(_nativeObject.btnLeftRoom);
         txtPriceRoom = FlashLabel.fromNative(_nativeObject.txtPriceRoom);
         iconPremiumRoom = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremiumRoom);
         btnRightRoom = new SymbolButtonArrowRightGeneric(_nativeObject.btnRightRoom);
         bubbleNewRoom = new SymbolStudioCustomizationNewBubbleGeneric(_nativeObject.bubbleNewRoom);
         iconGameCurrencyRoom = new SymbolIconGameCurrencyGeneric(_nativeObject.iconGameCurrencyRoom);
         txtPriceFreeQuarter = FlashLabel.fromNative(_nativeObject.txtPriceFreeQuarter);
         txtQuarter = FlashLabel.fromNative(_nativeObject.txtQuarter);
         btnLeftQuarter = new SymbolButtonArrowLeftGeneric(_nativeObject.btnLeftQuarter);
         txtPriceQuarter = FlashLabel.fromNative(_nativeObject.txtPriceQuarter);
         iconPremiumQuarter = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremiumQuarter);
         btnRightQuarter = new SymbolButtonArrowRightGeneric(_nativeObject.btnRightQuarter);
         bubbleNewQuarter = new SymbolStudioCustomizationNewBubbleGeneric(_nativeObject.bubbleNewQuarter);
         iconGameCurrencyQuarter = new SymbolIconGameCurrencyGeneric(_nativeObject.iconGameCurrencyQuarter);
         txtPriceFreePopularity = FlashLabel.fromNative(_nativeObject.txtPriceFreePopularity);
         txtPopularity = FlashLabel.fromNative(_nativeObject.txtPopularity);
         btnLeftPopularity = new SymbolButtonArrowLeftGeneric(_nativeObject.btnLeftPopularity);
         txtPricePopularity = FlashLabel.fromNative(_nativeObject.txtPricePopularity);
         iconPremiumPopularity = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremiumPopularity);
         btnRightPopularity = new SymbolButtonArrowRightGeneric(_nativeObject.btnRightPopularity);
         bubbleNewPopularity = new SymbolStudioCustomizationNewBubbleGeneric(_nativeObject.bubbleNewPopularity);
         iconGameCurrencyPopularity = new SymbolIconGameCurrencyGeneric(_nativeObject.iconGameCurrencyPopularity);
         txtPriceFreeMotivation = FlashLabel.fromNative(_nativeObject.txtPriceFreeMotivation);
         txtMotivation = FlashLabel.fromNative(_nativeObject.txtMotivation);
         btnLeftMotivation = new SymbolButtonArrowLeftGeneric(_nativeObject.btnLeftMotivation);
         txtPriceMotivation = FlashLabel.fromNative(_nativeObject.txtPriceMotivation);
         iconPremiumMotivation = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremiumMotivation);
         btnRightMotivation = new SymbolButtonArrowRightGeneric(_nativeObject.btnRightMotivation);
         bubbleNewMotivation = new SymbolStudioCustomizationNewBubbleGeneric(_nativeObject.bubbleNewMotivation);
         iconGameCurrencyMotivation = new SymbolIconGameCurrencyGeneric(_nativeObject.iconGameCurrencyMotivation);
         txtPriceFreeEquipment = FlashLabel.fromNative(_nativeObject.txtPriceFreeEquipment);
         txtEquipment = FlashLabel.fromNative(_nativeObject.txtEquipment);
         btnLeftEquipment = new SymbolButtonArrowLeftGeneric(_nativeObject.btnLeftEquipment);
         txtPriceEquipment = FlashLabel.fromNative(_nativeObject.txtPriceEquipment);
         iconPremiumEquipment = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremiumEquipment);
         btnRightEquipment = new SymbolButtonArrowRightGeneric(_nativeObject.btnRightEquipment);
         bubbleNewEquipment = new SymbolStudioCustomizationNewBubbleGeneric(_nativeObject.bubbleNewEquipment);
         iconGameCurrencyEquipment = new SymbolIconGameCurrencyGeneric(_nativeObject.iconGameCurrencyEquipment);
         txtPriceFreeActorsLeft = FlashLabel.fromNative(_nativeObject.txtPriceFreeActorsLeft);
         txtActorsLeft = FlashLabel.fromNative(_nativeObject.txtActorsLeft);
         btnLeftActorsLeft = new SymbolButtonArrowLeftGeneric(_nativeObject.btnLeftActorsLeft);
         txtPriceActorsLeft = FlashLabel.fromNative(_nativeObject.txtPriceActorsLeft);
         iconPremiumActorsLeft = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremiumActorsLeft);
         btnRightActorsLeft = new SymbolButtonArrowRightGeneric(_nativeObject.btnRightActorsLeft);
         bubbleNewActorsLeft = new SymbolStudioCustomizationNewBubbleGeneric(_nativeObject.bubbleNewActorsLeft);
         iconGameCurrencyActorsLeft = new SymbolIconGameCurrencyGeneric(_nativeObject.iconGameCurrencyActorsLeft);
         txtPriceFreeActorsRight = FlashLabel.fromNative(_nativeObject.txtPriceFreeActorsRight);
         txtActorsRight = FlashLabel.fromNative(_nativeObject.txtActorsRight);
         btnLeftActorsRight = new SymbolButtonArrowLeftGeneric(_nativeObject.btnLeftActorsRight);
         txtPriceActorsRight = FlashLabel.fromNative(_nativeObject.txtPriceActorsRight);
         iconPremiumActorsRight = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremiumActorsRight);
         btnRightActorsRight = new SymbolButtonArrowRightGeneric(_nativeObject.btnRightActorsRight);
         bubbleNewActorsRight = new SymbolStudioCustomizationNewBubbleGeneric(_nativeObject.bubbleNewActorsRight);
         iconGameCurrencyActorsRight = new SymbolIconGameCurrencyGeneric(_nativeObject.iconGameCurrencyActorsRight);
         txtPricePremiumTotal = FlashLabel.fromNative(_nativeObject.txtPricePremiumTotal);
         iconPremiumTotal = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremiumTotal);
         iconGameCurrencyTotal = new SymbolIconGameCurrencyGeneric(_nativeObject.iconGameCurrencyTotal);
         txtPriceGameCurrencyTotal = FlashLabel.fromNative(_nativeObject.txtPriceGameCurrencyTotal);
      }
      
      public function setNativeInstance(param1:SymbolGuildCustomization) : void
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
         if(_nativeObject.btnCustomize)
         {
            btnCustomize.setNativeInstance(_nativeObject.btnCustomize);
         }
         if(_nativeObject.btnCancel)
         {
            btnCancel.setNativeInstance(_nativeObject.btnCancel);
         }
         if(_nativeObject.symbolBackgroundScalable)
         {
            symbolBackgroundScalable.setNativeInstance(_nativeObject.symbolBackgroundScalable);
         }
         FlashLabel.setNativeInstance(txtCurrentPremiumCaption,_nativeObject.txtCurrentPremiumCaption);
         FlashLabel.setNativeInstance(txtCurrentPremium,_nativeObject.txtCurrentPremium);
         if(_nativeObject.symbolIconPremiumCurrency)
         {
            symbolIconPremiumCurrency.setNativeInstance(_nativeObject.symbolIconPremiumCurrency);
         }
         if(_nativeObject.symbolIconGameCurrency)
         {
            symbolIconGameCurrency.setNativeInstance(_nativeObject.symbolIconGameCurrency);
         }
         FlashLabel.setNativeInstance(txtCurrentGameCurrency,_nativeObject.txtCurrentGameCurrency);
         FlashLabel.setNativeInstance(txtPriceFreeRoom,_nativeObject.txtPriceFreeRoom);
         FlashLabel.setNativeInstance(txtRoom,_nativeObject.txtRoom);
         if(_nativeObject.btnLeftRoom)
         {
            btnLeftRoom.setNativeInstance(_nativeObject.btnLeftRoom);
         }
         FlashLabel.setNativeInstance(txtPriceRoom,_nativeObject.txtPriceRoom);
         if(_nativeObject.iconPremiumRoom)
         {
            iconPremiumRoom.setNativeInstance(_nativeObject.iconPremiumRoom);
         }
         if(_nativeObject.btnRightRoom)
         {
            btnRightRoom.setNativeInstance(_nativeObject.btnRightRoom);
         }
         if(_nativeObject.bubbleNewRoom)
         {
            bubbleNewRoom.setNativeInstance(_nativeObject.bubbleNewRoom);
         }
         if(_nativeObject.iconGameCurrencyRoom)
         {
            iconGameCurrencyRoom.setNativeInstance(_nativeObject.iconGameCurrencyRoom);
         }
         FlashLabel.setNativeInstance(txtPriceFreeQuarter,_nativeObject.txtPriceFreeQuarter);
         FlashLabel.setNativeInstance(txtQuarter,_nativeObject.txtQuarter);
         if(_nativeObject.btnLeftQuarter)
         {
            btnLeftQuarter.setNativeInstance(_nativeObject.btnLeftQuarter);
         }
         FlashLabel.setNativeInstance(txtPriceQuarter,_nativeObject.txtPriceQuarter);
         if(_nativeObject.iconPremiumQuarter)
         {
            iconPremiumQuarter.setNativeInstance(_nativeObject.iconPremiumQuarter);
         }
         if(_nativeObject.btnRightQuarter)
         {
            btnRightQuarter.setNativeInstance(_nativeObject.btnRightQuarter);
         }
         if(_nativeObject.bubbleNewQuarter)
         {
            bubbleNewQuarter.setNativeInstance(_nativeObject.bubbleNewQuarter);
         }
         if(_nativeObject.iconGameCurrencyQuarter)
         {
            iconGameCurrencyQuarter.setNativeInstance(_nativeObject.iconGameCurrencyQuarter);
         }
         FlashLabel.setNativeInstance(txtPriceFreePopularity,_nativeObject.txtPriceFreePopularity);
         FlashLabel.setNativeInstance(txtPopularity,_nativeObject.txtPopularity);
         if(_nativeObject.btnLeftPopularity)
         {
            btnLeftPopularity.setNativeInstance(_nativeObject.btnLeftPopularity);
         }
         FlashLabel.setNativeInstance(txtPricePopularity,_nativeObject.txtPricePopularity);
         if(_nativeObject.iconPremiumPopularity)
         {
            iconPremiumPopularity.setNativeInstance(_nativeObject.iconPremiumPopularity);
         }
         if(_nativeObject.btnRightPopularity)
         {
            btnRightPopularity.setNativeInstance(_nativeObject.btnRightPopularity);
         }
         if(_nativeObject.bubbleNewPopularity)
         {
            bubbleNewPopularity.setNativeInstance(_nativeObject.bubbleNewPopularity);
         }
         if(_nativeObject.iconGameCurrencyPopularity)
         {
            iconGameCurrencyPopularity.setNativeInstance(_nativeObject.iconGameCurrencyPopularity);
         }
         FlashLabel.setNativeInstance(txtPriceFreeMotivation,_nativeObject.txtPriceFreeMotivation);
         FlashLabel.setNativeInstance(txtMotivation,_nativeObject.txtMotivation);
         if(_nativeObject.btnLeftMotivation)
         {
            btnLeftMotivation.setNativeInstance(_nativeObject.btnLeftMotivation);
         }
         FlashLabel.setNativeInstance(txtPriceMotivation,_nativeObject.txtPriceMotivation);
         if(_nativeObject.iconPremiumMotivation)
         {
            iconPremiumMotivation.setNativeInstance(_nativeObject.iconPremiumMotivation);
         }
         if(_nativeObject.btnRightMotivation)
         {
            btnRightMotivation.setNativeInstance(_nativeObject.btnRightMotivation);
         }
         if(_nativeObject.bubbleNewMotivation)
         {
            bubbleNewMotivation.setNativeInstance(_nativeObject.bubbleNewMotivation);
         }
         if(_nativeObject.iconGameCurrencyMotivation)
         {
            iconGameCurrencyMotivation.setNativeInstance(_nativeObject.iconGameCurrencyMotivation);
         }
         FlashLabel.setNativeInstance(txtPriceFreeEquipment,_nativeObject.txtPriceFreeEquipment);
         FlashLabel.setNativeInstance(txtEquipment,_nativeObject.txtEquipment);
         if(_nativeObject.btnLeftEquipment)
         {
            btnLeftEquipment.setNativeInstance(_nativeObject.btnLeftEquipment);
         }
         FlashLabel.setNativeInstance(txtPriceEquipment,_nativeObject.txtPriceEquipment);
         if(_nativeObject.iconPremiumEquipment)
         {
            iconPremiumEquipment.setNativeInstance(_nativeObject.iconPremiumEquipment);
         }
         if(_nativeObject.btnRightEquipment)
         {
            btnRightEquipment.setNativeInstance(_nativeObject.btnRightEquipment);
         }
         if(_nativeObject.bubbleNewEquipment)
         {
            bubbleNewEquipment.setNativeInstance(_nativeObject.bubbleNewEquipment);
         }
         if(_nativeObject.iconGameCurrencyEquipment)
         {
            iconGameCurrencyEquipment.setNativeInstance(_nativeObject.iconGameCurrencyEquipment);
         }
         FlashLabel.setNativeInstance(txtPriceFreeActorsLeft,_nativeObject.txtPriceFreeActorsLeft);
         FlashLabel.setNativeInstance(txtActorsLeft,_nativeObject.txtActorsLeft);
         if(_nativeObject.btnLeftActorsLeft)
         {
            btnLeftActorsLeft.setNativeInstance(_nativeObject.btnLeftActorsLeft);
         }
         FlashLabel.setNativeInstance(txtPriceActorsLeft,_nativeObject.txtPriceActorsLeft);
         if(_nativeObject.iconPremiumActorsLeft)
         {
            iconPremiumActorsLeft.setNativeInstance(_nativeObject.iconPremiumActorsLeft);
         }
         if(_nativeObject.btnRightActorsLeft)
         {
            btnRightActorsLeft.setNativeInstance(_nativeObject.btnRightActorsLeft);
         }
         if(_nativeObject.bubbleNewActorsLeft)
         {
            bubbleNewActorsLeft.setNativeInstance(_nativeObject.bubbleNewActorsLeft);
         }
         if(_nativeObject.iconGameCurrencyActorsLeft)
         {
            iconGameCurrencyActorsLeft.setNativeInstance(_nativeObject.iconGameCurrencyActorsLeft);
         }
         FlashLabel.setNativeInstance(txtPriceFreeActorsRight,_nativeObject.txtPriceFreeActorsRight);
         FlashLabel.setNativeInstance(txtActorsRight,_nativeObject.txtActorsRight);
         if(_nativeObject.btnLeftActorsRight)
         {
            btnLeftActorsRight.setNativeInstance(_nativeObject.btnLeftActorsRight);
         }
         FlashLabel.setNativeInstance(txtPriceActorsRight,_nativeObject.txtPriceActorsRight);
         if(_nativeObject.iconPremiumActorsRight)
         {
            iconPremiumActorsRight.setNativeInstance(_nativeObject.iconPremiumActorsRight);
         }
         if(_nativeObject.btnRightActorsRight)
         {
            btnRightActorsRight.setNativeInstance(_nativeObject.btnRightActorsRight);
         }
         if(_nativeObject.bubbleNewActorsRight)
         {
            bubbleNewActorsRight.setNativeInstance(_nativeObject.bubbleNewActorsRight);
         }
         if(_nativeObject.iconGameCurrencyActorsRight)
         {
            iconGameCurrencyActorsRight.setNativeInstance(_nativeObject.iconGameCurrencyActorsRight);
         }
         FlashLabel.setNativeInstance(txtPricePremiumTotal,_nativeObject.txtPricePremiumTotal);
         if(_nativeObject.iconPremiumTotal)
         {
            iconPremiumTotal.setNativeInstance(_nativeObject.iconPremiumTotal);
         }
         if(_nativeObject.iconGameCurrencyTotal)
         {
            iconGameCurrencyTotal.setNativeInstance(_nativeObject.iconGameCurrencyTotal);
         }
         FlashLabel.setNativeInstance(txtPriceGameCurrencyTotal,_nativeObject.txtPriceGameCurrencyTotal);
      }
   }
}
