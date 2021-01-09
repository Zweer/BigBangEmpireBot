package com.playata.application.ui.elements.streaming
{
   import com.playata.application.data.streaming.Streaming;
   import com.playata.application.data.streaming.StreamingActor;
   import com.playata.application.data.user.User;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import visuals.ui.elements.streaming.SymbolStreamingActorLineGeneric;
   
   public class UiStreamingActorLine extends InteractiveDisplayObject
   {
       
      
      private var _content:SymbolStreamingActorLineGeneric = null;
      
      private var _index:int = 0;
      
      private var _actorId:int = -1;
      
      private var _onClickFunction:Function = null;
      
      private var _hasNewPose:Boolean = false;
      
      public function UiStreamingActorLine(param1:SymbolStreamingActorLineGeneric, param2:int, param3:Function)
      {
         _content = param1;
         super(_content);
         _index = param2;
         _onClickFunction = param3;
         _content.backgroundHighlight.visible = false;
         onClick.add(handleClick);
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function get actorId() : int
      {
         return _actorId;
      }
      
      public function get hasNewPose() : Boolean
      {
         return _hasNewPose;
      }
      
      override public function dispose() : void
      {
         _actorId = -1;
         _content = null;
         super.dispose();
      }
      
      private function handleClick(param1:InteractionEvent) : void
      {
         Environment.audio.playFX("ui_button_click.mp3");
      }
      
      public function highlight(param1:Boolean) : void
      {
         _content.backgroundHighlight.visible = param1;
      }
      
      public function refresh(param1:int) : void
      {
         _actorId = param1;
         if(_actorId <= 0)
         {
            _content.visible = false;
            return;
         }
         _content.visible = true;
         var _loc2_:Streaming = User.current.character.streaming;
         var _loc4_:StreamingActor = null;
         if(_loc2_.getUnlockedActors().exists(_actorId))
         {
            _loc4_ = _loc2_.getUnlockedActors().getData(_actorId);
         }
         _content.lock.visible = _loc4_ == null;
         _content.iconExclamationMark.visible = false;
         _hasNewPose = false;
         if(_loc4_ != null)
         {
            var _loc6_:int = 0;
            var _loc5_:* = _loc4_.unlockedAnimations;
            for each(var _loc3_ in _loc4_.unlockedAnimations)
            {
               if(_loc3_)
               {
                  _hasNewPose = true;
                  break;
               }
            }
         }
         _content.iconExclamationMark.visible = _hasNewPose || _loc2_.hasActorPoseToUnlock(_actorId);
         _content.image.setUriSprite(StreamingActor.getActorIconUrl(_actorId),55,56,true,1);
      }
   }
}
