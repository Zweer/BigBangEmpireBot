package visuals.ui.elements.avatar
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolUiCheckboxGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonPremiumGeneric;
   
   public class SymbolCharacterConfiguratorHideClothsGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolCharacterConfiguratorHideCloths = null;
      
      public var background:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var checkShowHead:SymbolUiCheckboxGeneric = null;
      
      public var txtShowHead:ILabelArea = null;
      
      public var btnUnlockHideTop:SymbolButtonPremiumGeneric = null;
      
      public var checkShowTop:SymbolUiCheckboxGeneric = null;
      
      public var txtShowTop:ILabelArea = null;
      
      public var btnUnlockHideBelt:SymbolButtonPremiumGeneric = null;
      
      public var checkShowBelt:SymbolUiCheckboxGeneric = null;
      
      public var txtShowBelt:ILabelArea = null;
      
      public var btnUnlockHideLegs:SymbolButtonPremiumGeneric = null;
      
      public var checkShowLegs:SymbolUiCheckboxGeneric = null;
      
      public var txtShowLegs:ILabelArea = null;
      
      public var btnUnlockHideBoots:SymbolButtonPremiumGeneric = null;
      
      public var checkShowBoots:SymbolUiCheckboxGeneric = null;
      
      public var txtShowBoots:ILabelArea = null;
      
      public function SymbolCharacterConfiguratorHideClothsGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolCharacterConfiguratorHideCloths;
         }
         else
         {
            _nativeObject = new SymbolCharacterConfiguratorHideCloths();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         background = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.background);
         checkShowHead = new SymbolUiCheckboxGeneric(_nativeObject.checkShowHead);
         txtShowHead = FlashLabelArea.fromNative(_nativeObject.txtShowHead);
         btnUnlockHideTop = new SymbolButtonPremiumGeneric(_nativeObject.btnUnlockHideTop);
         checkShowTop = new SymbolUiCheckboxGeneric(_nativeObject.checkShowTop);
         txtShowTop = FlashLabelArea.fromNative(_nativeObject.txtShowTop);
         btnUnlockHideBelt = new SymbolButtonPremiumGeneric(_nativeObject.btnUnlockHideBelt);
         checkShowBelt = new SymbolUiCheckboxGeneric(_nativeObject.checkShowBelt);
         txtShowBelt = FlashLabelArea.fromNative(_nativeObject.txtShowBelt);
         btnUnlockHideLegs = new SymbolButtonPremiumGeneric(_nativeObject.btnUnlockHideLegs);
         checkShowLegs = new SymbolUiCheckboxGeneric(_nativeObject.checkShowLegs);
         txtShowLegs = FlashLabelArea.fromNative(_nativeObject.txtShowLegs);
         btnUnlockHideBoots = new SymbolButtonPremiumGeneric(_nativeObject.btnUnlockHideBoots);
         checkShowBoots = new SymbolUiCheckboxGeneric(_nativeObject.checkShowBoots);
         txtShowBoots = FlashLabelArea.fromNative(_nativeObject.txtShowBoots);
      }
      
      public function setNativeInstance(param1:SymbolCharacterConfiguratorHideCloths) : void
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
         if(_nativeObject.checkShowHead)
         {
            checkShowHead.setNativeInstance(_nativeObject.checkShowHead);
         }
         FlashLabelArea.setNativeInstance(txtShowHead,_nativeObject.txtShowHead);
         if(_nativeObject.btnUnlockHideTop)
         {
            btnUnlockHideTop.setNativeInstance(_nativeObject.btnUnlockHideTop);
         }
         if(_nativeObject.checkShowTop)
         {
            checkShowTop.setNativeInstance(_nativeObject.checkShowTop);
         }
         FlashLabelArea.setNativeInstance(txtShowTop,_nativeObject.txtShowTop);
         if(_nativeObject.btnUnlockHideBelt)
         {
            btnUnlockHideBelt.setNativeInstance(_nativeObject.btnUnlockHideBelt);
         }
         if(_nativeObject.checkShowBelt)
         {
            checkShowBelt.setNativeInstance(_nativeObject.checkShowBelt);
         }
         FlashLabelArea.setNativeInstance(txtShowBelt,_nativeObject.txtShowBelt);
         if(_nativeObject.btnUnlockHideLegs)
         {
            btnUnlockHideLegs.setNativeInstance(_nativeObject.btnUnlockHideLegs);
         }
         if(_nativeObject.checkShowLegs)
         {
            checkShowLegs.setNativeInstance(_nativeObject.checkShowLegs);
         }
         FlashLabelArea.setNativeInstance(txtShowLegs,_nativeObject.txtShowLegs);
         if(_nativeObject.btnUnlockHideBoots)
         {
            btnUnlockHideBoots.setNativeInstance(_nativeObject.btnUnlockHideBoots);
         }
         if(_nativeObject.checkShowBoots)
         {
            checkShowBoots.setNativeInstance(_nativeObject.checkShowBoots);
         }
         FlashLabelArea.setNativeInstance(txtShowBoots,_nativeObject.txtShowBoots);
      }
   }
}
