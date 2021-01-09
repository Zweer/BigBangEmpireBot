package com.playata.application.ui.dialogs
{
   import com.playata.application.platform.ServerInfo;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.framework.input.InteractionEvent;
   import visuals.ui.dialogs.SymbolDialogDatingPictureGeneric;
   
   public class DialogFanFotoPicture extends UiDialog
   {
       
      
      private var _btnClose:UiButton = null;
      
      private var _btnLeft:UiButton;
      
      private var _btnRight:UiButton;
      
      private var _fotoId:int;
      
      private var _getPreviousPicture:Function;
      
      private var _getNextPicture:Function;
      
      public function DialogFanFotoPicture(param1:int, param2:String, param3:Function = null, param4:Function = null)
      {
         var _loc5_:SymbolDialogDatingPictureGeneric = new SymbolDialogDatingPictureGeneric();
         super(_loc5_,false);
         _getPreviousPicture = param3;
         _getNextPicture = param4;
         _btnClose = new UiButton(_loc5_.btnClose,"",onClickClose);
         _btnLeft = new UiButton(_loc5_.btnLeft,"",onClickLeft);
         _btnRight = new UiButton(_loc5_.btnRight,"",onClickRight);
         _loc5_.btnHideMessage.visible = false;
         _loc5_.btnShowMessage.visible = false;
         _loc5_.btnUpgrade.visible = false;
         _loc5_.message.visible = false;
         _loc5_.upgradeBackground.visible = false;
         _loc5_.txtUpgrade.visible = false;
         refresh(param1,param2);
      }
      
      public function refresh(param1:int = -1, param2:String = "") : void
      {
         if(param1 >= 0)
         {
            _fotoId = param1;
         }
         var _loc3_:SymbolDialogDatingPictureGeneric = _vo as SymbolDialogDatingPictureGeneric;
         _loc3_.girl.setUriSprite(ServerInfo.assetURL("fan_foto/" + param2,"jpg"),900,630,false,1,null,true);
         _btnClose.visible = true;
         _btnLeft.visible = _getPreviousPicture != null && _getNextPicture != null;
         _btnRight.visible = _getPreviousPicture != null && _getNextPicture != null;
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function onClickLeft(param1:InteractionEvent) : void
      {
         if(_getPreviousPicture != null)
         {
            _getPreviousPicture(this);
         }
      }
      
      private function onClickRight(param1:InteractionEvent) : void
      {
         if(_getNextPicture != null)
         {
            _getNextPicture(this);
         }
      }
      
      override public function dispose() : void
      {
         if(_btnClose == null)
         {
            return;
         }
         _btnClose.dispose();
         _btnClose = null;
         _btnLeft.dispose();
         _btnLeft = null;
         _btnRight.dispose();
         _btnRight = null;
         super.dispose();
      }
      
      public function get fotoId() : int
      {
         return _fotoId;
      }
   }
}
