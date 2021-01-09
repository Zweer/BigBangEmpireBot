package com.playata.application.ui.elements.stream
{
   import com.playata.application.data.user.User;
   import com.playata.application.data.voucher.UserVoucher;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.display.ui.controls.List;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import com.playata.framework.tween.Tween;
   import visuals.ui.elements.stream.SymbolUserVoucherContainerGeneric;
   
   public class UiUserVoucherContainer
   {
       
      
      private var _content:SymbolUserVoucherContainerGeneric = null;
      
      private var _list:UiUserVoucherList = null;
      
      private var _btnFilter:UiButton = null;
      
      private var _userVoucherFilter:UiUserVoucherFilter = null;
      
      private var _offset:int = 0;
      
      private var _userVouchers:Vector.<UserVoucher>;
      
      private var _removedUserVouchers:Vector.<int>;
      
      private var _initialized:Boolean = false;
      
      private var _listLocked:Boolean = false;
      
      public function UiUserVoucherContainer(param1:SymbolUserVoucherContainerGeneric)
      {
         _userVouchers = new Vector.<UserVoucher>();
         _removedUserVouchers = new Vector.<int>();
         super();
         _content = param1;
         _content.txtTitle.text = LocText.current.text("panel_streams/tab_user_voucher_tooltip");
         _btnFilter = new UiButton(param1.btnFilter,"",onClickFilter);
         _list = new UiUserVoucherList(_content.list,onRedeem);
         _list.onListUpdated.add(refreshUI);
      }
      
      public function refreshLocalization() : void
      {
         _content.txtTitle.text = LocText.current.text("panel_streams/tab_user_voucher_tooltip");
         _list.refreshLocalization();
      }
      
      public function dispose() : void
      {
         _btnFilter.dispose();
         _btnFilter = null;
         _userVoucherFilter.dispose();
         _userVoucherFilter = null;
      }
      
      private function onClickFilter(param1:InteractionEvent) : void
      {
         _userVoucherFilter.toggle();
      }
      
      private function onFilterChanged() : void
      {
         _list.refreshList();
         _content.btnFilter.iconExclamationMark.visible = UiUserVoucherFilter.isFilterActive;
      }
      
      public function get content() : SymbolUserVoucherContainerGeneric
      {
         return _content;
      }
      
      public function init() : void
      {
         _userVoucherFilter = new UiUserVoucherFilter(content.userVoucherFilter,onFilterChanged);
         content.btnFilter.iconExclamationMark.visible = UiUserVoucherFilter.isFilterActive;
         _list.currentFilter = _userVoucherFilter;
         _list.refreshList();
      }
      
      public function reset() : void
      {
         _content.visible = false;
         _list.clear();
         _offset = 0;
         _userVouchers.length = 0;
         _removedUserVouchers.length = 0;
         _initialized = false;
         _listLocked = false;
      }
      
      public function refresh() : void
      {
         if(!_content.visible)
         {
            return;
         }
         if(User.current.character.streams.userVouchers.hasNewUserVouchers)
         {
            Environment.application.sendActionRequest("getStreamMessages",{
               "stream_type":"v",
               "stream_id":User.current.character.id,
               "start_message_id":0
            },handleRequests);
         }
         else
         {
            refreshUserVouchers();
         }
      }
      
      private function refreshUI(param1:List) : void
      {
         _content.list.txtNoUserVouchers.visible = _list.length == 0 && _initialized;
      }
      
      private function onRedeem(param1:*) : void
      {
         UserVoucher = param1;
         if(!UserVoucher)
         {
            return;
         }
         var currentLine:UiUserVoucherLine = _list.getLineForItem(UserVoucher) as UiUserVoucherLine;
         if(!currentLine)
         {
            return;
         }
         _listLocked = true;
         _removedUserVouchers.push(UserVoucher.id);
         var refreshCallback:Function = function():void
         {
            currentLine.content.alpha = 1;
            if(_userVouchers && _userVouchers.indexOf(UserVoucher) != -1)
            {
               _userVouchers.splice(_userVouchers.indexOf(UserVoucher),1);
            }
            _list.removeItem(UserVoucher);
            _listLocked = false;
         };
         Tween.to(currentLine.content,0.5,{
            "alpha":0,
            "onComplete":refreshCallback
         });
      }
      
      private function refreshUserVouchers() : void
      {
         _userVouchers.length = 0;
         var _loc3_:int = 0;
         var _loc2_:* = User.current.character.userVouchers;
         for each(var _loc1_ in User.current.character.userVouchers)
         {
            if(_removedUserVouchers.indexOf(_loc1_.id) < 0)
            {
               _userVouchers.push(_loc1_);
            }
         }
         _list.update(_userVouchers);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("getStreamMessages" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            User.current.character.streams.userVouchers.markAllAsRead();
            Environment.application.updateData(param1.data);
            _initialized = true;
            refreshUserVouchers();
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
   }
}
