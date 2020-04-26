package com.playata.application.ui.elements.slotmachine
{
   import com.playata.application.data.guild.SlotmachineLogMessage;
   import com.playata.application.data.item.LinkedBooster;
   import com.playata.application.data.item.LinkedItem;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.textfield.UiChatOutputRichTextArea;
   import com.playata.application.ui.elements.guild.UiGuildChatTab;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.timer.ITimer;
   import com.playata.framework.core.util.JsonUtil;
   import com.playata.framework.display.lib.flash.FlashDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import com.playata.framework.network.NetworkCore;
   import com.playata.framework.tween.Tween;
   import flash.text.TextField;
   import visuals.ui.elements.slotmachine.SymbolUiSlotmachineChatGeneric;
   
   public class UiSlotmachineChat
   {
      
      public static const CHAT_REFRESH_RATE:int = 60;
      
      private static var _instance:UiSlotmachineChat = null;
      
      private static var _right:int = 285;
      
      private static var _normal:int = -115;
      
      private static var _left:int = -515;
      
      private static var _maxChatEntries:int = 10;
       
      
      private var _chatOutput:UiChatOutputRichTextArea;
      
      private var _timer:ITimer = null;
      
      private var _messages:Vector.<String>;
      
      private var _content:SymbolUiSlotmachineChatGeneric;
      
      private var _visible:Boolean = false;
      
      private var _currentIndex:int = 0;
      
      private var _animationRunning:Boolean = false;
      
      public function UiSlotmachineChat(param1:SymbolUiSlotmachineChatGeneric)
      {
         super();
         if(_instance != null)
         {
            throw new Error("UiSlotmachineChat can only have a single instance!");
         }
         _instance = this;
         _content = param1;
         _chatOutput = new UiChatOutputRichTextArea(param1.chat);
         _chatOutput.emoticonsEnabled = true;
         _chatOutput.init(handleLink);
         _chatOutput.textField.selectable = false;
         _chatOutput.textField.width = 1200;
         (FlashDisplayObject.getNativeDisplayObject(_chatOutput.textField) as TextField).multiline = false;
         (FlashDisplayObject.getNativeDisplayObject(_chatOutput.textField) as TextField).wordWrap = false;
         _chatOutput.text = getMessage("#F0CC04",LocText.current.text("dialog/tutorial/slotmachine/title"));
         _content.x = _normal;
         _timer = Environment.createTimer("UiSlotmachineChat::timer",1000 * 60,onRefreshChat);
         _messages = new Vector.<String>();
      }
      
      public static function get instance() : UiSlotmachineChat
      {
         return _instance;
      }
      
      private function showNextReward() : void
      {
         if(!User.current)
         {
            return;
         }
         if(_messages.length == 0)
         {
            return;
         }
         if(!Environment.isActive)
         {
            return;
         }
         if(_animationRunning)
         {
            return;
         }
         if(!_visible)
         {
            return;
         }
         _currentIndex = Number(_currentIndex) - 1;
         if(_currentIndex < 0)
         {
            _currentIndex = _messages.length - 1;
         }
         var _loc2_:String = _messages[_currentIndex];
         _content.x = _right;
         _chatOutput.text = _loc2_;
         _chatOutput.x = 0;
         _animationRunning = true;
         _content.tweenTo(0.5,{"x":_normal});
         var _loc1_:Number = _chatOutput.textField.textWidth;
         if(_loc1_ > 408)
         {
            _chatOutput.x = _loc1_ - 408;
            Tween.to(_chatOutput,3,{
               "x":-(_loc1_ - 408),
               "delay":1
            });
         }
         _content.tweenTo(0.5,{
            "x":_left,
            "delay":5,
            "onComplete":animationFinished
         });
      }
      
      private function animationFinished() : void
      {
         _animationRunning = false;
         if(_messages.length > _maxChatEntries)
         {
            _messages.length = _messages.length - 1;
         }
         showNextReward();
      }
      
      public function dispose() : void
      {
         _chatOutput.dispose();
         _chatOutput = null;
         _timer.dispose();
         _timer = null;
         _instance = null;
      }
      
      public function show() : void
      {
         _visible = true;
         refreshChat();
         _timer.start();
         if(NetworkCore.current.serverConnection.isSocketTransportActive)
         {
            Environment.application.sendActionRequest("addUserToSlotmachineRoom",{},handleRequests);
         }
         showNextReward();
      }
      
      public function hide() : void
      {
         _visible = false;
         if(_timer)
         {
            _timer.stop();
            if(NetworkCore.current.serverConnection.isSocketTransportActive)
            {
               Environment.application.sendActionRequest("removeUserFromSlotmachineRoom",{},handleRequests);
            }
         }
      }
      
      private function onRefreshChat() : void
      {
         refreshChat();
      }
      
      private function refreshChat() : void
      {
         Environment.application.sendActionRequest("getLastSlotmachineWins",{},handleRequests);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc6_:* = param1.action;
         switch(_loc6_)
         {
            case "getLastSlotmachineWins":
               if(param1.error == "")
               {
                  _loc6_ = 0;
                  var _loc5_:* = param1.appResponse.win_messages;
                  for each(var _loc4_ in param1.appResponse.win_messages)
                  {
                     _loc2_ = new SlotmachineLogMessage(JsonUtil.decode(_loc4_));
                     if(_loc2_.message != "")
                     {
                        _loc3_ = getMessage("#F0CC04",_loc2_.message);
                        if(!messageInList(_loc3_))
                        {
                           _messages.unshift(_loc3_);
                        }
                     }
                  }
                  if(_messages.length > 0 && _chatOutput.textField.text == getMessage("#F0CC04",LocText.current.text("dialog/tutorial/slotmachine/title")))
                  {
                     _content.tweenTo(0.5,{
                        "x":_left,
                        "delay":2,
                        "onComplete":showNextReward
                     });
                  }
                  else
                  {
                     showNextReward();
                  }
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "addUserToSlotmachineRoom":
               _timer.stop();
               break;
            case "removeUserFromSlotmachineRoom":
               break;
            default:
               throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
      }
      
      private function messageInList(param1:String) : Boolean
      {
         var _loc2_:int = 0;
         _loc2_ = _messages.length - 1;
         while(_loc2_ >= 0)
         {
            if(_messages[_loc2_] == param1)
            {
               return true;
            }
            _loc2_--;
         }
         return false;
      }
      
      public function appendMessage(param1:String) : void
      {
         var _loc2_:SlotmachineLogMessage = new SlotmachineLogMessage(JsonUtil.decode(param1));
         if(_loc2_.message != "")
         {
            _messages.unshift(getMessage("#F0CC04",_loc2_.message));
         }
         if(_messages.length > 0 && _chatOutput.textField.text == getMessage("#F0CC04",LocText.current.text("dialog/tutorial/slotmachine/title")))
         {
            _content.tweenTo(0.5,{
               "x":_left,
               "delay":2,
               "onComplete":showNextReward
            });
         }
         else
         {
            showNextReward();
         }
      }
      
      private function getMessage(param1:String, param2:String) : String
      {
         var _loc5_:* = null;
         var _loc3_:* = null;
         if(param2 == "")
         {
            return "";
         }
         var _loc4_:String = null;
         if(UiGuildChatTab.ITEM_PATTERN.test(param2))
         {
            _loc4_ = UiGuildChatTab.ITEM_PATTERN.exec(param2);
         }
         if(_loc4_)
         {
            _loc5_ = new LinkedItem(_loc4_);
            _chatOutput.registerItem(_loc4_,_loc5_.iconImageUrl,_loc5_);
         }
         else if(UiGuildChatTab.BOOSTER_Pattern.test(param2))
         {
            _loc4_ = UiGuildChatTab.BOOSTER_Pattern.exec(param2);
            _loc3_ = new LinkedBooster(_loc4_);
            _chatOutput.registerItem(_loc4_,_loc3_.imageUrl,_loc3_);
         }
         return "<font color=\'" + param1 + "\'>" + param2 + "</font><br>";
      }
      
      private function handleLink(param1:InteractionEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:String = param1.linkText;
         if(_loc5_.indexOf("whisper;") === 0)
         {
            _loc2_ = _loc5_.substr(8);
            ViewManager.instance.loadCharacter(User.current.character.guild.getMember(_loc2_,true).id,null);
         }
         else if(_loc5_.indexOf("guild;") === 0)
         {
            _loc3_ = _loc5_.substr(6);
            ViewManager.instance.loadGuild(parseInt(_loc3_),null);
         }
         else if(_loc5_.indexOf("character;") === 0)
         {
            _loc4_ = _loc5_.substr(10);
            ViewManager.instance.loadCharacter(parseInt(_loc4_),null);
         }
      }
      
      public function socketConnectionEnabled() : void
      {
         if(_visible)
         {
            show();
         }
      }
   }
}
