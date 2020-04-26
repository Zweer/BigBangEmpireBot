package com.playata.application.ui.elements.dating
{
   import com.playata.application.data.character.Character;
   import com.playata.application.data.dating.Dating;
   import com.playata.application.data.dating.DatingPicture;
   import com.playata.application.data.dating.DatingUtil;
   import com.playata.application.data.goal.Goals;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.dialogs.DialogDatingPicture;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.framework.application.Environment;
   import com.playata.framework.input.InteractionEvent;
   import visuals.ui.elements.dating.SymbolDatingPictureGeneric;
   import visuals.ui.elements.dating.SymbolDatingPicturesAllPictureContentGeneric;
   
   public class UiDatingPicturesAllPictureContent
   {
      
      private static const MAX_LINES:int = 12;
      
      private static const SCROLL_VALUE:int = 12;
       
      
      private var _content:SymbolDatingPicturesAllPictureContentGeneric = null;
      
      private var _pictures:Vector.<UiDatingPicturesPicture> = null;
      
      private var _btnScrollLeft:UiButton = null;
      
      private var _btnScrollRight:UiButton = null;
      
      private var _offset:int = 0;
      
      private var _datingPictures:Vector.<DatingPicture> = null;
      
      public function UiDatingPicturesAllPictureContent(param1:SymbolDatingPicturesAllPictureContentGeneric)
      {
         var _loc2_:int = 0;
         super();
         _content = param1;
         _btnScrollLeft = new UiButton(_content.btnLeft,"",onClickScrollLeft);
         _btnScrollRight = new UiButton(_content.btnRight,"",onClickScrollRight);
         _pictures = new Vector.<UiDatingPicturesPicture>();
         _loc2_ = 1;
         while(_loc2_ <= 12)
         {
            _pictures.push(new UiDatingPicturesPicture(_content.getChildByName("picture" + _loc2_) as SymbolDatingPictureGeneric,onSelectPicture));
            _loc2_++;
         }
         _btnScrollLeft.visible = false;
         _btnScrollRight.visible = false;
      }
      
      public function dispose() : void
      {
         _btnScrollLeft.dispose();
         _btnScrollLeft = null;
         _btnScrollRight.dispose();
         _btnScrollRight = null;
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
         param1.refresh(_datingPictures[_loc2_].datingIndex,_datingPictures[_loc2_].datingStep,_datingPictures[_loc2_].isAllowed);
      }
      
      private function refreshWithNextPicture(param1:DialogDatingPicture) : void
      {
         var _loc2_:int = getDatingPictureIndex(param1.datingIndex,param1.stepIndex);
         _loc2_ = _loc2_ + 1;
         if(_loc2_ >= _datingPictures.length)
         {
            _loc2_ = 0;
         }
         param1.refresh(_datingPictures[_loc2_].datingIndex,_datingPictures[_loc2_].datingStep,_datingPictures[_loc2_].isAllowed);
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
      
      private function onClickScrollRight(param1:InteractionEvent) : void
      {
         scrollRight(12,false);
      }
      
      private function onClickScrollLeft(param1:InteractionEvent) : void
      {
         scrollLeft(12,false);
      }
      
      private function scrollLeft(param1:int, param2:Boolean) : void
      {
         if(!_btnScrollLeft.visible)
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
         refresh();
      }
      
      private function scrollRight(param1:int, param2:Boolean) : void
      {
         if(!_btnScrollRight.visible)
         {
            return;
         }
         if(_offset >= _datingPictures.length - 12)
         {
            return;
         }
         _offset = _offset + param1;
         if(param2)
         {
            Environment.audio.playFX("ui_button_click.mp3");
         }
         refresh();
      }
      
      public function refresh() : void
      {
         var _loc1_:int = 0;
         if(!_content)
         {
            return;
         }
         var _loc2_:Dating = User.current.character.dating;
         updateDatingPictures(_loc2_);
         _content.txtPages.text = Math.ceil(_offset / 12) + 1 + "/" + Math.ceil(_datingPictures.length / 12);
         _btnScrollLeft.visible = _datingPictures.length > 12;
         _btnScrollRight.visible = _datingPictures.length > 12;
         _content.txtPages.visible = _datingPictures.length > 12;
         _btnScrollLeft.buttonEnabled = _offset > 0;
         _btnScrollRight.buttonEnabled = _offset < _datingPictures.length - 12;
         _loc1_ = 0;
         while(_loc1_ < _pictures.length)
         {
            if(_datingPictures.length >= _offset + _loc1_ + 1)
            {
               _pictures[_loc1_].refresh(_datingPictures[_offset + _loc1_].datingIndex,_datingPictures[_offset + _loc1_].datingStep,_datingPictures[_offset + _loc1_].isAllowed);
            }
            else
            {
               _pictures[_loc1_].refresh(-1,-1,false);
            }
            _loc1_++;
         }
      }
      
      private function updateDatingPictures(param1:Dating) : void
      {
         _datingPictures = new Vector.<DatingPicture>(0);
         var _loc2_:Character = User.current.character;
         if(_loc2_.hasTutorialFlag("tutorial_finished"))
         {
            _datingPictures.push(new DatingPicture(0,1,true));
         }
         if(Goals.instance.goal("second_quests_completed").isFinished(_loc2_))
         {
            _datingPictures.push(new DatingPicture(0,2,true));
         }
         var _loc3_:Object = param1.unlockedPictures;
         var _loc9_:int = 0;
         var _loc8_:* = _loc3_;
         for(var _loc5_ in _loc3_)
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
         }
      }
   }
}
