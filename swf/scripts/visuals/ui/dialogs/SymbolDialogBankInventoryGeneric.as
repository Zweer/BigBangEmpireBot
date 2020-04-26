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
   import visuals.ui.base.SymbolDummyGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonBankSellAllGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.buttons.SymbolButtonNarrowTabGeneric;
   import visuals.ui.elements.buttons.SymbolButtonPremiumGeneric;
   import visuals.ui.elements.icons.SymbolIconLockBigGeneric;
   import visuals.ui.elements.item.SymbolBankItemSlotGeneric;
   import visuals.ui.elements.item.SymbolItemSlotGeneric;
   import visuals.ui.elements.shop.SymbolShopSellAreaGeneric;
   
   public class SymbolDialogBankInventoryGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogBankInventory = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var btnTabBag1:SymbolButtonNarrowTabGeneric = null;
      
      public var btnTabBag2:SymbolButtonNarrowTabGeneric = null;
      
      public var btnTabBag3:SymbolButtonNarrowTabGeneric = null;
      
      public var btnTabBank2:SymbolButtonNarrowTabGeneric = null;
      
      public var btnTabBank3:SymbolButtonNarrowTabGeneric = null;
      
      public var btnTabBank4:SymbolButtonNarrowTabGeneric = null;
      
      public var btnTabBank5:SymbolButtonNarrowTabGeneric = null;
      
      public var btnTabBank6:SymbolButtonNarrowTabGeneric = null;
      
      public var btnTabBank9:SymbolButtonNarrowTabGeneric = null;
      
      public var btnTabBank10:SymbolButtonNarrowTabGeneric = null;
      
      public var btnTabBank11:SymbolButtonNarrowTabGeneric = null;
      
      public var btnTabBank12:SymbolButtonNarrowTabGeneric = null;
      
      public var btnTabBank13:SymbolButtonNarrowTabGeneric = null;
      
      public var btnTabBank16:SymbolButtonNarrowTabGeneric = null;
      
      public var btnTabBank17:SymbolButtonNarrowTabGeneric = null;
      
      public var btnTabBank18:SymbolButtonNarrowTabGeneric = null;
      
      public var btnTabBank19:SymbolButtonNarrowTabGeneric = null;
      
      public var btnTabBank20:SymbolButtonNarrowTabGeneric = null;
      
      public var btnTabBank1:SymbolButtonNarrowTabGeneric = null;
      
      public var btnTabBank8:SymbolButtonNarrowTabGeneric = null;
      
      public var btnTabBank15:SymbolButtonNarrowTabGeneric = null;
      
      public var btnTabBank7:SymbolButtonNarrowTabGeneric = null;
      
      public var btnTabBank14:SymbolButtonNarrowTabGeneric = null;
      
      public var btnTabBank21:SymbolButtonNarrowTabGeneric = null;
      
      public var inventorySlot1:SymbolItemSlotGeneric = null;
      
      public var inventorySlot2:SymbolItemSlotGeneric = null;
      
      public var inventorySlot3:SymbolItemSlotGeneric = null;
      
      public var inventorySlot4:SymbolItemSlotGeneric = null;
      
      public var inventorySlot5:SymbolItemSlotGeneric = null;
      
      public var inventorySlot6:SymbolItemSlotGeneric = null;
      
      public var inventorySlot7:SymbolItemSlotGeneric = null;
      
      public var inventorySlot8:SymbolItemSlotGeneric = null;
      
      public var inventorySlot9:SymbolItemSlotGeneric = null;
      
      public var inventorySlot10:SymbolItemSlotGeneric = null;
      
      public var inventorySlot11:SymbolItemSlotGeneric = null;
      
      public var inventorySlot12:SymbolItemSlotGeneric = null;
      
      public var inventorySlot13:SymbolItemSlotGeneric = null;
      
      public var inventorySlot14:SymbolItemSlotGeneric = null;
      
      public var inventorySlot15:SymbolItemSlotGeneric = null;
      
      public var inventorySlot16:SymbolItemSlotGeneric = null;
      
      public var inventorySlot17:SymbolItemSlotGeneric = null;
      
      public var inventorySlot18:SymbolItemSlotGeneric = null;
      
      public var bankSlot2:SymbolBankItemSlotGeneric = null;
      
      public var bankSlot7:SymbolBankItemSlotGeneric = null;
      
      public var bankSlot8:SymbolBankItemSlotGeneric = null;
      
      public var bankSlot13:SymbolBankItemSlotGeneric = null;
      
      public var bankSlot14:SymbolBankItemSlotGeneric = null;
      
      public var bankSlot3:SymbolBankItemSlotGeneric = null;
      
      public var bankSlot4:SymbolBankItemSlotGeneric = null;
      
      public var bankSlot9:SymbolBankItemSlotGeneric = null;
      
      public var bankSlot10:SymbolBankItemSlotGeneric = null;
      
      public var bankSlot15:SymbolBankItemSlotGeneric = null;
      
      public var bankSlot16:SymbolBankItemSlotGeneric = null;
      
      public var bankSlot5:SymbolBankItemSlotGeneric = null;
      
      public var bankSlot6:SymbolBankItemSlotGeneric = null;
      
      public var bankSlot11:SymbolBankItemSlotGeneric = null;
      
      public var bankSlot12:SymbolBankItemSlotGeneric = null;
      
      public var bankSlot17:SymbolBankItemSlotGeneric = null;
      
      public var bankSlot18:SymbolBankItemSlotGeneric = null;
      
      public var bankSlot1:SymbolBankItemSlotGeneric = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public var sellArea:SymbolShopSellAreaGeneric = null;
      
      public var btnSellAll:SymbolButtonBankSellAllGeneric = null;
      
      public var btnUpgrade:SymbolButtonPremiumGeneric = null;
      
      public var iconLock:SymbolIconLockBigGeneric = null;
      
      public var txtInfo:ILabelArea = null;
      
      public var dragLayer:SymbolDummyGeneric = null;
      
      public function SymbolDialogBankInventoryGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogBankInventory;
         }
         else
         {
            _nativeObject = new SymbolDialogBankInventory();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         btnTabBag1 = new SymbolButtonNarrowTabGeneric(_nativeObject.btnTabBag1);
         btnTabBag2 = new SymbolButtonNarrowTabGeneric(_nativeObject.btnTabBag2);
         btnTabBag3 = new SymbolButtonNarrowTabGeneric(_nativeObject.btnTabBag3);
         btnTabBank2 = new SymbolButtonNarrowTabGeneric(_nativeObject.btnTabBank2);
         btnTabBank3 = new SymbolButtonNarrowTabGeneric(_nativeObject.btnTabBank3);
         btnTabBank4 = new SymbolButtonNarrowTabGeneric(_nativeObject.btnTabBank4);
         btnTabBank5 = new SymbolButtonNarrowTabGeneric(_nativeObject.btnTabBank5);
         btnTabBank6 = new SymbolButtonNarrowTabGeneric(_nativeObject.btnTabBank6);
         btnTabBank9 = new SymbolButtonNarrowTabGeneric(_nativeObject.btnTabBank9);
         btnTabBank10 = new SymbolButtonNarrowTabGeneric(_nativeObject.btnTabBank10);
         btnTabBank11 = new SymbolButtonNarrowTabGeneric(_nativeObject.btnTabBank11);
         btnTabBank12 = new SymbolButtonNarrowTabGeneric(_nativeObject.btnTabBank12);
         btnTabBank13 = new SymbolButtonNarrowTabGeneric(_nativeObject.btnTabBank13);
         btnTabBank16 = new SymbolButtonNarrowTabGeneric(_nativeObject.btnTabBank16);
         btnTabBank17 = new SymbolButtonNarrowTabGeneric(_nativeObject.btnTabBank17);
         btnTabBank18 = new SymbolButtonNarrowTabGeneric(_nativeObject.btnTabBank18);
         btnTabBank19 = new SymbolButtonNarrowTabGeneric(_nativeObject.btnTabBank19);
         btnTabBank20 = new SymbolButtonNarrowTabGeneric(_nativeObject.btnTabBank20);
         btnTabBank1 = new SymbolButtonNarrowTabGeneric(_nativeObject.btnTabBank1);
         btnTabBank8 = new SymbolButtonNarrowTabGeneric(_nativeObject.btnTabBank8);
         btnTabBank15 = new SymbolButtonNarrowTabGeneric(_nativeObject.btnTabBank15);
         btnTabBank7 = new SymbolButtonNarrowTabGeneric(_nativeObject.btnTabBank7);
         btnTabBank14 = new SymbolButtonNarrowTabGeneric(_nativeObject.btnTabBank14);
         btnTabBank21 = new SymbolButtonNarrowTabGeneric(_nativeObject.btnTabBank21);
         inventorySlot1 = new SymbolItemSlotGeneric(_nativeObject.inventorySlot1);
         inventorySlot2 = new SymbolItemSlotGeneric(_nativeObject.inventorySlot2);
         inventorySlot3 = new SymbolItemSlotGeneric(_nativeObject.inventorySlot3);
         inventorySlot4 = new SymbolItemSlotGeneric(_nativeObject.inventorySlot4);
         inventorySlot5 = new SymbolItemSlotGeneric(_nativeObject.inventorySlot5);
         inventorySlot6 = new SymbolItemSlotGeneric(_nativeObject.inventorySlot6);
         inventorySlot7 = new SymbolItemSlotGeneric(_nativeObject.inventorySlot7);
         inventorySlot8 = new SymbolItemSlotGeneric(_nativeObject.inventorySlot8);
         inventorySlot9 = new SymbolItemSlotGeneric(_nativeObject.inventorySlot9);
         inventorySlot10 = new SymbolItemSlotGeneric(_nativeObject.inventorySlot10);
         inventorySlot11 = new SymbolItemSlotGeneric(_nativeObject.inventorySlot11);
         inventorySlot12 = new SymbolItemSlotGeneric(_nativeObject.inventorySlot12);
         inventorySlot13 = new SymbolItemSlotGeneric(_nativeObject.inventorySlot13);
         inventorySlot14 = new SymbolItemSlotGeneric(_nativeObject.inventorySlot14);
         inventorySlot15 = new SymbolItemSlotGeneric(_nativeObject.inventorySlot15);
         inventorySlot16 = new SymbolItemSlotGeneric(_nativeObject.inventorySlot16);
         inventorySlot17 = new SymbolItemSlotGeneric(_nativeObject.inventorySlot17);
         inventorySlot18 = new SymbolItemSlotGeneric(_nativeObject.inventorySlot18);
         bankSlot2 = new SymbolBankItemSlotGeneric(_nativeObject.bankSlot2);
         bankSlot7 = new SymbolBankItemSlotGeneric(_nativeObject.bankSlot7);
         bankSlot8 = new SymbolBankItemSlotGeneric(_nativeObject.bankSlot8);
         bankSlot13 = new SymbolBankItemSlotGeneric(_nativeObject.bankSlot13);
         bankSlot14 = new SymbolBankItemSlotGeneric(_nativeObject.bankSlot14);
         bankSlot3 = new SymbolBankItemSlotGeneric(_nativeObject.bankSlot3);
         bankSlot4 = new SymbolBankItemSlotGeneric(_nativeObject.bankSlot4);
         bankSlot9 = new SymbolBankItemSlotGeneric(_nativeObject.bankSlot9);
         bankSlot10 = new SymbolBankItemSlotGeneric(_nativeObject.bankSlot10);
         bankSlot15 = new SymbolBankItemSlotGeneric(_nativeObject.bankSlot15);
         bankSlot16 = new SymbolBankItemSlotGeneric(_nativeObject.bankSlot16);
         bankSlot5 = new SymbolBankItemSlotGeneric(_nativeObject.bankSlot5);
         bankSlot6 = new SymbolBankItemSlotGeneric(_nativeObject.bankSlot6);
         bankSlot11 = new SymbolBankItemSlotGeneric(_nativeObject.bankSlot11);
         bankSlot12 = new SymbolBankItemSlotGeneric(_nativeObject.bankSlot12);
         bankSlot17 = new SymbolBankItemSlotGeneric(_nativeObject.bankSlot17);
         bankSlot18 = new SymbolBankItemSlotGeneric(_nativeObject.bankSlot18);
         bankSlot1 = new SymbolBankItemSlotGeneric(_nativeObject.bankSlot1);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
         sellArea = new SymbolShopSellAreaGeneric(_nativeObject.sellArea);
         btnSellAll = new SymbolButtonBankSellAllGeneric(_nativeObject.btnSellAll);
         btnUpgrade = new SymbolButtonPremiumGeneric(_nativeObject.btnUpgrade);
         iconLock = new SymbolIconLockBigGeneric(_nativeObject.iconLock);
         txtInfo = FlashLabelArea.fromNative(_nativeObject.txtInfo);
         dragLayer = new SymbolDummyGeneric(_nativeObject.dragLayer);
      }
      
      public function setNativeInstance(param1:SymbolDialogBankInventory) : void
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
         FlashLabel.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         if(_nativeObject.btnTabBag1)
         {
            btnTabBag1.setNativeInstance(_nativeObject.btnTabBag1);
         }
         if(_nativeObject.btnTabBag2)
         {
            btnTabBag2.setNativeInstance(_nativeObject.btnTabBag2);
         }
         if(_nativeObject.btnTabBag3)
         {
            btnTabBag3.setNativeInstance(_nativeObject.btnTabBag3);
         }
         if(_nativeObject.btnTabBank2)
         {
            btnTabBank2.setNativeInstance(_nativeObject.btnTabBank2);
         }
         if(_nativeObject.btnTabBank3)
         {
            btnTabBank3.setNativeInstance(_nativeObject.btnTabBank3);
         }
         if(_nativeObject.btnTabBank4)
         {
            btnTabBank4.setNativeInstance(_nativeObject.btnTabBank4);
         }
         if(_nativeObject.btnTabBank5)
         {
            btnTabBank5.setNativeInstance(_nativeObject.btnTabBank5);
         }
         if(_nativeObject.btnTabBank6)
         {
            btnTabBank6.setNativeInstance(_nativeObject.btnTabBank6);
         }
         if(_nativeObject.btnTabBank9)
         {
            btnTabBank9.setNativeInstance(_nativeObject.btnTabBank9);
         }
         if(_nativeObject.btnTabBank10)
         {
            btnTabBank10.setNativeInstance(_nativeObject.btnTabBank10);
         }
         if(_nativeObject.btnTabBank11)
         {
            btnTabBank11.setNativeInstance(_nativeObject.btnTabBank11);
         }
         if(_nativeObject.btnTabBank12)
         {
            btnTabBank12.setNativeInstance(_nativeObject.btnTabBank12);
         }
         if(_nativeObject.btnTabBank13)
         {
            btnTabBank13.setNativeInstance(_nativeObject.btnTabBank13);
         }
         if(_nativeObject.btnTabBank16)
         {
            btnTabBank16.setNativeInstance(_nativeObject.btnTabBank16);
         }
         if(_nativeObject.btnTabBank17)
         {
            btnTabBank17.setNativeInstance(_nativeObject.btnTabBank17);
         }
         if(_nativeObject.btnTabBank18)
         {
            btnTabBank18.setNativeInstance(_nativeObject.btnTabBank18);
         }
         if(_nativeObject.btnTabBank19)
         {
            btnTabBank19.setNativeInstance(_nativeObject.btnTabBank19);
         }
         if(_nativeObject.btnTabBank20)
         {
            btnTabBank20.setNativeInstance(_nativeObject.btnTabBank20);
         }
         if(_nativeObject.btnTabBank1)
         {
            btnTabBank1.setNativeInstance(_nativeObject.btnTabBank1);
         }
         if(_nativeObject.btnTabBank8)
         {
            btnTabBank8.setNativeInstance(_nativeObject.btnTabBank8);
         }
         if(_nativeObject.btnTabBank15)
         {
            btnTabBank15.setNativeInstance(_nativeObject.btnTabBank15);
         }
         if(_nativeObject.btnTabBank7)
         {
            btnTabBank7.setNativeInstance(_nativeObject.btnTabBank7);
         }
         if(_nativeObject.btnTabBank14)
         {
            btnTabBank14.setNativeInstance(_nativeObject.btnTabBank14);
         }
         if(_nativeObject.btnTabBank21)
         {
            btnTabBank21.setNativeInstance(_nativeObject.btnTabBank21);
         }
         if(_nativeObject.inventorySlot1)
         {
            inventorySlot1.setNativeInstance(_nativeObject.inventorySlot1);
         }
         if(_nativeObject.inventorySlot2)
         {
            inventorySlot2.setNativeInstance(_nativeObject.inventorySlot2);
         }
         if(_nativeObject.inventorySlot3)
         {
            inventorySlot3.setNativeInstance(_nativeObject.inventorySlot3);
         }
         if(_nativeObject.inventorySlot4)
         {
            inventorySlot4.setNativeInstance(_nativeObject.inventorySlot4);
         }
         if(_nativeObject.inventorySlot5)
         {
            inventorySlot5.setNativeInstance(_nativeObject.inventorySlot5);
         }
         if(_nativeObject.inventorySlot6)
         {
            inventorySlot6.setNativeInstance(_nativeObject.inventorySlot6);
         }
         if(_nativeObject.inventorySlot7)
         {
            inventorySlot7.setNativeInstance(_nativeObject.inventorySlot7);
         }
         if(_nativeObject.inventorySlot8)
         {
            inventorySlot8.setNativeInstance(_nativeObject.inventorySlot8);
         }
         if(_nativeObject.inventorySlot9)
         {
            inventorySlot9.setNativeInstance(_nativeObject.inventorySlot9);
         }
         if(_nativeObject.inventorySlot10)
         {
            inventorySlot10.setNativeInstance(_nativeObject.inventorySlot10);
         }
         if(_nativeObject.inventorySlot11)
         {
            inventorySlot11.setNativeInstance(_nativeObject.inventorySlot11);
         }
         if(_nativeObject.inventorySlot12)
         {
            inventorySlot12.setNativeInstance(_nativeObject.inventorySlot12);
         }
         if(_nativeObject.inventorySlot13)
         {
            inventorySlot13.setNativeInstance(_nativeObject.inventorySlot13);
         }
         if(_nativeObject.inventorySlot14)
         {
            inventorySlot14.setNativeInstance(_nativeObject.inventorySlot14);
         }
         if(_nativeObject.inventorySlot15)
         {
            inventorySlot15.setNativeInstance(_nativeObject.inventorySlot15);
         }
         if(_nativeObject.inventorySlot16)
         {
            inventorySlot16.setNativeInstance(_nativeObject.inventorySlot16);
         }
         if(_nativeObject.inventorySlot17)
         {
            inventorySlot17.setNativeInstance(_nativeObject.inventorySlot17);
         }
         if(_nativeObject.inventorySlot18)
         {
            inventorySlot18.setNativeInstance(_nativeObject.inventorySlot18);
         }
         if(_nativeObject.bankSlot2)
         {
            bankSlot2.setNativeInstance(_nativeObject.bankSlot2);
         }
         if(_nativeObject.bankSlot7)
         {
            bankSlot7.setNativeInstance(_nativeObject.bankSlot7);
         }
         if(_nativeObject.bankSlot8)
         {
            bankSlot8.setNativeInstance(_nativeObject.bankSlot8);
         }
         if(_nativeObject.bankSlot13)
         {
            bankSlot13.setNativeInstance(_nativeObject.bankSlot13);
         }
         if(_nativeObject.bankSlot14)
         {
            bankSlot14.setNativeInstance(_nativeObject.bankSlot14);
         }
         if(_nativeObject.bankSlot3)
         {
            bankSlot3.setNativeInstance(_nativeObject.bankSlot3);
         }
         if(_nativeObject.bankSlot4)
         {
            bankSlot4.setNativeInstance(_nativeObject.bankSlot4);
         }
         if(_nativeObject.bankSlot9)
         {
            bankSlot9.setNativeInstance(_nativeObject.bankSlot9);
         }
         if(_nativeObject.bankSlot10)
         {
            bankSlot10.setNativeInstance(_nativeObject.bankSlot10);
         }
         if(_nativeObject.bankSlot15)
         {
            bankSlot15.setNativeInstance(_nativeObject.bankSlot15);
         }
         if(_nativeObject.bankSlot16)
         {
            bankSlot16.setNativeInstance(_nativeObject.bankSlot16);
         }
         if(_nativeObject.bankSlot5)
         {
            bankSlot5.setNativeInstance(_nativeObject.bankSlot5);
         }
         if(_nativeObject.bankSlot6)
         {
            bankSlot6.setNativeInstance(_nativeObject.bankSlot6);
         }
         if(_nativeObject.bankSlot11)
         {
            bankSlot11.setNativeInstance(_nativeObject.bankSlot11);
         }
         if(_nativeObject.bankSlot12)
         {
            bankSlot12.setNativeInstance(_nativeObject.bankSlot12);
         }
         if(_nativeObject.bankSlot17)
         {
            bankSlot17.setNativeInstance(_nativeObject.bankSlot17);
         }
         if(_nativeObject.bankSlot18)
         {
            bankSlot18.setNativeInstance(_nativeObject.bankSlot18);
         }
         if(_nativeObject.bankSlot1)
         {
            bankSlot1.setNativeInstance(_nativeObject.bankSlot1);
         }
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         if(_nativeObject.sellArea)
         {
            sellArea.setNativeInstance(_nativeObject.sellArea);
         }
         if(_nativeObject.btnSellAll)
         {
            btnSellAll.setNativeInstance(_nativeObject.btnSellAll);
         }
         if(_nativeObject.btnUpgrade)
         {
            btnUpgrade.setNativeInstance(_nativeObject.btnUpgrade);
         }
         if(_nativeObject.iconLock)
         {
            iconLock.setNativeInstance(_nativeObject.iconLock);
         }
         FlashLabelArea.setNativeInstance(txtInfo,_nativeObject.txtInfo);
         if(_nativeObject.dragLayer)
         {
            dragLayer.setNativeInstance(_nativeObject.dragLayer);
         }
      }
   }
}
