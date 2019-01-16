package com.playata.application.ui.dialogs
{
   import com.playata.application.AppEnvironment;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.effects.EffectsLayer;
   import com.playata.application.ui.effects.IEffect;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.Core;
   import com.playata.framework.display.ui.controls.Button;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogLevelUpGeneric;
   
   public class DialogLevelUp extends UiDialog
   {
      
      private static var _isVisible:Boolean = false;
       
      
      private var _level:int = 0;
      
      private var _btnClose:UiTextButton = null;
      
      private var _effectConfetti:IEffect;
      
      private var _effectLight:IEffect;
      
      public function DialogLevelUp(param1:int)
      {
         var _loc4_:* = null;
         var _loc3_:* = null;
         _level = param1;
         _isVisible = true;
         var _loc2_:SymbolDialogLevelUpGeneric = new SymbolDialogLevelUpGeneric();
         super(_loc2_);
         _loc2_.txtLevelNumber.text = param1.toString();
         _loc2_.txtDialogTitle.text = LocText.current.text("dialog/level_up/text_common");
         _loc2_.txtLevelCaption.text = LocText.current.text("dialog/level_up/level_caption");
         _loc2_.txtReward.text = LocText.current.text("dialog/level_up/stat_points_granted",CConstant.level_up_stat_points);
         _loc2_.txtUnlockedItems.text = LocText.current.text("dialog/level_up/text_unlocked_items");
         _btnClose = new UiTextButton(_loc2_.btnClose,LocText.current.text("general/button_ok"),"",onClickClose);
         if(AppEnvironment.appPlatform.isKongregate)
         {
            _loc4_ = Core.config.getString("kongregate_user_id");
            _loc3_ = Core.config.getString("kongregate_game_auth_token");
            Environment.application.sendActionRequest("submitKongregateStatistic",{
               "kongregate_user_id":_loc4_,
               "kongregate_game_auth_token":_loc3_,
               "statistic_name":"level"
            },null,false);
         }
         platform.trackLevelUpConversion(User.current.uniqueUserId,User.current.ref,User.current.subId,param1);
      }
      
      public static function get isVisible() : Boolean
      {
         return _isVisible;
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         super.dispose();
      }
      
      override public function show() : void
      {
         super.show();
         Environment.audio.playFX("event_level_up.mp3");
         _effectConfetti = EffectsLayer.instance.show(101,{},_vo.parent,1);
         EffectsLayer.instance.show(102,{},_vo.parent,1);
      }
      
      override public function close(param1:Function = null) : void
      {
         _isVisible = false;
         super.close(param1);
         if(_effectConfetti)
         {
            _effectConfetti.shutDown();
         }
         if(_effectLight)
         {
            _effectLight.shutDown();
         }
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         if(ViewManager.instance.baseUserPanel.areMainNavigationButtonsAllowed)
         {
            ViewManager.instance.showPanel("character");
         }
         close();
      }
      
      override public function get defaultButton() : Button
      {
         return _btnClose;
      }
   }
}
