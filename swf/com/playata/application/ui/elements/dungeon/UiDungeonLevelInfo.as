package com.playata.application.ui.elements.dungeon
{
   import com.playata.application.data.dungeon.Dungeon;
   import com.playata.application.data.dungeon.DungeonLevel;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.item.UiItemSlot;
   import com.playata.framework.core.util.NumberUtil;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.dungeon.SymbolDungeonStatusLevelLineGeneric;
   
   public class UiDungeonLevelInfo
   {
       
      
      private var _content:SymbolDungeonStatusLevelLineGeneric;
      
      private var _tooltip:UiDungeonLevelTooltip;
      
      private var _itemReward:UiItemSlot;
      
      public function UiDungeonLevelInfo(param1:SymbolDungeonStatusLevelLineGeneric, param2:Dungeon, param3:DungeonLevel)
      {
         var _loc6_:int = 0;
         var _loc8_:int = 0;
         var _loc7_:int = 0;
         var _loc4_:* = null;
         super();
         _content = param1;
         param1.photo.locked.visible = !param3.isUnlocked;
         param1.photo.completed.visible = param3.isFinished;
         var _loc5_:int = 0;
         if(param1.photo.completed.visible)
         {
            param1.txtMissionsRemaining.visible = false;
         }
         else
         {
            _loc6_ = 0;
            _loc8_ = 0;
            _loc7_ = 1;
            while(_loc7_ <= param3.level)
            {
               _loc4_ = param2.getLevel(_loc7_);
               _loc6_ = _loc6_ + _loc4_.progressIndex;
               _loc8_ = _loc8_ + _loc4_.numMissions;
               _loc7_++;
            }
            _loc5_ = _loc8_ - _loc6_;
            param1.txtMissionsRemaining.text = LocText.current.text("dialog/dungeon_status/missions_remaining",_loc5_);
         }
         _tooltip = new UiDungeonLevelTooltip(param1.tooltipLayer);
         _tooltip.update(param3,_loc5_);
         _itemReward = new UiItemSlot(param1.itemReward,0);
         _itemReward.item = User.current.character.getItemById(param3.rewardItemId);
         param1.photo.photo.setUriSprite(param3.imageUrl,60,60,true,1,null,true);
         param1.photo.rotation = NumberUtil.randomNumber(-1,4);
         param1.bgEven.visible = param3.level == 2;
         param1.bgOdd.visible = !param1.bgEven.visible;
      }
      
      public function dispose() : void
      {
         _tooltip.dispose();
         _itemReward.dispose();
      }
   }
}
