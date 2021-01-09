package com.playata.application.ui.elements.streaming
{
   import com.playata.application.data.constants.CDating;
   import com.playata.application.data.constants.CStreamingSetting;
   import com.playata.application.data.streaming.Streaming;
   import com.playata.application.data.streaming.StreamingShow;
   import com.playata.application.data.user.User;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.streaming.SymbolStreamingSettingContentGeneric;
   
   public class UiStreamingSettingContent
   {
       
      
      private var _content:SymbolStreamingSettingContentGeneric = null;
      
      public function UiStreamingSettingContent(param1:SymbolStreamingSettingContentGeneric)
      {
         super();
         _content = param1;
         _content.txtDurationCaption.text = LocText.current.text("dialog/streaming/setting_duration");
         _content.txtMultiplierCaption.text = LocText.current.text("dialog/streaming/animation_rewards_multiplier");
         _content.txtDurationCaption.autoFontSize = true;
         _content.txtMultiplierCaption.autoFontSize = true;
         _content.txtName.autoFontSize = true;
         _content.txtDescription.autoFontSize = true;
      }
      
      public function dispose() : void
      {
         _content = null;
      }
      
      public function refresh(param1:int) : void
      {
         if(!_content)
         {
            return;
         }
         var _loc4_:CStreamingSetting = CStreamingSetting.fromId(param1);
         _content.txtName.text = LocText.current.text("streaming/setting/" + _loc4_.identifier + "/title");
         _content.txtDescription.text = LocText.current.text("streaming/setting/" + _loc4_.identifier + "/description");
         _content.txtDuration.text = "-" + Math.round((1 - _loc4_.durationMultiplier) * 100) + "%";
         _content.txtMultiplier.text = "+" + Math.round(_loc4_.rewardMultiplier * 100) + "%";
         _content.image.setUriSprite(StreamingShow.getSettingBannerImageUrl(param1),522,125,true,-1);
         var _loc2_:Streaming = User.current.character.streaming;
         var _loc3_:Boolean = _loc2_.getUnlockedSettings().exists(param1);
         var _loc5_:* = !_loc3_;
         _content.txtUnlock.visible = _loc5_;
         _content.backgroundUnlock.visible = _loc5_;
         if(!_loc3_)
         {
            switch(int(_loc4_.unlockType) - 1)
            {
               case 0:
                  _content.txtUnlock.text = LocText.current.text("dialog/streaming_actors/setting_unlock/room_unlock",_loc4_.unlockValue);
                  break;
               case 1:
                  _content.txtUnlock.text = LocText.current.text("dialog/streaming_actors/setting_unlock/room_fans",LocText.current.formatHugeNumber(_loc4_.unlockValue));
                  break;
               case 2:
                  _content.txtUnlock.text = LocText.current.text("dialog/streaming_actors/setting_unlock/room_dating",LocText.current.text("dating/" + CDating.fromId(_loc4_.unlockValue).identifier + "/name"));
                  break;
               case 3:
                  _content.txtUnlock.text = LocText.current.text("dialog/streaming_actors/setting_unlock/room_likes",LocText.current.formatHugeNumber(_loc4_.unlockValue));
            }
         }
      }
   }
}
