package visuals.ui.elements.citymap
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.avatar.SymbolAvatarImagePlaceholderGeneric;
   
   public class SymbolCitymapContentGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolCitymapContent = null;
      
      public var progressPoints:SymbolCitymapProgressPointsGeneric = null;
      
      public var customStageLocation100:SymbolCitymapButtonLocationOliviaJonesGeneric = null;
      
      public var location1:SymbolCitymapButtonLocation1Generic = null;
      
      public var location2:SymbolCitymapButtonLocation2Generic = null;
      
      public var location4:SymbolCitymapButtonLocation4Generic = null;
      
      public var location5:SymbolCitymapButtonLocation5Generic = null;
      
      public var dungeon_burning_bernie:SymbolCitymapButtonDungeonBurningWomanGeneric = null;
      
      public var dungeon_flaming_wheels:SymbolCitymapButtonDungeonFlamingWheelsGeneric = null;
      
      public var location8:SymbolCitymapButtonLocation8Generic = null;
      
      public var location3:SymbolCitymapButtonLocation3Generic = null;
      
      public var dungeon_whiplash:SymbolCitymapButtonDungeonWhiplashGeneric = null;
      
      public var location6:SymbolCitymapButtonLocation6Generic = null;
      
      public var location7:SymbolCitymapButtonLocation7Generic = null;
      
      public var location9:SymbolCitymapButtonLocation9Generic = null;
      
      public var questStage1:SymbolCitymapIconQuestGeneric = null;
      
      public var questStage2:SymbolCitymapIconQuestGeneric = null;
      
      public var questStage3:SymbolCitymapIconQuestGeneric = null;
      
      public var questStage4:SymbolCitymapIconQuestGeneric = null;
      
      public var questStage5:SymbolCitymapIconQuestGeneric = null;
      
      public var questStage6:SymbolCitymapIconQuestGeneric = null;
      
      public var customStageQuest100:SymbolCitymapIconQuestGeneric = null;
      
      public var questStage7:SymbolCitymapIconQuestGeneric = null;
      
      public var questStage8:SymbolCitymapIconQuestGeneric = null;
      
      public var questStage9:SymbolCitymapIconQuestGeneric = null;
      
      public var stage3Rewards:SymbolCitymapStageRewardGeneric = null;
      
      public var stage1Rewards:SymbolCitymapStageRewardGeneric = null;
      
      public var stage2Rewards:SymbolCitymapStageRewardGeneric = null;
      
      public var stage4Rewards:SymbolCitymapStageRewardGeneric = null;
      
      public var stage5Rewards:SymbolCitymapStageRewardGeneric = null;
      
      public var stage6Rewards:SymbolCitymapStageRewardGeneric = null;
      
      public var customStage100Rewards:SymbolCitymapStageRewardGeneric = null;
      
      public var stage7Rewards:SymbolCitymapStageRewardGeneric = null;
      
      public var stage8Rewards:SymbolCitymapStageRewardGeneric = null;
      
      public var stage9Rewards:SymbolCitymapStageRewardGeneric = null;
      
      public var conventionEventStage4:SymbolCitymapIconConventionGeneric = null;
      
      public var customStageConventionEventStage100:SymbolCitymapIconConventionGeneric = null;
      
      public var conventionEventStage2:SymbolCitymapIconConventionGeneric = null;
      
      public var conventionEventStage3:SymbolCitymapIconConventionGeneric = null;
      
      public var conventionEventStage5:SymbolCitymapIconConventionGeneric = null;
      
      public var conventionEventStage6:SymbolCitymapIconConventionGeneric = null;
      
      public var conventionEventStage1:SymbolCitymapIconConventionGeneric = null;
      
      public var conventionEventStage7:SymbolCitymapIconConventionGeneric = null;
      
      public var conventionEventStage8:SymbolCitymapIconConventionGeneric = null;
      
      public var conventionEventStage9:SymbolCitymapIconConventionGeneric = null;
      
      public var storyDungeonStage1:SymbolCitymapIconStoryDungeonGeneric = null;
      
      public var storyDungeonStage2:SymbolCitymapIconStoryDungeonGeneric = null;
      
      public var storyDungeonStage3:SymbolCitymapIconStoryDungeonGeneric = null;
      
      public var storyDungeonStage4:SymbolCitymapIconStoryDungeonGeneric = null;
      
      public var storyDungeonStage5:SymbolCitymapIconStoryDungeonGeneric = null;
      
      public var storyDungeonStage6:SymbolCitymapIconStoryDungeonGeneric = null;
      
      public var storyDungeonStage7:SymbolCitymapIconStoryDungeonGeneric = null;
      
      public var customStageStoryDungeonStage100:SymbolCitymapIconStoryDungeonGeneric = null;
      
      public var storyDungeonStage8:SymbolCitymapIconStoryDungeonGeneric = null;
      
      public var storyDungeonStage9:SymbolCitymapIconStoryDungeonGeneric = null;
      
      public var datingStage1:SymbolCitymapIconDatingGeneric = null;
      
      public var customStageDatingStage100:SymbolCitymapIconDatingGeneric = null;
      
      public var datingStage2:SymbolCitymapIconDatingGeneric = null;
      
      public var datingStage3:SymbolCitymapIconDatingGeneric = null;
      
      public var datingStage4:SymbolCitymapIconDatingGeneric = null;
      
      public var datingStage7:SymbolCitymapIconDatingGeneric = null;
      
      public var datingStage5:SymbolCitymapIconDatingGeneric = null;
      
      public var datingStage6:SymbolCitymapIconDatingGeneric = null;
      
      public var datingStage8:SymbolCitymapIconDatingGeneric = null;
      
      public var datingStage9:SymbolCitymapIconDatingGeneric = null;
      
      public var imageAvatarPlaceholder:SymbolAvatarImagePlaceholderGeneric = null;
      
      public var clouds:SymbolCitymapCloudsLayerGeneric = null;
      
      public function SymbolCitymapContentGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolCitymapContent;
         }
         else
         {
            _nativeObject = new SymbolCitymapContent();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         progressPoints = new SymbolCitymapProgressPointsGeneric(_nativeObject.progressPoints);
         customStageLocation100 = new SymbolCitymapButtonLocationOliviaJonesGeneric(_nativeObject.customStageLocation100);
         location1 = new SymbolCitymapButtonLocation1Generic(_nativeObject.location1);
         location2 = new SymbolCitymapButtonLocation2Generic(_nativeObject.location2);
         location4 = new SymbolCitymapButtonLocation4Generic(_nativeObject.location4);
         location5 = new SymbolCitymapButtonLocation5Generic(_nativeObject.location5);
         dungeon_burning_bernie = new SymbolCitymapButtonDungeonBurningWomanGeneric(_nativeObject.dungeon_burning_bernie);
         dungeon_flaming_wheels = new SymbolCitymapButtonDungeonFlamingWheelsGeneric(_nativeObject.dungeon_flaming_wheels);
         location8 = new SymbolCitymapButtonLocation8Generic(_nativeObject.location8);
         location3 = new SymbolCitymapButtonLocation3Generic(_nativeObject.location3);
         dungeon_whiplash = new SymbolCitymapButtonDungeonWhiplashGeneric(_nativeObject.dungeon_whiplash);
         location6 = new SymbolCitymapButtonLocation6Generic(_nativeObject.location6);
         location7 = new SymbolCitymapButtonLocation7Generic(_nativeObject.location7);
         location9 = new SymbolCitymapButtonLocation9Generic(_nativeObject.location9);
         questStage1 = new SymbolCitymapIconQuestGeneric(_nativeObject.questStage1);
         questStage2 = new SymbolCitymapIconQuestGeneric(_nativeObject.questStage2);
         questStage3 = new SymbolCitymapIconQuestGeneric(_nativeObject.questStage3);
         questStage4 = new SymbolCitymapIconQuestGeneric(_nativeObject.questStage4);
         questStage5 = new SymbolCitymapIconQuestGeneric(_nativeObject.questStage5);
         questStage6 = new SymbolCitymapIconQuestGeneric(_nativeObject.questStage6);
         customStageQuest100 = new SymbolCitymapIconQuestGeneric(_nativeObject.customStageQuest100);
         questStage7 = new SymbolCitymapIconQuestGeneric(_nativeObject.questStage7);
         questStage8 = new SymbolCitymapIconQuestGeneric(_nativeObject.questStage8);
         questStage9 = new SymbolCitymapIconQuestGeneric(_nativeObject.questStage9);
         stage3Rewards = new SymbolCitymapStageRewardGeneric(_nativeObject.stage3Rewards);
         stage1Rewards = new SymbolCitymapStageRewardGeneric(_nativeObject.stage1Rewards);
         stage2Rewards = new SymbolCitymapStageRewardGeneric(_nativeObject.stage2Rewards);
         stage4Rewards = new SymbolCitymapStageRewardGeneric(_nativeObject.stage4Rewards);
         stage5Rewards = new SymbolCitymapStageRewardGeneric(_nativeObject.stage5Rewards);
         stage6Rewards = new SymbolCitymapStageRewardGeneric(_nativeObject.stage6Rewards);
         customStage100Rewards = new SymbolCitymapStageRewardGeneric(_nativeObject.customStage100Rewards);
         stage7Rewards = new SymbolCitymapStageRewardGeneric(_nativeObject.stage7Rewards);
         stage8Rewards = new SymbolCitymapStageRewardGeneric(_nativeObject.stage8Rewards);
         stage9Rewards = new SymbolCitymapStageRewardGeneric(_nativeObject.stage9Rewards);
         conventionEventStage4 = new SymbolCitymapIconConventionGeneric(_nativeObject.conventionEventStage4);
         customStageConventionEventStage100 = new SymbolCitymapIconConventionGeneric(_nativeObject.customStageConventionEventStage100);
         conventionEventStage2 = new SymbolCitymapIconConventionGeneric(_nativeObject.conventionEventStage2);
         conventionEventStage3 = new SymbolCitymapIconConventionGeneric(_nativeObject.conventionEventStage3);
         conventionEventStage5 = new SymbolCitymapIconConventionGeneric(_nativeObject.conventionEventStage5);
         conventionEventStage6 = new SymbolCitymapIconConventionGeneric(_nativeObject.conventionEventStage6);
         conventionEventStage1 = new SymbolCitymapIconConventionGeneric(_nativeObject.conventionEventStage1);
         conventionEventStage7 = new SymbolCitymapIconConventionGeneric(_nativeObject.conventionEventStage7);
         conventionEventStage8 = new SymbolCitymapIconConventionGeneric(_nativeObject.conventionEventStage8);
         conventionEventStage9 = new SymbolCitymapIconConventionGeneric(_nativeObject.conventionEventStage9);
         storyDungeonStage1 = new SymbolCitymapIconStoryDungeonGeneric(_nativeObject.storyDungeonStage1);
         storyDungeonStage2 = new SymbolCitymapIconStoryDungeonGeneric(_nativeObject.storyDungeonStage2);
         storyDungeonStage3 = new SymbolCitymapIconStoryDungeonGeneric(_nativeObject.storyDungeonStage3);
         storyDungeonStage4 = new SymbolCitymapIconStoryDungeonGeneric(_nativeObject.storyDungeonStage4);
         storyDungeonStage5 = new SymbolCitymapIconStoryDungeonGeneric(_nativeObject.storyDungeonStage5);
         storyDungeonStage6 = new SymbolCitymapIconStoryDungeonGeneric(_nativeObject.storyDungeonStage6);
         storyDungeonStage7 = new SymbolCitymapIconStoryDungeonGeneric(_nativeObject.storyDungeonStage7);
         customStageStoryDungeonStage100 = new SymbolCitymapIconStoryDungeonGeneric(_nativeObject.customStageStoryDungeonStage100);
         storyDungeonStage8 = new SymbolCitymapIconStoryDungeonGeneric(_nativeObject.storyDungeonStage8);
         storyDungeonStage9 = new SymbolCitymapIconStoryDungeonGeneric(_nativeObject.storyDungeonStage9);
         datingStage1 = new SymbolCitymapIconDatingGeneric(_nativeObject.datingStage1);
         customStageDatingStage100 = new SymbolCitymapIconDatingGeneric(_nativeObject.customStageDatingStage100);
         datingStage2 = new SymbolCitymapIconDatingGeneric(_nativeObject.datingStage2);
         datingStage3 = new SymbolCitymapIconDatingGeneric(_nativeObject.datingStage3);
         datingStage4 = new SymbolCitymapIconDatingGeneric(_nativeObject.datingStage4);
         datingStage7 = new SymbolCitymapIconDatingGeneric(_nativeObject.datingStage7);
         datingStage5 = new SymbolCitymapIconDatingGeneric(_nativeObject.datingStage5);
         datingStage6 = new SymbolCitymapIconDatingGeneric(_nativeObject.datingStage6);
         datingStage8 = new SymbolCitymapIconDatingGeneric(_nativeObject.datingStage8);
         datingStage9 = new SymbolCitymapIconDatingGeneric(_nativeObject.datingStage9);
         imageAvatarPlaceholder = new SymbolAvatarImagePlaceholderGeneric(_nativeObject.imageAvatarPlaceholder);
         clouds = new SymbolCitymapCloudsLayerGeneric(_nativeObject.clouds);
      }
      
      public function setNativeInstance(param1:SymbolCitymapContent) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.progressPoints)
         {
            progressPoints.setNativeInstance(_nativeObject.progressPoints);
         }
         if(_nativeObject.customStageLocation100)
         {
            customStageLocation100.setNativeInstance(_nativeObject.customStageLocation100);
         }
         if(_nativeObject.location1)
         {
            location1.setNativeInstance(_nativeObject.location1);
         }
         if(_nativeObject.location2)
         {
            location2.setNativeInstance(_nativeObject.location2);
         }
         if(_nativeObject.location4)
         {
            location4.setNativeInstance(_nativeObject.location4);
         }
         if(_nativeObject.location5)
         {
            location5.setNativeInstance(_nativeObject.location5);
         }
         if(_nativeObject.dungeon_burning_bernie)
         {
            dungeon_burning_bernie.setNativeInstance(_nativeObject.dungeon_burning_bernie);
         }
         if(_nativeObject.dungeon_flaming_wheels)
         {
            dungeon_flaming_wheels.setNativeInstance(_nativeObject.dungeon_flaming_wheels);
         }
         if(_nativeObject.location8)
         {
            location8.setNativeInstance(_nativeObject.location8);
         }
         if(_nativeObject.location3)
         {
            location3.setNativeInstance(_nativeObject.location3);
         }
         if(_nativeObject.dungeon_whiplash)
         {
            dungeon_whiplash.setNativeInstance(_nativeObject.dungeon_whiplash);
         }
         if(_nativeObject.location6)
         {
            location6.setNativeInstance(_nativeObject.location6);
         }
         if(_nativeObject.location7)
         {
            location7.setNativeInstance(_nativeObject.location7);
         }
         if(_nativeObject.location9)
         {
            location9.setNativeInstance(_nativeObject.location9);
         }
         if(_nativeObject.questStage1)
         {
            questStage1.setNativeInstance(_nativeObject.questStage1);
         }
         if(_nativeObject.questStage2)
         {
            questStage2.setNativeInstance(_nativeObject.questStage2);
         }
         if(_nativeObject.questStage3)
         {
            questStage3.setNativeInstance(_nativeObject.questStage3);
         }
         if(_nativeObject.questStage4)
         {
            questStage4.setNativeInstance(_nativeObject.questStage4);
         }
         if(_nativeObject.questStage5)
         {
            questStage5.setNativeInstance(_nativeObject.questStage5);
         }
         if(_nativeObject.questStage6)
         {
            questStage6.setNativeInstance(_nativeObject.questStage6);
         }
         if(_nativeObject.customStageQuest100)
         {
            customStageQuest100.setNativeInstance(_nativeObject.customStageQuest100);
         }
         if(_nativeObject.questStage7)
         {
            questStage7.setNativeInstance(_nativeObject.questStage7);
         }
         if(_nativeObject.questStage8)
         {
            questStage8.setNativeInstance(_nativeObject.questStage8);
         }
         if(_nativeObject.questStage9)
         {
            questStage9.setNativeInstance(_nativeObject.questStage9);
         }
         if(_nativeObject.stage3Rewards)
         {
            stage3Rewards.setNativeInstance(_nativeObject.stage3Rewards);
         }
         if(_nativeObject.stage1Rewards)
         {
            stage1Rewards.setNativeInstance(_nativeObject.stage1Rewards);
         }
         if(_nativeObject.stage2Rewards)
         {
            stage2Rewards.setNativeInstance(_nativeObject.stage2Rewards);
         }
         if(_nativeObject.stage4Rewards)
         {
            stage4Rewards.setNativeInstance(_nativeObject.stage4Rewards);
         }
         if(_nativeObject.stage5Rewards)
         {
            stage5Rewards.setNativeInstance(_nativeObject.stage5Rewards);
         }
         if(_nativeObject.stage6Rewards)
         {
            stage6Rewards.setNativeInstance(_nativeObject.stage6Rewards);
         }
         if(_nativeObject.customStage100Rewards)
         {
            customStage100Rewards.setNativeInstance(_nativeObject.customStage100Rewards);
         }
         if(_nativeObject.stage7Rewards)
         {
            stage7Rewards.setNativeInstance(_nativeObject.stage7Rewards);
         }
         if(_nativeObject.stage8Rewards)
         {
            stage8Rewards.setNativeInstance(_nativeObject.stage8Rewards);
         }
         if(_nativeObject.stage9Rewards)
         {
            stage9Rewards.setNativeInstance(_nativeObject.stage9Rewards);
         }
         if(_nativeObject.conventionEventStage4)
         {
            conventionEventStage4.setNativeInstance(_nativeObject.conventionEventStage4);
         }
         if(_nativeObject.customStageConventionEventStage100)
         {
            customStageConventionEventStage100.setNativeInstance(_nativeObject.customStageConventionEventStage100);
         }
         if(_nativeObject.conventionEventStage2)
         {
            conventionEventStage2.setNativeInstance(_nativeObject.conventionEventStage2);
         }
         if(_nativeObject.conventionEventStage3)
         {
            conventionEventStage3.setNativeInstance(_nativeObject.conventionEventStage3);
         }
         if(_nativeObject.conventionEventStage5)
         {
            conventionEventStage5.setNativeInstance(_nativeObject.conventionEventStage5);
         }
         if(_nativeObject.conventionEventStage6)
         {
            conventionEventStage6.setNativeInstance(_nativeObject.conventionEventStage6);
         }
         if(_nativeObject.conventionEventStage1)
         {
            conventionEventStage1.setNativeInstance(_nativeObject.conventionEventStage1);
         }
         if(_nativeObject.conventionEventStage7)
         {
            conventionEventStage7.setNativeInstance(_nativeObject.conventionEventStage7);
         }
         if(_nativeObject.conventionEventStage8)
         {
            conventionEventStage8.setNativeInstance(_nativeObject.conventionEventStage8);
         }
         if(_nativeObject.conventionEventStage9)
         {
            conventionEventStage9.setNativeInstance(_nativeObject.conventionEventStage9);
         }
         if(_nativeObject.storyDungeonStage1)
         {
            storyDungeonStage1.setNativeInstance(_nativeObject.storyDungeonStage1);
         }
         if(_nativeObject.storyDungeonStage2)
         {
            storyDungeonStage2.setNativeInstance(_nativeObject.storyDungeonStage2);
         }
         if(_nativeObject.storyDungeonStage3)
         {
            storyDungeonStage3.setNativeInstance(_nativeObject.storyDungeonStage3);
         }
         if(_nativeObject.storyDungeonStage4)
         {
            storyDungeonStage4.setNativeInstance(_nativeObject.storyDungeonStage4);
         }
         if(_nativeObject.storyDungeonStage5)
         {
            storyDungeonStage5.setNativeInstance(_nativeObject.storyDungeonStage5);
         }
         if(_nativeObject.storyDungeonStage6)
         {
            storyDungeonStage6.setNativeInstance(_nativeObject.storyDungeonStage6);
         }
         if(_nativeObject.storyDungeonStage7)
         {
            storyDungeonStage7.setNativeInstance(_nativeObject.storyDungeonStage7);
         }
         if(_nativeObject.customStageStoryDungeonStage100)
         {
            customStageStoryDungeonStage100.setNativeInstance(_nativeObject.customStageStoryDungeonStage100);
         }
         if(_nativeObject.storyDungeonStage8)
         {
            storyDungeonStage8.setNativeInstance(_nativeObject.storyDungeonStage8);
         }
         if(_nativeObject.storyDungeonStage9)
         {
            storyDungeonStage9.setNativeInstance(_nativeObject.storyDungeonStage9);
         }
         if(_nativeObject.datingStage1)
         {
            datingStage1.setNativeInstance(_nativeObject.datingStage1);
         }
         if(_nativeObject.customStageDatingStage100)
         {
            customStageDatingStage100.setNativeInstance(_nativeObject.customStageDatingStage100);
         }
         if(_nativeObject.datingStage2)
         {
            datingStage2.setNativeInstance(_nativeObject.datingStage2);
         }
         if(_nativeObject.datingStage3)
         {
            datingStage3.setNativeInstance(_nativeObject.datingStage3);
         }
         if(_nativeObject.datingStage4)
         {
            datingStage4.setNativeInstance(_nativeObject.datingStage4);
         }
         if(_nativeObject.datingStage7)
         {
            datingStage7.setNativeInstance(_nativeObject.datingStage7);
         }
         if(_nativeObject.datingStage5)
         {
            datingStage5.setNativeInstance(_nativeObject.datingStage5);
         }
         if(_nativeObject.datingStage6)
         {
            datingStage6.setNativeInstance(_nativeObject.datingStage6);
         }
         if(_nativeObject.datingStage8)
         {
            datingStage8.setNativeInstance(_nativeObject.datingStage8);
         }
         if(_nativeObject.datingStage9)
         {
            datingStage9.setNativeInstance(_nativeObject.datingStage9);
         }
         if(_nativeObject.imageAvatarPlaceholder)
         {
            imageAvatarPlaceholder.setNativeInstance(_nativeObject.imageAvatarPlaceholder);
         }
         if(_nativeObject.clouds)
         {
            clouds.setNativeInstance(_nativeObject.clouds);
         }
      }
   }
}
