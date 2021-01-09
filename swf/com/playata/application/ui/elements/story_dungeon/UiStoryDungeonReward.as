package com.playata.application.ui.elements.story_dungeon
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.story_dungeon.StoryDungeon;
   import com.playata.application.ui.effects.GlowFilterEffect;
   import com.playata.application.ui.elements.item.UiItemGraphic;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.story_dungeon.SymbolStoryDungeonRewardGeneric;
   
   public class UiStoryDungeonReward
   {
       
      
      private var _content:SymbolStoryDungeonRewardGeneric;
      
      private var _glowFilterItem:GlowFilterEffect = null;
      
      public function UiStoryDungeonReward(param1:SymbolStoryDungeonRewardGeneric, param2:int = 0, param3:Boolean = false)
      {
         super();
         _content = param1;
         refresh(param2,param3);
      }
      
      public function refresh(param1:int, param2:Boolean) : void
      {
         var _loc3_:int = 0;
         if(param1 > 0)
         {
            _content.txtRewardsCaption.text = LocText.current.text("dialog/story_dungeon_unlocked/rewards");
            _content.iconItem.icon.setUriSprite(StoryDungeon.getRewardItemIconImageUrl(param1),30,30,false,1,null,true);
            _content.txtItemReward.text = LocText.current.text("general/item_reward_text");
            _content.txtItemReward.autoFontSize = true;
            _loc3_ = StoryDungeon.getRewardItemQuality(param1);
            _glowFilterItem = UiItemGraphic.getItemGlowEffect(_loc3_,_content.iconItem);
            _glowFilterItem.play();
            _content.txtStatPoints.text = GameUtil.getStatPointString(StoryDungeon.getRewardStatPoints(param1,param2));
            if(param2)
            {
               _content.iconStageReward.visible = false;
               _content.txtStageReward.visible = false;
               _content.iconStageMissionReward.visible = false;
               _content.txtStageMissionReward.visible = false;
            }
            else
            {
               _content.txtStageReward.text = StoryDungeon.getRewardStageChanges(param1);
               _content.txtStageReward.autoFontSize = true;
               _content.txtStageMissionReward.text = StoryDungeon.getRewardStageMissions(param1);
               _content.txtStageMissionReward.autoFontSize = true;
            }
         }
      }
      
      public function dispose() : void
      {
         _content = null;
         if(_glowFilterItem)
         {
            _glowFilterItem.dispose();
            _glowFilterItem = null;
         }
      }
   }
}
