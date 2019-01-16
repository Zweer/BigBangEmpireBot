package com.playata.application.ui.elements.event
{
   import com.playata.application.data.event.EventQuest;
   import com.playata.application.ui.effects.HighlightEffect;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.event.SymbolEventQuestButtonGeneric;
   
   public class UiEventQuestButton extends UiButton
   {
       
      
      private var _button:SymbolEventQuestButtonGeneric = null;
      
      private var _highlight:HighlightEffect = null;
      
      public function UiEventQuestButton(param1:SymbolEventQuestButtonGeneric, param2:Function)
      {
         super(param1,"",param2);
         _highlight = new HighlightEffect(param1.highlight,0.6,0.6,true);
         _button = param1;
      }
      
      public static function getTooltip(param1:EventQuest) : String
      {
         var _loc2_:* = null;
         var _loc3_:String = "";
         if(param1.isAborted || param1.isAbortedButFinished)
         {
            _loc3_ = param1.name;
         }
         else
         {
            if(param1.isFinished)
            {
               _loc3_ = LocText.current.text("screen/quest/button_event_quest_finished_tooltip",param1.name);
            }
            else
            {
               _loc3_ = LocText.current.text("screen/quest/button_event_quest_tooltip",param1.name,param1.timeRemainingString);
            }
            if(param1.hasConventionData)
            {
               _loc2_ = param1.conventionStartTimes;
               if(_loc2_ != "")
               {
                  _loc3_ = _loc3_ + ("\n\n" + LocText.current.text("screen/quest/button_event_quest_convention_tooltip",_loc2_,param1.remainingConventionStartTimes));
               }
            }
         }
         return _loc3_;
      }
      
      override public function dispose() : void
      {
         _highlight.dispose();
         super.dispose();
      }
      
      public function refresh(param1:EventQuest) : void
      {
         visible = param1 != null || !param1.isFinished;
         if(visible && param1.isFinished && !param1.hasConventionData)
         {
            visible = false;
         }
         if(visible && !param1.isAvailable && !param1.isAborted && !param1.isAbortedButFinished)
         {
            visible = false;
         }
         if(param1 == null || !visible)
         {
            return;
         }
         buttonEnabled = !param1.isFinished;
         _button.icon.setUriSprite(param1.iconImageUrl,75,75,true);
         tooltip = getTooltip(param1);
         if(visible)
         {
            if(param1.collectableObjectiveCount > 0)
            {
               highlight();
            }
            else
            {
               unhighlight();
            }
         }
      }
      
      public function highlight() : void
      {
         _highlight.highlight();
      }
      
      public function unhighlight() : void
      {
         _highlight.unhighlight();
      }
   }
}
