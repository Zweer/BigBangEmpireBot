package visuals.ui.panels
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   import visuals.ui.elements.avatar.SymbolAvatarGeneric;
   import visuals.ui.elements.buttons.SymbolButtonHelpGeneric;
   import visuals.ui.elements.icons.SymbolIconSelectMovieGeneric;
   import visuals.ui.elements.movie.SymbolButtonMovieQuestGeneric;
   import visuals.ui.elements.movie.SymbolMovieEnergyBgGeneric;
   import visuals.ui.elements.movie.SymbolMovieProgressInfoGeneric;
   
   public class SymbolPanelMovieProgressGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolPanelMovieProgress = null;
      
      public var background:SymbolDummyGeneric = null;
      
      public var avatar:SymbolAvatarGeneric = null;
      
      public var progressInfo:SymbolMovieProgressInfoGeneric = null;
      
      public var questArea:SymbolDummyGeneric = null;
      
      public var quest1:SymbolButtonMovieQuestGeneric = null;
      
      public var quest2:SymbolButtonMovieQuestGeneric = null;
      
      public var quest3:SymbolButtonMovieQuestGeneric = null;
      
      public var energy:SymbolMovieEnergyBgGeneric = null;
      
      public var btnHelp:SymbolButtonHelpGeneric = null;
      
      public var btnSelectMovie:SymbolIconSelectMovieGeneric = null;
      
      public function SymbolPanelMovieProgressGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolPanelMovieProgress;
         }
         else
         {
            _nativeObject = new SymbolPanelMovieProgress();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         background = new SymbolDummyGeneric(_nativeObject.background);
         avatar = new SymbolAvatarGeneric(_nativeObject.avatar);
         progressInfo = new SymbolMovieProgressInfoGeneric(_nativeObject.progressInfo);
         questArea = new SymbolDummyGeneric(_nativeObject.questArea);
         quest1 = new SymbolButtonMovieQuestGeneric(_nativeObject.quest1);
         quest2 = new SymbolButtonMovieQuestGeneric(_nativeObject.quest2);
         quest3 = new SymbolButtonMovieQuestGeneric(_nativeObject.quest3);
         energy = new SymbolMovieEnergyBgGeneric(_nativeObject.energy);
         btnHelp = new SymbolButtonHelpGeneric(_nativeObject.btnHelp);
         btnSelectMovie = new SymbolIconSelectMovieGeneric(_nativeObject.btnSelectMovie);
      }
      
      public function setNativeInstance(param1:SymbolPanelMovieProgress) : void
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
         if(_nativeObject.avatar)
         {
            avatar.setNativeInstance(_nativeObject.avatar);
         }
         if(_nativeObject.progressInfo)
         {
            progressInfo.setNativeInstance(_nativeObject.progressInfo);
         }
         if(_nativeObject.questArea)
         {
            questArea.setNativeInstance(_nativeObject.questArea);
         }
         if(_nativeObject.quest1)
         {
            quest1.setNativeInstance(_nativeObject.quest1);
         }
         if(_nativeObject.quest2)
         {
            quest2.setNativeInstance(_nativeObject.quest2);
         }
         if(_nativeObject.quest3)
         {
            quest3.setNativeInstance(_nativeObject.quest3);
         }
         if(_nativeObject.energy)
         {
            energy.setNativeInstance(_nativeObject.energy);
         }
         if(_nativeObject.btnHelp)
         {
            btnHelp.setNativeInstance(_nativeObject.btnHelp);
         }
         if(_nativeObject.btnSelectMovie)
         {
            btnSelectMovie.setNativeInstance(_nativeObject.btnSelectMovie);
         }
      }
   }
}
