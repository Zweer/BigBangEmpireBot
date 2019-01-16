package visuals.ui.elements.buttons
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.quest.SymbolMovieQuestInstantGraphicGeneric;
   
   public class SymbolButtonMovieQuestInstantGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolButtonMovieQuestInstant = null;
      
      public var graphic:SymbolMovieQuestInstantGraphicGeneric = null;
      
      public function SymbolButtonMovieQuestInstantGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolButtonMovieQuestInstant;
         }
         else
         {
            _nativeObject = new SymbolButtonMovieQuestInstant();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         graphic = new SymbolMovieQuestInstantGraphicGeneric(_nativeObject.graphic);
      }
      
      public function setNativeInstance(param1:SymbolButtonMovieQuestInstant) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.graphic)
         {
            graphic.setNativeInstance(_nativeObject.graphic);
         }
      }
   }
}
