package com.playata.application.ui.elements.citymap
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.constants.CDating;
   import com.playata.application.data.dating.DatingStep;
   import com.playata.application.data.dating.DatingUtil;
   import com.playata.application.data.user.User;
   import com.playata.application.platform.ServerInfo;
   import com.playata.framework.display.UriSprite;
   import visuals.ui.elements.citymap.SymbolCitymapIconDatingGeneric;
   
   public class UiCitymapDatingIcon
   {
       
      
      private var _content:SymbolCitymapIconDatingGeneric;
      
      private var _stage:int;
      
      private var _isCustomStage:Boolean;
      
      public function UiCitymapDatingIcon(param1:SymbolCitymapIconDatingGeneric, param2:int, param3:Boolean = false)
      {
         super();
         _content = param1;
         _stage = param2;
         _isCustomStage = param3;
      }
      
      public function refresh() : Boolean
      {
         var _loc1_:* = null;
         var _loc4_:* = false;
         if(_isCustomStage)
         {
            _loc4_ = Boolean(GameUtil.isCustomStageUnlocked(User.current.character,_stage));
         }
         else
         {
            _loc4_ = User.current.character.maxQuestStage >= _stage;
         }
         var _loc2_:DatingStep = User.current.character.dating.getActiveDatingStepInStage(_stage);
         var _loc3_:int = User.current.character.dating.getNewDatingIndexForStage(User.current.character,_stage);
         if(_loc4_ && _loc2_ != null && _loc2_.stage == _stage && !_loc2_.isRewardProcessed)
         {
            _content.visible = true;
            _content.graphic.npcIcon.setUriSprite(_loc2_.questButtonImageUrl,80,78,true);
            return true;
         }
         if(_loc3_ > 0)
         {
            _content.visible = true;
            _content.graphic.npcIcon.removeAllChildren();
            _loc1_ = DatingUtil.getDatingTemplate(_loc3_);
            _content.graphic.npcIcon.addChild(UriSprite.load(ServerInfo.assetURL("dating/" + _loc1_.identifier + "_b","png"),80,78,true));
            return true;
         }
         _content.visible = false;
         return false;
      }
      
      public function dispose() : void
      {
         _content = null;
      }
   }
}
