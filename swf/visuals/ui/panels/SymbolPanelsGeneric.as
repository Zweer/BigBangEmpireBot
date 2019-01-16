package visuals.ui.panels
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.background.SymbolBackgroundFaderGeneric;
   import visuals.ui.elements.friendbar.FriendbarSymbolApplicationGeneric;
   import visuals.ui.elements.tutorial.SymbolTutorialGeneric;
   
   public class SymbolPanelsGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolPanels = null;
      
      public var backgroundFader:SymbolBackgroundFaderGeneric = null;
      
      public var panelCharacter:SymbolPanelCharacterGeneric = null;
      
      public var panelCharacterAppearance:SymbolPanelCharacterAppearanceGeneric = null;
      
      public var panelCharacterAppearancePhotographer:SymbolPanelCharacterAppearancePhotographerGeneric = null;
      
      public var panelCreateCharacter:SymbolPanelCreateCharacterGeneric = null;
      
      public var panelQuestProgress:SymbolPanelQuestProgressGeneric = null;
      
      public var panelQuests:SymbolPanelQuestsGeneric = null;
      
      public var panelCitymap:SymbolPanelCitymapGeneric = null;
      
      public var panelBattle:SymbolPanelBattleGeneric = null;
      
      public var panelStatQuest:SymbolPanelStatQuestGeneric = null;
      
      public var panelDuels:SymbolPanelDuelsGeneric = null;
      
      public var panelShop:SymbolPanelShopGeneric = null;
      
      public var panelWorkNew:SymbolPanelWorkNewGeneric = null;
      
      public var panelMovieOffers:SymbolPanelMovieOffersGeneric = null;
      
      public var panelMovieProgress:SymbolPanelMovieProgressGeneric = null;
      
      public var panelGuild:SymbolPanelGuildGeneric = null;
      
      public var panelDungeon:SymbolPanelDungeonGeneric = null;
      
      public var panelSlotMachine:SymbolPanelSlotMachineGeneric = null;
      
      public var panelBaseUser:SymbolPanelBaseUserGeneric = null;
      
      public var panelBaseNoUser:SymbolPanelBaseNoUserGeneric = null;
      
      public var tutorial:SymbolTutorialGeneric = null;
      
      public var friendbar:FriendbarSymbolApplicationGeneric = null;
      
      public function SymbolPanelsGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolPanels;
         }
         else
         {
            _nativeObject = new SymbolPanels();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         backgroundFader = new SymbolBackgroundFaderGeneric(_nativeObject.backgroundFader);
         panelCharacter = new SymbolPanelCharacterGeneric(_nativeObject.panelCharacter);
         panelCharacterAppearance = new SymbolPanelCharacterAppearanceGeneric(_nativeObject.panelCharacterAppearance);
         panelCharacterAppearancePhotographer = new SymbolPanelCharacterAppearancePhotographerGeneric(_nativeObject.panelCharacterAppearancePhotographer);
         panelCreateCharacter = new SymbolPanelCreateCharacterGeneric(_nativeObject.panelCreateCharacter);
         panelQuestProgress = new SymbolPanelQuestProgressGeneric(_nativeObject.panelQuestProgress);
         panelQuests = new SymbolPanelQuestsGeneric(_nativeObject.panelQuests);
         panelCitymap = new SymbolPanelCitymapGeneric(_nativeObject.panelCitymap);
         panelBattle = new SymbolPanelBattleGeneric(_nativeObject.panelBattle);
         panelStatQuest = new SymbolPanelStatQuestGeneric(_nativeObject.panelStatQuest);
         panelDuels = new SymbolPanelDuelsGeneric(_nativeObject.panelDuels);
         panelShop = new SymbolPanelShopGeneric(_nativeObject.panelShop);
         panelWorkNew = new SymbolPanelWorkNewGeneric(_nativeObject.panelWorkNew);
         panelMovieOffers = new SymbolPanelMovieOffersGeneric(_nativeObject.panelMovieOffers);
         panelMovieProgress = new SymbolPanelMovieProgressGeneric(_nativeObject.panelMovieProgress);
         panelGuild = new SymbolPanelGuildGeneric(_nativeObject.panelGuild);
         panelDungeon = new SymbolPanelDungeonGeneric(_nativeObject.panelDungeon);
         panelSlotMachine = new SymbolPanelSlotMachineGeneric(_nativeObject.panelSlotMachine);
         panelBaseUser = new SymbolPanelBaseUserGeneric(_nativeObject.panelBaseUser);
         panelBaseNoUser = new SymbolPanelBaseNoUserGeneric(_nativeObject.panelBaseNoUser);
         tutorial = new SymbolTutorialGeneric(_nativeObject.tutorial);
         friendbar = new FriendbarSymbolApplicationGeneric(_nativeObject.friendbar);
      }
      
      public function setNativeInstance(param1:SymbolPanels) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.backgroundFader)
         {
            backgroundFader.setNativeInstance(_nativeObject.backgroundFader);
         }
         if(_nativeObject.panelCharacter)
         {
            panelCharacter.setNativeInstance(_nativeObject.panelCharacter);
         }
         if(_nativeObject.panelCharacterAppearance)
         {
            panelCharacterAppearance.setNativeInstance(_nativeObject.panelCharacterAppearance);
         }
         if(_nativeObject.panelCharacterAppearancePhotographer)
         {
            panelCharacterAppearancePhotographer.setNativeInstance(_nativeObject.panelCharacterAppearancePhotographer);
         }
         if(_nativeObject.panelCreateCharacter)
         {
            panelCreateCharacter.setNativeInstance(_nativeObject.panelCreateCharacter);
         }
         if(_nativeObject.panelQuestProgress)
         {
            panelQuestProgress.setNativeInstance(_nativeObject.panelQuestProgress);
         }
         if(_nativeObject.panelQuests)
         {
            panelQuests.setNativeInstance(_nativeObject.panelQuests);
         }
         if(_nativeObject.panelCitymap)
         {
            panelCitymap.setNativeInstance(_nativeObject.panelCitymap);
         }
         if(_nativeObject.panelBattle)
         {
            panelBattle.setNativeInstance(_nativeObject.panelBattle);
         }
         if(_nativeObject.panelStatQuest)
         {
            panelStatQuest.setNativeInstance(_nativeObject.panelStatQuest);
         }
         if(_nativeObject.panelDuels)
         {
            panelDuels.setNativeInstance(_nativeObject.panelDuels);
         }
         if(_nativeObject.panelShop)
         {
            panelShop.setNativeInstance(_nativeObject.panelShop);
         }
         if(_nativeObject.panelWorkNew)
         {
            panelWorkNew.setNativeInstance(_nativeObject.panelWorkNew);
         }
         if(_nativeObject.panelMovieOffers)
         {
            panelMovieOffers.setNativeInstance(_nativeObject.panelMovieOffers);
         }
         if(_nativeObject.panelMovieProgress)
         {
            panelMovieProgress.setNativeInstance(_nativeObject.panelMovieProgress);
         }
         if(_nativeObject.panelGuild)
         {
            panelGuild.setNativeInstance(_nativeObject.panelGuild);
         }
         if(_nativeObject.panelDungeon)
         {
            panelDungeon.setNativeInstance(_nativeObject.panelDungeon);
         }
         if(_nativeObject.panelSlotMachine)
         {
            panelSlotMachine.setNativeInstance(_nativeObject.panelSlotMachine);
         }
         if(_nativeObject.panelBaseUser)
         {
            panelBaseUser.setNativeInstance(_nativeObject.panelBaseUser);
         }
         if(_nativeObject.panelBaseNoUser)
         {
            panelBaseNoUser.setNativeInstance(_nativeObject.panelBaseNoUser);
         }
         if(_nativeObject.tutorial)
         {
            tutorial.setNativeInstance(_nativeObject.tutorial);
         }
         if(_nativeObject.friendbar)
         {
            friendbar.setNativeInstance(_nativeObject.friendbar);
         }
      }
   }
}
