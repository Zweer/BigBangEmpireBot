package com.playata.application.ui.elements.stream
{
   import com.playata.application.data.character.AvatarPhotoImagePool;
   import com.playata.application.data.stream.PrivateConversation;
   import com.playata.application.data.stream.PrivateConversationMember;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.effects.ScaleInOutEffect;
   import com.playata.application.ui.elements.generic.UiCounterBubble;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.framework.core.util.StringUtil;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.IImage;
   import com.playata.framework.display.ui.IListItem;
   import com.playata.framework.display.ui.controls.ListLine;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.stream.SymbolPrivateConversationStreamGeneric;
   
   public class UiPrivateConversationStream extends ListLine
   {
       
      
      private var _privateConversation:PrivateConversation = null;
      
      private var _rawContent:SymbolPrivateConversationStreamGeneric = null;
      
      private var _btnLoadMore:UiButton = null;
      
      private var _loading:Boolean = false;
      
      private var _currentAvatarMemberId:int = -1;
      
      private var _loadingEffect:ScaleInOutEffect = null;
      
      public function UiPrivateConversationStream(param1:PrivateConversation, param2:int)
      {
         _privateConversation = param1;
         _rawContent = new SymbolPrivateConversationStreamGeneric();
         super(_rawContent,param2);
         _btnLoadMore = new UiButton(_rawContent.btnLoadMore,LocText.current.text("panel_streams/private_conversation/load_more_tooltip"),handleClickLoadMore);
         _loadingEffect = new ScaleInOutEffect(_rawContent.iconLoading,0.5,1.2);
      }
      
      public function refreshLocalization() : void
      {
         _btnLoadMore.tooltip = LocText.current.text("panel_streams/private_conversation/load_more_tooltip");
      }
      
      override public function get backgroundHighlight() : IDisplayObject
      {
         if(_privateConversation && _privateConversation.isLoadingItem)
         {
            return null;
         }
         return _rawContent.backgroundHighlight;
      }
      
      override public function get backgroundOdd() : IDisplayObject
      {
         if(_privateConversation && _privateConversation.isLoadingItem)
         {
            return null;
         }
         return _rawContent.backgroundOdd;
      }
      
      override public function get backgroundEven() : IDisplayObject
      {
         if(_privateConversation && _privateConversation.isLoadingItem)
         {
            return null;
         }
         return _rawContent.backgroundEven;
      }
      
      override public function refresh(param1:IListItem, param2:int) : void
      {
         super.refresh(param1,param2);
         if(!param1)
         {
            return;
         }
         refreshContent();
      }
      
      private function refreshContent() : void
      {
         if(!_privateConversation)
         {
            return;
         }
         _loadingEffect.stop();
         try
         {
            if(_privateConversation.isLoadingItem)
            {
               _rawContent.btnLoadMore.visible = !_loading;
               _rawContent.iconLoading.visible = _loading;
               if(_loading)
               {
                  _loadingEffect.play();
               }
               _rawContent.txtSubject.visible = false;
               _rawContent.txtLastAction.visible = false;
               _rawContent.txtMembers.visible = false;
               _rawContent.unreadCounter.visible = false;
               _rawContent.iconGroupChat.visible = false;
               _rawContent.iconAvatar.visible = false;
               _rawContent.backgroundIcon.visible = false;
               _rawContent.backgroundHighlight.visible = false;
               _rawContent.backgroundOdd.visible = false;
            }
            else
            {
               _rawContent.btnLoadMore.visible = false;
               _rawContent.iconLoading.visible = false;
               _rawContent.txtSubject.visible = true;
               _rawContent.txtLastAction.visible = true;
               _rawContent.backgroundIcon.visible = true;
               _privateConversation = item as PrivateConversation;
               _rawContent.txtLastAction.text = _privateConversation.lastActionString;
               _rawContent.txtSubject.text = StringUtil.cutLength(_privateConversation.title,20);
               if(_privateConversation.isGroup)
               {
                  _rawContent.txtMembers.text = _privateConversation.membersString;
               }
               _rawContent.txtMembers.visible = _privateConversation.isGroup;
               _rawContent.iconGroupChat.visible = _privateConversation.isGroup;
               _rawContent.iconAvatar.visible = !_rawContent.iconGroupChat.visible;
               if(_rawContent.iconAvatar.visible)
               {
                  setAvatarImage();
               }
               _rawContent.unreadCounter.visible = _privateConversation.unreadCount > 0;
               if(_rawContent.unreadCounter.visible)
               {
                  UiCounterBubble.setIntValue(_rawContent.unreadCounter,_privateConversation.unreadCount);
               }
            }
            return;
         }
         catch(e:Error)
         {
            return;
         }
      }
      
      public function openPrivateConversation(param1:InteractionEvent) : void
      {
         interactionEvent = param1;
         if(!_privateConversation)
         {
            return;
         }
         if(_privateConversation.isLoadingItem)
         {
            return;
         }
         ViewManager.instance.baseUserPanel.streamsPanel.openPrivateConversation(_privateConversation,function():void
         {
            refreshContent();
         });
      }
      
      private function setAvatarImage() : void
      {
         if(!_privateConversation)
         {
            return;
         }
         if(_privateConversation.isGroup)
         {
            return;
         }
         var member:PrivateConversationMember = _privateConversation.singleConversationMember;
         if(!member)
         {
            return;
         }
         if(_currentAvatarMemberId == member.id)
         {
            return;
         }
         _currentAvatarMemberId = member.id;
         _rawContent.iconAvatar.removeAllChildren(true);
         var onAvatarImageComplete:Function = function(param1:IImage):void
         {
            if(param1)
            {
               _rawContent.iconAvatar.addChild(param1);
            }
         };
         try
         {
            var fullHash:String = member.imageHash + "|" + member.isOnline.toString();
            AvatarPhotoImagePool.getImage(fullHash,onAvatarImageComplete,0.375);
            return;
         }
         catch(e:Error)
         {
            return;
         }
      }
      
      private function handleClickLoadMore(param1:InteractionEvent) : void
      {
         if(!_privateConversation)
         {
            return;
         }
         if(!_privateConversation.isLoadingItem)
         {
            return;
         }
         if(_loading)
         {
            return;
         }
         _btnLoadMore.visible = false;
         _rawContent.iconLoading.visible = true;
         _loadingEffect.play();
         ViewManager.instance.baseUserPanel.streamsPanel.loadMorePrivateConversationStreams();
      }
   }
}
