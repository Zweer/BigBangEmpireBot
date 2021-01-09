package com.playata.application.ui.elements.dating
{
   import com.playata.application.data.character.Character;
   import com.playata.application.data.dating.Dating;
   import com.playata.application.data.dating.DatingPicture;
   import com.playata.application.data.dating.DatingUtil;
   import com.playata.application.data.goal.Goals;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.dialogs.DialogDatingPicture;
   import com.playata.framework.application.Environment;
   import visuals.ui.elements.dating.SymbolDatingPictureBigGeneric;
   import visuals.ui.elements.dating.SymbolDatingPicturesSinglePictureContentGeneric;
   
   public class UiDatingPicturesSinglePictureContent
   {
       
      
      private var _content:SymbolDatingPicturesSinglePictureContentGeneric = null;
      
      private var _pictures:Vector.<UiDatingPicturesPictureBig> = null;
      
      private var _currentDatingIndex:int = -2;
      
      private var _datingPictures:Vector.<DatingPicture> = null;
      
      public function UiDatingPicturesSinglePictureContent(param1:SymbolDatingPicturesSinglePictureContentGeneric)
      {
         var _loc2_:int = 0;
         super();
         _content = param1;
         _pictures = new Vector.<UiDatingPicturesPictureBig>();
         _loc2_ = 1;
         while(_loc2_ <= 5)
         {
            _pictures.push(new UiDatingPicturesPictureBig(_content.getChildByName("picture" + _loc2_) as SymbolDatingPictureBigGeneric,onSelectPicture));
            _loc2_++;
         }
      }
      
      public function dispose() : void
      {
         _content = null;
      }
      
      private function onSelectPicture(param1:int, param2:int) : void
      {
         if(DatingUtil.hasRewardImage(param1,param2))
         {
            Environment.panelManager.showDialog(new DialogDatingPicture(param1,param2,_datingPictures.length > 1?refreshWithPreviousPicture:null,_datingPictures.length > 1?refreshWithNextPicture:null,refresh));
         }
      }
      
      private function refreshWithPreviousPicture(param1:DialogDatingPicture) : void
      {
         var _loc2_:int = getDatingPictureIndex(param1.datingIndex,param1.stepIndex);
         _loc2_ = _loc2_ - 1;
         if(_loc2_ < 0)
         {
            _loc2_ = _datingPictures.length - 1;
         }
         param1.refresh(_datingPictures[_loc2_].datingIndex,_datingPictures[_loc2_].datingStep);
      }
      
      private function refreshWithNextPicture(param1:DialogDatingPicture) : void
      {
         var _loc2_:int = getDatingPictureIndex(param1.datingIndex,param1.stepIndex);
         _loc2_ = _loc2_ + 1;
         if(_loc2_ >= _datingPictures.length)
         {
            _loc2_ = 0;
         }
         param1.refresh(_datingPictures[_loc2_].datingIndex,_datingPictures[_loc2_].datingStep);
      }
      
      private function getDatingPictureIndex(param1:int, param2:int) : int
      {
         var _loc3_:int = 0;
         _loc3_ = 0;
         while(_loc3_ < _datingPictures.length)
         {
            if(_datingPictures[_loc3_].datingIndex == param1 && _datingPictures[_loc3_].datingStep == param2)
            {
               return _loc3_;
            }
            _loc3_++;
         }
         return 0;
      }
      
      public function refresh(param1:int = -1) : void
      {
         var _loc4_:int = 0;
         if(!_content)
         {
            return;
         }
         if(param1 < -1 && _currentDatingIndex < -1)
         {
            return;
         }
         if(param1 >= 0 && param1 == _currentDatingIndex)
         {
            return;
         }
         if(param1 >= 0 && param1 != _currentDatingIndex)
         {
            _currentDatingIndex = param1;
         }
         var _loc2_:Character = User.current.character;
         var _loc5_:Dating = _loc2_.dating;
         var _loc3_:Boolean = _currentDatingIndex == -1 || _currentDatingIndex == 0 || _loc5_.getUnlockedPicturesByDatingIndex(_currentDatingIndex) > 0 || _loc5_.hasActiveDatingStep(_currentDatingIndex) || _loc5_.isDatingAvailable(_loc2_,param1);
         if(_loc3_)
         {
            updateDatingPictures(_loc5_);
            _loc4_ = 0;
            while(_loc4_ < _pictures.length)
            {
               _pictures[_loc4_].show();
               if(_datingPictures.length >= _loc4_ + 1)
               {
                  _pictures[_loc4_].refresh(_datingPictures[_loc4_].datingIndex,_datingPictures[_loc4_].datingStep,_datingPictures[_loc4_].isAllowed);
               }
               else
               {
                  _pictures[_loc4_].refreshLocked(_currentDatingIndex,_loc4_ + 1);
               }
               _loc4_++;
            }
            _content.textLockInfo.visible = false;
         }
         else
         {
            _loc4_ = 0;
            while(_loc4_ < _pictures.length)
            {
               _pictures[_loc4_].hide();
               _loc4_++;
            }
            _content.textLockInfo.visible = true;
            _content.textLockInfo.text = DatingUtil.getUnlockText(_currentDatingIndex);
         }
      }
      
      private function updateDatingPictures(param1:Dating) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         _datingPictures = new Vector.<DatingPicture>(0);
         if(_currentDatingIndex == 0)
         {
            _loc2_ = User.current.character;
            if(_loc2_.hasTutorialFlag("tutorial_finished"))
            {
               _datingPictures.push(new DatingPicture(0,1,true));
            }
            if(Goals.instance.goal("second_quests_completed").isFinished(_loc2_))
            {
               _datingPictures.push(new DatingPicture(0,2,true));
            }
         }
         else
         {
            _loc3_ = param1.unlockedPictures;
            var _loc9_:int = 0;
            var _loc8_:* = _loc3_;
            for(var _loc5_ in _loc3_)
            {
               if(_currentDatingIndex == -1 || parseInt(_loc5_) == _currentDatingIndex)
               {
                  var _loc7_:int = 0;
                  var _loc6_:* = _loc3_[_loc5_];
                  for(var _loc4_ in _loc3_[_loc5_])
                  {
                     if(DatingUtil.hasRewardImage(parseInt(_loc5_),parseInt(_loc4_)))
                     {
                        _datingPictures.push(new DatingPicture(parseInt(_loc5_),parseInt(_loc4_),param1.isPictureAllowed(parseInt(_loc5_),parseInt(_loc4_))));
                     }
                  }
                  continue;
               }
            }
         }
      }
   }
}
