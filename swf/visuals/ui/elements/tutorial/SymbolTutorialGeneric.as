package visuals.ui.elements.tutorial
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolTutorialGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolTutorial = null;
      
      public var hint:SymbolTutorialArrowGeneric = null;
      
      public var lady:SymbolTutorialLadyGeneric = null;
      
      public function SymbolTutorialGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolTutorial;
         }
         else
         {
            _nativeObject = new SymbolTutorial();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         hint = new SymbolTutorialArrowGeneric(_nativeObject.hint);
         lady = new SymbolTutorialLadyGeneric(_nativeObject.lady);
      }
      
      public function setNativeInstance(param1:SymbolTutorial) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.hint)
         {
            hint.setNativeInstance(_nativeObject.hint);
         }
         if(_nativeObject.lady)
         {
            lady.setNativeInstance(_nativeObject.lady);
         }
      }
   }
}
