package visuals.ui.base
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.icons.SymbolIconExclamationMarkGeneric;
   
   public class SymbolExclamationMarkQuestStarGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolExclamationMarkQuestStar = null;
      
      public var symbolIconExclamationMark:SymbolIconExclamationMarkGeneric = null;
      
      public function SymbolExclamationMarkQuestStarGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolExclamationMarkQuestStar;
         }
         else
         {
            _nativeObject = new SymbolExclamationMarkQuestStar();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolIconExclamationMark = new SymbolIconExclamationMarkGeneric(_nativeObject.symbolIconExclamationMark);
      }
      
      public function setNativeInstance(param1:SymbolExclamationMarkQuestStar) : void
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
