package com.playata.application.ui.elements.streaming
{
   import com.playata.application.data.constants.CStreamingActor;
   import com.playata.application.data.streaming.Streaming;
   import com.playata.application.data.streaming.StreamingActor;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import visuals.ui.elements.streaming.SymbolStreamingActorLineGeneric;
   import visuals.ui.elements.streaming.SymbolUiStreamingActorsGeneric;
   
   public class UiStreamingActors extends InteractiveDisplayObject
   {
      
      private static const MAX_LINES:int = 6;
      
      private static const SCROLL_VALUE:int = 2;
       
      
      private var _content:SymbolUiStreamingActorsGeneric = null;
      
      private var _actorContent:UiStreamingActorContent = null;
      
      private var _lines:Vector.<UiStreamingActorLine> = null;
      
      private var _btnScrollUp:UiButton = null;
      
      private var _btnScrollDown:UiButton = null;
      
      private var _currentSelectedId:int = 0;
      
      private var _offset:int = 0;
      
      private var _allActorIds:Vector.<int> = null;
      
      public function UiStreamingActors(param1:SymbolUiStreamingActorsGeneric)
      {
         var _loc2_:int = 0;
         _content = param1;
         super(_content);
         _actorContent = new UiStreamingActorContent(_content.content);
         _lines = new Vector.<UiStreamingActorLine>();
         _loc2_ = 1;
         while(_loc2_ <= 6)
         {
            _lines.push(new UiStreamingActorLine(_content.getChildByName("line" + _loc2_) as SymbolStreamingActorLineGeneric,_loc2_,onSelectLine));
            _loc2_++;
         }
         _btnScrollUp = new UiButton(_content.btnUp,"",onClickScrollUp);
         _btnScrollDown = new UiButton(_content.btnDown,"",onClickScrollDown);
         onMouseWheel.add(handleMouseWheel);
         _allActorIds = CStreamingActor.ids;
      }
      
      override public function dispose() : void
      {
         var _loc1_:int = 0;
         if(_btnScrollUp == null)
         {
            return;
         }
         _btnScrollUp.dispose();
         _btnScrollUp = null;
         _btnScrollDown.dispose();
         _btnScrollDown = null;
         _loc1_ = 0;
         while(_loc1_ < _lines.length)
         {
            _lines[_loc1_].dispose();
            _loc1_++;
         }
         _lines.length = 0;
         _lines = null;
         _actorContent.dispose();
         _actorContent = null;
         super.dispose();
      }
      
      private function onSelectLine(param1:UiStreamingActorLine) : void
      {
         var _loc2_:int = 0;
         _currentSelectedId = param1.actorId;
         _loc2_ = 0;
         while(_loc2_ < _lines.length)
         {
            _lines[_loc2_].highlight(_currentSelectedId == _lines[_loc2_].actorId);
            _loc2_++;
         }
         _actorContent.refresh(_currentSelectedId);
         if(param1.hasNewPose)
         {
            Environment.application.sendActionRequest("markStreamingActorAsSeen",{"actor_id":_currentSelectedId},handleRequests);
         }
      }
      
      private function handleMouseWheel(param1:InteractionEvent) : void
      {
         if(param1.mouseWheelDelta > 0)
         {
            scrollUp(1,true);
         }
         else
         {
            scrollDown(1,true);
         }
      }
      
      private function onClickScrollUp(param1:InteractionEvent) : void
      {
         scrollUp(2,false);
      }
      
      private function onClickScrollDown(param1:InteractionEvent) : void
      {
         scrollDown(2,false);
      }
      
      private function scrollUp(param1:int, param2:Boolean) : void
      {
         if(!_btnScrollUp.visible)
         {
            return;
         }
         if(_offset == 0)
         {
            return;
         }
         _offset = _offset - param1;
         if(_offset < 0)
         {
            _offset = 0;
            param2 = false;
         }
         if(param2)
         {
            Environment.audio.playFX("ui_button_click.mp3");
         }
         refreshList();
      }
      
      private function scrollDown(param1:int, param2:Boolean) : void
      {
         if(!_btnScrollDown.visible)
         {
            return;
         }
         if(_offset == _allActorIds.length - 6)
         {
            return;
         }
         _offset = _offset + param1;
         if(_offset > _allActorIds.length - 6)
         {
            _offset = _allActorIds.length - 6;
            param2 = false;
         }
         if(param2)
         {
            Environment.audio.playFX("ui_button_click.mp3");
         }
         refreshList();
      }
      
      public function refreshList(param1:Boolean = false) : void
      {
         var _loc4_:int = 0;
         if(!_btnScrollDown)
         {
            return;
         }
         _btnScrollUp.visible = _allActorIds.length > 6;
         _btnScrollDown.visible = _allActorIds.length > 6;
         _btnScrollUp.buttonEnabled = _offset > 0;
         _btnScrollDown.buttonEnabled = _offset < _allActorIds.length - 6;
         _loc4_ = 0;
         while(_loc4_ < _lines.length)
         {
            _lines[_loc4_].refresh(_allActorIds.length >= _offset + _loc4_ + 1?_allActorIds[_offset + _loc4_]:0);
            _loc4_++;
         }
         if(_currentSelectedId > 0)
         {
            _loc4_ = 0;
            while(_loc4_ < _lines.length)
            {
               if(_lines[_loc4_].actorId == _currentSelectedId)
               {
                  onSelectLine(_lines[_loc4_]);
                  break;
               }
               _loc4_++;
            }
         }
         else if(param1)
         {
            onSelectLine(_lines[0]);
         }
         else
         {
            _actorContent.refresh(_currentSelectedId);
         }
         var _loc6_:int = 0;
         var _loc3_:int = 0;
         var _loc8_:int = 0;
         var _loc7_:* = CStreamingActor.ids;
         for each(var _loc5_ in CStreamingActor.ids)
         {
            _loc6_ = _loc6_ + CStreamingActor.fromId(_loc5_).animationIds.length;
         }
         var _loc2_:Streaming = User.current.character.streaming;
         var _loc10_:int = 0;
         var _loc9_:* = _loc2_.getUnlockedActors().keys;
         for each(_loc5_ in _loc2_.getUnlockedActors().keys)
         {
            _loc3_ = _loc3_ + (_loc2_.getUnlockedActors().getData(_loc5_) as StreamingActor).unlockedAnimations.length;
         }
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = param1.action;
         if("markStreamingActorAsSeen" !== _loc3_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            _loc2_ = 0;
            while(_loc2_ < _lines.length)
            {
               if(_lines[_loc2_].actorId == _currentSelectedId)
               {
                  _lines[_loc2_].refresh(_currentSelectedId);
                  break;
               }
               _loc2_++;
            }
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
   }
}
