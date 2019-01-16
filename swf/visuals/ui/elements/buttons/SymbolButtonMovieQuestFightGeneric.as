package visuals.ui.elements.buttons
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.quest.SymbolMovieQuestFightGraphicGeneric;
   
   public class SymbolButtonMovieQuestFightGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolButtonMovieQuestFight = null;
      
      public var graphic:SymbolMovieQuestFightGraphicGeneric = null;
      
      public function SymbolButtonMovieQuestFightGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolButtonMovieQuestFight;
         }
         else
         {
            _nativeObject = new SymbolButtonMovieQuestFight();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         graphic = new SymbolMovieQuestFightGraphicGeneric(_nativeObject.graphic);
      }
      
      public function setNativeInstance(param1:SymbolButtonMovieQuestFight) : void
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
