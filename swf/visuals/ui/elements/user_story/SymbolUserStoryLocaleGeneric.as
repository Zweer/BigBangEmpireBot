package visuals.ui.elements.user_story
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolUiCheckboxGeneric;
   import visuals.ui.elements.generic.SymbolLocalePickOptionGeneric;
   
   public class SymbolUserStoryLocaleGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolUserStoryLocale = null;
      
      public var localeOption:SymbolLocalePickOptionGeneric = null;
      
      public var checkBox:SymbolUiCheckboxGeneric = null;
      
      public function SymbolUserStoryLocaleGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolUserStoryLocale;
         }
         else
         {
            _nativeObject = new SymbolUserStoryLocale();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         localeOption = new SymbolLocalePickOptionGeneric(_nativeObject.localeOption);
         checkBox = new SymbolUiCheckboxGeneric(_nativeObject.checkBox);
      }
      
      public function setNativeInstance(param1:SymbolUserStoryLocale) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.localeOption)
         {
            localeOption.setNativeInstance(_nativeObject.localeOption);
         }
         if(_nativeObject.checkBox)
         {
            checkBox.setNativeInstance(_nativeObject.checkBox);
         }
      }
   }
}
