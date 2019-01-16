package com.playata.application.ui.dialogs
{
   import com.playata.application.data.bonus.BonusInfo;
   import com.playata.application.data.dataobject.DOBonusInfoDay;
   import com.playata.application.ui.elements.bonus.UiBonusInfo;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.data.DataObjectArray;
   import com.playata.framework.display.ui.TextFieldAutoAdjustWidthHeight;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogBonusInfoNotificationGeneric;
   
   public class DialogBonusInfoNotification extends UiDialog
   {
      
      private static var _isOpen:Boolean;
      
      private static var MAX_BONUS_INFOS:int = 7;
       
      
      private var _btnOk:UiTextButton = null;
      
      private var _bonus:Vector.<UiBonusInfo>;
      
      public function DialogBonusInfoNotification()
      {
         var _loc7_:Boolean = false;
         var _loc9_:int = 0;
         var _loc12_:* = undefined;
         var _loc5_:* = null;
         _bonus = new Vector.<UiBonusInfo>();
         _isOpen = true;
         var _loc16_:SymbolDialogBonusInfoNotificationGeneric = new SymbolDialogBonusInfoNotificationGeneric();
         super(_loc16_);
         _queued = true;
         var _loc14_:DataObjectArray = BonusInfo.bonusData;
         var _loc6_:Vector.<Vector.<DOBonusInfoDay>> = new Vector.<Vector.<DOBonusInfoDay>>();
         var _loc20_:int = 0;
         var _loc19_:* = _loc14_;
         for each(var _loc2_ in _loc14_)
         {
            _loc7_ = false;
            var _loc18_:int = 0;
            var _loc17_:* = _loc6_;
            for each(var _loc10_ in _loc6_)
            {
               if(_loc10_.length > 0 && _loc2_.date == _loc10_[0].date)
               {
                  _loc10_.push(_loc2_);
                  _loc7_ = true;
                  break;
               }
            }
            if(!_loc7_)
            {
               _loc10_ = new Vector.<DOBonusInfoDay>();
               _loc10_.push(_loc2_);
               _loc6_.push(_loc10_);
            }
         }
         var _loc1_:String = _loc6_[0][0].eventId;
         var _loc4_:* = 0;
         var _loc13_:int = _loc6_.length - 1;
         var _loc11_:int = 0;
         var _loc15_:int = _loc6_[0][0].date;
         var _loc22_:int = 0;
         var _loc21_:* = _loc6_;
         for(var _loc8_ in _loc6_)
         {
            _loc2_ = _loc6_[_loc8_][0];
            if(_loc4_ == 0 && TimeUtil.serverDateTime.isToday(_loc2_.date))
            {
               _loc4_ = _loc8_;
            }
         }
         if(_loc4_ > 3 && _loc13_ > MAX_BONUS_INFOS)
         {
            if(_loc4_ >= _loc13_ - 3)
            {
               _loc11_ = Math.max(0,_loc13_ - MAX_BONUS_INFOS);
            }
            else
            {
               _loc11_ = Math.max(0,_loc4_ - 3);
            }
         }
         _loc16_.txtDialogTitle.text = LocText.current.text("dialog/bonus_info_notification/" + _loc1_ + "/title");
         _loc16_.txtDialogTitle.autoFontSize = true;
         _loc16_.txtBonusCaption.text = LocText.current.text("dialog/bonus_info_notification/bonus_caption");
         _loc16_.txtInfo.text = LocText.current.text("dialog/bonus_info_notification/" + _loc1_ + "/info");
         _loc16_.txtInfo.autoFontSize = true;
         _loc16_.txtBonusInfo.text = "";
         _loc16_.txtBonusInfo.autoAdjustWidthHeight = TextFieldAutoAdjustWidthHeight.VERTICAL;
         var _loc3_:int = 0;
         _loc9_ = 1;
         while(_loc9_ <= MAX_BONUS_INFOS)
         {
            if(_loc11_ + _loc3_ >= _loc6_.length)
            {
               _loc16_["position" + _loc9_].visible = false;
            }
            else
            {
               _loc12_ = _loc6_[_loc11_ + _loc3_];
               _loc5_ = new UiBonusInfo(_loc16_["position" + _loc9_],_loc12_,(_loc12_[0].date - _loc15_) / 86400 + 1);
               _bonus.push(_loc5_);
               if(_loc5_.isToday)
               {
                  _loc16_.txtBonusInfo.text = _loc5_.tooltip;
               }
               _loc3_++;
            }
            _loc9_++;
         }
         if(_bonus.length != MAX_BONUS_INFOS)
         {
            _loc3_ = (MAX_BONUS_INFOS - _bonus.length) * 74 / 2;
            _loc9_ = 1;
            while(_loc9_ <= MAX_BONUS_INFOS)
            {
               _loc16_["position" + _loc9_].x = _loc16_["position" + _loc9_].x + _loc3_;
               _loc9_++;
            }
         }
         _btnOk = new UiTextButton(_loc16_.btnOk,LocText.current.text("general/button_ok"),"",onClickOk);
         if(_loc16_.txtBonusInfo.numLines > 1)
         {
            _loc3_ = _loc16_.txtBonusInfo.height - 33;
            _btnOk.y = _btnOk.y + _loc3_;
            _loc16_.bonusBackground.height = _loc16_.bonusBackground.height + _loc3_;
            _loc16_.dialogBackground.height = _loc16_.dialogBackground.height + _loc3_;
            _loc9_ = 0;
            while(_loc9_ < _loc16_.numChildren)
            {
               _loc16_.getChildAt(_loc9_).y = _loc16_.getChildAt(_loc9_).y - _loc3_ / 2;
               _loc9_++;
            }
         }
      }
      
      public static function get isOpen() : Boolean
      {
         return _isOpen;
      }
      
      override public function dispose() : void
      {
         var _loc1_:int = 0;
         _btnOk.dispose();
         _btnOk = null;
         _loc1_ = 0;
         while(_loc1_ < _bonus.length)
         {
            _bonus[_loc1_].dispose();
            _loc1_++;
         }
         _bonus = null;
         super.dispose();
      }
      
      private function onClickOk(param1:InteractionEvent) : void
      {
         onEscape();
      }
      
      override public function onEscape() : void
      {
         _isOpen = false;
         BonusInfo.trackView();
         close();
      }
   }
}
