package com.playata.application.ui.elements.citymap
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.convention.Convention;
   import com.playata.application.data.user.User;
   import visuals.ui.elements.citymap.SymbolCitymapIconConventionGeneric;
   
   public class UiCitymapConventionIcon
   {
       
      
      private var _content:SymbolCitymapIconConventionGeneric;
      
      private var _stage:int;
      
      private var _convention:Convention;
      
      private var _isCustomStage:Boolean;
      
      public function UiCitymapConventionIcon(param1:SymbolCitymapIconConventionGeneric, param2:int, param3:Boolean = false)
      {
         super();
         _content = param1;
         _stage = param2;
         _isCustomStage = param3;
      }
      
      public function refresh() : Boolean
      {
         var _loc1_:* = false;
         if(_isCustomStage)
         {
            _loc1_ = Boolean(GameUtil.isCustomStageUnlocked(User.current.character,_stage));
         }
         else
         {
            _loc1_ = User.current.character.maxQuestStage >= _stage;
         }
         _convention = User.current.character.getActiveConventionByStage(_stage);
         if(_loc1_ && _convention != null && _convention.remainingSeconds > 0)
         {
            _content.visible = true;
            _content.graphic.npcIcon.setUriSprite(_convention.questButtonImageUrl,80,78,true);
            return true;
         }
         _content.visible = false;
         return false;
      }
      
      public function dispose() : void
      {
         _content = null;
         _convention = null;
      }
   }
}
