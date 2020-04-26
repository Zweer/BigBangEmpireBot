package visuals.ui.panels
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   import visuals.ui.elements.buttons.SymbolButtonQuestMultitaskingGeneric;
   import visuals.ui.elements.buttons.SymbolButtonUseResourceGeneric;
   import visuals.ui.elements.buttons.SymbolButtonVideoAdvertismentGeneric;
   import visuals.ui.elements.conventions.SymbolButtonConventionMultitaskingGeneric;
   import visuals.ui.elements.dungeon.SymbolButtonDungeonMultitaskingGeneric;
   import visuals.ui.elements.event.SymbolEventQuestButtonGeneric;
   import visuals.ui.elements.herobook.SymbolHerobookButtonGeneric;
   import visuals.ui.elements.quest.SymbolBasePanelBgEnergyGeneric;
   import visuals.ui.elements.quest.SymbolGameTipGeneric;
   import visuals.ui.elements.quest.SymbolLetterboxGeneric;
   import visuals.ui.elements.quest.SymbolQuestProgressContentGeneric;
   import visuals.ui.elements.user_story.SymbolButtonUserStoryGeneric;
   
   public class SymbolPanelQuestProgressGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolPanelQuestProgress = null;
      
      public var storyDungeonOverlay:SymbolDummyGeneric = null;
      
      public var conventionOverlay:SymbolDummyGeneric = null;
      
      public var letterbox:SymbolLetterboxGeneric = null;
      
      public var content:SymbolQuestProgressContentGeneric = null;
      
      public var gameTip:SymbolGameTipGeneric = null;
      
      public var iconEnergy:SymbolBasePanelBgEnergyGeneric = null;
      
      public var txtEnergyLeft:ILabel = null;
      
      public var btnShowVideoAdvertisment:SymbolButtonVideoAdvertismentGeneric = null;
      
      public var btnUseResource:SymbolButtonUseResourceGeneric = null;
      
      public var btnEventQuest:SymbolEventQuestButtonGeneric = null;
      
      public var btnHerobook:SymbolHerobookButtonGeneric = null;
      
      public var btnQuestMultitasking:SymbolButtonQuestMultitaskingGeneric = null;
      
      public var btnDungeonMultitasking:SymbolButtonDungeonMultitaskingGeneric = null;
      
      public var btnConventionMultitasking:SymbolButtonConventionMultitaskingGeneric = null;
      
      public var btnUserStory:SymbolButtonUserStoryGeneric = null;
      
      public function SymbolPanelQuestProgressGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolPanelQuestProgress;
         }
         else
         {
            _nativeObject = new SymbolPanelQuestProgress();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         storyDungeonOverlay = new SymbolDummyGeneric(_nativeObject.storyDungeonOverlay);
         conventionOverlay = new SymbolDummyGeneric(_nativeObject.conventionOverlay);
         letterbox = new SymbolLetterboxGeneric(_nativeObject.letterbox);
         content = new SymbolQuestProgressContentGeneric(_nativeObject.content);
         gameTip = new SymbolGameTipGeneric(_nativeObject.gameTip);
         iconEnergy = new SymbolBasePanelBgEnergyGeneric(_nativeObject.iconEnergy);
         txtEnergyLeft = FlashLabel.fromNative(_nativeObject.txtEnergyLeft);
         btnShowVideoAdvertisment = new SymbolButtonVideoAdvertismentGeneric(_nativeObject.btnShowVideoAdvertisment);
         btnUseResource = new SymbolButtonUseResourceGeneric(_nativeObject.btnUseResource);
         btnEventQuest = new SymbolEventQuestButtonGeneric(_nativeObject.btnEventQuest);
         btnHerobook = new SymbolHerobookButtonGeneric(_nativeObject.btnHerobook);
         btnQuestMultitasking = new SymbolButtonQuestMultitaskingGeneric(_nativeObject.btnQuestMultitasking);
         btnDungeonMultitasking = new SymbolButtonDungeonMultitaskingGeneric(_nativeObject.btnDungeonMultitasking);
         btnConventionMultitasking = new SymbolButtonConventionMultitaskingGeneric(_nativeObject.btnConventionMultitasking);
         btnUserStory = new SymbolButtonUserStoryGeneric(_nativeObject.btnUserStory);
      }
      
      public function setNativeInstance(param1:SymbolPanelQuestProgress) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.storyDungeonOverlay)
         {
            storyDungeonOverlay.setNativeInstance(_nativeObject.storyDungeonOverlay);
         }
         if(_nativeObject.conventionOverlay)
         {
            conventionOverlay.setNativeInstance(_nativeObject.conventionOverlay);
         }
         if(_nativeObject.letterbox)
         {
            letterbox.setNativeInstance(_nativeObject.letterbox);
         }
         if(_nativeObject.content)
         {
            content.setNativeInstance(_nativeObject.content);
         }
         if(_nativeObject.gameTip)
         {
            gameTip.setNativeInstance(_nativeObject.gameTip);
         }
         if(_nativeObject.iconEnergy)
         {
            iconEnergy.setNativeInstance(_nativeObject.iconEnergy);
         }
         FlashLabel.setNativeInstance(txtEnergyLeft,_nativeObject.txtEnergyLeft);
         if(_nativeObject.btnShowVideoAdvertisment)
         {
            btnShowVideoAdvertisment.setNativeInstance(_nativeObject.btnShowVideoAdvertisment);
         }
         if(_nativeObject.btnUseResource)
         {
            btnUseResource.setNativeInstance(_nativeObject.btnUseResource);
         }
         if(_nativeObject.btnEventQuest)
         {
            btnEventQuest.setNativeInstance(_nativeObject.btnEventQuest);
         }
         if(_nativeObject.btnHerobook)
         {
            btnHerobook.setNativeInstance(_nativeObject.btnHerobook);
         }
         if(_nativeObject.btnQuestMultitasking)
         {
            btnQuestMultitasking.setNativeInstance(_nativeObject.btnQuestMultitasking);
         }
         if(_nativeObject.btnDungeonMultitasking)
         {
            btnDungeonMultitasking.setNativeInstance(_nativeObject.btnDungeonMultitasking);
         }
         if(_nativeObject.btnConventionMultitasking)
         {
            btnConventionMultitasking.setNativeInstance(_nativeObject.btnConventionMultitasking);
         }
         if(_nativeObject.btnUserStory)
         {
            btnUserStory.setNativeInstance(_nativeObject.btnUserStory);
         }
      }
   }
}
