package com.playata.application.ui.elements.application
{
   import com.playata.application.request.InfoMessageRequest;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.timer.ITimer;
   import com.playata.framework.input.InteractionEvent;
   import visuals.ui.elements.generic.SymbolInfoMessageGeneric;
   
   public class UiInfoMessage
   {
       
      
      private var _content:SymbolInfoMessageGeneric = null;
      
      private var _timer:ITimer = null;
      
      private var _btnClose:UiButton = null;
      
      public function UiInfoMessage(param1:SymbolInfoMessageGeneric, param2:Boolean)
      {
         super();
         _content = param1;
         _timer = Environment.createTimer("UiInfoMessage::timer",180000,onTimerEvent);
         if(param2)
         {
            _timer.start();
            refresh();
         }
         _btnClose = new UiButton(_content.btnClose,null,handleClick);
      }
      
      public function dispose() : void
      {
         _timer.dispose();
         _timer = null;
      }
      
      private function handleClick(param1:InteractionEvent) : void
      {
         _content.visible = false;
         _timer.dispose();
         _timer = null;
      }
      
      public function set enableSync(param1:Boolean) : void
      {
         if(!_timer)
         {
            return;
         }
         if(param1)
         {
            if(!_timer.isRunning)
            {
               _timer.start();
            }
         }
         else if(_timer.isRunning)
         {
            _timer.stop();
         }
      }
      
      public function get enableSync() : Boolean
      {
         if(!_timer)
         {
            return false;
         }
         return _timer.isRunning;
      }
      
      public function refresh() : void
      {
         var request:InfoMessageRequest = new InfoMessageRequest();
         request.send(function(param1:Object, param2:Boolean):void
         {
            var _loc3_:* = null;
            if(param2)
            {
               _loc3_ = new TypedObject(param1);
               if(_loc3_.getBoolean("available"))
               {
                  _content.visible = true;
                  _content.txtTitle.text = _loc3_.getString("title");
                  _content.txtMessage.text = _loc3_.getString("message");
               }
               else
               {
                  _content.visible = false;
               }
            }
         });
      }
      
      private function onTimerEvent() : void
      {
         refresh();
      }
   }
}
