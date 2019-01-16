package com.playata.application.ui.elements.herobook
{
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.herobook.Herobook;
   import com.playata.application.data.herobook.HerobookObjective;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.effects.HighlightEffect;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.herobook.SymbolHerobookButtonGeneric;
   
   public class UiHerobookButton extends UiButton
   {
       
      
      private var _button:SymbolHerobookButtonGeneric = null;
      
      private var _timer:UiHerobookTimer = null;
      
      private var _herobook:Herobook = null;
      
      private var _highlight:HighlightEffect = null;
      
      public function UiHerobookButton(param1:SymbolHerobookButtonGeneric, param2:Function)
      {
         super(param1,"",param2);
         _button = param1;
         _button.counter.caption.text = "!";
         _timer = new UiHerobookTimer(_button.timer);
         tooltip = "";
         textTooltip.requestTextFunction = requestTooltip;
         _highlight = new HighlightEffect(_button.icon.highlight,1,1,true);
      }
      
      override public function dispose() : void
      {
         _timer.dispose();
         _timer = null;
         _highlight.dispose();
         super.dispose();
      }
      
      public function refresh(param1:Herobook) : void
      {
         if(param1 == null || !visible)
         {
            return;
         }
         _herobook = param1;
         _button.counter.visible = _herobook.newObjectives;
         _button.iconLock.visible = User.current.character.level < CConstant.herobook_min_level;
         if(_herobook.collectableObjectiveCount > 0)
         {
            highlight();
         }
         else
         {
            unhighlight();
         }
         showTimer(_herobook);
      }
      
      private function requestTooltip() : String
      {
         var _loc1_:* = null;
         if(!_herobook)
         {
            return "";
         }
         if(User.current.character.level < CConstant.herobook_min_level)
         {
            return LocText.current.text("screen/quest/button_herobook_locked",CConstant.herobook_min_level);
         }
         _loc1_ = "";
         if(_herobook.activeObjectiveCount > 0)
         {
            _loc1_ = _loc1_ + LocText.current.text("screen/quest/button_herobook_active_tooltip",_herobook.activeObjectiveCount);
         }
         if(_herobook.activeObjectiveCount > 0 && _herobook.minTimeRemainingLongString != "")
         {
            if(_loc1_ != "")
            {
               _loc1_ = _loc1_ + "\n";
            }
            _loc1_ = _loc1_ + LocText.current.text("screen/quest/button_herobook_time_tooltip",_herobook.minTimeRemainingLongString);
         }
         if(_herobook.collectableObjectiveCount > 0)
         {
            if(_loc1_ != "")
            {
               _loc1_ = _loc1_ + "\n";
            }
            _loc1_ = _loc1_ + LocText.current.text("screen/quest/button_herobook_collectable_tooltip");
         }
         return _loc1_;
      }
      
      private function showTimer(param1:Herobook) : void
      {
         var _loc3_:int = 0;
         var _loc5_:* = null;
         var _loc2_:int = 0;
         var _loc4_:* = null;
         _loc3_ = 0;
         while(_loc3_ < param1.objectives.length)
         {
            _loc5_ = param1.objectives[_loc3_];
            _loc2_ = _loc5_.remainingSeconds;
            if(_loc5_.isStarted && _loc2_ > 0 && (!_loc4_ || _loc2_ < _loc4_.remainingSeconds))
            {
               _loc4_ = _loc5_;
            }
            _loc3_++;
         }
         if(_loc4_ && _loc4_.remainingSeconds < 21600)
         {
            _timer.refresh(_loc4_);
         }
         else
         {
            _timer.hide();
         }
      }
      
      public function stopTimer() : void
      {
         _timer.hide();
      }
      
      public function highlight() : void
      {
         _highlight.highlight();
      }
      
      public function unhighlight() : void
      {
         _highlight.unhighlight(true);
      }
   }
}
