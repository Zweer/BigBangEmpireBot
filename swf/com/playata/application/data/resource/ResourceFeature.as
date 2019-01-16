package com.playata.application.data.resource
{
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.user.User;
   import com.playata.application.request.AppRequestResponseData;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.localization.LocText;
   
   public class ResourceFeature
   {
       
      
      private var _type:int = 0;
      
      public function ResourceFeature(param1:int)
      {
         super();
         _type = param1;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get useDialogTitleText() : String
      {
         if(!(int(_type) - 1))
         {
            return LocText.current.text("dialog/use_resource/quest/title");
         }
         return null;
      }
      
      public function get useDialogInfoText() : String
      {
         if(!(int(_type) - 1))
         {
            if(isUpgradeable)
            {
               return LocText.current.text("dialog/use_resource/quest/info_text",CConstant.resource_quest_usage_limit,CConstant.resource_quest_reduction,unusedResourceCount,CConstant.resource_quest_max_stock);
            }
            return LocText.current.text("dialog/use_resource/quest/info_text",CConstant.resource_quest_usage_limit_upgraded,CConstant.resource_quest_reduction,unusedResourceCount,CConstant.resource_quest_max_stock_upgraded);
         }
         return null;
      }
      
      public function get useDialogUpgradeInfoText() : String
      {
         if(!(int(_type) - 1))
         {
            return LocText.current.text("dialog/use_resource/quest/info_upgrade_text",CConstant.resource_quest_usage_limit_upgraded - CConstant.resource_quest_usage_limit,CConstant.resource_quest_max_stock_upgraded - CConstant.resource_quest_max_stock);
         }
         return null;
      }
      
      public function get useDialogUsageCaptionText() : String
      {
         if(!(int(_type) - 1))
         {
            return LocText.current.text("dialog/use_resource/quest/caption_text");
         }
         return null;
      }
      
      public function get useDialogButtonText() : String
      {
         switch(int(_type) - 1)
         {
            case 0:
               return LocText.current.text("dialog/use_resource/quest/button_use_text");
            default:
               return null;
            case 2:
               return LocText.current.text("dialog/use_resource/slotmachine/button_use_text");
         }
      }
      
      public function get useDialogButtonNoResourcesLeftTooltipText() : String
      {
         if(!(int(_type) - 1))
         {
            return LocText.current.text("dialog/use_resource/quest/button_use_none_left_tooltip_text");
         }
         return null;
      }
      
      public function get useDialogButtonLimitReachedTooltipText() : String
      {
         if(!(int(_type) - 1))
         {
            return LocText.current.text("dialog/use_resource/quest/button_use_limit_reached_tooltip_text");
         }
         return null;
      }
      
      public function resourceRequestAcceptedMessage(param1:String) : String
      {
         if(!(int(_type) - 1))
         {
            return LocText.current.text("dialog/accept_resource_request/quest/message_accepted",User.current.character.name,param1);
         }
         return null;
      }
      
      public function get useAmount() : int
      {
         switch(int(_type) - 1)
         {
            case 0:
               return CConstant.resource_quest_usage_amount;
            case 1:
               return CConstant.resource_free_slotmachine_spin_usage_amount;
            case 2:
               return CConstant.resource_slotmachine_jeton_usage_amount;
         }
      }
      
      public function get resourceIconIndex() : int
      {
         switch(int(_type) - 1)
         {
            case 0:
               return 1;
            case 1:
               return 2;
            case 2:
               return 2;
         }
      }
      
      public function get resourceFeatureIconIndex() : int
      {
         switch(int(_type) - 1)
         {
            case 0:
               if(isUpgradeable)
               {
                  return 1;
               }
               return 2;
            case 1:
               return 3;
            case 2:
               return 3;
         }
      }
      
      public function get resourceUsageLeftCount() : int
      {
         var _loc3_:int = 0;
         var _loc2_:int = 0;
         if(!(int(_type) - 1))
         {
            _loc3_ = User.current.character.getUsedResourceCount(1);
            if(isUpgradeable)
            {
               _loc2_ = CConstant.resource_quest_usage_limit;
            }
            else
            {
               _loc2_ = CConstant.resource_quest_usage_limit_upgraded;
            }
            var _loc1_:int = Math.max(0,_loc2_ - _loc3_);
            return _loc1_;
         }
         return 0;
      }
      
      public function get unusedResourceCount() : int
      {
         switch(int(_type) - 1)
         {
            case 0:
               return User.current.character.getUnusedResourceCount(1);
            case 1:
               return User.current.character.getUnusedResourceCount(2);
            case 2:
               return User.current.character.getUnusedResourceCount(3);
         }
      }
      
      public function get useButtonResourcesLeftTooltipText() : String
      {
         switch(int(_type) - 1)
         {
            case 0:
               return LocText.current.text("dialog/use_resource/quest/button_resources_left_tooltip",CConstant.resource_quest_reduction,unusedResourceCount);
            case 1:
               return LocText.current.text("dialog/use_resource/slotmachine/button_resources_left_tooltip",unusedResourceCount);
            case 2:
               return LocText.current.text("dialog/use_resource/slotmachine_jetons/button_resources_left_tooltip",CConstant.resource_slotmachine_jeton_usage_amount,unusedResourceCount);
         }
      }
      
      public function get useButtonNoResourcesLeftTooltipText() : String
      {
         switch(int(_type) - 1)
         {
            case 0:
               return LocText.current.text("dialog/use_resource/quest/button_no_resources_left_tooltip",CConstant.resource_quest_reduction);
            case 1:
               return LocText.current.text("dialog/use_resource/slotmachine/button_no_resources_left_tooltip");
            case 2:
               return LocText.current.text("dialog/use_resource/slotmachine_jetons/button_no_resources_left_tooltip",CConstant.resource_slotmachine_jeton_usage_amount);
         }
      }
      
      public function getResourceRequestTitle(param1:String) : String
      {
         if(!(int(_type) - 1))
         {
            return LocText.current.text("resource_request/quest/title",param1);
         }
         return null;
      }
      
      public function getResourceRequestMessage(param1:String) : String
      {
         if(!(int(_type) - 1))
         {
            return LocText.current.text("resource_request/quest/message",param1);
         }
         return null;
      }
      
      public function showUsageConfirmation(param1:AppRequestResponseData) : void
      {
         if(!(int(_type) - 1))
         {
            if(param1.saved_seconds)
            {
               Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/use_resource/quest/finished/title"),LocText.current.text("dialog/use_resource/quest/finished/text",TimeUtil.secondsToString(param1.saved_seconds)),LocText.current.text("general/button_ok")));
            }
         }
      }
      
      public function get isUpgradeable() : Boolean
      {
         if(!(int(_type) - 1))
         {
            if(!User.current)
            {
               return true;
            }
            return !User.current.getSettingValue("more_batteries_unlocked");
         }
         return false;
      }
   }
}
