package com.playata.application.ui.elements.stream
{
   import com.playata.application.data.stream.PrivateConversationMessage;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.effects.ScaleInOutEffect;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.ui.IListItem;
   import com.playata.framework.display.ui.controls.ListLine;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import flash.desktop.Clipboard;
   import visuals.ui.elements.stream.SymbolPrivateConversationMessageLoadMoreGeneric;
   import visuals.ui.elements.stream.SymbolPrivateConversationMessageOtherGeneric;
   import visuals.ui.elements.stream.SymbolPrivateConversationMessageOwnGeneric;
   import visuals.ui.elements.stream.SymbolPrivateConversationMessageSystemGeneric;
   
   public class UiPrivateConversationMessage extends ListLine
   {
      
      private static const BORDER:int = 10;
      
      private static const MAX_MESSAGE_WIDTH:int = 450;
      
      private static const MIN_MESSAGE_HEIGHT:int = 22;
       
      
      private var _privateConversationMessage:PrivateConversationMessage = null;
      
      private var _rawContent:Sprite = null;
      
      private var _rawContentOwn:SymbolPrivateConversationMessageOwnGeneric = null;
      
      private var _rawContentOther:SymbolPrivateConversationMessageOtherGeneric = null;
      
      private var _rawContentSystem:SymbolPrivateConversationMessageSystemGeneric = null;
      
      private var _rawContentLoadMore:SymbolPrivateConversationMessageLoadMoreGeneric = null;
      
      private var _btnLoadMorePrevious:UiButton = null;
      
      private var _btnLoadMoreNext:UiButton = null;
      
      private var _btnDelete:UiButton = null;
      
      private var _btnCopyOwn:UiButton = null;
      
      private var _btnCopyOther:UiButton = null;
      
      private var _selecting:Boolean = false;
      
      private var _ownClickHandler:InteractiveDisplayObject = null;
      
      private var _otherClickHandler:InteractiveDisplayObject = null;
      
      private var _loadingEffect:ScaleInOutEffect;
      
      public function UiPrivateConversationMessage(param1:PrivateConversationMessage, param2:int)
      {
         _rawContentOwn = new SymbolPrivateConversationMessageOwnGeneric();
         _rawContentOther = new SymbolPrivateConversationMessageOtherGeneric();
         _rawContentSystem = new SymbolPrivateConversationMessageSystemGeneric();
         _rawContentOwn.y = 10;
         _rawContentOther.y = 10;
         _rawContentSystem.y = 10;
         _rawContent = new Sprite();
         _rawContent.addChild(_rawContentOwn);
         _rawContent.addChild(_rawContentOther);
         _rawContent.addChild(_rawContentSystem);
         _rawContentOwn.txtMessage.selectable = true;
         _rawContentOwn.txtMessage.interactionEnabled = true;
         _rawContentOwn.txtMessage.height = 10;
         _rawContentOwn.spacer.height = 10;
         _rawContentOwn.bubble.height = 10;
         _rawContentOwn.txtCreation.y = 0;
         _rawContentOther.txtMessage.selectable = true;
         _rawContentOther.txtMessage.interactionEnabled = true;
         _rawContentOther.txtMessage.height = 10;
         _rawContentOther.spacer.height = 10;
         _rawContentOther.bubble.height = 10;
         _rawContentOther.txtCreation.y = 0;
         _rawContentSystem.txtMessage.height = 10;
         _rawContentSystem.spacer.height = 10;
         _rawContentSystem.bubble.height = 10;
         _rawContentSystem.txtCreation.y = 0;
         _ownClickHandler = new InteractiveDisplayObject(_rawContentOwn);
         _ownClickHandler.onClick.add(handleClickMessage);
         _otherClickHandler = new InteractiveDisplayObject(_rawContentOther);
         _otherClickHandler.onClick.add(handleClickOtherMessage);
         if(!Environment.info.isTouchScreen)
         {
            _rawContentOwn.txtMessage.onInteractionDown.add(handleInteractionDown);
            _rawContentOwn.txtMessage.onInteractionUp.add(handleInteractionUp);
            _rawContentOwn.txtMessage.onInteractionMove.add(handleInteractionMove);
         }
         _btnDelete = new UiButton(_rawContentOwn.btnDelete,LocText.current.text("panel_streams/private_conversation_message/delete_tooltip"),handleClickDelete);
         _btnCopyOwn = new UiButton(_rawContentOwn.btnCopy,"",handleClickCopy);
         _btnCopyOther = new UiButton(_rawContentOther.btnCopy,"",handleClickCopy);
         _rawContentOwn.btnCopy.visible = false;
         _rawContentOther.btnCopy.visible = false;
         super(_rawContent,param2);
      }
      
      public function refreshLocalization() : void
      {
         _btnDelete.tooltip = LocText.current.text("panel_streams/private_conversation_message/delete_tooltip");
         if(_btnLoadMorePrevious)
         {
            _btnLoadMorePrevious.tooltip = LocText.current.text("panel_streams/private_conversation_message/load_previous_tooltip");
         }
         if(_btnLoadMoreNext)
         {
            _btnLoadMoreNext.tooltip = LocText.current.text("panel_streams/private_conversation_message/load_next_tooltip");
         }
      }
      
      override public function get height() : Number
      {
         if(!_privateConversationMessage)
         {
            return 35;
         }
         if(!_rawContentOwn && !_rawContentOther && !_rawContentSystem)
         {
            return 1;
         }
         if(_privateConversationMessage.isLoadMorePreviousMessage || _privateConversationMessage.isLoadMoreNextMessage)
         {
            return 35;
         }
         if(_privateConversationMessage.isSystem)
         {
            return Math.ceil(_rawContentSystem.spacer.height);
         }
         if(_privateConversationMessage.isMyMessage)
         {
            return Math.ceil(_rawContentOwn.spacer.height);
         }
         return Math.ceil(_rawContentOther.spacer.height);
      }
      
      override public function refresh(param1:IListItem, param2:int) : void
      {
         super.refresh(param1,param2);
         if(!param1)
         {
            return;
         }
         if(param1 as PrivateConversationMessage == _privateConversationMessage)
         {
            refreshDateTime();
            return;
         }
         _privateConversationMessage = param1 as PrivateConversationMessage;
         refreshContent();
      }
      
      private function refreshDateTime() : void
      {
         if(_privateConversationMessage.isLoadMorePreviousMessage || _privateConversationMessage.isLoadMoreNextMessage)
         {
            return;
         }
         if(_privateConversationMessage.isSystem)
         {
            if(_privateConversationMessage.dateTime != _rawContentSystem.txtCreation.text)
            {
               refreshContent();
            }
         }
         else if(_privateConversationMessage.isMyMessage)
         {
            if(_privateConversationMessage.dateTime != _rawContentOwn.txtCreation.text)
            {
               refreshContent();
            }
         }
         else if(_privateConversationMessage.dateTime != _rawContentOther.txtCreation.text)
         {
            refreshContent();
         }
      }
      
      private function refreshContent() : void
      {
         var _loc2_:int = 0;
         var _loc5_:* = 0;
         var _loc1_:* = 0;
         var _loc4_:* = 0;
         var _loc3_:* = 0;
         if(_privateConversationMessage.isLoadMorePreviousMessage)
         {
            _rawContentOwn.visible = false;
            _rawContentOther.visible = false;
            _rawContentSystem.visible = false;
            createLoadMoreUI();
         }
         else if(_privateConversationMessage.isLoadMoreNextMessage)
         {
            _rawContentOwn.visible = false;
            _rawContentOther.visible = false;
            _rawContentSystem.visible = false;
            createLoadMoreUI();
         }
         else if(_privateConversationMessage.isSystem)
         {
            _rawContentOwn.visible = false;
            _rawContentOther.visible = false;
            _rawContentSystem.visible = true;
            if(_rawContentLoadMore)
            {
               _rawContentLoadMore.visible = false;
            }
            _rawContentSystem.txtMessage.x = 61;
            _rawContentSystem.txtMessage.width = 450;
            _rawContentSystem.bubble.x = 56;
            _rawContentSystem.txtCreation.x = 455;
            _rawContentSystem.txtCreation.width = 181;
            _rawContentSystem.txtCreation.text = _privateConversationMessage.dateTime;
            _loc1_ = Number(_rawContentSystem.txtCreation.textWidth + 10);
            _loc3_ = Number(_rawContentSystem.txtCreation.width - _loc1_);
            _rawContentSystem.txtCreation.width = _loc1_;
            _rawContentSystem.txtCreation.x = _rawContentSystem.txtCreation.x + (_loc3_ - 10 * 2);
            _rawContentSystem.txtMessage.htmlText = _privateConversationMessage.message;
            _loc4_ = Number(Math.max(_rawContentSystem.txtMessage.textHeight + 10,22));
            _rawContentSystem.txtMessage.height = _loc4_;
            _rawContentSystem.txtMessage.width = _rawContentSystem.txtMessage.textWidth + 10;
            if(_rawContentSystem.txtMessage.width < 450 - 40)
            {
               _rawContentSystem.txtCreation.y = _rawContentSystem.txtMessage.y + _loc4_ - _rawContentSystem.txtCreation.height + _loc2_;
               _rawContentSystem.bubble.width = _rawContentSystem.txtMessage.width + _rawContentSystem.txtCreation.width + 10 * 4;
               _rawContentSystem.bubble.height = _loc4_ + 10 + _loc2_;
            }
            else
            {
               _rawContentSystem.txtCreation.y = _rawContentSystem.txtMessage.y + _loc4_ + _loc2_;
               _rawContentSystem.bubble.width = _rawContentSystem.txtMessage.width + 10 * 2;
               _rawContentSystem.bubble.height = _loc4_ + 20 + 10 + _loc2_;
            }
            _loc5_ = Number(586 - _rawContentSystem.bubble.width - 10 * 2);
            _rawContentSystem.txtMessage.x = _rawContentSystem.txtMessage.x + _loc5_;
            _rawContentSystem.bubble.x = _rawContentSystem.bubble.x + _loc5_;
            _rawContentSystem.x = -_loc5_ / 2 - 20;
            _rawContentSystem.spacer.height = _rawContentSystem.bubble.height + 10;
         }
         else if(_privateConversationMessage.isMyMessage)
         {
            _loc2_ = 0;
            _rawContentOwn.visible = true;
            _rawContentOther.visible = false;
            _rawContentSystem.visible = false;
            if(_rawContentLoadMore)
            {
               _rawContentLoadMore.visible = false;
            }
            _rawContentOwn.btnDelete.visible = false;
            _rawContentOwn.btnCopy.visible = false;
            _rawContentOwn.txtMessage.x = 80;
            _rawContentOwn.txtMessage.width = 450;
            _rawContentOwn.bubble.x = 66;
            _rawContentOwn.txtCreation.x = 464;
            _rawContentOwn.txtCreation.width = 181;
            _rawContentOwn.txtCreation.text = _privateConversationMessage.dateTime;
            _loc1_ = Number(_rawContentOwn.txtCreation.textWidth + 10);
            _loc3_ = Number(_rawContentOwn.txtCreation.width - _loc1_);
            _rawContentOwn.txtCreation.width = _loc1_;
            _rawContentOwn.txtCreation.x = _rawContentOwn.txtCreation.x + (_loc3_ - 10 * 2);
            _rawContentOwn.txtMessage.htmlText = _privateConversationMessage.message;
            _loc4_ = Number(Math.max(_rawContentOwn.txtMessage.textHeight + 10,22));
            _rawContentOwn.txtMessage.height = _loc4_;
            _rawContentOwn.txtMessage.width = _rawContentOwn.txtMessage.textWidth + 10;
            if(_rawContentOwn.txtMessage.width < 450 - 40)
            {
               _rawContentOwn.txtCreation.y = _rawContentOwn.txtMessage.y + _loc4_ - _rawContentOwn.txtCreation.height + _loc2_;
               _rawContentOwn.bubble.width = _rawContentOwn.txtMessage.width + _rawContentOwn.txtCreation.width + 10 * 4;
               _rawContentOwn.bubble.height = _loc4_ + 10 + _loc2_;
            }
            else
            {
               _rawContentOwn.txtCreation.y = _rawContentOwn.txtMessage.y + _loc4_ + _loc2_;
               _rawContentOwn.bubble.width = _rawContentOwn.txtMessage.width + 10 * 2;
               _rawContentOwn.bubble.height = _loc4_ + 20 + 10 + _loc2_;
            }
            _loc5_ = Number(586 - _rawContentOwn.bubble.width - 10 * 2);
            _rawContentOwn.txtMessage.x = _rawContentOwn.txtMessage.x + _loc5_;
            _rawContentOwn.bubble.x = _rawContentOwn.bubble.x + _loc5_;
            _rawContentOwn.spacer.height = _rawContentOwn.bubble.height + 10;
            _rawContentOwn.btnDelete.x = _rawContentOwn.bubble.x - 22;
         }
         else
         {
            _rawContentOwn.visible = false;
            _rawContentOther.visible = true;
            _rawContentSystem.visible = false;
            if(_rawContentLoadMore)
            {
               _rawContentLoadMore.visible = false;
            }
            _rawContentOther.btnCopy.visible = false;
            _rawContentOther.txtMessage.x = 30;
            _rawContentOther.txtMessage.width = 450;
            _rawContentOther.bubble.x = 10;
            _rawContentOther.txtCreation.x = 30;
            _rawContentOther.txtCreation.width = 133;
            if(_privateConversationMessage.conversation.isGroup)
            {
               _rawContentOther.txtSenderName.visible = true;
               _rawContentOther.txtSenderName.text = _privateConversationMessage.sender != null?_privateConversationMessage.sender.name:"";
               _rawContentOther.txtMessage.y = _rawContentOther.txtSenderName.y + 25;
            }
            else
            {
               _rawContentOther.txtSenderName.visible = false;
               _rawContentOther.txtMessage.y = _rawContentOther.txtSenderName.y;
            }
            _rawContentOther.txtCreation.text = _privateConversationMessage.dateTime;
            _rawContentOther.txtCreation.width = _rawContentOther.txtCreation.textWidth + 10;
            _rawContentOther.txtMessage.htmlText = _privateConversationMessage.message;
            _loc4_ = Number(Math.max(_rawContentOther.txtMessage.textHeight + 10,22));
            _rawContentOther.txtMessage.height = _loc4_;
            _rawContentOther.txtMessage.width = _rawContentOther.txtMessage.textWidth + 10;
            if(_privateConversationMessage.conversation.isGroup)
            {
               _rawContentOther.bubble.y = _rawContentOther.txtSenderName.y - 7;
            }
            else
            {
               _rawContentOther.bubble.y = _rawContentOther.txtMessage.y - 7;
            }
            _rawContentOther.btnCopy.y = _rawContentOther.bubble.y + 18;
            if(_rawContentOther.txtMessage.width < 450 - 40)
            {
               _rawContentOther.txtCreation.x = _rawContentOther.txtMessage.x + _rawContentOther.txtMessage.width + 10;
               _rawContentOther.txtCreation.y = _rawContentOther.txtMessage.y + _loc4_ - _rawContentOther.txtCreation.height + _loc2_;
               _rawContentOther.bubble.width = _rawContentOther.txtMessage.width + _rawContentOther.txtCreation.width + 10 * 4;
               _rawContentOther.bubble.height = _loc4_ + 10 + _loc2_ + (!!_privateConversationMessage.conversation.isGroup?25:0);
            }
            else
            {
               _rawContentOther.txtCreation.x = _rawContentOther.txtMessage.x + _rawContentOther.txtMessage.width - _rawContentOther.txtCreation.width;
               _rawContentOther.txtCreation.y = _rawContentOther.txtMessage.y + _loc4_ + _loc2_;
               _rawContentOther.bubble.width = _rawContentOther.txtMessage.width + 10 * 2;
               _rawContentOther.bubble.height = _loc4_ + 20 + 10 + _loc2_ + (!!_privateConversationMessage.conversation.isGroup?25:0);
            }
            _rawContentOther.spacer.height = _rawContentOther.bubble.height + 10;
         }
      }
      
      private function createLoadMoreUI() : void
      {
         if(_rawContentLoadMore)
         {
            _btnLoadMorePrevious.visible = _privateConversationMessage.isLoadMorePreviousMessage;
            _btnLoadMoreNext.visible = _privateConversationMessage.isLoadMoreNextMessage;
            return;
         }
         _rawContentLoadMore = new SymbolPrivateConversationMessageLoadMoreGeneric();
         _rawContentLoadMore.x = 265;
         _rawContentLoadMore.y = 10;
         _rawContent.addChild(_rawContentLoadMore);
         _rawContentLoadMore.iconLoading.visible = false;
         _btnLoadMorePrevious = new UiButton(_rawContentLoadMore.btnLoadMorePrevious,LocText.current.text("panel_streams/private_conversation_message/load_previous_tooltip"),handleClickLoadMorePrevious);
         _btnLoadMoreNext = new UiButton(_rawContentLoadMore.btnLoadMoreNext,LocText.current.text("panel_streams/private_conversation_message/load_next_tooltip"),handleClickLoadMoreNext);
         _btnLoadMorePrevious.visible = _privateConversationMessage.isLoadMorePreviousMessage;
         _btnLoadMoreNext.visible = _privateConversationMessage.isLoadMoreNextMessage;
         _loadingEffect = new ScaleInOutEffect(_rawContentLoadMore.iconLoading,0.5,1.2);
      }
      
      private function handleClickLoadMorePrevious(param1:InteractionEvent) : void
      {
         interactionEvent = param1;
         if(_rawContentLoadMore.iconLoading.visible)
         {
            return;
         }
         _btnLoadMorePrevious.visible = false;
         _btnLoadMoreNext.visible = false;
         _rawContentLoadMore.iconLoading.visible = true;
         if(_loadingEffect)
         {
            _loadingEffect.play();
         }
         _privateConversationMessage.conversation = ViewManager.instance.baseUserPanel.streamsPanel.privateConversationMessageContainer.privateConversation;
         if(_privateConversationMessage.isLoadMorePreviousMessage)
         {
            _privateConversationMessage.conversation.loadMorePrevious(function():void
            {
               _rawContentLoadMore.iconLoading.visible = false;
               if(_loadingEffect)
               {
                  _loadingEffect.stop();
               }
               _btnLoadMorePrevious.visible = true;
               ViewManager.instance.baseUserPanel.streamsPanel.privateConversationMessageContainer.refresh();
            });
         }
      }
      
      private function handleClickLoadMoreNext(param1:InteractionEvent) : void
      {
         interactionEvent = param1;
         if(_rawContentLoadMore.iconLoading.visible)
         {
            return;
         }
         _btnLoadMorePrevious.visible = false;
         _btnLoadMoreNext.visible = false;
         _rawContentLoadMore.iconLoading.visible = true;
         if(_loadingEffect)
         {
            _loadingEffect.play();
         }
         _privateConversationMessage.conversation = ViewManager.instance.baseUserPanel.streamsPanel.privateConversationMessageContainer.privateConversation;
         if(_privateConversationMessage.isLoadMoreNextMessage)
         {
            _privateConversationMessage.conversation.loadMoreNext(function():void
            {
               _rawContentLoadMore.iconLoading.visible = false;
               if(_loadingEffect)
               {
                  _loadingEffect.stop();
               }
               _btnLoadMoreNext.visible = true;
               ViewManager.instance.baseUserPanel.streamsPanel.privateConversationMessageContainer.refresh();
            });
         }
      }
      
      private function handleClickMessage(param1:InteractionEvent) : void
      {
         if(!_privateConversationMessage.isMyMessage || _privateConversationMessage.isDeleted || _privateConversationMessage.isSystem)
         {
            return;
         }
         if(_selecting)
         {
            return;
         }
         _rawContentOwn.btnDelete.visible = !_rawContentOwn.btnDelete.visible;
         toggleCopyButton();
      }
      
      private function handleClickOtherMessage(param1:InteractionEvent) : void
      {
         if(_privateConversationMessage.isMyMessage || _privateConversationMessage.isDeleted || _privateConversationMessage.isSystem)
         {
            return;
         }
         toggleCopyButton();
      }
      
      private function toggleCopyButton() : void
      {
         var _loc1_:int = 0;
         if(Environment.info.isTouchScreen && !_privateConversationMessage.isDeleted && !_privateConversationMessage.isSystem)
         {
            _loc1_ = 0;
            if(_privateConversationMessage.isMyMessage)
            {
               _loc1_ = 41;
               _loc1_ = _loc1_ * (!!_rawContentOwn.btnCopy.visible?1:-1);
               _rawContentOwn.btnCopy.visible = !_rawContentOwn.btnCopy.visible;
               _rawContentOwn.btnDelete.x = _rawContentOwn.btnDelete.x + _loc1_;
               _rawContentOwn.bubble.x = _rawContentOwn.bubble.x + _loc1_;
               _rawContentOwn.txtCreation.x = _rawContentOwn.txtCreation.x + _loc1_;
               _rawContentOwn.txtMessage.x = _rawContentOwn.txtMessage.x + _loc1_;
            }
            else if(!_privateConversationMessage.isMyMessage)
            {
               _loc1_ = 41;
               _loc1_ = _loc1_ * (!!_rawContentOther.btnCopy.visible?-1:1);
               _rawContentOther.btnCopy.visible = !_rawContentOther.btnCopy.visible;
               _rawContentOther.bubble.x = _rawContentOther.bubble.x + _loc1_;
               _rawContentOther.txtCreation.x = _rawContentOther.txtCreation.x + _loc1_;
               _rawContentOther.txtMessage.x = _rawContentOther.txtMessage.x + _loc1_;
               _rawContentOther.txtSenderName.x = _rawContentOther.txtSenderName.x + _loc1_;
            }
         }
      }
      
      private function handleInteractionDown(param1:InteractionEvent) : void
      {
         if(!_privateConversationMessage.isMyMessage || _privateConversationMessage.isDeleted || _privateConversationMessage.isSystem)
         {
            return;
         }
         _selecting = false;
         param1.stopPropagation();
      }
      
      private function handleInteractionUp(param1:InteractionEvent) : void
      {
         if(!_privateConversationMessage.isMyMessage || _privateConversationMessage.isDeleted || _privateConversationMessage.isSystem)
         {
            return;
         }
         param1.stopPropagation();
      }
      
      private function handleInteractionMove(param1:InteractionEvent) : void
      {
         if(!_privateConversationMessage.isMyMessage || _privateConversationMessage.isDeleted || _privateConversationMessage.isSystem)
         {
            return;
         }
         _selecting = true;
         param1.stopPropagation();
      }
      
      private function handleClickDelete(param1:InteractionEvent) : void
      {
         interactionEvent = param1;
         _btnDelete.visible = false;
         toggleCopyButton();
         _privateConversationMessage.conversation.deleteMessage(_privateConversationMessage,function():void
         {
            refreshContent();
         });
      }
      
      private function handleClickCopy(param1:InteractionEvent) : void
      {
         toggleCopyButton();
         _btnDelete.visible = false;
         try
         {
            Clipboard.generalClipboard.setData("air:text",_privateConversationMessage.message);
            return;
         }
         catch(e:Error)
         {
            return;
         }
      }
   }
}
