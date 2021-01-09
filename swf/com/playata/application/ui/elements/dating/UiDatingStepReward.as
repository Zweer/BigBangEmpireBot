package com.playata.application.ui.elements.dating
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.dating.DatingUtil;
   import com.playata.application.ui.effects.GlowFilterEffect;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.application.ui.elements.item.UiItemGraphic;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.dating.SymbolDatingStepRewardGeneric;
   
   public class UiDatingStepReward
   {
       
      
      private var _content:SymbolDatingStepRewardGeneric;
      
      private var _glowFilterItem:GlowFilterEffect = null;
      
      private var _randomItemTooltip:UiTextTooltip;
      
      public function UiDatingStepReward(param1:SymbolDatingStepRewardGeneric, param2:int = 0, param3:int = 0, param4:Boolean = false)
      {
         super();
         _content = param1;
         _content.txtItemReward.text = LocText.current.text("general/item_reward_text");
         _content.txtItemReward.autoFontSize = true;
         _randomItemTooltip = new UiTextTooltip(_content.txtItemReward,"");
         refresh(param2,param3,param4);
      }
      
      public function refresh(param1:int, param2:int, param3:Boolean) : void
      {
         var _loc4_:Boolean = false;
         if(param1 > 0 && param2 > 0)
         {
            _content.txtRewardsCaption.text = LocText.current.text("dialog/dating_step/rewards");
            _loc4_ = DatingUtil.getRewardItemIsRandom(param1,param2,param3);
            if(_loc4_)
            {
               switch(int(DatingUtil.getRewardItemQuality(param1,param2,param3)) - 1)
               {
                  case 0:
                     _randomItemTooltip.text = LocText.current.text("dialog/event_quest/reward_item/random_common_tooltip");
                     break;
                  case 1:
                     _randomItemTooltip.text = LocText.current.text("dialog/event_quest/reward_item/random_rare_tooltip");
                     break;
                  case 2:
                     _randomItemTooltip.text = LocText.current.text("dialog/event_quest/reward_item/random_epic_tooltip");
               }
            }
            else
            {
               _randomItemTooltip.text = "";
            }
            _content.iconItem.icon.setUriSprite(DatingUtil.getRewardItemIconImageUrl(param1,param2,param3),30,30,false,1,null,true);
            if(_glowFilterItem)
            {
               _glowFilterItem.dispose();
               _glowFilterItem = null;
            }
            _glowFilterItem = UiItemGraphic.getItemGlowEffect(DatingUtil.getRewardItemQuality(param1,param2,param3),_content.iconItem);
            _glowFilterItem.play();
            _content.txtStatPoints.text = GameUtil.getStatPointString(DatingUtil.getRewardStatPoints(param1,param2,param3));
            var _loc5_:* = DatingUtil.hasRewardImage(param1,param2,param3);
            _content.iconGirlPictureReward.visible = _loc5_;
            _content.txtGirlPictureReward.visible = _loc5_;
            if(_content.txtGirlPictureReward.visible)
            {
               _content.txtGirlPictureReward.text = LocText.current.text("dating/dating_step/reward_picture",DatingUtil.getRewardGirlPicture(param1,param2));
               _content.txtGirlPictureReward.autoFontSize = true;
            }
         }
      }
      
      public function dispose() : void
      {
         if(_glowFilterItem)
         {
            _glowFilterItem.dispose();
            _glowFilterItem = null;
         }
         _randomItemTooltip.dispose();
         _randomItemTooltip = null;
         _content = null;
      }
   }
}
