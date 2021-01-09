package visuals.ui.elements.outfit
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolPlaceholderGeneric;
   import visuals.ui.elements.buttons.SymbolButtonOptionsGeneric;
   import visuals.ui.elements.buttons.SymbolButtonPremiumGeneric;
   import visuals.ui.elements.generic.SymbolGenericListLineEvenGeneric;
   import visuals.ui.elements.generic.SymbolGenericListLineOddGeneric;
   import visuals.ui.elements.goal.SymbolGoalExclamationMarkGeneric;
   import visuals.ui.elements.goal.SymbolGoalHighlightGeneric;
   import visuals.ui.elements.icons.SymbolIconCheckmarkGeneric;
   
   public class SymbolOutfitLineGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolOutfitLine = null;
      
      public var backgroundHighlight:SymbolGenericListLineOddGeneric = null;
      
      public var backgroundEven:SymbolGenericListLineEvenGeneric = null;
      
      public var backgroundOdd:SymbolGoalHighlightGeneric = null;
      
      public var txtName:ILabelArea = null;
      
      public var icon:SymbolPlaceholderGeneric = null;
      
      public var settingsIcon:SymbolButtonOptionsGeneric = null;
      
      public var iconNoItems:SymbolIconOutfitNoItemGeneric = null;
      
      public var iconExclamationMark:SymbolGoalExclamationMarkGeneric = null;
      
      public var iconCheckmark:SymbolIconCheckmarkGeneric = null;
      
      public var btnUnlock:SymbolButtonPremiumGeneric = null;
      
      public function SymbolOutfitLineGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolOutfitLine;
         }
         else
         {
            _nativeObject = new SymbolOutfitLine();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         backgroundHighlight = new SymbolGenericListLineOddGeneric(_nativeObject.backgroundHighlight);
         backgroundEven = new SymbolGenericListLineEvenGeneric(_nativeObject.backgroundEven);
         backgroundOdd = new SymbolGoalHighlightGeneric(_nativeObject.backgroundOdd);
         txtName = FlashLabelArea.fromNative(_nativeObject.txtName);
         icon = new SymbolPlaceholderGeneric(_nativeObject.icon);
         settingsIcon = new SymbolButtonOptionsGeneric(_nativeObject.settingsIcon);
         iconNoItems = new SymbolIconOutfitNoItemGeneric(_nativeObject.iconNoItems);
         iconExclamationMark = new SymbolGoalExclamationMarkGeneric(_nativeObject.iconExclamationMark);
         iconCheckmark = new SymbolIconCheckmarkGeneric(_nativeObject.iconCheckmark);
         btnUnlock = new SymbolButtonPremiumGeneric(_nativeObject.btnUnlock);
      }
      
      public function setNativeInstance(param1:SymbolOutfitLine) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.backgroundHighlight)
         {
            backgroundHighlight.setNativeInstance(_nativeObject.backgroundHighlight);
         }
         if(_nativeObject.backgroundEven)
         {
            backgroundEven.setNativeInstance(_nativeObject.backgroundEven);
         }
         if(_nativeObject.backgroundOdd)
         {
            backgroundOdd.setNativeInstance(_nativeObject.backgroundOdd);
         }
         FlashLabelArea.setNativeInstance(txtName,_nativeObject.txtName);
         if(_nativeObject.icon)
         {
            icon.setNativeInstance(_nativeObject.icon);
         }
         if(_nativeObject.settingsIcon)
         {
            settingsIcon.setNativeInstance(_nativeObject.settingsIcon);
         }
         if(_nativeObject.iconNoItems)
         {
            iconNoItems.setNativeInstance(_nativeObject.iconNoItems);
         }
         if(_nativeObject.iconExclamationMark)
         {
            iconExclamationMark.setNativeInstance(_nativeObject.iconExclamationMark);
         }
         if(_nativeObject.iconCheckmark)
         {
            iconCheckmark.setNativeInstance(_nativeObject.iconCheckmark);
         }
         if(_nativeObject.btnUnlock)
         {
            btnUnlock.setNativeInstance(_nativeObject.btnUnlock);
         }
      }
   }
}
