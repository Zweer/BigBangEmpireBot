package com.playata.application.ui.elements.stream
{
   import com.playata.application.data.user.User;
   import com.playata.application.data.voucher.UserVoucher;
   import com.playata.application.data.voucher.UserVoucherFilter;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.checkbox.UiCheckBox;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.display.ui.IListFilter;
   import com.playata.framework.display.ui.IListItem;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.stream.SymbolUserVoucherFilterGeneric;
   
   public class UiUserVoucherFilter implements IListFilter
   {
      
      private static var _showEnergyVoucher:Boolean = true;
      
      private static var _showBoosterVoucher:Boolean = true;
       
      
      private var _content:SymbolUserVoucherFilterGeneric = null;
      
      private var _callback:Function = null;
      
      private var _ckbShowEnergy:UiCheckBox = null;
      
      private var _ckbShowBooster:UiCheckBox = null;
      
      private var _btnSaveSettings:UiButton = null;
      
      public function UiUserVoucherFilter(param1:SymbolUserVoucherFilterGeneric, param2:Function)
      {
         super();
         _content = param1;
         _content.visible = false;
         _callback = param2;
         getSavedSettings();
         _content.txtShowEnergyVoucher.text = LocText.current.text("panel_streams/user_voucher/show_quest_energy_voucher");
         _content.txtShowEnergyVoucher.autoFontSize = true;
         _content.txtShowBoosterVoucher.text = LocText.current.text("panel_streams/user_voucher/show_booster_voucher");
         _content.txtShowBoosterVoucher.autoFontSize = true;
         _ckbShowEnergy = new UiCheckBox(_content.ckbShowEnergyVoucher,_showEnergyVoucher,"",onCheckedChangedShowEnergyVoucher,null,_content.txtShowEnergyVoucher);
         _ckbShowBooster = new UiCheckBox(_content.ckbShowBoosterVoucher,_showBoosterVoucher,"",onCheckedChangedShowBoosterVoucher,null,_content.txtShowBoosterVoucher);
         _btnSaveSettings = new UiButton(_content.btnSaveSettings,LocText.current.text("panel_streams/user_voucher/button_save"),updateSavedSettings);
         _content.dialogBackground.applySettings(new TypedObject({"interactionEnabled":true}));
         updateSaveButton();
      }
      
      public static function isAllowed(param1:UserVoucher) : Boolean
      {
         var _loc2_:Boolean = true;
         if(param1.isQuestEnergyReward)
         {
            _loc2_ = _showEnergyVoucher;
         }
         else if(param1.isQuestBoosterReward)
         {
            _loc2_ = _showBoosterVoucher;
         }
         else if(param1.isStatBoosterReward)
         {
            _loc2_ = _showBoosterVoucher;
         }
         else if(param1.isWorkBoosterReward)
         {
            _loc2_ = _showBoosterVoucher;
         }
         else if(param1.isSenseBoosterReward)
         {
            _loc2_ = _showBoosterVoucher;
         }
         else if(param1.isMultitaskingBoosterReward)
         {
            _loc2_ = _showBoosterVoucher;
         }
         return _loc2_;
      }
      
      public static function get isFilterActive() : Boolean
      {
         return !_showEnergyVoucher || !_showBoosterVoucher;
      }
      
      public function matches(param1:IListItem) : Boolean
      {
         var _loc2_:UserVoucher = param1 as UserVoucher;
         if(_loc2_.isExpired)
         {
            return false;
         }
         return UiUserVoucherFilter.isAllowed(_loc2_);
      }
      
      public function dispose() : void
      {
         _btnSaveSettings.dispose();
         _btnSaveSettings = null;
         _ckbShowEnergy.dispose();
         _ckbShowEnergy = null;
         _ckbShowBooster.dispose();
         _ckbShowBooster = null;
         _callback = null;
         _content = null;
         _showEnergyVoucher = true;
         _showBoosterVoucher = true;
      }
      
      private function getSavedSettings() : void
      {
         var _loc1_:UserVoucherFilter = User.current.userVoucherFilter;
         if(_loc1_)
         {
            _showEnergyVoucher = _loc1_.showEnergyVoucher;
            _showBoosterVoucher = _loc1_.showBoosterVoucher;
         }
      }
      
      private function updateSavedSettings(param1:InteractionEvent) : void
      {
         var _loc2_:* = null;
         if(!_showEnergyVoucher && !_showBoosterVoucher)
         {
            _loc2_ = {
               "stv":true,
               "sev":true,
               "sbv":true,
               "shgv":true,
               "shsv":true
            };
         }
         else
         {
            _loc2_ = {
               "sev":_showEnergyVoucher,
               "sbv":_showBoosterVoucher
            };
         }
         User.current.setSettingValue("user_voucher_filter_settings",_loc2_);
         updateSaveButton();
      }
      
      public function toggle() : void
      {
         _content.visible = !_content.visible;
      }
      
      public function hide() : void
      {
         _content.visible = false;
      }
      
      private function onCheckedChangedShowEnergyVoucher(param1:Boolean) : void
      {
         _showEnergyVoucher = param1;
         _callback();
         updateSaveButton();
      }
      
      private function onCheckedChangedShowBoosterVoucher(param1:Boolean) : void
      {
         _showBoosterVoucher = param1;
         _callback();
         updateSaveButton();
      }
      
      private function updateSaveButton() : void
      {
         var _loc1_:UserVoucherFilter = User.current.userVoucherFilter;
         if(_loc1_)
         {
            _btnSaveSettings.buttonEnabled = !(_showEnergyVoucher == _loc1_.showEnergyVoucher && _showBoosterVoucher == _loc1_.showBoosterVoucher);
         }
         else
         {
            _btnSaveSettings.buttonEnabled = isFilterActive;
         }
      }
   }
}
