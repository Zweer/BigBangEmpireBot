package visuals.ui.elements.quest
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.movie.SymbolMovieQuestInstantIconGeneric;
   
   public class SymbolMovieQuestIconInstantAnimationGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolMovieQuestIconInstantAnimation = null;
      
      public var symbolMovieQuestInstantIcon:SymbolMovieQuestInstantIconGeneric = null;
      
      public function SymbolMovieQuestIconInstantAnimationGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolMovieQuestIconInstantAnimation;
         }
         else
         {
            _nativeObject = new SymbolMovieQuestIconInstantAnimation();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolMovieQuestInstantIcon = new SymbolMovieQuestInstantIconGeneric(_nativeObject.symbolMovieQuestInstantIcon);
      }
      
      public function setNativeInstance(param1:SymbolMovieQuestIconInstantAnimation) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.symbolMovieQuestInstantIcon)
         {
            symbolMovieQuestInstantIcon.setNativeInstance(_nativeObject.symbolMovieQuestInstantIcon);
         }
      }
   }
}
