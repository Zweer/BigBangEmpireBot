package visuals.ui.base
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolUiCheckboxStorygoalDefaultGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolUiCheckboxStorygoalDefault = null;
      
      public var background:SymbolUiCheckboxBackgroundGeneric = null;
      
      public var checked:SymbolUiCheckboxCheckedGeneric = null;
      
      public function SymbolUiCheckboxStorygoalDefaultGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolUiCheckboxStorygoalDefault;
         }
         else
         {
            _nativeObject = new SymbolUiCheckboxStorygoalDefault();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         background = new SymbolUiCheckboxBackgroundGeneric(_nativeObject.background);
         checked = new SymbolUiCheckboxCheckedGeneric(_nativeObject.checked);
      }
      
      public function setNativeInstance(param1:SymbolUiCheckboxStorygoalDefault) : void
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
         if(_nativeObject.checked)
         {
            checked.setNativeInstance(_nativeObject.checked);
         }
      }
   }
}
