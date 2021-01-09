package visuals.ui.elements.movie
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.buttons.SymbolButtonMovieQuestFightGeneric;
   import visuals.ui.elements.buttons.SymbolButtonMovieQuestInstantGeneric;
   import visuals.ui.elements.buttons.SymbolButtonMovieQuestStatGeneric;
   
   public class SymbolButtonMovieQuestGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolButtonMovieQuest = null;
      
      public var instantQuest:SymbolButtonMovieQuestInstantGeneric = null;
      
      public var fightQuest:SymbolButtonMovieQuestFightGeneric = null;
      
      public var statQuest:SymbolButtonMovieQuestStatGeneric = null;
      
      public function SymbolButtonMovieQuestGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolButtonMovieQuest;
         }
         else
         {
            _nativeObject = new SymbolButtonMovieQuest();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         instantQuest = new SymbolButtonMovieQuestInstantGeneric(_nativeObject.instantQuest);
         fightQuest = new SymbolButtonMovieQuestFightGeneric(_nativeObject.fightQuest);
         statQuest = new SymbolButtonMovieQuestStatGeneric(_nativeObject.statQuest);
      }
      
      public function setNativeInstance(param1:SymbolButtonMovieQuest) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.instantQuest)
         {
            instantQuest.setNativeInstance(_nativeObject.instantQuest);
         }
         if(_nativeObject.fightQuest)
         {
            fightQuest.setNativeInstance(_nativeObject.fightQuest);
         }
         if(_nativeObject.statQuest)
         {
            statQuest.setNativeInstance(_nativeObject.statQuest);
         }
      }
   }
}
