package com.playata.application.ui.elements.dungeon
{
   import com.playata.application.data.dungeon.Dungeon;
   import com.playata.application.data.dungeon.DungeonLevel;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.framework.display.ui.TextFieldAutoAdjustWidthHeight;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.quest.SymbolButtonDungeonStatusGeneric;
   
   public class UiDungeonStatusButton extends UiButton
   {
       
      
      private var _realContent:SymbolButtonDungeonStatusGeneric;
      
      public function UiDungeonStatusButton(param1:SymbolButtonDungeonStatusGeneric, param2:Function)
      {
         super(param1,"",param2);
         _realContent = param1;
         _realContent.txtWinsRemaining.autoAdjustWidthHeight = TextFieldAutoAdjustWidthHeight.VERTICAL;
      }
      
      override public function dispose() : void
      {
         _realContent = null;
         super.dispose();
      }
      
      public function refresh(param1:Dungeon) : void
      {
         var _loc6_:int = 0;
         var _loc2_:* = null;
         if(!param1)
         {
            return;
         }
         var _loc4_:DungeonLevel = param1.currentLevel;
         if(_loc4_.isFinished && _loc4_.level == 3)
         {
            _realContent.txtWinsRemaining.text = "";
            return;
         }
         if(_loc4_.isFinished)
         {
            _loc4_ = param1.nextLevel;
         }
         var _loc5_:int = 0;
         var _loc7_:int = 0;
         _loc6_ = 1;
         while(_loc6_ <= _loc4_.level)
         {
            _loc2_ = param1.getLevel(_loc6_);
            _loc5_ = _loc5_ + _loc2_.progressIndex;
            _loc7_ = _loc7_ + _loc2_.numMissions;
            _loc6_++;
         }
         var _loc3_:int = _loc7_ - _loc5_;
         _realContent.txtWinsRemaining.text = LocText.current.text("screen/dungeon/button_status_wins_remaining",_loc3_);
         tooltip = LocText.current.text("screen/dungeon/button_status_tooltip",_loc3_);
      }
   }
}
