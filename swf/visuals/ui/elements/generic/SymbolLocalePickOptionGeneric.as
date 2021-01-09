package visuals.ui.elements.generic
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.elements.icons.SymbolIconFlagGeneric;
   
   public class SymbolLocalePickOptionGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolLocalePickOption = null;
      
      public var active:SymbolLocalePickOptionActiveGeneric = null;
      
      public var dropDownBackground:SymbolDropdownBackgroundGeneric = null;
      
      public var iconLocale:SymbolIconFlagGeneric = null;
      
      public var txtCountryName:ILabelArea = null;
      
      public function SymbolLocalePickOptionGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolLocalePickOption;
         }
         else
         {
            _nativeObject = new SymbolLocalePickOption();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         active = new SymbolLocalePickOptionActiveGeneric(_nativeObject.active);
         dropDownBackground = new SymbolDropdownBackgroundGeneric(_nativeObject.dropDownBackground);
         iconLocale = new SymbolIconFlagGeneric(_nativeObject.iconLocale);
         txtCountryName = FlashLabelArea.fromNative(_nativeObject.txtCountryName);
      }
      
      public function setNativeInstance(param1:SymbolLocalePickOption) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.active)
         {
            active.setNativeInstance(_nativeObject.active);
         }
         if(_nativeObject.dropDownBackground)
         {
            dropDownBackground.setNativeInstance(_nativeObject.dropDownBackground);
         }
         if(_nativeObject.iconLocale)
         {
            iconLocale.setNativeInstance(_nativeObject.iconLocale);
         }
         FlashLabelArea.setNativeInstance(txtCountryName,_nativeObject.txtCountryName);
      }
   }
}
