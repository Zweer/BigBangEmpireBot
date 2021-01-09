package com.playata.application.ui.elements.guild
{
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.framework.display.MovieClip;
   import com.playata.framework.input.InteractionEvent;
   
   public class UiGuildMemberListSortButton extends UiButton
   {
       
      
      private var _onClickCallback:Function;
      
      private var _toggled:Boolean;
      
      private var _sortMode:int;
      
      public function UiGuildMemberListSortButton(param1:MovieClip, param2:int, param3:String, param4:Function)
      {
         param1.gotoAndStop(1);
         _sortMode = param2;
         _onClickCallback = param4;
         super(param1,param3,clickedHandler);
         _toggled = false;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         _onClickCallback = null;
      }
      
      private function clickedHandler(param1:InteractionEvent) : void
      {
         if(_toggled)
         {
            return;
         }
         toggled = !toggled;
         §§push(_onClickCallback(_sortMode));
      }
      
      public function get toggled() : Boolean
      {
         return _toggled;
      }
      
      public function set toggled(param1:Boolean) : void
      {
         _toggled = param1;
         (_content as MovieClip).gotoAndStop(!!_toggled?2:1);
      }
   }
}
