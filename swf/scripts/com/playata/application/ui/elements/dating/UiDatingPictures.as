package com.playata.application.ui.elements.dating
{
   import com.playata.application.data.constants.CDating;
   import com.playata.application.data.dating.Dating;
   import com.playata.application.data.dating.DatingStep;
   import com.playata.application.data.dating.DatingUtil;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.panels.PanelQuests;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.display.filter.GrayscaleFilter;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.dating.SymbolDatingPicturesLineGeneric;
   import visuals.ui.elements.dating.SymbolUiDatingPicturesGeneric;
   
   public class UiDatingPictures extends InteractiveDisplayObject
   {
      
      private static const MAX_LINES:int = 7;
      
      private static const SCROLL_VALUE:int = 2;
      
      public static const ALL_GIRLS:int = -1;
      
      public static const TUTORIAL_GIRL:int = 0;
       
      
      private var _content:SymbolUiDatingPicturesGeneric = null;
      
      private var _closeCallback:Function = null;
      
      private var _picturesAll:UiDatingPicturesAllPictureContent = null;
      
      private var _picturesSingle:UiDatingPicturesSinglePictureContent = null;
      
      private var _lines:Vector.<UiDatingPictureLine> = null;
      
      private var _btnScrollUp:UiButton = null;
      
      private var _btnScrollDown:UiButton = null;
      
      private var _currentDatingIndex:int = -2;
      
      private var _offset:int = 0;
      
      private var _possibleDatingIndexes:Vector.<int> = null;
      
      private var _girl:UiDatingGirl = null;
      
      public function UiDatingPictures(param1:SymbolUiDatingPicturesGeneric, param2:Function)
      {
         var _loc6_:int = 0;
         var _loc5_:Boolean = false;
         _content = param1;
         super(_content);
         _closeCallback = param2;
         _picturesAll = new UiDatingPicturesAllPictureContent(_content.picturesAll);
         _picturesSingle = new UiDatingPicturesSinglePictureContent(_content.picturesSingle);
         _lines = new Vector.<UiDatingPictureLine>();
         _loc6_ = 1;
         while(_loc6_ <= 7)
         {
            _lines.push(new UiDatingPictureLine(_content.getChildByName("line" + _loc6_) as SymbolDatingPicturesLineGeneric,_loc6_,onSelectLine,onDoubleClickLine));
            _loc6_++;
         }
         _content.txtDialogTitle.text = LocText.current.text("dialog/dating_pictures/title");
         _btnScrollUp = new UiButton(_content.btnUp,"",onClickScrollUp);
         _btnScrollDown = new UiButton(_content.btnDown,"",onClickScrollDown);
         onMouseWheel.add(handleMouseWheel);
         _girl = new UiDatingGirl(_content.girl);
         _possibleDatingIndexes = new Vector.<int>(0);
         _possibleDatingIndexes.push(-1);
         _possibleDatingIndexes.push(0);
         var _loc3_:Vector.<int> = new Vector.<int>(0);
         var _loc8_:int = 0;
         var _loc7_:* = CDating.ids;
         for each(var _loc4_ in CDating.ids)
         {
            _loc5_ = User.current.character.dating.getUnlockedPicturesByDatingIndex(_loc4_) > 0 || User.current.character.dating.hasActiveDatingStep(_loc4_) || User.current.character.dating.isDatingAvailable(User.current.character,_loc4_);
            if(_loc5_)
            {
               _possibleDatingIndexes.push(_loc4_);
            }
            else
            {
               _loc3_.push(_loc4_);
            }
         }
         _possibleDatingIndexes = _possibleDatingIndexes.concat(_loc3_);
      }
      
      override public function dispose() : void
      {
         var _loc1_:int = 0;
         if(_btnScrollUp == null)
         {
            return;
         }
         _btnScrollUp.dispose();
         _btnScrollUp = null;
         _btnScrollDown.dispose();
         _btnScrollDown = null;
         _loc1_ = 0;
         while(_loc1_ < _lines.length)
         {
            _lines[_loc1_].dispose();
            _loc1_++;
         }
         _lines.length = 0;
         _lines = null;
         _picturesAll.dispose();
         _picturesAll = null;
         _picturesSingle.dispose();
         _picturesSingle = null;
         _girl.dispose();
         _girl = null;
         super.dispose();
      }
      
      private function onDoubleClickLine(param1:UiDatingPictureLine) : void
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         if(param1 && param1.datingIndex >= 0)
         {
            _loc3_ = User.current.character.dating.getActiveDatingStepByDating(param1.datingIndex);
            if(_loc3_ || User.current.character.dating.isDatingAvailable(User.current.character,param1.datingIndex))
            {
               _loc2_ = DatingUtil.getDatingTemplate(param1.datingIndex);
               if(User.current.character.currentQuestStage != _loc2_.stage)
               {
                  Environment.application.sendActionRequest("setCharacterStage",{
                     "stage":_loc2_.stage,
                     "on_map":false
                  },handleRequests);
               }
               else
               {
                  (ViewManager.instance.activePanelInstance as PanelQuests).showDatingQuest();
                  _closeCallback();
               }
            }
         }
      }
      
      private function onSelectLine(param1:UiDatingPictureLine) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(param1 && param1.datingIndex >= -1)
         {
            _currentDatingIndex = param1.datingIndex;
         }
         _loc2_ = 0;
         while(_loc2_ < _lines.length)
         {
            _lines[_loc2_].highlight(_currentDatingIndex == _lines[_loc2_].datingIndex);
            _loc2_++;
         }
         if(_currentDatingIndex < -1)
         {
            return;
         }
         if(_currentDatingIndex == -1)
         {
            _picturesAll.refresh();
            _content.picturesAll.visible = true;
            _content.picturesSingle.visible = false;
         }
         else
         {
            _picturesSingle.refresh(_currentDatingIndex);
            _content.picturesAll.visible = false;
            _content.picturesSingle.visible = true;
         }
         if(_currentDatingIndex >= 0)
         {
            _girl.content.visible = true;
            if(_currentDatingIndex == 0)
            {
               _girl.refreshTutorialGirl();
               _content.girl.removeAllFilters();
            }
            else
            {
               _loc3_ = User.current.character.dating;
               _loc4_ = _loc3_.getActiveDatingStepByDating(_currentDatingIndex);
               if(_loc4_)
               {
                  _girl.refresh(_loc4_.datingIndex,_loc4_.stepIndex);
               }
               else if(_loc3_.getNewDatingStepIndex(User.current.character,_currentDatingIndex) > 0)
               {
                  _girl.refresh(_currentDatingIndex,_loc3_.getNewDatingStepIndex(User.current.character,_currentDatingIndex));
               }
               else if(param1.available)
               {
                  _girl.refresh(_currentDatingIndex,7);
               }
               else
               {
                  _girl.refresh(_currentDatingIndex,1);
               }
               if(param1.available)
               {
                  _content.girl.removeAllFilters();
               }
               else
               {
                  _content.girl.addFilter(new GrayscaleFilter());
               }
            }
         }
         else
         {
            _girl.content.visible = false;
         }
      }
      
      private function handleMouseWheel(param1:InteractionEvent) : void
      {
         if(param1.mouseWheelDelta > 0)
         {
            scrollUp(1,true);
         }
         else
         {
            scrollDown(1,true);
         }
      }
      
      private function onClickScrollUp(param1:InteractionEvent) : void
      {
         scrollUp(2,false);
      }
      
      private function onClickScrollDown(param1:InteractionEvent) : void
      {
         scrollDown(2,false);
      }
      
      private function scrollUp(param1:int, param2:Boolean) : void
      {
         if(!_btnScrollUp.visible)
         {
            return;
         }
         if(_offset == 0)
         {
            return;
         }
         _offset = _offset - param1;
         if(_offset < 0)
         {
            _offset = 0;
            param2 = false;
         }
         if(param2)
         {
            Environment.audio.playFX("ui_button_click.mp3");
         }
         refreshList();
      }
      
      private function scrollDown(param1:int, param2:Boolean) : void
      {
         if(!_btnScrollDown.visible)
         {
            return;
         }
         if(_offset == _possibleDatingIndexes.length - 7)
         {
            return;
         }
         _offset = _offset + param1;
         if(_offset > _possibleDatingIndexes.length - 7)
         {
            _offset = _possibleDatingIndexes.length - 7;
            param2 = false;
         }
         if(param2)
         {
            Environment.audio.playFX("ui_button_click.mp3");
         }
         refreshList();
      }
      
      public function refreshList(param1:Boolean = false) : void
      {
         var _loc2_:int = 0;
         if(!_btnScrollDown)
         {
            return;
         }
         _btnScrollUp.visible = _possibleDatingIndexes.length > 7;
         _btnScrollDown.visible = _possibleDatingIndexes.length > 7;
         _btnScrollUp.buttonEnabled = _offset > 0;
         _btnScrollDown.buttonEnabled = _offset < _possibleDatingIndexes.length - 7;
         _loc2_ = 0;
         while(_loc2_ < _lines.length)
         {
            _lines[_loc2_].refresh(_possibleDatingIndexes.length >= _offset + _loc2_ + 1?_possibleDatingIndexes[_offset + _loc2_]:-1,_loc2_ + 1);
            _loc2_++;
         }
         if(_currentDatingIndex >= -1)
         {
            _loc2_ = 0;
            while(_loc2_ < _lines.length)
            {
               if(_lines[_loc2_].datingIndex >= -1 && _lines[_loc2_].datingIndex == _currentDatingIndex)
               {
                  onSelectLine(_lines[_loc2_]);
                  break;
               }
               _loc2_++;
            }
         }
         else if(_lines[0].datingIndex >= -1 && param1)
         {
            onSelectLine(_lines[0]);
         }
         if(_currentDatingIndex < -1)
         {
            return;
         }
         if(_currentDatingIndex == -1)
         {
            _picturesAll.refresh();
            _content.picturesAll.visible = true;
            _content.picturesSingle.visible = false;
         }
         else
         {
            _picturesSingle.refresh(_currentDatingIndex);
            _content.picturesAll.visible = false;
            _content.picturesSingle.visible = true;
         }
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("setCharacterStage" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            ViewManager.instance.showPanel("quests");
            (ViewManager.instance.activePanelInstance as PanelQuests).showDatingQuest();
            _closeCallback();
         }
         else if(param1.error != "errSetCharacterStageInvalidQuestStage")
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
   }
}
