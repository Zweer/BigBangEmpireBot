package com.playata.application.ui.elements.fan_foto
{
   import com.playata.application.data.fan_foto.FanFoto;
   import com.playata.application.data.fan_foto.FanFotoPicture;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.dialogs.DialogFanFotoPicture;
   import com.playata.application.ui.dialogs.DialogFanFotoUnlockFoto;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.framework.application.Environment;
   import com.playata.framework.data.constants.Constants;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.fan_foto.SymbolFanFotoPictureGeneric;
   import visuals.ui.elements.fan_foto.SymbolFanFotoPicturesContentGeneric;
   
   public class UiFanFotoAllPicturesContent
   {
      
      private static const MAX_LINES:int = 12;
      
      private static const SCROLL_VALUE:int = 12;
       
      
      private var _content:SymbolFanFotoPicturesContentGeneric = null;
      
      private var _pictures:Vector.<UiFanFotoPicturesPicture> = null;
      
      private var _btnScrollLeft:UiButton = null;
      
      private var _btnScrollRight:UiButton = null;
      
      private var _currentTag:int = -1;
      
      private var _offset:int = 0;
      
      private var _fanFotoPictures:Vector.<FanFotoPicture> = null;
      
      private var _onCloseFunction:Function;
      
      public function UiFanFotoAllPicturesContent(param1:SymbolFanFotoPicturesContentGeneric, param2:Function)
      {
         var _loc3_:int = 0;
         super();
         _content = param1;
         _onCloseFunction = param2;
         _btnScrollLeft = new UiButton(_content.btnLeft,"",onClickScrollLeft);
         _btnScrollRight = new UiButton(_content.btnRight,"",onClickScrollRight);
         _pictures = new Vector.<UiFanFotoPicturesPicture>();
         _loc3_ = 1;
         while(_loc3_ <= 12)
         {
            _pictures.push(new UiFanFotoPicturesPicture(_content.getChildByName("picture" + _loc3_) as SymbolFanFotoPictureGeneric,onSelectPicture,onSelectMore));
            _loc3_++;
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
      
      private function onSelectMore() : void
      {
         ViewManager.instance.tutorialArrow.hide();
         User.current.character.setTutorialFlag("fan_foto_buy");
         _onCloseFunction();
         Environment.panelManager.showDialog(new DialogFanFotoUnlockFoto());
      }
      
      private function onSelectPicture(param1:int, param2:String = "") : void
      {
         Environment.panelManager.showDialog(new DialogFanFotoPicture(param1,param2,_fanFotoPictures.length > 1?refreshWithPreviousPicture:null,_fanFotoPictures.length > 1?refreshWithNextPicture:null));
      }
      
      private function refreshWithPreviousPicture(param1:DialogFanFotoPicture) : void
      {
         var _loc2_:int = getFanFotoPictureIndex(param1.fotoId);
         _loc2_ = _loc2_ - 1;
         if(_loc2_ < 0)
         {
            _loc2_ = _fanFotoPictures.length - 1;
         }
         param1.refresh(_fanFotoPictures[_loc2_].fotoId,_fanFotoPictures[_loc2_].fotoIdentifier);
      }
      
      private function refreshWithNextPicture(param1:DialogFanFotoPicture) : void
      {
         var _loc2_:int = getFanFotoPictureIndex(param1.fotoId);
         _loc2_ = _loc2_ + 1;
         if(_loc2_ >= _fanFotoPictures.length)
         {
            _loc2_ = 0;
         }
         param1.refresh(_fanFotoPictures[_loc2_].fotoId,_fanFotoPictures[_loc2_].fotoIdentifier);
      }
      
      private function getFanFotoPictureIndex(param1:int) : int
      {
         var _loc2_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < _fanFotoPictures.length)
         {
            if(_fanFotoPictures[_loc2_].fotoId == param1)
            {
               return _loc2_;
            }
            _loc2_++;
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
         if(_offset >= _fanFotoPictures.length - 12)
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
      
      public function refresh(param1:int = -1) : void
      {
         var _loc3_:int = 0;
         if(!_content)
         {
            return;
         }
         if(param1 == -1 && _currentTag == -1)
         {
            return;
         }
         if(param1 >= 0 && param1 == _currentTag)
         {
            return;
         }
         if(param1 >= 0 && param1 != _currentTag)
         {
            _offset = 0;
            _currentTag = param1;
         }
         var _loc2_:FanFoto = User.current.character.fanFoto;
         updatePictures(_loc2_);
         _content.txtPages.text = Math.ceil(_offset / 12) + 1 + "/" + Math.ceil(_fanFotoPictures.length / 12);
         _btnScrollLeft.visible = _fanFotoPictures.length > 12;
         _btnScrollRight.visible = _fanFotoPictures.length > 12;
         _content.txtPages.visible = _fanFotoPictures.length > 12;
         _btnScrollLeft.buttonEnabled = _offset > 0;
         _btnScrollRight.buttonEnabled = _offset < _fanFotoPictures.length - 12;
         var _loc4_:UiFanFotoPicturesPicture = null;
         _loc3_ = 0;
         while(_loc3_ < _pictures.length)
         {
            if(_fanFotoPictures.length >= _offset + _loc3_ + 1)
            {
               _pictures[_loc3_].refresh(_fanFotoPictures[_offset + _loc3_].fotoId,_fanFotoPictures[_offset + _loc3_].fotoIdentifier);
            }
            else if(_fanFotoPictures.length == _offset + _loc3_ && (_currentTag <= 0 || _loc2_.fotoCountByTag[_currentTag] < Constants.current.constant("fan_foto_tag_count")[_currentTag]["count"]))
            {
               _pictures[_loc3_].refreshMore();
               _loc4_ = _pictures[_loc3_];
            }
            else
            {
               _pictures[_loc3_].hide();
            }
            _loc3_++;
         }
         if(User.current.character.hasTutorialFlag("fan_foto_tag2") && !User.current.character.hasTutorialFlag("fan_foto_finished") && !User.current.character.hasTutorialFlag("fan_foto_buy") && _loc4_)
         {
            ViewManager.instance.tutorialArrow.showTutorial(LocText.current.text("tutorial/fan_foto_buy_arrow_text"),"left_side","right",515 + _loc4_.content.x,183 + _loc4_.content.y + _loc4_.content.height / 2,1.5,0,true,"",true);
         }
      }
      
      private function updatePictures(param1:FanFoto) : void
      {
         _fanFotoPictures = new Vector.<FanFotoPicture>(0);
         var _loc2_:Object = param1.unlockedFotosObject;
         var _loc5_:int = 0;
         var _loc4_:* = _loc2_;
         for(var _loc3_ in _loc2_)
         {
            if(_currentTag == 0 || (_loc2_[_loc3_]["tags"] as Array).indexOf(_currentTag) >= 0)
            {
               _fanFotoPictures.push(new FanFotoPicture(parseInt(_loc3_),_loc2_[_loc3_]["identifier"],_loc2_[_loc3_]["tags"]));
            }
         }
      }
   }
}
