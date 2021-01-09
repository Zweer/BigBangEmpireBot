package com.playata.application.ui.elements.fan_foto
{
   import com.playata.application.data.fan_foto.FanFoto;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.framework.application.Environment;
   import com.playata.framework.data.constants.Constants;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.fan_foto.SymbolFanFotoPicturesLineGeneric;
   
   public class UiFanFotoPictureLine extends InteractiveDisplayObject
   {
       
      
      private var _content:SymbolFanFotoPicturesLineGeneric = null;
      
      private var _index:int = 0;
      
      private var _tag:int = -1;
      
      private var _onClickFunction:Function = null;
      
      private var _btnTagActive:UiButton;
      
      private var _btnTagInactive:UiButton;
      
      private var _onRemoveTagFunction:Function;
      
      private var _onSetTagFunction:Function;
      
      public function UiFanFotoPictureLine(param1:SymbolFanFotoPicturesLineGeneric, param2:int, param3:Function, param4:Function, param5:Function)
      {
         _content = param1;
         super(_content);
         _index = param2;
         _onClickFunction = param3;
         _onRemoveTagFunction = param4;
         _onSetTagFunction = param5;
         _content.backgroundHighlight.visible = false;
         onClick.add(handleClick);
         _btnTagActive = new UiButton(_content.iconTag,LocText.current.text("fan_foto/pictures/line/tootlip_remove_tag"),onRemoveTag);
         _btnTagInactive = new UiButton(_content.iconTagInactive,LocText.current.text("fan_foto/pictures/line/tootlip_set_tag"),onSetTag);
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function get tag() : int
      {
         return _tag;
      }
      
      override public function dispose() : void
      {
         _tag = -1;
         _btnTagActive.dispose();
         _btnTagActive = null;
         _btnTagInactive.dispose();
         _btnTagInactive = null;
         super.dispose();
      }
      
      private function onRemoveTag(param1:InteractionEvent) : void
      {
      }
      
      private function onSetTag(param1:InteractionEvent) : void
      {
      }
      
      private function handleClick(param1:InteractionEvent) : void
      {
         Environment.audio.playFX("ui_button_click.mp3");
      }
      
      public function highlight(param1:Boolean) : void
      {
         if(!_content.txtName.visible)
         {
            return;
         }
         _content.backgroundHighlight.visible = param1;
         _content.backgroundEven.visible = !param1 && _index % 2 == 0;
         _content.backgroundOdd.visible = !param1 && _index % 2 != 0;
      }
      
      public function refresh(param1:int, param2:int) : void
      {
         _index = param2;
         _tag = param1;
         if(_tag == -1)
         {
            _content.visible = false;
            return;
         }
         var _loc3_:FanFoto = User.current.character.fanFoto;
         _content.visible = true;
         _content.backgroundEven.visible = _index % 2 == 0;
         _content.backgroundOdd.visible = _index % 2 != 0;
         _content.backgroundHighlight.visible = false;
         if(_tag > 0)
         {
            _content.iconCheckmark.visible = _loc3_.fotoCountByTag[_tag] >= Constants.current.constant("fan_foto_tag_count")[_tag]["count"];
         }
         else if(_tag == 0)
         {
            _content.iconCheckmark.visible = _loc3_.fotosAvailable;
         }
         if(_content.iconCheckmark.visible)
         {
            _content.txtName.width = 122;
         }
         else
         {
            _content.txtName.width = 150;
         }
         _content.iconAllTags.visible = false;
         _content.iconTag.visible = false;
         _content.iconTagInactive.visible = false;
         if(_tag == 0)
         {
            _content.iconAllTags.visible = true;
            _content.txtName.text = LocText.current.text("fan_foto/pictures/line/all/name");
         }
         else
         {
            if(_loc3_.tags.indexOf(_tag) >= 0)
            {
               _content.iconTag.visible = true;
            }
            else
            {
               _content.iconTagInactive.visible = true;
            }
            _content.txtName.text = LocText.current.text("fan_foto/tag/" + _tag + "/name");
         }
         _content.txtName.autoFontSize = true;
         if(_content.txtName.numLines > 1)
         {
            _content.txtName.y = 4;
         }
         else
         {
            _content.txtName.y = 13;
         }
      }
   }
}
