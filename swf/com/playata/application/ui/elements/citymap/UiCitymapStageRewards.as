package com.playata.application.ui.elements.citymap
{
   import com.greensock.easing.Expo;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.goal.GoalValue;
   import com.playata.application.data.quest.Quest;
   import com.playata.application.data.story_dungeon.StoryDungeon;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.action_bar.ActionBarLayer;
   import com.playata.application.ui.elements.dating.UiDatingItemButton;
   import com.playata.application.ui.elements.dating.UiRepeatDatingKeyButton;
   import com.playata.application.ui.elements.dungeon.UiDungeonKeyRewardButton;
   import com.playata.application.ui.elements.event.UiEventItemButton;
   import com.playata.application.ui.elements.goal.UiGoalButton;
   import com.playata.application.ui.elements.guild_competition.UiGuildCompetitionItemButton;
   import com.playata.application.ui.elements.herobook.UiHerobookItemButton;
   import com.playata.application.ui.elements.item.UiItemSlotButton;
   import com.playata.application.ui.elements.movie.UiMovieVoteItemButton;
   import com.playata.application.ui.elements.optical_changes.UiOpticalChangeResourceButton;
   import com.playata.application.ui.elements.slotmachine.UiSlotMachineJetonButton;
   import com.playata.application.ui.elements.story_dungeon.UiRepeatStoryDungeonKeyButton;
   import com.playata.application.ui.elements.story_dungeon.UiStoryDungeonItemButton;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import visuals.ui.elements.citymap.SymbolCitymapStageRewardGeneric;
   import visuals.ui.elements.goal.SymbolGoalItemGeneric;
   import visuals.ui.elements.item.SymbolItemSlotGeneric;
   import visuals.ui.elements.movie.SymbolMovieItemGeneric;
   import visuals.ui.elements.optical_changes.SymbolOpticalChangeResourceRewardGeneric;
   import visuals.ui.elements.slotmachine.SymbolSlotmachineJetonRewardGeneric;
   
   public class UiCitymapStageRewards
   {
       
      
      private var _content:SymbolCitymapStageRewardGeneric = null;
      
      private var _onClickFunction:Function = null;
      
      private var _stage:int = 0;
      
      private var _currentDisplayHash:String = "";
      
      private var _quest:Vector.<Quest>;
      
      private var _buttons:Array;
      
      private var _mouseOver:Boolean = false;
      
      private var _elementsAdded:int = 0;
      
      private var _oldChildIndex:int = 0;
      
      private var _voInitX:Number = 0;
      
      private var _voInitY:Number = 0;
      
      private var _elementMaxX:int = 0;
      
      private var _elementMaxY:int = 0;
      
      private var _interactionLayer:InteractiveDisplayObject = null;
      
      private var _currentQuestButton:ICitymapQuestButton = null;
      
      private var _lastClickTime:int = 0;
      
      public function UiCitymapStageRewards(param1:SymbolCitymapStageRewardGeneric, param2:int, param3:Function)
      {
         _quest = new Vector.<Quest>();
         _buttons = [];
         super();
         _content = param1;
         _stage = param2;
         _onClickFunction = param3;
         _voInitX = param1.x;
         _voInitY = param1.y;
         _interactionLayer = new InteractiveDisplayObject(_content.background);
         _interactionLayer.onInteractionOver.add(handleInteractionOver);
         _oldChildIndex = _content.parent.getChildIndex(_content);
         hideElements();
      }
      
      private function hideElements() : void
      {
         _content.item1.visible = false;
         _content.item2.visible = false;
         _content.item3.visible = false;
         _content.item4.visible = false;
         _content.eventItem1.visible = false;
         _content.eventItem2.visible = false;
         _content.eventItem3.visible = false;
         _content.eventItem4.visible = false;
         _content.jeton1.visible = false;
         _content.jeton2.visible = false;
         _content.storyDungeonItem1.visible = false;
         _content.storyDungeonItem2.visible = false;
         _content.storyDungeonItem3.visible = false;
         _content.storyDungeonItem4.visible = false;
         _content.goal1.visible = false;
         _content.goal2.visible = false;
         _content.goal3.visible = false;
         _content.goal4.visible = false;
         _content.dungeonKey.visible = false;
         _content.background.visible = false;
         _content.opticalChangeResource1.visible = false;
         _content.opticalChangeResource2.visible = false;
         _content.opticalChangeResource3.visible = false;
         _content.opticalChangeResource4.visible = false;
      }
      
      public function refresh(param1:Vector.<GoalValue>) : void
      {
         var _loc8_:* = null;
         var _loc25_:* = null;
         var _loc11_:* = null;
         var _loc5_:* = null;
         var _loc27_:* = null;
         var _loc6_:* = null;
         var _loc30_:* = null;
         var _loc7_:* = null;
         var _loc20_:* = null;
         var _loc24_:* = null;
         var _loc18_:* = null;
         var _loc3_:* = null;
         var _loc22_:int = 0;
         var _loc2_:* = null;
         var _loc26_:* = null;
         var _loc16_:* = null;
         var _loc4_:* = null;
         var _loc9_:* = null;
         var _loc13_:* = null;
         var _loc10_:Character = User.current.character;
         var _loc12_:Vector.<int> = _loc10_.getStageQuestIdsForStage(_stage);
         if(_loc12_ == null)
         {
            return;
         }
         var _loc29_:String = _loc12_.join(";");
         if(_currentDisplayHash == _loc29_ && !_loc10_.hasEventQuest && !_loc10_.herobook.hasCollectItemObjective())
         {
            return;
         }
         hideElements();
         var _loc21_:int = 0;
         _loc21_ = 0;
         while(_loc21_ < _buttons.length)
         {
            _buttons[_loc21_].dispose();
            _loc21_++;
         }
         _buttons.length = 0;
         updateQuests();
         var _loc28_:int = 0;
         var _loc23_:int = 0;
         var _loc17_:int = 0;
         var _loc15_:int = 0;
         var _loc14_:int = 0;
         var _loc19_:int = 0;
         _elementsAdded = 0;
         _loc21_ = 0;
         while(_loc21_ < _quest.length)
         {
            _loc8_ = _quest[_loc21_];
            if(_loc8_.reward.movieVotes > 0)
            {
               _loc23_++;
               _elementsAdded = Number(_elementsAdded) + 1;
               getItemButton("eventItem" + _loc23_).visible = true;
               _loc25_ = new UiMovieVoteItemButton(getItemButton("eventItem" + _loc23_),_loc8_,onClickCitymapQuestButton,handleInteractionOver,handleMouseMove);
               _loc25_.movieVotes = _loc8_.reward.movieVotes;
               _buttons.push(_loc25_);
            }
            if(_loc8_.reward.eventItemIdentifier)
            {
               _loc23_++;
               _elementsAdded = Number(_elementsAdded) + 1;
               getItemButton("eventItem" + _loc23_).visible = true;
               _loc11_ = new UiEventItemButton(getItemButton("eventItem" + _loc23_),_loc8_,onClickCitymapQuestButton,handleInteractionOver,handleMouseMove);
               _loc11_.eventItem = _loc8_.reward.eventItemIdentifier;
               _buttons.push(_loc11_);
            }
            if(_loc8_.reward.repeatDatingIndex > 0)
            {
               _loc17_++;
               _elementsAdded = Number(_elementsAdded) + 1;
               getItemButton("storyDungeonItem" + _loc17_).visible = true;
               _loc5_ = new UiRepeatDatingKeyButton(getItemButton("storyDungeonItem" + _loc17_),_loc8_,onClickCitymapQuestButton,handleInteractionOver,handleMouseMove);
               _loc5_.dating = _loc8_.reward.repeatDatingIndex;
               _buttons.push(_loc5_);
            }
            if(_loc8_.reward.datingItemIdentifier)
            {
               _loc23_++;
               _elementsAdded = Number(_elementsAdded) + 1;
               getItemButton("eventItem" + _loc23_).visible = true;
               _loc27_ = new UiDatingItemButton(getItemButton("eventItem" + _loc23_),_loc8_,onClickCitymapQuestButton,handleInteractionOver,handleMouseMove);
               _loc27_.datingItem = _loc8_.reward.datingItemIdentifier;
               _buttons.push(_loc27_);
            }
            if(_loc8_.reward.repeatStoryDungeonIndex > 0)
            {
               _loc17_++;
               _elementsAdded = Number(_elementsAdded) + 1;
               getItemButton("storyDungeonItem" + _loc17_).visible = true;
               _loc6_ = new UiRepeatStoryDungeonKeyButton(getItemButton("storyDungeonItem" + _loc17_),_loc8_,onClickCitymapQuestButton,handleInteractionOver,handleMouseMove);
               _loc6_.storyDungeon = _loc8_.reward.repeatStoryDungeonIndex;
               _buttons.push(_loc6_);
            }
            if(_loc8_.reward.storyDungeonUnlockPoint)
            {
               _loc30_ = _loc10_.currentStoryDungeon;
               _loc7_ = _loc10_.repeatStoryDungeon;
               _loc20_ = null;
               if(_loc30_ && _loc30_.storyDungeonIndex == _loc8_.reward.storyDungeonUnlockPoint && !_loc30_.allPointsCollected())
               {
                  _loc17_++;
                  _elementsAdded = Number(_elementsAdded) + 1;
                  getItemButton("storyDungeonItem" + _loc17_).visible = true;
                  _loc20_ = new UiStoryDungeonItemButton(getItemButton("storyDungeonItem" + _loc17_),_loc8_,onClickCitymapQuestButton,handleInteractionOver,handleMouseMove);
                  _loc20_.storyDungeon = _loc30_.storyDungeonIndex;
                  _buttons.push(_loc20_);
               }
               else if(_loc7_ && _loc7_.storyDungeonIndex == _loc8_.reward.storyDungeonUnlockPoint && !_loc7_.allPointsCollected())
               {
                  _loc17_++;
                  _elementsAdded = Number(_elementsAdded) + 1;
                  getItemButton("storyDungeonItem" + _loc17_).visible = true;
                  _loc20_ = new UiStoryDungeonItemButton(getItemButton("storyDungeonItem" + _loc17_),_loc8_,onClickCitymapQuestButton,handleInteractionOver,handleMouseMove);
                  _loc20_.storyDungeon = _loc7_.storyDungeonIndex;
                  _buttons.push(_loc20_);
               }
            }
            if(_loc8_.reward.guildCompetitionItemIdentifier)
            {
               _loc23_++;
               _elementsAdded = Number(_elementsAdded) + 1;
               getItemButton("eventItem" + _loc23_).visible = true;
               _loc24_ = new UiGuildCompetitionItemButton(getItemButton("eventItem" + _loc23_),_loc8_,onClickCitymapQuestButton,handleInteractionOver,handleMouseMove);
               _loc24_.guildCompetitionItem = _loc8_.reward.guildCompetitionItemIdentifier;
               _buttons.push(_loc24_);
            }
            if(_loc8_.reward.herobookItemIdentifier)
            {
               _loc23_++;
               _elementsAdded = Number(_elementsAdded) + 1;
               getItemButton("eventItem" + _loc23_).visible = true;
               _loc18_ = new UiHerobookItemButton(getItemButton("eventItem" + _loc23_),_loc8_,onClickCitymapQuestButton,handleInteractionOver,handleMouseMove);
               _loc18_.refresh(_loc8_.reward.herobookItemIdentifier);
               _buttons.push(_loc18_);
            }
            _loc3_ = _loc8_.identifier.substr(0,-2);
            if(_loc3_ == "quest_stage7_fight7")
            {
               _loc3_ = "quest_stage7_fight10";
            }
            else if(_loc3_ == "quest_stage7_fight10")
            {
               _loc3_ = "xxx";
            }
            if(_loc3_ == "quest_stage6_fight1")
            {
               _loc3_ = "quest_stage6_fight5";
            }
            else if(_loc3_ == "quest_stage6_fight5")
            {
               _loc3_ = "xxx";
            }
            _loc22_ = 0;
            while(_loc22_ < param1.length)
            {
               _loc2_ = param1[_loc22_];
               if(_loc2_.goal.identifier == _loc3_ && !_loc2_.isCollectable(_loc10_))
               {
                  _loc15_++;
                  _elementsAdded = Number(_elementsAdded) + 1;
                  _content.getChildByName("goal" + _loc15_).visible = true;
                  _loc26_ = new UiGoalButton(_content.getChildByName("goal" + _loc15_) as SymbolGoalItemGeneric,_loc8_,onClickCitymapQuestButton,handleInteractionOver,handleMouseMove);
                  _loc26_.goalValue = _loc2_;
                  _buttons.push(_loc26_);
               }
               _loc22_++;
            }
            if(_loc8_.reward.itemId > 0)
            {
               _loc28_++;
               _elementsAdded = Number(_elementsAdded) + 1;
               _content.getChildByName("item" + _loc28_).visible = true;
               _loc16_ = new UiItemSlotButton(_content.getChildByName("item" + _loc28_) as SymbolItemSlotGeneric,_loc8_,0,onClickCitymapQuestButton,handleInteractionOver,handleMouseMove);
               _loc16_.item = _loc10_.getItemById(_loc8_.reward.itemId);
               _buttons.push(_loc16_);
            }
            if(_loc8_.reward.dungeonKey)
            {
               _elementsAdded = Number(_elementsAdded) + 1;
               _content.dungeonKey.visible = true;
               _loc4_ = new UiDungeonKeyRewardButton(_content.dungeonKey,_loc8_,onClickCitymapQuestButton,handleInteractionOver,handleMouseMove);
               _buttons.push(_loc4_);
            }
            if(_loc8_.reward.slotMachinJetons > 0)
            {
               _loc14_++;
               _elementsAdded = Number(_elementsAdded) + 1;
               _content.getChildByName("jeton" + _loc14_).visible = true;
               _loc9_ = new UiSlotMachineJetonButton(_content.getChildByName("jeton" + _loc14_) as SymbolSlotmachineJetonRewardGeneric,_loc8_,onClickCitymapQuestButton,handleInteractionOver,handleMouseMove);
               _loc9_.amount = _loc8_.reward.slotMachinJetons;
               _buttons.push(_loc9_);
            }
            if(_loc8_.reward.opticalChangeResource > 0)
            {
               _loc19_++;
               _elementsAdded = Number(_elementsAdded) + 1;
               _content.getChildByName("opticalChangeResource" + _loc19_).visible = true;
               _loc13_ = new UiOpticalChangeResourceButton(_content.getChildByName("opticalChangeResource" + _loc19_) as SymbolOpticalChangeResourceRewardGeneric,_loc8_,onClickCitymapQuestButton,handleInteractionOver,handleMouseMove);
               _loc13_.amount = _loc8_.reward.opticalChangeResource;
               _buttons.push(_loc13_);
            }
            _loc21_++;
         }
         if(_elementsAdded > 0)
         {
            _content.background.visible = true;
         }
         updatePositions(moveToInitPosition,false);
         if(Environment.info.isTouchScreen)
         {
            _mouseOver = false;
         }
         _currentDisplayHash = _loc29_;
      }
      
      private function updatePositions(param1:Function, param2:Boolean) : void
      {
         var _loc4_:int = 0;
         if(_elementsAdded <= 0)
         {
            return;
         }
         _elementMaxX = 0;
         _elementMaxY = 0;
         var _loc3_:int = 0;
         _loc4_ = 1;
         while(_loc4_ <= 4)
         {
            if(_content.getChildByName("eventItem" + _loc4_).visible)
            {
               param1(_loc3_,_content.getChildByName("eventItem" + _loc4_),param2);
               _loc3_++;
            }
            _loc4_++;
         }
         _loc4_ = 1;
         while(_loc4_ <= 4)
         {
            if(_content.getChildByName("storyDungeonItem" + _loc4_).visible)
            {
               param1(_loc3_,_content.getChildByName("storyDungeonItem" + _loc4_),param2);
               _loc3_++;
            }
            _loc4_++;
         }
         _loc4_ = 1;
         while(_loc4_ <= 4)
         {
            if(_content.getChildByName("goal" + _loc4_).visible)
            {
               param1(_loc3_,_content.getChildByName("goal" + _loc4_),param2);
               _loc3_++;
            }
            _loc4_++;
         }
         _loc4_ = 1;
         while(_loc4_ <= 4)
         {
            if(_content.getChildByName("item" + _loc4_).visible)
            {
               param1(_loc3_,_content.getChildByName("item" + _loc4_),param2);
               _loc3_++;
            }
            _loc4_++;
         }
         if(_content.dungeonKey.visible)
         {
            param1(_loc3_,_content.dungeonKey,param2);
            _loc3_++;
         }
         _loc4_ = 1;
         while(_loc4_ <= 2)
         {
            if(_content.getChildByName("jeton" + _loc4_).visible)
            {
               param1(_loc3_,_content.getChildByName("jeton" + _loc4_),param2);
               _loc3_++;
            }
            _loc4_++;
         }
         _loc4_ = 1;
         while(_loc4_ <= 4)
         {
            if(_content.getChildByName("opticalChangeResource" + _loc4_).visible)
            {
               param1(_loc3_,_content.getChildByName("opticalChangeResource" + _loc4_),param2);
               _loc3_++;
            }
            _loc4_++;
         }
         if(param1 == moveToOverPosition && param2)
         {
            _content.background.killTweens();
            _content.background.tweenTo(0.5,{
               "x":-10,
               "y":-10,
               "width":(_content.background.width > _elementMaxX + 65?_content.background.width:Number(_elementMaxX + 65)),
               "height":(_content.background.height > _elementMaxY + 65?_content.background.height:Number(_elementMaxY + 65)),
               "ease":Expo.easeOut
            });
            _content.killTweens();
            _content.tweenTo(0.5,{
               "x":_voInitX - _elementMaxX / 2,
               "y":_voInitY - _elementMaxY / 2,
               "ease":Expo.easeOut
            });
         }
         else if(param1 == moveToInitPosition && param2)
         {
            _content.background.killTweens();
            _content.background.tweenTo(0.5,{
               "x":-5,
               "y":-5,
               "width":_elementMaxX + 45,
               "height":_elementMaxY + 45,
               "ease":Expo.easeOut
            });
            _content.killTweens();
            _content.tweenTo(0.5,{
               "x":_voInitX,
               "y":_voInitY,
               "ease":Expo.easeOut
            });
         }
         else if(param1 == moveToInitPosition && !param2)
         {
            _content.background.x = -5;
            _content.background.y = -5;
            _content.background.width = _elementMaxX + 45;
            _content.background.height = _elementMaxY + 45;
            _content.x = _voInitX;
            _content.y = _voInitY;
         }
      }
      
      private function moveToInitPosition(param1:int, param2:IDisplayObject, param3:Boolean = false) : void
      {
         var _loc10_:int = 0;
         var _loc12_:int = 0;
         var _loc7_:int = -6;
         var _loc8_:int = 9;
         var _loc4_:int = 8;
         var _loc9_:int = 9;
         var _loc11_:int = 5;
         var _loc6_:int = 0;
         var _loc5_:int = 0;
         var _loc13_:int = 0;
         if(param1 != 0)
         {
            if(_elementsAdded >= 5)
            {
               _loc13_ = int(param1 / 2) * _loc4_;
               if(param1 % 2 != 0)
               {
                  _loc6_ = _loc7_ + int(param1 / 2) * _loc9_;
                  _loc5_ = _loc8_ + int(param1 / 2) * _loc11_;
               }
               else
               {
                  _loc6_ = _loc10_ + int(param1 / 2) * _loc9_;
                  _loc5_ = _loc12_ + int(param1 / 2) * _loc11_;
               }
            }
            else
            {
               _loc13_ = param1 * _loc4_;
               _loc6_ = _loc10_ + param1 * _loc9_;
               _loc5_ = _loc12_ + param1 * _loc11_;
            }
         }
         if(_loc6_ > _elementMaxX)
         {
            _elementMaxX = _loc6_;
         }
         if(_loc5_ > _elementMaxY)
         {
            _elementMaxY = _loc5_;
         }
         if(param3)
         {
            param2.killTweens();
            param2.tweenTo(0.5,{
               "rotation":_loc13_,
               "x":_loc6_,
               "y":_loc5_,
               "ease":Expo.easeOut
            });
         }
         else
         {
            param2.rotation = _loc13_;
            param2.x = _loc6_;
            param2.y = _loc5_;
         }
      }
      
      private function moveToOverPosition(param1:int, param2:IDisplayObject, param3:Boolean = false) : void
      {
         var _loc7_:int = 0;
         var _loc5_:int = 0;
         var _loc11_:int = 0;
         var _loc4_:int = 38;
         var _loc6_:int = 38;
         var _loc9_:int = 0;
         var _loc8_:int = 0;
         var _loc10_:int = _elementsAdded >= 9?Math.ceil(_elementsAdded / 3):_elementsAdded >= 4?Math.ceil(_elementsAdded / 2):_elementsAdded;
         if(param1 != 0)
         {
            _loc7_ = param1 / _loc10_;
            _loc9_ = _loc5_ + int(param1 % _loc10_) * _loc4_;
            _loc8_ = _loc11_ + _loc7_ * _loc6_;
         }
         if(_loc9_ > _elementMaxX)
         {
            _elementMaxX = _loc9_;
         }
         if(_loc8_ > _elementMaxY)
         {
            _elementMaxY = _loc8_;
         }
         if(param3)
         {
            param2.killTweens();
            param2.tweenTo(0.5,{
               "x":_loc9_,
               "y":_loc8_,
               "rotation":0,
               "ease":Expo.easeOut
            });
         }
         else
         {
            param2.x = _loc9_;
            param2.y = _loc8_;
         }
      }
      
      private function updateQuests() : void
      {
         var _loc3_:int = 0;
         var _loc1_:Character = User.current.character;
         var _loc2_:Vector.<int> = _loc1_.getStageQuestIdsForStage(_stage);
         if(_loc2_)
         {
            _quest.length = 0;
            _loc3_ = 0;
            while(_loc3_ < _loc2_.length)
            {
               _quest.push(_loc1_.quests.getData(_loc2_[_loc3_]));
               _loc3_++;
            }
         }
      }
      
      private function onClickCitymapQuestButton(param1:ICitymapQuestButton) : void
      {
         if(Environment.info.isTouchScreen)
         {
            if(_lastClickTime > 0 && TimeUtil.now - _lastClickTime < 1)
            {
               return;
            }
            _currentQuestButton = param1;
            if(_mouseOver || _elementsAdded <= 1)
            {
               ActionBarLayer.instance.open(_currentQuestButton.displayObject,5,onItemAction,null,-25,-25,param1.tooltip);
            }
            _lastClickTime = TimeUtil.now;
            if(!_mouseOver)
            {
               _mouseOver = true;
               _content.bringToTop();
               updatePositions(moveToOverPosition,true);
            }
            return;
         }
         §§push(_onClickFunction(param1.quest));
      }
      
      private function onItemAction(param1:String) : Boolean
      {
         if(!_currentQuestButton)
         {
            return true;
         }
         if(param1 == "openQuest")
         {
            _onClickFunction(_currentQuestButton.quest);
         }
         return true;
      }
      
      protected function handleInteractionOver(param1:InteractionEvent) : void
      {
         if(Environment.info.isTouchScreen)
         {
            return;
         }
         if(_mouseOver)
         {
            return;
         }
         _mouseOver = true;
         _content.bringToTop();
         updatePositions(moveToOverPosition,true);
         Environment.input.mouse.onMove.add(handleMouseMove);
      }
      
      protected function handleMouseMove(param1:InteractionEvent) : void
      {
         if(Environment.info.isTouchScreen)
         {
            return;
         }
         if(!_mouseOver)
         {
            return;
         }
         if(param1.globalX < _content.x + _content.background.x || param1.globalY < _content.y + _content.background.y || param1.globalX > _content.x + _content.background.x + _content.background.width || param1.globalY > _content.y + _content.background.y + _content.background.height)
         {
            _mouseOver = false;
            _content.parent.setChildIndex(_content,_oldChildIndex);
            updatePositions(moveToInitPosition,true);
         }
      }
      
      private function getItemButton(param1:String) : SymbolMovieItemGeneric
      {
         return _content.getChildByName(param1) as SymbolMovieItemGeneric;
      }
   }
}
