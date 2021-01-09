package visuals.ui.elements.goal
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.icons.SymbolIconExclamationMarkGeneric;
   
   public class SymbolGoalExclamationMarkGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolGoalExclamationMark = null;
      
      public var symbolIconExclamationMark:SymbolIconExclamationMarkGeneric = null;
      
      public function SymbolGoalExclamationMarkGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolGoalExclamationMark;
         }
         else
         {
            _nativeObject = new SymbolGoalExclamationMark();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolIconExclamationMark = new SymbolIconExclamationMarkGeneric(_nativeObject.symbolIconExclamationMark);
      }
      
      public function setNativeInstance(param1:SymbolGoalExclamationMark) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.symbolIconExclamationMark)
         {
            symbolIconExclamationMark.setNativeInstance(_nativeObject.symbolIconExclamationMark);
         }
      }
   }
}
