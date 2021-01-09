package com.playata.application.ui.elements.duel
{
   import com.playata.application.data.character.Character;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.hud.UiSidePremiumHint;
   import com.playata.framework.application.Environment;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.base.SymbolIconButtonRefreshDuelEnemiesGeneric;
   import visuals.ui.elements.duel.SymbolSidePremiumHintGeneric;
   
   public class UiRefreshDuelEnemiesButton extends UiButton
   {
       
      
      private var _button:SymbolIconButtonRefreshDuelEnemiesGeneric;
      
      private var _hint:UiSidePremiumHint;
      
      public function UiRefreshDuelEnemiesButton(param1:SymbolIconButtonRefreshDuelEnemiesGeneric, param2:SymbolSidePremiumHintGeneric, param3:Function)
      {
         _button = param1;
         super(param1,"",param3);
         param2.visible = false;
         _hint = new UiSidePremiumHint(param2);
         _hint.caption = LocText.current.text("screen/duel/refresh_duel_enemies");
      }
      
      public function refreshLocalization() : void
      {
         _hint.caption = LocText.current.text("screen/duel/refresh_duel_enemies");
      }
      
      public function get hint() : UiSidePremiumHint
      {
         return _hint;
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
      
      override protected function handleInteractionOver(param1:InteractionEvent) : void
      {
         _hint.content.visible = true;
         super.handleInteractionOver(param1);
      }
      
      override protected function handleInteractionOut(param1:InteractionEvent) : void
      {
         _hint.content.visible = false;
         super.handleInteractionOut(param1);
      }
      
      public function refresh() : void
      {
         var _loc1_:Character = User.current.character;
         if(_loc1_.hasFreeDuelEnemiesRefresh)
         {
            _button.gotoAndStop("free");
            _hint.premiumAmount = 0;
         }
         else
         {
            _button.gotoAndStop("premium");
            _hint.premiumAmount = CConstant.duel_enemies_refresh_premium_amount;
         }
         if(Environment.info.isTouchScreen)
         {
            _hint.content.x = _button.x + 185;
         }
         else
         {
            _hint.content.x = _button.x + 145;
         }
      }
   }
}
