package visuals.ui.panels
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   import visuals.ui.elements.buttons.SymbolButtonHelpGeneric;
   import visuals.ui.elements.buttons.SymbolButtonMapGeneric;
   import visuals.ui.elements.buttons.SymbolButtonPlusStaticGeneric;
   import visuals.ui.elements.buttons.SymbolButtonQuestGeneric;
   import visuals.ui.elements.buttons.SymbolButtonUseResourceGeneric;
   import visuals.ui.elements.conventions.SymbolButtonConventionGeneric;
   import visuals.ui.elements.conventions.SymbolButtonConventionMultitaskingGeneric;
   import visuals.ui.elements.dating.SymbolButtonDatingGeneric;
   import visuals.ui.elements.dating.SymbolButtonDatingPicturesGeneric;
   import visuals.ui.elements.dungeon.SymbolButtonDungeonMultitaskingGeneric;
   import visuals.ui.elements.event.SymbolEventQuestButtonGeneric;
   import visuals.ui.elements.fan_foto.SymbolFanFotoProgressBarGeneric;
   import visuals.ui.elements.herobook.SymbolHerobookButtonGeneric;
   import visuals.ui.elements.icons.SymbolBoosterSenseGeneric;
   import visuals.ui.elements.quest.SymbolBasePanelBgEnergyGeneric;
   import visuals.ui.elements.quest.SymbolButtonDungeonKeyQuestGeneric;
   import visuals.ui.elements.quest.SymbolButtonMostCoinQuestGeneric;
   import visuals.ui.elements.quest.SymbolButtonMostXPQuestGeneric;
   import visuals.ui.elements.quest.SymbolButtonRefreshQuestsGeneric;
   import visuals.ui.elements.quest.SymbolButtonStoryDungeonKeyQuestGeneric;
   import visuals.ui.elements.quest.SymbolIconLockWorldmapGeneric;
   import visuals.ui.elements.storage.SymbolButtonEnergyStorageGeneric;
   import visuals.ui.elements.story_dungeon.SymbolButtonStoryDungeonGeneric;
   
   public class SymbolPanelQuestsGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolPanelQuests = null;
      
      public var conventionOverlay:SymbolDummyGeneric = null;
      
      public var storyDungeonOverlay:SymbolDummyGeneric = null;
      
      public var questArea:SymbolDummyGeneric = null;
      
      public var quest1:SymbolButtonQuestGeneric = null;
      
      public var quest2:SymbolButtonQuestGeneric = null;
      
      public var quest3:SymbolButtonQuestGeneric = null;
      
      public var quest4:SymbolButtonQuestGeneric = null;
      
      public var convention:SymbolButtonConventionGeneric = null;
      
      public var storyDungeon:SymbolButtonStoryDungeonGeneric = null;
      
      public var dating:SymbolButtonDatingGeneric = null;
      
      public var btnHelp:SymbolButtonHelpGeneric = null;
      
      public var txtStageName:ILabel = null;
      
      public var txtUpcomingStage:ILabelArea = null;
      
      public var btnCitymap:SymbolButtonMapGeneric = null;
      
      public var iconLockWorldmap:SymbolIconLockWorldmapGeneric = null;
      
      public var buttonLayer:SymbolDummyGeneric = null;
      
      public var iconEnergy:SymbolBasePanelBgEnergyGeneric = null;
      
      public var btnRefreshQuests:SymbolButtonRefreshQuestsGeneric = null;
      
      public var btnMostXPQuest:SymbolButtonMostXPQuestGeneric = null;
      
      public var btnMostCoinQuest:SymbolButtonMostCoinQuestGeneric = null;
      
      public var btnDungeonKeyQuest:SymbolButtonDungeonKeyQuestGeneric = null;
      
      public var btnRepeatStoryDungeonKeyQuest:SymbolButtonStoryDungeonKeyQuestGeneric = null;
      
      public var btnRepeatDatingKeyQuest:SymbolButtonStoryDungeonKeyQuestGeneric = null;
      
      public var btnSenseBoosterIcon:SymbolBoosterSenseGeneric = null;
      
      public var btnUseResource:SymbolButtonUseResourceGeneric = null;
      
      public var btnSlotMachine:SymbolButtonUseResourceGeneric = null;
      
      public var txtEnergyLeft:ILabel = null;
      
      public var btnBuyEnergy:SymbolButtonPlusStaticGeneric = null;
      
      public var btnEventQuest:SymbolEventQuestButtonGeneric = null;
      
      public var btnEnergyStorage:SymbolButtonEnergyStorageGeneric = null;
      
      public var btnDatingPictures:SymbolButtonDatingPicturesGeneric = null;
      
      public var fanFoto:SymbolFanFotoProgressBarGeneric = null;
      
      public var btnHerobook:SymbolHerobookButtonGeneric = null;
      
      public var btnConventionMultitasking:SymbolButtonConventionMultitaskingGeneric = null;
      
      public var btnDungeonMultitasking:SymbolButtonDungeonMultitaskingGeneric = null;
      
      public function SymbolPanelQuestsGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolPanelQuests;
         }
         else
         {
            _nativeObject = new SymbolPanelQuests();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         conventionOverlay = new SymbolDummyGeneric(_nativeObject.conventionOverlay);
         storyDungeonOverlay = new SymbolDummyGeneric(_nativeObject.storyDungeonOverlay);
         questArea = new SymbolDummyGeneric(_nativeObject.questArea);
         quest1 = new SymbolButtonQuestGeneric(_nativeObject.quest1);
         quest2 = new SymbolButtonQuestGeneric(_nativeObject.quest2);
         quest3 = new SymbolButtonQuestGeneric(_nativeObject.quest3);
         quest4 = new SymbolButtonQuestGeneric(_nativeObject.quest4);
         convention = new SymbolButtonConventionGeneric(_nativeObject.convention);
         storyDungeon = new SymbolButtonStoryDungeonGeneric(_nativeObject.storyDungeon);
         dating = new SymbolButtonDatingGeneric(_nativeObject.dating);
         btnHelp = new SymbolButtonHelpGeneric(_nativeObject.btnHelp);
         txtStageName = FlashLabel.fromNative(_nativeObject.txtStageName);
         txtUpcomingStage = FlashLabelArea.fromNative(_nativeObject.txtUpcomingStage);
         btnCitymap = new SymbolButtonMapGeneric(_nativeObject.btnCitymap);
         iconLockWorldmap = new SymbolIconLockWorldmapGeneric(_nativeObject.iconLockWorldmap);
         buttonLayer = new SymbolDummyGeneric(_nativeObject.buttonLayer);
         iconEnergy = new SymbolBasePanelBgEnergyGeneric(_nativeObject.iconEnergy);
         btnRefreshQuests = new SymbolButtonRefreshQuestsGeneric(_nativeObject.btnRefreshQuests);
         btnMostXPQuest = new SymbolButtonMostXPQuestGeneric(_nativeObject.btnMostXPQuest);
         btnMostCoinQuest = new SymbolButtonMostCoinQuestGeneric(_nativeObject.btnMostCoinQuest);
         btnDungeonKeyQuest = new SymbolButtonDungeonKeyQuestGeneric(_nativeObject.btnDungeonKeyQuest);
         btnRepeatStoryDungeonKeyQuest = new SymbolButtonStoryDungeonKeyQuestGeneric(_nativeObject.btnRepeatStoryDungeonKeyQuest);
         btnRepeatDatingKeyQuest = new SymbolButtonStoryDungeonKeyQuestGeneric(_nativeObject.btnRepeatDatingKeyQuest);
         btnSenseBoosterIcon = new SymbolBoosterSenseGeneric(_nativeObject.btnSenseBoosterIcon);
         btnUseResource = new SymbolButtonUseResourceGeneric(_nativeObject.btnUseResource);
         btnSlotMachine = new SymbolButtonUseResourceGeneric(_nativeObject.btnSlotMachine);
         txtEnergyLeft = FlashLabel.fromNative(_nativeObject.txtEnergyLeft);
         btnBuyEnergy = new SymbolButtonPlusStaticGeneric(_nativeObject.btnBuyEnergy);
         btnEventQuest = new SymbolEventQuestButtonGeneric(_nativeObject.btnEventQuest);
         btnEnergyStorage = new SymbolButtonEnergyStorageGeneric(_nativeObject.btnEnergyStorage);
         btnDatingPictures = new SymbolButtonDatingPicturesGeneric(_nativeObject.btnDatingPictures);
         fanFoto = new SymbolFanFotoProgressBarGeneric(_nativeObject.fanFoto);
         btnHerobook = new SymbolHerobookButtonGeneric(_nativeObject.btnHerobook);
         btnConventionMultitasking = new SymbolButtonConventionMultitaskingGeneric(_nativeObject.btnConventionMultitasking);
         btnDungeonMultitasking = new SymbolButtonDungeonMultitaskingGeneric(_nativeObject.btnDungeonMultitasking);
      }
      
      public function setNativeInstance(param1:SymbolPanelQuests) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.conventionOverlay)
         {
            conventionOverlay.setNativeInstance(_nativeObject.conventionOverlay);
         }
         if(_nativeObject.storyDungeonOverlay)
         {
            storyDungeonOverlay.setNativeInstance(_nativeObject.storyDungeonOverlay);
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
         if(_nativeObject.quest4)
         {
            quest4.setNativeInstance(_nativeObject.quest4);
         }
         if(_nativeObject.convention)
         {
            convention.setNativeInstance(_nativeObject.convention);
         }
         if(_nativeObject.storyDungeon)
         {
            storyDungeon.setNativeInstance(_nativeObject.storyDungeon);
         }
         if(_nativeObject.dating)
         {
            dating.setNativeInstance(_nativeObject.dating);
         }
         if(_nativeObject.btnHelp)
         {
            btnHelp.setNativeInstance(_nativeObject.btnHelp);
         }
         FlashLabel.setNativeInstance(txtStageName,_nativeObject.txtStageName);
         FlashLabelArea.setNativeInstance(txtUpcomingStage,_nativeObject.txtUpcomingStage);
         if(_nativeObject.btnCitymap)
         {
            btnCitymap.setNativeInstance(_nativeObject.btnCitymap);
         }
         if(_nativeObject.iconLockWorldmap)
         {
            iconLockWorldmap.setNativeInstance(_nativeObject.iconLockWorldmap);
         }
         if(_nativeObject.buttonLayer)
         {
            buttonLayer.setNativeInstance(_nativeObject.buttonLayer);
         }
         if(_nativeObject.iconEnergy)
         {
            iconEnergy.setNativeInstance(_nativeObject.iconEnergy);
         }
         if(_nativeObject.btnRefreshQuests)
         {
            btnRefreshQuests.setNativeInstance(_nativeObject.btnRefreshQuests);
         }
         if(_nativeObject.btnMostXPQuest)
         {
            btnMostXPQuest.setNativeInstance(_nativeObject.btnMostXPQuest);
         }
         if(_nativeObject.btnMostCoinQuest)
         {
            btnMostCoinQuest.setNativeInstance(_nativeObject.btnMostCoinQuest);
         }
         if(_nativeObject.btnDungeonKeyQuest)
         {
            btnDungeonKeyQuest.setNativeInstance(_nativeObject.btnDungeonKeyQuest);
         }
         if(_nativeObject.btnRepeatStoryDungeonKeyQuest)
         {
            btnRepeatStoryDungeonKeyQuest.setNativeInstance(_nativeObject.btnRepeatStoryDungeonKeyQuest);
         }
         if(_nativeObject.btnRepeatDatingKeyQuest)
         {
            btnRepeatDatingKeyQuest.setNativeInstance(_nativeObject.btnRepeatDatingKeyQuest);
         }
         if(_nativeObject.btnSenseBoosterIcon)
         {
            btnSenseBoosterIcon.setNativeInstance(_nativeObject.btnSenseBoosterIcon);
         }
         if(_nativeObject.btnUseResource)
         {
            btnUseResource.setNativeInstance(_nativeObject.btnUseResource);
         }
         if(_nativeObject.btnSlotMachine)
         {
            btnSlotMachine.setNativeInstance(_nativeObject.btnSlotMachine);
         }
         FlashLabel.setNativeInstance(txtEnergyLeft,_nativeObject.txtEnergyLeft);
         if(_nativeObject.btnBuyEnergy)
         {
            btnBuyEnergy.setNativeInstance(_nativeObject.btnBuyEnergy);
         }
         if(_nativeObject.btnEventQuest)
         {
            btnEventQuest.setNativeInstance(_nativeObject.btnEventQuest);
         }
         if(_nativeObject.btnEnergyStorage)
         {
            btnEnergyStorage.setNativeInstance(_nativeObject.btnEnergyStorage);
         }
         if(_nativeObject.btnDatingPictures)
         {
            btnDatingPictures.setNativeInstance(_nativeObject.btnDatingPictures);
         }
         if(_nativeObject.fanFoto)
         {
            fanFoto.setNativeInstance(_nativeObject.fanFoto);
         }
         if(_nativeObject.btnHerobook)
         {
            btnHerobook.setNativeInstance(_nativeObject.btnHerobook);
         }
         if(_nativeObject.btnConventionMultitasking)
         {
            btnConventionMultitasking.setNativeInstance(_nativeObject.btnConventionMultitasking);
         }
         if(_nativeObject.btnDungeonMultitasking)
         {
            btnDungeonMultitasking.setNativeInstance(_nativeObject.btnDungeonMultitasking);
         }
      }
   }
}
