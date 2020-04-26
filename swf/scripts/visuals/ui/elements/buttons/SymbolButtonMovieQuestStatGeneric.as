package visuals.ui.elements.buttons
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.quest.SymbolMovieQuestStatGraphicGeneric;
   
   public class SymbolButtonMovieQuestStatGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolButtonMovieQuestStat = null;
      
      public var graphic:SymbolMovieQuestStatGraphicGeneric = null;
      
      public function SymbolButtonMovieQuestStatGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolButtonMovieQuestStat;
         }
         else
         {
            _nativeObject = new SymbolButtonMovieQuestStat();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         graphic = new SymbolMovieQuestStatGraphicGeneric(_nativeObject.graphic);
      }
      
      public function setNativeInstance(param1:SymbolButtonMovieQuestStat) : void
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
