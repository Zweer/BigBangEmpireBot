package com.playata.application.ui.elements.citymap
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.quest.Quest;
   import com.playata.application.data.user.User;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.IDisplayObjectContainer;
   import com.playata.framework.display.Sprite;
   import visuals.ui.elements.citymap.SymbolCitymapIconQuestGeneric;
   
   public class UiCitymapQuestIcon
   {
       
      
      private var _content:SymbolCitymapIconQuestGeneric;
      
      private var _stage:int;
      
      private var _isCustomStage:Boolean;
      
      public function UiCitymapQuestIcon(param1:SymbolCitymapIconQuestGeneric, param2:int, param3:Boolean = false)
      {
         super();
         _content = param1;
         _content.timeQuest.graphic.swish.visible = false;
         _content.fightQuest.graphic.swish.visible = false;
         _content.statQuest.graphic.swish.visible = false;
         _stage = param2;
         _isCustomStage = param3;
      }
      
      public function refresh() : void
      {
         var _loc5_:* = null;
         var _loc4_:* = null;
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc7_:* = null;
         var _loc6_:* = false;
         if(_isCustomStage)
         {
            _loc6_ = Boolean(GameUtil.isCustomStageUnlocked(User.current.character,_stage));
         }
         else
         {
            _loc6_ = User.current.character.maxQuestStage >= _stage;
         }
         var _loc3_:Vector.<Quest> = User.current.character.getQuestsVisibleOnCitymapForStage(_stage);
         if(_loc6_ && _loc3_.length > 0)
         {
            _loc5_ = _loc3_[0];
            _loc4_ = _loc3_[0].effectImageUrl;
            if(_loc5_.isTimeQuest)
            {
               addEventIcon(_content.timeQuest,[_content.fightQuest,_content.statQuest],_content.timeQuest.graphic.effect,_loc4_);
            }
            else if(_loc5_.isFightQuest)
            {
               addEventIcon(_content.fightQuest,[_content.timeQuest,_content.statQuest],_content.fightQuest.graphic.effect,_loc4_);
            }
            else
            {
               addEventIcon(_content.statQuest,[_content.timeQuest,_content.fightQuest],_content.statQuest.graphic.effect,_loc4_);
               _loc1_ = _content.statQuest.graphic.animation;
               _loc2_ = 1;
               while(_loc2_ < 5)
               {
                  _loc7_ = _loc1_.getChildByName("stat" + _loc2_);
                  _loc7_.visible = _loc2_ == _loc5_.statQuestStat;
                  _loc2_++;
               }
            }
            _content.visible = true;
         }
         else
         {
            _content.visible = false;
         }
      }
      
      private function addEventIcon(param1:IDisplayObject, param2:Array, param3:Sprite, param4:String) : void
      {
         param1.visible = true;
         var _loc7_:int = 0;
         var _loc6_:* = param2;
         for each(var _loc5_ in param2)
         {
            _loc5_.visible = false;
         }
         param3.visible = true;
         param3.setUriSprite(param4,110,110,true,CConstant.quest_max_stage,null,true);
      }
      
      public function dispose() : void
      {
         _content = null;
      }
   }
}
