package visuals.ui.elements.citymap
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   import visuals.ui.elements.dungeon.SymbolDungeonKeyRewardGeneric;
   import visuals.ui.elements.goal.SymbolGoalItemGeneric;
   import visuals.ui.elements.item.SymbolItemSlotGeneric;
   import visuals.ui.elements.movie.SymbolMovieItemGeneric;
   import visuals.ui.elements.optical_changes.SymbolOpticalChangeResourceRewardGeneric;
   import visuals.ui.elements.slotmachine.SymbolSlotmachineJetonRewardGeneric;
   
   public class SymbolCitymapStageRewardGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolCitymapStageReward = null;
      
      public var background:SymbolDummyGeneric = null;
      
      public var eventItem1:SymbolMovieItemGeneric = null;
      
      public var eventItem2:SymbolMovieItemGeneric = null;
      
      public var eventItem3:SymbolMovieItemGeneric = null;
      
      public var eventItem4:SymbolMovieItemGeneric = null;
      
      public var jeton1:SymbolSlotmachineJetonRewardGeneric = null;
      
      public var jeton2:SymbolSlotmachineJetonRewardGeneric = null;
      
      public var storyDungeonItem1:SymbolMovieItemGeneric = null;
      
      public var storyDungeonItem2:SymbolMovieItemGeneric = null;
      
      public var storyDungeonItem3:SymbolMovieItemGeneric = null;
      
      public var storyDungeonItem4:SymbolMovieItemGeneric = null;
      
      public var goal1:SymbolGoalItemGeneric = null;
      
      public var goal2:SymbolGoalItemGeneric = null;
      
      public var goal3:SymbolGoalItemGeneric = null;
      
      public var goal4:SymbolGoalItemGeneric = null;
      
      public var item1:SymbolItemSlotGeneric = null;
      
      public var item2:SymbolItemSlotGeneric = null;
      
      public var item3:SymbolItemSlotGeneric = null;
      
      public var item4:SymbolItemSlotGeneric = null;
      
      public var opticalChangeResource1:SymbolOpticalChangeResourceRewardGeneric = null;
      
      public var opticalChangeResource2:SymbolOpticalChangeResourceRewardGeneric = null;
      
      public var opticalChangeResource3:SymbolOpticalChangeResourceRewardGeneric = null;
      
      public var opticalChangeResource4:SymbolOpticalChangeResourceRewardGeneric = null;
      
      public var dungeonKey:SymbolDungeonKeyRewardGeneric = null;
      
      public function SymbolCitymapStageRewardGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolCitymapStageReward;
         }
         else
         {
            _nativeObject = new SymbolCitymapStageReward();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         background = new SymbolDummyGeneric(_nativeObject.background);
         eventItem1 = new SymbolMovieItemGeneric(_nativeObject.eventItem1);
         eventItem2 = new SymbolMovieItemGeneric(_nativeObject.eventItem2);
         eventItem3 = new SymbolMovieItemGeneric(_nativeObject.eventItem3);
         eventItem4 = new SymbolMovieItemGeneric(_nativeObject.eventItem4);
         jeton1 = new SymbolSlotmachineJetonRewardGeneric(_nativeObject.jeton1);
         jeton2 = new SymbolSlotmachineJetonRewardGeneric(_nativeObject.jeton2);
         storyDungeonItem1 = new SymbolMovieItemGeneric(_nativeObject.storyDungeonItem1);
         storyDungeonItem2 = new SymbolMovieItemGeneric(_nativeObject.storyDungeonItem2);
         storyDungeonItem3 = new SymbolMovieItemGeneric(_nativeObject.storyDungeonItem3);
         storyDungeonItem4 = new SymbolMovieItemGeneric(_nativeObject.storyDungeonItem4);
         goal1 = new SymbolGoalItemGeneric(_nativeObject.goal1);
         goal2 = new SymbolGoalItemGeneric(_nativeObject.goal2);
         goal3 = new SymbolGoalItemGeneric(_nativeObject.goal3);
         goal4 = new SymbolGoalItemGeneric(_nativeObject.goal4);
         item1 = new SymbolItemSlotGeneric(_nativeObject.item1);
         item2 = new SymbolItemSlotGeneric(_nativeObject.item2);
         item3 = new SymbolItemSlotGeneric(_nativeObject.item3);
         item4 = new SymbolItemSlotGeneric(_nativeObject.item4);
         opticalChangeResource1 = new SymbolOpticalChangeResourceRewardGeneric(_nativeObject.opticalChangeResource1);
         opticalChangeResource2 = new SymbolOpticalChangeResourceRewardGeneric(_nativeObject.opticalChangeResource2);
         opticalChangeResource3 = new SymbolOpticalChangeResourceRewardGeneric(_nativeObject.opticalChangeResource3);
         opticalChangeResource4 = new SymbolOpticalChangeResourceRewardGeneric(_nativeObject.opticalChangeResource4);
         dungeonKey = new SymbolDungeonKeyRewardGeneric(_nativeObject.dungeonKey);
      }
      
      public function setNativeInstance(param1:SymbolCitymapStageReward) : void
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
         if(_nativeObject.eventItem1)
         {
            eventItem1.setNativeInstance(_nativeObject.eventItem1);
         }
         if(_nativeObject.eventItem2)
         {
            eventItem2.setNativeInstance(_nativeObject.eventItem2);
         }
         if(_nativeObject.eventItem3)
         {
            eventItem3.setNativeInstance(_nativeObject.eventItem3);
         }
         if(_nativeObject.eventItem4)
         {
            eventItem4.setNativeInstance(_nativeObject.eventItem4);
         }
         if(_nativeObject.jeton1)
         {
            jeton1.setNativeInstance(_nativeObject.jeton1);
         }
         if(_nativeObject.jeton2)
         {
            jeton2.setNativeInstance(_nativeObject.jeton2);
         }
         if(_nativeObject.storyDungeonItem1)
         {
            storyDungeonItem1.setNativeInstance(_nativeObject.storyDungeonItem1);
         }
         if(_nativeObject.storyDungeonItem2)
         {
            storyDungeonItem2.setNativeInstance(_nativeObject.storyDungeonItem2);
         }
         if(_nativeObject.storyDungeonItem3)
         {
            storyDungeonItem3.setNativeInstance(_nativeObject.storyDungeonItem3);
         }
         if(_nativeObject.storyDungeonItem4)
         {
            storyDungeonItem4.setNativeInstance(_nativeObject.storyDungeonItem4);
         }
         if(_nativeObject.goal1)
         {
            goal1.setNativeInstance(_nativeObject.goal1);
         }
         if(_nativeObject.goal2)
         {
            goal2.setNativeInstance(_nativeObject.goal2);
         }
         if(_nativeObject.goal3)
         {
            goal3.setNativeInstance(_nativeObject.goal3);
         }
         if(_nativeObject.goal4)
         {
            goal4.setNativeInstance(_nativeObject.goal4);
         }
         if(_nativeObject.item1)
         {
            item1.setNativeInstance(_nativeObject.item1);
         }
         if(_nativeObject.item2)
         {
            item2.setNativeInstance(_nativeObject.item2);
         }
         if(_nativeObject.item3)
         {
            item3.setNativeInstance(_nativeObject.item3);
         }
         if(_nativeObject.item4)
         {
            item4.setNativeInstance(_nativeObject.item4);
         }
         if(_nativeObject.opticalChangeResource1)
         {
            opticalChangeResource1.setNativeInstance(_nativeObject.opticalChangeResource1);
         }
         if(_nativeObject.opticalChangeResource2)
         {
            opticalChangeResource2.setNativeInstance(_nativeObject.opticalChangeResource2);
         }
         if(_nativeObject.opticalChangeResource3)
         {
            opticalChangeResource3.setNativeInstance(_nativeObject.opticalChangeResource3);
         }
         if(_nativeObject.opticalChangeResource4)
         {
            opticalChangeResource4.setNativeInstance(_nativeObject.opticalChangeResource4);
         }
         if(_nativeObject.dungeonKey)
         {
            dungeonKey.setNativeInstance(_nativeObject.dungeonKey);
         }
      }
   }
}
