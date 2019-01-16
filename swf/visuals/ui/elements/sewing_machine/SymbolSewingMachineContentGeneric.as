package visuals.ui.elements.sewing_machine
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
   import visuals.ui.elements.backgrounds.SymbolBackgroundScalableGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowDownGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowUpGeneric;
   import visuals.ui.elements.buttons.SymbolButtonGameCurrencyGeneric;
   import visuals.ui.elements.buttons.SymbolButtonPremiumGeneric;
   import visuals.ui.elements.item.SymbolItemSlotGeneric;
   
   public class SymbolSewingMachineContentGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolSewingMachineContent = null;
      
      public var sewingMachine:SymbolSewingMachineContainerGeneric = null;
      
      public var symbolBackgroundScalable:SymbolBackgroundScalableGeneric = null;
      
      public var itemSlotSource:SymbolItemSlotGeneric = null;
      
      public var slotTarget:SymbolDummyGeneric = null;
      
      public var itemSlotTarget:SymbolItemSlotGeneric = null;
      
      public var btnChangeCoins:SymbolButtonGameCurrencyGeneric = null;
      
      public var btnChangePremium:SymbolButtonPremiumGeneric = null;
      
      public var txtNoPatterns:ILabelArea = null;
      
      public var itemSlotPattern8:SymbolItemSlotGeneric = null;
      
      public var itemSlotPattern1:SymbolItemSlotGeneric = null;
      
      public var itemSlotPattern2:SymbolItemSlotGeneric = null;
      
      public var itemSlotPattern3:SymbolItemSlotGeneric = null;
      
      public var itemSlotPattern4:SymbolItemSlotGeneric = null;
      
      public var itemSlotPattern5:SymbolItemSlotGeneric = null;
      
      public var itemSlotPattern6:SymbolItemSlotGeneric = null;
      
      public var itemSlotPattern7:SymbolItemSlotGeneric = null;
      
      public var itemSlotPattern9:SymbolItemSlotGeneric = null;
      
      public var itemSlotPattern10:SymbolItemSlotGeneric = null;
      
      public var itemSlotPattern18:SymbolItemSlotGeneric = null;
      
      public var itemSlotPattern11:SymbolItemSlotGeneric = null;
      
      public var itemSlotPattern12:SymbolItemSlotGeneric = null;
      
      public var itemSlotPattern13:SymbolItemSlotGeneric = null;
      
      public var itemSlotPattern14:SymbolItemSlotGeneric = null;
      
      public var itemSlotPattern15:SymbolItemSlotGeneric = null;
      
      public var itemSlotPattern16:SymbolItemSlotGeneric = null;
      
      public var itemSlotPattern17:SymbolItemSlotGeneric = null;
      
      public var itemSlotPattern19:SymbolItemSlotGeneric = null;
      
      public var itemSlotPattern20:SymbolItemSlotGeneric = null;
      
      public var itemSlotPattern21:SymbolItemSlotGeneric = null;
      
      public var itemSlotPattern22:SymbolItemSlotGeneric = null;
      
      public var itemSlotPattern23:SymbolItemSlotGeneric = null;
      
      public var itemSlotPattern24:SymbolItemSlotGeneric = null;
      
      public var itemSlotPattern25:SymbolItemSlotGeneric = null;
      
      public var btnScrollUp:SymbolButtonArrowUpGeneric = null;
      
      public var btnScrollDown:SymbolButtonArrowDownGeneric = null;
      
      public var txtPatternsCaption:ILabel = null;
      
      public var dragLayer:SymbolDummyGeneric = null;
      
      public function SymbolSewingMachineContentGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolSewingMachineContent;
         }
         else
         {
            _nativeObject = new SymbolSewingMachineContent();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         sewingMachine = new SymbolSewingMachineContainerGeneric(_nativeObject.sewingMachine);
         symbolBackgroundScalable = new SymbolBackgroundScalableGeneric(_nativeObject.symbolBackgroundScalable);
         itemSlotSource = new SymbolItemSlotGeneric(_nativeObject.itemSlotSource);
         slotTarget = new SymbolDummyGeneric(_nativeObject.slotTarget);
         itemSlotTarget = new SymbolItemSlotGeneric(_nativeObject.itemSlotTarget);
         btnChangeCoins = new SymbolButtonGameCurrencyGeneric(_nativeObject.btnChangeCoins);
         btnChangePremium = new SymbolButtonPremiumGeneric(_nativeObject.btnChangePremium);
         txtNoPatterns = FlashLabelArea.fromNative(_nativeObject.txtNoPatterns);
         itemSlotPattern8 = new SymbolItemSlotGeneric(_nativeObject.itemSlotPattern8);
         itemSlotPattern1 = new SymbolItemSlotGeneric(_nativeObject.itemSlotPattern1);
         itemSlotPattern2 = new SymbolItemSlotGeneric(_nativeObject.itemSlotPattern2);
         itemSlotPattern3 = new SymbolItemSlotGeneric(_nativeObject.itemSlotPattern3);
         itemSlotPattern4 = new SymbolItemSlotGeneric(_nativeObject.itemSlotPattern4);
         itemSlotPattern5 = new SymbolItemSlotGeneric(_nativeObject.itemSlotPattern5);
         itemSlotPattern6 = new SymbolItemSlotGeneric(_nativeObject.itemSlotPattern6);
         itemSlotPattern7 = new SymbolItemSlotGeneric(_nativeObject.itemSlotPattern7);
         itemSlotPattern9 = new SymbolItemSlotGeneric(_nativeObject.itemSlotPattern9);
         itemSlotPattern10 = new SymbolItemSlotGeneric(_nativeObject.itemSlotPattern10);
         itemSlotPattern18 = new SymbolItemSlotGeneric(_nativeObject.itemSlotPattern18);
         itemSlotPattern11 = new SymbolItemSlotGeneric(_nativeObject.itemSlotPattern11);
         itemSlotPattern12 = new SymbolItemSlotGeneric(_nativeObject.itemSlotPattern12);
         itemSlotPattern13 = new SymbolItemSlotGeneric(_nativeObject.itemSlotPattern13);
         itemSlotPattern14 = new SymbolItemSlotGeneric(_nativeObject.itemSlotPattern14);
         itemSlotPattern15 = new SymbolItemSlotGeneric(_nativeObject.itemSlotPattern15);
         itemSlotPattern16 = new SymbolItemSlotGeneric(_nativeObject.itemSlotPattern16);
         itemSlotPattern17 = new SymbolItemSlotGeneric(_nativeObject.itemSlotPattern17);
         itemSlotPattern19 = new SymbolItemSlotGeneric(_nativeObject.itemSlotPattern19);
         itemSlotPattern20 = new SymbolItemSlotGeneric(_nativeObject.itemSlotPattern20);
         itemSlotPattern21 = new SymbolItemSlotGeneric(_nativeObject.itemSlotPattern21);
         itemSlotPattern22 = new SymbolItemSlotGeneric(_nativeObject.itemSlotPattern22);
         itemSlotPattern23 = new SymbolItemSlotGeneric(_nativeObject.itemSlotPattern23);
         itemSlotPattern24 = new SymbolItemSlotGeneric(_nativeObject.itemSlotPattern24);
         itemSlotPattern25 = new SymbolItemSlotGeneric(_nativeObject.itemSlotPattern25);
         btnScrollUp = new SymbolButtonArrowUpGeneric(_nativeObject.btnScrollUp);
         btnScrollDown = new SymbolButtonArrowDownGeneric(_nativeObject.btnScrollDown);
         txtPatternsCaption = FlashLabel.fromNative(_nativeObject.txtPatternsCaption);
         dragLayer = new SymbolDummyGeneric(_nativeObject.dragLayer);
      }
      
      public function setNativeInstance(param1:SymbolSewingMachineContent) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.sewingMachine)
         {
            sewingMachine.setNativeInstance(_nativeObject.sewingMachine);
         }
         if(_nativeObject.symbolBackgroundScalable)
         {
            symbolBackgroundScalable.setNativeInstance(_nativeObject.symbolBackgroundScalable);
         }
         if(_nativeObject.itemSlotSource)
         {
            itemSlotSource.setNativeInstance(_nativeObject.itemSlotSource);
         }
         if(_nativeObject.slotTarget)
         {
            slotTarget.setNativeInstance(_nativeObject.slotTarget);
         }
         if(_nativeObject.itemSlotTarget)
         {
            itemSlotTarget.setNativeInstance(_nativeObject.itemSlotTarget);
         }
         if(_nativeObject.btnChangeCoins)
         {
            btnChangeCoins.setNativeInstance(_nativeObject.btnChangeCoins);
         }
         if(_nativeObject.btnChangePremium)
         {
            btnChangePremium.setNativeInstance(_nativeObject.btnChangePremium);
         }
         FlashLabelArea.setNativeInstance(txtNoPatterns,_nativeObject.txtNoPatterns);
         if(_nativeObject.itemSlotPattern8)
         {
            itemSlotPattern8.setNativeInstance(_nativeObject.itemSlotPattern8);
         }
         if(_nativeObject.itemSlotPattern1)
         {
            itemSlotPattern1.setNativeInstance(_nativeObject.itemSlotPattern1);
         }
         if(_nativeObject.itemSlotPattern2)
         {
            itemSlotPattern2.setNativeInstance(_nativeObject.itemSlotPattern2);
         }
         if(_nativeObject.itemSlotPattern3)
         {
            itemSlotPattern3.setNativeInstance(_nativeObject.itemSlotPattern3);
         }
         if(_nativeObject.itemSlotPattern4)
         {
            itemSlotPattern4.setNativeInstance(_nativeObject.itemSlotPattern4);
         }
         if(_nativeObject.itemSlotPattern5)
         {
            itemSlotPattern5.setNativeInstance(_nativeObject.itemSlotPattern5);
         }
         if(_nativeObject.itemSlotPattern6)
         {
            itemSlotPattern6.setNativeInstance(_nativeObject.itemSlotPattern6);
         }
         if(_nativeObject.itemSlotPattern7)
         {
            itemSlotPattern7.setNativeInstance(_nativeObject.itemSlotPattern7);
         }
         if(_nativeObject.itemSlotPattern9)
         {
            itemSlotPattern9.setNativeInstance(_nativeObject.itemSlotPattern9);
         }
         if(_nativeObject.itemSlotPattern10)
         {
            itemSlotPattern10.setNativeInstance(_nativeObject.itemSlotPattern10);
         }
         if(_nativeObject.itemSlotPattern18)
         {
            itemSlotPattern18.setNativeInstance(_nativeObject.itemSlotPattern18);
         }
         if(_nativeObject.itemSlotPattern11)
         {
            itemSlotPattern11.setNativeInstance(_nativeObject.itemSlotPattern11);
         }
         if(_nativeObject.itemSlotPattern12)
         {
            itemSlotPattern12.setNativeInstance(_nativeObject.itemSlotPattern12);
         }
         if(_nativeObject.itemSlotPattern13)
         {
            itemSlotPattern13.setNativeInstance(_nativeObject.itemSlotPattern13);
         }
         if(_nativeObject.itemSlotPattern14)
         {
            itemSlotPattern14.setNativeInstance(_nativeObject.itemSlotPattern14);
         }
         if(_nativeObject.itemSlotPattern15)
         {
            itemSlotPattern15.setNativeInstance(_nativeObject.itemSlotPattern15);
         }
         if(_nativeObject.itemSlotPattern16)
         {
            itemSlotPattern16.setNativeInstance(_nativeObject.itemSlotPattern16);
         }
         if(_nativeObject.itemSlotPattern17)
         {
            itemSlotPattern17.setNativeInstance(_nativeObject.itemSlotPattern17);
         }
         if(_nativeObject.itemSlotPattern19)
         {
            itemSlotPattern19.setNativeInstance(_nativeObject.itemSlotPattern19);
         }
         if(_nativeObject.itemSlotPattern20)
         {
            itemSlotPattern20.setNativeInstance(_nativeObject.itemSlotPattern20);
         }
         if(_nativeObject.itemSlotPattern21)
         {
            itemSlotPattern21.setNativeInstance(_nativeObject.itemSlotPattern21);
         }
         if(_nativeObject.itemSlotPattern22)
         {
            itemSlotPattern22.setNativeInstance(_nativeObject.itemSlotPattern22);
         }
         if(_nativeObject.itemSlotPattern23)
         {
            itemSlotPattern23.setNativeInstance(_nativeObject.itemSlotPattern23);
         }
         if(_nativeObject.itemSlotPattern24)
         {
            itemSlotPattern24.setNativeInstance(_nativeObject.itemSlotPattern24);
         }
         if(_nativeObject.itemSlotPattern25)
         {
            itemSlotPattern25.setNativeInstance(_nativeObject.itemSlotPattern25);
         }
         if(_nativeObject.btnScrollUp)
         {
            btnScrollUp.setNativeInstance(_nativeObject.btnScrollUp);
         }
         if(_nativeObject.btnScrollDown)
         {
            btnScrollDown.setNativeInstance(_nativeObject.btnScrollDown);
         }
         FlashLabel.setNativeInstance(txtPatternsCaption,_nativeObject.txtPatternsCaption);
         if(_nativeObject.dragLayer)
         {
            dragLayer.setNativeInstance(_nativeObject.dragLayer);
         }
      }
   }
}
