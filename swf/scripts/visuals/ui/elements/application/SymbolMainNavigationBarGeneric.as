package visuals.ui.elements.application
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.buttons.SymbolButtonBoostersGeneric;
   import visuals.ui.elements.buttons.SymbolButtonBuyCurrencyGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCharacterGeneric;
   import visuals.ui.elements.buttons.SymbolButtonDuelsGeneric;
   import visuals.ui.elements.buttons.SymbolButtonGuildIconGeneric;
   import visuals.ui.elements.buttons.SymbolButtonLeaderboardGeneric;
   import visuals.ui.elements.buttons.SymbolButtonMainNavGeneric;
   import visuals.ui.elements.buttons.SymbolButtonMovieGeneric;
   import visuals.ui.elements.buttons.SymbolButtonQuestsGeneric;
   import visuals.ui.elements.buttons.SymbolButtonShopGeneric;
   import visuals.ui.elements.buttons.SymbolButtonWorkGeneric;
   import visuals.ui.elements.generic.SymbolBackgroundNavigationGeneric;
   
   public class SymbolMainNavigationBarGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolMainNavigationBar = null;
      
      public var backgroundNavigation:SymbolBackgroundNavigationGeneric = null;
      
      public var btnCharacterContent:SymbolButtonCharacterGeneric = null;
      
      public var btnQuestsContent:SymbolButtonQuestsGeneric = null;
      
      public var btnDuelsContent:SymbolButtonDuelsGeneric = null;
      
      public var btnShopContent:SymbolButtonShopGeneric = null;
      
      public var btnBoostersContent:SymbolButtonBoostersGeneric = null;
      
      public var btnWorkContent:SymbolButtonWorkGeneric = null;
      
      public var btnMovieContent:SymbolButtonMovieGeneric = null;
      
      public var btnGuildContent:SymbolButtonGuildIconGeneric = null;
      
      public var btnLeaderboardContent:SymbolButtonLeaderboardGeneric = null;
      
      public var btnBuyCurrencyContent:SymbolButtonBuyCurrencyGeneric = null;
      
      public var btnCharacter:SymbolButtonMainNavGeneric = null;
      
      public var btnQuests:SymbolButtonMainNavGeneric = null;
      
      public var btnShop:SymbolButtonMainNavGeneric = null;
      
      public var btnWork:SymbolButtonMainNavGeneric = null;
      
      public var btnMovie:SymbolButtonMainNavGeneric = null;
      
      public var btnBoosters:SymbolButtonMainNavGeneric = null;
      
      public var btnGuild:SymbolButtonMainNavGeneric = null;
      
      public var btnLeaderboard:SymbolButtonMainNavGeneric = null;
      
      public var btnBuyCurrency:SymbolButtonMainNavGeneric = null;
      
      public var btnDuels:SymbolButtonMainNavGeneric = null;
      
      public function SymbolMainNavigationBarGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolMainNavigationBar;
         }
         else
         {
            _nativeObject = new SymbolMainNavigationBar();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         backgroundNavigation = new SymbolBackgroundNavigationGeneric(_nativeObject.backgroundNavigation);
         btnCharacterContent = new SymbolButtonCharacterGeneric(_nativeObject.btnCharacterContent);
         btnQuestsContent = new SymbolButtonQuestsGeneric(_nativeObject.btnQuestsContent);
         btnDuelsContent = new SymbolButtonDuelsGeneric(_nativeObject.btnDuelsContent);
         btnShopContent = new SymbolButtonShopGeneric(_nativeObject.btnShopContent);
         btnBoostersContent = new SymbolButtonBoostersGeneric(_nativeObject.btnBoostersContent);
         btnWorkContent = new SymbolButtonWorkGeneric(_nativeObject.btnWorkContent);
         btnMovieContent = new SymbolButtonMovieGeneric(_nativeObject.btnMovieContent);
         btnGuildContent = new SymbolButtonGuildIconGeneric(_nativeObject.btnGuildContent);
         btnLeaderboardContent = new SymbolButtonLeaderboardGeneric(_nativeObject.btnLeaderboardContent);
         btnBuyCurrencyContent = new SymbolButtonBuyCurrencyGeneric(_nativeObject.btnBuyCurrencyContent);
         btnCharacter = new SymbolButtonMainNavGeneric(_nativeObject.btnCharacter);
         btnQuests = new SymbolButtonMainNavGeneric(_nativeObject.btnQuests);
         btnShop = new SymbolButtonMainNavGeneric(_nativeObject.btnShop);
         btnWork = new SymbolButtonMainNavGeneric(_nativeObject.btnWork);
         btnMovie = new SymbolButtonMainNavGeneric(_nativeObject.btnMovie);
         btnBoosters = new SymbolButtonMainNavGeneric(_nativeObject.btnBoosters);
         btnGuild = new SymbolButtonMainNavGeneric(_nativeObject.btnGuild);
         btnLeaderboard = new SymbolButtonMainNavGeneric(_nativeObject.btnLeaderboard);
         btnBuyCurrency = new SymbolButtonMainNavGeneric(_nativeObject.btnBuyCurrency);
         btnDuels = new SymbolButtonMainNavGeneric(_nativeObject.btnDuels);
      }
      
      public function setNativeInstance(param1:SymbolMainNavigationBar) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.backgroundNavigation)
         {
            backgroundNavigation.setNativeInstance(_nativeObject.backgroundNavigation);
         }
         if(_nativeObject.btnCharacterContent)
         {
            btnCharacterContent.setNativeInstance(_nativeObject.btnCharacterContent);
         }
         if(_nativeObject.btnQuestsContent)
         {
            btnQuestsContent.setNativeInstance(_nativeObject.btnQuestsContent);
         }
         if(_nativeObject.btnDuelsContent)
         {
            btnDuelsContent.setNativeInstance(_nativeObject.btnDuelsContent);
         }
         if(_nativeObject.btnShopContent)
         {
            btnShopContent.setNativeInstance(_nativeObject.btnShopContent);
         }
         if(_nativeObject.btnBoostersContent)
         {
            btnBoostersContent.setNativeInstance(_nativeObject.btnBoostersContent);
         }
         if(_nativeObject.btnWorkContent)
         {
            btnWorkContent.setNativeInstance(_nativeObject.btnWorkContent);
         }
         if(_nativeObject.btnMovieContent)
         {
            btnMovieContent.setNativeInstance(_nativeObject.btnMovieContent);
         }
         if(_nativeObject.btnGuildContent)
         {
            btnGuildContent.setNativeInstance(_nativeObject.btnGuildContent);
         }
         if(_nativeObject.btnLeaderboardContent)
         {
            btnLeaderboardContent.setNativeInstance(_nativeObject.btnLeaderboardContent);
         }
         if(_nativeObject.btnBuyCurrencyContent)
         {
            btnBuyCurrencyContent.setNativeInstance(_nativeObject.btnBuyCurrencyContent);
         }
         if(_nativeObject.btnCharacter)
         {
            btnCharacter.setNativeInstance(_nativeObject.btnCharacter);
         }
         if(_nativeObject.btnQuests)
         {
            btnQuests.setNativeInstance(_nativeObject.btnQuests);
         }
         if(_nativeObject.btnShop)
         {
            btnShop.setNativeInstance(_nativeObject.btnShop);
         }
         if(_nativeObject.btnWork)
         {
            btnWork.setNativeInstance(_nativeObject.btnWork);
         }
         if(_nativeObject.btnMovie)
         {
            btnMovie.setNativeInstance(_nativeObject.btnMovie);
         }
         if(_nativeObject.btnBoosters)
         {
            btnBoosters.setNativeInstance(_nativeObject.btnBoosters);
         }
         if(_nativeObject.btnGuild)
         {
            btnGuild.setNativeInstance(_nativeObject.btnGuild);
         }
         if(_nativeObject.btnLeaderboard)
         {
            btnLeaderboard.setNativeInstance(_nativeObject.btnLeaderboard);
         }
         if(_nativeObject.btnBuyCurrency)
         {
            btnBuyCurrency.setNativeInstance(_nativeObject.btnBuyCurrency);
         }
         if(_nativeObject.btnDuels)
         {
            btnDuels.setNativeInstance(_nativeObject.btnDuels);
         }
      }
   }
}
