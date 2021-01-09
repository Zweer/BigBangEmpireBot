package com.playata.application.ui.elements.quest
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.user.User;
   import com.playata.application.platform.ServerInfo;
   import com.playata.application.ui.elements.generic.button.UiPremiumButton;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.display.IUriSprite;
   import com.playata.framework.display.UriSprite;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.quest.SymbolQuestRefreshOptionGeneric;
   
   public class UiQuestRefreshOption
   {
       
      
      private var _btnRefresh:UiPremiumButton = null;
      
      private var _content:SymbolQuestRefreshOptionGeneric = null;
      
      private var _onClick:Function = null;
      
      private var _allStages:Boolean = false;
      
      private var _currentStageIndex:int = 0;
      
      private var _stages:Vector.<int>;
      
      public function UiQuestRefreshOption(param1:SymbolQuestRefreshOptionGeneric, param2:Boolean, param3:Function)
      {
         var _loc4_:int = 0;
         super();
         _content = param1;
         _onClick = param3;
         _allStages = param2;
         _currentStageIndex = 0;
         _stages = new Vector.<int>(0);
         _loc4_ = 1;
         while(_loc4_ <= User.current.character.maxQuestStage)
         {
            _stages.push(_loc4_);
            _loc4_++;
         }
         _stages = _stages.concat(GameUtil.getCustomStages(User.current.character.level));
         _btnRefresh = new UiPremiumButton(_content.btnRefresh,0,"",LocText.current.text("dialog/refresh_quests/button_refresh"),"","",onClickOption);
         _btnRefresh.premium = true;
         _btnRefresh.premiumAmount = GameUtil.getQuestRefreshCost(_allStages,_stages.length);
         _content.stageThumbnail.location.removeAllChildren();
         if(_allStages)
         {
            if(User.current.character.maxQuestStage > 1)
            {
               rotateStageThumbnail();
            }
         }
         else
         {
            _content.stageThumbnail.location.addChild(UriSprite.load(this.getStageThumbnailImageUrl(User.current.character.currentQuestStage),200,140,true,99));
         }
         if(param2)
         {
            _content.txtName.text = LocText.current.text("dialog/refresh_quests/all_stages",_stages.length);
         }
         else
         {
            _content.txtName.text = LocText.current.text("dialog/stage_unlocked/stage" + User.current.character.currentQuestStage + "_title");
         }
      }
      
      public function dispose() : void
      {
         _btnRefresh.dispose();
         _btnRefresh = null;
      }
      
      private function onStageThumbnailLoadingCompleted(param1:IUriSprite) : void
      {
         if(!_btnRefresh)
         {
            return;
         }
         Runtime.delayFunction(rotateStageThumbnail,2.5);
      }
      
      private function rotateStageThumbnail() : void
      {
         if(!_btnRefresh)
         {
            return;
         }
         _content.stageThumbnail.location.addChild(UriSprite.load(this.getStageThumbnailImageUrl(_stages[_currentStageIndex]),200,140,true,_stages[_currentStageIndex] == User.current.character.currentQuestStage?99:1,onStageThumbnailLoadingCompleted));
         _currentStageIndex = Number(_currentStageIndex) + 1;
         if(_currentStageIndex == _stages.length)
         {
            _currentStageIndex = 0;
         }
      }
      
      private function getStageThumbnailImageUrl(param1:int) : String
      {
         return ServerInfo.assetURL("locations/location" + param1,"jpg");
      }
      
      private function onClickOption(param1:InteractionEvent) : void
      {
      }
   }
}
