package com.playata.application.ui.elements.citymap
{
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
      
      public function UiCitymapDatingIcon(param1:SymbolCitymapIconDatingGeneric, param2:int)
      {
         super();
         _content = param1;
         _stage = param2;
      }
      
      public function refresh() : Boolean
      {
         var _loc1_:* = null;
         var _loc2_:DatingStep = User.current.character.dating.getActiveDatingStepInStage(_stage);
         var _loc3_:int = User.current.character.dating.getNewDatingIndexForStage(User.current.character,_stage);
         if(User.current.character.maxQuestStage >= _stage && _loc2_ != null && _loc2_.stage == _stage && !_loc2_.isRewardProcessed)
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
