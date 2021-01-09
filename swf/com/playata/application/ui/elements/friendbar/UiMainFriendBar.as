package com.playata.application.ui.elements.friendbar
{
   import com.playata.application.AppEnvironment;
   import com.playata.application.data.friendbar.FriendBarFriends;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.checkbox.UiCheckBox;
   import com.playata.framework.application.Environment;
   import com.playata.framework.data.DataObjectArray;
   import com.playata.framework.display.IImage;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.friendbar.FriendbarSymbolApplicationGeneric;
   
   public class UiMainFriendBar
   {
       
      
      private const MAX_FRIENDS:int = 10;
      
      private var _content:FriendbarSymbolApplicationGeneric = null;
      
      private var _btnScrollLeft:UiButton = null;
      
      private var _btnScrollRight:UiButton = null;
      
      private var _btnFilter:UiButton = null;
      
      private var _ckbShowOnlineFriends:UiCheckBox = null;
      
      private var _ckbShowGuildMember:UiCheckBox = null;
      
      private var _btnToggle:UiButton = null;
      
      private var _photo1:UiFriendPhoto = null;
      
      private var _photo2:UiFriendPhoto = null;
      
      private var _photo3:UiFriendPhoto = null;
      
      private var _photo4:UiFriendPhoto = null;
      
      private var _photo5:UiFriendPhoto = null;
      
      private var _photo6:UiFriendPhoto = null;
      
      private var _photo7:UiFriendPhoto = null;
      
      private var _photo8:UiFriendPhoto = null;
      
      private var _photo9:UiFriendPhoto = null;
      
      private var _photo10:UiFriendPhoto = null;
      
      private var _empty0:UiFriendEmpty = null;
      
      private var _empty1:UiFriendEmpty = null;
      
      private var _empty2:UiFriendEmpty = null;
      
      private var _empty3:UiFriendEmpty = null;
      
      private var _empty4:UiFriendEmpty = null;
      
      private var _empty5:UiFriendEmpty = null;
      
      private var _empty6:UiFriendEmpty = null;
      
      private var _empty7:UiFriendEmpty = null;
      
      private var _empty8:UiFriendEmpty = null;
      
      private var _empty9:UiFriendEmpty = null;
      
      private var _empty10:UiFriendEmpty = null;
      
      private var _friends:FriendBarFriends;
      
      private var _scrollOffset:int = 0;
      
      private var _showOnlineOnly:Boolean = false;
      
      private var _showGuildMember:Boolean = true;
      
      public function UiMainFriendBar(param1:FriendbarSymbolApplicationGeneric)
      {
         _friends = new FriendBarFriends();
         super();
         _content = param1;
         _content.filter.visible = false;
         _content.toggleButton.visible = Environment.info.isNativeMobile;
         _btnScrollLeft = new UiButton(_content.btnScrollLeft,"",onClickScrollLeft);
         _btnScrollRight = new UiButton(_content.btnScrollRight,"",onClickScrollRight);
         _btnToggle = new UiButton(_content.toggleButton,"",onClickToggle);
         _btnToggle.interactionOverMode = "none";
         _btnFilter = new UiButton(_content.btnFilter,"",onClickFilter);
         _ckbShowOnlineFriends = new UiCheckBox(_content.filter.checkOnlinePlayer,_showOnlineOnly,"",onShowOnlineFriendsChanged,null,_content.filter.txtOnlinePlayer);
         _ckbShowGuildMember = new UiCheckBox(_content.filter.checkGuildMember,_showGuildMember,"",onShowGuildMemberChanged,null,_content.filter.txtGuildMember);
         _friends.showOnlineFriendsOnly(_showOnlineOnly);
         _friends.showGuildMembers(_showGuildMember);
         setFilterCaption();
         _photo1 = new UiFriendPhoto(_content.friend1);
         _photo2 = new UiFriendPhoto(_content.friend2);
         _photo3 = new UiFriendPhoto(_content.friend3);
         _photo4 = new UiFriendPhoto(_content.friend4);
         _photo5 = new UiFriendPhoto(_content.friend5);
         _photo6 = new UiFriendPhoto(_content.friend6);
         _photo7 = new UiFriendPhoto(_content.friend7);
         _photo8 = new UiFriendPhoto(_content.friend8);
         _photo9 = new UiFriendPhoto(_content.friend9);
         _photo10 = new UiFriendPhoto(_content.friend10);
         _empty0 = new UiFriendEmpty(_content.empty0);
         _empty1 = new UiFriendEmpty(_content.empty1);
         _empty2 = new UiFriendEmpty(_content.empty2);
         _empty3 = new UiFriendEmpty(_content.empty3);
         _empty4 = new UiFriendEmpty(_content.empty4);
         _empty5 = new UiFriendEmpty(_content.empty5);
         _empty6 = new UiFriendEmpty(_content.empty6);
         _empty7 = new UiFriendEmpty(_content.empty7);
         _empty8 = new UiFriendEmpty(_content.empty8);
         _empty9 = new UiFriendEmpty(_content.empty9);
         _empty10 = new UiFriendEmpty(_content.empty10);
         _content.filter.bringToTop();
         _content.backgroundBlack.visible = true;
         hide();
      }
      
      public function dispose() : void
      {
         _btnScrollLeft.dispose();
         _btnScrollLeft = null;
         _btnScrollRight.dispose();
         _btnScrollRight = null;
         _btnFilter.dispose();
         _btnFilter = null;
         _ckbShowOnlineFriends.dispose();
         _ckbShowOnlineFriends = null;
         _ckbShowGuildMember.dispose();
         _ckbShowGuildMember = null;
         _photo1.dispose();
         _photo2.dispose();
         _photo3.dispose();
         _photo4.dispose();
         _photo5.dispose();
         _photo6.dispose();
         _photo7.dispose();
         _photo8.dispose();
         _photo9.dispose();
         _photo10.dispose();
         _empty0.dispose();
         _empty1.dispose();
         _empty2.dispose();
         _empty3.dispose();
         _empty4.dispose();
         _empty5.dispose();
         _empty6.dispose();
         _empty7.dispose();
         _empty8.dispose();
         _empty9.dispose();
         _empty10.dispose();
         Environment.display.displayContext.stage.removeChild(_content);
      }
      
      public function get content() : FriendbarSymbolApplicationGeneric
      {
         return _content;
      }
      
      public function show() : void
      {
         _content.toggleButton.visible = Environment.info.isNativeMobile;
         _content.empty10.visible = true;
         _content.empty9.visible = true;
         _content.empty8.visible = true;
         _content.empty7.visible = true;
         _content.empty6.visible = true;
         _content.empty5.visible = true;
         _content.empty4.visible = true;
         _content.empty3.visible = true;
         _content.empty2.visible = true;
         _content.empty1.visible = true;
         _content.empty0.visible = true;
         _content.friend10.visible = true;
         _content.friend9.visible = true;
         _content.friend8.visible = true;
         _content.friend7.visible = true;
         _content.friend6.visible = true;
         _content.friend5.visible = true;
         _content.friend4.visible = true;
         _content.friend3.visible = true;
         _content.friend2.visible = true;
         _content.friend1.visible = true;
         refreshUI();
      }
      
      public function hide() : void
      {
         if(Environment.info.isNativeMobile)
         {
            _content.y = Environment.layout.appHeight;
         }
         else
         {
            _content.y = 630;
         }
         _content.toggleButton.visible = false;
         _content.btnScrollRight.visible = false;
         _content.btnScrollLeft.visible = false;
         _content.btnFilter.visible = false;
         _content.empty10.visible = false;
         _content.empty9.visible = false;
         _content.empty8.visible = false;
         _content.empty7.visible = false;
         _content.empty6.visible = false;
         _content.empty5.visible = false;
         _content.empty4.visible = false;
         _content.empty3.visible = false;
         _content.empty2.visible = false;
         _content.empty1.visible = false;
         _content.empty0.visible = false;
         _content.friend10.visible = false;
         _content.friend9.visible = false;
         _content.friend8.visible = false;
         _content.friend7.visible = false;
         _content.friend6.visible = false;
         _content.friend5.visible = false;
         _content.friend4.visible = false;
         _content.friend3.visible = false;
         _content.friend2.visible = false;
         _content.friend1.visible = false;
         _content.filter.visible = false;
      }
      
      public function slideInFriendBar() : void
      {
         if(Environment.info.isNativeMobile)
         {
            AppEnvironment.friendBar.initFriends(User.current.id,User.current.sessionId);
         }
         _content.y = Environment.layout.appHeight;
         _content.visible = true;
         _content.tweenTo(0.5,{
            "y":Environment.layout.appHeight - 125,
            "onComplete":show
         });
      }
      
      public function slideOutFriendBar() : void
      {
         _content.tweenTo(0.5,{
            "y":Environment.layout.appHeight,
            "onComplete":function():void
            {
               hide();
               _content.toggleButton.visible = Environment.info.isNativeMobile;
            }
         });
      }
      
      private function onClickToggle(param1:InteractionEvent) : void
      {
         if(_content.y == Environment.layout.appHeight)
         {
            slideInFriendBar();
         }
         else
         {
            slideOutFriendBar();
         }
      }
      
      private function setFilterCaption() : void
      {
         var _loc1_:Number = _content.filter.background.width;
         var _loc3_:Number = _loc1_ - _content.filter.txtOnlinePlayer.width;
         _content.filter.txtOnlinePlayer.text = LocText.current.text("friendbar/setting/only_online_friends");
         _content.filter.txtOnlinePlayer.width = _content.filter.txtOnlinePlayer.textWidth + 10;
         _content.filter.txtGuildMember.text = LocText.current.text("friendbar/setting/show_guild_member");
         _content.filter.txtGuildMember.width = _content.filter.txtGuildMember.textWidth + 10;
         var _loc2_:Number = (_content.filter.txtOnlinePlayer.width > _content.filter.txtGuildMember.width?_content.filter.txtOnlinePlayer.width:Number(_content.filter.txtGuildMember.width)) + _loc3_;
         _loc3_ = _loc2_ - _loc1_;
         _content.filter.background.width = _loc2_;
         _content.filter.x = _content.filter.x - (_loc3_ + 20);
      }
      
      public function refreshLocalization() : void
      {
         setFilterCaption();
         _empty0.refreshLocalization();
         _empty1.refreshLocalization();
         _empty2.refreshLocalization();
         _empty3.refreshLocalization();
         _empty4.refreshLocalization();
         _empty5.refreshLocalization();
         _empty6.refreshLocalization();
         _empty7.refreshLocalization();
         _empty8.refreshLocalization();
         _empty9.refreshLocalization();
         _empty10.refreshLocalization();
      }
      
      public function get friends() : FriendBarFriends
      {
         return _friends;
      }
      
      public function get friendCount() : int
      {
         return _friends.allFriendsCount;
      }
      
      private function onClickScrollLeft(param1:InteractionEvent) : void
      {
         _scrollOffset = Number(_scrollOffset) + 1;
         if(_friends.count < 10 + _scrollOffset)
         {
            _scrollOffset = _friends.count - 10;
         }
         refreshUI();
      }
      
      private function onClickScrollRight(param1:InteractionEvent) : void
      {
         _scrollOffset = Number(_scrollOffset) - 1;
         if(_scrollOffset < 0)
         {
            _scrollOffset = 0;
         }
         refreshUI();
      }
      
      private function onClickFilter(param1:InteractionEvent) : void
      {
         _content.filter.visible = !_content.filter.visible;
      }
      
      public function updateFriendData(param1:DataObjectArray) : void
      {
         _friends.updateFriendData(param1);
         refreshUI();
      }
      
      public function addFriend(param1:int, param2:int, param3:String, param4:int, param5:Boolean, param6:IImage) : void
      {
         _friends.addFriend(param1,param2,param3,param4,param5,param6);
         refreshUI();
      }
      
      public function removeFriend(param1:int, param2:Boolean) : void
      {
         _friends.removeFriend(param1,param2);
         refreshUI();
      }
      
      public function leaveGuild() : void
      {
         _friends.leaveGuild();
         refreshUI();
      }
      
      public function updateFriend(param1:int, param2:int, param3:Boolean, param4:IImage) : void
      {
         _friends.updateFriend(param1,param2,param3,param4);
         refreshUI(param1);
      }
      
      public function refreshUI(param1:int = 0) : void
      {
         if(param1 > 0)
         {
            if(_photo1.visible && _photo1.friend && _photo1.friend.userId == param1)
            {
               _photo1.refresh(_photo1.friend);
            }
            if(_photo2.visible && _photo2.friend && _photo2.friend.userId == param1)
            {
               _photo2.refresh(_photo2.friend);
            }
            if(_photo3.visible && _photo3.friend && _photo3.friend.userId == param1)
            {
               _photo3.refresh(_photo3.friend);
            }
            if(_photo4.visible && _photo4.friend && _photo4.friend.userId == param1)
            {
               _photo4.refresh(_photo4.friend);
            }
            if(_photo5.visible && _photo5.friend && _photo5.friend.userId == param1)
            {
               _photo5.refresh(_photo5.friend);
            }
            if(_photo6.visible && _photo6.friend && _photo6.friend.userId == param1)
            {
               _photo6.refresh(_photo6.friend);
            }
            if(_photo7.visible && _photo7.friend && _photo7.friend.userId == param1)
            {
               _photo7.refresh(_photo7.friend);
            }
            if(_photo8.visible && _photo8.friend && _photo8.friend.userId == param1)
            {
               _photo8.refresh(_photo8.friend);
            }
            if(_photo9.visible && _photo9.friend && _photo9.friend.userId == param1)
            {
               _photo9.refresh(_photo9.friend);
            }
            if(_photo10.visible && _photo10.friend && _photo10.friend.userId == param1)
            {
               _photo10.refresh(_photo10.friend);
            }
            return;
         }
         if(_friends.count < 10 + _scrollOffset)
         {
            _scrollOffset = 0;
         }
         _btnFilter.visible = _friends.allFriendsCount > 1;
         _btnScrollLeft.visible = _friends.count > 10;
         _btnScrollRight.visible = _friends.count > 10;
         _btnScrollLeft.buttonEnabled = _scrollOffset < _friends.count - 10;
         _btnScrollRight.buttonEnabled = _scrollOffset > 0;
         _photo1.visible = _friends.count > 0 + _scrollOffset;
         _photo2.visible = _friends.count > 1 + _scrollOffset;
         _photo3.visible = _friends.count > 2 + _scrollOffset;
         _photo4.visible = _friends.count > 3 + _scrollOffset;
         _photo5.visible = _friends.count > 4 + _scrollOffset;
         _photo6.visible = _friends.count > 5 + _scrollOffset;
         _photo7.visible = _friends.count > 6 + _scrollOffset;
         _photo8.visible = _friends.count > 7 + _scrollOffset;
         _photo9.visible = _friends.count > 8 + _scrollOffset;
         _photo10.visible = _friends.count > 9 + _scrollOffset;
         _empty1.visible = !_photo1.visible;
         _empty2.visible = !_photo2.visible;
         _empty3.visible = !_photo3.visible;
         _empty4.visible = !_photo4.visible;
         _empty5.visible = !_photo5.visible;
         _empty6.visible = !_photo6.visible;
         _empty7.visible = !_photo7.visible;
         _empty8.visible = !_photo8.visible;
         _empty9.visible = !_photo9.visible;
         _empty10.visible = !_photo10.visible;
         if(_empty0.visible)
         {
            _empty0.refresh(isLoggedInAndTutorialFinished);
         }
         if(_empty1.visible)
         {
            _empty1.refresh(isLoggedInAndTutorialFinished);
         }
         if(_empty2.visible)
         {
            _empty2.refresh(isLoggedInAndTutorialFinished);
         }
         if(_empty3.visible)
         {
            _empty3.refresh(isLoggedInAndTutorialFinished);
         }
         if(_empty4.visible)
         {
            _empty4.refresh(isLoggedInAndTutorialFinished);
         }
         if(_empty5.visible)
         {
            _empty5.refresh(isLoggedInAndTutorialFinished);
         }
         if(_empty6.visible)
         {
            _empty6.refresh(isLoggedInAndTutorialFinished);
         }
         if(_empty7.visible)
         {
            _empty7.refresh(isLoggedInAndTutorialFinished);
         }
         if(_empty8.visible)
         {
            _empty8.refresh(isLoggedInAndTutorialFinished);
         }
         if(_empty9.visible)
         {
            _empty9.refresh(isLoggedInAndTutorialFinished);
         }
         if(_empty10.visible)
         {
            _empty10.refresh(isLoggedInAndTutorialFinished);
         }
         if(_photo1.visible)
         {
            _photo1.refresh(_friends.friends[0 + _scrollOffset]);
         }
         if(_photo2.visible)
         {
            _photo2.refresh(_friends.friends[1 + _scrollOffset]);
         }
         if(_photo3.visible)
         {
            _photo3.refresh(_friends.friends[2 + _scrollOffset]);
         }
         if(_photo4.visible)
         {
            _photo4.refresh(_friends.friends[3 + _scrollOffset]);
         }
         if(_photo5.visible)
         {
            _photo5.refresh(_friends.friends[4 + _scrollOffset]);
         }
         if(_photo6.visible)
         {
            _photo6.refresh(_friends.friends[5 + _scrollOffset]);
         }
         if(_photo7.visible)
         {
            _photo7.refresh(_friends.friends[6 + _scrollOffset]);
         }
         if(_photo8.visible)
         {
            _photo8.refresh(_friends.friends[7 + _scrollOffset]);
         }
         if(_photo9.visible)
         {
            _photo9.refresh(_friends.friends[8 + _scrollOffset]);
         }
         if(_photo10.visible)
         {
            _photo10.refresh(_friends.friends[9 + _scrollOffset]);
         }
      }
      
      private function get isLoggedInAndTutorialFinished() : Boolean
      {
         if(!User.current)
         {
            return false;
         }
         if(!ViewManager.instance)
         {
            return false;
         }
         if(!User.current)
         {
            return false;
         }
         if(!User.current.character)
         {
            return false;
         }
         return User.current.character.hasTutorialFlag("tutorial_finished");
      }
      
      private function onShowOnlineFriendsChanged(param1:Boolean) : void
      {
         _friends.showOnlineFriendsOnly(param1);
         refreshUI();
         AppEnvironment.friendBar.saveSetting({
            "sof":_ckbShowOnlineFriends.checked,
            "sgm":_ckbShowGuildMember.checked
         });
      }
      
      private function onShowGuildMemberChanged(param1:Boolean) : void
      {
         _friends.showGuildMembers(param1);
         refreshUI();
         AppEnvironment.friendBar.saveSetting({
            "sof":_ckbShowOnlineFriends.checked,
            "sgm":_ckbShowGuildMember.checked
         });
      }
      
      public function updateSettings(param1:Object) : void
      {
         _showOnlineOnly = param1.sof === true;
         _showGuildMember = param1.sgm !== false;
         if(_ckbShowOnlineFriends)
         {
            _ckbShowOnlineFriends.checked = _showOnlineOnly;
            _ckbShowGuildMember.checked = _showGuildMember;
            _friends.showOnlineFriendsOnly(_showOnlineOnly);
            _friends.showGuildMembers(_showGuildMember);
            refreshUI();
         }
      }
   }
}
