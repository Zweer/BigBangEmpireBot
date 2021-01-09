package com.playata.application.ui.elements.fan_foto
{
   import com.playata.application.platform.ServerInfo;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.display.UriSprite;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.fan_foto.SymbolFanFotoPictureGeneric;
   
   public class UiFanFotoPicturesPicture extends InteractiveDisplayObject
   {
       
      
      private var _content:SymbolFanFotoPictureGeneric = null;
      
      private var _fotoId:int = -1;
      
      private var _onClickFunction:Function;
      
      private var _onSelectMoreFunction:Function;
      
      private var _fotoIdentifier:String;
      
      public function UiFanFotoPicturesPicture(param1:SymbolFanFotoPictureGeneric, param2:Function, param3:Function)
      {
         _content = param1;
         super(_content);
         _onClickFunction = param2;
         _onSelectMoreFunction = param3;
         _content.txtName.text = LocText.current.text("dialog/fan_foto_picture/more_info");
         onClick.add(handleClick);
      }
      
      private function handleClick(param1:InteractionEvent) : void
      {
         if(_fotoId >= 0)
         {
            Environment.audio.playFX("ui_button_click.mp3");
            _onClickFunction(_fotoId,_fotoIdentifier);
         }
         else if(_content.txtName.visible)
         {
            Environment.audio.playFX("ui_button_click.mp3");
            _onSelectMoreFunction();
         }
      }
      
      public function hide() : void
      {
         _fotoId = -1;
         _fotoIdentifier = "";
         _content.visible = false;
      }
      
      public function refreshMore() : void
      {
         _fotoId = -1;
         _fotoIdentifier = "";
         _content.visible = true;
         _content.picture.visible = false;
         _content.txtName.visible = true;
      }
      
      public function refresh(param1:int, param2:String) : void
      {
         if(!_content)
         {
            return;
         }
         if(param1 < 0 || param2 == "")
         {
            _content.visible = false;
            return;
         }
         _fotoId = param1;
         _fotoIdentifier = param2;
         _content.visible = true;
         _content.picture.visible = true;
         _content.txtName.visible = false;
         _content.picture.removeAllChildren();
         _content.picture.addChild(UriSprite.load(ServerInfo.assetURL("fan_foto/" + param2 + "_thumb","jpg"),104,72,true,2));
      }
      
      public function get content() : SymbolFanFotoPictureGeneric
      {
         return _content;
      }
   }
}
