package visuals.ui.elements.guild
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
   import visuals.ui.elements.buttons.SymbolButtonArrowLeftGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowRightGeneric;
   import visuals.ui.elements.buttons.SymbolButtonDecreaseGeneric;
   import visuals.ui.elements.buttons.SymbolButtonIncreaseGeneric;
   import visuals.ui.elements.icons.SymbolIconGameCurrencyGeneric;
   import visuals.ui.elements.icons.SymbolIconPremiumCurrencyGeneric;
   
   public class SymbolGuildEmblemContentGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolGuildEmblemContent = null;
      
      public var emblem:SymbolGuildEmblemGeneric = null;
      
      public var txtShapeSelection:ILabelArea = null;
      
      public var btnShapePrevious:SymbolButtonArrowLeftGeneric = null;
      
      public var btnShapeNext:SymbolButtonArrowRightGeneric = null;
      
      public var txtShapeCaption:ILabelArea = null;
      
      public var txtIconSelection:ILabelArea = null;
      
      public var btnIconPrevious:SymbolButtonArrowLeftGeneric = null;
      
      public var btnIconNext:SymbolButtonArrowRightGeneric = null;
      
      public var txtIconCaption:ILabelArea = null;
      
      public var txtSizeValue:ILabelArea = null;
      
      public var btnSizeDecrease:SymbolButtonDecreaseGeneric = null;
      
      public var btnSizeIncrease:SymbolButtonIncreaseGeneric = null;
      
      public var txtSizeCaption:ILabelArea = null;
      
      public var txtCostShapeCaption:ILabelArea = null;
      
      public var txtCostIconCaption:ILabelArea = null;
      
      public var iconShapeCoins:SymbolIconGameCurrencyGeneric = null;
      
      public var txtShapeCoins:ILabel = null;
      
      public var iconIconCoins:SymbolIconGameCurrencyGeneric = null;
      
      public var txtIconCoins:ILabel = null;
      
      public var iconShapePremiumCurrency:SymbolIconPremiumCurrencyGeneric = null;
      
      public var txtShapePremiumCurrency:ILabel = null;
      
      public var iconIconPremiumCurrency:SymbolIconPremiumCurrencyGeneric = null;
      
      public var txtIconPremiumCurrency:ILabel = null;
      
      public var btnChange:SymbolUiButtonDefaultGeneric = null;
      
      public var colorBoxShapeBackground:SymbolColorBoxGeneric = null;
      
      public var colorBoxShapeBorder:SymbolColorBoxGeneric = null;
      
      public var colorBoxIcon:SymbolColorBoxGeneric = null;
      
      public var txtColorCaption:ILabelArea = null;
      
      public var colorBoxPicker:SymbolColorBoxPickerGeneric = null;
      
      public function SymbolGuildEmblemContentGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolGuildEmblemContent;
         }
         else
         {
            _nativeObject = new SymbolGuildEmblemContent();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         emblem = new SymbolGuildEmblemGeneric(_nativeObject.emblem);
         txtShapeSelection = FlashLabelArea.fromNative(_nativeObject.txtShapeSelection);
         btnShapePrevious = new SymbolButtonArrowLeftGeneric(_nativeObject.btnShapePrevious);
         btnShapeNext = new SymbolButtonArrowRightGeneric(_nativeObject.btnShapeNext);
         txtShapeCaption = FlashLabelArea.fromNative(_nativeObject.txtShapeCaption);
         txtIconSelection = FlashLabelArea.fromNative(_nativeObject.txtIconSelection);
         btnIconPrevious = new SymbolButtonArrowLeftGeneric(_nativeObject.btnIconPrevious);
         btnIconNext = new SymbolButtonArrowRightGeneric(_nativeObject.btnIconNext);
         txtIconCaption = FlashLabelArea.fromNative(_nativeObject.txtIconCaption);
         txtSizeValue = FlashLabelArea.fromNative(_nativeObject.txtSizeValue);
         btnSizeDecrease = new SymbolButtonDecreaseGeneric(_nativeObject.btnSizeDecrease);
         btnSizeIncrease = new SymbolButtonIncreaseGeneric(_nativeObject.btnSizeIncrease);
         txtSizeCaption = FlashLabelArea.fromNative(_nativeObject.txtSizeCaption);
         txtCostShapeCaption = FlashLabelArea.fromNative(_nativeObject.txtCostShapeCaption);
         txtCostIconCaption = FlashLabelArea.fromNative(_nativeObject.txtCostIconCaption);
         iconShapeCoins = new SymbolIconGameCurrencyGeneric(_nativeObject.iconShapeCoins);
         txtShapeCoins = FlashLabel.fromNative(_nativeObject.txtShapeCoins);
         iconIconCoins = new SymbolIconGameCurrencyGeneric(_nativeObject.iconIconCoins);
         txtIconCoins = FlashLabel.fromNative(_nativeObject.txtIconCoins);
         iconShapePremiumCurrency = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconShapePremiumCurrency);
         txtShapePremiumCurrency = FlashLabel.fromNative(_nativeObject.txtShapePremiumCurrency);
         iconIconPremiumCurrency = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconIconPremiumCurrency);
         txtIconPremiumCurrency = FlashLabel.fromNative(_nativeObject.txtIconPremiumCurrency);
         btnChange = new SymbolUiButtonDefaultGeneric(_nativeObject.btnChange);
         colorBoxShapeBackground = new SymbolColorBoxGeneric(_nativeObject.colorBoxShapeBackground);
         colorBoxShapeBorder = new SymbolColorBoxGeneric(_nativeObject.colorBoxShapeBorder);
         colorBoxIcon = new SymbolColorBoxGeneric(_nativeObject.colorBoxIcon);
         txtColorCaption = FlashLabelArea.fromNative(_nativeObject.txtColorCaption);
         colorBoxPicker = new SymbolColorBoxPickerGeneric(_nativeObject.colorBoxPicker);
      }
      
      public function setNativeInstance(param1:SymbolGuildEmblemContent) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.emblem)
         {
            emblem.setNativeInstance(_nativeObject.emblem);
         }
         FlashLabelArea.setNativeInstance(txtShapeSelection,_nativeObject.txtShapeSelection);
         if(_nativeObject.btnShapePrevious)
         {
            btnShapePrevious.setNativeInstance(_nativeObject.btnShapePrevious);
         }
         if(_nativeObject.btnShapeNext)
         {
            btnShapeNext.setNativeInstance(_nativeObject.btnShapeNext);
         }
         FlashLabelArea.setNativeInstance(txtShapeCaption,_nativeObject.txtShapeCaption);
         FlashLabelArea.setNativeInstance(txtIconSelection,_nativeObject.txtIconSelection);
         if(_nativeObject.btnIconPrevious)
         {
            btnIconPrevious.setNativeInstance(_nativeObject.btnIconPrevious);
         }
         if(_nativeObject.btnIconNext)
         {
            btnIconNext.setNativeInstance(_nativeObject.btnIconNext);
         }
         FlashLabelArea.setNativeInstance(txtIconCaption,_nativeObject.txtIconCaption);
         FlashLabelArea.setNativeInstance(txtSizeValue,_nativeObject.txtSizeValue);
         if(_nativeObject.btnSizeDecrease)
         {
            btnSizeDecrease.setNativeInstance(_nativeObject.btnSizeDecrease);
         }
         if(_nativeObject.btnSizeIncrease)
         {
            btnSizeIncrease.setNativeInstance(_nativeObject.btnSizeIncrease);
         }
         FlashLabelArea.setNativeInstance(txtSizeCaption,_nativeObject.txtSizeCaption);
         FlashLabelArea.setNativeInstance(txtCostShapeCaption,_nativeObject.txtCostShapeCaption);
         FlashLabelArea.setNativeInstance(txtCostIconCaption,_nativeObject.txtCostIconCaption);
         if(_nativeObject.iconShapeCoins)
         {
            iconShapeCoins.setNativeInstance(_nativeObject.iconShapeCoins);
         }
         FlashLabel.setNativeInstance(txtShapeCoins,_nativeObject.txtShapeCoins);
         if(_nativeObject.iconIconCoins)
         {
            iconIconCoins.setNativeInstance(_nativeObject.iconIconCoins);
         }
         FlashLabel.setNativeInstance(txtIconCoins,_nativeObject.txtIconCoins);
         if(_nativeObject.iconShapePremiumCurrency)
         {
            iconShapePremiumCurrency.setNativeInstance(_nativeObject.iconShapePremiumCurrency);
         }
         FlashLabel.setNativeInstance(txtShapePremiumCurrency,_nativeObject.txtShapePremiumCurrency);
         if(_nativeObject.iconIconPremiumCurrency)
         {
            iconIconPremiumCurrency.setNativeInstance(_nativeObject.iconIconPremiumCurrency);
         }
         FlashLabel.setNativeInstance(txtIconPremiumCurrency,_nativeObject.txtIconPremiumCurrency);
         if(_nativeObject.btnChange)
         {
            btnChange.setNativeInstance(_nativeObject.btnChange);
         }
         if(_nativeObject.colorBoxShapeBackground)
         {
            colorBoxShapeBackground.setNativeInstance(_nativeObject.colorBoxShapeBackground);
         }
         if(_nativeObject.colorBoxShapeBorder)
         {
            colorBoxShapeBorder.setNativeInstance(_nativeObject.colorBoxShapeBorder);
         }
         if(_nativeObject.colorBoxIcon)
         {
            colorBoxIcon.setNativeInstance(_nativeObject.colorBoxIcon);
         }
         FlashLabelArea.setNativeInstance(txtColorCaption,_nativeObject.txtColorCaption);
         if(_nativeObject.colorBoxPicker)
         {
            colorBoxPicker.setNativeInstance(_nativeObject.colorBoxPicker);
         }
      }
   }
}
