package com.playata.application.ui.elements.fan_foto
{
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.fan_foto.FanFoto;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.dialogs.DialogFanFotoRemoveTag;
   import com.playata.application.ui.dialogs.DialogFanFotoSetTag;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.ui.elements.generic.dialog.UiTwoChoiceDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.data.constants.Constants;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.display.layout.LayoutUtil;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.fan_foto.SymbolFanFotoPicturesLineGeneric;
   import visuals.ui.elements.fan_foto.SymbolUiFanFotoPicturesGeneric;
   
   public class UiFanFotoPictures extends InteractiveDisplayObject
   {
      
      private static const MAX_LINES:int = 7;
      
      private static const SCROLL_VALUE:int = 2;
       
      
      private var _content:SymbolUiFanFotoPicturesGeneric = null;
      
      private var _closeCallback:Function = null;
      
      private var _pictures:UiFanFotoAllPicturesContent = null;
      
      private var _lines:Vector.<UiFanFotoPictureLine> = null;
      
      private var _btnScrollUp:UiButton = null;
      
      private var _btnScrollDown:UiButton = null;
      
      private var _currentTag:int = -1;
      
      private var _offset:int = 0;
      
      private var _possibleTags:Vector.<int>;
      
      private var _tag:int;
      
      public function UiFanFotoPictures(param1:SymbolUiFanFotoPicturesGeneric, param2:Function)
      {
         var _loc3_:int = 0;
         _content = param1;
         super(_content);
         _closeCallback = param2;
         _pictures = new UiFanFotoAllPicturesContent(_content.pictures,_closeCallback);
         _lines = new Vector.<UiFanFotoPictureLine>();
         _loc3_ = 1;
         while(_loc3_ <= 7)
         {
            _lines.push(new UiFanFotoPictureLine(_content.getChildByName("line" + _loc3_) as SymbolFanFotoPicturesLineGeneric,_loc3_,onSelectLine,onRemoveTagFunction,onSetTagFunction));
            _loc3_++;
         }
         _content.txtTitle.text = LocText.current.text("dialog/fan_foto_pictures/title");
         _btnScrollUp = new UiButton(_content.btnUp,"",onClickScrollUp);
         _btnScrollDown = new UiButton(_content.btnDown,"",onClickScrollDown);
         onMouseWheel.add(handleMouseWheel);
         _possibleTags = new Vector.<int>(0);
         var _loc4_:Object = Constants.current.constant("fan_foto_tag_count");
         var _loc7_:int = 0;
         var _loc6_:* = _loc4_;
         for(var _loc5_ in _loc4_)
         {
            if(parseInt(_loc5_) != 0 && _loc4_[_loc5_]["count"] >= 4)
            {
               _possibleTags.push(parseInt(_loc5_));
            }
         }
         _possibleTags.sort(sortByName);
         _possibleTags.unshift(0);
      }
      
      private function sortByName(param1:int, param2:int) : int
      {
         var _loc4_:String = LocText.current.text("fan_foto/tag/" + param1 + "/name");
         var _loc3_:String = LocText.current.text("fan_foto/tag/" + param2 + "/name");
         if(_loc4_ < _loc3_)
         {
            return -1;
         }
         if(_loc4_ > _loc3_)
         {
            return 1;
         }
         return 0;
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
         _pictures.dispose();
         _pictures = null;
         _content = null;
      }
      
      private function onRemoveTagFunction(param1:int) : void
      {
         Environment.panelManager.showDialog(new DialogFanFotoRemoveTag(param1,refreshList));
      }
      
      private function onSetTagFunction(param1:int) : void
      {
         var _loc2_:FanFoto = User.current.character.fanFoto;
         _tag = param1;
         ViewManager.instance.tutorialArrow.hide();
         if(_loc2_.tags.length >= CConstant.fan_foto_max_tags)
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/fan_foto_set_tag/max_tags_reached/title"),LocText.current.text("dialog/fan_foto_set_tag/max_tags_reached/text"),LocText.current.text("general/button_ok")));
         }
         else if(_loc2_.fotoCountByTag[_tag] >= Constants.current.constant("fan_foto_tag_count")[_tag]["count"])
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/fan_foto_set_tag/error_no_new_fotos_available/title"),LocText.current.text("dialog/fan_foto_set_tag/error_no_new_fotos_available/text",LocText.current.text("fan_foto/tag/" + _tag + "/name")),LocText.current.text("general/button_ok")));
         }
         else if(_loc2_.tags.length >= _loc2_.maxSelectableTags)
         {
            Environment.panelManager.showDialog(new DialogFanFotoSetTag(param1,refreshList));
         }
         else
         {
            Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("dialog/fan_foto_set_tag/title"),LocText.current.text("dialog/fan_foto_set_tag/text",LocText.current.text("fan_foto/tag/" + _tag + "/name")),LocText.current.text("general/button_yes"),LocText.current.text("general/button_no"),onSetTag));
         }
      }
      
      private function onSetTag() : void
      {
         Environment.application.sendActionRequest("setFanFotoTag",{"tag":_tag},handleRequests);
      }
      
      private function onSelectLine(param1:UiFanFotoPictureLine) : void
      {
         var _loc2_:int = 0;
         if(param1 && param1.tag >= 0)
         {
            _currentTag = param1.tag;
         }
         _loc2_ = 0;
         while(_loc2_ < _lines.length)
         {
            _lines[_loc2_].highlight(_currentTag == _lines[_loc2_].tag);
            _loc2_++;
         }
         if(_currentTag < 0)
         {
            return;
         }
         _pictures.refresh(_currentTag);
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
         if(_offset == _possibleTags.length - 7)
         {
            return;
         }
         _offset = _offset + param1;
         if(_offset > _possibleTags.length - 7)
         {
            _offset = _possibleTags.length - 7;
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
         _btnScrollUp.visible = _possibleTags.length > 7;
         _btnScrollDown.visible = _possibleTags.length > 7;
         _btnScrollUp.buttonEnabled = _offset > 0;
         _btnScrollDown.buttonEnabled = _offset < _possibleTags.length - 7;
         _loc2_ = 0;
         while(_loc2_ < _lines.length)
         {
            _lines[_loc2_].refresh(_possibleTags.length >= _offset + _loc2_ + 1?_possibleTags[_offset + _loc2_]:-1,_loc2_ + 1);
            _loc2_++;
         }
         if(_currentTag >= 0)
         {
            _loc2_ = 0;
            while(_loc2_ < _lines.length)
            {
               if(_lines[_loc2_].tag >= 0 && _lines[_loc2_].tag == _currentTag)
               {
                  onSelectLine(_lines[_loc2_]);
                  break;
               }
               _loc2_++;
            }
         }
         else if(_lines[0].tag >= 0 && param1)
         {
            onSelectLine(_lines[0]);
         }
         if(!User.current.character.hasTutorialFlag("fan_foto_tag2"))
         {
            ViewManager.instance.tutorialArrow.showTutorial(LocText.current.text("tutorial/fan_foto_set_tag_arrow_text"),"right_side","down",350 + LayoutUtil.deviceAdjustedWidthCorrection / 2,166,1.5,0,true,"",true);
         }
         if(_currentTag < 0)
         {
            return;
         }
         _pictures.refresh(_currentTag);
      }
      
      override public function set visible(param1:Boolean) : void
      {
         _content.visible = param1;
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("setFanFotoTag" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            refreshList();
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
   }
}
