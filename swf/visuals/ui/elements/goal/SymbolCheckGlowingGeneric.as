package visuals.ui.elements.goal
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolUiCheckboxCheckedGeneric;
   import visuals.ui.elements.generic.SymbolCheckmarkHighlightGeneric;
   
   public class SymbolCheckGlowingGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolCheckGlowing = null;
      
      public var checked:SymbolUiCheckboxCheckedGeneric = null;
      
      public var highlight:SymbolCheckmarkHighlightGeneric = null;
      
      public function SymbolCheckGlowingGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolCheckGlowing;
         }
         else
         {
            _nativeObject = new SymbolCheckGlowing();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         checked = new SymbolUiCheckboxCheckedGeneric(_nativeObject.checked);
         highlight = new SymbolCheckmarkHighlightGeneric(_nativeObject.highlight);
      }
      
      public function setNativeInstance(param1:SymbolCheckGlowing) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.checked)
         {
            checked.setNativeInstance(_nativeObject.checked);
         }
         if(_nativeObject.highlight)
         {
            highlight.setNativeInstance(_nativeObject.highlight);
         }
      }
   }
}
