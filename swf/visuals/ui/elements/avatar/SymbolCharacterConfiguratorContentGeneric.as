package visuals.ui.elements.avatar
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolUiCheckboxGeneric;
   import visuals.ui.elements.backgrounds.SymbolBackgroundScalableGeneric;
   import visuals.ui.elements.buttons.SymbolButtonPremiumGeneric;
   import visuals.ui.elements.goal.SymbolButtonCancelGeneric;
   import visuals.ui.elements.goal.SymbolCharacterAppearanceSheetGeneric;
   
   public class SymbolCharacterConfiguratorContentGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolCharacterConfiguratorContent = null;
      
      public var avatar:SymbolAvatarGeneric = null;
      
      public var symbolBackgroundScalable:SymbolBackgroundScalableGeneric = null;
      
      public var configuratorTattoo:SymbolCharacterConfiguratorTattooGeneric = null;
      
      public var configuratorBarber:SymbolCharacterConfiguratorBarberGeneric = null;
      
      public var configuratorSurgeon:SymbolCharacterConfiguratorSurgeonGeneric = null;
      
      public var configuratorUnderwear:SymbolCharacterConfiguratorUnderwearGeneric = null;
      
      public var configuratorHideCloths:SymbolCharacterConfiguratorHideClothsGeneric = null;
      
      public var btnTabTattoo:SymbolCharacterAppearanceSheetGeneric = null;
      
      public var btnTabBarber:SymbolCharacterAppearanceSheetGeneric = null;
      
      public var btnTabSurgeon:SymbolCharacterAppearanceSheetGeneric = null;
      
      public var btnTabUnderwear:SymbolCharacterAppearanceSheetGeneric = null;
      
      public var btnTabHideCloths:SymbolCharacterAppearanceSheetGeneric = null;
      
      public var btnChange:SymbolButtonPremiumGeneric = null;
      
      public var btnCancel:SymbolButtonCancelGeneric = null;
      
      public var checkShowClothes:SymbolUiCheckboxGeneric = null;
      
      public var txtShowClothes:ILabelArea = null;
      
      public function SymbolCharacterConfiguratorContentGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolCharacterConfiguratorContent;
         }
         else
         {
            _nativeObject = new SymbolCharacterConfiguratorContent();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         avatar = new SymbolAvatarGeneric(_nativeObject.avatar);
         symbolBackgroundScalable = new SymbolBackgroundScalableGeneric(_nativeObject.symbolBackgroundScalable);
         configuratorTattoo = new SymbolCharacterConfiguratorTattooGeneric(_nativeObject.configuratorTattoo);
         configuratorBarber = new SymbolCharacterConfiguratorBarberGeneric(_nativeObject.configuratorBarber);
         configuratorSurgeon = new SymbolCharacterConfiguratorSurgeonGeneric(_nativeObject.configuratorSurgeon);
         configuratorUnderwear = new SymbolCharacterConfiguratorUnderwearGeneric(_nativeObject.configuratorUnderwear);
         configuratorHideCloths = new SymbolCharacterConfiguratorHideClothsGeneric(_nativeObject.configuratorHideCloths);
         btnTabTattoo = new SymbolCharacterAppearanceSheetGeneric(_nativeObject.btnTabTattoo);
         btnTabBarber = new SymbolCharacterAppearanceSheetGeneric(_nativeObject.btnTabBarber);
         btnTabSurgeon = new SymbolCharacterAppearanceSheetGeneric(_nativeObject.btnTabSurgeon);
         btnTabUnderwear = new SymbolCharacterAppearanceSheetGeneric(_nativeObject.btnTabUnderwear);
         btnTabHideCloths = new SymbolCharacterAppearanceSheetGeneric(_nativeObject.btnTabHideCloths);
         btnChange = new SymbolButtonPremiumGeneric(_nativeObject.btnChange);
         btnCancel = new SymbolButtonCancelGeneric(_nativeObject.btnCancel);
         checkShowClothes = new SymbolUiCheckboxGeneric(_nativeObject.checkShowClothes);
         txtShowClothes = FlashLabelArea.fromNative(_nativeObject.txtShowClothes);
      }
      
      public function setNativeInstance(param1:SymbolCharacterConfiguratorContent) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.avatar)
         {
            avatar.setNativeInstance(_nativeObject.avatar);
         }
         if(_nativeObject.symbolBackgroundScalable)
         {
            symbolBackgroundScalable.setNativeInstance(_nativeObject.symbolBackgroundScalable);
         }
         if(_nativeObject.configuratorTattoo)
         {
            configuratorTattoo.setNativeInstance(_nativeObject.configuratorTattoo);
         }
         if(_nativeObject.configuratorBarber)
         {
            configuratorBarber.setNativeInstance(_nativeObject.configuratorBarber);
         }
         if(_nativeObject.configuratorSurgeon)
         {
            configuratorSurgeon.setNativeInstance(_nativeObject.configuratorSurgeon);
         }
         if(_nativeObject.configuratorUnderwear)
         {
            configuratorUnderwear.setNativeInstance(_nativeObject.configuratorUnderwear);
         }
         if(_nativeObject.configuratorHideCloths)
         {
            configuratorHideCloths.setNativeInstance(_nativeObject.configuratorHideCloths);
         }
         if(_nativeObject.btnTabTattoo)
         {
            btnTabTattoo.setNativeInstance(_nativeObject.btnTabTattoo);
         }
         if(_nativeObject.btnTabBarber)
         {
            btnTabBarber.setNativeInstance(_nativeObject.btnTabBarber);
         }
         if(_nativeObject.btnTabSurgeon)
         {
            btnTabSurgeon.setNativeInstance(_nativeObject.btnTabSurgeon);
         }
         if(_nativeObject.btnTabUnderwear)
         {
            btnTabUnderwear.setNativeInstance(_nativeObject.btnTabUnderwear);
         }
         if(_nativeObject.btnTabHideCloths)
         {
            btnTabHideCloths.setNativeInstance(_nativeObject.btnTabHideCloths);
         }
         if(_nativeObject.btnChange)
         {
            btnChange.setNativeInstance(_nativeObject.btnChange);
         }
         if(_nativeObject.btnCancel)
         {
            btnCancel.setNativeInstance(_nativeObject.btnCancel);
         }
         if(_nativeObject.checkShowClothes)
         {
            checkShowClothes.setNativeInstance(_nativeObject.checkShowClothes);
         }
         FlashLabelArea.setNativeInstance(txtShowClothes,_nativeObject.txtShowClothes);
      }
   }
}
